From: Olaf Hering <olaf@aepfle.de>
Subject: Re: usage of libxc compat function fails with staging
Date: Fri, 26 Oct 2018 11:37:33 +0200
Message-ID: <20181026113733.7e149032.olaf@aepfle.de>
References: <20181025140808.13eefc21.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7736790740194921993=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181025140808.13eefc21.olaf@aepfle.de>
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

--===============7736790740194921993==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/GnHBlAQXmCrFhUl5jmUlHqJ"; protocol="application/pgp-signature"

--Sig_/GnHBlAQXmCrFhUl5jmUlHqJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 25 Oct 2018 14:08:08 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> qemu-2.9-20170907T112512.4cd42653f5/include/hw/xen/xen_common.h:61:16: wa=
rning: implicit declaration of function 'xc_map_foreign_bulk'
> qemu is built with the various compat flags like :-DXC_WANT_COMPAT_MAP_FO=
REIGN_API=3D1. I think this should give access to that function.

This appears to be a bug in Qemu. What is the purpose of commit 5eeb39c24b =
("xen: Use stable library interfaces when they are available.")? I do think=
 Qemu can not predict the future of Xen...


Olaf

--Sig_/GnHBlAQXmCrFhUl5jmUlHqJ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW9LgXQAKCRBdQqD6ppg2
fsIlAJ9FcXoyXJSi0x6F76epnh+OZO/xJgCfZUfBm2I2YXMCHBH2C7zWQlaVD/c=
=M++j
-----END PGP SIGNATURE-----

--Sig_/GnHBlAQXmCrFhUl5jmUlHqJ--


--===============7736790740194921993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7736790740194921993==--
