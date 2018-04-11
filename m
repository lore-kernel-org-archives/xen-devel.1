From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 22:43:59 +0200
Message-ID: <20180411204359.GP7177@aepfle.de>
References: <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
 <20180411152745.GM7177@aepfle.de>
 <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7659080389187225482=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
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


--===============7659080389187225482==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sBcizk6cgRZY6rnJ"
Content-Disposition: inline


--sBcizk6cgRZY6rnJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 11, Dario Faggioli wrote:

> It will crash, again, possibly with the same stack trace, but I think
> it's worth a try.

    BUG_ON(__vcpu_on_runq(CSCHED_VCPU(vc)));

(XEN) grant_table.c:1769:d15v18 Expanding d15 grant table from 12 to 13 frames
(XEN) grant_table.c:1769:d15v20 Expanding d15 grant table from 13 to 14 frames
(XEN) grant_table.c:1769:d15v21 Expanding d15 grant table from 14 to 15 frames
(XEN) traps.c:1569: GPF (0000): ffff82d080315d5f [vmx.c#vmx_msr_read_intercept+0x375/0x3e2] -> ffff82d08037594a
(XEN) grant_table.c:1769:d16v19 Expanding d16 grant table from 9 to 10 frames
(XEN) grant_table.c:1769:d16v22 Expanding d16 grant table from 10 to 11 frames
(XEN) grant_table.c:1769:d16v27 Expanding d16 grant table from 11 to 12 frames
(XEN) grant_table.c:1769:d16v21 Expanding d16 grant table from 12 to 13 frames
(XEN) grant_table.c:1769:d16v21 Expanding d16 grant table from 13 to 14 frames
(XEN) grant_table.c:1769:d16v20 Expanding d16 grant table from 14 to 15 frames
(XEN) Xen BUG at sched_credit.c:876
(XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-7.bug1087289_411  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    108
(XEN) RIP:    e008:[<ffff82d080229ab4>] sched_credit.c#csched_vcpu_migrate+0x27/0x54
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffff8308990cb230   rbx: ffff830779d28188   rcx: ffff82d080803640
(XEN) rdx: 000000000000006e   rsi: ffff83007ba44000   rdi: ffff82d080803640
(XEN) rbp: ffff831c7d80fd18   rsp: ffff831c7d80fd18   r8:  0000000000000004
(XEN) r9:  0000000000000000   r10: 0000000000000001   r11: 0000ffff0000ffff
(XEN) r12: ffff830779d28188   r13: 000000000000006e   r14: 000000000000006c
(XEN) r15: ffff83007ba44000   cr0: 000000008005003b   cr4: 00000000001526e0
(XEN) cr3: 00000015a589c000   cr2: 00007f163e153d00
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d080229ab4> (sched_credit.c#csched_vcpu_migrate+0x27/0x54):
(XEN)  00 00 00 48 3b 00 74 02 <0f> 0b 48 8d 0d 43 56 73 00 4c 63 46 04 48 8d 3d
(XEN) Xen stack trace from rsp=ffff831c7d80fd18:
(XEN)    ffff831c7d80fd28 ffff82d080236348 ffff831c7d80fda8 ffff82d08023764c
(XEN)    ffff831c7d80fd58 ffff82d08095f0e0 ffff82d08095f100 ffff830779d12188
(XEN)    ffff83007ba44000 0000006e01236fbe ffff83077ffe7720 0000000000000296
(XEN)    ffff83077a6c59e0 ffff83007ba44000 ffff83007ba44000 ffff83077a6c4000
(XEN)    000000000000006c ffff8308bc78e000 ffff831c7d80fdc8 ffff82d080239367
(XEN)    ffff83077a6c4000 ffff83005d1da000 ffff831c7d80fe18 ffff82d08027797d
(XEN)    ffff831c7d80fde8 ffff82d0802a4f50 ffff831c7d80fe18 ffff83007ba44000
(XEN)    ffff83005d1da000 ffff830779d28188 0000112defdf0971 0000000000000003
(XEN)    ffff831c7d80fea8 ffff82d080236943 ffff831c7d80fe68 ffff830779d281a0
(XEN)    0000006c0080fe68 ffff830779d28180 000000000000f305 000000000000f305
(XEN)    ffff83007ba44000 ffff83005d1da000 ffffffffffffffff ffff83005d1da000
(XEN)    ffff831c7d80fee8 ffff82d080937200 ffff82d080933c00 ffffffffffffffff
(XEN)    ffff831c7d80ffff ffff83077a6c4000 ffff831c7d80fed8 ffff82d080239f15
(XEN)    ffff83007ba44000 ffff83005d1da000 ffff8308bc78e000 000000000000006c
(XEN)    ffff831c7d80fee8 ffff82d080239f6a ffff831c7d80fda0 ffff82d08031f5db
(XEN)    ffffffff81c00000 ffffffff81c00000 ffffffff81c00000 0000000000000000
(XEN)    0000000000000000 ffffffff81d4c180 ffffffff821cf188 00000005da10c197
(XEN)    0000000000000001 0000000000000000 ffffffff81020e50 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000beef0000beef
(XEN)    ffffffff81060182 000000bf0000beef 0000000000000246 ffffffff81c03f00
(XEN) Xen call trace:
(XEN)    [<ffff82d080229ab4>] sched_credit.c#csched_vcpu_migrate+0x27/0x54
(XEN)    [<ffff82d080236348>] schedule.c#vcpu_move_locked+0xbb/0xc2
(XEN)    [<ffff82d08023764c>] schedule.c#vcpu_migrate+0x226/0x25b
(XEN)    [<ffff82d080239367>] context_saved+0x95/0x9c
(XEN)    [<ffff82d08027797d>] context_switch+0xe66/0xeb0
(XEN)    [<ffff82d080236943>] schedule.c#schedule+0x5f4/0x627
(XEN)    [<ffff82d080239f15>] softirq.c#__do_softirq+0x85/0x90
(XEN)    [<ffff82d080239f6a>] do_softirq+0x13/0x15
(XEN)    [<ffff82d08031f5db>] vmx_asm_do_vmentry+0x2b/0x30
(XEN) ****************************************
(XEN) Panic on CPU 108:
(XEN) Xen BUG at sched_credit.c:876
(XEN) ****************************************
(XEN) Reboot in five seconds...


Olaf

--sBcizk6cgRZY6rnJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs5zjwAKCRBdQqD6ppg2
frqyAKDEfASay+TuE3hf1+fqIAGZuNJ3FACeKKILI9G+wTGMNwtynzYf9rJqf7w=
=e/28
-----END PGP SIGNATURE-----

--sBcizk6cgRZY6rnJ--


--===============7659080389187225482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7659080389187225482==--
