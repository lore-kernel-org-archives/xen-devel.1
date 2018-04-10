From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 22:02:15 +0200
Message-ID: <42c5d682348a351420290dc1ecf5b1e2a60b98be.camel@suse.com>
References: <20180410085729.GA472@aepfle.de> <20180410155949.GB7177@aepfle.de>
 <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
 <20180410190302.GC7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4854819226999338133=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180410190302.GC7177@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============4854819226999338133==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Vn/tusENuLox6jN5zoyh"


--=-Vn/tusENuLox6jN5zoyh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-04-10 at 21:03 +0200, Olaf Hering wrote:
> On Tue, Apr 10, Dario Faggioli wrote:
>=20
> > As said, its cpus=3D and cpus_soft=3D, and you probably just need
> > cpus=3D"node:1"
> > cpus_soft=3D"node:1"
> > Or, even just:
> > cpus=3D"node:1"
> > as, if soft-affinity is set to be equal to hard, it is just
> > ignored.
>=20
> Well, that was a noop. But xl.cfg states "nodes:0-3,^node:2", so this
> should work:
> cpus=3D"nodes:3,^node:0"
> cpus_soft=3D"nodes:3,^node:0"
>=20
Well, but "nodes:0-3,^node:2" is a way to say that you want nodes 0, 1
and 3. I.e., you are defining a set made up of 0,1,2,3, and then you
remove 2.

With "nodes:3,^node:0", you're saying that you want node 3, but not
node 0. I.e., basically, you are creating a set with 3 in it, and then
trying to remove 0... I agree this is not technically wrong, but it
does not make much sense. Why you're not using
"node:3,^node:0,^node:1,^node:2" then?

So, really, the way to achieve what you seem to me to be wanting to
achieve is:

cpus=3D"node:3"

All that being said, yes, "nodes:3,^node:0" should work (and behave
exactly as "node:3" :-) ).

And in fact...

> xl create -f fv_sles12sp1.f.tst.cfg
>
... parsing, at the xl level, worked, or xl itself would have errored
out, with its own message.

> libxl: error: libxl_sched.c:62:libxl__set_vcpuaffinity: Domain
> 16:Setting vcpu affinity: Invalid argument
> libxl: error: libxl_dom.c:461:libxl__build_pre: setting affinity
> failed on vcpu `0'
>
This is xc_vcpu_setaffinity() failing with EINVAL, in
libxl__set_vcpuaffinity().

> Same for nodes:2..., just nodes:1... works.
>=20
> And after some attempts, cpus=3D"nodes:2/3" fails too.
>
"nodes:2/3" is not supported.

> There is no indication what is invalid.
>=20
Mmm... I seem to recall having tested the parser against various corner
cases and/or ill-defined input. Still, my guess is that using ^ like
that (i.e., excluding something which was not there in the first
place), may result in a weird/corrupted cpumask.

If that is the case, it indeed would be a bug. I'll check the code
tomorrow.

In the meanwhile --let me repeat myself-- just go ahead with "node:2",
"node:3", etc. :-D

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-Vn/tusENuLox6jN5zoyh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrNGEgACgkQFkJ4iaW4
c+73HxAAomR6xnJvZeqXymUwb4eIKoBWeVbn5b+gUbvWKOak9mm0WWYdPZRafrfi
zqfIjS45CuHyrGVrJHfz6lYWg9V/6Kn/nyJ+qKxsccg6dDRa8tv2PdpSUBhRlzlP
2DzqGeNQP+IZrVFfNxOpEjsnYiUZ4V/ajkhplNY1kw1c9lIZ2nRbeQCAJoFYt8El
YtH+PU+0n+mtwzhsE76QSjOE9NBmPsDV9XR6dVrEyILJYkLJn1y4AnRlFykVwcoF
yEQMKTryneSKpO8Ad6c8NS/HU5j3b99nxzV+gKND3Gs1P3kCV5VNni2pH3Cx7pDi
43uX6c85LM9Mc88hRw4QFLWOps9eAQUGx1XzvfDvxr6Z9BZPsntHVBhaq/45U3qJ
tFutpzN4Isapx9uIDyvA5a59yBmDQpM8alpAYSEACUQecFEIBcUG3N/kggERrvJP
n9vwUu31BVILfxhAUdCUeMR46ks69PO/u22sbhf5n4EyeBgEPLqJ7kpuTs1B1fAY
RqAePtzQeFZjeY8LfNANldSykdmYGF5kiLuQ/XtdBOMO79OH1j3urq3eFWHQmdnF
Ww3950/i8mBWe480scUqkkzeQdR4ShIdAf5ZMLf+Lmabyo/caSdVqLIUoJ9Ydt0O
Y47c0zCwkIliu//5qPh9dWUpr32Yps4oRHQseJ29IosbbOwl6ms=
=CPJh
-----END PGP SIGNATURE-----

--=-Vn/tusENuLox6jN5zoyh--



--===============4854819226999338133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4854819226999338133==--
