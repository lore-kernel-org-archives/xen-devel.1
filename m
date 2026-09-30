Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07205CA5FBE
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 10:07:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436996.1655684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrDl-0001KJ-Pt; Wed, 30 Sep 2026 10:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436996.1655684; Wed, 30 Sep 2026 10:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrDl-0001KC-NB; Wed, 30 Sep 2026 10:07:29 +0000
Received: by outflank-mailman (input) for mailman id 1436996;
 Wed, 30 Sep 2026 10:07:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xBrDj-0001K6-UE
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 10:07:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBrDi-006eE2-0Y;
 Wed, 30 Sep 2026 10:07:26 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBrDh-00Be8v-0m;
 Wed, 30 Sep 2026 10:07:25 +0000
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
	bh=A8pQrXwrcTKRK5xfZb349Uvax0m3S5ssqNyGoMDF5ws=; b=419MRbYYudIJya/fzu+ieE43SJ
	FjD6ltCoGmGgspgdOGbr0puDN6oZtoKulyWN6tSZONfAxAN/7pzMrygSYNM+7RR6b0a8suzri+jpX
	w9bb4upZU8FIXXrkJewoVWCmeb9UQK/Kw6ww5gqfSXNh86IH7VCaEibTxF0OlWg+vQgs=;
Date: Wed, 30 Sep 2026 12:07:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
Message-ID: <arzfW8dQgcfISTWE@macbook.local>
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
 <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com>
 <arvJQSDecSSAU1WC@macbook.local>
 <50d1df6c-d969-470b-9b40-ca171c60618d@suse.com>
 <DLS5A4YDJ8ET.28ZIPQ6QEN2K4@amd.com>
 <3e600ac0-3096-4cfb-967b-c6d87d8c04e6@suse.com>
 <arzDzQMP5rGz1-QJ@macbook.local>
 <3e2b41a5-5c85-4a6a-8f91-c2b979f87b86@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e2b41a5-5c85-4a6a-8f91-c2b979f87b86@suse.com>

On Wed, Sep 30, 2026 at 10:34:02AM +0200, Jan Beulich wrote:
> On 30.09.2026 10:09, Roger Pau Monné wrote:
> > On Wed, Sep 30, 2026 at 07:58:55AM +0200, Jan Beulich wrote:
> >> On 30.09.2026 00:14, Alejandro Vallejo wrote:
> >>> On Tue Sep 29, 2026 at 4:52 PM CEST, Jan Beulich wrote:
> >>>> On 29.09.2026 16:20, Roger Pau Monné wrote:
> >>>>> On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote:
> >>>>>> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
> >>>>>>>  static inline void rcu_quiesce_disable(void)
> >>>>>>>  {
> >>>>>>> +    unsigned int cpu = smp_processor_id();
> >>>>>>> +
> >>>>>>>      preempt_disable();
> >>>>>>> -    this_cpu(rcu_lock_cnt)++;
> >>>>>>> -    barrier();
> >>>>>>> +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
> >>>>>>> +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) = ACCESS_ONCE(rcu_epoch);
> >>>>>>
> >>>>>> I'm not terribly convinced about using ACCESS_ONCE() for atomic
> >>>>>> accesses. In particular...
> >>>>>>
> >>>>>>> +    smp_mb();
> >>>>>>>  }
> >>>>>>>  
> >>>>>>>  static inline void rcu_quiesce_enable(void)
> >>>>>>>  {
> >>>>>>> -    barrier();
> >>>>>>> -    this_cpu(rcu_lock_cnt)--;
> >>>>>>> +

Just noticed there's an unwanted newline being added here.

> >>>>>>> +    smp_mb();
> >>>>>>> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
> >>>>>>
> >>>>>> ... this variable is to be read by remote CPUs and autodecrement seems
> >>>>>> like the wrong tool for an atomic decrement.
> >>>>>
> >>>>> I can use {read,write}_atomic() instead, but there's been a tendency
> >>>>> to phase out the usage of those functions.  On x86 this should be a
> >>>>> plain `addl` or `subl` instruction (the non-locked version of
> >>>>> atomic_{inc,dec}()).
> >>>
> >>> I don't think the compiler can merge volatile reads and writes. It can
> >>> shatter them (thus my fear), but they are meant to be distinct because
> >>> each might have different side effects. Jan already mentioned this in
> >>> other words.
> >>>
> >>> You don't need an atomic decrement though, just an atomic write. Note
> >>> IRQs restore it on exit and other CPUs don't write to it.
> >>>
> >>>   unsigned int *lock_cnt = &this_cpu(rcu_lock_cnt);
> >>>   write_atomic(lock_cnt, *lock_cnt - 1);
> >>>
> >>> and this yields a plain mov, through a static inline stub (plus the
> >>> mov from the read access + dec)
> >>>
> >>> The problem with ACCESS_ONCE() is that the write isn't guaranteed to be
> >>> atomic.
> >>
> >> It may not be properly written down anywhere, but at least the compilers
> >> we use are known to not tear aligned accesses up to a machine word in
> >> width.
> > 
> > Then I possibly don't need the ACCESS_ONCE() at all, as I was using it
> > to guarantee unshattered accesses.  However this should be written
> > somewhere, maybe in docs/process/coding-best-practices.pandoc?
> 
> To write it down in any of our docs, we'd first need a proper reference
> to somewhere. "Known to" isn't quite sufficient imo to actually nail
> things down.

Fair enough, I also assume compilers would never like to write
this down anywhere in the documentation.

> There's still the possibility of compiler bugs,

Compiler bugs could apply to anything that a compiler generates, and
hence is not likely relevant to mention for each compiler feature or
behavior we rely upon.

> and there's
> also the possibility that volatile accesses have better guarantees than
> non-volatile ones. (Recall that in prior discussions it was actually said
> that we may need to make far more use of ACCESS_ONCE(), which wouldn't be
> warranted if collectively we were certain aligned accesses cannot be
> torn.)

OK, so are we in agreement that ACCESS_ONCE(this_cpu(rcu_lock_cnt))--
ensures accesses to the variable are always non-torn?  Splitting
the access as a RMW is fine, as long as the accesses are not torn.

Thanks, Roger.

