From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] xen: preserve COMPAT in CFLAGS
Date: Mon, 7 Jan 2019 15:20:16 +0100
Message-ID: <20190107152016.03464ee3.olaf@aepfle.de>
References: <20181026101016.28584-1-olaf@aepfle.de>
 <20181213110525.GY18875@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7399316956085503910=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qx09=PP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ggVlT-0000zT-II
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 14:20:28 +0000
In-Reply-To: <20181213110525.GY18875@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============7399316956085503910==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/PUzmwa.URpv55AFLiE_WGv7"; protocol="application/pgp-signature"

--Sig_/PUzmwa.URpv55AFLiE_WGv7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 Dec 2018 11:05:25 +0000
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Hi,
>=20
> Ian, we have those XC_WANT_COMPAT_* #defines to allow consumers of Xen
> libs be able to use old interfaces. Do you think it's a good idea to
> have this consumers (QEMU here) #undef the flag when it has implemented
> the newer interface?

I think the wording is wrong.

The defines exist to expose existing APIs to software that was not updated =
to use the "latest" API. To me it looks like the undef's are wrong. Even th=
e usage in configure looks bogus, but that is another unrelated thing.

Olaf

--Sig_/PUzmwa.URpv55AFLiE_WGv7
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXDNgIAAKCRBdQqD6ppg2
fu5TAKCMBBZF7gk7Qc47TVW1U8GXd7YH+gCgw8IaNuKH7wgvFE1OgbPlHGXC8XI=
=MkI/
-----END PGP SIGNATURE-----

--Sig_/PUzmwa.URpv55AFLiE_WGv7--


--===============7399316956085503910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7399316956085503910==--
