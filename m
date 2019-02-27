From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 5/6] xen/x86: add PHYSDEVOP_msi_set_enable
Date: Wed, 27 Feb 2019 16:05:08 +0100
Message-ID: <20190227150508.GE19265@mail-itl>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cc240476d615c05925891d33fc83be3e1801b52d.1549498018.git-series.marmarek@invisiblethingslab.com>
 <5C767771020000780021AB12@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3356764770209695287=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zlFm=RC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gz0lr-0007Tg-JM
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 15:05:19 +0000
In-Reply-To: <5C767771020000780021AB12@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3356764770209695287==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qOrJKOH36bD5yhNe"
Content-Disposition: inline


--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 5/6] xen/x86: add PHYSDEVOP_msi_set_enable

On Wed, Feb 27, 2019 at 04:41:37AM -0700, Jan Beulich wrote:
> >>> On 07.02.19 at 01:07, <marmarek@invisiblethingslab.com> wrote:
> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -1474,6 +1474,30 @@ int pci_restore_msi_state(struct pci_dev *pdev)
> >      return 0;
> >  }
> > =20
> > +int msi_msix_set_enable(struct pci_dev *pdev, int mode, int enable)
>=20
> unsigned int mode, bool enable
>=20
> I'm also not happy about the function name. Perhaps simply msi_enable()
> or msi_control()?

Ok, will change to msi_control().

> > +{
> > +    int ret;
> > +
> > +    ret =3D xsm_msi_set_enable(XSM_DM_PRIV, pdev->domain,
> > +                             (pdev->seg << 16) | (pdev->bus << 8) | pd=
ev->devfn,
> > +                             mode, enable);
> > +    if ( ret )
> > +        return ret;
> > +
> > +    switch ( mode )
> > +    {
> > +    case PHYSDEVOP_MSI_SET_ENABLE_MSI:
> > +        msi_set_enable(pdev, enable);
> > +        break;
> > +
> > +    case PHYSDEVOP_MSI_SET_ENABLE_MSIX:
> > +        msix_set_enable(pdev, enable);
> > +        break;
> > +    }
>=20
> What about a call to pci_intx()?=20

Should pci_intx(dev, !enable) be called in all those cases?

> And what about invocations for
> the wrong device (e.g. MSI-X request for MSI-X incapable device)?

Looking at msi(x)_set_enable(), it is no-op for incapable devices, but
if the function would do anything else, indeed such check should be
added. Is pci_find_cap_offset(..., PCI_CAP_ID_MSI(X)) the correct way
of doing that?

> > --- a/xen/arch/x86/physdev.c
> > +++ b/xen/arch/x86/physdev.c
> > @@ -671,6 +671,30 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARA=
M(void) arg)
> >          break;
> >      }
> > =20
> > +    case PHYSDEVOP_msi_set_enable: {
> > +        struct physdev_msi_set_enable op;
> > +        struct pci_dev *pdev;
> > +
> > +        ret =3D -EFAULT;
> > +        if ( copy_from_guest(&op, arg, 1) )
> > +            break;
> > +
> > +        ret =3D -EINVAL;
> > +        if ( op.mode !=3D PHYSDEVOP_MSI_SET_ENABLE_MSI &&
> > +             op.mode !=3D PHYSDEVOP_MSI_SET_ENABLE_MSIX )
> > +            break;
> > +
> > +        pcidevs_lock();
> > +        pdev =3D pci_get_pdev(op.seg, op.bus, op.devfn);
> > +        if ( pdev )
> > +            ret =3D msi_msix_set_enable(pdev, op.mode, !!op.enable);
>=20
> Unnecessary !! .
>=20
> > +        else
> > +            ret =3D -ENODEV;
> > +        pcidevs_unlock();
> > +        break;
> > +
> > +    }
>=20
> Stray blank line above here.
>=20
> > --- a/xen/include/public/physdev.h
> > +++ b/xen/include/public/physdev.h
> > @@ -344,6 +344,21 @@ struct physdev_dbgp_op {
> >  typedef struct physdev_dbgp_op physdev_dbgp_op_t;
> >  DEFINE_XEN_GUEST_HANDLE(physdev_dbgp_op_t);
> > =20
> > +#define PHYSDEVOP_MSI_SET_ENABLE_MSI  0
> > +#define PHYSDEVOP_MSI_SET_ENABLE_MSIX 1
> > +
> > +#define PHYSDEVOP_msi_set_enable   32
> > +struct physdev_msi_set_enable {
>=20
> Can this please also be something like msi_control?

Sure.

> > +    /* IN */
> > +    uint16_t seg;
> > +    uint8_t bus;
> > +    uint8_t devfn;
> > +    uint8_t mode;
> > +    uint8_t enable;
>=20
> "mode" and "enable" don't really make clear which of the two is the
> boolean, and which is the operation. I'd anyway prefer a single
> flags field with descriptive #define-s, which will also make more
> obvious how to extend this if need be.

You mean:

#define PHYSDEVOP_MSI_CONTROL_ENABLE 1
#define PHYSDEVOP_MSI_CONTROL_MSI    2=20
#define PHYSDEVOP_MSI_CONTROL_MSIX   4

Then use PHYSDEVOP_MSI_CONTROL_MSI(X) with or without
PHYSDEVOP_MSI_CONTROL_ENABLE ?

> > --- a/xen/include/xlat.lst
> > +++ b/xen/include/xlat.lst
> > @@ -106,6 +106,7 @@
> >  ?	physdev_restore_msi		physdev.h
> >  ?	physdev_set_iopl		physdev.h
> >  ?	physdev_setup_gsi		physdev.h
> > +?	physdev_msi_set_enable		physdev.h
>=20
> Please insert at the alphabetically correct place.
>=20
> Jan
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--qOrJKOH36bD5yhNe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlx2pyQACgkQ24/THMrX
1yxCbAgAlNZcRIy6c/mVRLPKN2djpTCAXpoyUd7TTtlP3qxrJ4/gDKoBPEEFtDdS
QGj4G/jwBO+uvj1xkHJYdsXGw5DauoaZMXra0BQJalqHx6ZQxOyczUGF2UzQvKhW
1ORV/BwBbxVBk7jP2ZJ2MU+qB+htu7UWcu2YVJfXPe6eyrQz0gqQDz4WWf6d9Zl2
Ha0AA5kQPCxcPHCjyh9pzooq+81kf6RNPqkLf4S6nSfR19hL3jaSJ/BiS73ZD4zM
wf6Kpd9KbzI1aqjcqs80uyGKT6J9IncaO7NEQ43TkWV4pUhenY5xhqXxz9dN/CTc
xE4BhSRyOJfJVKIYKFtw6MmPlYoPDw==
=SH6/
-----END PGP SIGNATURE-----

--qOrJKOH36bD5yhNe--


--===============3356764770209695287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3356764770209695287==--
