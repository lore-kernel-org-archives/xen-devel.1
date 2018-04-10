From: Olaf Hering <olaf@aepfle.de>
Subject: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 10:57:35 +0200
Message-ID: <20180410085729.GA472@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5921255472791682900=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
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


--===============5921255472791682900==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

While hunting some other bug we run into the single BUG in
sched_credit.c:csched_load_balance(). This happens with all versions
since 4.7, staging is also affected. Testsystem is a Haswell model 63
system with 4 NUMA nodes and 144 threads.

(XEN) Xen BUG at sched_credit.c:1694
(XEN) ----[ Xen-4.11.20180407T144959.e62e140daa-2.bug1087289_411  x86_64  debug=n   Not tainted ]----
(XEN) CPU:    30
(XEN) RIP:    e008:[<ffff82d08022879d>] sched_credit.c#csched_schedule+0xaad/0xba0
(XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor
(XEN) rax: ffff83077ffe76d0   rbx: ffff83077fe571d0   rcx: 000000000000001e
(XEN) rdx: ffff83005d082000   rsi: 0000000000000000   rdi: ffff83077fe575b0
(XEN) rbp: ffff82d08094a480   rsp: ffff83077fe4fd00   r8:  ffff83077fe581a0
(XEN) r9:  ffff82d080227cf0   r10: 0000000000000000   r11: ffff830060b62060
(XEN) r12: 000014f4e864c2d4   r13: ffff83077fe575b0   r14: ffff83077fe58180
(XEN) r15: ffff82d08094a480   cr0: 000000008005003b   cr4: 00000000001526e0
(XEN) cr3: 0000000049416000   cr2: 00007fb24e1b7277
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08022879d> (sched_credit.c#csched_schedule+0xaad/0xba0):
(XEN)  18 01 00 e9 73 f7 ff ff <0f> 0b 48 8b 43 28 be 01 00 00 00 bf 0a 20 02 00
(XEN) Xen stack trace from rsp=ffff83077fe4fd00:
(XEN)    ffff82d0803577ef 0000001e00000000 80000000803577ef ffff830f9d5b2aa0
(XEN)    ffff82d0803577ef ffff83077a6c59e0 ffff83077fe4fe38 ffff82d0803577fb
(XEN)    0000000000000000 0000000000000000 0000000001c9c380 0000000000000000
(XEN)    ffff83077fe4ffff 000000000000001e 000014f4e86c885e ffff83077fe4ffff
(XEN)    ffff82d08094a480 000014f4e86c73be 0000000080230c80 ffff830060b38000
(XEN)    ffff83077fe58300 0000000000000046 ffff830f9d4f6018 0000000000000082
(XEN)    000000000000001e ffff83077fe581c8 0000000000000001 000000000000001e
(XEN)    ffff83005d1f0000 ffff83077fe58188 000014f4e86c885e ffff83077fe58180
(XEN)    ffff82d08094a480 ffff82d08023153d ffff830700000000 ffff83077fe581a0
(XEN)    0000000000000206 ffff82d080268705 ffff83077fe58300 ffff830060b38060
(XEN)    ffff830845d83010 ffff82d080238578 ffff83077fe4ffff 00000000ffffffff
(XEN)    ffffffffffffffff ffff83077fe4ffff ffff82d080933c00 ffff82d08094a480
(XEN)    ffff83077fe4ffff ffff82d080234cb2 ffff82d08095f1f0 ffff82d080934b00
(XEN)    ffff82d08095f1f0 000000000000001e 000000000000001e ffff82d08026daf5
(XEN)    ffff83005d1f0000 ffff83005d1f0000 ffff83005d1f0000 ffff83077fe58188
(XEN)    000014f4e86a43ab ffff83077fe58180 ffff82d08094a480 ffff88011dd88000
(XEN)    ffff88011dd88000 ffff88011dd88000 0000000000000000 000000000000002b
(XEN)    ffffffff81d4c180 0000000000000000 00000013fe969894 0000000000000001
(XEN)    0000000000000000 ffffffff81020e50 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 000000fc00000000 ffffffff81060182
(XEN) Xen call trace:
(XEN)    [<ffff82d08022879d>] sched_credit.c#csched_schedule+0xaad/0xba0
(XEN)    [<ffff82d0803577ef>] common_interrupt+0x8f/0x110
(XEN)    [<ffff82d0803577ef>] common_interrupt+0x8f/0x110
(XEN)    [<ffff82d0803577fb>] common_interrupt+0x9b/0x110
(XEN)    [<ffff82d08023153d>] schedule.c#schedule+0xdd/0x5d0
(XEN)    [<ffff82d080268705>] reprogram_timer+0x75/0xe0
(XEN)    [<ffff82d080238578>] timer.c#timer_softirq_action+0x138/0x210
(XEN)    [<ffff82d080234cb2>] softirq.c#__do_softirq+0x62/0x90
(XEN)    [<ffff82d08026daf5>] domain.c#idle_loop+0x45/0xb0
(XEN) ****************************************
(XEN) Panic on CPU 30:
(XEN) Xen BUG at sched_credit.c:1694
(XEN) ****************************************
(XEN) Reboot in five seconds...

But after that the system hangs hard, one has to pull the plug.
Running the debug version of xen.efi did not trigger any ASSERT.


This happens if there are many busy backend/frontend pairs in a number
of domUs. I think more domUs will trigger it sooner, overcommit helps as
well. It was not seen with a single domU.

The testcase is like that:
- boot dom0 with "dom0_max_vcpus=30 dom0_mem=32G dom0_vcpus_pin"
- create a tmpfs in dom0
- create files in that tmpfs to be exported to domUs via file://path,xvdtN,w
- assign these files to HVM domUs
- inside the domUs, create a filesystem on the xvdtN devices
- mount the filesystem
- run fio(1) on the filesystem
- in dom0, run 'xl vcpu-pin domU $node1-3 $nodeN' in a loop to move domU between node 1 to 3.

After a low number of iterations Xen crashes in csched_load_balance.

In my setup I had 16 HVM domUs with 64 vcpus, each one had 3 vbd devices.
It was reported also with fewer and smaller domUs.
Scripts exist to recreate the setup easily.


In one case I have seen this:

(XEN) d32v60 VMRESUME error: 0x5
(XEN) domain_crash_sync called from vmcs.c:1673
(XEN) Domain 32 (vcpu#60) crashed on cpu#139:
(XEN) ----[ Xen-4.11.20180407T144959.e62e140daa-2.bug1087289_411  x86_64  debug=n   Not tainted ]----


Any idea what might causing this crash?

Olaf

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWsx8dgAKCRBdQqD6ppg2
fho/AJ9qeeSg9uyHxvfTmvXPUl3eA6MoSwCfVDmcj06BNJN0hRjMJbAHFC/yV10=
=FXVV
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--


--===============5921255472791682900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5921255472791682900==--
