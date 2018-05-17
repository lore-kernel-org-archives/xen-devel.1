From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Thu, 17 May 2018 11:08:56 +0200
Message-ID: <20180517110856.545ae403.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
 <20180508133143.77e209f2.olaf@aepfle.de>
 <20180510104018.GA2057@perard.uk.xensource.com>
 <20180516165328.73d2a86a.olaf@aepfle.de>
 <20180517083058.37363fdd.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6249201739893834077=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180517083058.37363fdd.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============6249201739893834077==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/q+YrJquM9_bPcG122RBwF0t"; protocol="application/pgp-signature"

--Sig_/q+YrJquM9_bPcG122RBwF0t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 17 May 2018 08:30:58 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> I think the issue fixed by 5d6c599fe1d69a1bf8c5c4d3c58be2b31cd625ad is no=
t specific to HVM. It seems domain_suspend_common_guest_suspended would cal=
l that changed function only for HVM. It seems the logic is wrong. It is no=
t about the device model, but about that fact that 'disk=3D=3Dqcow2' requir=
es qemu-upstream.

This fixes it for me. Now the question is how to do that properly for all s=
orts of diskimage types.

Olaf
--- a/tools/libxl/libxl_dom_suspend.c
+++ b/tools/libxl/libxl_dom_suspend.c
@@ -385,6 +385,21 @@ static void domain_suspend_common_guest_
             domain_suspend_common_done(egc, dsps, rc);
             return;
         }
+    } else if (dsps->type =3D=3D LIBXL_DOMAIN_TYPE_PV) {
+        uint32_t const domid =3D dsps->domid;
+        const char *const filename =3D dsps->dm_savefile;
+        rc =3D libxl__qmp_stop(gc, domid);
+        if (rc) {
+            LOGD(ERROR, domid, "failure from libxl__qmp_stop domid:%d", rc=
);
+            return;
+        }
+        /* Save DM state into filename */
+        rc =3D libxl__qmp_save(gc, domid, filename, dsps->live);
+        if (rc) {
+            unlink(filename);
+            LOGD(ERROR, domid, "failure from libxl__qmp_save domid:%d", rc=
);
+            return;
+        }
     }
     domain_suspend_common_done(egc, dsps, 0);
 }
@@ -466,6 +481,12 @@ int libxl__domain_resume(libxl__gc *gc,
             LOGD(ERROR, domid, "failed to resume device model:%d", rc);
             goto out;
         }
+    } else if (type =3D=3D LIBXL_DOMAIN_TYPE_PV) {
+        if (libxl__qmp_resume(gc, domid)) {
+            rc =3D ERROR_FAIL;
+            LOGD(ERROR, domid, "failed to resume device model:%d", rc);
+            goto out;
+        }
     }
=20
     if (xc_domain_resume(CTX->xch, domid, suspend_cancel)) {

--Sig_/q+YrJquM9_bPcG122RBwF0t
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWv1GqAAKCRBdQqD6ppg2
fr45AKC+2plEVZnxdEQ2kijmw8LM4j74EwCgoZolKoqTQzET64AlzcVWsqiabok=
=2vYH
-----END PGP SIGNATURE-----

--Sig_/q+YrJquM9_bPcG122RBwF0t--


--===============6249201739893834077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6249201739893834077==--
