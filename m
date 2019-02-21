From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Thu, 21 Feb 2019 18:40:40 +0100
Message-ID: <20190221174040.GV21228@mail-itl>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <20190221164751.hjtyddw63ztmc3yk@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5330318985792408330=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W4UY=Q4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gwsNA-0003Wz-Ta
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 17:43:00 +0000
In-Reply-To: <20190221164751.hjtyddw63ztmc3yk@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org


--===============5330318985792408330==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gB+ITVRz/u3k8hJv"
Content-Disposition: inline


--gB+ITVRz/u3k8hJv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to irq created
 for msi.

On Thu, Feb 21, 2019 at 05:47:51PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 08, 2019 at 11:17:05AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Stubdomains need to be given sufficient privilege over the guest which =
it
> > provides emulation for in order for PCI passthrough to work correctly.
> > When a HVM domain try to enable MSI, QEMU in stubdomain calls
> > PHYSDEVOP_map_pirq, but later it needs to call XEN_DOMCTL_bind_pt_irq as
> > part of xc_domain_update_msi_irq. Allow for that as part of
> > PHYSDEVOP_map_pirq.
> >=20
> > This is not needed for PCI INTx, because IRQ in that case is known
> > beforehand and the stubdomain is given permissions over this IRQ by
> > libxl__device_pci_add (there's a do_pci_add against the stubdomain).
> >=20
> > create_irq() already grant IRQ access to hardware_domain, with
> > assumption the device model (something managing this IRQ) lives there.
> > Modify create_irq() to take additional parameter pointing at device
> > model domain - which may be dom0 or stubdomain. Do the same with
> > destroy_irq() (and msi_free_irq() which calls it) to reverse the
> > operation.
> >=20
> > Then, adjust all callers to provide the parameter. In case of calls not
> > related to stubdomain-initiated allocations, give it hardware_domain, so
> > the behavior is unchanged there.
> >=20
> > Inspired by https://github.com/OpenXT/xenclient-oe/blob/5e0e7304a5a3c75=
ef01240a1e3673665b2aaf05e/recipes-extended/xen/files/stubdomain-msi-irq-acc=
ess.patch by Eric Chanudet <chanudete@ainfosec.com>.
> >=20
> > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Thanks for working on this! I've got some comments below.
>=20
> > ---
> > Changes in v3:
> >  - extend commit message
> > Changes in v4:
> >  - add missing destroy_irq on error path
> > Changes in v4.1:
> >  - move irq_{grant,revoke}_access() to {create,destroy}_irq(), which
> >    basically make it a different patch
> >=20
> > There is one code path where I haven't managed to properly extract
> > possible stubdomain in use:
> > pci_remove_device()
> >  -> pci_cleanup_msi()
> >    -> msi_free_irqs()
> >      -> msi_free_irq()
> >        -> destroy_irq()
> >=20
> > For now I've hardcoded hardware_domain there (in msi_free_irqs). Can it=
 happen
> > when device is still assigned to some domU?
> > ---
> >  xen/arch/x86/hpet.c                      |  5 +--
> >  xen/arch/x86/irq.c                       | 46 ++++++++++++++----------
> >  xen/arch/x86/msi.c                       |  6 ++--
> >  xen/drivers/char/ns16550.c               |  6 ++--
> >  xen/drivers/passthrough/amd/iommu_init.c |  4 +--
> >  xen/drivers/passthrough/vtd/iommu.c      |  7 ++--
> >  xen/include/asm-x86/irq.h                |  4 +--
> >  xen/include/asm-x86/msi.h                |  2 +-
> >  8 files changed, 46 insertions(+), 34 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> > index 4b08488ef1..6db71dfd71 100644
> > --- a/xen/arch/x86/hpet.c
> > +++ b/xen/arch/x86/hpet.c
> > @@ -11,6 +11,7 @@
> >  #include <xen/softirq.h>
> >  #include <xen/irq.h>
> >  #include <xen/numa.h>
> > +#include <xen/sched.h>
> >  #include <asm/fixmap.h>
> >  #include <asm/div64.h>
> >  #include <asm/hpet.h>
> > @@ -368,13 +369,13 @@ static int __init hpet_assign_irq(struct hpet_eve=
nt_channel *ch)
> >  {
> >      int irq;
> > =20
> > -    if ( (irq =3D create_irq(NUMA_NO_NODE)) < 0 )
> > +    if ( (irq =3D create_irq(NUMA_NO_NODE, hardware_domain)) < 0 )
> >          return irq;
> > =20
> >      ch->msi.irq =3D irq;
> >      if ( hpet_setup_msi_irq(ch) )
> >      {
> > -        destroy_irq(irq);
> > +        destroy_irq(irq, hardware_domain);
>=20
> Hm, here you should use an explicit NULL instead of hardware_domain
> (which will also be NULL by the time this gets called). This irq is
> used by Xen, and it doesn't make sense logically to give permissions
> over it to the hardware domain.

Ok.

> >          return -EINVAL;
> >      }
> > =20
> > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > index 8b44d6ce0b..d41b32b2f4 100644
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -157,7 +157,7 @@ int __init bind_irq_vector(int irq, int vector, con=
st cpumask_t *cpu_mask)
> >  /*
> >   * Dynamic irq allocate and deallocation for MSI
> >   */
> > -int create_irq(nodeid_t node)
> > +int create_irq(nodeid_t node, struct domain *dm_domain)
>=20
> Using plain 'd' would be fine for me here, same below for
> destroy_irq.

I think it may be misleading, as the parameter is not about domain that
will handle that IRQ, but what domain will get access to it.

> >  {
> >      int irq, ret;
> >      struct irq_desc *desc;
> > @@ -190,19 +190,19 @@ int create_irq(nodeid_t node)
> >          desc->arch.used =3D IRQ_UNUSED;
> >          irq =3D ret;
> >      }
> > -    else if ( hardware_domain )
> > +    else if ( dm_domain )
>=20
> Can you guarantee that dm_domain is always current->domain?

No, in some cases it will be hardware_domain.

> I think you need to assert for this, or else take a reference to
> dm_domain (get_domain) before accessing it's fields, or else you risk
> the domain being destroyed while modifying it's fields.

Can hardware_domain be destroyed without panicking Xen? If so,
get_domain would be indeed needed.

> >      {
> > -        ret =3D irq_permit_access(hardware_domain, irq);
> > +        ret =3D irq_permit_access(dm_domain, irq);
> >          if ( ret )
> >              printk(XENLOG_G_ERR
> > -                   "Could not grant Dom0 access to IRQ%d (error %d)\n",
> > -                   irq, ret);
> > +                   "Could not grant Dom%u access to IRQ%d (error %d)\n=
",
> > +                   dm_domain->domain_id, irq, ret);
> >      }
> > =20
> >      return irq;
> >  }
> > =20
> > -void destroy_irq(unsigned int irq)
> > +void destroy_irq(unsigned int irq, struct domain *dm_domain)
> >  {
> >      struct irq_desc *desc =3D irq_to_desc(irq);
> >      unsigned long flags;
> > @@ -210,14 +210,14 @@ void destroy_irq(unsigned int irq)
> > =20
> >      BUG_ON(!MSI_IRQ(irq));
> > =20
> > -    if ( hardware_domain )
> > +    if ( dm_domain )
> >      {
> > -        int err =3D irq_deny_access(hardware_domain, irq);
> > +        int err =3D irq_deny_access(dm_domain, irq);
> > =20
> >          if ( err )
> >              printk(XENLOG_G_ERR
> > -                   "Could not revoke Dom0 access to IRQ%u (error %d)\n=
",
> > -                   irq, err);
> > +                   "Could not revoke Dom%u access to IRQ%u (error %d)\=
n",
> > +                   dm_domain->domain_id, irq, err);
> >      }
> > =20
> >      spin_lock_irqsave(&desc->lock, flags);
> > @@ -2010,7 +2010,9 @@ int map_domain_pirq(
> >                      d->domain_id, irq);
> >              pci_disable_msi(msi_desc);
> >              msi_desc->irq =3D -1;
> > -            msi_free_irq(msi_desc);
> > +            msi_free_irq(msi_desc,
> > +                         current->domain->target =3D=3D d ? current->d=
omain
> > +                                                      : hardware_domai=
n);
> >              ret =3D -EBUSY;
> >              goto done;
> >          }
> > @@ -2038,7 +2040,9 @@ int map_domain_pirq(
> >              spin_unlock_irqrestore(&desc->lock, flags);
> > =20
> >              info =3D NULL;
> > -            irq =3D create_irq(NUMA_NO_NODE);
> > +            irq =3D create_irq(NUMA_NO_NODE,
> > +                             current->domain->target =3D=3D d ? curren=
t->domain
> > +                                                          : hardware_d=
omain);
> >              ret =3D irq >=3D 0 ? prepare_domain_irq_pirq(d, irq, pirq =
+ nr, &info)
> >                             : irq;
> >              if ( ret < 0 )
> > @@ -2095,7 +2099,9 @@ int map_domain_pirq(
> >                  irq =3D info->arch.irq;
> >              }
> >              msi_desc->irq =3D -1;
> > -            msi_free_irq(msi_desc);
> > +            msi_free_irq(msi_desc,
> > +                         current->domain->target =3D=3D d ? current->d=
omain
> > +                                                      : hardware_domai=
n);
> >              goto done;
> >          }
> > =20
> > @@ -2255,7 +2261,9 @@ int unmap_domain_pirq(struct domain *d, int pirq)
> >      }
> > =20
> >      if (msi_desc)
> > -        msi_free_irq(msi_desc);
> > +        msi_free_irq(msi_desc,
> > +                     current->domain->target =3D=3D d ? current->domain
> > +                                                  : hardware_domain);
> > =20
> >   done:
> >      return ret;
> > @@ -2671,10 +2679,10 @@ int allocate_and_map_msi_pirq(struct domain *d,=
 int index, int *pirq_p,
> >              msi->entry_nr =3D 1;
> >          irq =3D index;
> >          if ( irq =3D=3D -1 )
> > -        {
> >      case MAP_PIRQ_TYPE_MULTI_MSI:
> > -            irq =3D create_irq(NUMA_NO_NODE);
> > -        }
> > +            irq =3D create_irq(NUMA_NO_NODE,
> > +                             current->domain->target =3D=3D d ? curren=
t->domain
> > +                                                          : hardware_d=
omain);
> > =20
> >          if ( irq < nr_irqs_gsi || irq >=3D nr_irqs )
> >          {
> > @@ -2717,7 +2725,9 @@ int allocate_and_map_msi_pirq(struct domain *d, i=
nt index, int *pirq_p,
> >          case MAP_PIRQ_TYPE_MSI:
> >              if ( index =3D=3D -1 )
> >          case MAP_PIRQ_TYPE_MULTI_MSI:
> > -                destroy_irq(irq);
> > +                destroy_irq(irq,
> > +                            current->domain->target =3D=3D d ? current=
->domain
> > +                                                         : hardware_do=
main);
>=20
> This pattern seems common enough to get a helper, maybe get_dm_domain?

Ok.

> >              break;
> >          }
> >      }
> > diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> > index babc4147c4..66026e3ca5 100644
> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -633,7 +633,7 @@ int __setup_msi_irq(struct irq_desc *desc, struct m=
si_desc *msidesc,
> >      return ret;
> >  }
> > =20
> > -int msi_free_irq(struct msi_desc *entry)
> > +int msi_free_irq(struct msi_desc *entry, struct domain *dm_domain)
> >  {
> >      unsigned int nr =3D entry->msi_attrib.type !=3D PCI_CAP_ID_MSIX
> >                        ? entry->msi.nvec : 1;
> > @@ -641,7 +641,7 @@ int msi_free_irq(struct msi_desc *entry)
> >      while ( nr-- )
> >      {
> >          if ( entry[nr].irq >=3D 0 )
> > -            destroy_irq(entry[nr].irq);
> > +            destroy_irq(entry[nr].irq, dm_domain);
> > =20
> >          /* Free the unused IRTE if intr remap enabled */
> >          if ( iommu_intremap )
> > @@ -1280,7 +1280,7 @@ static void msi_free_irqs(struct pci_dev* dev)
> >      list_for_each_entry_safe( entry, tmp, &dev->msi_list, list )
> >      {
> >          pci_disable_msi(entry);
> > -        msi_free_irq(entry);
> > +        msi_free_irq(entry, hardware_domain);
>=20
> This likely requires some comment to clarify why is the hardcoding of
> hardware_domain correct here. AFAICT this will be called by
> pci_remove_device, which I assume assures that the device has been
> deassigned from any domain before attempting to remove it, hence it
> can only have irqs assigned to the hardware_domain if any?

That's also my understanding, but I'm not 100% sure about that.
See comment just bellow the commit message.

> >      }
> >  }
> > =20
> > diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> > index 189e121b7e..2037bbbf08 100644
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -719,7 +719,7 @@ static void __init ns16550_init_irq(struct serial_p=
ort *port)
> >      struct ns16550 *uart =3D port->uart;
> > =20
> >      if ( uart->msi )
> > -        uart->irq =3D create_irq(0);
> > +        uart->irq =3D create_irq(0, hardware_domain);
> >  #endif
> >  }
> > =20
> > @@ -812,9 +812,9 @@ static void __init ns16550_init_postirq(struct seri=
al_port *port)
> >                  {
> >                      uart->irq =3D 0;
> >                      if ( msi_desc )
> > -                        msi_free_irq(msi_desc);
> > +                        msi_free_irq(msi_desc, hardware_domain);
> >                      else
> > -                        destroy_irq(msi.irq);
> > +                        destroy_irq(msi.irq, hardware_domain);
>=20
> All this calls should pass a NULL domain IMO, since this is the serial
> console driver used by Xen.

Ok.

> >                  }
> >              }
> > =20
> > diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/pas=
sthrough/amd/iommu_init.c
> > index 17f39552a9..423c473a63 100644
> > --- a/xen/drivers/passthrough/amd/iommu_init.c
> > +++ b/xen/drivers/passthrough/amd/iommu_init.c
> > @@ -780,7 +780,7 @@ static bool_t __init set_iommu_interrupt_handler(st=
ruct amd_iommu *iommu)
> >      hw_irq_controller *handler;
> >      u16 control;
> > =20
> > -    irq =3D create_irq(NUMA_NO_NODE);
> > +    irq =3D create_irq(NUMA_NO_NODE, hardware_domain);
> >      if ( irq <=3D 0 )
> >      {
> >          dprintk(XENLOG_ERR, "IOMMU: no irqs\n");
> > @@ -816,7 +816,7 @@ static bool_t __init set_iommu_interrupt_handler(st=
ruct amd_iommu *iommu)
> >          ret =3D request_irq(irq, 0, iommu_interrupt_handler, "amd_iomm=
u", iommu);
> >      if ( ret )
> >      {
> > -        destroy_irq(irq);
> > +        destroy_irq(irq, hardware_domain);
>=20
> Same here, this is the iommu used by Xen, hence the domain parameter
> should be NULL.

Ok.

> >          AMD_IOMMU_DEBUG("can't request irq\n");
> >          return 0;
> >      }
> > diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthro=
ugh/vtd/iommu.c
> > index 50a0e25224..73cf16c145 100644
> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -1138,7 +1138,8 @@ static int __init iommu_set_interrupt(struct acpi=
_drhd_unit *drhd)
> >      struct irq_desc *desc;
> > =20
> >      irq =3D create_irq(rhsa ? pxm_to_node(rhsa->proximity_domain)
> > -                          : NUMA_NO_NODE);
> > +                          : NUMA_NO_NODE,
> > +                     hardware_domain);
> >      if ( irq <=3D 0 )
> >      {
> >          dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: no irq available!\n");
> > @@ -1151,7 +1152,7 @@ static int __init iommu_set_interrupt(struct acpi=
_drhd_unit *drhd)
> >      if ( ret )
> >      {
> >          desc->handler =3D &no_irq_type;
> > -        destroy_irq(irq);
> > +        destroy_irq(irq, hardware_domain);
> >          dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: can't request irq\n");
> >          return ret;
> >      }
> > @@ -1286,7 +1287,7 @@ void __init iommu_free(struct acpi_drhd_unit *drh=
d)
> > =20
> >      free_intel_iommu(iommu->intel);
> >      if ( iommu->msi.irq >=3D 0 )
> > -        destroy_irq(iommu->msi.irq);
> > +        destroy_irq(iommu->msi.irq, hardware_domain);
>=20
> Same here, should be all NULL.

Ok.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--gB+ITVRz/u3k8hJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxu4pgACgkQ24/THMrX
1ywzWggAg2lBzRS2LiXhRPHuJytWIT5VG1ltFuuyGihbSJJ6Gw//ffEWWNc7HKWC
tHelEZlx/8Sf5T7QU3oKq6hFpuISSzcVrP0ZBf5BwVxXY7Bc2i6mXfYZjhGEXeg4
uDN76tW2n1E+eMgExkJ5/qRCkH0JbMKMPONt08MXQ5qCaffUKMi6EYSW0p5Bdi/H
QE31RHHppRzPJXSaGuwo6oFoIU2geM0PRd/hvbqdj2bFiusA49k7XRAJDj6j1fH/
Ei+hvJyhm9YEW9sJsW1lXwxsYzNKFUtafYTN75NJdgaY9S+62Xw9j4VN/RJ84p4m
g1PeJ4UsRrLZlDc1oben0MyAKBGmOw==
=S4Tf
-----END PGP SIGNATURE-----

--gB+ITVRz/u3k8hJv--


--===============5330318985792408330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5330318985792408330==--
