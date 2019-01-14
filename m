From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] tools/firmware: update OVMF Makefile
Date: Mon, 14 Jan 2019 18:27:44 +0100
Message-ID: <20190114182744.42296177.olaf@aepfle.de>
References: <20181128174333.15672-1-wei.liu2@citrix.com>
 <20190113201744.GA11328@aepfle.de>
 <20190114112857.dxmlt7noy53asro5@zion.uk.xensource.com>
 <20190114124852.3d91d25f.olaf@aepfle.de>
 <20190114171156.GB1271@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3404726413175629103=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EyCT=PW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gj61r-00059X-86
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 17:28:03 +0000
In-Reply-To: <20190114171156.GB1271@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3404726413175629103==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/n8ZLJqtGQHp1ktHwBocr0y8"; protocol="application/pgp-signature"

--Sig_/n8ZLJqtGQHp1ktHwBocr0y8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 14 Jan 2019 17:11:56 +0000
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> I think it's fine to keep the current `submodule update` call where it
> is. We could just make it check that it's an actual git worktree by
> checking for the presence of ".git" (file or directory) before executing
> git.
>=20
> Would that be good enough?

Maybe. Whatever works with env WGET/GIT=3D/bin/false ./configure $options.

Olaf

--Sig_/n8ZLJqtGQHp1ktHwBocr0y8
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXDzGkAAKCRBdQqD6ppg2
fpPNAKDJeO7sT0JaYJA/kEWnhO5zgREXxACfZCgV7YWTM+x4CQPzL0O21lMMaZU=
=Jhe0
-----END PGP SIGNATURE-----

--Sig_/n8ZLJqtGQHp1ktHwBocr0y8--


--===============3404726413175629103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3404726413175629103==--
