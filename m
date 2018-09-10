From: Olaf Hering <olaf@aepfle.de>
Subject: Re: v4.19-rc3, wrong pageflags in dom0
Date: Mon, 10 Sep 2018 17:03:35 +0200
Message-ID: <20180910170335.5cae50fb.olaf@aepfle.de>
References: <20180910144907.774bee93.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7968724913405293808=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=b1bd=ly=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fzNj6-0002pY-6E
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 15:03:44 +0000
Received: from sender by smtp.strato.de (RZmta 44.0 AUTH)
 with ESMTPSA id L0862bu8AF3fNX2
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Mon, 10 Sep 2018 17:03:41 +0200 (CEST)
In-Reply-To: <20180910144907.774bee93.olaf@aepfle.de>
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

--===============7968724913405293808==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/mOCU/V4vCEDL9SDOY_ZJrrE"; protocol="application/pgp-signature"

--Sig_/mOCU/V4vCEDL9SDOY_ZJrrE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 10 Sep 2018 14:49:07 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> After reboot I tried to start my HVM domU, this is what I get in dom0:
> [  223.019451] page:ffffea007bed9040 count:1 mapcount:-1 mapping:00000000=
00000000 index:0x0

this also happens with rc2 and xen.git#staging as dom0. v4.18 works.

Olaf

--Sig_/mOCU/V4vCEDL9SDOY_ZJrrE
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5aHxwAKCRBdQqD6ppg2
fuMaAJ94Tr8gnqSzbDiN0E/wTdWD9pfzNgCg49jSox3NgG0c17w6tvNZyqnGQwo=
=n0RG
-----END PGP SIGNATURE-----

--Sig_/mOCU/V4vCEDL9SDOY_ZJrrE--


--===============7968724913405293808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7968724913405293808==--
