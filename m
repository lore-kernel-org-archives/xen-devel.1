From: Olaf Hering <olaf@aepfle.de>
Subject: CPU flags disappear on Spectre enabled host
Date: Fri, 20 Jul 2018 11:21:56 +0200
Message-ID: <20180720112156.69e44899.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2865783238031754730=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
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

--===============2865783238031754730==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/MlEsoGEKlEjHwRm5mx=vjo9"; protocol="application/pgp-signature"

--Sig_/MlEsoGEKlEjHwRm5mx=vjo9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On a host that is booted with the following command line, certain cpu flags=
 disappear in xen-4.9 and later:

(XEN) Command line: loglvl=3Dall guest_loglvl=3Dall console=3Dcom1 com1=3D5=
7600 cpuid=3Dibrsb,stibp,ibpb,ssbd spec-ctrl=3Dibrs,ibpb,ssbd,bti-thunk=3Dr=
etpoline xpti=3Dyes

On my test system the difference in dom0s /proc/cpuinfo is like that:
--- xen-dom0-4.8-spectre.txt
+++ xen-dom0-4.12-spectre.txt
-arat
-arch_perfmon
-dtherm
-epb
-ida
+ss

The concern is that a domU started on a xen-4.8 or earlier host, which is t=
hen migrated to xen-4.9 or later may miss these cpu flags at runtime.

Is the loss of cpuflags intentional?

I just noticed that at least in staging a boot with "no-ibrsb no-stibp no-i=
bpb no-ssbd spec-ctrl=3Dno-xen,rsb=3Dno xpti=3Dno" does still not show thes=
e flags in dom0.

Olaf

--Sig_/MlEsoGEKlEjHwRm5mx=vjo9
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW1GptAAKCRBdQqD6ppg2
fuIoAKD3OdMWHkQ8rVTzhb6UEs/X2SE3+ACdE+sJHE9nRw4PUNGJs91P17/jEvA=
=q9+h
-----END PGP SIGNATURE-----

--Sig_/MlEsoGEKlEjHwRm5mx=vjo9--


--===============2865783238031754730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2865783238031754730==--
