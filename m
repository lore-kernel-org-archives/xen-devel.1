From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 5/6] xen/x86: add PHYSDEVOP_msi_set_enable
Date: Sun, 3 Mar 2019 04:26:29 +0100
Message-ID: <20190303032629.GQ19265@mail-itl>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cc240476d615c05925891d33fc83be3e1801b52d.1549498018.git-series.marmarek@invisiblethingslab.com>
 <5C767771020000780021AB12@prv1-mh.provo.novell.com>
 <20190227150508.GE19265@mail-itl>
 <5C77BEDD020000780021B030@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7794426974114148607=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r4X1=RG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h0Hlz-00007Q-PH
 for xen-devel@lists.xenproject.org; Sun, 03 Mar 2019 03:26:44 +0000
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


--===============7794426974114148607==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5KxTQ9fdN6Op3ksq"
Content-Disposition: inline


--5KxTQ9fdN6Op3ksq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 5/6] xen/x86: add PHYSDEVOP_msi_set_enable

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

Shouldn't that be done by device model itself? Or even on command from
the target domain? Automatically toggling INTx when manipulating MSI(-X)
seems wrong.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--5KxTQ9fdN6Op3ksq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlx7SWQACgkQ24/THMrX
1yzSAgf/e3dwPS+MhF2PAdN5huECNBUZwc0usdI0mrPW+Zn1+xcJfBIGU/EEZK6Q
xfVRk8g+fyLMvGiOZ9AF393O06cr2ukCgbAw/jnQbs95XB/AK2486VnNrYVz8dm9
0tbYryNPmXS7lRYJbJXmp89SzDZ5vs5Lbu6rifu75UalSvxMNHMzha5Pk6digoCj
aO3SeSsivUGZp3L3RuxLUwoNvLImUPN5z1HaQlhQjPXpLMTVjjwXhUc+OYgNlLfg
co9YNbTfgdlYurzs589yRdhGysnwUNBjyyk4SgcIPWneXcduk2Fnob+t/om+JfKc
0m+9qKu0OOpTLRafWs38E4Emls0Fow==
=sksy
-----END PGP SIGNATURE-----

--5KxTQ9fdN6Op3ksq--


--===============7794426974114148607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7794426974114148607==--
