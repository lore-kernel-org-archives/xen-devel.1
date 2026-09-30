Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BC3CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 08:32:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436921.1655598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBpja-0001v0-LA; Wed, 30 Sep 2026 08:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436921.1655598; Wed, 30 Sep 2026 08:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBpja-0001ut-I5; Wed, 30 Sep 2026 08:32:14 +0000
Received: by outflank-mailman (input) for mailman id 1436921;
 Wed, 30 Sep 2026 08:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xBpjZ-0001un-IX
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 08:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBpjX-006btu-1Z;
 Wed, 30 Sep 2026 08:32:11 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBpjX-00Az3m-1H;
 Wed, 30 Sep 2026 08:32:11 +0000
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
	bh=IMsquIvAdfp9xDqvzieo6PymTFtDVdyXoi9r7PPl9Sc=; b=Y0e9TfAZmV56bBPQnFoMUT0utX
	/75UwC6CHlTjRoGcf3xCc5/GKyNnT0DdcfUwSO3ouY8+rz1jby9JE0SlwmRCibAeoMs4pcYQjA3Et
	YDxAtSb77x7rSHk1N+9+j3w4BREzBPl7x0oFijFZ1J3teMOdX2aOHrAEuVs9E6P/itxA=;
Date: Wed, 30 Sep 2026 10:32:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
Message-ID: <arzJCY1M6NcVInmn@macbook.local>
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
 <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com>
 <arvJQSDecSSAU1WC@macbook.local>
 <50d1df6c-d969-470b-9b40-ca171c60618d@suse.com>
 <DLS5A4YDJ8ET.28ZIPQ6QEN2K4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLS5A4YDJ8ET.28ZIPQ6QEN2K4@amd.com>

On Wed, Sep 30, 2026 at 12:14:15AM +0200, Alejandro Vallejo wrote:
> On Tue Sep 29, 2026 at 4:52 PM CEST, Jan Beulich wrote:
> > On 29.09.2026 16:20, Roger Pau Monné wrote:
> > > On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote:
> > >> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
> > >>>  static inline void rcu_quiesce_disable(void)
> > >>>  {
> > >>> +    unsigned int cpu = smp_processor_id();
> > >>> +
> > >>>      preempt_disable();
> > >>> -    this_cpu(rcu_lock_cnt)++;
> > >>> -    barrier();
> > >>> +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
> > >>> +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) = ACCESS_ONCE(rcu_epoch);
> > >>
> > >> I'm not terribly convinced about using ACCESS_ONCE() for atomic
> > >> accesses. In particular...
> > >>
> > >>> +    smp_mb();
> > >>>  }
> > >>>  
> > >>>  static inline void rcu_quiesce_enable(void)
> > >>>  {
> > >>> -    barrier();
> > >>> -    this_cpu(rcu_lock_cnt)--;
> > >>> +
> > >>> +    smp_mb();
> > >>> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
> > >>
> > >> ... this variable is to be read by remote CPUs and autodecrement seems
> > >> like the wrong tool for an atomic decrement.
> > > 
> > > I can use {read,write}_atomic() instead, but there's been a tendency
> > > to phase out the usage of those functions.  On x86 this should be a
> > > plain `addl` or `subl` instruction (the non-locked version of
> > > atomic_{inc,dec}()).
> 
> I don't think the compiler can merge volatile reads and writes. It can
> shatter them (thus my fear), but they are meant to be distinct because
> each might have different side effects. Jan already mentioned this in
> other words.
> 
> You don't need an atomic decrement though, just an atomic write. Note
> IRQs restore it on exit and other CPUs don't write to it.
> 
>   unsigned int *lock_cnt = &this_cpu(rcu_lock_cnt);
>   write_atomic(lock_cnt, *lock_cnt - 1);
> 
> and this yields a plain mov, through a static inline stub (plus the
> mov from the read access + dec)
> 
> The problem with ACCESS_ONCE() is that the write isn't guaranteed to be
> atomic.

It has always been blurry to me using ACCESS_ONCE() to signal
unshattered accesses, but we seem to rely on this property in other
places already (which doesn't mean is correct).  See
ffa_negotiate_version() for example.

This is all kind of moot if we guarantee that all supported compilers
will never tear accesses up to machine word sizes.

> >
> > If remote CPUs are to access the variable, is a non-locked access okay
> > in the first place?
> 
> You use locked access when you need sequential consistency or an atomic
> RMW, and that's not it here. There's a single writer (currrent CPU) and
> IRQs don't play a part because the restore the previous value before
> returning. So it's race-free. All we need to ensure is that remote CPUs
> never see a partial write.
> 
> Another take would be to subsume the prior smp_mb() into the decrement.
> Something like:
> 
>   arch_fetch_add(&this_cpu(rcu_lock_cnt), RCU_LOCK_CNT_MAX);

Kind of a nit (as I've already attempted this approach), but
arch_fetch_and_add() is not usable as-is here.  We we need to consume
the returned value, otherwise the compiler complains.

./arch/x86/include/asm/system.h:189:6: error: value computed is not used [-Werror=unused-value]

Could do:

unsigned int prev = arch_fetch_and_add(&this_cpu(rcu_lock_cnt), -1);
ASSERT(prev > 0);

> This would make the decrement itself atomic (through a locked insn), but
> ensure sequential consistency as well, thus removing the need for the
> prior barrier. It's trickery through twos complement to behave like a unit
> decrement.
> 
> My point isn't so much the "how" (should be obvious by now there's many
> ways), but to not use ACCESS_ONCE() where an atomic read or write was
> meant. Not necessarily a locked instruction. Just atomic.

I don't have a strong opinion of using smp_mb() vs
arch_fetch_and_add().  I think smp_mb() expresses the intention
better, and avoids explicitly using a locked instruction, which is not
required here.

Thanks, Roger.

