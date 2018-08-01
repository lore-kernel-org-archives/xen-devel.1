From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 06/17] libxl: create vkb device only for
 guests with graphics output
Date: Wed, 1 Aug 2018 23:45:06 +0200
Message-ID: <20180801214506.GY1371@mail-itl>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <767b0474eebe5317b8d0a4d225043172172d0be7.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpsU0WZnjLVMQ5iqW1Z4sjQHx6WkVygBE-d4WCLJ6MTTww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7349695171011248292=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8sl1=kq=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fkyvg-00014p-P5
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 21:45:13 +0000
In-Reply-To: <CAKf6xpsU0WZnjLVMQ5iqW1Z4sjQHx6WkVygBE-d4WCLJ6MTTww@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============7349695171011248292==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uOSyunOxC/kgwQjk"
Content-Disposition: inline


--uOSyunOxC/kgwQjk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 10:30:14AM -0400, Jason Andryuk wrote:
> On Mon, Jul 30, 2018 at 11:56 PM, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> > The forced vkb device is meant for better performance of qemu access
> > (at least according to ebbd2561b4cefb299f0f68a88b2788504223de18 "libxl:
> > Add a vkbd frontend/backend pair for HVM guests"), which isn't used if
> > there is no configured channel to actually access that keyboard.
> >
> > One can still add vkb device manually if needed.
> >
> > This is continuation of b053f0c4c9e533f3d97837cf897eb920b8355ed3 "libxl=
: do
> > not start dom0 qemu for stubdomain when not needed".
>=20
> Prior to this change, was a dom0 qemu started for these entries?

AFAIR not for this device alone (unless some other condition in
libxl__need_xenpv_qemu triggers it). But when it is created but backend
not launched, it cause timeout on frontend side.

> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--uOSyunOxC/kgwQjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltiKeIACgkQ24/THMrX
1yxdIQf7BE8NbOqO8xud7pxSmc3njeHN9yia5BcHcSkSmmugZnQB2gO/BwhPlv48
12s6to2AS5E15PGwwKAsgmSLTtHTm8c+OtqsfatMf2YKjSQNv5AaOWaafHlS4RbF
pCgCBI0NAcpmv/XsJeENpjKJbAxGQqaL5k7G9ItSbJfZygUiEDSO8L+0Fn2/5mCs
yzgkFFvHu2SVBfGGl6gILt+xX663dPbwGGSiMdBB02/x2rf+xRGXDhPE1UAtckWg
sFM5T8PsuF53HCqO7f6/vhkCdRSTXpJKYxnTCD/L9o7uYGiwJPrjG9aU1yD/m3Et
DZgIoOuCuAqSrsgWYLDPOQqW+b1K8A==
=gnbg
-----END PGP SIGNATURE-----

--uOSyunOxC/kgwQjk--


--===============7349695171011248292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7349695171011248292==--
