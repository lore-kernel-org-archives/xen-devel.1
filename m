From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v4] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Mon, 13 May 2019 16:45:21 +0200
Message-ID: <20190513164521.19e65e5d.olaf@aepfle.de>
References: <20190510152047.17299-1-olaf@aepfle.de>
 <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1000643487623551867=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RcTn=TN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQCCx-0003s1-FV
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:45:40 +0000
In-Reply-To: <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1000643487623551867==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/hsGsCzkzFuu8CpXta=y_a4m"; protocol="application/pgp-signature"

--Sig_/hsGsCzkzFuu8CpXta=y_a4m
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 13 May 2019 16:37:33 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> FTR I would have preferred a pre-patch that did the move of this chunk
> of code into libxl__domain_set_device_model without any functional
> change, and then a second patch that introduces the new functionality.

If that needs to be done, I can do it.


What could be done in addition is to add an assert to
libxl__domain_build_info_setdefault to check if device_model_version
is really set.


Olaf

--Sig_/hsGsCzkzFuu8CpXta=y_a4m
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNmDAQAKCRBdQqD6ppg2
fr7nAJ9TUxhbo4i/+ug/jAdH6YqN4LmiVwCbBZOrzzzrg44aX/VjQU7dg0IjHKI=
=Vmz3
-----END PGP SIGNATURE-----

--Sig_/hsGsCzkzFuu8CpXta=y_a4m--


--===============1000643487623551867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1000643487623551867==--
