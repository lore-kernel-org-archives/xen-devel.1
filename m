From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/3] spapr: Eliminate
 SPAPR_PCI_2_7_MMIO_WIN_SIZE macro
Date: Tue, 8 Jan 2019 11:07:49 +1100
Message-ID: <20190108000749.GG13339@umbus.fritz.box>
References: <20190107193020.21744-1-ehabkost@redhat.com>
 <20190107193020.21744-2-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8121185440666552038=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bkeU=PQ=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1ggf4E-0006yC-NM
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 00:16:27 +0000
In-Reply-To: <20190107193020.21744-2-ehabkost@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-ppc@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org


--===============8121185440666552038==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gm5TwAJMO0F2iVRz"
Content-Disposition: inline


--gm5TwAJMO0F2iVRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 07, 2019 at 05:30:18PM -0200, Eduardo Habkost wrote:
> The macro is only used in one place, where the purpose of the
> value is obvious.  Eliminate the macro so we don't need to rely
> on stringify().
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/hw/pci-host/spapr.h | 1 -
>  hw/ppc/spapr.c              | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
> index 7c66c3872f..a85a995b6c 100644
> --- a/include/hw/pci-host/spapr.h
> +++ b/include/hw/pci-host/spapr.h
> @@ -99,7 +99,6 @@ struct sPAPRPHBState {
>  #define SPAPR_PCI_BASE               (1ULL << 45) /* 32 TiB */
>  #define SPAPR_PCI_LIMIT              (1ULL << 46) /* 64 TiB */
> =20
> -#define SPAPR_PCI_2_7_MMIO_WIN_SIZE  0xf80000000
>  #define SPAPR_PCI_IO_WIN_SIZE        0x10000
> =20
>  #define SPAPR_PCI_MSI_WINDOW         0x40000000000ULL
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 5671608cea..bff42f0adb 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4225,7 +4225,7 @@ static void spapr_machine_2_7_class_options(Machine=
Class *mc)
>          {
>              .driver   =3D TYPE_SPAPR_PCI_HOST_BRIDGE,
>              .property =3D "mem_win_size",
> -            .value    =3D stringify(SPAPR_PCI_2_7_MMIO_WIN_SIZE),
> +            .value    =3D "0xf80000000",
>          },
>          {
>              .driver   =3D TYPE_SPAPR_PCI_HOST_BRIDGE,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gm5TwAJMO0F2iVRz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlwz6dAACgkQbDjKyiDZ
s5KxthAAmMSt+mzO7gBNqkfCRsvhE9RQs+CbWqXU+qb6Wgb5QkfCCsMrfWWe0UGo
HPs6teVCyt9K31XT7W9ZGde5YtMEO7wpEHcr3EkZT4KyMUUwOjUaL3ut5npQSCWL
2SG6wtePDIPTLmsODoLJVCoCRhcuFF2ZN+d91DlANwr3purOP/B9KEVu1GUOlA8r
JdPMXRNN9VaRm7VaUvUVOb8NCSqaFt5IiHlgRUGGD3ZnH5a0Hjvu9NaLL0oFuGCK
r3D8eyrivhxRxGeWX8kGu5rAbpYZx2LKWRZ+TXsZIJ7KKXTVPU3hVZERR+ApjBMz
soDywiID/1HTrPvKtxaqiRigZCvNOUWMbSNzFKFX/FC7Z2w19dbXKV238olN+k7p
ryNRPXkC85Lcu6WWnNk4QusdxWYw52r4u+2sAhgh1z5CIRCGRsqCFenXxFOyIMYA
pQiJrzjaxoLB6K+jAVyzB23Pw1CCaIDPUgfmCCBu4imO5ib55JGL+JYvmBXsGfCw
ak+dOo4EBYuq3XtqYNFGoKRJ+CIyGpNQFBFkq5O1GV79eicDkyyTQWcs99+8XBse
V2pvvlcWsvns+qpJyFF5+JKMuSoz8umf6P/VXDmB2Gw92v2gGKKrd8tAxyO6Kvq8
9kqQ543+SyML7/ddyLH8O4SjlzScXrRS2uACOtpHjH4OgqupC1A=
=89iK
-----END PGP SIGNATURE-----

--gm5TwAJMO0F2iVRz--


--===============8121185440666552038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8121185440666552038==--
