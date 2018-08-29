From: Olaf Hering <olaf@aepfle.de>
Subject: build regression in staging
Date: Wed, 29 Aug 2018 12:27:29 +0200
Message-ID: <20180829122729.3a063f43.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0667967425153679290=="
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

--===============0667967425153679290==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Hcy5wh2E26/Rlv1I6H253gX"; protocol="application/pgp-signature"

--Sig_/Hcy5wh2E26/Rlv1I6H253gX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Some change between 36e29dd9e5..b28cd21c3 breaks build of tools/firmware (T=
he pv shim?):

[  391s] Error: size of alternative.o:.data.read_mostly is 0x01
[  391s] make[11]: *** [/home/abuild/rpmbuild/BUILD/xen-4.12.20180828T19011=
1.b28cd21c36/non-dbg/tools/firmware/xen-dir/xen-root/xen/Rules.mk:209: alte=
rnative.init.o] Error 10

This happens only in Tumbleweed, which has binutils-2.31 and gcc8-8.2.1.

Full log:
https://build.opensuse.org/public/build/home:olh:xen-unstable/openSUSE_Tumb=
leweed/x86_64/xen/_log

Olaf

--Sig_/Hcy5wh2E26/Rlv1I6H253gX
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4Z1EQAKCRBdQqD6ppg2
fibcAJ4sdQHhReupXsWxsBr/Ys6yjDs2EwCg8gFXDWxM5A2iT0sc1EDXZ0hPT4E=
=Q/6J
-----END PGP SIGNATURE-----

--Sig_/Hcy5wh2E26/Rlv1I6H253gX--


--===============0667967425153679290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0667967425153679290==--
