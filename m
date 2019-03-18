From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Mon, 18 Mar 2019 22:43:12 +0100
Message-ID: <20190318214312.GB2014@mail-itl>
References: <20190318173731.14494-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0283039449514612605=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0vW7=RV=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h602T-00031m-7r
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 21:43:21 +0000
In-Reply-To: <20190318173731.14494-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org


--===============0283039449514612605==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2019 at 06:37:31PM +0100, Roger Pau Monne wrote:
> Or if it's not possible to honor the hinted address an error is returned
> instead.=20

Just to be sure: MAP_FIXED will cause to map at specified address, even
if something is mapped there already. From mmap(2):

    If the memory region specified by addr and len overlaps pages of any
    existing mapping(s), then the overlapped part of the existing map=E2=80=
=90
    ping(s) will be discarded.  If the specified address cannot be used,
    mmap() will fail.

> This makes it easier to spot the actual failure, instead of
> failing later on when the caller of xen_remap_bucket realizes the
> mapping has not been created at the requested address.
>=20
> Also note that at least on FreeBSD using MAP_FIXED will cause mmap to
> try harder to honor the passed address.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul.durrant@citrix.com>
> Cc: Igor Druzhinin <igor.druzhinin@citrix.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: xen-devel@lists.xenproject.org
> ---
> Changes since v2:
>  - Move comment position.
>=20
> Changes since v1:
>  - Use MAP_FIXED for the dummy mmap call also if a specific virtual
>    address is requested.
> ---
>  hw/i386/xen/xen-mapcache.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index 349f72d00c..254759f776 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -184,9 +184,14 @@ static void xen_remap_bucket(MapCacheEntry *entry,
>          pfns[i] =3D (address_index << (MCACHE_BUCKET_SHIFT-XC_PAGE_SHIFT=
)) + i;
>      }
> =20
> +    /*
> +     * If the caller has requested the mapping at a specific address use
> +     * MAP_FIXED to make sure it's honored.
> +     */
>      if (!dummy) {
>          vaddr_base =3D xenforeignmemory_map2(xen_fmem, xen_domid, vaddr,
> -                                           PROT_READ | PROT_WRITE, 0,
> +                                           PROT_READ | PROT_WRITE,
> +                                           vaddr ? MAP_FIXED : 0,
>                                             nb_pfn, pfns, err);
>          if (vaddr_base =3D=3D NULL) {
>              perror("xenforeignmemory_map2");
> @@ -198,7 +203,8 @@ static void xen_remap_bucket(MapCacheEntry *entry,
>           * mapping immediately due to certain circumstances (i.e. on res=
ume now)
>           */
>          vaddr_base =3D mmap(vaddr, size, PROT_READ | PROT_WRITE,
> -                          MAP_ANON | MAP_SHARED, -1, 0);
> +                          MAP_ANON | MAP_SHARED | (vaddr ? MAP_FIXED : 0=
),
> +                          -1, 0);
>          if (vaddr_base =3D=3D MAP_FAILED) {
>              perror("mmap");
>              exit(-1);

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlyQEPAACgkQ24/THMrX
1yxiBwf/VfOF9r0w/e1N8+C/hcn0XJQmv2/YP9DNizDge9W65iy34z1a2oQhBiA/
AK3YUqdASunZTgxn8eB0pM6/+ALGO3nnAdVnXYpgrdUOtdYsSjH2Duft7BWNNHfu
5Qa/tvtjLiJwNgohnwQxrOdtWsGiqUFUlWTxynoZ5CZAapLrpu3NSRUsjAfkUHwK
g7ojdKW1dVHrkgZhGyShhXIhASJpnMk05sMkIm54XHmPWTJDfzlOc1tP2JaSALOB
ADMJEruPwMsozhWOWPse8YsFMtuKBhheXHGM3bFdANWn/M8bkw3/+qBY2W7x7y84
kPCGumLuTp33rhP1V2QY2QfMQd534A==
=fksy
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--


--===============0283039449514612605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0283039449514612605==--
