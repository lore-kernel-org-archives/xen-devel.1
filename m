From: Olaf Hering <olaf@aepfle.de>
Subject: Re: qemu assert in staging during HVM live migration
Date: Fri, 23 Nov 2018 16:57:08 +0100
Message-ID: <20181123165708.0a085d8e.olaf@aepfle.de>
References: <20181122100344.GA13748@aepfle.de>
 <20181123155449.GB6902@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6263059555776771046=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cybj=oc=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gQDpU-00019X-R5
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 15:57:17 +0000
In-Reply-To: <20181123155449.GB6902@perard.uk.xensource.com>
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

--===============6263059555776771046==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/ZvgGqR7CMRFcKn.OFkj83Sc"; protocol="application/pgp-signature"

--Sig_/ZvgGqR7CMRFcKn.OFkj83Sc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 23 Nov 2018 15:54:49 +0000
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Is your toolstack runs the QMP command 'query-block' or some other
> command related to block behind libxl's back?

This is plain xl create + xl migrate from staging.

> Beside that, I don't know if something else might be wrong. What patches
> is there on your qemu-2.12 (at least patches related to xen-disk)?

Nothing related. I will see if I can get some runtime to try the suggested =
changes.

Olaf

--Sig_/ZvgGqR7CMRFcKn.OFkj83Sc
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW/gjVAAKCRBdQqD6ppg2
fok3AJ0WDEk2opK26+cFfY6tQud6+Z4b1gCbBUSiQmW7ts0xghONLduBk8ki3CY=
=ZPCD
-----END PGP SIGNATURE-----

--Sig_/ZvgGqR7CMRFcKn.OFkj83Sc--


--===============6263059555776771046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6263059555776771046==--
