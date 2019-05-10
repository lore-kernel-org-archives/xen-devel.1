From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v3] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Fri, 10 May 2019 15:49:20 +0200
Message-ID: <20190510154920.150b4b37.olaf@aepfle.de>
References: <20190510100416.16658-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1343591919137417501=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dG64=TK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hP5uA-0006aU-Bg
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:49:43 +0000
In-Reply-To: <20190510100416.16658-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1343591919137417501==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/B.QbEvAiuWVLK420qJdX20R"; protocol="application/pgp-signature"

--Sig_/B.QbEvAiuWVLK420qJdX20R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 10 May 2019 12:04:16 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> v3 not runtime tested

The initialization for device_model_stubdomain must be moved to the new fun=
ction.


Olaf

--Sig_/B.QbEvAiuWVLK420qJdX20R
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNWBYAAKCRBdQqD6ppg2
fk3jAJ9/I+WB4Sj0wWBYieHl+vr33yb+YwCfTr76qioC1THXdaiwrJIDMg/YQAI=
=ZGtk
-----END PGP SIGNATURE-----

--Sig_/B.QbEvAiuWVLK420qJdX20R--


--===============1343591919137417501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1343591919137417501==--
