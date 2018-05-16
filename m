From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Test for osstest, features used in Qubes OS
Date: Wed, 16 May 2018 23:54:25 +0200
Message-ID: <20180516215425.GB11683@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5328994843413501949=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5328994843413501949==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

As discussed some time ago, I'd like to help with adding tests for some
features we use in Qubes OS.

IMO the easiest thing to test is host suspend. You just need to execute
"rtcwake -s 30 -m mem", and see if the host is back to live after ~30s.
Right now I know it works on Xen 4.8, but supposedly is broken on
staging (haven't tested the most recent version).
Next step would be the same while having some domains running.

How the test should look like (where to add this? etc)?

Next things would be mostly related to PCI passthrough:
 - PCI passthrough with qemu in stubdomain
 - the same as above, but with Linux-based stubdomain (we need cleanup
   and send patches for that first, probably 4.12 material)
 - guest suspend (recently added libxl_domain_suspend_only), for
   different guest types (PV, PVH, HVM), also with/without PCI device

For this, the machine obviously need to have IOMMU (I assume at least
some of the hardware used in test lab have it), and some spare PCI
device. I use sound card for some of such tests. But testing on USB
controllers would be more useful (from out experience, one of the most
problematic devices for suspend, sadly also lacking FLR or such...).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlr8qJEACgkQ24/THMrX
1yyM6Qf9FBRzPGo5yf5P3lO5CIRC6GuFtMv6eghA3UrUnTNGSs37EchY06Zjkaip
vxFSCFYwxW5cE2B3CSg9ma+U5eBStPKHlokznxEn6lx++V/swVl3AisezoGE/dxC
CB8/136cUtI6NK3+OUKiqj7k70b4m3U9LKpOC2FN7Vd6mdDtt+FIBETl8a6/MRYi
7IE8xbGIy41btE8uaUe9rQo/3HZN71se6XOUijdJJ4R99YIGTiV0nZx6FoodABW+
zVc4QJyaaJpPcgHlcL/YLEPQi5I1LM0xpXRmBxnLoPG1u1/1NEbVrcXnRQjWQ+zX
gHGAGq/JYmFqlw10muASakreAM2JqQ==
=G/d9
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--


--===============5328994843413501949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5328994843413501949==--
