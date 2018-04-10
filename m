From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 17:59:49 +0200
Message-ID: <20180410155949.GB7177@aepfle.de>
References: <20180410085729.GA472@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7500183254499642252=="
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


--===============7500183254499642252==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 10, Olaf Hering wrote:

> (XEN) Xen BUG at sched_credit.c:1694

And another one with debug=y and this config:
memory=4444
vcpus=36
cpu="nodes:1,^node:0"
cpu_soft="nodes:1,^node:0"
(nodes=1 cycles between 1-3 for each following domU).

(XEN) Assertion 'CSCHED_PCPU(cpu)->nr_runnable >= 1' failed at sched_credit.c:269
(XEN) ----[ Xen-4.11.20180407T144959.e62e140daa-4.bug1087289_411  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    18
(XEN) RIP:    e008:[<ffff82d08022b2e8>] sched_credit.c#csched_schedule+0x8fe/0xd42
(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor (d0v18)
(XEN) rax: ffff830779e9e970   rbx: ffff83007ba44000   rcx: 0000000000000046
(XEN) rdx: 00000036f953b080   rsi: ffff83077a738140   rdi: ffff830779e9a18e
(XEN) rbp: ffff83077a737e18   rsp: ffff83077a737d18   r8:  000000000000000b
(XEN) r9:  ffff83077a7383c0   r10: 0000000000000000   r11: 0000017e70349000
(XEN) r12: ffff8309d55879f0   r13: 0000000000000044   r14: ffff830779eae188
(XEN) r15: ffff8309d55879f0   cr0: 000000008005003b   cr4: 00000000001526e0
(XEN) cr3: 0000000dd1056000   cr2: 0000557e1f370028
(XEN) fsb: 0000000000000000   gsb: ffff880885080000   gss: 0000000000000000
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d08022b2e8> (sched_credit.c#csched_schedule+0x8fe/0xd42):
(XEN)  10 18 83 78 18 00 75 02 <0f> 0b 48 8d 05 0f 3e 73 00 48 8b 44 10 18 83 68
(XEN) Xen stack trace from rsp=ffff83077a737d18:
(XEN)    0000000000000004 00000000ef047000 ffff82d08095f0e0 ffff830779eae188
(XEN)    0000017e6f25c71c ffff82d08095f0c0 0000000100000044 ffff82d08095f0c0
(XEN)    0000000001c9c380 ffff83077a737e60 ffff83077ffe7720 ffff82d08095f100
(XEN)    ffff83077a6c59e0 ffff82d08095f0c0 0000001200000000 ffff83077a73c570
(XEN)    ffff82d08095f100 0000000100000028 ffff830700000046 0000004400000012
(XEN)    ffff82d08023d5f0 ffff83077a7381a0 7ffb5fe000000000 00000000000000bd
(XEN)    0000000000000000 0000000000000000 0000000000000092 ffff830060ae3000
(XEN)    ffff82d08095f100 ffff83077a738188 0000017e6f25c71c 0000000000000012
(XEN)    ffff83077a737ea8 ffff82d080236406 ffff82d080372434 ffff83077a7381a0
(XEN)    0000001200737ef8 ffff83077a738180 ffff83077a737ee8 ffff82d08036a04a
(XEN)    02ff82d080372434 0000000000000001 0000000000000000 deadbeefdeadf00d
(XEN)    deadbeefdeadf00d ffff82d080934500 ffff82d080933c00 ffffffffffffffff
(XEN)    ffff83077a737fff 0000000000000000 ffff83077a737ed8 ffff82d080239ec5
(XEN)    ffff830060ae3000 0000000000000000 0000000000000000 0000000000000000
(XEN)    ffff83077a737ee8 ffff82d080239f1a 00007cf8858c80e7 ffff82d08036e566
(XEN)    ffff880181710000 ffff880181710000 ffff880181710000 0000000000000000
(XEN)    0000000000000012 ffffffff81d4c180 0000000000000246 0000000000007ff0
(XEN)    0000000000000001 0000000000000000 0000000000000000 ffffffff810013aa
(XEN)    0000000000000012 deadbeefdeadf00d deadbeefdeadf00d 0000010000000000
(XEN)    ffffffff810013aa 000000000000e033 0000000000000246 ffff880181713ee0
(XEN) Xen call trace:
(XEN)    [<ffff82d08022b2e8>] sched_credit.c#csched_schedule+0x8fe/0xd42
(XEN)    [<ffff82d080236406>] schedule.c#schedule+0x107/0x627
(XEN)    [<ffff82d080239ec5>] softirq.c#__do_softirq+0x85/0x90
(XEN)    [<ffff82d080239f1a>] do_softirq+0x13/0x15
(XEN)    [<ffff82d08036e566>] x86_64/entry.S#process_softirqs+0x6/0x10
(XEN) ****************************************
(XEN) Panic on CPU 18:
(XEN) Assertion 'CSCHED_PCPU(cpu)->nr_runnable >= 1' failed at sched_credit.c:269
(XEN) ****************************************
(XEN) Reboot in five seconds...



dom0 is still alive after that attempt to reboot and for some reason triple
ctrl-a appears to work. But it seems 'R' still fails.

Olaf

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWszfcgAKCRBdQqD6ppg2
fo42AKDtNZwOX9EpPpbsKqXE93dgO8wquQCeLfB05Tlt6rgRUtKcTuEly5LCm8Q=
=rDxN
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--


--===============7500183254499642252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7500183254499642252==--
