From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 1/4] libxl: do not attach xen-pciback to
 HVM domain, if stubdomain is in use
Date: Wed, 16 Jan 2019 18:00:33 +0100
Message-ID: <20190116170033.GO1205@mail-itl>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <84045f5ed399411217c2ac8f3763add0c541a073.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116164719.aevcvhzotblpnbzw@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0053077264438543979=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ChaH=PY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gjoaa-0003bF-0U
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 17:02:52 +0000
In-Reply-To: <20190116164719.aevcvhzotblpnbzw@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0053077264438543979==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Content-Disposition: inline


--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v2 1/4] libxl: do not attach xen-pciback to
 HVM domain, if stubdomain is in use

On Wed, Jan 16, 2019 at 05:47:19PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 15, 2019 at 04:36:28PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > HVM domains use IOMMU and device model assistance for communicating with
> > PCI devices, xen-pcifront/pciback is used only in PV domains.
>=20
> You still need pciback in order to reset the device when it's
> deassigned from the guest, so it's functionality is not only used by
> PV guests.

Right, I'll update the commit message to match v2 code.

> > When HVM domain has device model in stubdomain, attaching xen-pciback to
> > the target domain itself is not only useless, but also may prevent
> > attaching xen-pciback to the stubdomain, effectively breaking PCI
> > passthrough.
>=20
> Right. When doing passthrough with a stubdomain you want the target
> domain to have the memory and IO regions mapped, and the stubdomain to
> handle the rest.
>=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v2:
> >  - previously called "libxl: attach xen-pciback only to PV domains"
> >  - instead of excluding all HVMs, change the condition to what actually
> >    matters here - check if stubdomain is in use; this way xen-pciback is
> >    always in use (either for the target domain, or it's stubdomain),
> >    fixing PCI reset by xen-pciback concerns
> > ---
> >  tools/libxl/libxl_pci.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> > index 87afa03..3b6b23c 100644
> > --- a/tools/libxl/libxl_pci.c
> > +++ b/tools/libxl/libxl_pci.c
> > @@ -1106,7 +1106,7 @@ out:
> >          }
> >      }
> > =20
> > -    if (!starting)
> > +    if (!starting && !libxl_get_stubdom_id(CTX, domid))
>=20
> This change seems to assume that both libxl_domain_config for the
> target and the stubdomain will have the assigned pci devices in the
> pcidevs field.=20

Not really. libxl__device_pci_add() calls do_pci_add() for both stubdomain
(if applicable) and target domain.

> Yet I cannot see where the stubdomain
> libxl_domain_config will get the pci devices from the target domain
> assigned, I've looked in libxl__spawn_stub_dm but there doesn't seem
> to be any copy from the target to the stubdom of the list of pci
> devices. I guess I'm missing something.
>=20
> Thanks, Roger.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlw/YzEACgkQ24/THMrX
1yz55AgAgR5sv3J4/vYMa8NmqZABzJ84UHpdMfZnF+GLtmOdqA59pk916/x6ZWdo
aZ9hT+BU1r32VRagNwzk2STmZsdhCCxbhRZ8nySFI0KtfZtzIXsi+qQrY2v9szfw
WZGAhMme/9L/KLAiwWklKXvAtE63f0OI05juHW6lUnTDUaSt9iadE9n0+3TNPNLt
qJkqr2EetBMb6ZEsEeDaEJVrd5sJqP5VZONlBE5CxIOuvHkaqwPWKAhmAmsaCk7N
OXTjk1lR2M0Mzrr+EteLt5oWr/Y4OGR3MzEW+1tlkHGYpAj6YvvYoNTLlULJaN+J
n9DMuQVCzIyNlNSanrlAMt5sWEDBgQ==
=aOrk
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--


--===============0053077264438543979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0053077264438543979==--
