From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 17:18:19 +0200
Message-ID: <20180410151819.GA7177@aepfle.de>
References: <20180410085729.GA472@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5877026929273014896=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180410085729.GA472@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============5877026929273014896==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 10, Olaf Hering wrote:

> (XEN) Xen BUG at sched_credit.c:1694

Another variant:

This time the domUs had just vcpus=36 and cpus=nodes:N,node:^0/cpus_soft=nodes:N,node:^0

(XEN) Xen BUG at sched_credit.c:280
(XEN) ----[ Xen-4.11.20180407T144959.e62e140daa-2.bug1087289_411  x86_64  debug=n   Not tainted ]----
(XEN) CPU:    54
(XEN) RIP:    e008:[<ffff82d0803591b1>] sched_credit.c#__runq_insert.part.13+0/0x2
(XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor (d96v20)
(XEN) rax: ffff82d08095f100   rbx: ffff830670506ea0   rcx: ffff830779f4ae80
(XEN) rdx: 00000036f95d7080   rsi: 0000000000000000   rdi: ffff830670506ea0
(XEN) rbp: ffff82d08094a480   rsp: ffff830e7ab2fd30   r8:  ffff830779f361a0
(XEN) r9:  ffff82d080227cf0   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000033c2684bb20   r13: ffff830779f4ae80   r14: ffff830779f36180
(XEN) r15: 0000033c269c6f66   cr0: 000000008005003b   cr4: 00000000001526e0
(XEN) cr3: 000000067058e000   cr2: 00007f1299b17000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d0803591b1> (sched_credit.c#__runq_insert.part.13):
(XEN)  f1 ff 5a 5b 31 c0 5d c3 <0f> 0b 0f 0b 0f 0b 48 89 e2 48 8d 05 eb 5d 60 00
(XEN) Xen stack trace from rsp=ffff830e7ab2fd30:
(XEN)    ffff82d080228845 ffff82e030ac7f80 00000036563fc000 00000000ffffffff
(XEN)    00000000000000a3 00000000000000c0 ffff83077a6c59e0 ffff830e7ab2fe70
(XEN)    ffff82d0802354b5 ffff82d0802fff50 0000000000000000 0000000001c9c380
(XEN)    000000008027bcd8 ffff82d0802255d0 0000000000000036 0000033c269c6f66
(XEN)    ffff8307798d4f30 0000000000000000 ffff830779f361a0 0000000000000036
(XEN)    ffff82d0802386cc ffff830779f361a0 0000000000000046 ffff82d08023827b
(XEN)    0000000000000096 0000000000000036 ffff830779f361c8 ffff82d08030f9ab
(XEN)    0000000000000036 ffff83007ba30000 ffff830779f36188 0000033c269c6f66
(XEN)    ffff830779f36180 ffff82d08094a480 ffff82d08023153d ffff82d000000000
(XEN)    ffff830779f361a0 0000000000000000 ffff82d0802e13d5 ffff83007ba30000
(XEN)    ffff83007ba30000 0000000000000000 ffff82d08030bef6 ffff82d08030f9ab
(XEN)    00000000ffffffff ffffffffffffffff ffff830e7ab2ffff ffff82d080933c00
(XEN)    0000000000000000 0000000000000000 ffff82d080234cb2 0000000000000000
(XEN)    ffff83007ba30000 0000000000000000 0000000000000000 0000000000000000
(XEN)    ffff82d08030fb6b 0000000000000000 0000000000000100 0000000000540000
(XEN)    0000000000000001 ffff88011ff16c80 ffff8800e1e20000 0000000000000000
(XEN)    ffff88011f000858 ffff88011f0006c8 0000000000000000 0000000000000000
(XEN)    0000000000000001 0000000000000001 00000000000000ad 00000000000000a5
(XEN)    000000fb00000000 ffffffff810c8da3 0000000000000000 0000000000000046
(XEN)    ffff8800ea3af910 0000000000000000 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d0803591b1>] sched_credit.c#__runq_insert.part.13+0/0x2
(XEN)    [<ffff82d080228845>] sched_credit.c#csched_schedule+0xb55/0xba0
(XEN)    [<ffff82d0802354b5>] smp_call_function_interrupt+0x85/0xa0
(XEN)    [<ffff82d0802fff50>] vmcs.c#__vmx_clear_vmcs+0/0xe0
(XEN)    [<ffff82d0802255d0>] sched_credit.c#csched_vcpu_yield+0/0x10
(XEN)    [<ffff82d0802386cc>] timer.c#remove_entry+0x7c/0x90
(XEN)    [<ffff82d08023827b>] timer.c#add_entry+0x4b/0xb0
(XEN)    [<ffff82d08030f9ab>] vmx_asm_vmexit_handler+0xab/0x240
(XEN)    [<ffff82d08023153d>] schedule.c#schedule+0xdd/0x5d0
(XEN)    [<ffff82d0802e13d5>] hvm_interrupt_blocked+0x15/0xd0
(XEN)    [<ffff82d08030bef6>] nvmx_switch_guest+0x86/0x1a00
(XEN)    [<ffff82d08030f9ab>] vmx_asm_vmexit_handler+0xab/0x240
(XEN)    [<ffff82d080234cb2>] softirq.c#__do_softirq+0x62/0x90
(XEN)    [<ffff82d08030fb6b>] vmx_asm_do_vmentry+0x2b/0x30
(XEN) ****************************************
(XEN) Panic on CPU 54:
(XEN) Xen BUG at sched_credit.c:280
(XEN) ****************************************
(XEN) Reboot in five seconds...


Olaf

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWszVtwAKCRBdQqD6ppg2
fkUrAJ9YgyR78qe27hBFpnrqRO7qJwUbGgCfSskMucVTgyKtZnzZnE+k/JjCJq0=
=jT+6
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--


--===============5877026929273014896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5877026929273014896==--
