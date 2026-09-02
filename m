Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97976C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:15:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405399.1638891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1h3s-0003sM-Md; Wed, 02 Sep 2026 09:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405399.1638891; Wed, 02 Sep 2026 09:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1h3s-0003sF-K0; Wed, 02 Sep 2026 09:15:16 +0000
Received: by outflank-mailman (input) for mailman id 1405399;
 Wed, 02 Sep 2026 09:15:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x1h3r-0003s9-15
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:15:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1h3q-001pbZ-2A;
 Wed, 02 Sep 2026 09:15:14 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1h3q-007IB8-0J;
 Wed, 02 Sep 2026 09:15:14 +0000
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
	bh=x/tOVHZzTOR6m14ACdUVe70763wiim5Cnk9IKbrQW1s=; b=er2cy9swi0sAX85LHlY4u+QH0W
	At+9kyCju9CQb8p2mrh+l8t6YFkNisgd8g88IGDohYYpwRdHtW+Rrm5r+K+tYjNWEo+TOM73YCeY1
	kRUaw3i/Wr4Lnb3pYfY1UWvYkI3CHWaK8ZGMQtEtriOsgpKKaB8yMDAmK+yhNVrpEbEk=;
Date: Wed, 2 Sep 2026 11:15:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v5 2/2] x86/time: avoid early uses of NOW() to return zero
Message-ID: <apfpHXG7wMMwerk7@macbook.local>
References: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
 <cb8d9a90-64ce-4e86-a188-36a32fe02970@suse.com>
 <apfWTzVihQi5LX9x@macbook.local>
 <1047fb1f-87a3-46b9-ad91-904b05d8a637@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1047fb1f-87a3-46b9-ad91-904b05d8a637@suse.com>

On Wed, Sep 02, 2026 at 10:40:04AM +0200, Jan Beulich wrote:
> On 02.09.2026 09:54, Roger Pau Monné wrote:
> > On Wed, Aug 19, 2026 at 01:45:56PM +0200, Jan Beulich wrote:
> >> Waiting loops like the one in flush_command_buffer() will degenerate to
> >> infinite ones when used early enough for NOW() to still return constant
> >> zero. Make sure the returned value at least monotonically increases. When
> >> available, use nominal frequency values as initial approximation.
> >>
> >> Do this only in get_s_time(), as producing a sane value in
> >> get_s_time_fixed() for non-zero inputs won't be reasonably possible.
> >> Put an assertion there.
> >>
> >> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger@xenporject.org>
> 
> I assume you won't mind if I correct the typo in the domain name.

Sure, please do.

> >> --- a/xen/arch/x86/time.c
> >> +++ b/xen/arch/x86/time.c
> >> @@ -1664,6 +1664,9 @@ s_time_t get_s_time_fixed(uint64_t at_ts
> >>      const struct cpu_time *t = &this_cpu(cpu_time);
> >>      uint64_t tsc, delta;
> >>  
> >> +    /* scale_delta() degenerates when the scale wasn't set yet. */
> >> +    ASSERT(t->tsc_scale.mul_frac);
> >> +
> >>      if ( at_tsc )
> >>          tsc = at_tsc;
> >>      else
> >> @@ -1679,6 +1682,20 @@ s_time_t get_s_time_fixed(uint64_t at_ts
> >>  
> >>  s_time_t get_s_time(void)
> >>  {
> >> +    /*
> >> +     * Before the TSC scale is set, avoid returning constant 0 (or whatever
> >> +     * this_cpu(cpu_time).stamp.local_stime is set to).  While the returned
> >> +     * value is in no way representing time, it at least increases
> >> +     * monotonically, thus avoiding e.g. waiting loops to degenerate to
> >> +     * entirely infinite ones.
> >> +     */
> >> +    if ( unlikely(!this_cpu(cpu_time).tsc_scale.mul_frac) )
> >> +    {
> >> +        static s_time_t counter;
> > 
> > Not that it matters much, but counter can probably be __initdata?
> 
> I wanted to play safe here: In get_s_time_fixed(), release builds won't
> crash if the assertion wasn't there, but would trigger in a
> corresponding debug build. In that (unexpected) situation, we'd crash
> here (when .init.* was unmapped) if __initdata was used.

That's kind of what I was aiming at: we possibly do want to crash hard
if Xen is still using the fake counter after initialization?  Nothing
good can come out of running guests without the TSC scaling being set,
as the PV clock exposed won't be functional either.  Likely resulting
in guests relying on it also getting stuck because mul_frac == 0?

Thanks, Roger.

