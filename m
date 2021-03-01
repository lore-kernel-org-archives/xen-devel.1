Return-Path: <SRS0=TTqk=H7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FC7C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 16:11:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A814764DE5
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 16:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A814764DE5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.91767.173093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGl8q-0000Kk-Q3; Mon, 01 Mar 2021 16:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91767.173093; Mon, 01 Mar 2021 16:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGl8q-0000Kd-Mw; Mon, 01 Mar 2021 16:11:28 +0000
Received: by outflank-mailman (input) for mailman id 91767;
 Mon, 01 Mar 2021 16:11:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGl8p-0000KY-TI
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:11:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGl8p-0003jE-NA
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:11:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGl8p-0001Wv-Hh
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:11:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGl8m-0004nA-B1; Mon, 01 Mar 2021 16:11:24 +0000
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
	bh=rGta2sxNDj7OM2vE/hx8i1toDGEBo3TyFpIkweKSEeA=; b=WjeWpvq2m//S1J5LL+Gx2aI49P
	HuxxP8OvtYvt6Lz+xj2AxdcDeO3PAxgwcVRVJajgyrhcfpOU+c5dpQWdtMzffQ4gHnpVYe6gh5TbW
	LeLPtKYGAtpZqzCnnmKqdsFdQwgi41e2+K4c8I3xA9gFCOZASxiiiz+JRBCoMYzj2jrI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.4652.84564.294199@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 16:11:24 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Doug Goldstein <cardoe@cardoe.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] automation: Annotate that a 32bit libc is no longer a dependency
In-Reply-To: <20210225203010.11378-4-andrew.cooper3@citrix.com>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
	<20210225203010.11378-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 3/3] automation: Annotate that a 32bit libc is no longer a dependency"):
> We can't drop the 32bit libc from the existing containers, because they are
> used on older Xen branches as well.
> 
> However, we can avoid the dependency being propagated into newer conainers
> derived from our dockerfiles.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Wei Liu <wl@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> 
> For 4.15.  Documentation changes only

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

