From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 22:37:41 +0200
Message-ID: <20180410203741.GF7177@aepfle.de>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6416954113061416802=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============6416954113061416802==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gdTfX7fkYsEEjebm"
Content-Disposition: inline


--gdTfX7fkYsEEjebm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 10, Dario Faggioli wrote:

> So, Olaf, if you're fancy giving this a tray anyway, well, go ahead.

    BUG_ON(__vcpu_on_runq(CSCHED_VCPU(vc)));

(XEN) Xen BUG at sched_credit.c:876
(XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-3.bug1087289_411  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    118
(XEN) RIP:    e008:[<ffff82d080229ab4>] sched_credit.c#csched_vcpu_migrate+0x27/0x51
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffff83087b8f5010   rbx: ffff830779cc6188   rcx: ffff82d080803640
(XEN) rdx: 000000000000005f   rsi: ffff83007ba37000   rdi: ffff82d080803640
(XEN) rbp: ffff831c7d877d18   rsp: ffff831c7d877d18   r8:  0000000000000004
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000ffff0000ffff
(XEN) r12: ffff830779cc6188   r13: 000000000000005f   r14: 0000000000000076
(XEN) r15: ffff83007ba37000   cr0: 0000000080050033   cr4: 00000000001526e0
(XEN) cr3: 0000000bf4af5000   cr2: 00007f377e8fd594
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d080229ab4> (sched_credit.c#csched_vcpu_migrate+0x27/0x51):
(XEN)  00 00 00 48 3b 00 74 02 <0f> 0b 48 8d 15 43 56 73 00 48 63 76 04 48 8d 0d
(XEN) Xen stack trace from rsp=ffff831c7d877d18:
(XEN)    ffff831c7d877d28 ffff82d080236348 ffff831c7d877da8 ffff82d08023764c
(XEN)    0000000000000000 ffff82d08095f0e0 ffff82d08095f100 ffff830779da8188
(XEN)    ffff83007ba37000 0000005f01000000 0000000000000000 0000000000000296
(XEN)    ffff830779cc602c ffff83007ba37000 ffff83007ba37000 ffff83077a6c4000
(XEN)    0000000000000076 ffff83087bb8b000 ffff831c7d877dc8 ffff82d08023935f
(XEN)    ffff83077a6c4000 ffff83005d1d0000 ffff831c7d877e18 ffff82d08027797d
(XEN)    ffff831c7d877de8 ffff82d0802a4f50 ffff831c7d877e18 ffff83007ba37000
(XEN)    ffff83005d1d0000 ffff830779cc6188 00000baa8fa4f354 0000000000000001
(XEN)    ffff831c7d877ea8 ffff82d080236943 ffff82d08031f411 ffff830779cc61a0
(XEN)    0000007600b8b000 ffff830779cc6180 ffff831c7d877e68 ffff82d0802f8fd3
(XEN)    ffff83007ba37000 ffff83005d1d0000 ffffffffffffffff 0000000000000000
(XEN)    ffff831c7d877ee8 ffff82d080937700 ffff82d080933c00 ffffffffffffffff
(XEN)    ffff831c7d877fff 0000000000000000 ffff831c7d877ed8 ffff82d080239f15
(XEN)    ffff83007ba37000 0000000000000000 0000000000000000 0000000000000000
(XEN)    ffff831c7d877ee8 ffff82d080239f6a 00007ce3827880e7 ffff82d08031f5db
(XEN)    ffff88011e034000 ffff88011e034000 ffff88011e034000 0000000000000000
(XEN)    000000000000000d ffffffff81d4c180 0000000000000008 00000013bb9ba8f8
(XEN)    0000000000000001 0000000000000000 ffffffff81020e50 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000beef0000beef
(XEN)    ffffffff81060182 000000bf0000beef 0000000000000246 ffff88011e037ed8
(XEN) Xen call trace:
(XEN)    [<ffff82d080229ab4>] sched_credit.c#csched_vcpu_migrate+0x27/0x51
(XEN)    [<ffff82d080236348>] schedule.c#vcpu_move_locked+0xbb/0xc2
(XEN)    [<ffff82d08023764c>] schedule.c#vcpu_migrate+0x226/0x25b
(XEN)    [<ffff82d08023935f>] context_saved+0x8d/0x94
(XEN)    [<ffff82d08027797d>] context_switch+0xe66/0xeb0
(XEN)    [<ffff82d080236943>] schedule.c#schedule+0x5f4/0x627
(XEN)    [<ffff82d080239f15>] softirq.c#__do_softirq+0x85/0x90
(XEN)    [<ffff82d080239f6a>] do_softirq+0x13/0x15
(XEN)    [<ffff82d08031f5db>] vmx_asm_do_vmentry+0x2b/0x30
(XEN) ****************************************
(XEN) Panic on CPU 118:
(XEN) Xen BUG at sched_credit.c:876
(XEN) ****************************************
(XEN) Reboot in five seconds...


Olaf

--gdTfX7fkYsEEjebm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs0gkQAKCRBdQqD6ppg2
fnwxAKComMjJOHvOiWl1S/Jc78MsGZMfwwCg4aA9zKPGTcDwyRGNg2tog86QddI=
=FSW4
-----END PGP SIGNATURE-----

--gdTfX7fkYsEEjebm--


--===============6416954113061416802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6416954113061416802==--
