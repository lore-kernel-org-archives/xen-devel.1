From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH qemu-xen 4.10 & 4.11] xen_disk: Disable file
 locking for the PV disk backend
Date: Wed, 22 May 2019 19:54:42 +0200
Message-ID: <20190522195442.5bf116ff.olaf@aepfle.de>
References: <20190522145140.12943-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5473312914761159783=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8yeh=TW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hTVS0-00055O-Iv
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 17:54:53 +0000
In-Reply-To: <20190522145140.12943-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============5473312914761159783==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/oH+waEoNBm9PgAjbqR=XoI4"; protocol="application/pgp-signature"

--Sig_/oH+waEoNBm9PgAjbqR=XoI4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 22 May 2019 15:51:40 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Can you give it a try with one of the affected qemu? (qemu-xen-4.10 or
> qemu-xen-4.11)

Thanks for the patch. Unfortunately there is no easy way to trigger the rac=
e.
Is the changed code path also exercised for PV domUs?

Olaf

--Sig_/oH+waEoNBm9PgAjbqR=XoI4
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOWM4gAKCRBdQqD6ppg2
fsB9AJ92UeWtofT9z9voq3oIYrp2GMT5iwCdFcFKnlk6pCjSrrM0mcXSjUvTJLA=
=sksl
-----END PGP SIGNATURE-----

--Sig_/oH+waEoNBm9PgAjbqR=XoI4--


--===============5473312914761159783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5473312914761159783==--
