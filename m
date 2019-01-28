From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Mon, 28 Jan 2019 21:30:28 +0100
Message-ID: <20190128203028.GB21228@mail-itl>
References: <cover.3de8cf7a339b8395cb449f8f3d44fee884ce04fa.1548469645.git-series.marmarek@invisiblethingslab.com>
 <05a28a956a23b23b205d38be0f9bf92a485bffde.1548469645.git-series.marmarek@invisiblethingslab.com>
 <20190128145000.anm6g3svz5adk5fo@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8507111182758066207=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sAWr=QE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1goDYD-0004U6-6J
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 20:30:37 +0000
In-Reply-To: <20190128145000.anm6g3svz5adk5fo@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8507111182758066207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 02:50:00PM +0000, Wei Liu wrote:
> On Sat, Jan 26, 2019 at 03:31:15AM +0100, Marek Marczykowski-G=C3=B3recki=
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
> >=20
> > With this patch, stubdomain will be able to create and map multiple irq
> > (DoS possibility?), as only target domain is validated in practice. Is
> > that ok? If not, what additional limits could be applied here?
> > In INTx case the problem doesn't apply, because toolstack grant access
> > to particular IRQ and no allocation happen on stubdomain request. But in
> > MSI case, it isn't that easy as IRQ number isn't known before (as
> > explained in the commit message).
> > ---
> >  xen/arch/x86/irq.c     | 23 +++++++++++++++++++++++
> >  xen/arch/x86/physdev.c |  9 +++++++++
> >  2 files changed, 32 insertions(+)
> >=20
> > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > index 8b44d6c..67c67d4 100644
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -2674,6 +2674,21 @@ int allocate_and_map_msi_pirq(struct domain *d, =
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
> > +                    return ret;
>=20
> Don't you need to deallocate the irq before returning?

Yes, indeed.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxPZmMACgkQ24/THMrX
1yweHwf/YlplkbBx2AR9ZC69kCGMj0VlRYWq0SxwL2DVMhCu87I9AGf42/jcAG6L
0RblFme/qVVk1QOZf1Y40BQtWU10jFEx1ftaK8Ed5OzvtqeS7Wg22dXFrDRAyBc/
MKiG6d8kGz2CyHzbdtD0GWvBXV/dhse7QUAgmGSXqb1H6m928MHZcRzwnlOZ+pIn
6sbZFHPVAaryTx8KZOzySfDqENAV3tCYYEh5H8Yt5d4Nm4l9ETyTlsH44aAOQ0r6
P/Svl1BsGdaP+LzhRlzazYJU1JB7vsxd1UyZJQWExM/C4dfD5FPeJNrf+3xTmmp0
x0MTmSnvfCgW49hCxsOdFrLw7TJlIg==
=Oa52
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--


--===============8507111182758066207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8507111182758066207==--
