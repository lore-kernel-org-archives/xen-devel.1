From: Olaf Hering <olaf@aepfle.de>
Subject: Re: qemu assert in staging during HVM live migration
Date: Mon, 26 Nov 2018 16:16:48 +0100
Message-ID: <20181126161648.063b401b.olaf@aepfle.de>
References: <20181122100344.GA13748@aepfle.de>
 <20181123155449.GB6902@perard.uk.xensource.com>
 <20181123165708.0a085d8e.olaf@aepfle.de>
 <20181126143205.GL2448@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3331468437648104176=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bbsm=of=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gRId3-0002Vs-Og
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 15:16:54 +0000
In-Reply-To: <20181126143205.GL2448@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============3331468437648104176==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/kBYB9EphR_E7Et9cZQkTipj"; protocol="application/pgp-signature"

--Sig_/kBYB9EphR_E7Et9cZQkTipj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 26 Nov 2018 14:32:05 +0000
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Also, a backtrace of the original problem would be nice.

There is no backtrace, all the data I could grab was sent to this list.
I was unable to reproduce it as well.

Olaf

--Sig_/kBYB9EphR_E7Et9cZQkTipj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW/wOYAAKCRBdQqD6ppg2
frzYAKDexxyWL+5HxNIkIJr/SdNokEUiGwCdHy4Q6McHsbroiWYcZRurc7Jhva8=
=n+Z7
-----END PGP SIGNATURE-----

--Sig_/kBYB9EphR_E7Et9cZQkTipj--


--===============3331468437648104176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3331468437648104176==--
