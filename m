Return-Path: <SRS0=fV0s=IG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F07C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 10:01:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D57C64EB0
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 10:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D57C64EB0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.94762.178437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJChB-0006xo-5I; Mon, 08 Mar 2021 10:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94762.178437; Mon, 08 Mar 2021 10:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJChB-0006xg-20; Mon, 08 Mar 2021 10:01:01 +0000
Received: by outflank-mailman (input) for mailman id 94762;
 Mon, 08 Mar 2021 10:01:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJChA-0006xL-4M
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 10:01:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJChA-0001Jh-2Z
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 10:01:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJChA-0003aI-1c
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 10:01:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJCh6-00084b-Rn; Mon, 08 Mar 2021 10:00:56 +0000
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
	bh=shga8WJTVY4hizujX61kvSw0TK7deinpbnpxBhVRXEY=; b=FQy+1eiHOjuW8OmQpyo4idXuqL
	dHiPwmc98DQXfGRXxPSohQyMDFPT7sGRssqSLb5d/TXyog8V229BI0Id1XwAXX8qVSFY5HMNVCAvu
	zznUWKHEsG77lKXEbZyWL8NIz3mdSyy+eps1aSHY/XmhvIuX6+CGVFr/4s2fL/KCblkM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24645.62936.623189.553418@mariner.uk.xensource.com>
Date: Mon, 8 Mar 2021 10:00:56 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] tools/x86: move arch-specific include/xen/ population
 into arch-specific rule
In-Reply-To: <0702c375-4769-7246-ba47-613ed69330e1@suse.com>
References: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
	<0702c375-4769-7246-ba47-613ed69330e1@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 2/2] tools/x86: move arch-specific include/xen/ population into arch-specific rule"):
> There's no need for the common "xen-dir" rule to have an arch-specific
> part when there already is a arch-specific rule where this can be taken
> care of.

I think the symlinks being made in this arch-specific code are more
logically part of the xen-dir target than part of the all target.

> I was tempted to also uniformly change the pattern from *autogen.h to
> *-autogen.h right here - thoughts?

I haven't read this in enough detail to know whether that's right, but
if it is right it is IMO preferable.

Thanks,
Ian.

