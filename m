From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: libxl__build_hvm type confusion
Date: Sat, 4 Aug 2018 20:25:18 +0200
Message-ID: <20180804182518.GN1371@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6415758100016960133=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wiwb=kt=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fm1Ex-0004r6-Hv
 for xen-devel@lists.xenproject.org; Sat, 04 Aug 2018 18:25:23 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id DAFBC21F30
 for <xen-devel@lists.xenproject.org>; Sat,  4 Aug 2018 14:25:21 -0400 (EDT)
Received: from mail-itl (ip5b40bfaa.dynamic.kabel-deutschland.de
 [91.64.191.170])
 by mail.messagingengine.com (Postfix) with ESMTPA id 13C39E4626
 for <xen-devel@lists.xenproject.org>; Sat,  4 Aug 2018 14:25:20 -0400 (EDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============6415758100016960133==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pv9UK6dtKDJISKO7"
Content-Disposition: inline


--pv9UK6dtKDJISKO7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

libxl__domain_build calls libxl__build_hvm for both
LIBXL_DOMAIN_TYPE_HVM and LIBXL_DOMAIN_TYPE_PVH, but libxl__build_hvm
uses fields from b_info->u.hvm, which looks like invalid thing to do.
Should those field be moved out of that union?
Additionally I think some asserts in every function using b_info->u
would be a good idea.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--pv9UK6dtKDJISKO7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltl744ACgkQ24/THMrX
1yyM3Qf+J0jb5J1QVfGVGuhqm96pSobcYvjIqk4vpaVoiQG4YcMGAvHZ3c3L995n
bjWCDaM6B3QejqmPDWcGVxFAgeePq56btVigI0yI2/l9qLp9ptlVyjYhaYP7nHr2
zN+KLainI8uy5NVI0LgZvyrJjDFPYb7kFu8aumMbmy6gM8gmo7IXnGq/ql2l7OD1
W3Z+4XOfJEJBktvyB9gXPRTELBMFikV7YLbUmeCRnv/vpoREi+s75zQms4Sw9pf/
c1Vdvp/3NGwE2pXshWVcbQ1Bm3WQsu81G8VA46ixWmzjYM01mVJEZEP+1OcNrnKb
7MIwYOPpkUYmSBgwYIdi33TqfsstuQ==
=f2Zy
-----END PGP SIGNATURE-----

--pv9UK6dtKDJISKO7--


--===============6415758100016960133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6415758100016960133==--
