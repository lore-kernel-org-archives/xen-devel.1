From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Thu, 13 Sep 2018 10:24:03 +0200
Message-ID: <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2567243330769129966=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tvlc=l3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g0Mvc-0004jf-RB
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 08:24:44 +0000
In-Reply-To: <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano@stabellini.net>
List-Id: xen-devel@lists.xenproject.org


--===============2567243330769129966==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NAcX/6qYEXe8jIuuSmY/"


--=-NAcX/6qYEXe8jIuuSmY/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

So, first of all:
1. use plaintext, not HTML
2. don't drop the xen-devel list (and other Cc-s) when replying.

:-)

That being said...

On Thu, 2018-09-13 at 09:38 +0200, Milan Boberic wrote:
> Hi Dario,=20
> yes passtrhough is involved.=20
>
Ok.

> This is everything I did so far:=20
>=20
> I implemented Xen Hypervisor 4.9.2 on UltraZed-EG board with carrier
> card following these steps:
> 1.) installed petalinux 2018.2 on Ubuntu 16.04
> 2.) dowloaded  UltraZed-EG IO Carrier Card - PetaLinux 2018.2
> Standard BSP
> 3.) created project:   petalinux-create -t project =E2=80=93s  <path_to_B=
SP>
> 4.) copied xen-overlay.dtsi from ZCU102 project (also made with BSP)
> to my project
> 5.) built xen hypervisor following this guide link  (booting with SD
> card)
> 6.) made baremetal application that blinks PS LED with Vivado
> 7.) measured signals jitted when application is on board with and
> with out Xen
>=20
I am not familiar with building an SD-Card image for an ARM system with
Xen on it. What I can tell, though, is that Xen 4.9.2 does not look to
me to include the RCU subsystem fixes that I mentioned in my reply.

I don't recall why we did not backport them. It may be that they're not
entirely trivial, and they fix a behavior which manifests only in not
fully supported cases. Or that we (well, I :-/) forgot.

I can have a look, at how challenging it is to apply the patches to
4.9.x (but no hard feelings if anyone beats me at it, I promise
:-D).

In the meantime, if you have the chance of trying Xen 4.10 or 4.10.1,
which has those fixes, that would be great. In fact, in case everything
would work with such version, that would be another clue that the RCU
issue is the actual culprit.

> I menaged to decrease jitter adding sched=3Dnull vwfi=3Dnative in xen-
> overlay.dtsi file in xen-bootargs.
>=20
> The problem is when I add sched=3Dnull vwfi=3Dnative, I can create my
> bare-metal application with xl create and destroy it with xl destroy
> (it disappears from xl list) but when I want to start it again (xl
> create) this error pops:
>=20
> root@uz3eg-iocc-2018-2:~# xl create bm1.cfg
> Parsing config from bm1.cfg
> (XEN) IRQ 48 is already used by domain 1
> libxl: error: libxl_create.c:1278:domcreate_launch_dm: Domain
> 2:failed give domain access to irq 48: Device or resource busy
> libxl: error: libxl_domain.c:1003:libxl__destroy_domid: Domain 2:Non-
> existant domain
> libxl: error: libxl_domain.c:962:domain_destroy_callback: Domain
> 2:Unable to destroy guest
> libxl: error: libxl_domain.c:889:domain_destroy_cb: Domain
> 2:Destruction of domain failed
>=20
> When I remove  sched=3Dnull vwfi=3Dnative and build project again
> everything works fine, I can create and destroy bm app as many times
> as I want.
>=20
Yes. If you look at the email (and to the full thread) I put links to,
you'll see that the behavior is exactly the same. It mentions the
Credit2 scheduler not working, rather than null, but the problem is the
same, i.e., that there is no periodic timer tick neither in Credit2 nor
in null.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-NAcX/6qYEXe8jIuuSmY/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluaHqYACgkQFkJ4iaW4
c+5jRRAAjcXqMaDdtOsUnIFkI+gv91Tc0HvSU2fKeIQLhq1RXGWcHYcYp2ZC4Vjk
GhmgdRPY1wg8XlzSYdgDC0kSEjRpy7R3ELcJthG8zksMh8LU7Vk8FmqpWnteeG4R
xjjtMTFR+5z4EbObwEOMLslO1CTMOqLvjxldss65fPwN/+Dpp/qUHGirJnwd5QKq
eqDgCopkTmwH8NXM1xRF1jJLxiLbJ7htjcCFr8UIw1/uvPoI4swUa5JnQYf/wQcw
4GnI8iuZxGpXLMvYJVkxJ7MxtslKnD92k/OiOUFoYA77fpZ6+009gPrJJ4MtR7PG
IFLoREshbARPFQZd0liu52pDa5DZCrZqZys9LwV9KeuX9ajquWnch5JaIl/TquMK
v97gGSHWx8u3CakK8Ov9U+OrRkOyfteZnO7dvmacGhvt4k1bjMp6FA+xzBccNes2
/DthxJsEIEGx9RoA8n1FXfe2evza4chivhJc2ebHBh8/153SdxbAr/SReZQ1Winr
G4tnS4t4Id92yskIS2Mpi87vcAEsRd1maSSV7gwOUA4uYfSBLsQI+TVIZnSra+gO
RpM6kXiSRdC6qf9Kl0jd/Q8yCQGLf3JE+0SI/+YIN9PqtIXDDc8K3mu7UC8tECBi
VRh5sJmEYjP/jM7DYLI+U5EsDICmdTZ2Vl2p5RtuGKgVOLHdbzA=
=0rT0
-----END PGP SIGNATURE-----

--=-NAcX/6qYEXe8jIuuSmY/--



--===============2567243330769129966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2567243330769129966==--
