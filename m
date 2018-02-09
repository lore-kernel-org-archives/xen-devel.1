From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: RTDS with extra time issue
Date: Fri, 09 Feb 2018 14:18:54 +0100
Message-ID: <1518182334.5019.15.camel@suse.com>
References: <762ccb02-b758-1636-fddc-f4e6a3ca19d0@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1173424204825141060=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=54lt=fd=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ek8aW-0008Kj-Ms
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 13:19:36 +0000
In-Reply-To: <762ccb02-b758-1636-fddc-f4e6a3ca19d0@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Meng Xu <xumengpanda@gmail.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============1173424204825141060==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bEdO9DH1JQPbaZWiO7DV"


--=-bEdO9DH1JQPbaZWiO7DV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 14:20 +0200, Andrii Anisov wrote:
> Dear Dario,
>=20
Hi,

> My experimental setup is built on Salvator-X board with H3 SOC
> (running=20
> only big cores cluster, 4xA57).
> Domains up and running, and their VCPU are as following:
>=20
> root@generic-armv8-xt-dom0:/xt/dom.cfg# xl sched-rtds -v all
> Cpupool Pool-0: sched=3DRTDS
> Name                                ID VCPU    Period    Budget
> Extratime
> (XEN) FLASK: Allowing unknown domctl_scheduler_op: 3.
> Domain-0                             0    0     10000 1000        yes
> Domain-0                             0    1     10000 1000        yes
> Domain-0                             0    2     10000 1000        yes
> Domain-0                             0    3     10000 1000        yes
> (XEN) FLASK: Allowing unknown domctl_scheduler_op: 3.
> DomR                                 3    0     10000 5000         no
> (XEN) FLASK: Allowing unknown domctl_scheduler_op: 3.
> DomA                                 5    0     10000 1000        yes
> DomA                                 5    1     10000 1000        yes
> DomA                                 5    2     10000 1000        yes
> DomA                                 5    3     10000 1000        yes
> (XEN) FLASK: Allowing unknown domctl_scheduler_op: 3.
> DomD                                 6    0     10000 1000        yes
> DomD                                 6    1     10000 1000        yes
> DomD                                 6    2     10000 1000        yes
> DomD                                 6    3     10000 1000        yes
>=20
Ok, so you're giving:
- 40% CPU time to Domain-0
- 50% CPU time to DomR
- 40% CPU time to DomA
- 40% CPU time to DomD

total utilization is 170%. As far as I've understood you have 4 CPUs,
right? If yes, there *should* be no problems. (Well, in theory, we'd
need a schedulability test to know for sure whether the system is
"feasible", but I'm going to assume that it sort of is, and leave to
Meng any further real-time scheduling analysis related configurations.
:-) ).

> The idea of such configuration is that only DomR really runs RT
> tasks,=20
> and their CPU utilization would be less than half a CPU. Rest of the=20
> domains are application domains without need of RT guarantees for
> their=20
> tasks, but can utilize as much CPU as they need and is available at
> this=20
> moment.
>
So, this should work, as allowing the other domains to use extratime
should *not* allow them to prevent DomR to get it's 50% share of CPU
time.

I wonder, though, if this case would not be better if cpupools are
used. E.g., you can leve the non real-time domains in the default pool
(and have Credit or Credit2 there), and then have an RTDS cpupool in
which you put DomR, with its 50% share, and perhaps someone else (just
to avoid wasting the other 50%).

But that's a different story...

> I load application domains with `dd if=3D/dev/zero of=3D/dev/null` per
> VCPU.
> In DomR I run one RT task with period 10ms and wcet 4ms (I'm using=20
> LITMUS-RT for DomR), and see that this task sometime misses its=20
> deadline. Which means that the only VCPU of DomR haven't got its 5ms=20
> each 10ms.
>
Well, that's a possibility, and (if the system is indeed schedulable,
which again, I'm assuming just out of laziness :-/ ) it would be a bug.
However, as a first thing, I'd make sure that this is actually not
happening.

Basically, can you also fully load (like with dd as above, or just yes
or while(1)) DomR, and then check if it is getting 50%? For a first
approximation of this, you can check with xentop. If you want to be
even more sure/you want to know it precisely, you can use tracing.

If DomR is not able to get its share, then we have an issue/bug in the
scheduler. If it does, then the scheduler is doing its job, and the
issue may be somewhere else (e.g., something inside the guest may eat
some of the budget, in such a way that not all of it is available when
you actually need it).

Let me know.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-bEdO9DH1JQPbaZWiO7DV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlp9n74ACgkQFkJ4iaW4
c+4tkA/7BXWI0OeQmgFl7sCJKn+YSzoaasiqt8AO3MsrJlIe+AwFsE+kJg8zPpIp
JR1qFWQvt+5UYkvn6+9pBRTkc3e2jqy0yGAc6ZDnCrA4j85SgVjUJt0Oh45lru6i
x+/mxgFVdnjuQCXHurrXIp31oUph2Ec/R4yJ2VQCvPkwMKwMiLxmFj3HA87qo4Oq
AOUnwrGRt/qiMMRevkey7Q7BSwwr8zXraOfZX1f8fyWxbiy5OdjUCrGyJ0BS5EKQ
GWvy3d8Shk1ekyWYExHbGUCEi7PGLBa+4A1xv8ZAleNvnMknoGwrgGiz4KJICg3J
eWMnwMAACfXylctS37lrK0krbBX7rzqom8zB0y8aQhfivZzo77a/OCluvQZvNEuG
/j79v+XsVEV2jEIa7bs+xsD10s+zBl/r93YPl3os40G0QxceJ+wNYYHkg+h++475
ZOgeoSAgALDliqMvDJVwvj5Je+dWzp9MHZyCxI5ZpPydM9GwDau/zm0KjlEO3o6q
JnHnCuVkwu4qQTM4gPshmVJKTxzLxEBgHAMUMkIl3Jl7nBaWNXT5TqAjPJ9KHkdY
RXsxYbBXhGrZw85+TTz7XyIkge9BnlIIvfdCQQ/7dg7qR1w03Asmp8lgOzCqTHie
YKrq9C+IKY63m8Oe4rUFTz8VVI795wrWBdgm9MJQCz2iWqyBMTc=
=wPj8
-----END PGP SIGNATURE-----

--=-bEdO9DH1JQPbaZWiO7DV--



--===============1173424204825141060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1173424204825141060==--
