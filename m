From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Thu, 9 May 2019 18:19:04 +0200
Message-ID: <20190509181904.101ac9ef.olaf@aepfle.de>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190503161132.06f85271.olaf@aepfle.de>
 <20190503152953.xcisr7n2bs4v76mi@Air-de-Roger>
 <20190509175438.3e2016b8.olaf@aepfle.de>
 <20190509161410.qb7kuokuq7xoyx5t@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0911736039960498452=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vYVB=TJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hOllI-00038O-UQ
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 16:19:13 +0000
In-Reply-To: <20190509161410.qb7kuokuq7xoyx5t@Air-de-Roger>
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

--===============0911736039960498452==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/HP5jKJPhZjmFnbq=YG6lJXA"; protocol="application/pgp-signature"

--Sig_/HP5jKJPhZjmFnbq=YG6lJXA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 9 May 2019 18:14:10 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> The patch below looks sensible to me, and it's more like what I was
> expecting would be needed to solve this issue.

The remaining question is if a new state should be introduced,
or if LIBXL_DEVICE_MODEL_VERSION_UNKNOWN would be good to state the fact
that no device model is required.

Olaf

--Sig_/HP5jKJPhZjmFnbq=YG6lJXA
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNRS+AAKCRBdQqD6ppg2
fq1xAKDRfYeZ/VZAlHsrQHMyjGMxx21CygCgqmPBxrtwHGNo35gmGdovQpqS30A=
=XhgC
-----END PGP SIGNATURE-----

--Sig_/HP5jKJPhZjmFnbq=YG6lJXA--


--===============0911736039960498452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0911736039960498452==--
