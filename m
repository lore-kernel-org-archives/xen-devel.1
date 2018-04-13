From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Fri, 13 Apr 2018 08:23:34 +0200
Message-ID: <20180413082334.2dc6bf86.olaf@aepfle.de>
References: <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
 <20180411152745.GM7177@aepfle.de>
 <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
 <20180411204359.GP7177@aepfle.de>
 <CAAWQectJz5nGbMQJMsgv2MVE4DRwAw5DOA+roT5TFadO06TTHg@mail.gmail.com>
 <862386BF-2092-428A-AE9E-766D109EF7DC@citrix.com>
 <b4e178344a2923404528bd0af07d583fc011b9ab.camel@suse.com>
 <20180412144553.74da01bc.olaf@aepfle.de>
 <95725e3ecc825da13f9c0ab01ba74b11ed678d33.camel@suse.com>
 <a6057cd8eadc20b04797a4a8fc9cb5570d44544d.camel@suse.com>
 <6b119ba762dbad0c1949bf814694ffbfd39d16c4.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3160793345795174602=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <6b119ba762dbad0c1949bf814694ffbfd39d16c4.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============3160793345795174602==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Iy/8LHf/k2K2TcNa1TH3j04"; protocol="application/pgp-signature"

--Sig_/Iy/8LHf/k2K2TcNa1TH3j04
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 12 Apr 2018 19:25:43 +0200
schrieb Dario Faggioli <dfaggioli@suse.com>:

> Olaf, new patch! :-)

    BUG_ON(__vcpu_on_runq(CSCHED_VCPU(vc)));

