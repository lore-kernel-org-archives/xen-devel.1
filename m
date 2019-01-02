From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v2 2/4] elf-ops.h: Add get_elf_note_type()
Date: Wed, 2 Jan 2019 13:12:34 +0000
Message-ID: <20190102131234.GN24009@stefanha-x1.localdomain>
References: <1545422632-24444-1-git-send-email-liam.merwick@oracle.com>
 <1545422632-24444-3-git-send-email-liam.merwick@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1809771901900827353=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/c71=PK=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1gegK5-0003pv-Lk
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 13:12:37 +0000
In-Reply-To: <1545422632-24444-3-git-send-email-liam.merwick@oracle.com>
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


--===============1809771901900827353==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b1ERR0FXR0PvNIRE"
Content-Disposition: inline


--b1ERR0FXR0PvNIRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2018 at 08:03:50PM +0000, Liam Merwick wrote:
> +    while (note_type !=3D elf_note_type) {
> +        nhdr_namesz =3D nhdr->n_namesz;
> +        nhdr_descsz =3D nhdr->n_descsz;
> +
> +        elf_note_entry_offset =3D nhdr_size +
> +            QEMU_ALIGN_UP(nhdr_namesz, phdr_align) +
> +            QEMU_ALIGN_UP(nhdr_descsz, phdr_align);
> +
> +        /* If the offset calculated in this iteration exceeds the
> +	 * supplied size, we are done and no matching note was found.
> +	 */

Indentation is off here.  QEMU uses 4-space indentation.

> +        if (elf_note_entry_offset > note_size) {
> +            return NULL;
> +        }
> +
> +        /* skip to the next ELF Note entry */
> +        nhdr =3D (void *)nhdr + elf_note_entry_offset;
> +        note_type =3D nhdr->n_type;
> +    }
> +
> +    return nhdr;
> +}
> +
>  static int glue(load_elf, SZ)(const char *name, int fd,
>                                uint64_t (*elf_note_fn)(void *, void *, bo=
ol),
>                                uint64_t (*translate_fn)(void *, uint64_t),
> @@ -512,6 +555,13 @@ static int glue(load_elf, SZ)(const char *name, int =
fd,
>                  }
>              }
> =20
> +	    /* Search the ELF notes to find one with a type matching the
> +	     * value passed in via 'translate_opaque'
> +	     */
> +            nhdr =3D (struct elf_note *)data;

Ah, I see data gets used here!  It would be clearer to move loading of
data into this patch.

> +	    assert(translate_opaque !=3D NULL);
> +            nhdr =3D glue(get_elf_note_type, SZ)(nhdr, file_size, ph->p_=
align,
> +                                               *(uint64_t *)translate_op=
aque);

Indentation is off in this hunk.  QEMU uses 4-space indentation.

--b1ERR0FXR0PvNIRE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcLLjCAAoJEJykq7OBq3PIZ/EH/ipgOt8ASb7G9HtihUXxltlG
FpiavcTULh6RYCjIP0k5h/EM78MOZwXCKgG0xZQg5QrqR3WzuBhmVukRfLAnJsPK
HzrQREc/P7GzkQJtrWjiWDmVIvmw6QrBx7BUOAMCGqx6ewFvyRj3eo65tzMSCVeq
+tc7PYtc7sOP7BR0jrX5y6t+NcuENhEBJVF5oXqoB35Sdyh/xmeOXnHKL/1ltiSr
q6unzKvvEA/nM/j/m09FUzVyqM1AKQpJDM+uHMlFtZO2llEmMzGLLKJjF3FSiY5C
tEGQB3xGVAgHjkCjo5Ci5LqbdoGpgB2yyB423WLuqcC9YdzfUwKm7rWJ7bam1eY=
=zvH5
-----END PGP SIGNATURE-----

--b1ERR0FXR0PvNIRE--


--===============1809771901900827353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1809771901900827353==--
