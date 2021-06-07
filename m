Return-Path: <SRS0=/Cwe=LB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB037C47082
	for <xen-devel@archiver.kernel.org>; Mon,  7 Jun 2021 14:49:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB66610E5
	for <xen-devel@archiver.kernel.org>; Mon,  7 Jun 2021 14:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB66610E5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.138012.255585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGZB-0000m7-MA; Mon, 07 Jun 2021 14:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138012.255585; Mon, 07 Jun 2021 14:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGZB-0000m0-JB; Mon, 07 Jun 2021 14:49:25 +0000
Received: by outflank-mailman (input) for mailman id 138012;
 Mon, 07 Jun 2021 14:49:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqGZA-0000ls-12
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 14:49:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqGZ9-00025w-Vj
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 14:49:23 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqGZ9-00081P-Ue
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 14:49:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lqGZ8-0000dE-91; Mon, 07 Jun 2021 15:49:22 +0100
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
	bh=J3UAMDh0d7kXRCpgxD6vYaEbDtmNtduzvuumbEcsPW4=; b=h8n+fHCYd2xVc8zZUKrN6Ikz6e
	zMi3Q25ETKCmI0psNcNg7TQ0ssRi3PFPODj1527SNT9zAioIYSlGNWoHeCLNlzFpVzaLh9V3WOA94
	CysHzmxVE4OwPzSlYg3Y+ITG2LjmVJY5Ab7BpoWZnbhpQl2WaHulGCom22awo0ZXwhk8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24766.12786.57771.145539@mariner.uk.xensource.com>
Date: Mon, 7 Jun 2021 15:49:22 +0100
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [ovmf test] 162371: tolerable FAIL - PUSHED
Newsgroups: chiark.users.ijackson.xen.cron.osstest
In-Reply-To: <osstest-162371-mainreport@xen.org>
References: <osstest-162371-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

osstest service owner writes ("[ovmf test] 162371: tolerable FAIL - PUSHED"):
> flight 162371 ovmf real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/162371/
> 
> Failures :-/ but no regressions.
> 
> Tests which did not succeed, but are not blocking:
>  test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail starved in 162368
>  test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail starved in 162368
> 
> version targeted for testing:
>  ovmf                 51adb689e1db695cffdeeacafad218768fbc018c
> baseline version:
>  ovmf                 924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0

This was unfortunate.  I am working on fixing it so this won't happen
again.  Anthony tells me that this is due to a regression (from our
pov) in upgream ovmf which will probaby break everything.  So I have
rewound the main xenbits ovmf.git "xen-tested-master" branch back to
c410ad4da4b7785170d3d42a3ba190c2caac6feb.

When I have fixed it so this won't happen again I will restart the
ovmf flights.

Ian.

