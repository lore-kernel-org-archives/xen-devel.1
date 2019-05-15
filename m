From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: add helper function to set
 device_model_version
Date: Wed, 15 May 2019 11:13:34 +0200
Message-ID: <20190515111334.3804ebb3.olaf@aepfle.de>
References: <20190514072741.11760-1-olaf@aepfle.de>
 <20190514101856.6otetd56n72t42bm@Air-de-Roger>
 <20190514123118.6c9ecbf7.olaf@aepfle.de>
 <20190514103907.2fc6pf7p64m3c7fh@Air-de-Roger>
 <20190514143227.GG2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3518132398757661120=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YIY1=TP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQpys-0007Z1-0Z
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:13:46 +0000
In-Reply-To: <20190514143227.GG2798@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3518132398757661120==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/gSUegA.XTVd5PNyTVvHcEni"; protocol="application/pgp-signature"

--Sig_/gSUegA.XTVd5PNyTVvHcEni
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 14 May 2019 15:32:27 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Olaf, if you can provide me with an updated version of the commit
> message I can fold that in while committing. No need to resend this
> patch.

Maybe just append this paragraph?

The upcoming change needs a full libxl_domain_config, and the existing
libxl__domain_build_info_setdefault has just a libxl_domain_build_info=20
to work with.

Olaf

--Sig_/gSUegA.XTVd5PNyTVvHcEni
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNvYPgAKCRBdQqD6ppg2
fm5yAJ4n0Rfv9KW3rf8FHAlX7K5MhjlE2wCfQv9ny1/AlPW9hHm/8dgGZ6a3ELE=
=9xzr
-----END PGP SIGNATURE-----

--Sig_/gSUegA.XTVd5PNyTVvHcEni--


--===============3518132398757661120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3518132398757661120==--
