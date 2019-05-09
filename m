From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Thu, 9 May 2019 17:14:41 +0200
Message-ID: <20190509171441.6b611c34.olaf@aepfle.de>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190509155621.20698a9f.olaf@aepfle.de>
 <20190509162956.23c4d6ab.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8831462029988955631=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vYVB=TJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hOkl5-0005GB-Nc
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 15:14:56 +0000
In-Reply-To: <20190509162956.23c4d6ab.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8831462029988955631==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/RvbN/vsYQe3FDrtvZXwu1K2"; protocol="application/pgp-signature"

--Sig_/RvbN/vsYQe3FDrtvZXwu1K2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 9 May 2019 16:29:56 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Are you saying the current users of libxl__need_xenpv_qemu (libxl__dm_che=
ck_start,
> spawn_stub_launch_dm and domcreate_launch_dm) do not only run in dom0, but
> also somewhere else?

And if it is indeed running somewhere else, would libxl__get_domain_configu=
ration
provide the content of b_info.device_model_version?
At least in my testing /var/lib/xen/userdata-d.domid.uuid.libxl-json has no=
 such
info in the "b_info" field.

Olaf

--Sig_/RvbN/vsYQe3FDrtvZXwu1K2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNRD4QAKCRBdQqD6ppg2
fggtAKCQxyAd64V3bvUGJXhB0laBITe0GQCfd2bLugl/ub0UZ9cYG9Yr0f1x3u4=
=GGNs
-----END PGP SIGNATURE-----

--Sig_/RvbN/vsYQe3FDrtvZXwu1K2--


--===============8831462029988955631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8831462029988955631==--
