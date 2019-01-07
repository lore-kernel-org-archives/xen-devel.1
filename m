From: Olaf Hering <olaf@aepfle.de>
Subject: Re: status of non-live migration of HVM with libvirt
Date: Mon, 7 Jan 2019 11:07:43 +0100
Message-ID: <20190107110737.1ef0a0ef.olaf@aepfle.de>
References: <20190104165755.73674a27.olaf@aepfle.de>
 <20190104174831.271161e5.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5666947609532826266=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qx09=PP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ggRp7-0002Fp-Pw
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 10:07:58 +0000
In-Reply-To: <20190104174831.271161e5.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============5666947609532826266==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/5mnP3qj_eVwHeKhAUwQDS07"; protocol="application/pgp-signature"

--Sig_/5mnP3qj_eVwHeKhAUwQDS07
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 4 Jan 2019 17:48:31 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> Am Fri, 4 Jan 2019 16:57:55 +0100
> schrieb Olaf Hering <olaf@aepfle.de>:
>=20
> > worth keeping (and fixing) the concept of an "offline migration" =20
>=20
> And regarding the fix, it looks like qmp_xen_save_devices_state does not =
need the concept of "live". Just shutdown the blockdevices and be done with=
 it?

Anthony, it looks like 5d6c599fe1 ("migration, xen: Fix block image lock is=
sue on live migration") went too far. Why does stopping the disks at the ve=
ry end of the save/migrate process depend on "live"? During a migration the=
 disks have to be released either way. During "xl save" the domU may contin=
ue to run, if '-c' was specified.=20

It seems the 'live' parameter for xen-save-devices-state is not needed.

Olaf

--Sig_/5mnP3qj_eVwHeKhAUwQDS07
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXDMk7wAKCRBdQqD6ppg2
fldDAKCuMUDGIe4QG2/YzyGDLIkxzYUlcwCgukuWER8Wc0TPGAuAvv6CEL2ATmo=
=Zpyl
-----END PGP SIGNATURE-----

--Sig_/5mnP3qj_eVwHeKhAUwQDS07--


--===============5666947609532826266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5666947609532826266==--
