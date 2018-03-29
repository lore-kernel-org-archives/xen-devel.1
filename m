From: Olaf Hering <olaf@aepfle.de>
Subject: seabios regression in staging
Date: Thu, 29 Mar 2018 13:42:43 +0200
Message-ID: <20180329114243.GN30726@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1239559864518291330=="
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


--===============1239559864518291330==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EqVOK5mkaJAMmtSx"
Content-Disposition: inline


--EqVOK5mkaJAMmtSx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

It seems the latest seabios that was pulled into staging recently fails
to compile, at least in SLE_11:

[   86s]   Compile checking out/src/hw/blockcmd.o
[   86s] src/hw/blockcmd.c: In function 'scsi_rep_luns_scan':
[   86s] src/hw/blockcmd.c:229: error: unknown field 'cdbcmd' specified in initializer
[   86s] src/hw/blockcmd.c:229: warning: missing braces around initializer
[   86s] src/hw/blockcmd.c:229: warning: (near initialization for 'op.<anonymous>')
[   86s] src/hw/blockcmd.c:229: warning: initialization makes integer from pointer without a cast
[   86s] make[7]: *** [out/src/hw/blockcmd.o] Error 1

I can eventually trick the build to use gcc48 not only for xen but also
for tools, but I wonder if there is a way to fix this.

Upstream may have not fixed that yet:
https://github.com/coreboot/seabios/blame/master/src/block.h
https://github.com/coreboot/seabios/blame/master/src/hw/blockcmd.c

Olaf

--EqVOK5mkaJAMmtSx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWrzRMwAKCRBdQqD6ppg2
forfAJ9b1x6Du1MWQpHF7Kgul36OrWqi9ACcCP+OTLInpypx53pKdQA5YUh0/ss=
=PE8u
-----END PGP SIGNATURE-----

--EqVOK5mkaJAMmtSx--


--===============1239559864518291330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1239559864518291330==--
