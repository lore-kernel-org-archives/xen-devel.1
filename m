Return-Path: <SRS0=0Xap=P5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66408C433EF
	for <xen-devel@archiver.kernel.org>; Wed, 10 Nov 2021 11:40:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22FB961107
	for <xen-devel@archiver.kernel.org>; Wed, 10 Nov 2021 11:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22FB961107
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.224257.387455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mklx7-0007R6-Pm; Wed, 10 Nov 2021 11:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224257.387455; Wed, 10 Nov 2021 11:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mklx7-0007Qz-Md; Wed, 10 Nov 2021 11:39:41 +0000
Received: by outflank-mailman (input) for mailman id 224257;
 Wed, 10 Nov 2021 11:39:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mklx6-0007Qt-9b
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 11:39:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mklx6-0000l9-7C
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 11:39:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mklx6-0007xR-6D
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 11:39:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mklx0-0000qP-S3; Wed, 10 Nov 2021 11:39:34 +0000
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
	bh=U9L4Tuk2AfuTAwXn9gYAPvy06JZZXFjiixBk/ojOYXY=; b=2kJt0yFnJF4uZebHqynGw4s3W3
	27ycnKmwLYC/7FFcLf0zAZWFLzcA/ij19POwMqtEw9Etyih5ZTcal8zmge6daNasq0sJL7LOEpQc0
	6jKRnhVNJpc3dKPApYNBU7z+WYarOvmGgSgrj2Q38G061/SqxZ6u4rqXoUIOPWhBQYI4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24971.44918.327528.573673@mariner.uk.xensource.com>
Date: Wed, 10 Nov 2021 11:39:34 +0000
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel@lists.xenproject.org,
    oleksandr_tyshchenko@epam.com,
    Bertrand.Marquis@arm.com,
    Volodymyr_Babchuk@epam.com,
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH for-4.16] xen/arm: allocate_bank_memory: don't create
 memory banks of size zero
In-Reply-To: <41fcacd5-bb8d-3a30-44f4-b86c741ad4f4@xen.org>
References: <20211109222944.531368-1-sstabellini@kernel.org>
	<41fcacd5-bb8d-3a30-44f4-b86c741ad4f4@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH for-4.16] xen/arm: allocate_bank_memory: don't create memory banks of size zero"):
> Instead, it looks like the issue is some part of Xen may fall over if 
> one of the bank is zero-sized. But from the earlier discussion [2], this 
> is just latent. So I think this should be clarified in the commit message.

Yes, please.

Indeed, this is part of:

> Please explain why you would like to include it in 4.16. In particular 
> that as I wrote above, Linux is able to cope with zero-size memory bank.

How is 4.16 bad without this patch ?  And, what might it break ?

What mistakes could have been made in analysis and preparation ?
(In this case the preparation of the patch seems very simple but the
analysis much less so.)

Ian.

