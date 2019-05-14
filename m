From: Olaf Hering <olaf@aepfle.de>
Subject: Re: how to disable build of pv-shim?
Date: Tue, 14 May 2019 12:34:06 +0200
Message-ID: <20190514123406.72eda0f8.olaf@aepfle.de>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3810808372010780047=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZE1V=TO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQUl9-00051G-3F
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:34:11 +0000
In-Reply-To: <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============3810808372010780047==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/VgQdPSsHvT/CSX09GDcuXnx"; protocol="application/pgp-signature"

--Sig_/VgQdPSsHvT/CSX09GDcuXnx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 13 May 2019 17:20:05 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> enabled by default

Does anyone actually require it at all?
Those who do pass --enable-pvshim to configure. No need for (incorrect) hos=
t_cpu checks.

Olaf

--Sig_/VgQdPSsHvT/CSX09GDcuXnx
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNqZngAKCRBdQqD6ppg2
frAuAKDER/KWzipowZFkGOOwEs8yMvXRVACgqYVw+qcD7iab3D/ppuC+5vTPKhQ=
=HBOr
-----END PGP SIGNATURE-----

--Sig_/VgQdPSsHvT/CSX09GDcuXnx--


--===============3810808372010780047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3810808372010780047==--
