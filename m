From: Olaf Hering <olaf@aepfle.de>
Subject: fuzz/wrappers.c fails to build due to missing
 x86-emulate.h
Date: Thu, 29 Mar 2018 11:46:06 +0200
Message-ID: <20180329094605.GK30726@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3347296729507331260=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============3347296729507331260==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rex5+51txc1ort/q"
Content-Disposition: inline


--Rex5+51txc1ort/q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

In my automated SLE_11 builds I often see failures like that:

[   74s] wrappers.c:5:25: error: x86-emulate.h: No such file or directory
[   74s] make[6]: *** [wrappers.o] Error 1

Just retriggering the package build fixes the error. SLE11 has make-3.81.
Is that version of make perhaps too old to recognize the dependencies?

Olaf

--Rex5+51txc1ort/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWry11wAKCRBdQqD6ppg2
fjAeAKCldWld6pmELFx0iGnHQiFAEkdo2ACffzIOyLy1NJZGH4tAA6LeefuPu8Q=
=gOKS
-----END PGP SIGNATURE-----

--Rex5+51txc1ort/q--


--===============3347296729507331260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3347296729507331260==--
