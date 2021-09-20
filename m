Return-Path: <SRS0=T9jm=OK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EFBC433F5
	for <xen-devel@archiver.kernel.org>; Mon, 20 Sep 2021 12:21:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 116A660F50
	for <xen-devel@archiver.kernel.org>; Mon, 20 Sep 2021 12:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 116A660F50
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.190851.340652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSIIf-0002rH-0N; Mon, 20 Sep 2021 12:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190851.340652; Mon, 20 Sep 2021 12:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSIIe-0002rA-Tn; Mon, 20 Sep 2021 12:21:32 +0000
Received: by outflank-mailman (input) for mailman id 190851;
 Mon, 20 Sep 2021 12:21:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSIId-0002r4-Oi
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 12:21:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSIId-0006fA-Lu
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 12:21:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSIId-0000Le-Kq
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 12:21:31 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSIIY-0005ln-UB; Mon, 20 Sep 2021 13:21:26 +0100
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
	bh=vKFgzzjUPzhgJWQ7Q6xL+L25e4KgSe6Xatv9RvE5nr0=; b=I0+SL5rWGWMateXaSRELtPL2NS
	gmuCS03Tu6L1zstUEDcjxp5cXBL7TjlCEAR78Md0IIELH9j6bF6NDzebpfceuwsUvfgnjsQ0X8BCd
	VBJb/Jb0o5ITAhccOHvj1p7lJCWM09+DQYfsUZnC9czXcvI2xL+esjKdSIMB17N+1f6s=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24904.31942.699227.516440@mariner.uk.xensource.com>
Date: Mon, 20 Sep 2021 13:21:26 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces
In-Reply-To: <25710b42-b2e9-54a2-a510-d8e09dbb1c25@suse.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
	<20210917154625.89315-5-roger.pau@citrix.com>
	<90f64a21-d5fc-fab3-2f3c-73de00421cb3@suse.com>
	<YUhoLnpv+Dq/dFBR@MacBook-Air-de-Roger.local>
	<24904.26906.715083.732081@mariner.uk.xensource.com>
	<25710b42-b2e9-54a2-a510-d8e09dbb1c25@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces"):
> They are. I checked when implementing LU and just rechecked.
> 
> The event-channel fd is opened explicitly without CLOEXEC in order
> to support LU (the new xenstored won't open it again, but gets its
> fd via the migration stream).

Oh, excellent.  Thanks.

Ian.

