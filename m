From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Backports to stable
Date: Sun, 7 Oct 2018 03:04:33 +0200
Message-ID: <20181007010433.GB2975@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4295008773251199583=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r9+o=mt=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1g8xUt-0002JL-N5
 for xen-devel@lists.xenproject.org; Sun, 07 Oct 2018 01:04:39 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D8B2C21E78
 for <xen-devel@lists.xenproject.org>; Sat,  6 Oct 2018 21:04:37 -0400 (EDT)
Received: from mail-itl (ip5b409b0b.dynamic.kabel-deutschland.de
 [91.64.155.11])
 by mail.messagingengine.com (Postfix) with ESMTPA id 29A1B102EA
 for <xen-devel@lists.xenproject.org>; Sat,  6 Oct 2018 21:04:37 -0400 (EDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============4295008773251199583==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'd like to propose backporting GCC7/8 fixes to all stable branches. Below
is a list up to stable-4.6, but some of the patches are already on
select branches (developed during that release cycle, or already
backported). If you want, I can prepare separate lists for each branch,
but in practice `git cherry-pick` do the right thing already.

    e0a97098e2 x86: fix section type mismatch in mm.c
    fa7789ef18 tools/libxc: fix strncpy size
    796dea37fb tools: include sys/sysmacros.h on Linux
    850e89b3ef tools/blktap2: fix possible '\0' truncation
    3a633c2614 tools/blktap2: fix hypothetical buffer overflow
    f49fa658b5 tools:misc:xenlockprof: fix possible format string overflow
    27751d8924 tools/misc: fix hypothetical buffer overflow in xen-lowmemd
    ebdba150bf xenalyze: fix misleading indentation.
    87761277d7 xenalyze: remove cr3_compare_total
    c2a17869d5 libfsimage: replace deprecated readdir_r() with readdir()
    938c8f53b1 tools/xenpmd: fix possible '\0' truncation
    e75c9dc85f xenpmd: make 32 bit gcc 8.1 non-debug build work
    2d78f78a14 tools: fix several "format-truncation" warnings with GCC 7
    b9daff9d81 libxl: replace deprecated readdir_r() with readdir()
    b021beb21a tools: libxl: NULL terminate partially constructed hex string
    7f601f7c34 tools/gdbsx: fix -Wstringop-truncation warning

    # This one doesn't apply cleanly, because acpi stuff moved
    # tools/firmware/hvmloader/acpi -> tools/acpi
    858dbaaeda libacpi: fixes for iasl >=3D 20180427

    # Not sure if a good idea in a stable branch; if not acceptable, I can =
extract
    # gcc-7/gcc-8 related commits and add them to tools/firmware/etherboot/=
patches/
    461b216534 ipxe: update to newer commit

Another thing worth backporting is xs_watch thread stack size fix +
related patches:

    b4f98dc0d8 tools: fix typo in tools/Rules.mk
    448c03b3cb tools/xenstore: try to get minimum thread stack size for wat=
ch thread
    c9bd8a7365 tools/xenstore: add libdl dependency to libxenstore
    1a37319492 tools/xenstore: fix linking libxenstore with ldl

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlu5W6IACgkQ24/THMrX
1yyQHAf/XxmarjTx+0WFQMhHv4fZnnrmXSrGBb7sxnfg8LrZlHkoJJjXOEcvP+bK
q35KNS6q1kKyzMa62YVQ41Ja7Rbbdg7JFQa6E+BrJO6RP8qDLRGZNpgbVTzrknrN
6ZaXhXSg9uatmKaGmYejvmzTXWG9v6/kG9vwvvMv4JSIFtzIEgOujP4qH3F1K0bm
MQjZ9kmqmKenk9bIj9v5A+WoPOa74cZvgWFeJAPuhz/Cx0rxXOOP7MFCUKpLg2y9
MQ7t1NNacp8L4HVLw4kt8SCR9B+qdIV8oQk0v/LnY/r7ddBCejzLh0UeHtMn3CS0
ao+24XbvKuScQWb1ZCXgOKzFZv9Hrw==
=tArX
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--


--===============4295008773251199583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4295008773251199583==--
