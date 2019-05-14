From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v5] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Tue, 14 May 2019 10:14:52 +0200
Message-ID: <20190514101452.10c40b6e.olaf@aepfle.de>
References: <20190514080558.14540-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0975701872615336832=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZE1V=TO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQSaY-0000w9-4b
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 08:15:06 +0000
In-Reply-To: <20190514080558.14540-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0975701872615336832==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/8_sG1PWKO5Z3DkANiIxesBR"; protocol="application/pgp-signature"

--Sig_/8_sG1PWKO5Z3DkANiIxesBR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 14 May 2019 10:05:58 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> @@ -459,7 +461,9 @@ int libxl__domain_resume(libxl__gc *gc, uint32_t domi=
d, int suspend_cancel)
>          goto out;
>      }
> =20
> -    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
> +    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM ||
> +        libxl__device_model_version_running(gc, domid) =3D=3D
> +        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
>          rc =3D libxl__domain_resume_device_model(gc, domid);
>          if (rc) {
>              LOGD(ERROR, domid, "failed to resume device model:%d", rc);

I think this could be done like that instead, so that libxl__device_model_v=
ersion_running
is called just once:

--- a/tools/libxl/libxl_dom_suspend.c
+++ b/tools/libxl/libxl_dom_suspend.c
@@ -444,6 +444,8 @@ int libxl__domain_resume_device_model(libxl__gc *gc, ui=
nt32_t domid)
         if (libxl__qmp_resume(gc, domid))
             return ERROR_FAIL;
         break;
+    case LIBXL_DEVICE_MODEL_VERSION_NONE:
+        break;
     default:
         return ERROR_INVAL;
     }
@@ -461,14 +463,10 @@ int libxl__domain_resume(libxl__gc *gc, uint32_t domi=
d, int suspend_cancel)
         goto out;
     }
=20
-    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM ||
-        libxl__device_model_version_running(gc, domid) =3D=3D
-        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
-        rc =3D libxl__domain_resume_device_model(gc, domid);
-        if (rc) {
-            LOGD(ERROR, domid, "failed to resume device model:%d", rc);
-            goto out;
-        }
+    rc =3D libxl__domain_resume_device_model(gc, domid);
+    if (rc) {
+        LOGD(ERROR, domid, "failed to resume device model:%d", rc);
+        goto out;
     }
=20
     if (xc_domain_resume(CTX->xch, domid, suspend_cancel)) {


While it is easy for the resume path, doing the same in the suspend path
needs more changes. libxl__domain_suspend_device_model would need to receive
the callback and set it if a device model is active.

Should this be done on top of this change?

Olaf

--Sig_/8_sG1PWKO5Z3DkANiIxesBR
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNp4/AAKCRBdQqD6ppg2
fuF0AJ45yZ0+FmU4ej3jZBqXIeadW51Q1QCgm9BbTkX9BDcF1hjKCBRDtvz7+mw=
=0uEf
-----END PGP SIGNATURE-----

--Sig_/8_sG1PWKO5Z3DkANiIxesBR--


--===============0975701872615336832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0975701872615336832==--
