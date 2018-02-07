From: Olaf Hering <olaf@aepfle.de>
Subject: Re: qemu-xen fails to build in staging
Date: Wed, 7 Feb 2018 13:40:04 +0100
Message-ID: <20180207134004.586789b5.olaf@aepfle.de>
References: <20180207081808.GA28102@aepfle.de>
 <5A7ADB7702000078001A5F4B@prv-mh.provo.novell.com>
 <20180207111322.48639c54.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6121707228232092373=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180207111322.48639c54.olaf@aepfle.de>
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

--===============6121707228232092373==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/hr3SPf0jR/P_HQtZkCsQrSN"; protocol="application/pgp-signature"

--Sig_/hr3SPf0jR/P_HQtZkCsQrSN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 7 Feb 2018 11:13:22 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> Yes, it looks like qemu has now submodules which are required for build.

How is the required state of the submodules tracked? When I did a local bui=
ld I got 10739aa from qemu.org, and building xen.git#staging succeeds. Afte=
r that I updated my packaging, created a new tar from keycodemapdb.git#mast=
er and got a non-working build. It turned out that 044f21d was packaged.

Does the build of xen.git#staging now depend on random state at git.qemu.or=
g?

Olaf

--Sig_/hr3SPf0jR/P_HQtZkCsQrSN
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWnrzpAAKCRBdQqD6ppg2
floHAKDZQT/DQsTGgTtLEeDVx8khjJ1H4QCgigwc621aUAnejspdUsaLu1H7DzM=
=3i1C
-----END PGP SIGNATURE-----

--Sig_/hr3SPf0jR/P_HQtZkCsQrSN--


--===============6121707228232092373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6121707228232092373==--
