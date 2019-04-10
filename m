From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Wed, 10 Apr 2019 17:08:41 +0200
Message-ID: <20190410170841.616b5ab8.olaf@aepfle.de>
References: <20190410103338.5456-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7947008111119058541=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rOu6=SM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hEEqY-0007sL-D1
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:09:06 +0000
In-Reply-To: <20190410103338.5456-1-olaf@aepfle.de>
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

--===============7947008111119058541==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/QIrur3JEkyC3xkS5PpPkTE3"; protocol="application/pgp-signature"

--Sig_/QIrur3JEkyC3xkS5PpPkTE3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 10 Apr 2019 12:33:38 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

>              goto error_out;

This one should have been removed, now libxl fails right away.
Will do more runtime testing.

Waiting for feedback before sending v2.

Olaf

--Sig_/QIrur3JEkyC3xkS5PpPkTE3
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXK4G+gAKCRBdQqD6ppg2
fj9pAJwMSgXp/U833+zVTB2zsM9k3upc1wCaA/2mikZZTrR5ZSxgPitLaIUkU2A=
=kkGJ
-----END PGP SIGNATURE-----

--Sig_/QIrur3JEkyC3xkS5PpPkTE3--


--===============7947008111119058541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7947008111119058541==--
