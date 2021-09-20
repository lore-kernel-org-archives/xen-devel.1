Return-Path: <SRS0=T9jm=OK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C749BC433EF
	for <xen-devel@archiver.kernel.org>; Mon, 20 Sep 2021 10:25:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 934546101C
	for <xen-devel@archiver.kernel.org>; Mon, 20 Sep 2021 10:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 934546101C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.190598.340440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGUV-0003rB-Dk; Mon, 20 Sep 2021 10:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190598.340440; Mon, 20 Sep 2021 10:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGUV-0003r4-AT; Mon, 20 Sep 2021 10:25:39 +0000
Received: by outflank-mailman (input) for mailman id 190598;
 Mon, 20 Sep 2021 10:25:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGUU-0003qI-5u
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:25:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGUU-0004Yy-4F
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:25:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGUU-0005d5-2A
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:25:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSGUQ-0005RN-NE; Mon, 20 Sep 2021 11:25:34 +0100
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
	bh=OBBSdiHztldZB/EBdjqdaA/K7bZRaJl+x5djZHDPwrw=; b=lAPoRXKrvPFXtOzKsJbaOgeqcG
	kmIQKF0PPNvdrQXZTvNM9OLwzXXNhF7XG+SW5By7C0sf976rA61mqBV/2PgO6RA3Gm6k5rywuGnf6
	rcPr4kCnJ3YrTnSx9gulyO+urgLqw7Y97uObIPEFgFtG6HUPclICBDk/UR76T3kL8nu4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24904.24990.422751.855186@mariner.uk.xensource.com>
Date: Mon, 20 Sep 2021 11:25:34 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] page-alloc: further adjust assign_page{,s}()
In-Reply-To: <90df9041-4f1f-9911-d64e-f8d7b2a99534@suse.com>
References: <90df9041-4f1f-9911-d64e-f8d7b2a99534@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] page-alloc: further adjust assign_page{,s}()"):
> The on-commit editing of 5260e8fb93f0 ("xen: re-define assign_pages and
> introduce a new function assign_page") didn't go quite far enough: A
> local variable and a function argument also would have wanted adjusting.

This kind of thing is why I really dislike our practice of on-commit
editing.

Ian.

