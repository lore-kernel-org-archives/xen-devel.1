From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] tools/firmware: update OVMF Makefile
Date: Mon, 14 Jan 2019 12:48:52 +0100
Message-ID: <20190114124852.3d91d25f.olaf@aepfle.de>
References: <20181128174333.15672-1-wei.liu2@citrix.com>
 <20190113201744.GA11328@aepfle.de>
 <20190114112857.dxmlt7noy53asro5@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0621786593975068451=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EyCT=PW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gj0jl-0005ts-5J
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 11:49:01 +0000
In-Reply-To: <20190114112857.dxmlt7noy53asro5@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0621786593975068451==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/yJJILitWK1fDqxyhzusun_x"; protocol="application/pgp-signature"

--Sig_/yJJILitWK1fDqxyhzusun_x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 14 Jan 2019 11:28:57 +0000
schrieb Wei Liu <wei.liu2@citrix.com>:

> Are you saying that the breakage is shown when you put a snapshot of
> ovmf under xen.git? How does ovmf distribute their snapshot? How is that
> generated? Does it contain snapshots of submodules it needs already?

I export all required sources recursively and store them in the appropriate=
 directories.
qemu itself requires only the keycodemapdb, it does no download-on-demand.

And now that I had a chance to look at the sources, qemu-xen-dir-find calls=
 a custom script that will do nothing if the <dir>-remote already exists.

I think instead of changing the custom Makefile, the submodules have to be =
handled in git-checkout.sh which is invoked by ovmf-dir.
If I remember correctly, when keycodemapdb became a hard requirement nothin=
g in xen.git was adjusted.

Olaf

--Sig_/yJJILitWK1fDqxyhzusun_x
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXDx3JAAKCRBdQqD6ppg2
fhLLAKCeJEBBenwyvZ/VgUlEfnSwOPisEgCgzTbN4iWI26uJVAXgOKZldc0+f9I=
=y1F/
-----END PGP SIGNATURE-----

--Sig_/yJJILitWK1fDqxyhzusun_x--


--===============0621786593975068451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0621786593975068451==--
