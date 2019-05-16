From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: fix device_model_version related
 assert
Date: Thu, 16 May 2019 17:09:19 +0200
Message-ID: <20190516170919.07393e95.olaf@aepfle.de>
References: <20190516125000.23559-1-olaf@aepfle.de>
 <20190516133013.GG2798@zion.uk.xensource.com>
 <20190516153601.45352e5c.olaf@aepfle.de>
 <20190516134653.GI2798@zion.uk.xensource.com>
 <20190516155455.3a97d2fb.olaf@aepfle.de>
 <20190516150355.GJ2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5535046229367981717=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRI0h-0000is-TE
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:09:32 +0000
In-Reply-To: <20190516150355.GJ2798@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============5535046229367981717==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/0FL8uAyhIrP06+CoEGqk55Q"; protocol="application/pgp-signature"

--Sig_/0FL8uAyhIrP06+CoEGqk55Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 16:03:55 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Does this make sense?

Sure, I was looking at the wrong function.
Doing it within libxl_domain_need_memory will certainly work.
Thanks!

Olaf

--Sig_/0FL8uAyhIrP06+CoEGqk55Q
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN19HwAKCRBdQqD6ppg2
fthHAJwOh5WBQAuLmcEkxBfPZntW/yR30ACfYND5NDjM4qwBWGCt+GHAJiZYx50=
=UQ57
-----END PGP SIGNATURE-----

--Sig_/0FL8uAyhIrP06+CoEGqk55Q--


--===============5535046229367981717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5535046229367981717==--
