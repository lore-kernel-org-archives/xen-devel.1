From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: sched: Credit2: during scheduling,
 update the idle mask before using it
Date: Thu, 11 Oct 2018 19:36:24 +0200
Message-ID: <5e374149bff5dcf35102a4789bfb56962c42f50d.camel@suse.com>
References: <153926549830.22680.203200918007449375.stgit@wayrath>
 <5BBF5C0802000078001F0C2E@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7508158737068053354=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ap2w=mx=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gAesy-00032W-GL
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 17:36:32 +0000
In-Reply-To: <5BBF5C0802000078001F0C2E@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7508158737068053354==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ULfPtZv2bO7kf921HHut"


--=-ULfPtZv2bO7kf921HHut
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-10-11 at 15:19 +0100, Jan Beulich wrote:
> > > > On 11.10.18 at 15:44, <dfaggioli@suse.com> wrote:
> > Not doing that, in fact, may cause runq_tickle() to think that the
> > cpu
> > is still idle, and tickle it to go pick up a vcpu from the
> > runqueue,
> > which might be wrong/unideal.
>=20
> Makes sense to me; I seem to vaguely recall that something
> along these lines was done years ago for credit1 as well.
>=20
Mmm... yes, there have been a few, not identical, but vaguely similar
(or, at least, related to making sure that we actually tickle idle
cpus, etc).

> > Backporting: this does not fix a system crash. However, it fixes
> > the
> > behavior of the scheduler --which I'd call wrong more than just
> > suboptimal.
> >=20
> > Therefore, I'd be inclined to ask for this to be backported. It
> > should
> > be fairly straightforward, but as usual, I'm up for helping with
> > that.
>=20
> I'll try to remember to pick it up when I've seen it go in.
>
Thanks. I'll try myself keeping an eye on the staging trees at relevant
times.

> > --- a/xen/common/sched_credit2.c
> > +++ b/xen/common/sched_credit2.c
> > @@ -3554,6 +3554,13 @@ csched2_schedule(
> >              __set_bit(__CSFLAG_scheduled, &snext->flags);
> >          }
> > =20
> > +        /* Clear the idle mask if necessary */
> > +        if ( cpumask_test_cpu(cpu, &rqd->idle) )
> > +        {
> > +            __cpumask_clear_cpu(cpu, &rqd->idle);
> > +            smt_idle_mask_clear(cpu, &rqd->smt_idle);
> > +        }
>=20
> I realize you're merely moving code, but is there a reason to do
> the test-and-clear in two steps rather than one. It being the
> non-atomic variant, it can't be shared memory, and hence the
> cache line ping-pong consideration applicable in other cases is
> irrelevant here afaict.
>=20
Indeed it's not that, IMO. In fact, access to this mask is serialized
via a spinlock, so there can't be two CPUs trying to read/update it
concurrently.

I don't know, I guess the original structure of the code is inherited
from Credit1 (where things are _not_ serialized, so trying to avoid
ping-pong makes sense).

Then, when I did 222234f2ad1 "xen: credit2: use non-atomic cpumask and
bit operations", I didn't go as far as I should have. It's weird
because ISTR having thought about it, but I may be confusing this with
something else.

In any event, I think we very well can turn these in
__test_and_clear/set(). But I'd do that in a separate patch.

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-ULfPtZv2bO7kf921HHut
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlu/ihgACgkQFkJ4iaW4
c+5kyRAAmxshfLj8pbqRsJuFyQzyLMoCv5062D/yC1Rpb8YHDUSDYcyT+GJKUmfU
0g3qCAMA0U4s7ZmYJN3tbwCokGax3sft+ub/KztOL7xEF5bteHnYacXwVqVjTKep
34dpjs+J5jqVHqJD58x/QtfTuue2b7l32KHDrzOsyIs7pYoZHQyyoco/6Lz3GknS
fOIbo6Cufs2QGxxYMOz8OsiZtOI8E37JAMFgJ9FJaPxB5cauqizJhtpxww1eDazn
8Z7ttaTyAwTifRndmsmrj/K3ObyjdgABqn+BiK0snzCvIUCsqy63VNzdFonrEEk5
r558BCZGMEKM0IrjlzEaE5PBS30fZbsJURbfgGE6hFd24MyBU/SD8L0Ojp6qIv7b
5jwD85iRZDi1+T+0M41rI1PZcQ9XT7qpUCXr+p4z+VUXwgZRI90gWrlfEt9svrIi
oMJYXla+RShf+upNbXD5P+Z9ZuZokx7DVROHA1hBuZHbP/4mgsISJ4MyXMbiWafR
/whpWXwZl/m5lXzzmjTgm7V0I5eLdB5o/0jPr0SfVmviQml4r/1dFlUPscF6lG/B
UbGpBXTqKEvA4azEKSeEEwdj0N7XK5taxL/+e5riOBicb4tMRv85sKSXYdy4z49z
a6QNk7swKsTM1dvoF3/8tnxLi1i2LZMT1iu5WbaWMU9+QykmIaA=
=XGw+
-----END PGP SIGNATURE-----

--=-ULfPtZv2bO7kf921HHut--



--===============7508158737068053354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7508158737068053354==--
