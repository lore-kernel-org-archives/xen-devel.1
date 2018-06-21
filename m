From: Olaf Hering <olaf@aepfle.de>
Subject: device_model_version is set unconditionally to qemu_xen
Date: Thu, 21 Jun 2018 15:34:38 +0200
Message-ID: <20180621153438.73a96d9a.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4931771204929266653=="
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

--===============4931771204929266653==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/LucvyGtqevxVQJtlW+=XOFt"; protocol="application/pgp-signature"

--Sig_/LucvyGtqevxVQJtlW+=XOFt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

libxl__domain_build_info_setdefault sets libxl_domain_build_info->device_mo=
del_version unconditionally to LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN. This br=
eaks domUs that do not have a qemu attached to it, like PV without vfb=3D a=
nd without qdisk. While that bug does not trigger today, it will once https=
://lists.xenproject.org/archives/html/xen-devel/2018-05/msg01077.html is me=
rged.

Why would it be a good idea to set ->device_model_version to a bogus value,=
 instead of introducing a concept of device_model_version=3DNONE?

Olaf

--Sig_/LucvyGtqevxVQJtlW+=XOFt
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWyupbgAKCRBdQqD6ppg2
fiYkAJ4ikz4/gRUh+geZQ43au0YUJyQuHgCgrfR247Ws5jUKaRZT2BlnmDIMK2o=
=UCWZ
-----END PGP SIGNATURE-----

--Sig_/LucvyGtqevxVQJtlW+=XOFt--


--===============4931771204929266653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4931771204929266653==--
