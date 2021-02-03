Return-Path: <SRS0=08Yz=HF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F57EC433DB
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:51:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71D164E30
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D71D164E30
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81016.148902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MJD-0002w4-Hh; Wed, 03 Feb 2021 17:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81016.148902; Wed, 03 Feb 2021 17:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MJD-0002vx-Ee; Wed, 03 Feb 2021 17:51:19 +0000
Received: by outflank-mailman (input) for mailman id 81016;
 Wed, 03 Feb 2021 17:51:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7MJB-0002vr-SJ
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:51:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7MJB-0005Gk-R9
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:51:17 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7MJB-0002FE-Pz
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:51:17 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7MJ8-0005et-JZ; Wed, 03 Feb 2021 17:51:14 +0000
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
	bh=f1PPwg52iFe6CeB8p0HVZUd00ZOwwpd/rT0J5pYLUfc=; b=Nq/PQ0jyy27xFFtiN+exz2YkYl
	tsu5gGOUGpOC0uu3GO527YZOrJy4QhSDEqaCtPcHFAaOCmtmcWSNpIqUVqq2lRfUx/am0ALgoDv/E
	NdMbp6LdqLOajO79iOACaed6o/l4nvuSVYiS2wK2yTL15evqsQrUR97zBJ2CuJvB2eX0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24602.58002.389945.787614@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:51:14 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Manuel Bouyer <bouyer@netbsd.org>
Subject: Re: [PATCH for-4.15 2/2] libs/foreignmem: Fix/simplify errno handling for map_resource
In-Reply-To: <20210203163750.7564-2-andrew.cooper3@citrix.com>
References: <20210203163750.7564-1-andrew.cooper3@citrix.com>
	<20210203163750.7564-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15 2/2] libs/foreignmem: Fix/simplify errno handling for map_resource"):
> Simplify the FreeBSD logic, and duplicate it for NetBSD as the userpace ABI
> appears to be to consistently provide EOPNOTSUPP for missing Xen/Kernel
> support.
> 
> The Linux logic was contorted in what appears to be a deliberate attempt to
> skip the now-deleted logic for the EOPNOTSUPP case.  Simplify it.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Sorry for my earlier confusion.  I had lost the context between the
two patches.  I will explain my reasoning for the R-A:

For the first two hunks (freebsd.c): these are consequential cleanup
from patch 1/2 of this series.  Splitting this up made this easier to
review and we don't want to leave the rather unfortunate constructs
which arise from some hunks of 1/1.  IOW, the combination of 1/1 plus
the first two hunks here is definitely release-worthy and the split
has helped review.

The final hunk is a straightforward bugfix.

This combination of two completely different kinds of thing is a bit
confusing but now that I have explained it to myself I'm satisfied.

Ian.

