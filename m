From: Olaf Hering <olaf@aepfle.de>
Subject: how to recognize in libxl that a domU has qemu-xen
 attached?
Date: Thu, 17 May 2018 14:33:52 +0200
Message-ID: <20180517143352.1227b39e.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8026866371658741577=="
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

--===============8026866371658741577==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/OPqqG1halUwS+tnx=rc2Di3"; protocol="application/pgp-signature"

--Sig_/OPqqG1halUwS+tnx=rc2Di3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

In the other thread about the unsolved migration bugs in qemu-xen it became=
 clear that "xen-save-devices-state" must not only be called for HVM, but f=
or every domU that has qemu-xen attached to it. I wonder how to check for t=
hat fact from the migration code. While it can continue to rely on LIBXL_DO=
MAIN_TYPE_HVM make that call, for  LIBXL_DOMAIN_TYPE_PV it is apparently no=
t that easy. Is libxl__need_xenpv_qemu the API to use for the decision if l=
ibxl__qmp_stop/libxl__qmp_save/libxl__qmp_resume have to be called during m=
igration?

Olaf

--Sig_/OPqqG1halUwS+tnx=rc2Di3
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWv12sAAKCRBdQqD6ppg2
foiKAKDH/6VaWtN5FY8VgkV/RpAcilTzqACg6QjeHXimxjnDjokXyhfsto+0wzg=
=Jh3y
-----END PGP SIGNATURE-----

--Sig_/OPqqG1halUwS+tnx=rc2Di3--


--===============8026866371658741577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8026866371658741577==--
