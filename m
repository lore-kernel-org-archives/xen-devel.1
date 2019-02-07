From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Thu, 7 Feb 2019 15:52:38 +0100
Message-ID: <20190207145238.GX21228@mail-itl>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <f5bf6b245f91398e0235a7b603ebc08ef64135ab.1549498018.git-series.marmarek@invisiblethingslab.com>
 <20190207095719.7r6mikq5ahdbw34p@mac>
 <20190207132124.GW21228@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6574916834754844162=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OOdV=QO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1grl2l-0003Md-8x
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 14:52:47 +0000
In-Reply-To: <20190207132124.GW21228@mail-itl>
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


--===============6574916834754844162==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+bDoS+V4AJZnUgoC"
Content-Disposition: inline


--+bDoS+V4AJZnUgoC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 02:21:27PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Feb 07, 2019 at 10:57:19AM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Feb 07, 2019 at 01:07:47AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > From: Simon Gaiser <simon@invisiblethingslab.com>
> > >=20
> > > Stubdomains need to be given sufficient privilege over the guest whic=
h it
> > > provides emulation for in order for PCI passthrough to work correctly.
> > > When a HVM domain try to enable MSI, QEMU in stubdomain calls
> > > PHYSDEVOP_map_pirq, but later it needs to call XEN_DOMCTL_bind_pt_irq=
 as
> > > part of xc_domain_update_msi_irq. Allow for that as part of
> > > PHYSDEVOP_map_pirq.
> > >=20
> > > This is not needed for PCI INTx, because IRQ in that case is known
> > > beforehand and the stubdomain is given permissions over this IRQ by
> > > libxl__device_pci_add (there's a do_pci_add against the stubdomain).
> > >=20
> > > Based on https://github.com/OpenXT/xenclient-oe/blob/5e0e7304a5a3c75e=
f01240a1e3673665b2aaf05e/recipes-extended/xen/files/stubdomain-msi-irq-acce=
ss.patch by Eric Chanudet <chanudete@ainfosec.com>.
> > >=20
> > > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > > ---
> > > Changes in v3:
> > >  - extend commit message
> > > Changes in v4:
> > >  - add missing destroy_irq on error path
> > >=20
> > > With this patch, stubdomain will be able to create and map multiple i=
rq
> > > (DoS possibility?), as only target domain is validated in practice. Is
> > > that ok? If not, what additional limits could be applied here?
> > > In INTx case the problem doesn't apply, because toolstack grant access
> > > to particular IRQ and no allocation happen on stubdomain request. But=
 in
> > > MSI case, it isn't that easy as IRQ number isn't known before (as
> > > explained in the commit message).
> > > ---
> > >  xen/arch/x86/irq.c     | 24 ++++++++++++++++++++++++
> > >  xen/arch/x86/physdev.c |  9 +++++++++
> > >  2 files changed, 33 insertions(+)
> > >=20
> > > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > > index 8b44d6c..5e5dcac 100644
> > > --- a/xen/arch/x86/irq.c
> > > +++ b/xen/arch/x86/irq.c
> > > @@ -2674,6 +2674,22 @@ int allocate_and_map_msi_pirq(struct domain *d=
, int index, int *pirq_p,
> > >          {
> > >      case MAP_PIRQ_TYPE_MULTI_MSI:
> > >              irq =3D create_irq(NUMA_NO_NODE);
> > > +            if ( !(irq < nr_irqs_gsi || irq >=3D nr_irqs) &&
> > > +                    current->domain->target =3D=3D d )
> > > +            {
> > > +                ret =3D irq_permit_access(current->domain, irq);
> > > +                if ( ret ) {
> > > +                    dprintk(XENLOG_G_ERR,
> > > +                            "dom%d: can't grant it's stubdom (%d) ac=
cess to "
> > > +                            "irq %d for msi: %d!\n",
> > > +                            d->domain_id,
> > > +                            current->domain->domain_id,
> > > +                            irq,
> > > +                            ret);
> > > +                    destroy_irq(irq);
> > > +                    return ret;
> >=20
> > I'm afraid his won't work for devices that support multiple MSI vectors.
> > Note that map_domain_pirq also has a call to create_irq, and you are
> > not adding the sutbdom permissions there.
> >=20
> > IMO, the safer way to fix this would be to modify create_irq and
> > destroy_irq so that you give permissions to the subtdomain in the same
> > place that hardware domain permissions are given. Note that you will
> > have to change the function to take an extra domain parameter
> > AFAICT.
>=20
> That may be a good idea, I'll try.

Hmm, looking at the code, wouldn't it make sense to give device model
domain access to the IRQ _instead of_ hardware domain? If stubdomain is
in use, I don't see why dom0 would need access to that irq. Simply
provide what the device model domain is as parameter - either
hardware_domain, or stubdomain. Something like:

    create_irq(..., current->domain->target =3D=3D d ? current->domain : ha=
rdware_domain);

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+bDoS+V4AJZnUgoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxcRjYACgkQ24/THMrX
1ywRBgf/W7fa89VrFbYQwOfYMX8bQpYu6JYgNlEe6ctLvGAiO0HpFt40P2JKhNEH
gVjPc95rXEJ33JLLVbodPtZzY7Xm0RWNF5rz2UzXEFrYwZ6fTeTu3IM5uxNsEfJ8
mGXtTxRqnOiURj95rL42R9Qy0BzBG0Cmc/wx9cNO6+7bxWXB6kic6fFsKLcL1XC8
CkQRGByxvp4ntrTrzuJzFLbUXzTCNV95Y15nRxaBn5coQ1AAJNCGo8xanGIpBI5a
SkSkwdKKs4WfIfWXj/viNGPlhKvf1zcwFLExwqA6YOvDZFzKMbEr5iZbtTtsGyUD
89wVH8GcfDjEuCxlHWWhS+TUZc+D1A==
=d+VH
-----END PGP SIGNATURE-----

--+bDoS+V4AJZnUgoC--


--===============6574916834754844162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6574916834754844162==--
