From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v5] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Tue, 14 May 2019 16:44:19 +0200
Message-ID: <20190514164419.23f9f545.olaf@aepfle.de>
References: <20190514080558.14540-1-olaf@aepfle.de>
 <20190514101452.10c40b6e.olaf@aepfle.de>
 <20190514143855.GH2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3687344054943145547=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZE1V=TO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQYfP-00023s-K2
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:44:32 +0000
In-Reply-To: <20190514143855.GH2798@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3687344054943145547==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/arOAbLS+/q._=r=CZBn=Sl0"; protocol="application/pgp-signature"

--Sig_/arOAbLS+/q._=r=CZBn=Sl0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 14 May 2019 15:38:55 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> > While it is easy for the resume path, doing the same in the suspend path
> > needs more changes. libxl__domain_suspend_device_model would need to re=
ceive
> > the callback and set it if a device model is active. =20
>=20
> What do you mean here? Can't you handle the NONE case just like you do
> in the resume function?

It means calling libxl__domain_suspend_device_model unconditionally, and
let that function decide what to do. Maybe there is no downside to set the
callback unconditionally, I will check that.

Olaf

--Sig_/arOAbLS+/q._=r=CZBn=Sl0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNrUQwAKCRBdQqD6ppg2
fmy1AJ0boCtGS9MWl4atTTKOmLqxeFlrcACgo6CG+mrp+QzCYCMjzLXBE5fvSpk=
=EsbU
-----END PGP SIGNATURE-----

--Sig_/arOAbLS+/q._=r=CZBn=Sl0--


--===============3687344054943145547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3687344054943145547==--
