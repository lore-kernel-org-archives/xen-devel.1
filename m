From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] tools/xenstore: try to get minimum
 thread stack size for watch thread
Date: Tue, 6 Mar 2018 12:24:07 +0100
Message-ID: <20180306112407.GA12941@aepfle.de>
References: <20180226084612.2844-1-jgross@suse.com>
 <ef2fdeb4-ebd3-9fff-aff9-b7a9d176cbd1@suse.com>
 <20180302122931.vulvnjyz2lwqck43@citrix.com>
 <20180302124024.ka6hdd4zrckuhqon@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2346672421248128378=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mg/d=f4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1etAhg-0007M7-7i
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 11:24:20 +0000
In-Reply-To: <20180302124024.ka6hdd4zrckuhqon@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Jim Fehlig <jfehlig@suse.com>, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org


--===============2346672421248128378==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 02, Wei Liu wrote:

> But still, Juergen must have tested the change, so I wonder why it
> doesn't work in your setup. What is your build environment? Gcc version?

Unclear what the difference is between building in clean chroot and locally.
This change fixes it for me:

--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -148,6 +148,9 @@ SHLIB_libxenguest  =3D $(SHDEPS_libxenguest) -Wl,-rpath=
-link=3D$(XEN_LIBXC)
 CFLAGS_libxenstore =3D -I$(XEN_XENSTORE)/include $(CFLAGS_xeninclude)
 SHDEPS_libxenstore =3D $(SHLIB_libxentoolcore)
 LDLIBS_libxenstore =3D $(SHDEPS_libxenstore) $(XEN_XENSTORE)/libxenstore$(=
libextension)
+ifeq ($(CONFIG_Linux),y)
+LDLIBS_libxenstore +=3D -ldl
+endif
 SHLIB_libxenstore  =3D $(SHDEPS_libxenstore) -Wl,-rpath-link=3D$(XEN_XENST=
ORE)
=20
 CFLAGS_libxenstat  =3D -I$(XEN_LIBXENSTAT)
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -103,6 +103,7 @@ xs.opic: CFLAGS +=3D -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
 xs.opic: CFLAGS +=3D -DUSE_DLSYM
 libxenstore.so.$(MAJOR).$(MINOR): LDFLAGS +=3D -ldl
+LDLIBS_xenstored +=3D -ldl
 endif
=20
 libxenstore.so.$(MAJOR).$(MINOR): xs.opic xs_lib.opic

Olaf

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWp56VgAKCRBdQqD6ppg2
fpRSAJ4yicjQZSlpHGc96q5iCAEW1zGvgQCg7IkeBRa2JP3SvQ7vJpvNarRdjp0=
=9+sI
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


--===============2346672421248128378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2346672421248128378==--
