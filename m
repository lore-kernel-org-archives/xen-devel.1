From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: fix device_model_version related
 assert
Date: Thu, 16 May 2019 15:36:01 +0200
Message-ID: <20190516153601.45352e5c.olaf@aepfle.de>
References: <20190516125000.23559-1-olaf@aepfle.de>
 <20190516133013.GG2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6729522767722773005=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRGYP-0007lt-9W
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:36:13 +0000
In-Reply-To: <20190516133013.GG2798@zion.uk.xensource.com>
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

--===============6729522767722773005==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/4Wo2taGBqnIPTkUB5pKT7oq"; protocol="application/pgp-signature"

--Sig_/4Wo2taGBqnIPTkUB5pKT7oq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 14:30:13 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Would the following work?

This is not exactly the same because that copy will end up in
libxl__domain_set_device_model, and we are back to square #1.

Olaf

--Sig_/4Wo2taGBqnIPTkUB5pKT7oq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1nQQAKCRBdQqD6ppg2
foUFAJwPOvRUkL7ps28S0X4A364IkuQC2ACfQKFG91IN4yLY1kyq/RBVl7y/gFg=
=YcFb
-----END PGP SIGNATURE-----

--Sig_/4Wo2taGBqnIPTkUB5pKT7oq--


--===============6729522767722773005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6729522767722773005==--
