From: Olaf Hering <olaf@aepfle.de>
Subject: Re: tools/fuzz fails due build, osstest did not notice
Date: Tue, 4 Sep 2018 09:32:16 +0200
Message-ID: <20180904093216.33ea8ad8.olaf@aepfle.de>
References: <20180903115323.616cc7f8.olaf@aepfle.de>
 <5B8D2A9E02000078001E491D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2132960230262472209=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tkn6=ls=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fx5p7-0000Ke-3q
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 07:32:29 +0000
In-Reply-To: <5B8D2A9E02000078001E491D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============2132960230262472209==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/gNBsyiVBWsx5q647O./_my="; protocol="application/pgp-signature"

--Sig_/gNBsyiVBWsx5q647O./_my=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 03 Sep 2018 06:35:42 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> what is the actual problem? The mere
> listing of compiler flags passed does not make clear to me where the clash
> is, or how it would surface.

As I noticed just now, it fails to build only in Tumbleweed. So in this spe=
cific case osstest would have caught it only in a few years from now.

[   38s] make -C x86_instruction_emulator install
[   38s] make[6]: Entering directory '/home/abuild/rpmbuild/BUILD/xen-4.12.=
20180831T120653.6164970942/non-dbg/tools/fuzz/x86_instruction_emulator'
[   38s] [ -L x86-emulate.h ] || ln -sf /home/abuild/rpmbuild/BUILD/xen-4.1=
2.20180831T120653.6164970942/non-dbg/tools/fuzz/x86_instruction_emulator/..=
/../../tools/tests/x86_emulator/x86-emulate.h
[   38s] [ -L x86_emulate ] || ln -sf /home/abuild/rpmbuild/BUILD/xen-4.12.=
20180831T120653.6164970942/non-dbg/tools/fuzz/x86_instruction_emulator/../.=
./../xen/arch/x86/x86_emulate
[   38s] /usr/bin/gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -W=
all -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-v=
ariable -Wno-unused-local-typedefs   -O0 -fno-omit-frame-pointer -D__XEN_IN=
TERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF .fuzz-emul.o.=
d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE  -O2 -Wall -D_FORTIFY_SOURCE=3D=
2 -fstack-protector-strong -funwind-tables -fasynchronous-unwind-tables -fs=
tack-clash-protection -I/home/abuild/rpmbuild/BUILD/xen-4.12.20180831T12065=
3.6164970942/non-dbg/tools/fuzz/x86_instruction_emulator/../../../tools/inc=
lude -D__XEN_TOOLS__ -I.  -c -o fuzz-emul.o fuzz-emul.c
[   38s] In file included from /usr/include/features.h:428,  =20
[   38s]                  from /usr/include/assert.h:35,
[   38s]                  from fuzz-emul.c:1:
[   38s] fuzz-emul.c: In function 'input_read':
[   38s] /usr/include/bits/string_fortified.h:31:1: error: inlining failed =
in call to always_inline 'memcpy': target specific option mismatch
[   38s]  __NTH (memcpy (void *__restrict __dest, const void *__restrict __=
src,
[   38s]  ^~~~~
[   38s] fuzz-emul.c:67:5: note: called from here
[   38s]      memcpy(dst, &s->corpus->data[s->data_index], size);
[   38s]      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[   38s] In file included from /usr/include/features.h:428,  =20
[   38s]                  from /usr/include/assert.h:35,
[   38s]                  from fuzz-emul.c:1:
[   38s] /usr/include/bits/string_fortified.h:31:1: error: inlining failed =
in call to always_inline 'memcpy': target specific option mismatch
[   38s]  __NTH (memcpy (void *__restrict __dest, const void *__restrict __=
src,
[   38s]  ^~~~~
[   38s] fuzz-emul.c:67:5: note: called from here
[   38s]      memcpy(dst, &s->corpus->data[s->data_index], size);
[   38s]      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[   38s] make[6]: *** [/home/abuild/rpmbuild/BUILD/xen-4.12.20180831T120653=
.6164970942/non-dbg/tools/fuzz/x86_instruction_emulator/../../../tools/Rule=
s.mk:225: fuzz-emul.o] Error 1

Appending -U_FORTIFY_SOURCE in tools/fuzz fixes it. Not sure why fuzz is di=
fferent from the rest of tools.

Olaf

--Sig_/gNBsyiVBWsx5q647O./_my=
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW441AAAKCRBdQqD6ppg2
fq8xAKCpJPtVDoCsOeZ8nFTSJmqQVvDkZgCgxUdLQpyWLXOxevgK3pGhRfZ5z14=
=pYBO
-----END PGP SIGNATURE-----

--Sig_/gNBsyiVBWsx5q647O./_my=--


--===============2132960230262472209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2132960230262472209==--
