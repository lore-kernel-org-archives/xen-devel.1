From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 5/6] xen/x86: add PHYSDEVOP_msi_set_enable
Date: Thu, 28 Feb 2019 13:25:46 +0100
Message-ID: <20190228122546.GN5348@mail-itl>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cc240476d615c05925891d33fc83be3e1801b52d.1549498018.git-series.marmarek@invisiblethingslab.com>
 <5C767771020000780021AB12@prv1-mh.provo.novell.com>
 <20190227150508.GE19265@mail-itl>
 <5C77BEDD020000780021B030@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6912895737558875741=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aQvT=RD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gzKl8-0006Q0-F4
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 12:25:54 +0000
In-Reply-To: <5C77BEDD020000780021B030@prv1-mh.provo.novell.com>
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


--===============6912895737558875741==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FxavXfDenm+F7xE/"
Content-Disposition: inline


--FxavXfDenm+F7xE/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 03:58:37AM -0700, Jan Beulich wrote:
> >>> On 27.02.19 at 16:05, <marmarek@invisiblethingslab.com> wrote:
> > On Wed, Feb 27, 2019 at 04:41:37AM -0700, Jan Beulich wrote:
> >> >>> On 07.02.19 at 01:07, <marmarek@invisiblethingslab.com> wrote:
> >> > +int msi_msix_set_enable(struct pci_dev *pdev, int mode, int enable)
> >> > +{
> >> > +    int ret;
> >> > +
> >> > +    ret =3D xsm_msi_set_enable(XSM_DM_PRIV, pdev->domain,
> >> > +                             (pdev->seg << 16) | (pdev->bus << 8) |=
 pdev->devfn,
> >> > +                             mode, enable);
> >> > +    if ( ret )
> >> > +        return ret;
> >> > +
> >> > +    switch ( mode )
> >> > +    {
> >> > +    case PHYSDEVOP_MSI_SET_ENABLE_MSI:
> >> > +        msi_set_enable(pdev, enable);
> >> > +        break;
> >> > +
> >> > +    case PHYSDEVOP_MSI_SET_ENABLE_MSIX:
> >> > +        msix_set_enable(pdev, enable);
> >> > +        break;
> >> > +    }
> >>=20
> >> What about a call to pci_intx()?=20
> >=20
> > Should pci_intx(dev, !enable) be called in all those cases?
>=20
> Well, that depends whether Dom0 is involved, which is where the
> operation would normally be done. But since this is about bypassing
> pciback, I think it may be needed.
>=20
> >> And what about invocations for
> >> the wrong device (e.g. MSI-X request for MSI-X incapable device)?
> >=20
> > Looking at msi(x)_set_enable(), it is no-op for incapable devices, but
> > if the function would do anything else, indeed such check should be
> > added. Is pci_find_cap_offset(..., PCI_CAP_ID_MSI(X)) the correct way
> > of doing that?
>=20
> Well, for MSI-X you could simply check pdev->msix to be non-NULL.
> For MSI I think looking for the capability is your only choice.
>=20
> Another thing: You're also bypassing the MSI{,-X}-already-enabled
> checks that __pci_enable_msi{,x}() do, yet allowing to enable both
> on a device would be a security issue.

Ok.

> >> > +    /* IN */
> >> > +    uint16_t seg;
> >> > +    uint8_t bus;
> >> > +    uint8_t devfn;
> >> > +    uint8_t mode;
> >> > +    uint8_t enable;
> >>=20
> >> "mode" and "enable" don't really make clear which of the two is the
> >> boolean, and which is the operation. I'd anyway prefer a single
> >> flags field with descriptive #define-s, which will also make more
> >> obvious how to extend this if need be.
> >=20
> > You mean:
> >=20
> > #define PHYSDEVOP_MSI_CONTROL_ENABLE 1
> > #define PHYSDEVOP_MSI_CONTROL_MSI    2=20
> > #define PHYSDEVOP_MSI_CONTROL_MSIX   4
>=20
> Not exactly - you need just two flags: One selecting between
> enable and disable, and a second selecting between MSI and
> MSI-X. Otherwise, in your model, what do 0 or ENABLE alone
> mean?

I put 3 flags there for easier extending it in the future.
But maybe indeed two flags + error on any other bit set would be enough
too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--FxavXfDenm+F7xE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlx300sACgkQ24/THMrX
1yzi8Qf/UMsXgQJkkOaX3cHnUWfimkDiKXObOk+L6QTQYjKFb3Hw0MtDHMmGxNuJ
jMqXQuKYT6xI3+xVf8aoHT/NjZNP80k9D863aDMs7e11SgHmP7gJT/tHiZtaPuAj
rQVIrraZlfGyrJWFfavGnf2YL2Q/kHmo/ELYLIJn6k1PPDV85vS1Eb7kKaOlv5o5
TjIEiNZCpV0XPTDiX+rFsoMrzj1iaYAxFZDOE3bvDJlZ4glvQJarJxA7x0vz85U6
l6pbs1ualHOMshknWSw5YC+aHxYz4DRlvbjZi7gU9Sh+BbM8+Hii2BxWQstbfgcD
YO2BuzCBiLSJrapi32di7vUI/jOfgg==
=lhLG
-----END PGP SIGNATURE-----

--FxavXfDenm+F7xE/--


--===============6912895737558875741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6912895737558875741==--
