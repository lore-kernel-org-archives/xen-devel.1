From: Olaf Hering <olaf@aepfle.de>
Subject: usage of libxc compat function fails with staging
Date: Thu, 25 Oct 2018 14:08:08 +0200
Message-ID: <20181025140808.13eefc21.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0830538787129317696=="
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

--===============0830538787129317696==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/9FtY/fEcOS8SF8L0JHPa+xH"; protocol="application/pgp-signature"

--Sig_/9FtY/fEcOS8SF8L0JHPa+xH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I have a matrix of various qemu.git#stable-x.y that build against xen.git#s=
taging*. Since some months qemu.git#stable-2.x fails to build against xen.g=
it#staging. qemu-2.10+ works with staging. To me it is not clear how to fix=
 this failure:

qemu-2.9-20170907T112512.4cd42653f5/include/hw/xen/xen_common.h:61:16: warn=
ing: implicit declaration of function 'xc_map_foreign_bulk'

qemu is built with the various compat flags like :-DXC_WANT_COMPAT_MAP_FORE=
IGN_API=3D1. I think this should give access to that function. But for some=
 reason the missing function is wrapped further in xenctrl_compat.h.

Is qemu-2.x supposed to define XC_BUILDING_COMPAT_MAP_FOREIGN_API? Commit 3=
248691679 ("tools: Refactor foreign memory mapping into libxenforeignmemory=
") in xen.git indicates that just XC_WANT_COMPAT_MAP_FOREIGN_API would be n=
eeded.

Olaf

--Sig_/9FtY/fEcOS8SF8L0JHPa+xH
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW9GyKAAKCRBdQqD6ppg2
fn70AJ9irvWii57z4ak2BN9LEmTJrrc+rACg85KQycYQE5bRAh+FDN37e/+qa/I=
=IZpZ
-----END PGP SIGNATURE-----

--Sig_/9FtY/fEcOS8SF8L0JHPa+xH--


--===============0830538787129317696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0830538787129317696==--
