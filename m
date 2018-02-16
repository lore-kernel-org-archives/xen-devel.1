From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
Date: Fri, 16 Feb 2018 19:51:22 +0100
Message-ID: <20180216185122.GK4302@mail-itl>
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4525239899189674207=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============4525239899189674207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="enLffk0M6cffIOOh"
Content-Disposition: inline


--enLffk0M6cffIOOh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2018 at 05:52:50PM +0000, Andrew Cooper wrote:
> On 16/02/18 17:48, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >
> > As in the subject, the guest crashes on boot, before kernel output
> > anything. I've isolated this to the conditions below:
> >  - PV guest have PCI device assigned (e1000e emulated by QEMU in this c=
ase),
> >    without PCI device it works
> >  - Xen (in KVM) is started through OVMF; with seabios it works
> >  - nested HVM is disabled in KVM
> >  - AMD IOMMU emulation is disabled in KVM; when enabled qemu crashes on
> >    boot (looks like qemu bug, unrelated to this one)
> >
> > Version info:
> >  - KVM host: OpenSUSE 42.3, qemu 2.9.1, ovmf-2017+git1492060560.b6d11d7=
c46-4.1, AMD
> >  - Xen host: Xen 4.8.3, dom0: Linux 4.14.13
> >  - Xen domU: Linux 4.14.13, direct boot
> >
> > Not sure if relevant, but initially I've tried booting xen.efi /mapbs
> > /noexitboot and then dom0 kernel crashed saying something about conflict
> > between e820 and kernel mapping. But now those options are disabled.
> >
> > The crash message:
> > (XEN) d1v0 Unhandled invalid opcode fault/trap [#6, ec=3D0000]
> > (XEN) domain_crash_sync called from entry.S: fault at ffff82d080218720 =
entry.o#create_bounce_frame+0x137/0x146
> > (XEN) Domain 1 (vcpu#0) crashed on cpu#1:
> > (XEN) ----[ Xen-4.8.3  x86_64  debug=3Dn   Not tainted ]----
> > (XEN) CPU:    1
> > (XEN) RIP:    e033:[<ffffffff826d9156>]
>=20
> This is #UD, which is most probably hitting a BUG().=C2=A0 addr2line this=
 ^
> to find some code to look at.

addr2line failed me, but System.map says its xen_memory_setup. And it
looks like the BUG() is the same as I had in dom0 before:
"Xen hypervisor allocated kernel memory conflicts with E820 map".

Disabling e820_host in guest config solved the problem. Thanks!

Is this some bug in Xen or OVMF, or is it expected behavior and e820_host
should be avoided?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--enLffk0M6cffIOOh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlqHKCIACgkQ24/THMrX
1yzdQwf/XQC1Ys92wfLJVRSsgHFLDjFofPlzaNqnFrXRzhxPMPR7tZAF2lXpMKfP
S6dhtrei/D0ZZ5UTNmHegLADXnscA1FHk4lMwdXYxEkf/lujtmK0pNcHijpWyb1X
QlKZe5rBXAZu4KVzvPe0K7hpY+X0b9Wkd4INZUbpAG4TuwiZLBWe35Ch9z8Ti3LC
5OtN7RzK852dsOzQyDi2Ih6tp9MlidEKeQM5QftzkYasEryenv72JbwqmalCNzI3
TQzHXZVDYSGCdEGSrwt+SpbhVIcNz31/6F1JwPplFY68LaTvy3iX1UQydli+S94t
+DQe/GilsRu2KA+roB6EVtvPa8qK4A==
=eP0c
-----END PGP SIGNATURE-----

--enLffk0M6cffIOOh--


--===============4525239899189674207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4525239899189674207==--
