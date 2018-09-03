From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 02/17] libxl: Add
 "stubdomain_version" to domain_build_info.
Date: Tue, 4 Sep 2018 00:25:27 +0200
Message-ID: <20180903222527.GB1353@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <7c30330d13abc993594a264e3c7c61693c9fc316.1533608042.git-series.marmarek@invisiblethingslab.com>
 <20180809092541.u6xwmsk2egugwbu6@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8963067552779257199=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=frgq=lr=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fwxHp-0000lL-0T
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 22:25:33 +0000
In-Reply-To: <20180809092541.u6xwmsk2egugwbu6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org


--===============8963067552779257199==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 09, 2018 at 10:25:42AM +0100, Wei Liu wrote:
> On Tue, Aug 07, 2018 at 04:16:07AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > From: Eric Shelton <eshelton@pobox.com>
> >=20
> > This enum gives the ability to select between a MiniOS-based QEMU
> > traditional stub domain and a Linux-based QEMU upstream stub domain.  To
> > use the Linux-based stubdomain, the following two lines should be
> > included in the appropriate xl.cfg file:
> >=20
> > device_model_version=3D"qemu-xen"
> > device_model_stubdomain_override=3D1
> >=20
> > To use the MiniOS-based stubdomain, the following is used instead:
> >=20
> > device_model_version=3D"qemu-xen-traditional"
> > device_model_stubdomain_override=3D1
>=20
>=20
> Where is stubomd_version=3D ? Don't you want to expose such option in xl.=
cfg?

Actually, with patch 04/17 you can set explicit stubdomain path, so
stubdomain_version is only another way (redundant to
device_model_version) to signal what protocol to communicate with
stubdomain should be used. Right now each qemu version have only one
stubdomain protocol:
 - qemu-xen-traditional - "mini os" one
 - qemu-xen - "linux" one - see cover letter

Anyway, I can add stubdomain_version to 08/17 "xl: add stubdomain
related options to xl config parser" patch.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAluNtNcACgkQ24/THMrX
1yzsiwf/RGq1Yodx/ZULvTzoHov20p4sueU+Zr+AC6U2+t194IWhYu2765sNq5wT
Bxglwm3Dft8A+PnSBXY14Ib42NRBkPG3sDEcmGEUCvE0/aJXofk7QStrHnbEnfNj
DFAIufyraNcQ3Bq4hrTzfQzfb87h5yEieZdg32ms104UecqT4940/p5I/UkzPmkC
NnvGcPUA2/aAIDQ+pkA4KcCH9/7KcpoN/yw+ZmohV3vhIMeRlDpWbA7b7YK7o77j
Ve8WWkLCUJecIQ1IYPtQ++a6bQYIHFgzNnqy9Q3ORMQ0TvYg9rtHeeRDvz08upkp
eo5gYDQiBFXX2yK3a3r7fSd8ymNY0A==
=d7Ja
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--


--===============8963067552779257199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8963067552779257199==--
