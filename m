From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Thu, 7 Feb 2019 14:21:24 +0100
Message-ID: <20190207132124.GW21228@mail-itl>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <f5bf6b245f91398e0235a7b603ebc08ef64135ab.1549498018.git-series.marmarek@invisiblethingslab.com>
 <20190207095719.7r6mikq5ahdbw34p@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4196168625545153428=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OOdV=QO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1grjcT-0002us-9F
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 13:21:33 +0000
In-Reply-To: <20190207095719.7r6mikq5ahdbw34p@mac>
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


--===============4196168625545153428==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fu8LepSeDvpxVgv6"
Content-Disposition: inline


--fu8LepSeDvpxVgv6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 10:57:19AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 07, 2019 at 01:07:47AM +0100, Marek Marczykowski-G=C3=B3recki=
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
> >=20
> > This is not needed for PCI INTx, because IRQ in that case is known
> > beforehand and the stubdomain is given permissions over this IRQ by
> > libxl__device_pci_add (there's a do_pci_add against the stubdomain).
> >=20
> > Based on https://github.com/OpenXT/xenclient-oe/blob/5e0e7304a5a3c75ef0=
1240a1e3673665b2aaf05e/recipes-extended/xen/files/stubdomain-msi-irq-access=
=2Epatch by Eric Chanudet <chanudete@ainfosec.com>.
> >=20
> > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v3:
> >  - extend commit message
> > Changes in v4:
> >  - add missing destroy_irq on error path
> >=20
> > With this patch, stubdomain will be able to create and map multiple irq
> > (DoS possibility?), as only target domain is validated in practice. Is
> > that ok? If not, what additional limits could be applied here?
> > In INTx case the problem doesn't apply, because toolstack grant access
> > to particular IRQ and no allocation happen on stubdomain request. But in
> > MSI case, it isn't that easy as IRQ number isn't known before (as
> > explained in the commit message).
> > ---
> >  xen/arch/x86/irq.c     | 24 ++++++++++++++++++++++++
> >  xen/arch/x86/physdev.c |  9 +++++++++
> >  2 files changed, 33 insertions(+)
> >=20
> > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > index 8b44d6c..5e5dcac 100644
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -2674,6 +2674,22 @@ int allocate_and_map_msi_pirq(struct domain *d, =
int index, int *pirq_p,
> >          {
> >      case MAP_PIRQ_TYPE_MULTI_MSI:
> >              irq =3D create_irq(NUMA_NO_NODE);
> > +            if ( !(irq < nr_irqs_gsi || irq >=3D nr_irqs) &&
> > +                    current->domain->target =3D=3D d )
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
> > +                    destroy_irq(irq);
> > +                    return ret;
>=20
> I'm afraid his won't work for devices that support multiple MSI vectors.
> Note that map_domain_pirq also has a call to create_irq, and you are
> not adding the sutbdom permissions there.
>=20
> IMO, the safer way to fix this would be to modify create_irq and
> destroy_irq so that you give permissions to the subtdomain in the same
> place that hardware domain permissions are given. Note that you will
> have to change the function to take an extra domain parameter
> AFAICT.

That may be a good idea, I'll try.

> Alternatively the permissions could be granted/revoked in
> {un}map_domain_pirq, which already contains a call to
> irq_access_permitted/irq_deny_access, I think I've suggested this in a
> previous version already [0]. This seems less intrusive that modifying
> create_irq/destroy_irq if viable.

I've already tried that. And as responded there, it won't fly, as the
first thing map_domain_pirq does is checking irq permission, which would
fail for irq allocated by allocate_and_map_msi_pirq.

> Thanks, Roger.
>=20
> [0] https://lists.xenproject.org/archives/html/xen-devel/2019-01/msg01240=
=2Ehtml

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--fu8LepSeDvpxVgv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxcMNQACgkQ24/THMrX
1yylJgf+OZo+TzNnGHh47JmzGYt7d8A0sL9K2qLVXzGmnP6nkFvoADYt1FhVU9rp
zO76NJLWFXhvrfqV6cd/Go+QYuede39cKF7nPh39nMl4Uhkoa3XHz2s59MgWvzGj
wLY9tHyTCwNJuD6X6Cp/oootX3hptrYgacIqW47/oVRd4vaieFPmw70LPNzu8QCL
1IyMbaaPGg2Q+lOW5fFHPrRLfvVTkN3xnXz8JBHGQM38FW5Lfb4PpYnU5HY7gbCi
hWKCi81+tTO8iBSUN7mApy+kJ4v0HWkG7ocMRoUrc7XA13gSpgOGonxrzKLes7XM
ghjgsqihDNY01m1KSflDNmEMxAMe1g==
=U400
-----END PGP SIGNATURE-----

--fu8LepSeDvpxVgv6--


--===============4196168625545153428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4196168625545153428==--
