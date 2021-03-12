Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F91C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 16:59:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 906E364FDC
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 16:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 906E364FDC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97248.184670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKl8D-0001XZ-1I; Fri, 12 Mar 2021 16:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97248.184670; Fri, 12 Mar 2021 16:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKl8C-0001XS-TU; Fri, 12 Mar 2021 16:59:20 +0000
Received: by outflank-mailman (input) for mailman id 97248;
 Fri, 12 Mar 2021 16:59:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKl8B-0001XN-QC
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:59:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKl8B-0004LM-Hq
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:59:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKl8B-0006wU-GG
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:59:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKl88-0004Tu-9l; Fri, 12 Mar 2021 16:59:16 +0000
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
	bh=zfWf9oJrhq8D+nMBn/uBLGq6NkCmljSjEJDoEmNPBQk=; b=ss5UKMk6i3jqHMwQQEYgcUIhH4
	FAO318YZ6SznpCluCfp5XbLhmMI25jTqwRR6jCXF4pfTrHdFmnRTx1JqzqnQCPMZnI2l50WdA4JeE
	sUldQLn4eWnoCfEXszldQFJIsqP2PySjgUO1D33YpJPgLVaZG7wIu64f/k6Oh3FnIIp4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24651.40420.34409.269589@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 16:59:16 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3][4.15] tools/x86: don't rebuild cpuid-autogen.h every time
In-Reply-To: <96ad6d6e-84f0-89dd-f7b1-1e1ddc2183fd@suse.com>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
	<96ad6d6e-84f0-89dd-f7b1-1e1ddc2183fd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v3][4.15] tools/x86: don't rebuild cpuid-autogen.h every time"):
> The first thing the "xen-dir" rule does is delete the entire xen/
> subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
> result there's no original version for $(move-if-changed ...) to compare
> against, and hence the file and all its consumers would get rebuilt
> every time. Instead only find and delete all the symlinks.
> 
> Fixes: eddf9559c977 ("libx86: generate cpuid-autogen.h in the libx86 include dir")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Ian Jackson <iwj@xenproject.org>

Thanks!

