From: Olaf Hering <olaf@aepfle.de>
Subject: untracked pvshim related dirty files in staging
Date: Wed, 28 Feb 2018 12:39:13 +0100
Message-ID: <20180228113843.GA25447@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1121638050422619817=="
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


--===============1121638050422619817==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

While building staging I got these two untracked dirty files.
I wonder what should be done about it?

  Changes not staged for commit:
          modified:   tools/firmware/xen-dir/shim.config
  Untracked files:
          tools/firmware/xen-dir/xen-shim-syms

What is the value of adding version and branch name into the Xen
.config?  I remember many years ago I submitted some change to Kbuild in
linux.git which prevents such jitter in .config. Perhaps it was just for
timestamps, I forgot.

--- a/tools/firmware/xen-dir/shim.config
+++ b/tools/firmware/xen-dir/shim.config
@@ -1,6 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Xen/x86 4.11-unstable Configuration
+# Xen/x86 4.11-my_branch_name Configuration
 #
 CONFIG_X86_64=y
 CONFIG_X86=y


Olaf

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWpaU2QAKCRBdQqD6ppg2
fmeYAKDJvOYMu5KlXpEIO+d9wu5I01DDaACeLTFFZiWq+yWSAOTg3BosAljD/Gg=
=ZDEe
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--


--===============1121638050422619817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1121638050422619817==--
