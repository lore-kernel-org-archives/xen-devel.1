From: Olaf Hering <olaf@aepfle.de>
Subject: Re: bogus libxl error handling in
 domcreate_bootloader_done
Date: Mon, 4 Mar 2019 17:17:06 +0100
Message-ID: <20190304171706.28a892b2.olaf@aepfle.de>
References: <20190228141718.7740e706.olaf@aepfle.de>
 <20190228172159.0f5d0e31.olaf@aepfle.de>
 <CAFLBxZZr2ZA58HBUx0CiRHjJtYtMXRcAZ3avAcTr+92ihD04Sw@mail.gmail.com>
 <20190304145401.hnrpjxf442kcfcku@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5072624891265212707=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3Eqj=RH=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h0qHH-0005Og-SE
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 16:17:20 +0000
In-Reply-To: <20190304145401.hnrpjxf442kcfcku@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <dunlapg@umich.edu>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============5072624891265212707==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/tm+E4N6mfdQLK/jHUP1A8e9"; protocol="application/pgp-signature"

--Sig_/tm+E4N6mfdQLK/jHUP1A8e9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 4 Mar 2019 14:54:01 +0000
schrieb Wei Liu <wei.liu2@citrix.com>:

> > > +    /* Prepare environment for domcreate_stream_done */
> > > +    dcs->srs.ao =3D ao;
> > > +    dcs->srs.dcs =3D dcs;
> > > +    dcs->srs.fd =3D -1;
> As far as I can tell only srs.dcs needs to be initialised before hand.

fd needs to be tweaked as well to prevent the "soft reset" code path.
But as I notice just now, my change touches the wrong fd. restore_fd
is apparently already set. So yes, only dcs is required.

But is domcreate_bootloader_done the correct place to initialize it?

Olaf

--Sig_/tm+E4N6mfdQLK/jHUP1A8e9
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXH1PggAKCRBdQqD6ppg2
fpHUAJ9t7cPqzsi7SL1ZC0jcidgbnetEswCeOS7E9EFaps0p/BgWBYHrUQD21Pk=
=LjFS
-----END PGP SIGNATURE-----

--Sig_/tm+E4N6mfdQLK/jHUP1A8e9--


--===============5072624891265212707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5072624891265212707==--
