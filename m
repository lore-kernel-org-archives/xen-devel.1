From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH 1/3] config.sub: Update config.sub to latest
 version
Date: Thu, 16 May 2019 13:44:32 +0200
Message-ID: <20190516134432.3029d52a.olaf@aepfle.de>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
 <20190516113902.GZ2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7076955369073338211=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hREoT-0003tt-Iy
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:44:42 +0000
In-Reply-To: <20190516113902.GZ2798@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============7076955369073338211==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=4RX5jKKcfGsPVsnTZ_Z+J4"; protocol="application/pgp-signature"

--Sig_/=4RX5jKKcfGsPVsnTZ_Z+J4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 12:39:02 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> I guess all I can say at this point is that I haven't done a survey on
> the differences of the autotools shipped in all the distros we care
> about (especially the older ones), so I would err on the safe side to
> keep the in-tree configure script.

Given that all distros for sure did run 'autogen.sh' in a large number
of packages since years it is easy to guess that in general it just works.

And if Xen decides that a certain autoconf version is is the minimum,
configure.ac has a knob for that the minimal required tools version.
As I said, autoools are not runtime dependencies, nor is make|flex|bison.

So, please consider moving these generated files to .gitignore.

Olaf

--Sig_/=4RX5jKKcfGsPVsnTZ_Z+J4
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1NIAAKCRBdQqD6ppg2
fvScAJ0RFYJL8UPWxUkccmZRfaOWWAlQzgCgqDBterXGFwYVKKZafKQz9j+vT58=
=N9Tl
-----END PGP SIGNATURE-----

--Sig_/=4RX5jKKcfGsPVsnTZ_Z+J4--


--===============7076955369073338211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7076955369073338211==--
