From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 17:03:12 +0200
Message-ID: <20180411150312.GL7177@aepfle.de>
References: <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6310065490846351239=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180411100006.GI7177@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============6310065490846351239==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yaap9KN+GmBP785v"
Content-Disposition: inline


--yaap9KN+GmBP785v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, Olaf Hering wrote:

> On Wed, Apr 11, Dario Faggioli wrote:
>=20
> > Olaf, can you give it a try? It should be fine to run it on top of the
> > last debug patch (the one that produced this crash).
>=20
> Yes, with both changes it did >4k iterations already. Thanks.

That was with sched=3Dcredit2, sorry for that.
Now with just that second patch I got this after a few iterations, in __vmr=
ead().
We have seen such crashes a few times with 4.7 already.


(XEN) Xen BUG at ...0f8ba84a5/non-dbg/xen/include/asm/hvm/vmx/vmx.h:390
(XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-6.bug1087289_411  x86_64  d=
ebug=3Dn   Not tainted ]----
(XEN) CPU:    71
(XEN) RIP:    e008:[<ffff82d08030aa55>] vmx.c#arch/x86/hvm/vmx/vmx.o.unlike=
ly+0/0x15b
(XEN) RFLAGS: 0000000000010203   CONTEXT: hypervisor (d16v0)
(XEN) rax: 0000000000004824   rbx: ffff83007ba44000   rcx: ffffffffffffef76
(XEN) rdx: ffff830e7aa77fff   rsi: 000000000000f305   rdi: ffff83007ba44000
(XEN) rbp: 000000000000f305   rsp: ffff830e7aa77e60   r8:  0000000015c23047
(XEN) r9:  000004489c4a4a69   r10: 000001b7ca057c00   r11: 0000000000000000
(XEN) r12: 000000000000f305   r13: 0000000000004016   r14: ffff830779e92180
(XEN) r15: 00000000ffffffff   cr0: 000000008005003b   cr4: 00000000001526e0
(XEN) cr3: 000000067083a000   cr2: 00007fedb9f6c000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08030aa55> (vmx.c#arch/x86/hvm/vmx/vmx.o.unli=
kely):
(XEN)  44 24 0c e9 82 fd ff ff <0f> 0b 0f 0b 0f 0b 0f 0b 0f 0b 0f 0b 0f 0b =
0f 0b
(XEN) Xen stack trace from rsp=3Dffff830e7aa77e60:
(XEN)    ffff82d0802e1442 ffff83007ba44000 000000000000f305 000000000000f305
(XEN)    ffff82d0802ff477 ffff82d08030f9ab 000000f37aa77ef8 ffffffffffffffff
(XEN)    ffff830e7aa77fff ffff82d080933c00 ffff830779e92180 ffff82d08026d870
(XEN)    ffff83007ba44000 ffff83007ba44000 ffff830779e92188 000001b7c8fec61b
(XEN)    ffff830779e92180 ffff82d08094a480 ffff82d08030f9e7 ffffffff81c00000
(XEN)    ffffffff81c00000 ffffffff81c00000 0000000000000000 0000000000000000
(XEN)    ffffffff81d4c180 0000000000000400 0000000000000400 0000000000000000
(XEN)    0000000000000000 ffffffff81020e50 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 000000fc00000000 ffffffff81060182
(XEN)    0000000000000000 0000000000000246 ffffffff81c03f00 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000047 ffff83007ba44000 00000036f9533080 00000000001526e0
(XEN)    0000000000000000 0000000779e90000 0000040000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d08030aa55>] vmx.c#arch/x86/hvm/vmx/vmx.o.unlikely+0/0x15b
(XEN)    [<ffff82d0802e1442>] hvm_interrupt_blocked+0x82/0xd0
(XEN)    [<ffff82d0802ff477>] vmx_intr_assist+0x137/0x490
(XEN)    [<ffff82d08030f9ab>] vmx_asm_vmexit_handler+0xab/0x240
(XEN)    [<ffff82d08026d870>] domain.c#vcpu_kick_softirq+0/0x10
(XEN)    [<ffff82d08030f9e7>] vmx_asm_vmexit_handler+0xe7/0x240
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 71:
(XEN) Xen BUG at ...0f8ba84a5/non-dbg/xen/include/asm/hvm/vmx/vmx.h:390
(XEN) ****************************************


Olaf

--yaap9KN+GmBP785v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs4jrQAKCRBdQqD6ppg2
fquaAKCUYrbDq8i/7QakEieWPxfJmnuALQCfeniTgsX8WvROPZrVA+Ga8XYk8AQ=
=9DbA
-----END PGP SIGNATURE-----

--yaap9KN+GmBP785v--


--===============6310065490846351239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6310065490846351239==--
