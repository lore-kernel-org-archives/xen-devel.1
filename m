From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 2/4] libxl: attach PCI device to qemu
 only after setting pciback/pcifront
Date: Sat, 26 Jan 2019 03:24:20 +0100
Message-ID: <20190126022420.GN1429@mail-itl>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <43fe7e5e8f5d0d81995188d40ba756090d80f656.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190117102959.4yghre2psqjsi3x6@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0031887663901672534=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/WFd=QC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gnDdy-00056D-DD
 for xen-devel@lists.xenproject.org; Sat, 26 Jan 2019 02:24:26 +0000
In-Reply-To: <20190117102959.4yghre2psqjsi3x6@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0031887663901672534==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lymARMIdFDV9dylT"
Content-Disposition: inline


--lymARMIdFDV9dylT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v2 2/4] libxl: attach PCI device to qemu only
 after setting pciback/pcifront

On Thu, Jan 17, 2019 at 11:29:59AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 15, 2019 at 04:36:29PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > When qemu is running in stubdomain, handling "pci-ins" command will fail
> > if pcifront is not initialized already. Fix this by sending such command
> > only after confirming that pciback/front is running.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v2:
> > - Fixed code style since previous version.
> > ---
> >  tools/libxl/libxl_pci.c |  9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> > index 3b6b23c..1bde537 100644
> > --- a/tools/libxl/libxl_pci.c
> > +++ b/tools/libxl/libxl_pci.c
> > @@ -1191,6 +1191,7 @@ int libxl__device_pci_add(libxl__gc *gc, uint32_t=
 domid, libxl_device_pci *pcide
> >  {
> >      libxl_ctx *ctx =3D libxl__gc_owner(gc);
> >      unsigned int orig_vdev, pfunc_mask;
> > +    char *be_path;
> >      libxl_device_pci *assigned;
> >      int num_assigned, i, rc;
> >      int stubdomid =3D 0;
> > @@ -1245,6 +1246,14 @@ int libxl__device_pci_add(libxl__gc *gc, uint32_=
t domid, libxl_device_pci *pcide
> >          rc =3D do_pci_add(gc, stubdomid, &pcidev_s, 0);
> >          if ( rc )
> >              goto out;
> > +        /* Wait for the device actually being connected, otherwise dev=
ice model
> > +         * running there will fail to find the device. */
> > +        be_path =3D libxl__sprintf(gc, "%s/backend/pci/%d/0",
> > +                                 libxl__xs_get_dompath(gc, 0), stubdom=
id);
> > +        rc =3D libxl__wait_for_backend(gc, be_path,
> > +                                     GCSPRINTF("%d", XenbusStateConnec=
ted));
> > +        if (rc)
> > +            goto out;
>=20
> I think it would be better to use the async libxl functionality here,
> see libxl__xswait_start. I will leave for the toolstack maintainers to
> decide. Apart from that the change seems correct.

libxl__device_pci_add() is not async-aware right now and it looks like
converting it is quite a bit of work. I'd leave it out of scope for this
patch series...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--lymARMIdFDV9dylT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxLxNMACgkQ24/THMrX
1ywN2gf/btmOkNy65x4Co9Ra7knsP06NzfrWHRX1kUk5piFH3I538ypx94CLzqrf
FKdVXvxC/55Hb2XmSXXeQQTJBbsiZ0zSoRuPkv2Ty9kHNYf+P+CUF7oRWoLln7fx
vBvVVIEcTFXnENJWyDmPSc+IOq35e1gM+eforsV8njclk0m9xvXFQmL/a24BPv60
zczLUsZUfkTeqm1fOKn+REfeBGlBzH/jh2FkvpIrkL0Jw6vQxE0W+c18kr9BCZVV
Ynvl1HqbjWLi1l2NHzvlpPAsrfdNcnvKIAn/MVVV42pDXV/5Vn9eQVB7ezWQ70R2
T0LYk/QSApSCcBNOuarz3O08i6EKLA==
=pyoe
-----END PGP SIGNATURE-----

--lymARMIdFDV9dylT--


--===============0031887663901672534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0031887663901672534==--
