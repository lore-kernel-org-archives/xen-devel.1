From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Wed, 16 Jan 2019 11:52:18 +0100
Message-ID: <20190116105218.GM1205@mail-itl>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <8ea00e9347ae7859a37ea421e658263a44a375fb.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116092129.jz2cts5pwd5ckh34@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5879107327328100697=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ChaH=PY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gjio6-0007Xj-LR
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 10:52:26 +0000
In-Reply-To: <20190116092129.jz2cts5pwd5ckh34@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5879107327328100697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Content-Disposition: inline


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq created for
 msi.

On Wed, Jan 16, 2019 at 10:21:29AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 15, 2019 at 04:36:31PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > From: Simon Gaiser <simon@invisiblethingslab.com>
> >=20
> > Stubdomains need to be given sufficient privilege over the guest which =
it
> > provides emulation for in order for PCI passthrough to work correctly.
> > When a HVM domain try to enable MSI, QEMU in stubdomain calls
> > PHYSDEVOP_map_pirq, but later it needs to call XEN_DOMCTL_bind_pt_irq as
> > part of xc_domain_update_msi_irq. Allow for that as part of
> > PHYSDEVOP_map_pirq.
>=20
> I see, that's not a problem AFAICT for PCI INTx because the IRQ in
> that case is known beforehand, and the stubdomain is given permissions
> over this IRQ by libxl__device_pci_add (there's a do_pci_add against
> the stubdomain).

Exactly.

> >=20
> > Based on https://github.com/OpenXT/xenclient-oe/blob/5e0e7304a5a3c75ef0=
1240a1e3673665b2aaf05e/recipes-extended/xen/files/stubdomain-msi-irq-access=
=2Epatch by Eric Chanudet <chanudete@ainfosec.com>.
> >=20
> > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > This is only one part of fixing MSI with QEMU in stubdomain. The other
> > part is allowing stubdomain to actually enable MSI in PCI config space.
> > QEMU does that through pcifront/back connected to the stubdomain (see
> > hw/xen/xen_pt_msi.c:msi_msix_enable()), but pciback by default refuse
> > write to that register.
> > Easy, less safe solution: enable permissive mode for the device.
> > Safer solution - enable access to this register for stubdomain only
> > (pciback patch that add such flag + libxl patch to set it for relevant
> >  devices)
> > The whole story:
> > https://www.qubes-os.org/news/2017/10/18/msi-support/
> >=20
> > Any other ideas? Which one is preferred upstream?
>=20
> IMO, and please correct me if I'm wrong, QEMU in the stubdomain will
> receive the PCI config space write to enable MSI, and since this
> stub-QEMU runs in PV mode I think it should use the PV way to enable
> MSI, ie: the same that Linux pcifront uses to enable MSI for
> passed-through devices.
>=20
> Is this something that sounds sensible?

We've considered this option too. Let me quote Simon on that (from the
link above):

    The enable command that pcifront sends is intended for the normal PV use
    case where the device is passed to the VM itself (via pcifront) rather
    than to the stub domain target. While the command is called enable_msi,
    pciback does much more than simply setting the enable flag. It also
    configures IRQ handling in the dom0 kernel, adapts the MSI masking, and
    more. This makes sense in the PV case, but in the HVM case, the MSI
    configuration is done by QEMU, so this most likely won=E2=80=99t work c=
orrectly.

