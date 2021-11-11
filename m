Return-Path: <SRS0=hUiL=P6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD1BC433EF
	for <xen-devel@archiver.kernel.org>; Thu, 11 Nov 2021 14:49:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97BEB611C9
	for <xen-devel@archiver.kernel.org>; Thu, 11 Nov 2021 14:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97BEB611C9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.224784.388280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlBNX-0002pQ-5r; Thu, 11 Nov 2021 14:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224784.388280; Thu, 11 Nov 2021 14:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlBNX-0002pJ-2R; Thu, 11 Nov 2021 14:48:39 +0000
Received: by outflank-mailman (input) for mailman id 224784;
 Thu, 11 Nov 2021 14:48:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlBNV-0002pD-OV
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 14:48:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlBNV-0007PQ-Lp
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 14:48:37 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlBNV-0006OS-Kp
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 14:48:37 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mlBNK-0005eu-BZ; Thu, 11 Nov 2021 14:48:26 +0000
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
	bh=xLTOOdFjZQoxtmdyMlNnkf4dBX0Cm/aPQPIB7n9MgUo=; b=w+5HVrVRzZ1PSFEzXYo5XrXJFD
	/CP+IvPYgvNqKaSPxgWMXoKRz43+QCn3vNjlVPb7zwAnyAt1uIUQe9C5YdKqfmaVVdaTZUypsRMQr
	Oxe7r1mPf5dlJRIgoLtHs4SNG2gYadu6kDjqlJy1X/QOiycZmTiBUiQbrVKx7sToBnyA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24973.11574.552396.889715@mariner.uk.xensource.com>
Date: Thu, 11 Nov 2021 14:48:22 +0000
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    Penny.Zheng@arm.com,
    Bertrand.Marquis@arm.com,
    Wei.Chen@arm.com,
    Volodymyr_Babchuk@epam.com,
    xen-devel@lists.xenproject.org,
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as
 reserved-memory
In-Reply-To: <62d96c46-fa37-438d-1099-34290c52232b@xen.org>
References: <20211110201812.934306-1-sstabellini@kernel.org>
	<34d14ad2-3af6-1624-f30d-12f53f8ffdfb@xen.org>
	<24973.7073.267980.897378@mariner.uk.xensource.com>
	<62d96c46-fa37-438d-1099-34290c52232b@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as reserved-memory"):
> The first version of the patch [1] was tagged with for-4.16 and contains 
> the rationale.
> 
> I was thinking to commit it because it already contains your 
> release-acked-by. Can you let me know if it still stands?

Oh.  Please go ahead.  I'm sorry to be confused; I rely on the
computer as my external storage :-).

Ian.


