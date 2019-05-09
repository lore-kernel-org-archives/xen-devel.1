From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Thu, 9 May 2019 15:56:21 +0200
Message-ID: <20190509155621.20698a9f.olaf@aepfle.de>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8959549798593108345=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vYVB=TJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hOjXJ-0007IE-CX
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:56:38 +0000
In-Reply-To: <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
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

--===============8959549798593108345==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=4JdR3O0_C/35XrYDUnIa4_"; protocol="application/pgp-signature"

--Sig_/=4JdR3O0_C/35XrYDUnIa4_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 3 May 2019 13:04:11 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> I think the above call is wrong, libxl__need_xenpv_qemu expects to get
> the domid of the toolstack domain (ie: the domain running this code),
> not the domain being created.

So, how do I actually test such setups? It seems a driver domain is
required. According to xl-disk-configuration(5) I may need to specify
backend=3D$domU. Is there some guide how to configure such thing?


Olaf

--Sig_/=4JdR3O0_C/35XrYDUnIa4_
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNQxhQAKCRBdQqD6ppg2
fm3zAJ9cn1CdIBGySLyTsUW2sQPnBDHnEACeMEcBXSCM4eE8CUxNpaef6K8T6Gg=
=59AV
-----END PGP SIGNATURE-----

--Sig_/=4JdR3O0_C/35XrYDUnIa4_--


--===============8959549798593108345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8959549798593108345==--
