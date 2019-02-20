From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 15/25] spapr-vty: Let vty_putchars() use
 size_t
Date: Wed, 20 Feb 2019 12:39:06 +1100
Message-ID: <20190220013905.GD9345@umbus.fritz.box>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-16-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6724693099527924400=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KFSZ=Q3=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1gwI1u-0003XJ-2E
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 02:54:38 +0000
In-Reply-To: <20190220010232.18731-16-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org


--===============6724693099527924400==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a6YTfLRor63AaheO"
Content-Disposition: inline


--a6YTfLRor63AaheO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2019 at 02:02:22AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Both callers (h_put_term_char and rtas_display_character) use
> an unsigned value.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/char/spapr_vty.c        | 2 +-
>  include/hw/ppc/spapr_vio.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
> index 6748334ded..92b8c40410 100644
> --- a/hw/char/spapr_vty.c
> +++ b/hw/char/spapr_vty.c
> @@ -83,7 +83,7 @@ static int vty_getchars(VIOsPAPRDevice *sdev, uint8_t *=
buf, int max)
>      return n;
>  }
> =20
> -void vty_putchars(VIOsPAPRDevice *sdev, uint8_t *buf, int len)
> +void vty_putchars(VIOsPAPRDevice *sdev, uint8_t *buf, size_t len)
>  {
>      VIOsPAPRVTYDevice *dev =3D VIO_SPAPR_VTY_DEVICE(sdev);
> =20
> diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> index e8b006d18f..ed79d2f380 100644
> --- a/include/hw/ppc/spapr_vio.h
> +++ b/include/hw/ppc/spapr_vio.h
> @@ -126,7 +126,7 @@ static inline int spapr_vio_dma_set(VIOsPAPRDevice *d=
ev, uint64_t taddr,
>  int spapr_vio_send_crq(VIOsPAPRDevice *dev, uint8_t *crq);
> =20
>  VIOsPAPRDevice *vty_lookup(sPAPRMachineState *spapr, target_ulong reg);
> -void vty_putchars(VIOsPAPRDevice *sdev, uint8_t *buf, int len);
> +void vty_putchars(VIOsPAPRDevice *sdev, uint8_t *buf, size_t len);
>  void spapr_vty_create(VIOsPAPRBus *bus, Chardev *chardev);
>  void spapr_vlan_create(VIOsPAPRBus *bus, NICInfo *nd);
>  void spapr_vscsi_create(VIOsPAPRBus *bus);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--a6YTfLRor63AaheO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlxsr7cACgkQbDjKyiDZ
s5I+TRAAoUYSiy2dnSWUa835NZsmTwIjbjhGgX+dyP2VcxD6eCzsxu3Ar+t+fsT9
bGMvCegj+errJ2Z9yKpYdMkTzLOkRkHzTx1c5yRNU6f11EhKu6lpTXJh+M2PPgw9
lezN1rbx88MfHcRtJDrvJRpWLCcEyw0n5z74Vln8p9yY2ZMipHLGvMmx7wlAIaG5
IeH2hdSWqT0UV1QAlMTdcUNkr5tdGy7wjI4g3WzuzEnZDPW6qNHig60gC7gjnjM6
Y+PIjrvjeZ2DPWuksWiSB8XGvpKf2rO4qSsoXQSNsZfNTl0IC8DtFaAmdXOp5kcy
gSZfm9a9moDZNZKOp53tvQ216y0A1aNx/Y8Y1dzuR0cC93Db26d3k0rEytpjzpum
ZXvTbU+ggLtgDb0iHUNisNUGnmyTZd1j0c1wkT9nBPXgD+nH1oIiWgW6RfnXB4hZ
fzyy1S5JQYYvoVw+VC0BTskCBAQ5nRDUz+iGoaJz9uPFGQBXOZPEnQmjynoCGY+N
c11l+vaiSJsVauKMiJCbvVAUNvXv9szG4665ocwdN+K+8YuIuIKZqE1LsfuyM0CO
eEHyhVroXx9nOh8mZUbwWKiq1AhQ2kyxGk/vrEEtJyABaxdA8aAzd8JrEfsU+1I5
Dfmu0IPkm6cKrHLUvkyYtnZ8HY8HnDJlyarzVQsa7fzxZ/OsZzc=
=s4B1
-----END PGP SIGNATURE-----

--a6YTfLRor63AaheO--


--===============6724693099527924400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6724693099527924400==--
