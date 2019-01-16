From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Wed, 16 Jan 2019 14:49:14 +0100
Message-ID: <20190116134914.GN1205@mail-itl>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <8ea00e9347ae7859a37ea421e658263a44a375fb.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116092129.jz2cts5pwd5ckh34@mac>
 <20190116105218.GM1205@mail-itl>
 <20190116122004.byvr2bttwkttofqs@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7109963091862079423=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ChaH=PY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gjlZM-0000GP-3L
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:49:24 +0000
In-Reply-To: <20190116122004.byvr2bttwkttofqs@mac>
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


--===============7109963091862079423==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Content-Disposition: inline


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq created for
 msi.

On Wed, Jan 16, 2019 at 01:20:04PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jan 16, 2019 at 11:52:18AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, Jan 16, 2019 at 10:21:29AM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Tue, Jan 15, 2019 at 04:36:31PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > From: Simon Gaiser <simon@invisiblethingslab.com>
> > > >=20
> > > > Stubdomains need to be given sufficient privilege over the guest wh=
ich it
> > > > provides emulation for in order for PCI passthrough to work correct=
ly.
> > > > When a HVM domain try to enable MSI, QEMU in stubdomain calls
> > > > PHYSDEVOP_map_pirq, but later it needs to call XEN_DOMCTL_bind_pt_i=
rq as
> > > > part of xc_domain_update_msi_irq. Allow for that as part of
> > > > PHYSDEVOP_map_pirq.
> > >=20
> > > I see, that's not a problem AFAICT for PCI INTx because the IRQ in
> > > that case is known beforehand, and the stubdomain is given permissions
> > > over this IRQ by libxl__device_pci_add (there's a do_pci_add against
> > > the stubdomain).
> >=20
> > Exactly.
>=20
> I would maybe consider adding something like this to the commit
> message, so it's clear why PCI INTx works but not MSI interrupts.
>=20
> >=20
> > > >=20
> > > > Based on https://github.com/OpenXT/xenclient-oe/blob/5e0e7304a5a3c7=
5ef01240a1e3673665b2aaf05e/recipes-extended/xen/files/stubdomain-msi-irq-ac=
cess.patch by Eric Chanudet <chanudete@ainfosec.com>.
> > > >=20
> > > > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> > > > ---
> > > > This is only one part of fixing MSI with QEMU in stubdomain. The ot=
her
> > > > part is allowing stubdomain to actually enable MSI in PCI config sp=
ace.
> > > > QEMU does that through pcifront/back connected to the stubdomain (s=
ee
> > > > hw/xen/xen_pt_msi.c:msi_msix_enable()), but pciback by default refu=
se
> > > > write to that register.
> > > > Easy, less safe solution: enable permissive mode for the device.
> > > > Safer solution - enable access to this register for stubdomain only
> > > > (pciback patch that add such flag + libxl patch to set it for relev=
ant
> > > >  devices)
> > > > The whole story:
> > > > https://www.qubes-os.org/news/2017/10/18/msi-support/
> > > >=20
> > > > Any other ideas? Which one is preferred upstream?
> > >=20
> > > IMO, and please correct me if I'm wrong, QEMU in the stubdomain will
> > > receive the PCI config space write to enable MSI, and since this
> > > stub-QEMU runs in PV mode I think it should use the PV way to enable
> > > MSI, ie: the same that Linux pcifront uses to enable MSI for
> > > passed-through devices.
> > >=20
> > > Is this something that sounds sensible?
> >=20
> > We've considered this option too. Let me quote Simon on that (from the
> > link above):
> >=20
> >     The enable command that pcifront sends is intended for the normal P=
V use
> >     case where the device is passed to the VM itself (via pcifront) rat=
her
> >     than to the stub domain target. While the command is called enable_=
msi,
> >     pciback does much more than simply setting the enable flag. It also
> >     configures IRQ handling in the dom0 kernel, adapts the MSI masking,=
 and
> >     more. This makes sense in the PV case, but in the HVM case, the MSI
> >     configuration is done by QEMU, so this most likely won=E2=80=99t wo=
rk correctly.
>=20
> Oh great, that's unfortunate. Both pciback functions end up calling
> into msi_capability_init in the Linux kernel, which does indeed more
> than just toggling the PCI config space enable bit.
>=20
> OTOH adding a bypass to pciback so the stubdom is able to write to the
> PCI register in order to toggle the enable bit seems quite clumsy. Not
> to mention that you would be required to update Dom0 kernel in order to
> fix the issue.
>=20
> Do you think it makes sense to add a domctl to enable/disable MSI(X)?
>=20
> This way the bug could be fixed by just updating Xen (and the
> stubdomain).

Indeed in case of stubdomain, that would make sens, as other PCI passthrough
related operations already bypass pcifront/back anyway.

And I agree with Jan, that physdevop makes more sense, if going this way.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlw/NloACgkQ24/THMrX
1yyIWggAhgClvb4ahR8Yrqz02QTqm6pAZRSNFxhHtuvZU4Rx8kgUbrHVDvhnk2Ny
UCPa3JL8mP9G9xDobKnUig2gVu+1pP0NpF6t06g/7Al3dniKsuqoLalCzNug9OIv
lmI/+PNlc8SZ5g03Y4JjioIHIcMiTBxDfuxjl+mQRM85LA913GDppmEqFwL0ixQO
uMz2W15MSLuqfa6AisaZT5b80gpC5kVJM2fERkQyYYeaduNjCUv4nr6G3Rt/bpg3
nuswS7B1u8zP8i9683XZbh/6XoaR1R+vPaXCQebFzJNgnnlxR1FUPXKdF/mg3EtQ
R4UjTb4Tf2ekXqxcGIrUC26zdE0mYQ==
=jw8F
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--


--===============7109963091862079423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7109963091862079423==--
