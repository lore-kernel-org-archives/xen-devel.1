From: Olaf Hering <olaf@aepfle.de>
Subject: Re: how to recognize in libxl that a domU has qemu-xen
 attached?
Date: Thu, 17 May 2018 17:29:57 +0200
Message-ID: <20180517172957.51a92068.olaf@aepfle.de>
References: <20180517143352.1227b39e.olaf@aepfle.de>
 <f4845c2b-d967-7b3b-b567-d83e18fb6f66@suse.com>
 <20180517165400.6b9b9825.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6402504820888571971=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180517165400.6b9b9825.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============6402504820888571971==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/__ZU=o=ooytBSrRB2/0V6yO"; protocol="application/pgp-signature"

--Sig_/__ZU=o=ooytBSrRB2/0V6yO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 17 May 2018 16:54:00 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Am Thu, 17 May 2018 14:55:10 +0200
> schrieb Juergen Gross <jgross@suse.com>:
> > libxl__need_xenpv_qemu() is used to determine whether a pv domain needs
> > a qemu process for at least one backend.  =20
> Thanks. Too bad, d_config is not available in that context. It is probabl=
y known somewhere by the callers. I guess such caller needs to pass a bool =
down to suspend/resume.

I think we may get around that missing d_config like that, I will test this=
 approach:

--- xen-4.10.0-testing.orig/tools/libxl/libxl_dom_suspend.c
+++ xen-4.10.0-testing/tools/libxl/libxl_dom_suspend.c
@@ -377,7 +377,9 @@ static void domain_suspend_common_guest_
     libxl__ev_xswatch_deregister(gc, &dsps->guest_watch);
     libxl__ev_time_deregister(gc, &dsps->guest_timeout);
=20
-    if (dsps->type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
+    if (dsps->type =3D=3D LIBXL_DOMAIN_TYPE_HVM ||
+        libxl__device_model_version_running(gc, domid) =3D=3D
+        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
         rc =3D libxl__domain_suspend_device_model(gc, dsps);
         if (rc) {
             LOGD(ERROR, dsps->domid,
@@ -460,7 +462,9 @@ int libxl__domain_resume(libxl__gc *gc,
         goto out;
     }
=20
-    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
+    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM ||
+        libxl__device_model_version_running(gc, domid) =3D=3D
+        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
         rc =3D libxl__domain_resume_device_model(gc, domid);
         if (rc) {
             LOGD(ERROR, domid, "failed to resume device model:%d", rc);

Olaf

--Sig_/__ZU=o=ooytBSrRB2/0V6yO
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWv2f9QAKCRBdQqD6ppg2
fj34AKCxjXMPcPsnFlVyOlRsHWIYOVTwNQCfVvVsHWo1lXlLmBXxl7ZNhtVRVjc=
=oJN7
-----END PGP SIGNATURE-----

--Sig_/__ZU=o=ooytBSrRB2/0V6yO--


--===============6402504820888571971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6402504820888571971==--
