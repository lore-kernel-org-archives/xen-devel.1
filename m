From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Wed, 25 Apr 2018 16:42:46 +0200
Message-ID: <20180425144246.GA27422@mail.soc.lip6.fr>
References: <20180424160631.GA7526@mail.soc.lip6.fr>
 <5AE0272702000078001BE3B3@prv1-mh.provo.novell.com>
 <20180425104242.GA24012@mail.soc.lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5zwe=ho=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fBLdC-0005HP-UG
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 14:42:50 +0000
Content-Disposition: inline
In-Reply-To: <20180425104242.GA24012@mail.soc.lip6.fr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, julien.grall@linaro.org
List-Id: xen-devel@lists.xenproject.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 25, 2018 at 12:42:42PM +0200, Manuel Bouyer wrote:
> > Without line numbers associated with at least the top stack trace entry
> > I can only guess what it might be - could you give the patch below a try?
> > (This may not be the final patch, as I'm afraid there may be some race
> > here, but I'd have to work this out later.)
> 
> Yes, this works. thanks !
> I'll now put this version on the NetBSD testbed I'm running.
> This should put some pressure on it.

Running NetBSD tests in several guests I got:
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) Assertion 'oc > 0' failed at mm.c:628
(XEN) ****************************************
(see attached file for complete report).

I got similar panics on Xen 4.8 after patching for meltdown 
(XSA-254).
I'll try the patch from XSA-259

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=xen-panic2

(XEN) Assertion 'oc > 0' failed at mm.c:628
(XEN) ----[ Xen-4.11-rcnb0  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d080284a22>] mm.c#dec_linear_entries+0x12/0x20
(XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor (d14v3)
(XEN) rax: ffffffffffff0000   rbx: 4400000000000001   rcx: 0000000000189b0d
(XEN) rdx: 0400000000000000   rsi: 0000000000000008   rdi: ffff82e0031349c0
(XEN) rbp: ffff82e0031361a0   rsp: ffff8301bf15fc08   r8:  0000000000000000
(XEN) r9:  0000000000000200   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: ffff82e0031349c0   r13: 0000000000000000   r14: 10ffffffffffffff
(XEN) r15: 1000000000000000   cr0: 0000000080050033   cr4: 00000000000026e4
(XEN) cr3: 00000001b98de000   cr2: 00000000cd9ffe80
(XEN) fsb: 00000000c0e02000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0011   es: 0011   fs: 0031   gs: 0011   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d080284a22> (mm.c#dec_linear_entries+0x12/0x20):
(XEN)  c1 47 1e 66 85 c0 7f 02 <0f> 0b c3 66 66 2e 0f 1f 84 00 00 00 00 00 41 54
(XEN) Xen stack trace from rsp=ffff8301bf15fc08:
(XEN)    ffff82d080288e3e 0000000000800063 ffff8301bf15ffff 4c00000000000002
(XEN)    ffff82e0031361a0 ffff82e0031349c0 ffff8301b970e000 0000000000000001
(XEN)    ffff82004000b000 0200000000000000 ffff82d08028945f 00000000000001fd
(XEN)    ffff82e0031349c0 ffff82d080288869 0000000000189a4e 0000000000000000
(XEN)    ffff8301bf15ffff 4400000000000001 ffff82e0031349c0 0000000000000000
(XEN)    00ffffffffffffff 10ffffffffffffff 1000000000000000 ffff82d080288e07
(XEN)    0000000101000206 ffff8301bf15ffff 4400000000000002 0000000000189a4e
(XEN)    ffff82e0031349c0 0000000000000000 ffff8301b970e000 ffff82008000c000
(XEN)    0000000000000000 ffff82d08028949f ffff82d0802906cd ffff8300bf9be000
(XEN)    00000001802a7eb2 ffff8301b970e000 0000000000000000 ffff8301b970e000
(XEN)    0000000000000007 ffff8300bf9be000 00007ff000000000 0000000000000000
(XEN)    ffff8301b970e000 ffff82e0031ab060 ffff82d0804b0058 ffff82d0804b0060
(XEN)    000000000018d583 000000000018d583 0000000000000004 0000000000189a4e
(XEN)    00000000cd9c9ce4 ffff82008000c018 0000000000000001 00000000cd9c9af4
(XEN)    ffff82d080386b30 0000000000000001 ffff8301bf15ffff ffff82d080295190
(XEN)    ffff8301bf15fe14 00000001ffffffff ffff82008000c000 0000000000000000
(XEN)    00007ff000000000 000000048036b1d8 cd7cc00000189a4e ffff8301bf15fef8
(XEN)    ffff8300bf9be000 00000000000001a0 00000000deadf00d 0000000000000004
(XEN)    00000000deadf00d ffff82d0803672fa ffff82d000007ff0 ffff82d000000000
(XEN)    ffff82d000000001 ffff82d0cd9c9ae8 ffff82d08036b1e4 ffff82d08036b1d8
(XEN) Xen call trace:
(XEN)    [<ffff82d080284a22>] mm.c#dec_linear_entries+0x12/0x20
(XEN)    [<ffff82d080288e3e>] mm.c#_put_page_type+0x13e/0x340
(XEN)    [<ffff82d08028945f>] mm.c#put_page_from_l2e+0xdf/0x110
(XEN)    [<ffff82d080288869>] free_page_type+0x2f9/0x790
(XEN)    [<ffff82d080288e07>] mm.c#_put_page_type+0x107/0x340
(XEN)    [<ffff82d08028949f>] put_page_type_preemptible+0xf/0x10
(XEN)    [<ffff82d0802906cd>] do_mmuext_op+0x73d/0x1810
(XEN)    [<ffff82d080295190>] compat_mmuext_op+0x430/0x450
(XEN)    [<ffff82d0803672fa>] pv_hypercall+0x3aa/0x430
(XEN)    [<ffff82d08036b1e4>] entry_int82+0x74/0xc0
(XEN)    [<ffff82d08036b1d8>] entry_int82+0x68/0xc0
(XEN)    [<ffff82d08036b1e4>] entry_int82+0x74/0xc0
(XEN)    [<ffff82d08036b1d8>] entry_int82+0x68/0xc0
(XEN)    [<ffff82d08036b1e4>] entry_int82+0x74/0xc0
(XEN)    [<ffff82d08036b1d8>] entry_int82+0x68/0xc0
(XEN)    [<ffff82d08036b1e4>] entry_int82+0x74/0xc0
(XEN)    [<ffff82d080368b6e>] do_entry_int82+0x1e/0x20
(XEN)    [<ffff82d08036b221>] entry_int82+0xb1/0xc0

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--jRHKVT23PllUwdXP--
