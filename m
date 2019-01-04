From: Olaf Hering <olaf@aepfle.de>
Subject: Re: status of non-live migration of HVM with libvirt
Date: Fri, 4 Jan 2019 17:48:31 +0100
Message-ID: <20190104174831.271161e5.olaf@aepfle.de>
References: <20190104165755.73674a27.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9132769044600243361=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=14Bd=PM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gfSeF-0002Bw-N0
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 16:48:40 +0000
Received: from sender by smtp.strato.de (RZmta 44.9 AUTH)
 with ESMTPSA id 20a457v04Gma1yx
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Fri, 4 Jan 2019 17:48:36 +0100 (CET)
In-Reply-To: <20190104165755.73674a27.olaf@aepfle.de>
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

--===============9132769044600243361==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/K=9imv3kp+ma4H5BnSG5sYX"; protocol="application/pgp-signature"

--Sig_/K=9imv3kp+ma4H5BnSG5sYX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 4 Jan 2019 16:57:55 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> worth keeping (and fixing) the concept of an "offline migration"

And regarding the fix, it looks like qmp_xen_save_devices_state does not ne=
ed the concept of "live". Just shutdown the blockdevices and be done with i=
t?

+++ b/migration/savevm.c
@@ -2293,7 +2293,7 @@ void qmp_xen_save_devices_state(const char *filename,=
 bool has_live, bool live,
          * So call bdrv_inactivate_all (release locks) here to let the oth=
er
          * side of the migration take controle of the images.
          */
-        if (live && !saved_vm_running) {
+        if (!saved_vm_running) {
             ret =3D bdrv_inactivate_all();
             if (ret) {
                 error_setg(errp, "%s: bdrv_inactivate_all() failed (%d)",


Olaf

--Sig_/K=9imv3kp+ma4H5BnSG5sYX
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXC+OXwAKCRBdQqD6ppg2
fqlOAJ0QQPqswwGKP0+YXrgQPIryTNEpKwCfYDYksC94kif+V1+AwwgQMdbL730=
=+7CN
-----END PGP SIGNATURE-----

--Sig_/K=9imv3kp+ma4H5BnSG5sYX--


--===============9132769044600243361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9132769044600243361==--
