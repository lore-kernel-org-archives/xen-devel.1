From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: libxl - avoid calling block script
Date: Fri, 9 Feb 2018 02:02:42 +0100
Message-ID: <20180209010242.GA2297@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7559114612517626809=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============7559114612517626809==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'd like to avoid calling block script to speed up domain startup a
little (there may be multiple disks, all already being block devices).
Right now I have restored setting physical-device xenstore entry in
libxl (by reverting [1]), then applying the patch below (it's on 4.8).
This works well for my case, but maybe there is some option to have it
in vanilla Xen? Right now, this require explicit "script=3Dblock" to call
the script (for example to setup loop device).

Alternative idea I have is setting disk->script=3D"block" early
(in libxl_device_disk_init()?), so default do not change, but it's still
possible to change it to NULL and avoid calling the script. The problem
is libxl_device_disk_init() is a generated and I don't see how it could
be modified... Any hints?

Yet another idea is having some specific value for disk->script,
that would avoid calling it, but I find this much less elegant solution.

[1] http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3De885362

=46rom: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
Subject: [PATCH] libxl: do not call default block script

Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
---
 tools/libxl/libxl.c       | 8 +++++---
 tools/libxl/libxl_linux.c | 5 ++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/libxl/libxl.c b/tools/libxl/libxl.c
index 11d94ff..74a2421 100644
--- a/tools/libxl/libxl.c
+++ b/tools/libxl/libxl.c
@@ -2093,9 +2093,11 @@ static void device_disk_add(libxl__egc *egc, uint32_=
t domid,
                 flexarray_append(back, "params");
                 flexarray_append(back, dev);
=20
-                script =3D libxl__abs_path(gc, disk->script?: "block",
-                                         libxl__xen_script_dir_path());
-                flexarray_append_pair(back, "script", script);
+                if (disk->script || disk->backend_domid !=3D LIBXL_TOOLSTA=
CK_DOMID) {
+                    script =3D libxl__abs_path(gc, disk->script?: "block",
+                            libxl__xen_script_dir_path());
+                    flexarray_append_pair(back, "script", script);
+                }
=20
                 /* If the user did not supply a block script then we
                  * write the physical-device node ourselves.
diff --git a/tools/libxl/libxl_linux.c b/tools/libxl/libxl_linux.c
index 115332a..923a1d0 100644
--- a/tools/libxl/libxl_linux.c
+++ b/tools/libxl/libxl_linux.c
@@ -334,9 +334,8 @@ static int libxl__hotplug_disk(libxl__gc *gc, libxl__de=
vice *dev,
     script =3D libxl__xs_read(gc, XBT_NULL,
                             GCSPRINTF("%s/%s", be_path, "script"));
     if (!script) {
-        LOGEV(ERROR, errno, "unable to read script from %s", be_path);
-        rc =3D ERROR_FAIL;
-        goto error;
+        LOG(INFO, "no script for %s", be_path);
+        return 0;
     }
=20
     *env =3D get_hotplug_env(gc, script, dev);
--=20
1.8.1.4


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlp9Y7EACgkQ24/THMrX
1yyI4AgAgaepGeKMcRvyFfWqI6eYX1FLGxCilqlXr9H6OiWMLwU5+siCaTWg7YXT
s8CO5gA6/qgNr/o6TqwexAqrsdQlobyCaRYrsNaCIuAK7YYCjyV/pgvUd3liJvfj
gU21uo2c7IqIDlUbiwZz8qvo16+ch96jfmBhhcj8lyNZvaqgm6WyAlZUiNb8gEr/
tyaGxpP2NRsYVYdhsahDCUdJMnFH/39JNTdwa+IMrhG5QESITPZhIzknPH05i6CE
yLaSbsQfAFk+g2o0dG7gybSmFHmBY9WMHLf+Tiolz47RLx9TXmmjlcSiAaaVmQui
etCdABLeU+jjYLdM4Z0W79Qn2+tepQ==
=GKws
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--


--===============7559114612517626809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7559114612517626809==--
