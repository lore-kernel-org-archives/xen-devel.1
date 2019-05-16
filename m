From: Olaf Hering <ohering@suse.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 10:27:06 +0200
Message-ID: <20190516102706.4766f2c3.ohering@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7249572651832270166=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRBjS-0001Kx-Kq
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 08:27:18 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 88AEDAE84
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 08:27:15 +0000 (UTC)
In-Reply-To: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============7249572651832270166==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/RO81vBWbr9X/OpFlHcnsJey"; protocol="application/pgp-signature"

--Sig_/RO81vBWbr9X/OpFlHcnsJey
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 10:09:38 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Has this patch ever been tested to work?

With PV only. I will have a look.

Olaf

--Sig_/RO81vBWbr9X/OpFlHcnsJey
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0e2gAKCRBdQqD6ppg2
fqhGAJ4xQfs7c1w5WZ+LYgeNB8cxTxY0dgCggXhpGHoA6mwzcotNpZi7ZRJ1wv8=
=s5dV
-----END PGP SIGNATURE-----

--Sig_/RO81vBWbr9X/OpFlHcnsJey--


--===============7249572651832270166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7249572651832270166==--
