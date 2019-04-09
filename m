From: Olaf Hering <olaf@aepfle.de>
Subject: Re: status of non-live migration of HVM with libvirt
Date: Tue, 9 Apr 2019 18:06:42 +0200
Message-ID: <20190409160642.GA18345@aepfle.de>
References: <20190104165755.73674a27.olaf@aepfle.de>
 <20190104174831.271161e5.olaf@aepfle.de>
 <20190107110737.1ef0a0ef.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4579897145740428844=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iKuQ=SL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hDtGx-0004em-Ql
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:06:56 +0000
In-Reply-To: <20190107110737.1ef0a0ef.olaf@aepfle.de>
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


--===============4579897145740428844==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Anthony,

looks like this fix missed qemu-4.0.

What is your opinion on this fix? I think there was zero reply...

Olaf

On Mon, Jan 07, Olaf Hering wrote:

> Am Fri, 4 Jan 2019 17:48:31 +0100
> schrieb Olaf Hering <olaf@aepfle.de>:
>=20
> > Am Fri, 4 Jan 2019 16:57:55 +0100
> > schrieb Olaf Hering <olaf@aepfle.de>:
> >=20
> > > worth keeping (and fixing) the concept of an "offline migration" =20
> >=20
> > And regarding the fix, it looks like qmp_xen_save_devices_state does no=
t need the concept of "live". Just shutdown the blockdevices and be done wi=
th it?
>=20
> Anthony, it looks like 5d6c599fe1 ("migration, xen: Fix block image lock =
issue on live migration") went too far. Why does stopping the disks at the =
very end of the save/migrate process depend on "live"? During a migration t=
he disks have to be released either way. During "xl save" the domU may cont=
inue to run, if '-c' was specified.=20
>=20
> It seems the 'live' parameter for xen-save-devices-state is not needed.
>=20
> Olaf


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXKzDDgAKCRBdQqD6ppg2
fqy3AJ42berK3PGBfgU75eiLm2AzTDTnUQCgqZ3uT+4FFs0riZUS4tSDVrIxX0Q=
=gqiC
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


--===============4579897145740428844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4579897145740428844==--
