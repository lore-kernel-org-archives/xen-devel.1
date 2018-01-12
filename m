From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC v1 42/74] sched/null: skip vCPUs on the
 waitqueue that are blocked
Date: Fri, 12 Jan 2018 11:41:56 +0100
Message-ID: <1515753716.30117.123.camel@suse.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-43-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6186931763917580132=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=to5s=eh=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eZwmx-0002Tk-AT
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 10:42:19 +0000
In-Reply-To: <20180104130625.28605-43-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <dunlapg@gmail.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.paumonne@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6186931763917580132==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NQlHW+TKkTnJ+TybyTjz"


--=-NQlHW+TKkTnJ+TybyTjz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-04 at 13:05 +0000, Wei Liu wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
>=20
> Avoid scheduling vCPUs that are blocked, there's no point in
> assigning
> them to a pCPU because they are not going to run anyway.
>=20
> Since blocked vCPUs are not assigned to pCPUs after this change,
> force
> a rescheduling when a vCPU is brought up if it's on the waitqueue.
> Also when scheduling try to pick a vCPU from the runqueue if the pCPU
> is running idle.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: George Dunlap <george.dunlap@eu.citrix.com>
> Cc: Dario Faggioli <raistlin@linux.it>
> ---
> Changes since v1:
>  - Force a rescheduling when a vCPU is brought up.
>  - Try to pick a vCPU from the runqueue if running the idle vCPU.
>
As noted by Jan already, there's a mixing of "blocked" and "down" (or
offline).

In the null scheduler, a vCPU that is assigned to a pCPU, is free to
block and wake-up as many time as it wants (quite obviously). And when
it blocks, the pCPU will just stay idle.

There's no such thing of pulling on the CPU another vCPU, either from
the waitqueue or from anywhere else. That's the whole point of the
scheduler, actually.

Now, I'm not quite sure whether or not this can be a problem in the
"shim scenario". If it is, we have to think of a solution that does not
totally defeat the purpose of the scheduler when used baremetal.

Or use another scheduler, perhaps configuring static 1:1 pinning. Null
seems a great fit for this use case to me, so, I'd say, let's try to
find a nice and cool way to use it. :-)

> ---
>  xen/common/sched_null.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/common/sched_null.c b/xen/common/sched_null.c
> index b4a24baf8e..bacfb31cb3 100644
> --- a/xen/common/sched_null.c
> +++ b/xen/common/sched_null.c
> @@ -574,6 +574,8 @@ static void null_vcpu_wake(const struct scheduler
> *ops, struct vcpu *v)
>      {
>          /* Not exactly "on runq", but close enough for reusing the
> counter */
>          SCHED_STAT_CRANK(vcpu_wake_onrunq);
> +        /* Force a rescheduling in case some CPU is idle can pick
> this vCPU */
> +        cpumask_raise_softirq(&cpu_online_map, SCHEDULE_SOFTIRQ);
>          return;
>
This needs to become 'the cpus of vcpu->domain 's cpupool'.

I appreciate that this is fine, when running as shim, where you
certainly don't use cpupools. But when this run as baremetal, if we use
cpu_online_map, basically _all_ the online CPUs --even the ones that
are in another pool, under a different scheduler-- will be forced to
reschedule. And we don't want that.

I'm not also 100% convinced that this must/can live here. Basially,
you're saying that vcpu_wake() is called on a vCPU that happens to be
in the waitqueue, we should reschedule. And, AFAIUI, this is to cover
the case of a vCPU of the L2 guest comes online.

Well, it may even be technically fine. Still, if what we want to deal
with is vCPU onlining, I would prefer to at least trying find a place
which is more related to the onlining path, than to the wakeup path.

If you confirm your intent, I can have a look at the code and try to
identify such better place...

> @@ -761,9 +763,10 @@ static struct task_slice null_schedule(const
> struct scheduler *ops,
>      /*
>       * We may be new in the cpupool, or just coming back online. In
> which
>       * case, there may be vCPUs in the waitqueue that we can assign
> to us
> -     * and run.
> +     * and run. Also check whether this CPU is running idle, in
> which case try
> +     * to pick a vCPU from the waitqueue.
>       */
> -    if ( unlikely(ret.task =3D=3D NULL) )
> +    if ( unlikely(ret.task =3D=3D NULL || ret.task =3D=3D idle_vcpu[cpu]=
) )
>
I don't think I understand this. I may be a bit rusty, but are you sure
that, on an idle pCPU, ret.task is idle_vcpu at this point in this
function? I don't think it is.

Also, I'm quite sure this may mess up things for tasklets. In fact, one
case when ret.task is idle_vcpu here, if I have just forced it to be
so, in order to run a tasklet. But with this, we scan the waitqueue
instead, and may end up running something else.

> @@ -781,6 +784,10 @@ static struct task_slice null_schedule(const
> struct scheduler *ops,
>          {
>              list_for_each_entry( wvc, &prv->waitq, waitq_elem )
>              {
> +                if ( test_bit(_VPF_down, &wvc->vcpu->pause_flags) )
> +                    /* Skip vCPUs that are down. */
> +                    continue;
> +
So, yes, I think things like this are what we want. As said above for
the wakeup case, though, I'd prefer to find a way to avoid that offline
vCPUs ends up in the waitqueue, rather than having to skip them.

Side note, is_vcpu_online() can be used for the test.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-NQlHW+TKkTnJ+TybyTjz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpYkPQACgkQFkJ4iaW4
c+6HdQ/+JsE+OAkQUIwzRSUnuS4sVwKezti45ej1WoXHKlb4RESAY0mX5uLDLVU5
sIheG5XFplnmtzv2KYWjRj2WgcXZFI+NpilJ8DNwVgbI4gNrQ8fwFe4vGN5+keT7
F4t57ARpTJHEyExlJsin1pjEvOpnBMfRvvctGVWy2R/8LyBQIZCRNp2tWNQxybZO
5jxHafvtgNPJ8B91A3XmY1bYGDu8p5YyH9zgpJwHsAASRdaBtEOrKE9griV0fFeu
402DfMujamXM0lt4cBn67BA+DSVhCROn0mso08XMJOEV8hkXR+CU3OKDa8IQtVcQ
t6BPp1LH5yJrnsvsfJ2vPdsHQz6lErw8TH6tZqiUGBnwp+cWHD0F34SnKE4XzXQ2
xMcnowoyN37AyJ0Tkw7zqS/jPb0NTnpeqgQEu+sNlce3Ce0wu0Xf5apEAGyehcaD
Vf9qT5Rb4DgIMEj9S+s04jx7EgnmpYkQA5Trb0URHCgn0lFXtPtaaQAIdHbALTkB
zJof4CI3nLWCV6VaqV8K+L32BBSh/Yi9ekpg77idR/YGb/fvKUxGipF6DYxEP7eV
Vx+91BPj35buZiFo+AtTNh7D+PG0ynun6pxdk+/jAklx0cOxQIYiNzdq2pRJ3yM7
RgORGl2dLCZOdtC6GWw8p7Horshcex+t3nLXF/7l70nUgWrajtw=
=HeKR
-----END PGP SIGNATURE-----

--=-NQlHW+TKkTnJ+TybyTjz--



--===============6186931763917580132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6186931763917580132==--
