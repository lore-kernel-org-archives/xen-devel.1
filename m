From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the xen-tip tree
Date: Thu, 25 Apr 2019 23:44:12 +1000
Message-ID: <20190425234412.5725f6ea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yTS9kI8Gluz2kwcJOhaw92Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mao Wenan <maowenan@huawei.com>
List-Id: xen-devel@lists.xenproject.org

--Sig_/yTS9kI8Gluz2kwcJOhaw92Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8a46b39f3aff ("xenbus: drop useless LIST_HEAD in xenbus_write_watch() and=
 xenbus_file_write()")

Fixes tag

  Fixes: 1107ba885e469("xen: add xenfs to allow usermode <-> Xen interactio=
n")

has these problem(s):

  - missing space between the SHA1 and the subject

--=20
Cheers,
Stephen Rothwell

--Sig_/yTS9kI8Gluz2kwcJOhaw92Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzBuawACgkQAVBC80lX
0GysZQf/XHecL4TEvcykV8YYeoQmha6sT5PZ73Ue8Cn5LoL9F3e5+wqrzlr6oZUE
DPZvpR+rmC3TlSTJy99hzerkLJvYuk6YJklTdysL293h4hIK+Zv5luCKaJQiJBvH
YO7le5b/2qVJFy7AVK4XQFd+dHKr4WJgiOVS/kqudFpfFPLrFVA04bZLmhwe0tN+
l6qoYzhDWZtisW3717k8jYiCmiozZruQwK/M9T3BMSvrL8Q1Y1RuhE1lfEkDv75y
1rS1ukKgi9ndiH90Q1UtT99hH5XbEdaEbVafZpvrY6nFOzFxJ5CJSJcQU+p2Yc+g
4MMXpsPVFOGa30f+oQ2yUjslhblaxw==
=evb/
-----END PGP SIGNATURE-----

--Sig_/yTS9kI8Gluz2kwcJOhaw92Q--
