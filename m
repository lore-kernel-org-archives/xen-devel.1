From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v2 1/4] elf: Add optional function ptr to
 load_elf() to parse ELF notes
Date: Wed, 2 Jan 2019 13:06:50 +0000
Message-ID: <20190102130650.GM24009__43638.2430293181$1546434354$gmane$org@stefanha-x1.localdomain>
References: <1545422632-24444-1-git-send-email-liam.merwick@oracle.com>
 <1545422632-24444-2-git-send-email-liam.merwick@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3495126587354426507=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/c71=PK=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1gegEc-00031f-0T
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 13:06:58 +0000
In-Reply-To: <1545422632-24444-2-git-send-email-liam.merwick@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: ehabkost@redhat.com, mst@redhat.com, maran.wilson@oracle.com, qemu-devel@nongnu.org, george.kennedy@oracle.com, xen-devel@lists.xenproject.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net, sgarzare@redhat.com
List-Id: xen-devel@lists.xenproject.org


--===============3495126587354426507==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DXTueXWT3Da08pik"
Content-Disposition: inline


--DXTueXWT3Da08pik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2018 at 08:03:49PM +0000, Liam Merwick wrote:
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 74679ff8da3a..37d20a3800c1 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -266,6 +266,7 @@ fail:
>  }
> =20
>  static int glue(load_elf, SZ)(const char *name, int fd,
> +                              uint64_t (*elf_note_fn)(void *, void *, bo=
ol),
>                                uint64_t (*translate_fn)(void *, uint64_t),
>                                void *translate_opaque,
>                                int must_swab, uint64_t *pentry,
> @@ -496,8 +497,30 @@ static int glue(load_elf, SZ)(const char *name, int =
fd,
>                  high =3D addr + mem_size;
> =20
>              data =3D NULL;
> +
> +        } else if (ph->p_type =3D=3D PT_NOTE && elf_note_fn) {
> +            struct elf_note *nhdr =3D NULL;
> +
> +            file_size =3D ph->p_filesz; /* Size of the range of ELF note=
s */
> +            data =3D g_malloc0(file_size);
> +            if (ph->p_filesz > 0) {
> +                if (lseek(fd, ph->p_offset, SEEK_SET) < 0) {
> +                    goto fail;
> +                }
> +                if (read(fd, data, file_size) !=3D file_size) {
> +                    goto fail;
> +                }
> +            }
> +
> +            if (nhdr !=3D NULL) {
> +                bool is64 =3D
> +                    sizeof(struct elf_note) =3D=3D sizeof(struct elf64_n=
ote);
> +                elf_note_fn((void *)nhdr, (void *)&ph->p_align, is64);

How does data get used?

> +            }
> +            g_free(data);

Missing data =3D NULL to prevent double free later?

--DXTueXWT3Da08pik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcLLdqAAoJEJykq7OBq3PIPNUIAMlYfpbNVFsonh226rbJaR3w
YSt+vscNyY1R2INl6kh2p9zdUi3CEU4jdzTK7s3IhvwIeGi6rsefFl3ugrL7rDGv
V8oJjii8OE+5P9eteDERVAWExWCzssTu4pc/DCOAUx3u7SR/xgVXTprtmjM2HCkC
4P2P6YQdILerjRFCVI+CoYGn3lYpGg+6ZFxldZMjtoMzHCwk0b+EXip6v3pIlwoN
wVbyIcft2sGHqDEXXNHHx6FuXOxba7PK+esv7EKLMtQaFC9mV/WGEOMnyabvICoy
CZFi9KcL38fOEUtsgkNqpJAisWSFcPqVgjpMr0HsUlw5hjpa3z7V+QFpLjfE1es=
=FlQZ
-----END PGP SIGNATURE-----

--DXTueXWT3Da08pik--


--===============3495126587354426507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3495126587354426507==--
