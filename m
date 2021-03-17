Return-Path: <SRS0=alo8=IP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8E8C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 13:38:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EDB264F4F
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 13:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EDB264F4F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98701.187355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMWN3-0006st-Ai; Wed, 17 Mar 2021 13:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98701.187355; Wed, 17 Mar 2021 13:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMWN3-0006sm-5t; Wed, 17 Mar 2021 13:37:57 +0000
Received: by outflank-mailman (input) for mailman id 98701;
 Wed, 17 Mar 2021 13:37:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMWN1-0006sh-6R
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 13:37:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMWN1-0006vv-3Y
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 13:37:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMWN1-0000Rh-1O
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 13:37:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lMWMx-000219-Sg; Wed, 17 Mar 2021 13:37:51 +0000
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
	bh=BdLNvDW7OyxARwrysB3soG4zVUGjI42P1eAMoZYCUTM=; b=Acjh+u1oXFU7AgB6n2TIDGgJGb
	CdRV+juMMF6p4d1ahpQwjQ2ZIZI+Ztw+GHNpoX/lcexipLIjxGSd9F531WFwn9e4dlxOi7ArAvEnz
	wxg8X//c9iOCcP4sUZO/oN2+WIDlWHB+c7qkhrtdLq1ktvwIc+YDjxgfIDnrY2yl5dII=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24658.1583.601613.903527@mariner.uk.xensource.com>
Date: Wed, 17 Mar 2021 13:37:51 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>,
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in guest_{rd,wr}msr()"
In-Reply-To: <20210316161844.1658-2-andrew.cooper3@citrix.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
	<20210316161844.1658-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I have read this thread and with my release manager hat on I feel
confused and/or ignorant.

Patch 3/ has a good explanation of what the problem is it is
addressing and why this is important for 4.15.  But then there is
Jan's most recent reply starting "I find all of this confusing".  Jan,
can you please tell me in words of one syllable what the implication
of that message is ?  In particular is any of what you say a reason
for me to withhold my release-ack ?

AFAICT there is no explanation for why patches 1/ and 2/ deserve to go
into 4.15.  We are late in the freeze now, so I would ideally be
looking for a clear and compelling argument.  I'd also like to
understand what the risks are of taking these.  Can someone please
enlighten me ?

Thanks,
Ian.

