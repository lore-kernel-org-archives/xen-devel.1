From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Thu, 12 Apr 2018 14:45:53 +0200
Message-ID: <20180412144553.74da01bc.olaf@aepfle.de>
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
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8370112047558108471=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b4e178344a2923404528bd0af07d583fc011b9ab.camel@suse.com>
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

--===============8370112047558108471==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/RA8l4BuOP0VvGuDP2UvLtE1"; protocol="application/pgp-signature"

--Sig_/RA8l4BuOP0VvGuDP2UvLtE1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 12 Apr 2018 12:16:34 +0200
schrieb Dario Faggioli <dfaggioli@suse.com>:

> Olaf, new patch. Please, remove _everything_ and apply _only_ this one.

dies after the first iteration.

        BUG_ON(!test_bit(_VPF_migrating, &prev->pause_flags));

(XEN) Xen BUG at schedule.c:1570
(XEN) ----[ Xen-4.11.20180411T100655.82540b66ce-1.xen_unstable  x86_64  deb=
ug=3Dy   Not tainted ]----
(XEN) CPU:    29
(XEN) RIP:    e008:[<ffff82d08023c6f4>] context_saved+0x1a3/0x32c
(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
(XEN) rax: 0000000000000001   rbx: ffff8300779b3000   rcx: ffff83047fe04188
(XEN) rdx: 0000000000000000   rsi: 0000000000006218   rdi: ffff83047fe0418e
(XEN) rbp: ffff830880057db8   rsp: ffff830880057d78   r8:  0000000000000001
(XEN) r9:  0000000000000000   r10: 00000000ffffffc0   r11: ffff83047fe8e0a0
(XEN) r12: ffff83047fe04188   r13: 0000000000000292   r14: ffff82d0805c7180
(XEN) r15: ffff82d0805b2520   cr0: 0000000080050033   cr4: 00000000000026e0
(XEN) cr3: 0000000b62f19000   cr2: 00000000006af6e8
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08023c6f4> (context_saved+0x1a3/0x32c):
(XEN)  00 e9 09 ff ff ff 0f 0b <0f> 0b e8 a7 bc 06 00 49 89 c6 83 bb c8 00 =
00 00
(XEN) Xen stack trace from rsp=3Dffff830880057d78:
(XEN)    ffff83047cde2f40 ffff8300779b3000 ffff830880057db8 ffff830077bea000
(XEN)    ffff8300779b3000 ffff83047ffe7000 000000000000001d ffff83052b234000
(XEN)    ffff830880057e08 ffff82d08027a3d8 ffff830880057dd8 ffff82d0802a83b0
(XEN)    ffff830880057e08 ffff8300779b3000 ffff830077bea000 ffff83047fe04188
(XEN)    00000056c1375e97 0000000000000002 ffff830880057e98 ffff82d080239783
(XEN)    ffff8300779b3560 ffff83047fe041a0 0000001d00057e58 ffff83047fe04180
(XEN)    ffff82d080328a41 ffff8300779b3000 ffff83052b234000 ffff830077bea000
(XEN)    ffffffffffffffff ffff82d080301f00 ffff8300779b3000 ffff82d08059cb00
(XEN)    ffff82d08059bc80 ffffffffffffffff ffff830880057fff ffff82d0805a3c80
(XEN)    ffff830880057ed8 ffff82d08023d3f7 ffff82d080328a41 ffff8300779b3000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    ffff830880057ee8 ffff82d08023d46a 00007cf77ffa80e7 ffff82d080328c0b
(XEN)    ffff880086960000 ffff880086960000 ffff880086960000 0000000000000000
(XEN)    0000000000000002 ffffffff81d4c180 0000000000000008 0000000a7c976ba7
(XEN)    0000000000000001 0000000000000000 ffffffff81020e50 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000beef0000beef
(XEN)    ffffffff81060182 000000bf0000beef 0000000000000246 ffff880086963ed8
(XEN)    000000000000beef 000000000000beef 000000000000beef 000000000000beef
(XEN)    000000000000beef 000000000000001d ffff830077bea000 00000033ff83d000
(XEN)    00000000000026e0 0000000000000000 000000047fe06000 0000040000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d08023c6f4>] context_saved+0x1a3/0x32c
(XEN)    [<ffff82d08027a3d8>] context_switch+0xe9/0xf67
(XEN)    [<ffff82d080239783>] schedule.c#schedule+0x306/0x6ab
(XEN)    [<ffff82d08023d3f7>] softirq.c#__do_softirq+0x71/0x9a
(XEN)    [<ffff82d08023d46a>] do_softirq+0x13/0x15
(XEN)    [<ffff82d080328c0b>] vmx_asm_do_vmentry+0x2b/0x30



Olaf

--Sig_/RA8l4BuOP0VvGuDP2UvLtE1
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs9VAQAKCRBdQqD6ppg2
fnNNAKChaUgXibw04TGko7wl5BKCdzhrDQCePxVhYI0LJruXHJ6UwXAwF/OpvAU=
=dsO0
-----END PGP SIGNATURE-----

--Sig_/RA8l4BuOP0VvGuDP2UvLtE1--


--===============8370112047558108471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8370112047558108471==--
