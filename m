Return-Path: <SRS0=ZtLg=IN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E5DC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 12:05:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A43364E90
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 12:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A43364E90
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97977.185764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLlyN-000436-MN; Mon, 15 Mar 2021 12:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97977.185764; Mon, 15 Mar 2021 12:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLlyN-00042z-JO; Mon, 15 Mar 2021 12:05:23 +0000
Received: by outflank-mailman (input) for mailman id 97977;
 Mon, 15 Mar 2021 12:05:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLlyM-00042p-Ee
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:05:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLlyM-0007OL-CB
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:05:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLlyM-00064C-9p
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:05:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lLlyJ-0004mW-50; Mon, 15 Mar 2021 12:05:19 +0000
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
	bh=5C6YHNb9mKMR9zGcpSuojSreFEYHt4Tjj7d+u737k3Q=; b=wpTj24yCWA5mmBBFqmrH+2YllC
	Mt+o3xuP5xUchgqN24x/025ft/CdQIGzncb9aCE5h9LrGuVSijiqns3JWZwRnWjDN1l/Q5omFN9TE
	DEfmDwSXLcGLmGiqueDSj02mIkgrEpE8KlGb59oO6dDnnoSIz00mXf7HejlkO7U+6iVs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24655.19838.973233.143341@mariner.uk.xensource.com>
Date: Mon, 15 Mar 2021 12:05:18 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    bertrand.marquis@arm.com,
    volodymyr_babchuk@epam.com,
    Julien Grall <jgrall@amazon.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15 v2] xen: Bump the minimum version of GCC supported to 4.9 for arm32 and 5.1 on arm64
In-Reply-To: <20210313134158.24363-1-julien@xen.org>
References: <20210313134158.24363-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15 v2] xen: Bump the minimum version of GCC supported to 4.9 for arm32 and 5.1 on arm64"):
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
> The minimum version of GCC to build the hypervisor on arm is now
> raised to 4.9.
> 
> In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
> shown to emit memory references beyond the stack pointer, resulting in
> memory corruption if an interrupt is taken after the stack pointer has
> been adjusted but before the reference has been executed.
> 
> Therefore, the minimum for arm64 is raised to 5.1.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>


