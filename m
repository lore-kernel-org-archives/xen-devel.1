Return-Path: <SRS0=cgBe=OM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CD1C433F5
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 12:30:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3A4060EE2
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 12:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3A4060EE2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.192700.343273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1Nw-0007q5-I5; Wed, 22 Sep 2021 12:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192700.343273; Wed, 22 Sep 2021 12:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1Nw-0007py-F3; Wed, 22 Sep 2021 12:30:00 +0000
Received: by outflank-mailman (input) for mailman id 192700;
 Wed, 22 Sep 2021 12:30:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mT1Nv-0007ps-VA
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:29:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mT1Nv-0006y1-R7
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:29:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mT1Nv-0003f2-Q9
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:29:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mT1Nq-0003Im-Ou; Wed, 22 Sep 2021 13:29:54 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=uGnkq96b/xxN88TzuE7mpG5VNU1uPgMonjr6E+affzY=; b=gYwimMKqY3XxlLfsIrRiSYJjjb
	OMbWJf/xtiFNSdad+WONYaRlqr3+r+mOUc6y7sZt9MQoNRIi3mldbEI2xs2vc9zwRUUG3eD4nbOxs
	C6TreHk3EgkUNBDHv19zp12Kg97hOA+pxJNCMfA967qNOK8nUKrD+PR5eGfbb0vr94nA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24907.8642.479155.35952@mariner.uk.xensource.com>
Date: Wed, 22 Sep 2021 13:29:54 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel@lists.xenproject.org,
    dpsmith@apertussolutions.com
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
In-Reply-To: <952a9c35-39bb-d229-0bb9-a1f4e893b61a@suse.com>
References: <osstest-164996-mainreport@xen.org>
	<d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
	<24904.44119.940679.241639@mariner.uk.xensource.com>
	<alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
	<19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
	<24907.4491.895219.37845@mariner.uk.xensource.com>
	<952a9c35-39bb-d229-0bb9-a1f4e893b61a@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
> Is the Dom0 kernel used here a distro one or our own build of one of
> the upstream trees? In the latter case I'd expect propagation to be
> quite a bit faster than in the former case.

It's our own build.

> >  But I'm loathe to make this change
> > because it seems to me that it would be simply masking the bug.
> > 
> > Notably, when this goes wrong, it seems to happen after the guest has
> > been started once successfully already.  So there *is* enough
> > memory...
> 
> Well, there is enough memory, sure, but (transiently as it seems) not
> enough contiguous chunks. The likelihood of higher order allocations
> failing increases with smaller overall memory amounts (in Dom0 in this
> case), afaict, unless there's (aggressive) de-fragmentation.

Indeed.

I'm not sure, though, that I fully understand the design principles
behind non-order-0 allocations, and memory sizing, and so on.  Your
earlier mail suggeted there may not be a design principle, and that
anything relying on non-order-0 atomic allocations is only working by
luck (or an embarassing excess of ram).

Ian.

