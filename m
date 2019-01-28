From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 3/6] libxl: don't try to manipulate json
 config for stubdomain
Date: Mon, 28 Jan 2019 22:11:06 +0100
Message-ID: <20190128211106.GC21228@mail-itl>
References: <cover.3de8cf7a339b8395cb449f8f3d44fee884ce04fa.1548469645.git-series.marmarek@invisiblethingslab.com>
 <74fd5adc7bdb81ee59e0ec4b60acecfad768cb7a.1548469645.git-series.marmarek@invisiblethingslab.com>
 <20190128144115.ahsvku5wa4miuifo@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5629055635495686483=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sAWr=QE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1goEBV-0008CQ-1A
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 21:11:13 +0000
In-Reply-To: <20190128144115.ahsvku5wa4miuifo@zion.uk.xensource.com>
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


--===============5629055635495686483==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Content-Disposition: inline


--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 02:41:15PM +0000, Wei Liu wrote:
> On Sat, Jan 26, 2019 at 03:31:14AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Stubdomain do not have it's own config file - its configuration is
> > derived from target domains. Do not try to manipulate it when attaching
> > PCI device.
> >=20
>=20
> So if we add the same configuration to stubdom as well, what would
> happen? I guess libxl will try to attach the PCI devices to both the
> stubdom and DomU?

I'm not sure if I understand you here. You mean adding configuration file f=
or
stubdomain, the one managed by
libxl__get_domain_configuration/libxl__set_domain_configuration? In
theory it would work just fine, but in practice I fear all kind of
desynchronization bugs, like adding device to target domain's config,
but not stubdomain's one in some failure handling case. We'd have 4
things to care about:
 - attaching device to target domain
 - attaching device to stubdomain
 - saving device to target domain's config
 - saving device to stubdomain's config

Handling all the failure cases properly will become quite complex,
especially if we add async callbacks into the mix.
Since stubdomain config is deterministically build based on target
domian's config, I don't think adding such complexity is a good idea.

> > This bug prevented starting HVM with stubdomain and PCI passthrough
> > device attached.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v3:
> >  - skip libxl__dm_check_start too, as stubdomain is guaranteed to be
> >    running at this stage already
> >  - do not init d_config at all, as it is used only for json manipulation
> > ---
> >  tools/libxl/libxl_pci.c | 48 ++++++++++++++++++++++++++----------------
> >  1 file changed, 30 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> > index 1bde537..8d159cf 100644
> > --- a/tools/libxl/libxl_pci.c
> > +++ b/tools/libxl/libxl_pci.c
> > @@ -120,10 +120,14 @@ static int libxl__device_pci_add_xenstore(libxl__=
gc *gc, uint32_t domid, libxl_d
> >      libxl_domain_config d_config;
> >      libxl_device_pci pcidev_saved;
> >      libxl__domain_userdata_lock *lock =3D NULL;
> > +    bool is_stubdomain =3D libxl_is_stubdom(CTX, domid, NULL);
> > =20
> > -    libxl_domain_config_init(&d_config);
> > -    libxl_device_pci_init(&pcidev_saved);
> > -    libxl_device_pci_copy(CTX, &pcidev_saved, pcidev);
> > +    /* Stubdomain doesn't have own config. */
> > +    if (!is_stubdomain) {
> > +        libxl_domain_config_init(&d_config);
> > +        libxl_device_pci_init(&pcidev_saved);
> > +        libxl_device_pci_copy(CTX, &pcidev_saved, pcidev);
> > +    }
> > =20
> >      be_path =3D libxl__domain_device_backend_path(gc, 0, domid, 0,
> >                                                  LIBXL__DEVICE_KIND_PCI=
);
> > @@ -152,27 +156,33 @@ static int libxl__device_pci_add_xenstore(libxl__=
gc *gc, uint32_t domid, libxl_d
> >      GCNEW(device);
> >      libxl__device_from_pcidev(gc, domid, pcidev, device);
> > =20
> > -    lock =3D libxl__lock_domain_userdata(gc, domid);
> > -    if (!lock) {
> > -        rc =3D ERROR_LOCK_FAIL;
> > -        goto out;
> > -    }
> > +    /* Stubdomain config is derived from its target domain, it doesn't=
 have
> > +       its own file */
>=20
> Although comment style isn't specified in CODING_STYLE, I would like to
> fix this to=20
>=20
>     /*
>      * Stubdom ...
>      * ... own file.
>      */

Ok.

> > +    if (!is_stubdomain) {
> > +        lock =3D libxl__lock_domain_userdata(gc, domid);
> > +        if (!lock) {
> > +            rc =3D ERROR_LOCK_FAIL;
> > +            goto out;
> > +        }
> > =20
> > -    rc =3D libxl__get_domain_configuration(gc, domid, &d_config);
> > -    if (rc) goto out;
> > +        rc =3D libxl__get_domain_configuration(gc, domid, &d_config);
> > +        if (rc) goto out;
> > =20
> > -    device_add_domain_config(gc, &d_config, &libxl__pcidev_devtype,
> > -                             &pcidev_saved);
> > +        device_add_domain_config(gc, &d_config, &libxl__pcidev_devtype,
> > +                                 &pcidev_saved);
> > =20
> > -    rc =3D libxl__dm_check_start(gc, &d_config, domid);
> > -    if (rc) goto out;
> > +        rc =3D libxl__dm_check_start(gc, &d_config, domid);
> > +        if (rc) goto out;
> > +    }
> > =20
> >      for (;;) {
> >          rc =3D libxl__xs_transaction_start(gc, &t);
> >          if (rc) goto out;
> > =20
> > -        rc =3D libxl__set_domain_configuration(gc, domid, &d_config);
> > -        if (rc) goto out;
> > +        if (lock) {
> > +            rc =3D libxl__set_domain_configuration(gc, domid, &d_confi=
g);
> > +            if (rc) goto out;
> > +        }
> > =20
> >          libxl__xs_writev(gc, t, be_path, libxl__xs_kvs_of_flexarray(gc=
, back));
> > =20
> > @@ -184,8 +194,10 @@ static int libxl__device_pci_add_xenstore(libxl__g=
c *gc, uint32_t domid, libxl_d
> >  out:
> >      libxl__xs_transaction_abort(gc, &t);
> >      if (lock) libxl__unlock_domain_userdata(lock);
> > -    libxl_device_pci_dispose(&pcidev_saved);
> > -    libxl_domain_config_dispose(&d_config);
> > +    if (!is_stubdomain) {
> > +        libxl_device_pci_dispose(&pcidev_saved);
> > +        libxl_domain_config_dispose(&d_config);
> > +    }
> >      return rc;
> >  }
> > =20
> > --=20
> > git-series 0.9.1

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxPb+oACgkQ24/THMrX
1yzCvgf/RAtERqzWe3PcZCheXBKFL+9fMmewJXkamEzzk/waiRuBDgHZnoti6FBR
5K4nsk1jyxkefqOK6gguFMV19BYfy6A3SNX59J+hng/al5VjVUa9vjQZEoQpoxTW
VEdX0EfM1fa/2fOODdS0VgvHdpcjbtE7Q9nuRxGZu3mmSCFzMJGOG2omKqHJSd9k
OACNWJabI70IzdXVmv/EEen3bL45iUuNeF1QBdBp6e8FEiEJGQYtuN/T54zWCGgC
7CdUSHYXADpzRYm3USarrVLwXY3eC7RGxRartTG70l1yXPmx1WSj/xsEliiO/yVx
I7W1fZwEkOAVww+HLGH4pyYTUvCE7Q==
=KZOM
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--


--===============5629055635495686483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5629055635495686483==--
