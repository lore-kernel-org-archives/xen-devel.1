Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6709BC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:03:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F1E560C3D
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F1E560C3D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79944.145824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aj3-0003Ny-Jr; Mon, 01 Feb 2021 15:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79944.145824; Mon, 01 Feb 2021 15:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aj3-0003Nr-Gn; Mon, 01 Feb 2021 15:02:49 +0000
Received: by outflank-mailman (input) for mailman id 79944;
 Mon, 01 Feb 2021 15:02:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6aj2-0003Nm-Jd
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:02:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6aj2-0004D6-EI
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:02:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6aj2-0003tW-Av
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:02:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6ait-0007h1-5v; Mon, 01 Feb 2021 15:02:39 +0000
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
	bh=zY76ypF3Q8Qeil0EJm2iCzobjcE/L4TqYeEZkySCwbY=; b=GVa9Atn6I3wxWrvp8eFjkaP59C
	y1+mZXI8gR6zRq+s8Jfxhzo/CMcxyk8FD5c0kKWuQ3wfv1gONxa400Euw5Pdl5HPperwgqDDx12p4
	To47t+0Tml07v7vGaQyJqb0FX53zgUldUH/tJoABPe7ryLIZqHx/PlX+6jNQltRKPMcQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24600.6158.963964.960004@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 15:02:38 +0000
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for 4.16] xl: Add xl.conf-based dom0 autoballoon limits
In-Reply-To: <1F7EC4ED-BFA0-4EC8-A7F4-BE78E2455FAE@citrix.com>
References: <20210129164858.3280477-1-george.dunlap@citrix.com>
	<606292ed-9083-d9a7-33e9-a02485cbbca0@suse.com>
	<1F7EC4ED-BFA0-4EC8-A7F4-BE78E2455FAE@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

George Dunlap writes ("Re: [PATCH for 4.16] xl: Add xl.conf-based dom0 autoballoon limits"):
> I’d certainly be in favor of getting something like b61443b1bf76
> upstream.  I still think a patch like this one would be useful
> though:
> 
> 1. The error message will be given right away, rather than timing
> out on the dom0 balloon driver
> 
> 2. The error message can be more informative, and point people to
> the whole “fixed dom0 memory” thing.

I agree.

If the memory ballooning accounting area wasn't already a swamp I
would be considering this patch for 4.15.  As it is I think it unwise
to make this change now because I don't see how to be confident it
won't break anything.

Ian.

