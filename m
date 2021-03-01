Return-Path: <SRS0=TTqk=H7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AA4C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 17:40:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C5E064F70
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 17:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C5E064F70
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.91864.173399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmWe-00036q-ND; Mon, 01 Mar 2021 17:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91864.173399; Mon, 01 Mar 2021 17:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmWe-00036J-JY; Mon, 01 Mar 2021 17:40:08 +0000
Received: by outflank-mailman (input) for mailman id 91864;
 Mon, 01 Mar 2021 17:40:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmWd-00034T-52
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:40:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmWd-0005KQ-45
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:40:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmWd-0004i6-1h
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:40:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmWZ-00056i-NK; Mon, 01 Mar 2021 17:40:03 +0000
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
	bh=qgtapO+c1+Y+53b3XfTDDeXeOJrFPIfE+5uS3cFh9nc=; b=gDBk02pQWy4sCyVyOMAorgiom4
	AlSqNdYKuxIT1e+cOb1/rdlbobmTdlE6VVTEwsG4uvO3jpSs+fdx4Cq/gI+S1DzrLqPvT+7e+cs70
	tdSkt8asYdhnCFlQYqgntTpvs9yhRJndW6jsvTe/XcFl+3ON4QFLg82h1rztRe0kp1Mo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.9971.519283.948123@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:40:03 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15] tools/xenstored: Avoid dereferencing a NULL pointer if LiveUpdate is failing
In-Reply-To: <20210226182655.2499-1-julien@xen.org>
References: <20210226182655.2499-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] tools/xenstored: Avoid dereferencing a NULL pointer if LiveUpdate is failing"):
> From: Julien Grall <jgrall@amazon.com>
> 
> In case of failure in do_lu_start(), XenStored will first free lu_start
> and then try to dereference it.
> 
> This will result to a NULL dereference as the destruction callback will
> set lu_start to NULL.
> 
> The crash can be avoided by freeing lu_start *after* the reply has been
> set.
> 
> Fixes: af216a99fb4a ("tools/xenstore: add the basic framework for doing the live update")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>


