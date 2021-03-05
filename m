Return-Path: <SRS0=5QKt=ID=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB5FC433E0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 13:22:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6CFA64FD3
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 13:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6CFA64FD3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93686.176751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAPG-0006NR-GQ; Fri, 05 Mar 2021 13:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93686.176751; Fri, 05 Mar 2021 13:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAPG-0006NK-DN; Fri, 05 Mar 2021 13:22:14 +0000
Received: by outflank-mailman (input) for mailman id 93686;
 Fri, 05 Mar 2021 13:22:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAPF-0006NF-Pg
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:22:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAPF-0006fT-ML
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:22:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAPF-0001eF-J9
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:22:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIAPC-0008NU-06; Fri, 05 Mar 2021 13:22:10 +0000
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
	bh=U+oSM8NTf2wdmz90OwMqDCXJpXj1kjl1csmbly+z8YA=; b=UofpYBbIXLshve0XJcezXUiSvc
	tDmbJA4zNzlQRwP7FI9h3pR/falPcbTa29C7tUV/hMnlbuAvE6/tvb6qHsD9sMK3s6TmSpYe+ixLC
	nuruCWwe9DtFvIiAHtRbiIGNxinkFA+B18swjn5JUewTqhfW07y3mewKEddoOroofnlk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.12417.651929.972294@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 13:22:09 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    iwj@xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the maximum number of parameters
In-Reply-To: <20210305121029.7047-1-julien@xen.org>
References: <20210305121029.7047-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] tools/xenstored: liveupdate: Increase the maximum number of parameters"):
> From: Julien Grall <jgrall@amazon.com>
> 
> The longest possible command line for LiveUpdate is:
> 
>   liveupdate -s -t <timeout> -F
> 
> This is 5 parameters. However, the maximum is currently specified to 4.
> This means the some of the parameters will get ignored.

Why are the extra parameters ignored rather than treated as errors ?
This seems like an invitation to making code with bad behaviour
(perhaps bad security-relevant behaviour).

CC Juergen who seems to have written the code...

> Update the field max_pars to 5 so and admin can specify the timeout and
> force at the same time.

Anyway, for this patch,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

