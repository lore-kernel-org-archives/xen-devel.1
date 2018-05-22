From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: always call qemus
 xen-save-devices-state in suspend/resume
Date: Tue, 22 May 2018 10:52:20 +0200
Message-ID: <20180522105220.607f3f48.olaf@aepfle.de>
References: <20180517155108.4624-1-olaf@aepfle.de>
 <20180518170142.5q2773ivsfjt2b4y@citrix.com>
 <20180518210910.02c83631.olaf@aepfle.de>
 <20180521081820.2eue7occ26ouxzb3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0142435525533131939=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180521081820.2eue7occ26ouxzb3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============0142435525533131939==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/xY9BQV_HPWR1SOks3bxiX5."; protocol="application/pgp-signature"

--Sig_/xY9BQV_HPWR1SOks3bxiX5.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 21 May 2018 09:18:20 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> What I mean is: now you seem to want to call
> libxl__domain_suspend_device_model when QEMU upstream is running,
> regardless of whether a guest is HVM or PV, so the check for HVM should
> be gone.

libxl__domain_suspend_device_model calls libxl__device_model_version_runnin=
g,
which may return LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL in case
"dm-version" does not exist.
Is it valid to assume that a non-existant "dm-version" means qemu-trad?
So far I have not tested a PV domU with qemu-trad, not sure if that can work
anyway.

Also, libxl__device_model_version_running may return -1. Is that valid?

Olaf

--Sig_/xY9BQV_HPWR1SOks3bxiX5.
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWwPaRAAKCRBdQqD6ppg2
fhtMAKDIk2iDNRlXrxrbh+78Iv/U69jsCgCgj7NSOH7V1yH3pAN21N5E3WGzOD8=
=LZfR
-----END PGP SIGNATURE-----

--Sig_/xY9BQV_HPWR1SOks3bxiX5.--


--===============0142435525533131939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0142435525533131939==--
