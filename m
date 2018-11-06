From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 8/8] tools/libvchan:
 libxenvchan_client_init: use ENOENT for no server
Date: Tue, 6 Nov 2018 13:15:55 +0100
Message-ID: <20181106121555.GU1638@mail-itl>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
 <20181102170113.11646-9-ian.jackson@eu.citrix.com>
 <20181106100016.hawdyzngqvo3zi73@zion.uk.xensource.com>
 <23521.32491.467037.246289@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5237499233695039124=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ydkh=nr=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gK0H7-0007iL-K2
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 12:16:05 +0000
In-Reply-To: <23521.32491.467037.246289@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5237499233695039124==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a+0P3INHs7aeI7wh"
Content-Disposition: inline


--a+0P3INHs7aeI7wh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 06, 2018 at 11:45:47AM +0000, Ian Jackson wrote:
> Wei Liu writes ("Re: [PATCH 8/8] tools/libvchan: libxenvchan_client_init:=
 use ENOENT for no server"):
> > On Fri, Nov 02, 2018 at 05:01:13PM +0000, Ian Jackson wrote:
> > > * Promise that we will set errno to ENOENT if the server is not
> > >   yet set up.
> > > * Arrange that all ENOENT returns other than from the read of ring-ref
> > >   are turned into EIO, logging when we do so.
> >=20
> > This sounds reasonable to me, but I would like to hear from Marek that
> > this doesn't break Qubes.
>=20
> Right.  Marek, this series was intended to help with vchan for qmp.
> But obviously I don't want to break anything else.  I don't think this
> should break anything but I would appreciate a review or at least an
> opinion...

Does xentoollog require any explicit configuration? If yes, that would
break non-xen-tools users (including Qubes). Otherwise looks good.
Thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--a+0P3INHs7aeI7wh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvhhf4ACgkQ24/THMrX
1yxt8Af/bIxINav/jEFc3nYVbhgilcNdraXl+BywuBqvo30zeiNeRJeK+OhW2hIb
G1leL0CA8OKhzz+tq5055+Lxm0KF64TJ6wuZn1cgUWGt59ojLvQCfdkVvqzTH8Y7
AYUaXQzsC+7KsSzl20ti6MbJkgpA0/7k9Y9aGvfkXoL4JvdJTHf1Vh8FcwoySniG
Bs4yr2KLBtU2E5zDPl/R6sIHIkUBzgOg8aRR1FguaLE0LKv/OydcgLfWtyc2x+H1
CZE7Yw2NcHCCAIewWSruN2CnnOmVbeNFyu5LtTpt/bFIEPC81AvUOZA1DjwBNruW
wGQagR470jtTB4kxDFbdWZAn2MX0iA==
=qV4/
-----END PGP SIGNATURE-----

--a+0P3INHs7aeI7wh--


--===============5237499233695039124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5237499233695039124==--
