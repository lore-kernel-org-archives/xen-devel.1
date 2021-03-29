Return-Path: <SRS0=2Bwx=I3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4086C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 17:02:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E57861932
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 17:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E57861932
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103199.196913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQvGx-0004h2-Rw; Mon, 29 Mar 2021 17:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103199.196913; Mon, 29 Mar 2021 17:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQvGx-0004gv-O2; Mon, 29 Mar 2021 17:01:51 +0000
Received: by outflank-mailman (input) for mailman id 103199;
 Mon, 29 Mar 2021 17:01:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQvGw-0004gq-IQ
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 17:01:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQvGw-0001tM-Fu
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 17:01:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQvGw-0005pb-DZ
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 17:01:50 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lQvGt-0002H8-1j; Mon, 29 Mar 2021 18:01:47 +0100
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
	bh=OVeCx8d/V1Biykhz6y226kqByFODYfqiEyLhC5ivNvY=; b=KxZ2b7Ng+DevD0iEQLDjJWYCMn
	6fTBsHrmO0cgmXyvz/y1RchvX/Qqnjn5KFQxkNFONh8+R0uoeMRgncEWG7pcO6x1G1UskwFUNowrm
	ExKq6PSN+mmyk0aJP0LC9z97KUFvP44bn30/ik+iDmRRhzsAJrfmHu2KbRsYJKz7YX5U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24674.2042.737729.423760@mariner.uk.xensource.com>
Date: Mon, 29 Mar 2021 18:01:46 +0100
To: George Dunlap <george.dunlap@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd compression support
In-Reply-To: <20210329161457.345360-3-george.dunlap@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
	<20210329161457.345360-3-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

George Dunlap writes ("[PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd compression support"):
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

