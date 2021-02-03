Return-Path: <SRS0=08Yz=HF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C37BC433E0
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:17:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2DB64F8C
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC2DB64F8C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80980.148710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Llv-0005lp-Kl; Wed, 03 Feb 2021 17:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80980.148710; Wed, 03 Feb 2021 17:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Llv-0005li-Gs; Wed, 03 Feb 2021 17:16:55 +0000
Received: by outflank-mailman (input) for mailman id 80980;
 Wed, 03 Feb 2021 17:16:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7Llt-0005lb-SB
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:16:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7Llt-0004dj-PB
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:16:53 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7Llt-0008OR-O1
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:16:53 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7Llq-0005XX-EB; Wed, 03 Feb 2021 17:16:50 +0000
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
	bh=W+T1v1TOuUdK1kF5e2BVX7zV5OzlU3rVeTz1+HvQYAs=; b=lOfF2bFtZmPtXpdr4gMaSapYRp
	35diEc0bam5AO3eYIs9dy2QKFfv+hyoGJczYVOqujjd5XorR0rbXxPNtC4uWBnWvbSmgo4g+ovLkU
	quB/6KUychceeU0vgjpGqBQy3wXwB0yvIRiMjxsdKbwDUyQxQ3RVy9JBUmOFQCFrDdL0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24602.55938.208939.124502@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:16:50 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Manuel Bouyer <bouyer@netbsd.org>
Subject: Re: [PATCH for-4.15 1/2] libs/foreignmem: Drop useless and/or misleading logging
In-Reply-To: <20210203163750.7564-1-andrew.cooper3@citrix.com>
References: <20210203163750.7564-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15 1/2] libs/foreignmem: Drop useless and/or misleading logging"):
> These log lines are all in response to single system calls, and do not provide
> any information which the immediate caller can't determine themselves.  It is
> however exceedinly rude to put junk like this onto stderr, especially as
> system call failures are not even error conditions in certain circumstances.
> 
> The FreeBSD logging has stale function names in, and solaris shouldn't have
> passed code review to start with.
> 
> No functional change.

Thanks.

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

>          int saved_errno = errno;
> -        PERROR("XXXXXXXX");
> +

That's particularly wtf...

Ian.

