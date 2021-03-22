Return-Path: <SRS0=cl0r=IU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AEDC433C1
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 10:33:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B446198E
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 10:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66B446198E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100121.190543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOHrk-0000TX-Br; Mon, 22 Mar 2021 10:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100121.190543; Mon, 22 Mar 2021 10:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOHrk-0000TQ-8b; Mon, 22 Mar 2021 10:32:56 +0000
Received: by outflank-mailman (input) for mailman id 100121;
 Mon, 22 Mar 2021 10:32:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOHrj-0000TL-K7
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:32:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOHrj-0001Ct-JF
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:32:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOHrj-0002ki-IL
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:32:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOHrg-00083n-Ap; Mon, 22 Mar 2021 10:32:52 +0000
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
	bh=vtPSTz4CW1VPx+bNbF230raYrB2ZHcoGx51a9ARb9JQ=; b=1MAgjRrVn55TIBgUq26iYA/VfS
	4Bd8rKKfgqDECeiO8CX2e/EAocuk5b2gMkM9bhawCo6YxD1MQziAkvndsgOaIj8prabj7uoC8gHP6
	FwdgRV3NoZcgSk6EuvNoYu6nq+UVw36KID9lQfaoys3UyV5N/NueeGZYWczSww7plyu0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24664.29268.129126.416099@mariner.uk.xensource.com>
Date: Mon, 22 Mar 2021 10:32:52 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15 v3] SUPPORT.MD: Mark LiveUpdate of C/OCaml
 XenStored daemon as Tech Preview
In-Reply-To: <abaa77f4-3375-44c3-bab4-4b286ca42d35@xen.org>
References: <20210317120854.19903-1-julien@xen.org>
	<abaa77f4-3375-44c3-bab4-4b286ca42d35@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH for-4.15 v3] SUPPORT.MD: Mark LiveUpdate of C/OCaml XenStored daemon as Tech Preview"):
> Sorry I forgot to CC you on the original Ian. Would it be possible to 
> give an R-A for the patch below?

Sure,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

