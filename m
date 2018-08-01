From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 05/17] libxl: use xenstore for pci
 hotplug qemu-in-linux-stubdom commands
Date: Wed, 1 Aug 2018 18:03:29 +0200
Message-ID: <20180801160329.GX1371@mail-itl>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <48966e6760edb8cfa605879fe47290732edce3da.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpv=PrZbXiOn8WXkHSsbOtUuNMW5J9vUu-pnBCEiorpFLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3590838083358050094=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8sl1=kq=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fktb5-0000xK-8V
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 16:03:35 +0000
In-Reply-To: <CAKf6xpv=PrZbXiOn8WXkHSsbOtUuNMW5J9vUu-pnBCEiorpFLg@mail.gmail.com>
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


--===============3590838083358050094==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W9OqCIgVwV7zeaDP"
Content-Disposition: inline


--W9OqCIgVwV7zeaDP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 10:29:07AM -0400, Jason Andryuk wrote:
> On Mon, Jul 30, 2018 at 11:56 PM, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> > From: Simon Gaiser <simon@invisiblethingslab.com>
> >
> > There is no QMP socket access, re-use the same mechanism as for MiniOS
> > based stubdom.
>=20
> Later you add some QMP support.  Is this preferred because your QMP
> support is unreliable?

For now, until final decision how to connect QMP is made, yes.
This is also somethings we already use Qubes for almost a year, so it
got much more testing.

But if we get stable QMP support, this patch could be dropped.

> <snip>
>=20
> > @@ -1010,7 +1011,15 @@ static int do_pci_add(libxl__gc *gc, uint32_t do=
mid, libxl_device_pci *pcidev, i
> >                  rc =3D qemu_pci_add_xenstore(gc, domid, pcidev);
> >                  break;
> >              case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
> > -                rc =3D libxl__qmp_pci_add(gc, domid, pcidev);
> > +                dm_domid =3D libxl_get_stubdom_id(ctx, domid);
> > +
> > +                if (dm_domid !=3D 0
> > +                    && libxl__stubdomain_version_running(gc, dm_domid)=
 =3D=3D
> > +                         LIBXL_STUBDOMAIN_VERSION_LINUX) {
> > +                    rc =3D qemu_pci_add_xenstore(gc, domid, pcidev);
> > +                } else {
> > +                    rc =3D libxl__qmp_pci_add(gc, domid, pcidev);
> > +                }
>=20
> What about refactoring the whole switch statement to something like:
> bool use_qmp =3D libxl__device_model_version_running(gc, domid)
>                  =3D=3D LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN &&
>                libxl_get_stubdom_id(ctx, domid) =3D=3D 0;
> if (use_qmp) {
>    rc =3D libxl__qmp_pci_add(gc, domid, pcidev);
> } else {
>     rc =3D qemu_pci_add_xenstore(gc, domid, pcidev);
> }

That indeed looks better. But I'd delay touching this patch until
getting some plan on QMP.
>=20
> >                  break;
> >              default:
> >                  return ERROR_INVAL;
>=20
> Regards,
> Jason

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--W9OqCIgVwV7zeaDP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlth2dEACgkQ24/THMrX
1yxLzgf9EjIdciRfa+WnQ3c4VxVdrgsuI7Dzp132izFK1JM1SMk+rb+XwHDTFKix
kA2Il8IKQyw1GYXNulAYmA9OeKw+/nBxPtfbbWUHYa7lpGF9XY2mRuX4Tporagte
UDcvmuFNprLfjm49/VKrNRY1vAvXlto5bsG0CH1ef1wvpFcK1jId0TA1xbE27z1Z
fkDC1vQGU20ZqVUZS/VnXPK46MijPV/o9oK0dA8cytyihvvH5BaWKCAMjq9ccoHa
Wau7bk4cRQZ3SZLgf9SKl9gtlHgTxOsOxaXsUFSm2Nyw+MekN2xvv7Gv6EJupSKw
IDOCvwbqA6WraAD/Sx9FuN2ROeEEZQ==
=kuY7
-----END PGP SIGNATURE-----

--W9OqCIgVwV7zeaDP--


--===============3590838083358050094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3590838083358050094==--
