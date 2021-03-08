Return-Path: <SRS0=fV0s=IG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41740C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 09:49:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0538C651B9
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 09:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0538C651B9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.94743.178389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCWM-0004rO-A9; Mon, 08 Mar 2021 09:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94743.178389; Mon, 08 Mar 2021 09:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCWM-0004rF-6t; Mon, 08 Mar 2021 09:49:50 +0000
Received: by outflank-mailman (input) for mailman id 94743;
 Mon, 08 Mar 2021 09:49:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCWL-0004qv-Ar
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:49:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCWL-00011S-80
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:49:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCWL-0002aO-6z
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:49:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJCWH-000802-VS; Mon, 08 Mar 2021 09:49:46 +0000
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
	bh=PIRSPx7YkhOyrvCXOyzWue5jBQjQwXNmphb8ajewQmE=; b=xA59tDrgRND25cAbQ5yUHBckMW
	+RafSso2dNKA1xfFxLGI2FstQpS0fKPIOvie4B0qMsGEQlnLouwedFCDfS21TGkBxbzAL+5X6VsOk
	eMuQLc22HUrJwIOdYBvocLP9Cl4TGCEH2ibMiAHTqyuYm/7PjJkWbU1ygmvU1o4Wu8es=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24645.62265.765339.521102@mariner.uk.xensource.com>
Date: Mon, 8 Mar 2021 09:49:45 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported to 4.9 (5.1 on arm64)
In-Reply-To: <20210306214148.27021-1-julien@xen.org>
References: <20210306214148.27021-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] xen: Bump the minimum version of GCC supported to 4.9 (5.1 on arm64)"):
> From: Julien Grall <jgrall@amazon.com>
> 
> Compilers older than 4.8 have known codegen issues which can lead to
> silent miscompilation:
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
> 
> Furthermore, pre-4.9 GCC have known bugs (including things like
> internal compiler errors on Arm) which would require workaround (I
> haven't checked if we have any in Xen).
> 
> The minimum version of GCC to build the hypervisor is now raised to 4.9.
> 
> In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
> shown to emit memory references beyond the stack pointer, resulting in
> memory corruption if an interrupt is taken after the stack pointer has
> been adjusted but before the reference has been executed.
> 
> Therefore, the minimum for arm64 is raised to 5.1.

How sad.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I don't currently have an opinion about the merits of this change.
I'm hoping that the disagreement can be resolved without me having to
have one :-).

Thanks,
Ian.

