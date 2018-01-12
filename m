From: Olaf Hering <olaf@aepfle.de>
Subject: vixen and vfb, missing vfb support in qemu
Date: Fri, 12 Jan 2018 14:02:21 +0100
Message-ID: <20180112130221.GA16260@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0877454372555420982=="
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


--===============0877454372555420982==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

It seems the list of missing features of vixen does not cover the lack
of framebuffer support. 'xl create -Vf PV.cfg' would show the guest
console in the VNC window. With vixen this can not work because the vfb
code triggers only for PV guests.

Is that missing feature on anyones radar already? At least I did not
find it in the public discussions that took place in the past days.

What would it take for qemu to provide a vfb backend?

Olaf

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWlix2gAKCRBdQqD6ppg2
foWWAJ9ctSJxll639Ev/YMm4cquEXHZNWQCfSkXlSnXgqK2dcaBjO8wd19F53lQ=
=K5HI
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--


--===============0877454372555420982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0877454372555420982==--
