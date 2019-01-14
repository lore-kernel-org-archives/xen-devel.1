From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] tools/firmware: update OVMF Makefile
Date: Mon, 14 Jan 2019 20:22:49 +0100
Message-ID: <20190114202249.7cd3a508.olaf@aepfle.de>
References: <20181128174333.15672-1-wei.liu2@citrix.com>
 <20190113201744.GA11328@aepfle.de>
 <20190114112857.dxmlt7noy53asro5@zion.uk.xensource.com>
 <20190114124852.3d91d25f.olaf@aepfle.de>
 <20190114171156.GB1271@perard.uk.xensource.com>
 <20190114182744.42296177.olaf@aepfle.de>
 <20190114174457.mlrzxcjtyklim5gc@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1510375512084002995=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EyCT=PW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gj7p6-0006Ue-Ty
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 19:23:01 +0000
In-Reply-To: <20190114174457.mlrzxcjtyklim5gc@zion.uk.xensource.com>
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

--===============1510375512084002995==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=r/GlE2zGq.bHGhsxMkbncx"; protocol="application/pgp-signature"

--Sig_/=r/GlE2zGq.bHGhsxMkbncx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 14 Jan 2019 17:44:57 +0000
schrieb Wei Liu <wei.liu2@citrix.com>:

>   -       $(GIT) submodule update --init --recursive
>   +       [ -d .git ] && $(GIT) submodule update --init --recursive

This syntax fails, but this works for me:

	if test -d .git ; then $(GIT) submodule update --init --recursive ; fi


Olaf

--Sig_/=r/GlE2zGq.bHGhsxMkbncx
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXDzhiQAKCRBdQqD6ppg2
foGcAKChNsX0ja6yuiEUdzW7CF4VnxE2cgCgq+beUrM/o4cJonUR66MG3rpm5s8=
=bIsP
-----END PGP SIGNATURE-----

--Sig_/=r/GlE2zGq.bHGhsxMkbncx--


--===============1510375512084002995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1510375512084002995==--
