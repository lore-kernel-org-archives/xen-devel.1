Return-Path: <SRS0=9fiq=HS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A69C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 15:57:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA72764D9E
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 15:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA72764D9E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85888.160718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2is-0006tc-VX; Tue, 16 Feb 2021 15:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85888.160718; Tue, 16 Feb 2021 15:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2is-0006tV-SW; Tue, 16 Feb 2021 15:57:10 +0000
Received: by outflank-mailman (input) for mailman id 85888;
 Tue, 16 Feb 2021 15:57:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2ir-0006tQ-N6
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:57:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2ir-0003Oa-ME
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:57:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2ir-0002vk-LE
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:57:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC2io-0000h0-BU; Tue, 16 Feb 2021 15:57:06 +0000
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
	bh=I5DR9HPMrvd5IRmtN2NQE3F2mFp0XM5vCEOoF2ijlXA=; b=DyjrxL/GJSUJD3gs86YzphYkwU
	8akfydlcklfXPTu21QiYe9HOk3nwrADlEuklLR3q/zBMrc6MBzi57SGg2M0jR3JilUegXtizXGhdW
	zkm/tEgRY85Sd0epme4RxRII94g0+YaCZgMeeJcpadxUEz8AUDH95sY87T8J6YpZ/Bjo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.60242.137678.510238@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 15:57:06 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 01/10] tools/xl: Fix exit code for `xl vkbattach`
In-Reply-To: <20210212153953.4582-2-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 01/10] tools/xl: Fix exit code for `xl vkbattach`"):
> Various version of gcc, when compiling with -Og, complain:
> 
>   xl_vkb.c: In function 'main_vkbattach':
>   xl_vkb.c:79:12: error: 'rc' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      79 |     return rc;
>         |            ^~
> 
> The dryrun_only path really does leave rc uninitalised.  Introduce a done
> label for success paths to use.
> 
> Fixes: a15166af7c3 ("xl: add vkb config parser and CLI")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

