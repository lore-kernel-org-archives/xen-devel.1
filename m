Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D555C55ABA
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 20:07:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382629.1625973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrLPI-0004Tg-7H; Tue, 04 Aug 2026 20:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382629.1625973; Tue, 04 Aug 2026 20:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrLPI-0004TZ-4m; Tue, 04 Aug 2026 20:06:36 +0000
Received: by outflank-mailman (input) for mailman id 1382629;
 Tue, 04 Aug 2026 20:06:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peterz@infradead.org>) id 1wrLPF-0004TR-8T
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 20:06:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrLPE-001eg9-Lb
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 22:06:32 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peterz@infradead.org>)
 id 6a72462c-e002-0a2a0a5209dd-0a2a45069ecc-10
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 22:06:31 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peterz@infradead.org>)
 id 6a724376-195a-0a2a45060019-5a9b3222c75a-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 21:54:31 +0200
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wrLDN-00000004dyG-3Yfn; Tue, 04 Aug 2026 19:54:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0A184300B40; Tue, 04 Aug 2026 21:54:17 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+IzxgHirXh8bANHLHHneykwXTiWqinCHzwnsN/D+w1g=; b=cgc/4q5XWxb+9KHledOTiCkjCj
	qq0/2fvaHG7Qp83Vg+3/fUN0X2kukF2LFGusGOYQrH0obYRDUEtgSeWR3tr+4dGHM1+rpu/rLQ1Tk
	0IRno6TRcPM9AAut3SiFQbVeIH55/1SLk/L57s2QIePicpmXv8BSEr/7MiSgs+DW6OKfkUVq4xyWW
	f/Bg3OJHFn/zCKQb5ODfDBLhY5WYJ9QRUlrhLWFVC+XuxtxkMtKKJouvX0pcB5x+VcFKNyhAxS7MJ
	mm2BbOwBUTRRIZYT5+BtfzMIOia+PY04wvaF7AiNa2bNuOBjcNm1RZO5LghLrrQ4rMN1nlxylF5zK
	0KLtQp6A==;
Date: Tue, 4 Aug 2026 21:54:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Dmitry Ilvokhin <d@ilvokhin.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Thomas Gleixner <tglx@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 1/5] x86/paravirt: Use static_call() for the paravirt
 spinlock ops
Message-ID: <20260804195416.GJ776954@noisy.programming.kicks-ass.net>
References: <cover.1785778551.git.d@ilvokhin.com>
 <9a32ae399eb804a02a31af04dcabe7e7ee4f3fdf.1785778551.git.d@ilvokhin.com>
 <20260804190048.GCanI24Hb5P8qAyVZs@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804190048.GCanI24Hb5P8qAyVZs@fat_crate.local>
X-purgate-ID: tlsNG-16d1c6/1785873271-FEA7477B-2DE99309/13/0
X-purgate-type: clean
X-purgate-size: 3811

On Tue, Aug 04, 2026 at 12:00:48PM -0700, Borislav Petkov wrote:
> On Tue, Aug 04, 2026 at 07:15:41AM +0000, Dmitry Ilvokhin wrote:
> > From: Peter Zijlstra <peterz@infradead.org>
> > 
> > queued_spin_lock_slowpath() and queued_spin_unlock() are dispatched
> > through pv_ops_lock via the paravirt-ops ALTERNATIVE machinery, which
> > picks the target (native inline store / hypervisor call) once at boot
> > and cannot change at runtime.
> > 
> > Convert both to static_call(). The site becomes a direct call patched in
> > place (one byte smaller), and on native the unlock still collapses to
> > the inline "movb $0, (%rdi)" store, so the fast path is unchanged.
> > 
> > Unlike the ALTERNATIVE mechanism, a static_call() target can also be
> > updated at runtime via static_call_update(). This is a prerequisite for
> > the contended_release tracepoint, which has to swap in a traced unlock
> > while the system is running.
> > 
> > [ ilvokhin: commit message; fix PARAVIRT_SPINLOCKS=n build; teach
> >   __static_call_validate() about the inline unlock insn; make the
> >   slowpath site module-safe: static_call_mod() +
> >   EXPORT_STATIC_CALL_TRAMP(); pass @lock to the callee-save unlock,
> >   fixing a boot hang under CALL_DEPTH_TRACKING. Boot tested native + KVM
> >   PV guest. ]
> > 
> > Link: https://lore.kernel.org/all/20260603120811.GW3493090@noisy.programming.kicks-ass.net/
> > Co-developed-by: Dmitry Ilvokhin <d@ilvokhin.com>
> > Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
> 
> This needs Peter's SOB.

Yeah, that got fixed when I applied it ;-)

> > ---
> >  arch/x86/hyperv/hv_spinlock.c            |  4 ++--
> >  arch/x86/include/asm/cpufeatures.h       |  1 -
> >  arch/x86/include/asm/paravirt-spinlock.h | 19 +++++++++++------
> >  arch/x86/kernel/kvm.c                    |  5 ++---
> >  arch/x86/kernel/paravirt-spinlocks.c     | 12 +++++------
> >  arch/x86/kernel/static_call.c            | 27 ++++++++++++++++++++++++
> >  arch/x86/xen/spinlock.c                  |  5 ++---
> >  tools/arch/x86/include/asm/cpufeatures.h |  1 -
> >  8 files changed, 51 insertions(+), 23 deletions(-)
> > 
> > diff --git a/arch/x86/hyperv/hv_spinlock.c b/arch/x86/hyperv/hv_spinlock.c
> > index 210b494e4de0..6b4bdea18218 100644
> > --- a/arch/x86/hyperv/hv_spinlock.c
> > +++ b/arch/x86/hyperv/hv_spinlock.c
> > @@ -78,8 +78,8 @@ void __init hv_init_spinlocks(void)
> >  	pr_info("PV spinlocks enabled\n");
> >  
> >  	__pv_init_lock_hash();
> > -	pv_ops_lock.queued_spin_lock_slowpath = __pv_queued_spin_lock_slowpath;
> > -	pv_ops_lock.queued_spin_unlock = PV_CALLEE_SAVE(__pv_queued_spin_unlock);
> > +	static_call_update(queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
> > +	static_call_update(queued_spin_unlock, __raw_callee_save___pv_queued_spin_unlock);
> >  	pv_ops_lock.wait = hv_qlock_wait;
> >  	pv_ops_lock.kick = hv_qlock_kick;
> >  	pv_ops_lock.vcpu_is_preempted = PV_CALLEE_SAVE(hv_vcpu_is_preempted);
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > index 1b4a48bff18f..e41fe5c24841 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -225,7 +225,6 @@
> >  #define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
> >  #define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
> >  #define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
> > -#define X86_FEATURE_PVUNLOCK		( 8*32+20) /* PV unlock function */
> 
> No, do:
> 
> /* free: was #define X86_FEATURE_PVUNLOCK		( 8*32+20) /* PV unlock function */
> 
> so that we can reuse it by finding it easier.

Sure, I can do that.

