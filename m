From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: add helper function to set
 device_model_version
Date: Tue, 14 May 2019 12:31:18 +0200
Message-ID: <20190514123118.6c9ecbf7.olaf@aepfle.de>
References: <20190514072741.11760-1-olaf@aepfle.de>
 <20190514101856.6otetd56n72t42bm@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3647530762898866885=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZE1V=TO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQUiY-0004ks-No
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:31:31 +0000
In-Reply-To: <20190514101856.6otetd56n72t42bm@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3647530762898866885==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/CJmrXv7LYMugA+s0DROyq7G"; protocol="application/pgp-signature"

--Sig_/CJmrXv7LYMugA+s0DROyq7G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 14 May 2019 12:18:56 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> Why is it not fine to set the device model version in
> libxl__domain_build_info_setdefault?

Because it receives just build_info, which lacks all the data to decide
if a device type needs a device model or not.

Olaf

--Sig_/CJmrXv7LYMugA+s0DROyq7G
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNqY9gAKCRBdQqD6ppg2
fqR0AKCbbizkNR4zccoPk1lP1731CFURIQCglusL9jSXRRSZNu/XWA1+3HZjJHA=
=vAPc
-----END PGP SIGNATURE-----

--Sig_/CJmrXv7LYMugA+s0DROyq7G--


--===============3647530762898866885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3647530762898866885==--
