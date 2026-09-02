Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06A7C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:18:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405407.1638902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1h6L-0004Yb-42; Wed, 02 Sep 2026 09:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405407.1638902; Wed, 02 Sep 2026 09:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1h6L-0004YS-0C; Wed, 02 Sep 2026 09:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1405407;
 Wed, 02 Sep 2026 09:17:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x1h6J-0004YJ-64
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:17:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1h6J-001pdA-0X;
 Wed, 02 Sep 2026 09:17:46 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1h6I-007RMY-1l;
 Wed, 02 Sep 2026 09:17:46 +0000
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
	bh=lwX/OAtwnMJIo6cz8sHcIxIiEPCHKIsjDQsdlGOkZ3U=; b=pkstVnK54Ib+ArwAKJbvDzER5x
	HPDQ4gOtnCwo8dFneZre2uW0poO24IcWW2ieyoa7YgqoIRM3doXP91Fy/D5bfOLfN5S2j7zeL57Cs
	1wWAKbfiZFFT8GfYYlkMUcbMSJkxgA9O7+E7YAQCvpxizEqIm0iu3oJCO9B53ZQmYzC4=;
Date: Wed, 2 Sep 2026 11:17:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/4] x86/time: CMOS RTC may run in binary mode
Message-ID: <apfpsDOuYZ4RGyhW@macbook.local>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
 <5945d8f4-aece-4572-8e89-60408dd7ac32@suse.com>
 <ami73Z1LlnWwcDy5@macbook.local>
 <apfYcf9zYIsEo0tk@macbook.local>
 <6dd4c596-aebd-4488-94da-35fb9d85d6ac@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dd4c596-aebd-4488-94da-35fb9d85d6ac@suse.com>

On Wed, Sep 02, 2026 at 11:02:43AM +0200, Jan Beulich wrote:
> On 02.09.2026 10:04, Roger Pau Monné wrote:
> > On Thu, Jul 02, 2026 at 11:29:11AM +0200, Jan Beulich wrote:
> >> --- a/docs/misc/xen-command-line.pandoc
> >> +++ b/docs/misc/xen-command-line.pandoc
> >> @@ -339,6 +339,14 @@ parameter to "stable:socket".
> >>  Specify the event count threshold for raising Corrected Machine Check
> >>  Interrupts.  Specifying zero disables CMCI handling.
> >>  
> >> +### cmos-rtc-bcd (x86)
> >> +> `= <boolean>`
> >> +
> >> +> Default: `false`
> >> +
> >> +Flag to indicate the CMOS Real Time Clock uses BCD mode irrespective of
> >> +control register B indicating binary mode.
> >> +
> > 
> > Likely too late for it now, but I get the feeling we should have
> > introduced a cmos option, with rtc-bcd and rtc-probe as boolean sub
> > options:
> > 
> > cmos = [ rtc-probe, rtc-bcd ]
> 
> I was thinking the same - would be nice, but here we are.
> 
> >> @@ -1353,6 +1356,48 @@ static bool __init cmos_rtc_probe(void)
> >>      return false;
> >>  }
> >>  
> >> +static inline bool __init attr_const is_bcd(unsigned int x)
> >> +{
> >> +    return (x & 0xf) < 10 && (x >> 4) < 10;
> >> +}
> >> +
> >> +static void __init cmos_rtc_probe_bcd(void)
> >> +{
> >> +    bool bcd;
> >> +    unsigned long flags;
> >> +
> >> +    if ( opt_cmos_rtc_bcd )
> >> +        return;
> >> +
> >> +    spin_lock_irqsave(&rtc_lock, flags);
> >> +    bcd = !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY);
> >> +    spin_unlock_irqrestore(&rtc_lock, flags);
> >> +
> >> +    if ( bcd )
> >> +        return;
> >> +
> >> +    for ( unsigned int seclo = 0; ; )
> >> +    {
> >> +        struct rtc_time rtc;
> >> +
> >> +        if ( !__get_cmos_time(&rtc) ||
> >> +             !is_bcd(rtc.sec) ||
> >> +             !is_bcd(rtc.min) ||
> >> +             !is_bcd(rtc.hour) ||
> >> +             !is_bcd(rtc.day) ||
> >> +             !is_bcd(rtc.mon) )
> >> +            return;
> >> +
> >> +        if ( seclo > (rtc.sec & 0xf) )
> >> +            break;
> >> +
> >> +        seclo = rtc.sec & 0xf;
> > 
> > Is there a risk of this loop triggering the watchdog, and hence we
> > should process softirqs in the loop? (or otherwise have some kind of
> > hard loop stop after certain iterations / time)
> > 
> > Oh, I now see the mention in the commit message and also note this is
> > done ahead of SMP and also ahead of the watchdog being enabled, hence
> > it can't trigger the watchdog.
> 
> Right. I can't conclude whether you're asking for any change here, as
> there also was no ack.

Hehe, I guess I was probing whether you wanted to do anything about
the proliferation of cmos related top-level options.

Acked-by: Roger Pau Monné <roger@xenproject.org>

Albeit I think it would be nice to introduce a common cmos option in a
future patch and deprecate the separate top-level ones.

Thanks, Roger.

