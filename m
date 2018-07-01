From: M A Young <m.a.young@durham.ac.uk>
Subject: Re: xen crash with 4.17 kernel on Fedora
Date: Sun, 1 Jul 2018 19:09:14 +0100 (BST)
Message-ID: <alpine.DEB.2.11.1807011906020.55689@procyon.dur.ac.uk>
References: <alpine.LFD.2.21.1807011742590.4081@austen3.home>
 <64535980-8fa4-cd40-705b-665ad8907d7e@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-638033233-1530468554=:55689"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=thzz=jr=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1fZgnA-0005P3-At
 for xen-devel@lists.xenproject.org; Sun, 01 Jul 2018 18:09:44 +0000
In-Reply-To: <64535980-8fa4-cd40-705b-665ad8907d7e@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-638033233-1530468554=:55689
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Sun, 1 Jul 2018, Andrew Cooper wrote:

> On 01/07/18 17:43, Michael Young wrote:
> > I am seeing crash on boot and DomU (pv) on Fedora with the 4.17 kernel
> > (eg. kernel-4.17.2-200.fc28.x86_64 and kernel-4.17.3-200.fc28.x86_64)
> > which
> > didn't occur with 4.16 kernel (eg. kernel-4.16.16-300.fc28.x86_64)
> >
> > The backtrace for a Dom0 boot of xen-4.10.1-5.fc28.x86_64 running
> > kernel-4.17.2-200.fc28.x86_64 is
> >
> > (XEN) d0v0 Unhandled general protection fault fault/trap [#13, ec=0000]
> > (XEN) domain_crash_sync called from entry.S: fault at ffff82d08035557c
> > x86_64/entry.S#create_bounce_frame+0x135/0x159
> > (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
> > (XEN) ----[ Xen-4.10.1  x86_64  debug=n   Not tainted ]----
> > (XEN) CPU:    0
> > (XEN) RIP:    e033:[<ffffffff81062330>]
> > (XEN) RFLAGS: 0000000000000246   EM: 1   CONTEXT: pv guest (d0v0)
> > (XEN) rax: 0000000000000246   rbx: 00000000ffffffff   rcx:
> > 0000000000000000
> > (XEN) rdx: 0000000000000000   rsi: 00000000ffffffff   rdi:
> > 0000000000000000
> > (XEN) rbp: 0000000000000000   rsp: ffffffff82203d90   r8: 
> > ffffffff820bb698
> > (XEN) r9:  ffffffff82203e38   r10: 0000000000000000   r11:
> > 0000000000000000
> > (XEN) r12: 0000000000000000   r13: ffffffff820bb698   r14:
> > ffffffff82203e38
> > (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4:
> > 00000000000006e0
> > (XEN) cr3: 000000001aacf000   cr2: 0000000000000000
> > (XEN) fsb: 0000000000000000   gsb: ffffffff82731000   gss:
> > 0000000000000000
> > (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
> > (XEN) Guest stack trace from rsp=ffffffff82203d90:
> > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > ffffffff81062330
> > (XEN)    000000010000e030 0000000000010046 ffffffff82203dd8
> > 000000000000e02b
> > (XEN)    0000000000000246 ffffffff8110e019 0000000000000000
> > 0000000000000246
> > (XEN)    0000000000000000 0000000000000000 ffffffff820a6cd8
> > ffffffff82203e88
> > (XEN)    ffffffff82739000 8000000000000061 0000000000000000
> > 0000000000000000
> > (XEN)    ffffffff8110ecb6 0000000000000008 ffffffff82203e98
> > ffffffff82203e58
> > (XEN)    0000000000000000 0000000000000000 8000000000000161
> > 0000000000000100
> > (XEN)    fffffffffffffeff 0000000000000000 0000000000000000
> > ffffffff82203ef0
> > (XEN)    ffffffff810ac990 0000000000000000 0000000000000000
> > 0000000000000000
> > (XEN)    0000000000000000 0000000000000000 8000000000000161
> > 0000000000000100
> > (XEN)    fffffffffffffeff 0000000000000000 0000000000000000
> > 0000000002739000
> > (XEN)    0000000000000080 ffffffff8275db62 000000000001a739
> > 0000000000000000
> > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > ffffffff81037c80
> > (XEN)    007fffff8275efe7 ffffffff82739000 ffffffff81037f18
> > ffffffff8102aaf0
> > (XEN)    ffffffff8275dc8c 0000000000000000 0000000000000000
> > 0000000000000000
> > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > 0000000000000000
> > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > 0000000000000000
> > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > 0000000000000000
> > (XEN)    0000000000000000 0000000000000000 0000000000000000
> > 0000000000000000
> > (XEN)    0000000000000000 0000000000000000 0f00000060c0c748
> > ccccccccccccc305
> >
> > where
> > addr2line -f -e vmlinux ffffffff81062330
> > gives
> > native_irq_disable
> > /usr/src/debug/kernel-4.17.fc28/linux-4.17.2-200.fc28.x86_64/./arch/x86/include/asm/irqflags.h:44
> >
> >
> > What is the problem or how might it be debugged?
> 
> The guest is executing a native `cli` instruction which is privileged
> and we don't allow (we could trap & emulate, but we can't provide proper
> STI-shadow behaviour, and such a guest might also expect popf to work,
> which is very much doesnt).  In Linux, that codepath should be using a
> pvop, rather than a native op.
> 
> It is either a subsystem which should be skipped when virtualised, or a
> poorly coded subsystem, or a buggy setup path.
> 
> Can you see about trying to boot the old kernel as dom0, and the new
> kernel as a domU with pause on crash configured? 
> /usr/libexec/xen/bin/xenctx should be able to pull a backtrace out of
> the crashed domain state if you pass the appropriate symbol table in.

I get (with kernel-4.17.3-200.fc28.x86_64 which is a bit easier)

rip: ffffffff81062330 native_irq_disable
flags: 00000246 i z p
rsp: ffffffff82203d90
rax: 0000000000000246	rcx: 0000000000000000	rdx: 0000000000000000
rbx: 00000000ffffffff	rsi: 00000000ffffffff	rdi: 0000000000000000
rbp: 0000000000000000	 r8: ffffffff820bb698	 r9: ffffffff82203e38
r10: 0000000000000000	r11: 0000000000000000	r12: 0000000000000000
r13: ffffffff820bb698	r14: ffffffff82203e38	r15: 0000000000000000
 cs: e033	 ss: e02b	 ds: 0000	 es: 0000
 fs: 0000 @ 0000000000000000
 gs: 0000 @ ffffffff82731000/0000000000000000 __init_begin/
Code (instr addr ffffffff81062330)
00 00 00 00 00 57 9d c3 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 <fa> c3 0f 
1f 40 00 66 2e 0f 1f 84 


Stack:
 0000000000000000 0000000000000000 0000000000000000 ffffffff81062330
 000000010000e030 0000000000010046 ffffffff82203dd8 000000000000e02b
 0000000000000246 ffffffff8110dff9 0000000000000000 0000000000000246
 0000000000000000 0000000000000000 ffffffff820a6cd0 ffffffff82203e88
 ffffffff82739000 8000000000000061 0000000000000000 0000000000000000

Call Trace:
                    [<ffffffff81062330>] native_irq_disable <--
ffffffff82203da8:   [<ffffffff81062330>] native_irq_disable
ffffffff82203dd8:   [<ffffffff8110dff9>] vprintk_emit+0xe9
ffffffff82203e30:   [<ffffffff8110ec96>] printk+0x58
ffffffff82203e90:   [<ffffffff810ac970>] __warn_printk+0x46
ffffffff82203ef8:   [<ffffffff8275db62>] xen_load_gdt_boot+0x108
ffffffff82203f28:   [<ffffffff81037c70>] load_direct_gdt+0x30
ffffffff82203f40:   [<ffffffff81037f08>] switch_to_new_gdt+0x8
ffffffff82203f48:   [<ffffffff8102aae0>] x86_init_noop
ffffffff82203f50:   [<ffffffff8275dc8c>] xen_start_kernel+0xed
 
	Michael Young
--8323329-638033233-1530468554=:55689
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-638033233-1530468554=:55689--
