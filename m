Return-Path: <SRS0=xlmN=JF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2BEC433ED
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 16:11:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71173610F8
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 16:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71173610F8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.107470.205434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUXFN-0004LO-Mk; Thu, 08 Apr 2021 16:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107470.205434; Thu, 08 Apr 2021 16:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUXFN-0004LH-Jc; Thu, 08 Apr 2021 16:11:09 +0000
Received: by outflank-mailman (input) for mailman id 107470;
 Thu, 08 Apr 2021 16:11:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUXFM-0004LB-Fp
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 16:11:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUXFM-0007Rm-6M
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 16:11:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUXFM-0006Zq-51
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 16:11:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lUXFJ-0008DF-1U; Thu, 08 Apr 2021 17:11:05 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:From:
	Date:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version;
	bh=p8hvqvfT0CllenG6VvoUXfHUObaVmy00s0xutxtDa+s=; b=3gF/2wwnvxZEEUlqlX8GVIxsbg
	mRevahZrTjs9qv2m9TQEu3m8SQiJHYOKtz0kuJiYPFbW+RglV/dd1+xOr6voBGvKYHgDtRmJyL7vi
	1KA7XXAjGMrTQ3FMiQQp4MxeU6n5CCXt6XPCFIcqv5iVYlp0YpuqOYr5AUqX4lqV+fdM=;
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24687.11032.872713.894725@mariner.uk.xensource.com>
Date: Thu, 8 Apr 2021 17:11:04 +0100
From: Ian Jackson <iwj@xenproject.org>
To: committers@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: Re: Commit moratorium on staging-4.15
In-Reply-To: <24684.14467.302145.214064@mariner.uk.xensource.com>
References: <24684.14467.302145.214064@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Commit moratorium on staging-4.15"):
> The Xen 4.15 branch is now closed for release preparation work.
> Nothing more should be pushed without my specific permission.

Hi.  Xen 4.15 is now officially released.

The Xen-next (staging) branch is now completely open for every kind of
change, subject to the usual development rules.

Please hold off pushing to staging-4.15 until advised.  I need to
do post-release updates do the version number and README and so on.  I
plan to do that on Monday.

Ian.

