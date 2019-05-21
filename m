From: Olaf Hering <olaf@aepfle.de>
Subject: Re: Unhandle NONE type device model broke QDISK backend
Date: Tue, 21 May 2019 16:41:22 +0200
Message-ID: <20190521164122.187e51f6.olaf@aepfle.de>
References: <20190521143702.GH1846@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2615390872009050347=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dk3M=TV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hT5xL-0001jO-4r
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:41:31 +0000
In-Reply-To: <20190521143702.GH1846@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============2615390872009050347==
Content-Type: multipart/signed; boundary="Sig_/577UeSupctbd4OY/M6=PxHO";
 protocol="application/pgp-signature"; micalg=pgp-sha1

--Sig_/577UeSupctbd4OY/M6=PxHO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 21 May 2019 15:37:02 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> bxl: debug: libxl_device.c:380:libxl__device_disk_set_backend: Disk vdev=
=3Dxvda spec.backend=3Dqdisk
> libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 1:=
backend_kind 3, no need to execute scripts

I will check why qdisk does not trigger QEMU_XEN.

Olaf

--Sig_/577UeSupctbd4OY/M6=PxHO
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOQOEwAKCRBdQqD6ppg2
fnwlAJ44eksUmzZ1fKMY9rmDRjeuGheBFgCgsZwnTRdE+xoN/+FlAxo6VNl5LiM=
=Q9u+
-----END PGP SIGNATURE-----

--Sig_/577UeSupctbd4OY/M6=PxHO--


--===============2615390872009050347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2615390872009050347==--
