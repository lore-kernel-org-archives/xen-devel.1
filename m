From: HW42 <hw42@ipsumj.de>
Subject: Re: [PATCH for-4.10 1/3] libxc: panic when trying to
 create a PVH guest without kernel support
Date: Fri, 19 Jan 2018 06:11:00 +0000
Message-ID: <6abbd413-11e7-5d49-a711-d44fa8fd939d@ipsumj.de>
References: <20171006135201.97534-1-roger.pau@citrix.com>
 <20171006135201.97534-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1508011484081143177=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=spwj=ad=ipsumj.de=hw42@srs-us1.protection.inumbo.net>)
 id 1ecPu2-0006wX-HC
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 06:11:50 +0000
In-Reply-To: <20171006135201.97534-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1508011484081143177==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="sWXmy0lMa6qP4aRCpUqU5lAME66ia124M"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sWXmy0lMa6qP4aRCpUqU5lAME66ia124M
Content-Type: multipart/mixed; boundary="2jAZNxQrManw2W86GZItHFBzvIGJuF1x7";
 protected-headers="v1"
From: HW42 <hw42@ipsumj.de>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <6abbd413-11e7-5d49-a711-d44fa8fd939d@ipsumj.de>
Subject: Re: [Xen-devel] [PATCH for-4.10 1/3] libxc: panic when trying to
 create a PVH guest without kernel support
References: <20171006135201.97534-1-roger.pau@citrix.com>
 <20171006135201.97534-2-roger.pau@citrix.com>
In-Reply-To: <20171006135201.97534-2-roger.pau@citrix.com>

--2jAZNxQrManw2W86GZItHFBzvIGJuF1x7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Roger Pau Monne:
> Previously when trying to boot a PV capable but not PVH capable kernel
> inside of a PVH container xc_dom_guest_type would succeed and return a
> PV guest type, which would lead to failures later on in the build
> process.
>=20
> Instead provide a clear error message when trying to create a PVH
> guest using a kernel that doesn't support PVH.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wei.liu2@citrix.com>
> ---
>  tools/libxc/xc_dom_elfloader.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/tools/libxc/xc_dom_elfloader.c b/tools/libxc/xc_dom_elfloa=
der.c
> index 62d421a5e3..568d7f370c 100644
> --- a/tools/libxc/xc_dom_elfloader.c
> +++ b/tools/libxc/xc_dom_elfloader.c
> @@ -59,6 +59,13 @@ static char *xc_dom_guest_type(struct xc_dom_image *=
dom,
>      if ( dom->container_type =3D=3D XC_DOM_HVM_CONTAINER &&
>           dom->parms.phys_entry !=3D UNSET_ADDR32 )
>          return "hvm-3.0-x86_32";
> +    if ( dom->container_type =3D=3D XC_DOM_HVM_CONTAINER )
> +    {
> +        xc_dom_panic(dom->xch, XC_INVALID_KERNEL,
> +                     "%s: image not capable of booting inside a HVM co=
ntainer",
> +                     __FUNCTION__);
> +        return "xen-3.0-unknown";
> +    }
> =20
>      switch ( machine )
>      {

With this xc_dom_parse_elf_kernel() still returns success and the domain
build fails only later because of the "xen-3.0-unknown" type. Why not
fail directly in xc_dom_parse_elf_kernel() like for elf files which miss
the DomU feature?

And while we are at it: libxl__build_dom() expects that
xc_dom_parse_elf_kernel() sets an errno. Currently this can contain an
unrelated error since it does not get set when returning -EINVAL.

The following seems to work fine for me:

diff --git a/tools/libxc/xc_dom_elfloader.c b/tools/libxc/xc_dom_elfloade=
r.c
index 568d7f370c..b67b95eb19 100644
--- a/tools/libxc/xc_dom_elfloader.c
+++ b/tools/libxc/xc_dom_elfloader.c
@@ -64,7 +64,8 @@ static char *xc_dom_guest_type(struct xc_dom_image *dom=
,
         xc_dom_panic(dom->xch, XC_INVALID_KERNEL,
                      "%s: image not capable of booting inside a HVM cont=
ainer",
                      __FUNCTION__);
-        return "xen-3.0-unknown";
+        errno =3D EINVAL;
+        return NULL;
     }
=20
     switch ( machine )
@@ -195,6 +196,8 @@ static elf_errorstatus xc_dom_parse_elf_kernel(struct=
 xc_dom_image *dom)
     dom->kernel_seg.vend   =3D dom->parms.virt_kend;
=20
     dom->guest_type =3D xc_dom_guest_type(dom, elf);
+    if (dom->guest_type =3D=3D NULL)
+        return -EINVAL;
     DOMPRINTF("%s: %s: 0x%" PRIx64 " -> 0x%" PRIx64 "",
               __FUNCTION__, dom->guest_type,
               dom->kernel_seg.vstart, dom->kernel_seg.vend);


--2jAZNxQrManw2W86GZItHFBzvIGJuF1x7--

--sWXmy0lMa6qP4aRCpUqU5lAME66ia124M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEqieyzvOmi9FGaQcT5KzJJ4pkaBYFAlphjCoPHGh3NDJAaXBz
dW1qLmRlAAoJEOSsySeKZGgW/CkP/iqCrpWJ5hWpWN+6oP7oq6Dad1/R580j7PFf
k9uGq+pVd/h2ykWKTHcPz5p6bb3VN45rGUueCj53DfuUqVYNNT2xo0YMBkponH84
xDeChFy4WhS8OUH/yQuVaSUZd0NMLaXAGukilGqbmy5kFvnW6JR85wzO4aVBy3Z5
B6M1BjE0FWuT937uun+M+DWlyoOqap6TQ2llVrewQfna8UO4GTmQ4jqQ5jQHQJ/Q
JciKfppVwnY6CSYQilJF0aZ0UhZUeOAqyH1dC53Zo3qIwOulwGLdljpp2w8qgYdf
1M5eZr7M2zNdoncJ8LbzhDLjOGmMiDGMqA3d2MToMKL7zTzRwTU0dz3C41p8G+wa
IkxYTf/mM0dQGANYYgcy/zxhPaKiPEm4UDawtH1wozJbuOUklhZFgtJ7vJHwUPor
mBmDvHnvMtx/B5mBrGWuNP1d8dB1gdT3MiOR63+z1X+tB7C0xLE/ROMMpiybCBUa
cXTa2zLB6DMmJaujKtnG5aAjamqcMB6suZGuQqBplqCRqh5Sgdi3woT6vx+xXaVc
SlMSod+LXGn9t0eLBIKRPXEERYdHpaW10/HFilFTpCmwxV3ITxr8NiAu7y0ljzjd
BwVm2IKQf0PgExxudlvuDgY4SLKViVAcCv1y/zpOmseEm9vrF2yV5lZeywBy+nOM
VZlUnyRq
=NArj
-----END PGP SIGNATURE-----

--sWXmy0lMa6qP4aRCpUqU5lAME66ia124M--


--===============1508011484081143177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1508011484081143177==--
