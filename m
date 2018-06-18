From: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [Qemu-devel] [PATCH] compiler: add a sizeof_field()
 macro
Date: Mon, 18 Jun 2018 14:53:59 +0100
Message-ID: <20180618135359.GA29670@stefanha-x1.localdomain>
References: <20180614164431.29305-1-stefanha@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3880064954187618927=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=iele=je=gmail.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1fUubc-0005jW-Jl
 for xen-devel@lists.xenproject.org; Mon, 18 Jun 2018 13:54:04 +0000
Received: by mail-wm0-x244.google.com with SMTP id r15-v6so14228819wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jun 2018 06:54:02 -0700 (PDT)
In-Reply-To: <20180614164431.29305-1-stefanha@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: xen-devel@lists.xenproject.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org


--===============3880064954187618927==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 14, 2018 at 05:44:31PM +0100, Stefan Hajnoczi wrote:
> Determining the size of a field is useful when you don't have a struct
> variable handy.  Open-coding this is ugly.
>=20
> This patch adds the sizeof_field() macro, which is similar to
> typeof_field().  Existing instances are updated to use the macro.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/xen/io/ring.h      |  2 +-
>  include/qemu/compiler.h       |  2 ++
>  accel/tcg/translate-all.c     |  2 +-
>  hw/display/xenfb.c            |  4 ++--
>  hw/net/rocker/rocker_of_dpa.c |  2 +-
>  hw/net/virtio-net.c           |  2 +-
>  target/i386/kvm.c             |  2 +-
>  target/ppc/arch_dump.c        | 10 +++++-----
>  target/s390x/arch_dump.c      | 20 ++++++++++----------
>  9 files changed, 24 insertions(+), 22 deletions(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbJ7l3AAoJEJykq7OBq3PIQesH/j+BYQL0WSDN933cos7cjyP4
AlONbcdVAyhuh/it2FCS0idLKgTKkeY7Wuh7GJajQGRJOa41ZBfhCyAj4zOnwcyU
/00uHwE6qtycVxVfaxsx5s03QLRSP5ogZR+RMWBWpgX75pmg7/ZD1D8Z2YR4+TTE
fVCz6Y4WJ0mVEfI6fjqbfK/FV/a4unC9IfngXWFi/Q4d9PXJpN4IvRGxf8Hu9HIM
bWv2Z4V2u0/R7J48+Y/VmPf9/YYq8efWz+X3U7MlVG6NjUAC6ZHs3BONPg6xZZxU
/5UjIMZ4V9Fxka7NHuqJNnoBWyG3cnYUYGuBx72B0l0DgpX4Vpyae2fgKkoLVKU=
=QGc6
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--


--===============3880064954187618927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3880064954187618927==--
