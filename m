From: Olaf Hering <olaf@aepfle.de>
Subject: ovmf fails to compile in 4.12-rc4
Date: Tue, 5 Mar 2019 15:49:19 +0100
Message-ID: <20190305154919.6b279290.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2725090570258830729=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y6pj=RI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h1BNo-0006YM-HJ
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 14:49:29 +0000
Received: from sender by smtp.strato.de (RZmta 44.13 AUTH)
 with ESMTPSA id C046b5v25EnPZVy
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Tue, 5 Mar 2019 15:49:25 +0100 (CET)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2725090570258830729==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/ter+_KwG8oypkEyRqPnhTAj"; protocol="application/pgp-signature"

--Sig_/ter+_KwG8oypkEyRqPnhTAj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

OVMF does not build itself with -fPIC, as a result it fails to compile with=
 recent toolchains.
Luckily ovmf.git#master has changes for BaseTools/Source/C/Makefiles/header=
.makefile to recognize EXTRA_OPTFLAGS, which can be used as vehicle to pass=
 the required CFLAGS.
What are the options to upgrade OVMF_UPSTREAM_REVISION to at least ef529e6a=
b7c31290a33045bb1f1837447cc0eb56..81502cee20ac4046f08bb4aec754c7091c8808dc =
for 4.12?
I think the currently used revision is just a snapshot with no specific mea=
ning. Since f7762645323 touches it anyway, every newer snapshot would do it=
 as well I think.

Olaf

--Sig_/ter+_KwG8oypkEyRqPnhTAj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXH6McAAKCRBdQqD6ppg2
fhiOAKDuVI+iVNJ37jAU0qYDNfYPqKVf6wCgi/hsso744sCPriqmjfgD3/2lBIc=
=A239
-----END PGP SIGNATURE-----

--Sig_/ter+_KwG8oypkEyRqPnhTAj--


--===============2725090570258830729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2725090570258830729==--
