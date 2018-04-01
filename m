From: Olaf Hering <olaf@aepfle.de>
Subject: stubdom --disable-pv-grub has not effect
Date: Sun, 1 Apr 2018 20:19:25 +0200
Message-ID: <20180401201909.40cfc91d.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3850502930825961260=="
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

--===============3850502930825961260==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/u+u1bL74rYxGGWQjgbMo=hG"; protocol="application/pgp-signature"

--Sig_/u+u1bL74rYxGGWQjgbMo=hG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Since the source of pv-grub is not ready for todays compilers, and we have =
pvgrub2, I tried to disable it with --enable-stubdom --disable-pv-grub. But=
 the toplevel Makefile does "make install-grub" unconditionally. I'm not fa=
miliar with stubdom. Is pvgrub a hard requirement for every stubdom variant?

Olaf

--Sig_/u+u1bL74rYxGGWQjgbMo=hG
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWsEirQAKCRBdQqD6ppg2
fhbmAJ4rT98eCD8jzcNXe7Tma4mGUwp14wCfYLrard6PzoTvx7bJ6Ey0Enxc+7o=
=sSz6
-----END PGP SIGNATURE-----

--Sig_/u+u1bL74rYxGGWQjgbMo=hG--


--===============3850502930825961260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3850502930825961260==--
