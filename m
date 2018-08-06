From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: libxl__build_hvm type confusion
Date: Mon, 6 Aug 2018 13:37:10 +0200
Message-ID: <20180806113710.GO1371@mail-itl>
References: <20180804182518.GN1371@mail-itl>
 <20180806091649.5a3tm7t4q54kzkgx@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6296790222721661358=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u4cs=kv=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fmdp5-0001bo-5j
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 11:37:15 +0000
In-Reply-To: <20180806091649.5a3tm7t4q54kzkgx@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============6296790222721661358==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qMrVIIv05ewzrSl/"
Content-Disposition: inline


--qMrVIIv05ewzrSl/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 06, 2018 at 11:16:49AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Sat, Aug 04, 2018 at 08:25:18PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > libxl__domain_build calls libxl__build_hvm for both
> > LIBXL_DOMAIN_TYPE_HVM and LIBXL_DOMAIN_TYPE_PVH, but libxl__build_hvm
> > uses fields from b_info->u.hvm, which looks like invalid thing to do.
> > Should those field be moved out of that union?
>=20
> Depends on the fields and whether they are relevant for PVH or not.
> Either they are moved out of the HVM struct and shared between PVH and
> HVM if they are relevant, or it's usage it's fully limited to domain
> type HVM.

In this particular case it is about:
 - u.hvm.mmio_hole_memkb
 - u.hvm.rdm_mem_boundary_memkb

Not sure if those are relevant for PVH

> I guess this mostly works because those HVM fields are not aliased to
> any of the fields of the PVH struct and they are all 0 which happens
> to be the correct value for PVH.

Since u.pvh is very small, that's probably the case.

> > Additionally I think some asserts in every function using b_info->u
> > would be a good idea.
>=20
> Sure, I'm all in for adding more checks!
>=20
> Thanks, Roger.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--qMrVIIv05ewzrSl/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltoMuQACgkQ24/THMrX
1ywRUQf+JCKBHD8hmrXpUeEBO8ao5nxX6OMH+mfCXxdOjtqc1/H2aHipVq0wnvmY
FmWlnHndmUQnuYJB5VCRGMUkROzSa9IhATRCdDng26ggxhaSTCMP+zwCv/2ZrNtN
5A/1n9w9FSTBteCmZAp9l/Jk3ODs7u5F4VixW4pwViA1R+a4eYrk35AAcPhcBjTn
6zKnezqE6Pf8xECu3jfxhqXuwrbRHzS5xTiSg/LqLaaNsPCyIA2Dt/2rJg2AbYSl
RGqrpJijsQVsmjp4FEQF228ifovHhJ7ZjgLhF6vRN5881Y+WL0creskA0qqyKqta
tN/ce8Aj7Ithj2pf7zFafo78iVtyQA==
=sGDu
-----END PGP SIGNATURE-----

--qMrVIIv05ewzrSl/--


--===============6296790222721661358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6296790222721661358==--
