From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: always call qemus
 xen-save-devices-state in suspend/resume
Date: Thu, 21 Jun 2018 17:34:54 +0200
Message-ID: <20180621173454.39fbf51f.olaf@aepfle.de>
References: <20180517155108.4624-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0258089340441195271=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180517155108.4624-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0258089340441195271==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/M5.=JZ3I_LM8d=v1RibR/sm"; protocol="application/pgp-signature"

--Sig_/M5.=JZ3I_LM8d=v1RibR/sm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 17 May 2018 17:51:08 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> @@ -377,7 +377,9 @@ static void domain_suspend_common_guest_suspended(lib=
xl__egc *egc,
> +        libxl__device_model_version_running(gc, dsps->domid) =3D=3D
> +        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {

Please withdraw that patch. This condition is always true for PV.

Olaf

--Sig_/M5.=JZ3I_LM8d=v1RibR/sm
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWyvFngAKCRBdQqD6ppg2
fgJ0AKC4nUDLphOhKPxlP5ryuH0L5AAwIQCeN4HWjc99fb/ByXsioBsM7I1RB8U=
=eXBf
-----END PGP SIGNATURE-----

--Sig_/M5.=JZ3I_LM8d=v1RibR/sm--


--===============0258089340441195271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0258089340441195271==--
