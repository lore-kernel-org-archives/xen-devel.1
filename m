From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: PV guest with PCI passthrough crash on Xen 4.8.3 inside
 KVM when booted through OVMF
Date: Fri, 16 Feb 2018 18:48:35 +0100
Message-ID: <20180216174835.GJ4302@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3310132564023471677=="
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


--===============3310132564023471677==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jQIvE3yXcK9X9HBh"
Content-Disposition: inline


--jQIvE3yXcK9X9HBh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

As in the subject, the guest crashes on boot, before kernel output
anything. I've isolated this to the conditions below:
 - PV guest have PCI device assigned (e1000e emulated by QEMU in this case),
   without PCI device it works
 - Xen (in KVM) is started through OVMF; with seabios it works
 - nested HVM is disabled in KVM
 - AMD IOMMU emulation is disabled in KVM; when enabled qemu crashes on
   boot (looks like qemu bug, unrelated to this one)

Version info:
 - KVM host: OpenSUSE 42.3, qemu 2.9.1, ovmf-2017+git1492060560.b6d11d7c46-=
4.1, AMD
 - Xen host: Xen 4.8.3, dom0: Linux 4.14.13
 - Xen domU: Linux 4.14.13, direct boot

Not sure if relevant, but initially I've tried booting xen.efi /mapbs
/noexitboot and then dom0 kernel crashed saying something about conflict
between e820 and kernel mapping. But now those options are disabled.

The crash message:
(XEN) d1v0 Unhandled invalid opcode fault/trap [#6, ec=3D0000]
(XEN) domain_crash_sync called from entry.S: fault at ffff82d080218720 entr=
y.o#create_bounce_frame+0x137/0x146
(XEN) Domain 1 (vcpu#0) crashed on cpu#1:
(XEN) ----[ Xen-4.8.3  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    e033:[<ffffffff826d9156>]
(XEN) RFLAGS: 0000000000000296   EM: 1   CONTEXT: pv guest (d1v0)
(XEN) rax: 0000000000000000   rbx: bdb25197f3daa61a   rcx: 000000000000003f
(XEN) rdx: ffffffff8206f450   rsi: 000000000000003f   rdi: 0000000000000000
(XEN) rbp: ffffffff82203e50   rsp: ffffffff82203d88   r8:  65c74fe852ba23f1
(XEN) r9:  b483505023b6d4a8   r10: c50a553bf60c0435   r11: fb097667f910d8cc
(XEN) r12: 0000000080000000   r13: 0000000000000000   r14: 0000010000000000
(XEN) r15: 000000000007aa00   cr0: 0000000080050033   cr4: 00000000000006e0
(XEN) cr3: 000000002a00a000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: ffffffff826a9000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
(XEN) Guest stack trace from rsp=3Dffffffff82203d88:
(XEN)    000000000000003f fb097667f910d8cc ffffffff826d9156 000000010000e030
(XEN)    0000000000010096 ffffffff82203dc8 000000000000e02b ffffffff826d9156
(XEN)    0add82a0ac2d25fc ffffffff82203e58 0000000001000000 ffffffff00000001
(XEN)    000000007f600000 0000000300000000 0000000019000000 0000000000019000
(XEN)    7ff0ffff82203e68 ffffffff00000017 ffffffff827ef004 0000000000000000
(XEN)    a2cc4720129e68ea 0000000001000000 ffffffff81000000 ffffffff82a66000
(XEN)    ffffffff82203ef8 ffffffff82203e70 ffffffff826e59d6 a76c832b9f537b2a
(XEN)    0000000001000000 ffffffff82203ee8 ffffffff826e13f7 0000000000000000
(XEN)    ffffffff810fbd4d cc49d4ba00000010 ffffffff82203ef8 ffffffff82203eb0
(XEN)    0000000000000000 0000000002a95000 0000000000000000 ec77a7137dd29529
(XEN)    ffffffffffffffff ffffffff82203f54 0000000000000000 0000000000000000
(XEN)    ffffffff82203f38 ffffffff826cd7a6 bb0469b365c5dafd ffffffff82203f20
(XEN)    0000000000000000 8529976ce838b598 ffffffff82203f58 ffffffff82203f54
(XEN)    0000000000000000 0000000000000000 ffffffff82203ff8 ffffffff826db329
(XEN)    00100f4200000000 0000000100000800 000000000789c3f5 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0f00000060c0c748

Any idea where to look?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--jQIvE3yXcK9X9HBh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlqHGWsACgkQ24/THMrX
1yx9Hwf+KJeIiPaYrWQd3rmEHSMikuwE7T3+p8CQStTYzrtCA21C6Ti6Y4CGz3gE
b+/y+CS9aQ/VqT8Id2Jsw4gvMTGQokYI1jz8S1nM7bZzVXxPZNXH0lhL1ItEQk7u
jqWA1o0BqWVJvQZ7pS70pyM/IoEKRxggwzdzld+j6inUkD6ZmjFrN82uXyfUhF7c
I9aFqaYL6jwRiu9eiFFjuya7InnmS0NtE4bQB9s/l+S5MV+wlW7zZ9mAOJU2oX96
MXpMJh3iwCL2E/0BboobIojXh32FIfcAvyMq5RBkCIx5FK1sFlEmfrbqkspMP9GB
Jn1sVCshBg4DkAPs4wXxaAHJLS+NBg==
=B+cG
-----END PGP SIGNATURE-----

--jQIvE3yXcK9X9HBh--


--===============3310132564023471677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3310132564023471677==--
