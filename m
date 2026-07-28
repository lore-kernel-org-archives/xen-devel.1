Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD12C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 10:33:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372341.1619698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wof7Q-00050O-W2; Tue, 28 Jul 2026 10:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372341.1619698; Tue, 28 Jul 2026 10:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wof7Q-00050G-R1; Tue, 28 Jul 2026 10:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1372341;
 Tue, 28 Jul 2026 10:33:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wof7Q-00050A-93
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 10:33:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wof7P-00DN1y-0U;
 Tue, 28 Jul 2026 10:33:02 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wof7O-002qNT-1G;
 Tue, 28 Jul 2026 10:33:02 +0000
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
	bh=nB6PbQuKdL6MHngmzjaHTKph6NSfX5lmALrRKO4lcmw=; b=2V4MXmJrzw2FFBQ7aunk3Ro9JU
	B0D7YtqBjnNTX7j9tfUxHjOPBKDps/eaXCwjGCElL1R/87doqLTFhwLmvpFE28cOrq2uLYlouOoqn
	ucdWQA7yNUwBCgV4CqrFDlhZI5ka+CKQlk+W9bax6cf6BfCh1scK2H2eCI8PAgqhQfKk=;
Date: Tue, 28 Jul 2026 12:32:55 +0200
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
Message-ID: <amiFV3IWZUoaT57V@macbook.local>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
 <amhlnWAwF-AS_sH7@macbook.local>
 <baddc2f7-deab-4727-a688-a6fe30f7fb89@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baddc2f7-deab-4727-a688-a6fe30f7fb89@suse.com>

On Tue, Jul 28, 2026 at 10:24:38AM +0200, Jan Beulich wrote:
> On 28.07.2026 10:17, Roger Pau Monné wrote:
> > On Tue, Jun 30, 2026 at 04:06:00PM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/time.c
> >> +++ b/xen/arch/x86/time.c
> >> @@ -2660,6 +2660,7 @@ void __init early_time_init(void)
> >>  
> >>      set_time_scale(&t->tsc_scale, tmp);
> >>      t->stamp.local_tsc = boot_tsc_stamp;
> >> +    NOW_good = true;
> > 
> > Would you need a barrier here to ensure compiler doesn't re-order the
> > writes?  Maybe using ACCESS_ONCE(), or a smp_wmb() like it's used in
> > other arches?
> 
> Aiui it isn't needed here. The compiler can't re-order the two writes,
> due to our use of -fno-strict-aliasing. The barrier is there on other
> arch-es to avoid re-ordering in hardware.

You are the expert in compilers, but it was my understanding that
`no-strict-aliasing` only affects the ordering of pointers accesses,
but not plain variables.  IOW: NOW_good accesses could be reordered
because it's not a pointer.  Does the compiler consider t can point to
&NOW_good and hence it can't be reordered?

Thanks, Roger.

