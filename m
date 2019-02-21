From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 04/17] libxl: Allow running qemu-xen in
 stubdomain
Date: Thu, 21 Feb 2019 18:06:31 +0100
Message-ID: <20190221170631.GT21228@mail-itl>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
 <0158b07cdae7a2a7bb592f11d5df408285efb7c6.1548710973.git-series.marmarek@invisiblethingslab.com>
 <20190221160159.m6x443nmeugmhtnw@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6684724217198294017=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W4UY=Q4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gwrq2-0007j7-Du
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 17:08:46 +0000
In-Reply-To: <20190221160159.m6x443nmeugmhtnw@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6684724217198294017==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+yV1/IgJF0cB7ivg"
Content-Disposition: inline


--+yV1/IgJF0cB7ivg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/17] libxl: Allow running qemu-xen in stubdomain

On Thu, Feb 21, 2019 at 04:01:59PM +0000, Wei Liu wrote:
> On Mon, Jan 28, 2019 at 10:30:21PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Do not prohibit anymore using stubdomain with qemu-xen.
> > To help distingushing MiniOS and Linux stubdomain, add helper inline
> > functions libxl__stubdomain_is_linux() and
> > libxl__stubdomain_is_linux_running(). Those should be used where really
> > the difference is about MiniOS/Linux, not qemu-xen/qemu-xen-traditional.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> >=20
> > ---
> > Changes in v3:
> >  - new patch, instead of "libxl: Add "stubdomain_version" to
> >  domain_build_info"
> >  - helper functions as suggested by Ian Jackson
> > ---
> >  tools/libxl/libxl_create.c   |  9 ---------
> >  tools/libxl/libxl_internal.h | 17 +++++++++++++++++
> >  2 files changed, 17 insertions(+), 9 deletions(-)
> >=20
(...)
> > diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
> > index 459f9bf..b8c698a 100644
> > --- a/tools/libxl/libxl_internal.h
> > +++ b/tools/libxl/libxl_internal.h
> > @@ -2195,6 +2195,23 @@ _hidden int libxl__device_model_version_running(=
libxl__gc *gc, uint32_t domid);
> >    /* Return the system-wide default device model */
> >  _hidden libxl_device_model_version libxl__default_device_model(libxl__=
gc *gc);
> > =20
> > +static inline
> > +bool libxl__stubdomain_is_linux_running(libxl__gc *gc, uint32_t domid)
> > +{
> > +    /* same logic as in libxl__stubdomain_is_linux */
> > +    return libxl__device_model_version_running(gc, domid)
> > +        =3D=3D LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
>=20
> I don't think the logic is accurate. You're precluding running
> qemu-xen in a unikernel as stubdom.
>=20
> I think putting an extra key in xenstore with the underlying platform is
> more desirable.
>=20
> > +}
> > +
> > +static inline
> > +bool libxl__stubdomain_is_linux(libxl_domain_build_info *b_info)
> > +{
> > +    /* right now qemu-tranditional implies MiniOS stubdomain and qemu-=
xen
> > +     * implies Linux stubdomain */
> > +    return libxl_defbool_val(b_info->device_model_stubdomain) &&
> > +        b_info->device_model_version =3D=3D LIBXL_DEVICE_MODEL_VERSION=
_QEMU_XEN;
>=20
> Subsequently you will need a new field in b_info.
>=20
> What do you think?

This is _exactly_ what was in v2 of this patch and Ian suggested to
change it:
https://lists.xenproject.org/archives/html/xen-devel/2018-10/msg01317.html

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+yV1/IgJF0cB7ivg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxu2pYACgkQ24/THMrX
1ywvpQf+LGVlGX3re190WuVBV5F2Xorwohq5F6L11Kq0Rww4KMtKHPjoRImiPGPG
OdAZoEH3vLymqqCr6zV3gZE3XO8Sj25hxWe50LRBGwcaDQWeSJfzGtSMn0ARRqwb
BAtcIfW5hHPwNJDu9gXkNYy94g04G8fh+jcnzwgw9Cze+XoWUoZNBFv7mANi8q8J
x/7hm5kKJlOflUu3F2XKqqnwmbscfox2koKvJM3o+NMYpXOeX328lw7akYH07JVe
i7fPfzGRjE88VUUyXg+E7tGi5DNvgyo8ey78Xxt225FaevwlriVx+XwebrzkIlV3
Jfjgv/uLqbrC+N8jQf33SP6Avf0tFw==
=UYFp
-----END PGP SIGNATURE-----

--+yV1/IgJF0cB7ivg--


--===============6684724217198294017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6684724217198294017==--
