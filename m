From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 17:27:45 +0200
Message-ID: <20180411152745.GM7177@aepfle.de>
References: <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0386628642463460656=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180411150312.GL7177@aepfle.de>
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


--===============0386628642463460656==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K4LMwn8CgX2KMboP"
Content-Disposition: inline


--K4LMwn8CgX2KMboP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 11, Olaf Hering wrote:

> On Wed, Apr 11, Olaf Hering wrote:
> > On Wed, Apr 11, Dario Faggioli wrote:
> > > Olaf, can you give it a try? It should be fine to run it on top of the
> > > last debug patch (the one that produced this crash).
> > Yes, with both changes it did >4k iterations already. Thanks.
> That was with sched=credit2, sorry for that.
> Now with just that second patch ...

Still BUG in csched_load_balance.

(XEN) Xen BUG at sched_credit.c:1694
(XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-6.bug1087289_411  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    135
(XEN) RIP:    e008:[<ffff82d08022ae34>] sched_credit.c#csched_schedule+0x44a/0xd42
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffff83077ffe76d0   rbx: ffff830779c26da0   rcx: ffff8309d55ff290
(XEN) rdx: ffff83007ba44000   rsi: 0000000000000087   rdi: ffff8309d55ff290
(XEN) rbp: ffff831c3f77fdf0   rsp: ffff831c3f77fcf0   r8:  ffff8309d55ff290
(XEN) r9:  0000000000000010   r10: 0000000000000001   r11: 0000ffff0000ffff
(XEN) r12: ffff830779c26e00   r13: 000002effe563d4d   r14: 000002effe56f067
(XEN) r15: 0000000000000087   cr0: 000000008005003b   cr4: 00000000001526e0
(XEN) cr3: 00000015a5932000   cr2: 00007f889333f000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08022ae34> (sched_credit.c#csched_schedule+0x44a/0xd42):
(XEN)  8b 51 28 3b 72 04 74 02 <0f> 0b 48 8d 15 43 d9 5d 00 48 85 c0 74 04 48 8b
(XEN) Xen stack trace from rsp=ffff831c3f77fcf0:
(XEN)    ffff830890972000 000000033f77fd28 ffff830779c1a188 ffff830779c1a188
(XEN)    000002effe56f067 0000000000000087 ffff83007ba44000 ffff831c3f77fda8
(XEN)    0000000001c9c380 ffff831c3f77fe38 ffff82d08095f0e0 ffff82d08095f100
(XEN)    ffff83077a6c59e0 ffff83007ba44000 0000008700000000 ffff8309d55ff290
(XEN)    0000000000000000 0000000000000000 0000000000000086 ffff82d000000087
(XEN)    ffff830060aff000 ffff830779c1a1a0 ffff831c3f77fdf0 0000000000000046
(XEN)    ffff830890972000 ffff830779c1a1c8 0000000000000082 ffff830060aff000
(XEN)    ffff82d08095f100 ffff830779c1a188 000002effe56f067 0000000000000087
(XEN)    ffff831c3f77fe80 ffff82d080236406 ffff830779c1a188 ffff830779c1a1a0
(XEN)    0000008700000001 ffff830779c1a180 ffff82d0802368f3 ffff82d08031f3c1
(XEN)    ffff830779c1a1a0 0000008700972000 ffff830779c1a180 ffff831c3f77fe68
(XEN)    ffff82d0802f8f83 ffff82d080937f80 ffff82d080933c00 ffffffffffffffff
(XEN)    ffff831c3f77ffff ffff830890972000 ffff831c3f77feb0 ffff82d080239ec5
(XEN)    0000000000000087 ffff82d080933c00 ffff82d08095f1f0 ffff831c3f77ffff
(XEN)    ffff831c3f77fec0 ffff82d080239f1a ffff831c3f77fef0 ffff82d0802738f0
(XEN)    ffff830060aff000 ffff83007ba44000 ffff83077a6c4000 0000000000000087
(XEN)    ffff831c3f77fdc8 ffffffff81c00000 ffffffff81c00000 ffffffff81c00000
(XEN)    0000000000000000 0000000000000000 ffffffff81d4c180 0000000000000005
(XEN)    0000000000000000 ffff88011da42660 0000000000000000 ffffffff81020e50
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d08022ae34>] sched_credit.c#csched_schedule+0x44a/0xd42
(XEN)    [<ffff82d080236406>] schedule.c#schedule+0x107/0x627
(XEN)    [<ffff82d080239ec5>] softirq.c#__do_softirq+0x85/0x90
(XEN)    [<ffff82d080239f1a>] do_softirq+0x13/0x15
(XEN)    [<ffff82d0802738f0>] domain.c#idle_loop+0xac/0xbe


Olaf

--K4LMwn8CgX2KMboP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs4pbgAKCRBdQqD6ppg2
fnqGAKCie1bOSVZ+QyHN4MBqERqe0VDnugCfQiZLroy4DqAUOxLVVCofD0Fz108=
=faMT
-----END PGP SIGNATURE-----

--K4LMwn8CgX2KMboP--


--===============0386628642463460656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0386628642463460656==--
