From: Olaf Hering <olaf@aepfle.de>
Subject: Re: Unhandle NONE type device model broke QDISK backend
Date: Tue, 21 May 2019 16:58:18 +0200
Message-ID: <20190521165818.6f13af3f.olaf@aepfle.de>
References: <20190521143702.GH1846@zion.uk.xensource.com>
 <20190521164122.187e51f6.olaf@aepfle.de>
 <20190521144315.GI1846@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5454517079275220026=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dk3M=TV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hT6Di-0002u7-VQ
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:58:27 +0000
In-Reply-To: <20190521144315.GI1846@zion.uk.xensource.com>
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

--===============5454517079275220026==
Content-Type: multipart/signed; boundary="Sig_/CPnhn1GjgabzNBpxRxjcS2B";
 protocol="application/pgp-signature"; micalg=pgp-sha1

--Sig_/CPnhn1GjgabzNBpxRxjcS2B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 21 May 2019 15:43:15 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Yeah, that's indeed strange. Thanks for having a look.

Is the used domU.cfg available? I think In my testing disk=3D[] had backend=
=3Dqdisk.

Olaf

--Sig_/CPnhn1GjgabzNBpxRxjcS2B
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOQSCgAKCRBdQqD6ppg2
ftLvAJoDnJ8SxqE8P/xOY7+yeNkz75QXnACgtNS1mvXmKlTaFamMdGsiBfonDWg=
=L24J
-----END PGP SIGNATURE-----

--Sig_/CPnhn1GjgabzNBpxRxjcS2B--


--===============5454517079275220026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5454517079275220026==--