> > ---
> >  xen/arch/x86/irq.c     | 23 +++++++++++++++++++++++
> >  xen/arch/x86/physdev.c |  9 +++++++++
> >  2 files changed, 32 insertions(+)
> >=20
> > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > index 8b44d6c..123ca69 100644
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -2674,6 +2674,21 @@ int allocate_and_map_msi_pirq(struct domain *d, =
int index, int *pirq_p,
> >          {
> >      case MAP_PIRQ_TYPE_MULTI_MSI:
> >              irq =3D create_irq(NUMA_NO_NODE);
> > +            if ( !(irq < nr_irqs_gsi || irq >=3D nr_irqs) &&
>=20
> This check is already performed below, maybe you could re-arrange the
> code as:
>=20
> case MAP_PIRQ_TYPE_MULTI_MSI:
>         irq =3D create_irq(NUMA_NO_NODE);
>     }
>=20
>     if ( irq < nr_irqs_gsi || irq >=3D nr_irqs )
>     {
>         dprintk(XENLOG_G_ERR, "dom%d: can't create irq for msi!\n",
>                 d->domain_id);
>         return -EINVAL;
>     }
>     if ( current->domain->target =3D=3D d )
>         ...
>=20
> But I wonder whether it would be better to place the irq_permit_access
> in map_domain_pirq, together with the existing irq_permit_access that
> grant the target domain permissions over the irq.

That may be a good idea. Let me try that in v3. But I'll wait for a
feedback on libxl patches first.

> > +                 current->domain->target =3D=3D d )
> > +            {
> > +                ret =3D irq_permit_access(current->domain, irq);
> > +                if ( ret ) {
> > +                    dprintk(XENLOG_G_ERR,
> > +                            "dom%d: can't grant it's stubdom (%d) acce=
ss to "
> > +                            "irq %d for msi: %d!\n",
> > +                            d->domain_id,
> > +                            current->domain->domain_id,
> > +                            irq,
> > +                            ret);
> > +                    return -EINVAL;
>=20
> You should return ret here IMO, so that the error is propagated to the
> caller (likely ENOMEM since irq_permit_access is just a wrapper around
> rangeset_add).

Ok.

> > +                }
> > +            }
> >          }
> > =20
> >          if ( irq < nr_irqs_gsi || irq >=3D nr_irqs )
> > @@ -2717,7 +2732,15 @@ int allocate_and_map_msi_pirq(struct domain *d, =
int index, int *pirq_p,
> >          case MAP_PIRQ_TYPE_MSI:
> >              if ( index =3D=3D -1 )
> >          case MAP_PIRQ_TYPE_MULTI_MSI:
> > +            {
> > +                if ( current->domain->target =3D=3D d &&
> > +                     irq_deny_access(current->domain, irq) )
> > +                    dprintk(XENLOG_G_ERR,
> > +                            "dom%d: can't revoke stubdom's access to i=
rq %d!\n",
> > +                            d->domain_id,
> > +                            irq);
> >                  destroy_irq(irq);
> > +            }
> >              break;
> >          }
> >      }
> > diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> > index 3a3c158..de59e39 100644
> > --- a/xen/arch/x86/physdev.c
> > +++ b/xen/arch/x86/physdev.c
> > @@ -164,6 +164,15 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
> > =20
> >      pcidevs_lock();
> >      spin_lock(&d->event_lock);
> > +    if ( current->domain->target =3D=3D d)
> > +    {
> > +        int irq =3D domain_pirq_to_irq(d, pirq);
> > +        if ( irq <=3D 0 || irq_deny_access(current->domain, irq) )
>=20
> Same here, I think it would be more natural to place the
> irq_deny_access in unmap_domain_pirq, together with the existing
> irq_deny_access that revokes the permissions of the target domain.

Ok.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlw/DOEACgkQ24/THMrX
1yyq6gf/b4wqTQ0x/jlwNj9o35p87wUil5z89Z4cxwuh1iNZb8bzDY5zdHMUupTC
p4bC9gt1WANiC4Szxt27YYdy9UBEiz3rYy3FHdmfx2EmoRDTg6wwkCqF9kzAalY4
LdPNZ0VFJS67LdI9HihFGuMt1HDGjrq+U53nF83GMLpd7jdcH15O6BrukZe4KRix
tLDFKhweqaSapL0iqvKYoq5RJzw0SUwLM2PTFbl1f1JfUhO8CKalgAxeJFBcu81X
SK+YAkN6EuoiHaK69LAGs/E8uprWTYz3NyH48CpWPK6y6ujjp8dWpNAQSZCL/Fmj
oCwz3Vu3CEzBXWekoJvLtp73I56mRQ==
=DJOO
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--


--===============5879107327328100697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5879107327328100697==--
