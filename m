From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Thu, 17 May 2018 10:31:06 +0200
Message-ID: <20180517103106.350a410e.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0852778484775253489=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180507151940.GA31926@aepfle.de>
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

--===============0852778484775253489==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/3o.F.GyeaBadkCT2Tld6hmU"; protocol="application/pgp-signature"

--Sig_/3o.F.GyeaBadkCT2Tld6hmU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 7 May 2018 17:19:46 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> With qemu-2.11 the sender thinks everything is alright and the domU is mo=
ved.

Another case of breakage in qemu-2.11:
if the targethost does not even have access to the diskimage the sender sti=
ll thinks everything is alright. qemu does not propagate the error to libxl=
 to allow it to abort the migration.

Olaf

--Sig_/3o.F.GyeaBadkCT2Tld6hmU
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWv09ygAKCRBdQqD6ppg2
foJvAKCdx3tzFxJZTu9ELzrLn2KtNP7lZwCXXrzO2Hvbv6n4dcICWucvFU57UQ==
=3pHe
-----END PGP SIGNATURE-----

--Sig_/3o.F.GyeaBadkCT2Tld6hmU--


--===============0852778484775253489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0852778484775253489==--
