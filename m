From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 2/2] xen/sched: don't disable scheduler on
 cpus during suspend
Date: Sat, 16 Mar 2019 04:01:28 +0100
Message-ID: <57ef1a53000330818c8216c3680f64def410f201.camel@suse.com>
References: <20190314095953.11752-1-jgross@suse.com>
 <20190314095953.11752-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6176132854128971354=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KzQf=RT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h4zaG-0008Ew-Et
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2019 03:02:04 +0000
In-Reply-To: <20190314095953.11752-3-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6176132854128971354==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-cOnYhmLMqnXpwBB0gVzn"


--=-cOnYhmLMqnXpwBB0gVzn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-14 at 10:59 +0100, Juergen Gross wrote:
> Today there is special handling in cpu_disable_scheduler() for
> suspend
> by forcing all vcpus to the boot cpu. In fact there is no need for
> that
> as during resume the vcpus are put on the correct cpus again.
>=20
So, basically, you're saying that moving the vcpus to BSP / CPU0,
before suspending is not necessary, right?

I thought it was, because going into suspend involves things like
cpu_schedule_down(), which does, among other things,
SCHED_OP(free_pdata) for freeing the scheduler's data structs, and
hence we did not want vcpus "around".

> So we can just omit the call of cpu_disable_scheduler() when
> offlining
> a cpu due to suspend and on resuming we can omit taking the schedule
> lock for selecting the new processor.
>=20
Well, in theory, we should hold the lock when for using
'cpumask_scratch_cpu(cpu)'. Not sure this is an actual problem in this
case, but still...

> In restore_vcpu_affinity() we should be careful when applying
> affinity
> as the cpu might not have come back to life.=20
>
But restore_vcpu_affinity() is done, in a loop, for all vcpus of all
domains, in thaw_domains(), which in turn comes after
enable_nonboot_cpus(), which I think is supposed to bring every CPU
back up.... What am I missing?

> diff --git a/xen/common/cpupool.c b/xen/common/cpupool.c
> index e89bb67e71..7b5ce18426 100644
> --- a/xen/common/cpupool.c
> +++ b/xen/common/cpupool.c
> @@ -313,7 +313,7 @@ static long cpupool_unassign_cpu_helper(void
> *info)
>       * cpu_disable_scheduler(), and at the bottom of this function.
>       */
>      rcu_read_lock(&domlist_read_lock);
> -    ret =3D cpu_disable_scheduler(cpu);
> +    ret =3D (system_state =3D=3D SYS_STATE_suspend) ? 0 :
> cpu_disable_scheduler(cpu);
>
Mmm... How can this function be called with state =3D STATE_suspend ?

> @@ -735,31 +708,36 @@ void restore_vcpu_affinity(struct domain *d)
> =20
>          ASSERT(!vcpu_runnable(v));
> =20
> -        lock =3D vcpu_schedule_lock_irq(v);
> -
> -        if ( v->affinity_broken )
> -        {
> -            sched_set_affinity(v, v->cpu_hard_affinity_saved, NULL);
> -            v->affinity_broken =3D 0;
> -
> -        }
> -
>          /*
> -         * During suspend (in cpu_disable_scheduler()), we moved
> every vCPU
> -         * to BSP (which, as of now, is pCPU 0), as a temporary
> measure to
> -         * allow the nonboot processors to have their data structure
> freed
> -         * and go to sleep. But nothing guardantees that the BSP is
> a valid
> -         * pCPU for a particular domain.
> +         * Re-assign the initial processor as after resume we have
> no
> +         * guarantee the old processor has come back to life again.
>           *
>           * Therefore, here, before actually unpausing the domains,
> we should
>           * set v->processor of each of their vCPUs to something that
> will
>           * make sense for the scheduler of the cpupool in which they
> are in.
>           */
>          cpumask_and(cpumask_scratch_cpu(cpu), v->cpu_hard_affinity,
> -                    cpupool_domain_cpumask(v->domain));
> -        v->processor =3D cpumask_any(cpumask_scratch_cpu(cpu));
> +                    cpupool_domain_cpumask(d));
> +        if ( cpumask_empty(cpumask_scratch_cpu(cpu)) )
> +        {
> +            if ( v->affinity_broken )
> +            {
> +                sched_set_affinity(v, v->cpu_hard_affinity_saved,
> NULL);
> +                v->affinity_broken =3D 0;
> +                cpumask_and(cpumask_scratch_cpu(cpu), v-
> >cpu_hard_affinity,
> +                            cpupool_domain_cpumask(d));
> +            }
> =20
I'm not sure I follow this; I'll think deeper, but, in the meanwhile...

> -        spin_unlock_irq(lock);
> +            if ( cpumask_empty(cpumask_scratch_cpu(cpu)) )
> +            {
> +                printk(XENLOG_DEBUG "Breaking affinity for %pv\n",
> v);
> +                sched_set_affinity(v, &cpumask_all, NULL);
> +                cpumask_and(cpumask_scratch_cpu(cpu), v-
> >cpu_hard_affinity,
> +                            cpupool_domain_cpumask(d));
>
... what does it mean we're breaking the affinity while trying to
restore it?

When/where is this vcpu getting its real affinity back in place then?

It might well be me, but I feel like there is something I'm missing
about how this patch is supposed to work.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-cOnYhmLMqnXpwBB0gVzn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyMZwgACgkQFkJ4iaW4
c+7o6A/9HgUV196rx0Z7GCpppchoy7XgJq1mFHvI/ffsPI5xrw2rohPka9zVBnQR
w73FLDDHsoBWxgjDJUG/QAXvMVLAF9FbP3CIBTcH0VFv+4cIt9BXfKPQHAPXe+24
xegIrx+5k87p46lBecj375pQCQXY6zx2mZUyfDXRHKQTwi+oiIqntKUuK8wAka6D
jElh1+Ladx5Eu6zVujwbi6XEMxphmncxrsJLOFL0XrEw7Jhcf/9awAgkBHQ1I1Ww
yqY+TwwCLzgR6AhqCEn+HcRz/Nfpx5m1vHx3D6w++SBJ02MbO0QvD+SOhuwGc+XS
mgv9gz+PYIHJbDMTcOGu+L7pYirNykqb7dB836zuWawOrksFAfYBps2iBXBLstmT
N7XwAwGVqIYoGrTUADpq+Gaup2da18ccQGe5t54dynD5iYBJ8he/URiTulsWyyz5
TCgpH4fVyyFRzXtHFctqP32URoTWm05ms/tX2frRquMO0govyauttl+5KeV/3Nga
hVl/GdUvIRTbjnhkJ31SyOsBN82AQnlxbtc6ee1iRdE1JeE7tZuJcGYR5A4jtWZH
12/HQVb16SmQeNovLlckhUFgOapkkRx78OvjvBgXwKUCb5H+JmbuzHuqMGNMAE+4
IWWrygdvLNl0vNjsfneGbuEm3VUVN48CSzUVzlEvWzP7qz2iG+E=
=oQXA
-----END PGP SIGNATURE-----

--=-cOnYhmLMqnXpwBB0gVzn--



--===============6176132854128971354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6176132854128971354==--