(XEN) CPU 36: d10v1 isr=3D0 runnbl=3D1 proc=3D36 pf=3D0 orq=3D0 csf=3D4
(XEN) CPU 33: d10v2 isr=3D0 runnbl=3D0 proc=3D33 pf=3D1 orq=3D0 csf=3D4
(XEN) CPU 20: d10v2 isr=3D0 runnbl=3D1 proc=3D20 pf=3D0 orq=3D0 csf=3D4
(XEN) CPU 32: d10v0 isr=3D0 runnbl=3D1 proc=3D32 pf=3D0 orq=3D0 csf=3D4
(XEN) CPU 33: d10v0 isr=3D0 runnbl=3D1 proc=3D12 pf=3D0 orq=3D0 csf=3D4
(XEN) CPU 36: d10v0 isr=3D0 runnbl=3D1 proc=3D36 pf=3D0 orq=3D0 csf=3D4
(XEN) CPU 31: d10v0 isr=3D0 runnbl=3D1 proc=3D31 pf=3D0 orq=3D0 csf=3D4
(XEN) Xen BUG at sched_credit.c:877
(XEN) ----[ Xen-4.11.20180411T100655.82540b66ce-180413055758  x86_64  debug=
=3Dy   Not tainted ]----
(XEN) CPU:    31
(XEN) RIP:    e008:[<ffff82d08022c84d>] sched_credit.c#csched_vcpu_migrate+=
0x52/0x54
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffff830077be8000   rbx: 0000000000000020   rcx: ffff830adaca7d30
(XEN) rdx: 0000000000000020   rsi: ffff8300779b5000   rdi: 00000033fc629000
(XEN) rbp: ffff83107d44fce8   rsp: ffff83107d44fce8   r8:  000000000000001f
(XEN) r9:  0000ffff0000ffff   r10: 00ff00ff00ff00ff   r11: 0f0f0f0f0f0f0f0f
(XEN) r12: ffff83047cbf0188   r13: ffff83047cbe6188   r14: ffff82d0805c7180
(XEN) r15: ffff8300779b5000   cr0: 0000000080050033   cr4: 00000000000026e0
(XEN) cr3: 0000000eb8239000   cr2: 00007f867ef9835c
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08022c84d> (sched_credit.c#csched_vcpu_migrat=
e+0x52/0x54):
(XEN)  5d c3 0f 0b 0f 0b 0f 0b <0f> 0b 55 48 89 e5 48 8d 05 26 a9 39 00 48 =
8b 57
(XEN) Xen stack trace from rsp=3Dffff83107d44fce8:
(XEN)    ffff83107d44fcf8 ffff82d080239419 ffff83107d44fd68 ffff82d08023a8d8
(XEN)    ffff82d0805c7160 ffff82d0805c7180 01ff83107d44fd38 000000200000001f
(XEN)    000000000000000a 0000000000000296 0000000000000000 ffff8300779b5000
(XEN)    ffff83047cbf0188 0000000000000292 0000000000000004 ffff82d0805b2520
(XEN)    ffff83107d44fdb8 ffff82d08023c7ad ffff83047cbf0188 ffff8300779b5000
(XEN)    ffff83107d44fdb8 ffff830077be8000 ffff8300779b5000 ffff83047ffe7000
(XEN)    000000000000001f ffff830adad2f000 ffff83107d44fe08 ffff82d08027a558
(XEN)    ffff83107d44fdd8 ffff82d0802a8530 ffff83107d44fe08 ffff8300779b5000
(XEN)    ffff830077be8000 ffff83047cbf0188 0000007c1960d213 0000000000000003
(XEN)    ffff83107d44fe98 ffff82d0802397a9 ffff8300779b5560 ffff83047cbf01a0
(XEN)    0000001f0044fe58 ffff83047cbf0180 ffff8300779b5000 ffff8300779b5568
(XEN)    ffff83107d44fe78 ffff830077be8000 ffffffffffffffff ffff8300779b5000
(XEN)    ffff8300779b5000 ffff82d08059cc00 ffff82d08059bc80 ffffffffffffffff
(XEN)    ffff83107d44ffff ffff82d0805a3c80 ffff83107d44fed8 ffff82d08023d56a
(XEN)    ffff82d080328bc1 ffff8300779b5000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffff83107d44fee8 ffff82d08023d5dd
(XEN)    00007cef82bb00e7 ffff82d080328d8b ffff88007d86d680 0000000000000000
(XEN)    ffff88007d86d680 ffff88007ea60000 0000000000000001 0000000000000000
(XEN)    0000000000000000 ffff8800870009c0 ffff880087000908 0000000000000000
(XEN)    0000000000000000 00000000fffffffa 0000000000000000 deadbeefdeadf00d
(XEN) Xen call trace:
(XEN)    [<ffff82d08022c84d>] sched_credit.c#csched_vcpu_migrate+0x52/0x54
(XEN)    [<ffff82d080239419>] schedule.c#vcpu_move_locked+0x42/0xcc
(XEN)    [<ffff82d08023a8d8>] schedule.c#vcpu_migrate+0x210/0x23b
(XEN)    [<ffff82d08023c7ad>] context_saved+0x236/0x479
(XEN)    [<ffff82d08027a558>] context_switch+0xe9/0xf67
(XEN)    [<ffff82d0802397a9>] schedule.c#schedule+0x306/0x6ab
(XEN)    [<ffff82d08023d56a>] softirq.c#__do_softirq+0x71/0x9a
(XEN)    [<ffff82d08023d5dd>] do_softirq+0x13/0x15
(XEN)    [<ffff82d080328d8b>] vmx_asm_do_vmentry+0x2b/0x30
(XEN) ****************************************
(XEN) Panic on CPU 31:
(XEN) Xen BUG at sched_credit.c:877
(XEN) ****************************************
(XEN) Reboot in five seconds...

--Sig_/Iy/8LHf/k2K2TcNa1TH3j04
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWtBM5gAKCRBdQqD6ppg2
ftRmAKCB73924WjaB5ycmPUJKTUWERFYHQCgxRogz3KhWTa4aN6/byCGYoIQiJo=
=ZMqM
-----END PGP SIGNATURE-----

--Sig_/Iy/8LHf/k2K2TcNa1TH3j04--


--===============3160793345795174602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3160793345795174602==--
