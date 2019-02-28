From: Olaf Hering <olaf@aepfle.de>
Subject: Re: bogus libxl error handling in
 domcreate_bootloader_done
Date: Thu, 28 Feb 2019 17:21:59 +0100
Message-ID: <20190228172159.0f5d0e31.olaf@aepfle.de>
References: <20190228141718.7740e706.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7354964282279396184=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JJzu=RD=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gzORo-0006zH-6N
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 16:22:12 +0000
Received: from sender by smtp.strato.de (RZmta 44.13 AUTH)
 with ESMTPSA id C046b5v1SGM7Gm8
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 28 Feb 2019 17:22:07 +0100 (CET)
In-Reply-To: <20190228141718.7740e706.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7354964282279396184==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Cj6Y=Ckh/kY8PsaN=soKLM2"; protocol="application/pgp-signature"

--Sig_/Cj6Y=Ckh/kY8PsaN=soKLM2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 28 Feb 2019 14:17:18 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> In domcreate_bootloader_done, libxl__build_pre is called.
> If that function fails, the label 'out:' is called, which goes straight i=
nto=20
> domcreate_stream_done. This function uses srs->dcs to set libxl__domain_c=
reate_state.
> In my case ->dcs is NULL. The result is a crash in STATE_AO_GC().

This works for me with staging-4.11:

--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -1099,6 +1099,11 @@ static void domcreate_bootloader_done(libxl__egc *eg=
c,
         return;
     }
=20
+    /* Prepare environment for domcreate_stream_done */
+    dcs->srs.ao =3D ao;
+    dcs->srs.dcs =3D dcs;
+    dcs->srs.fd =3D -1;
+
     /* Restore */
     callbacks->restore_results =3D libxl__srm_callout_callback_restore_res=
ults;
=20
@@ -1122,8 +1127,6 @@ static void domcreate_bootloader_done(libxl__egc *egc,
     if (rc)
         goto out;
=20
-    dcs->srs.ao =3D ao;
-    dcs->srs.dcs =3D dcs;
     dcs->srs.fd =3D restore_fd;
     dcs->srs.legacy =3D (dcs->restore_params.stream_version =3D=3D 1);
     dcs->srs.back_channel =3D false;

Olaf

--Sig_/Cj6Y=Ckh/kY8PsaN=soKLM2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXHgKpwAKCRBdQqD6ppg2
fuOgAJ4/Ai+hsbLQyQ5TCUI1UxN5av9YegCcDHvSZxAJYJrXYLrFfOsb4jl+mws=
=P2QH
-----END PGP SIGNATURE-----

--Sig_/Cj6Y=Ckh/kY8PsaN=soKLM2--


--===============7354964282279396184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7354964282279396184==--
