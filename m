From: Olaf Hering <olaf@aepfle.de>
Subject: Re: libxl assertion failure when creating any kind of
 guest
Date: Wed, 22 May 2019 09:25:44 +0200
Message-ID: <20190522092544.2d7d835f.olaf@aepfle.de>
References: <5CE4F63A0200007800231313@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7562584524095899778=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8yeh=TW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hTLdV-0003U9-8G
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 07:26:05 +0000
In-Reply-To: <5CE4F63A0200007800231313@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============7562584524095899778==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/sQ8m7A.nCf8msNkD/ZrJRvw"; protocol="application/pgp-signature"

--Sig_/sQ8m7A.nCf8msNkD/ZrJRvw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 22 May 2019 01:11:54 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> libxl__domain_build_info_setdefault (gc=3D0x7fffffffdee0, b_info=3D0x7fff=
ffffdb80)
>     at libxl_create.c:143

This is libxl_defbool_val(b_info->device_model_stubdomain).

Due to the lack of a proper way to describe all the dependencies within
libxl I suggest to revert these commits for the time being:

278c64519c libxl: fix libxl_domain_need_memory after 899433f149d
899433f149 libxl: fix migration of PV and PVH domUs with and without qemu
3802ecbaa9 libxl: add helper function to set device_model_version


Olaf

--Sig_/sQ8m7A.nCf8msNkD/ZrJRvw
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOT5eAAKCRBdQqD6ppg2
ftNZAJ43wMY20NHlszA5sZGz0g3YfPf7SQCgxVmf7AiyOLK6xi/I1K/BYZQRSp4=
=vc+W
-----END PGP SIGNATURE-----

--Sig_/sQ8m7A.nCf8msNkD/ZrJRvw--


--===============7562584524095899778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7562584524095899778==--
