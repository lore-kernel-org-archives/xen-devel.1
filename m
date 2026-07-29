Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5401FC53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 08:46:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375328.1622503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wozvx-0006Bz-9j; Wed, 29 Jul 2026 08:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375328.1622503; Wed, 29 Jul 2026 08:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wozvx-0006Bs-6D; Wed, 29 Jul 2026 08:46:37 +0000
Received: by outflank-mailman (input) for mailman id 1375328;
 Wed, 29 Jul 2026 08:46:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wozvw-0006Bm-70
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 08:46:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wozvv-00F9cl-0O;
 Wed, 29 Jul 2026 08:46:34 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wozvu-000bQd-1H;
 Wed, 29 Jul 2026 08:46:34 +0000
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
	bh=nj+et3OSGGYAFRA0r1IUrdBkqK6BMB3wCbLI+mum6us=; b=1nX5rjakvJdXOX8jE95eaxzSav
	Emj8RkyRJ4uA8SoxkzOOMmYn72x1Jpxr8f3Eji5hp5AMsamep7SB51VHntqWmGzS9ODF7KAyw1XlP
	iehYIJA0JW3TvWCk+7WO5GwfKsefSpCYmD+S1e6uqMAvYQRO8Ppop2yvYgVcz0wbliVM=;
Date: Wed, 29 Jul 2026 10:46:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 1/3] time: add "NOW() good" indicator
Message-ID: <amm95OSsZ-qfdypo@macbook.local>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
 <amhlnWAwF-AS_sH7@macbook.local>
 <baddc2f7-deab-4727-a688-a6fe30f7fb89@suse.com>
 <amiFV3IWZUoaT57V@macbook.local>
 <fff1460b-7ec7-44f0-9772-35fb5bc87cb9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fff1460b-7ec7-44f0-9772-35fb5bc87cb9@suse.com>

On Tue, Jul 28, 2026 at 01:37:15PM +0200, Jan Beulich wrote:
> On 28.07.2026 12:32, Roger Pau Monné wrote:
> > On Tue, Jul 28, 2026 at 10:24:38AM +0200, Jan Beulich wrote:
> >> On 28.07.2026 10:17, Roger Pau Monné wrote:
> >>> On Tue, Jun 30, 2026 at 04:06:00PM +0200, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/time.c
> >>>> +++ b/xen/arch/x86/time.c
> >>>> @@ -2660,6 +2660,7 @@ void __init early_time_init(void)
> >>>>  
> >>>>      set_time_scale(&t->tsc_scale, tmp);
> >>>>      t->stamp.local_tsc = boot_tsc_stamp;
> >>>> +    NOW_good = true;
> >>>
> >>> Would you need a barrier here to ensure compiler doesn't re-order the
> >>> writes?  Maybe using ACCESS_ONCE(), or a smp_wmb() like it's used in
> >>> other arches?
> >>
> >> Aiui it isn't needed here. The compiler can't re-order the two writes,
> >> due to our use of -fno-strict-aliasing. The barrier is there on other
> >> arch-es to avoid re-ordering in hardware.
> > 
> > You are the expert in compilers, but it was my understanding that
> > `no-strict-aliasing` only affects the ordering of pointers accesses,
> > but not plain variables.  IOW: NOW_good accesses could be reordered
> > because it's not a pointer.  Does the compiler consider t can point to
> > &NOW_good and hence it can't be reordered?
> 
> Yes, that's my understanding of how this work. (Yet no, "expert" surely
> is going too far.) Things would be different if NOW_good was a function-
> local variable, I think.

OK, I wouldn't mind adding a compiler barrier to say on the safe side,
but I also won't object if you think that's enough.

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

