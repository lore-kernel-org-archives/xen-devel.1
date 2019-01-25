From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Fri, 25 Jan 2019 20:43:56 +0100
Message-ID: <20190125194356.GH2528@mail-itl>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <8ea00e9347ae7859a37ea421e658263a44a375fb.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116092129.jz2cts5pwd5ckh34@mac>
 <20190116105218.GM1205@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6740122539571913823=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d8nG=QB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gn7OU-0003E7-JM
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 19:44:02 +0000
In-Reply-To: <20190116105218.GM1205@mail-itl>
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


--===============6740122539571913823==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq created for
 msi.

On Wed, Jan 16, 2019 at 11:52:21AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Jan 16, 2019 at 10:21:29AM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Jan 15, 2019 at 04:36:31PM +0100, Marek Marczykowski-G=C3=B3rec=
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
> >=20
> > I see, that's not a problem AFAICT for PCI INTx because the IRQ in
> > that case is known beforehand, and the stubdomain is given permissions
> > over this IRQ by libxl__device_pci_add (there's a do_pci_add against
> > the stubdomain).
>=20
> Exactly.
>=20
> > >=20
> > > Based on https://github.com/OpenXT/xenclient-oe/blob/5e0e7304a5a3c75e=
f01240a1e3673665b2aaf05e/recipes-extended/xen/files/stubdomain-msi-irq-acce=
ss.patch by Eric Chanudet <chanudete@ainfosec.com>.
> > >=20
> > > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > > ---
(...)
> > > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > > index 8b44d6c..123ca69 100644
> > > --- a/xen/arch/x86/irq.c
> > > +++ b/xen/arch/x86/irq.c
> > > @@ -2674,6 +2674,21 @@ int allocate_and_map_msi_pirq(struct domain *d=
, int index, int *pirq_p,
> > >          {
> > >      case MAP_PIRQ_TYPE_MULTI_MSI:
> > >              irq =3D create_irq(NUMA_NO_NODE);
> > > +            if ( !(irq < nr_irqs_gsi || irq >=3D nr_irqs) &&
> >=20
> > This check is already performed below, maybe you could re-arrange the
> > code as:
> >=20
> > case MAP_PIRQ_TYPE_MULTI_MSI:
> >         irq =3D create_irq(NUMA_NO_NODE);
> >     }
> >=20
> >     if ( irq < nr_irqs_gsi || irq >=3D nr_irqs )
> >     {
> >         dprintk(XENLOG_G_ERR, "dom%d: can't create irq for msi!\n",
> >                 d->domain_id);
> >         return -EINVAL;
> >     }
> >     if ( current->domain->target =3D=3D d )
> >         ...
> >=20
> > But I wonder whether it would be better to place the irq_permit_access
> > in map_domain_pirq, together with the existing irq_permit_access that
> > grant the target domain permissions over the irq.
>=20
> That may be a good idea. Let me try that in v3. But I'll wait for a
> feedback on libxl patches first.

That doesn't work, as map_domain_pirq() check irq access earlier.
Which bring be to a question, what should be rules guarding stubdomain
access to PHYSDEVOP_map_pirq? With this patch, stubdomain will be able
to create and map multiple irq (DoS possibility?), as only target domain
is validated in practice. Is that ok? If not, what additional limits
could be applied here?
In INTx case the problem doesn't apply, because toolstack grant access
to particular IRQ and no allocation happen on stubdomain request. But in
MSI case, it isn't that easy as IRQ number isn't known before (as
explained in the commit message).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxLZvwACgkQ24/THMrX
1yxT9Qf9E9R+ljkDCTWG5FjVNMAdzV6kaXUXn0ZzkCl0Qvw5MpB4yrFlAwChCS40
bUdEEk9DOMFs4JLKTDiUeCjb9a3ft9vJC+lhnHuN/TxjLmg1ZsXoilWVzWANFqsT
4d+DWUhxlb47JFxlvuCHBmV2MeSutR44y58pUmICjXZ3+VXNwnSsNo/Sjl019HKQ
XmMdHiHPuwfY/sxSuunZM/isPf6xR0CHcp/FqWUbL6R4yaKQeFusEXrhOaTTegQ+
CVIOp7rY4OnS+MP2l3Jtc1O9ljADSXGXCXmH51ela3MFMiIJiolNqMKB8ToSZQmW
Z1fQtso4Lanl7fWmXi8mgJd41uH4Bw==
=oTNs
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--


--===============6740122539571913823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6740122539571913823==--
