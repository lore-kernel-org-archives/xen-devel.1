From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/gdbsx: use inttypes.h instead of
 custom macros
Date: Wed, 1 Aug 2018 12:49:37 +0200
Message-ID: <20180801104937.GU1371@mail-itl>
References: <20180731201905.23112-1-marmarek@invisiblethingslab.com>
 <20180801091917.r4wlgb33iusmmjco@citrix.com>
 <20180801093323.pxfwfpa4lgud545a@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1305579783263099184=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8sl1=kq=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fkohN-0001iK-8A
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 10:49:45 +0000
In-Reply-To: <20180801093323.pxfwfpa4lgud545a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1305579783263099184==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="332CIdRmeZdukXAd"
Content-Disposition: inline


--332CIdRmeZdukXAd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 10:33:23AM +0100, Wei Liu wrote:
> On Wed, Aug 01, 2018 at 10:19:17AM +0100, Wei Liu wrote:
> > On Tue, Jul 31, 2018 at 10:19:05PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > > ---
> > > This is on top of "tools/gdbsx: fix 'g' packet response for 64bit
> > > guests" patch.
> > > ---
> > >  tools/debugger/gdbsx/gx/gx_local.c  | 17 +++++-----
> > >  tools/debugger/gdbsx/gx/gx_main.c   |  5 +--
> > >  tools/debugger/gdbsx/xg/xg_public.h |  8 -----
> > >  tools/xenstore/xenstore_client.c    | 51 +++++++++++++++++++++++----=
--
> >=20
> > It seems that you accidentally added a xenstore file.
>=20
> No need to resend. I have fixed up this patch for you.

Thanks. I should read what git send-email shows me more carefully...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--332CIdRmeZdukXAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlthkEEACgkQ24/THMrX
1yyr9Qf+MvspraoS1biJUk3d5dAmv7sY3jrWbgWW3rXKJykori3PaLKK1rY5qhvG
ogAR4ODem2/+RKMoHnQQmgN7ZRKhcN4kNOxHAhsVkpvQt1CxMTT+cn6JLQp9WAd0
7glVuJtCLet9MnmfI5iuqQYX4ABnKECfjy3d/ALMahAIIvnZcoZ/ukJLtH5QoGdI
JOmlEWcRVnibc+9mI5bzzWXNalNOrU0KK57Guc8Zfdf/vNwbzqBdEYdd/u2m0bHV
2wYfcSWr8WNjo31vnTHHDXFiAnBBtmNua+aN3YU15g4EwOOV4zodtwxVZ3NJQngQ
+PbbxGniWiasrqYSv54M7i9Ct9XLAA==
=hM7X
-----END PGP SIGNATURE-----

--332CIdRmeZdukXAd--


--===============1305579783263099184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1305579783263099184==--
