Return-Path: <SRS0=InXR=GK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12630C433DB
	for <xen-devel@archiver.kernel.org>; Thu,  7 Jan 2021 14:35:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCAC222AAA
	for <xen-devel@archiver.kernel.org>; Thu,  7 Jan 2021 14:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCAC222AAA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.62933.111658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxWNd-00060N-S4; Thu, 07 Jan 2021 14:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62933.111658; Thu, 07 Jan 2021 14:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxWNd-00060G-OL; Thu, 07 Jan 2021 14:35:13 +0000
Received: by outflank-mailman (input) for mailman id 62933;
 Thu, 07 Jan 2021 14:35:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kxWNc-00060B-UD
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 14:35:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kxWNc-0002Sd-Pf
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 14:35:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kxWNc-0006kt-Of
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 14:35:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kxWNb-00014I-2c; Thu, 07 Jan 2021 14:35:11 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=aQdFaghgTLhDtp4/NXAV/Vtj2cLcGrvp6Gfg8l/f2pk=; b=1+UO1a8bewiu1Srm16fJ7CFBsz
	vzxF++oF36pBGlberQc6P/aEox31oRstNqzqLMBywA4/ajxyX8xD7y5RlRcgJWYXLcyYSyEP9PBwP
	3cMiReQ+Ug+0aKrQTjTU+c/DXVwZB3q/BbLYN/9D8wmNJJFSsIstCmVfHwLTRU79oSlo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24567.7198.846779.557032@mariner.uk.xensource.com>
Date: Thu, 7 Jan 2021 14:35:10 +0000
To: xen-devel@lists.xenproject.org
CC: committers@xenproject.org
Subject: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Hi.  As the Release Manage for Xen 4.15 I am going to start tracking
the status of features which people are looking to get into Xen 4.15.

NB that the Last Posting Date is just over a week from now.

If you are working on a feature you want in 4.15 please let me know
about it.  Ideally I'd like a little stanza like this:

S: feature name
O: feature owner (proponent) name
E: feature owner (proponent) email address
P: your current estimate of the probability it making 4.15, as a %age

But free-form text is OK too.  Please reply to this mail.

NB the primary responsibility for driving a feature's progress to meet
the release schedule, lies with the feature's proponent(s).

As a reminder, here is the release schedule:

 Friday 15th January    Last posting date

     Patches adding new features should be posted to the mailing list
     by this cate, although perhaps not in their final version.

 Friday 29th January    Feature freeze
  
     Patches adding new features should be committed by this date.
     Straightforward bugfixes may continue to be accepted by
     maintainers.

 Friday 12th February **tentatve**   Code freeze

     Bugfixes only, all changes to be approved by the Release Manager.

 Week of 12th March **tentative**    Release
     (probably Tuesday or Wednesday)

Any patches containing substantial refactoring are to treated as
new features, even if they intent is to fix bugs.

Freeze exceptions will not be routine, but may be granted in
exceptional cases for small changes on the basis of risk assessment.
Large series will not get exceptions.  Contributors *must not* rely on
getting, or expect, a freeze exception.

The codefreeze and release dates are very much provisional and will be
adjusted in the light of apparent code quality etc.

If as a feature proponent you feel your feature is at risk and there
is something the Xen Project could do to help, please consult me or
the Community Manager.  In such situations please reach out earlier
rather than later.

Ian.

