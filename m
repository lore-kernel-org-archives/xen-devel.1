From: Olaf Hering <olaf@aepfle.de>
Subject: qemu-xen fails to build in staging
Date: Wed, 7 Feb 2018 09:18:16 +0100
Message-ID: <20180207081808.GA28102@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0365182622932201033=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============0365182622932201033==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

With current staging, qemu-xen fails to build. It looks like a ordering
issue, I assume ui/input-keymap-linux-to-qcode.c is a generated file.
It is (as always) a fresh clean checkout in a clean chroot.

[  505s] /home/abuild/rpmbuild/BUILD/xen-4.11.20180206T183258.30cbd0c83e/non-dbg/tools/qemu-xen-dir/ui/input-keymap.c:8:44: fatal error: ui/input-keymap-linux-to-qcode.c: No such file or directory
[  505s]  #include "ui/input-keymap-linux-to-qcode.c"
[  505s]                                             ^
[  505s] compilation terminated.
[  505s] /home/abuild/rpmbuild/BUILD/xen-4.11.20180206T183258.30cbd0c83e/non-dbg/tools/qemu-xen-dir/rules.mak:66: recipe for target 'ui/input-keymap.o' failed
[  505s] make: *** [ui/input-keymap.o] Error 1

The previous snapshot did not have this issue:
xen_commit b6c2c7f48ab8bd5566759cb404afd80fd0df2dfe Wed Jan 10 10:33:26 UTC 2018
seabios_tag 5f4c7b13cdf9c450eb55645f4362ea58fa61b79b Fri Feb 24 14:01:20 UTC 2017
minios_tag 0b4b7897e08b967a09bed2028a79fabff82342dd Fri Oct 20 10:50:35 UTC 2017
ipxe_tag 356f6c1b64d7a97746d1816cef8ca22bdd8d0b5d Tue May 23 17:48:06 UTC 2017
ovmf_tag 947f3737abf65fda63f3ffd97fddfa6986986868 Wed Sep 20 18:25:19 UTC 2017
qemu_xen_traditional_tag c8ea0457495342c417c3dc033bba25148b279f60 Fri Sep 15 18:37:27 UTC 2017
qemu_xen_upstream_tag b79708a8ed1b3d18bee67baeaf33b3fa529493e2 Thu Nov  9 15:46:00 UTC 2017

Olaf

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWnq2PQAKCRBdQqD6ppg2
fs4yAKCfyMZ+1W+M5zb32vsfMNhtEblUowCdE6N9y7kIwhgCu3QwsanuVBwsW/8=
=RVrV
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--


--===============0365182622932201033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0365182622932201033==--
