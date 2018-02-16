From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
Date: Fri, 16 Feb 2018 20:54:15 +0100
Message-ID: <20180216195415.GK2084@mail-itl>
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl>
 <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8222464516545064154=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <JGross@suse.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============8222464516545064154==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cDtQGJ/EJIRf/Cpq"
Content-Disposition: inline


--cDtQGJ/EJIRf/Cpq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2018 at 07:02:39PM +0000, Andrew Cooper wrote:
> On 16/02/18 18:51, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Feb 16, 2018 at 05:52:50PM +0000, Andrew Cooper wrote:
> >> On 16/02/18 17:48, Marek Marczykowski-G=C3=B3recki wrote:
> >>> Hi,
> >>>
> >>> As in the subject, the guest crashes on boot, before kernel output
> >>> anything. I've isolated this to the conditions below:
> >>>  - PV guest have PCI device assigned (e1000e emulated by QEMU in this=
 case),
> >>>    without PCI device it works
> >>>  - Xen (in KVM) is started through OVMF; with seabios it works
> >>>  - nested HVM is disabled in KVM
> >>>  - AMD IOMMU emulation is disabled in KVM; when enabled qemu crashes =
on
> >>>    boot (looks like qemu bug, unrelated to this one)
> >>>
> >>> Version info:
> >>>  - KVM host: OpenSUSE 42.3, qemu 2.9.1, ovmf-2017+git1492060560.b6d11=
d7c46-4.1, AMD
> >>>  - Xen host: Xen 4.8.3, dom0: Linux 4.14.13
> >>>  - Xen domU: Linux 4.14.13, direct boot
> >>>
> >>> Not sure if relevant, but initially I've tried booting xen.efi /mapbs
> >>> /noexitboot and then dom0 kernel crashed saying something about confl=
ict
> >>> between e820 and kernel mapping. But now those options are disabled.
> >>>
> >>> The crash message:
> >>> (XEN) d1v0 Unhandled invalid opcode fault/trap [#6, ec=3D0000]
> >>> (XEN) domain_crash_sync called from entry.S: fault at ffff82d08021872=
0 entry.o#create_bounce_frame+0x137/0x146
> >>> (XEN) Domain 1 (vcpu#0) crashed on cpu#1:
> >>> (XEN) ----[ Xen-4.8.3  x86_64  debug=3Dn   Not tainted ]----
> >>> (XEN) CPU:    1
> >>> (XEN) RIP:    e033:[<ffffffff826d9156>]
> >> This is #UD, which is most probably hitting a BUG().=C2=A0 addr2line t=
his ^
> >> to find some code to look at.
> > addr2line failed me
>=20
> By default, vmlinux is stripped and compressed.=C2=A0 Ideally you want to
> addr2line the vmlinux artefact in the root of your kernel build, which
> is the plain elf with debugging symbols.

Yes, I've used it on vmlinux. Still got "??:?".

> Alternatively, use scripts/extract-vmlinux on the binary you actually
> booted, which might get you somewhere.

Interestingly, that fails too ("Cannot find vmlinux.").
But I don't care right now.

> > , but System.map says its xen_memory_setup. And it
> > looks like the BUG() is the same as I had in dom0 before:
> > "Xen hypervisor allocated kernel memory conflicts with E820 map".
>=20
> Juergen: Is there anything we can do to try and insert some dummy
> exception handlers right at PV start, so we could at least print out a
> oneliner to the host console which is a little more helpful than Xen
> saying "something unknown went wrong" ?

Just before the BUG(), there is a call to xen_raw_console_write(). But
apparently it was too early...

> > Disabling e820_host in guest config solved the problem. Thanks!
> >
> > Is this some bug in Xen or OVMF, or is it expected behavior and e820_ho=
st
> > should be avoided?
>=20
> I don't really know.=C2=A0 e820_host is a gross hack which shouldn't real=
ly
> be present.=C2=A0 The actually problem is that Linux can't cope with the
> memory layout it was given (and I can't recall if there is anything
> Linux could potentially to do cope).=C2=A0 OTOH, the toolstack, which knew
> about e820_host and chose to lay the guest out in an overlapping way is
> probably also at fault.

Yes, probably. But note that the same happened to dom0, when /mapbs is
used. Toolstack wasn't involved there. But /mapbs is also a hack.

> IMO, PCI Passthrough is a trainwreck, and it is a miracle it functions
> at all.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--cDtQGJ/EJIRf/Cpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlqHNt8ACgkQ24/THMrX
1yys8Qf/T6dHzYBSd3W4Sge+nMdw1ge0idZlT/9XGs7Kaw9+ClVwo+PSFjq+84mL
yUaIPsk9rrwrL/HUksQ5P+QfYyVHQliSxByZcN/5qf+6x5Xf+sgGFoF9F9tvyfd5
NlOtOxtpr3ijwncOIxGeaywzhxhkJdjGOrYwiaB6LNJdLJD4uxTukYTpnUsm6IpP
SmtY5ggU71ZMf1qi+at26wun7YGfNC8JeJfds3M3lpNJulPeD5hebVfEIAkMuchi
b0N5v7XyXAB2DHFwRYOVlyCYGZgTQtQEH7hfnsjDDG1pLdAJmD6NEcTxFVLSfvWh
GNZpAjihEzRCsZ1AiUthUq8QJIYp0Q==
=vr/h
-----END PGP SIGNATURE-----

--cDtQGJ/EJIRf/Cpq--


--===============8222464516545064154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8222464516545064154==--
