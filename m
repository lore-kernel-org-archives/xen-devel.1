Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E37FCA5FAE
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 14:21:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436479.1655130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBYhS-0001j4-JT; Tue, 29 Sep 2026 14:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436479.1655130; Tue, 29 Sep 2026 14:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBYhS-0001ix-GG; Tue, 29 Sep 2026 14:20:54 +0000
Received: by outflank-mailman (input) for mailman id 1436479;
 Tue, 29 Sep 2026 14:20:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xBYhQ-0001ir-Vi
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 14:20:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBYhP-0054L2-2k;
 Tue, 29 Sep 2026 14:20:52 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBYhP-0059jX-2S;
 Tue, 29 Sep 2026 14:20:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=bH1h+5bYP4T+5C2iVf+ODAs6ZHADV4fPmfF/s1z9aNI=; b=BJs4v1R5FNlDrrafHT+DMgQ0Ci
	1uuJ5fFNCD3orQPlZH1zszov3NHFTMTjTffQu4nSLvithNNeecF7qttq8C23g8or06vy8utG+bueF
	KJ6KdmoQj0YjBFC78T8XCUyCxGj2ePbPlRHH5ZDuqbS1VuK2dcvOqgQ0LlRRy5XaVjgI=;
Date: Tue, 29 Sep 2026 16:20:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
Message-ID: <arvJQSDecSSAU1WC@macbook.local>
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
 <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com>

On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote:
> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
> > An RCU epoch signals the lifetime of RCU references.  Each CPU records the
> > epoch in force when it enters an RCU critical section.  When a callback is
> > queued the current epoch is stored in the callback and the global epoch is
> > then bumped, as a way to know when all CPUs have moved past a specific
> > epoch.  At that point there can be no remaining references to objects
> > fetched during the callback's epoch.
> >
> > The compiler barrier is switched to a full memory barrier, as future uses
> > of rcu_lock_cnt must ensure the count is increased before taking a
> > reference to any RCU protected object.
> >
> > Access rcu_lock_cnt, rcu_lock_epoch and rcu_epoch through ACCESS_ONCE()
> > to stop the compiler shattering the loads and stores.  The reordering
> > prevention aspect of ACCESS_ONCE() is not what we rely on here (the memory
> > barriers cover that); what matters is that these variables now have remote
> > consumers, so each access must be a single, non-torn memory operation.
> >
> > Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> > ---
> > Can possibly be folded into the next patch, as it's lacking context on its
> > own to understand the need to introduce the logic.
> > ---
> > Changes since v1:
> >  - Do the setting of head->added in the interrupt disabled section.
> >  - Unconditionally do a memory barrier when enter/exit RCU critical
> >    regions.  Attempting to do selectively is too complex.
> > ---
> >  xen/common/rcupdate.c      |  6 ++++++
> >  xen/include/xen/rcupdate.h | 17 +++++++++++++----
> >  2 files changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
> > index c1b6b2ae768b..babaabbbeefe 100644
> > --- a/xen/common/rcupdate.c
> > +++ b/xen/common/rcupdate.c
> > @@ -49,6 +49,11 @@
> >  #include <asm/atomic.h>
> >  
> >  DEFINE_PER_CPU(unsigned int, rcu_lock_cnt);
> > +/* Store epoch when CPU entered the RCU critical section. */
> > +DEFINE_PER_CPU(unsigned int, rcu_lock_epoch);
> > +
> > +/* Current RCU epoch, bumped every time a new callback is queued. */
> > +unsigned int rcu_epoch;
> 
> nit: I'd suggest calling this rcu_cur_epoch, and then renaming "added"
> below to plain "epoch". "added" doesn't convey what the field is at all.

added_epoch? (or epoch_added?)

I would be fine with epoch also.  I think it's obvious that the
global variable holds the current epoch without it needing the "cur"
addition.

> >  
> >  /* Global control variables for rcupdate callback mechanism. */
> >  static struct rcu_ctrlblk {
> > @@ -283,6 +288,7 @@ void call_rcu(struct rcu_head *head,
> >      head->func = func;
> >      head->next = NULL;
> >      local_irq_save(flags);
> > +    head->added = arch_fetch_and_add(&rcu_epoch, 1);
> >      rdp = &this_cpu(rcu_data);
> >      *rdp->nxttail = head;
> >      rdp->nxttail = &head->next;
> > diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
> > index c57f628107cf..5846e8c169d7 100644
> > --- a/xen/include/xen/rcupdate.h
> > +++ b/xen/include/xen/rcupdate.h
> > @@ -34,24 +34,32 @@
> >  #include <xen/compiler.h>
> >  #include <xen/spinlock.h>
> >  #include <xen/cpumask.h>
> > +#include <xen/lib.h>
> >  #include <xen/percpu.h>
> >  #include <xen/preempt.h>
> >  
> >  #define __rcu
> >  
> >  DECLARE_PER_CPU(unsigned int, rcu_lock_cnt);
> > +DECLARE_PER_CPU(unsigned int, rcu_lock_epoch);
> > +
> > +extern unsigned int rcu_epoch;
> >  
> >  static inline void rcu_quiesce_disable(void)
> >  {
> > +    unsigned int cpu = smp_processor_id();
> > +
> >      preempt_disable();
> > -    this_cpu(rcu_lock_cnt)++;
> > -    barrier();
> > +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
> > +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) = ACCESS_ONCE(rcu_epoch);
> 
> I'm not terribly convinced about using ACCESS_ONCE() for atomic
> accesses. In particular...
> 
> > +    smp_mb();
> >  }
> >  
> >  static inline void rcu_quiesce_enable(void)
> >  {
> > -    barrier();
> > -    this_cpu(rcu_lock_cnt)--;
> > +
> > +    smp_mb();
> > +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
> 
> ... this variable is to be read by remote CPUs and autodecrement seems
> like the wrong tool for an atomic decrement.

I can use {read,write}_atomic() instead, but there's been a tendency
to phase out the usage of those functions.  On x86 this should be a
plain `addl` or `subl` instruction (the non-locked version of
atomic_{inc,dec}()).

Thanks, Roger.

