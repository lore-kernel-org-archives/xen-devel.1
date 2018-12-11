From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] xen: preserve COMPAT in CFLAGS
Date: Tue, 11 Dec 2018 10:24:08 +0100
Message-ID: <20181211092408.GA18447__30666.6619879708$1544520199$gmane$org@aepfle.de>
References: <20181026101016.28584-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6077755539747924858=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t2nM=OU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gWeH5-0005vt-FZ
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 09:24:20 +0000
In-Reply-To: <20181026101016.28584-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org


--===============6077755539747924858==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ping?


On Fri, Oct 26, Olaf Hering wrote:

> A given Qemu version can not predict what version of Xen it will run on.
> There are some checks in configure to decide what Xen libraries and
> functions are available. How exactly these functions must be accessed
> has to be decided by configure and the user who is compiling Qemu.
> In no way some random header file must override this decision.
>=20
> Remove the breakage introduced by commit 5eeb39c24b, which would always
> hide the libxc interfaces the given version of Qemu knows about.
>=20
> The current symptom of such breakage is a build failure with qemu-2.9
> and older, in combination with Xen 4.12.
>=20
> Fixes: 5eeb39c24b7d4da5d129bfdd9c4fd21cfb3d28d6
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  include/hw/xen/xen_common.h | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 5f1402b494..33fa2d3497 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -1,15 +1,6 @@
>  #ifndef QEMU_HW_XEN_COMMON_H
>  #define QEMU_HW_XEN_COMMON_H
> =20
> -/*
> - * If we have new enough libxenctrl then we do not want/need these compat
> - * interfaces, despite what the user supplied cflags might say. They
> - * must be undefined before including xenctrl.h
> - */
> -#undef XC_WANT_COMPAT_EVTCHN_API
> -#undef XC_WANT_COMPAT_GNTTAB_API
> -#undef XC_WANT_COMPAT_MAP_FOREIGN_API
> -
>  #include <xenctrl.h>
>  #include <xenstore.h>
>  #include <xen/io/xenbus.h>
>=20
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXA+CNQAKCRBdQqD6ppg2
fka9AJsGrS4R//U2ZidLGIWIfJ0hKPiQRgCeKO7jAH2uT5roxC7VXY4AI2ZNrBg=
=7f5M
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--


--===============6077755539747924858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6077755539747924858==--
