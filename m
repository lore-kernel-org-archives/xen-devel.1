Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE56C369AB
	for <xen-devel@archiver.kernel.org>; Thu, 24 Apr 2025 15:00:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.966475.1356675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7y4A-0006MB-2B; Thu, 24 Apr 2025 15:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966475.1356675; Thu, 24 Apr 2025 15:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7y49-0006M4-Vd; Thu, 24 Apr 2025 15:00:41 +0000
Received: by outflank-mailman (input) for mailman id 966475;
 Thu, 24 Apr 2025 15:00:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u7y49-0006Ly-Es
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 15:00:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7y49-001hri-0W;
 Thu, 24 Apr 2025 15:00:41 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7y48-000TXd-2u;
 Thu, 24 Apr 2025 15:00:41 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=UUVWO8xhBRbA6mpQJxdKUahxWtydL2pWqmO5YYmQT9g=; b=AjTkySW7VPiXCg0BtKOJ3Phps6
	lqiuMT8Npy4WFYxLjUgCIF1w5pe/ijXcX8gX7M7B6sC6G12pRrY2LyUU1/aDZlAWkxlx2JNJQgGWz
	OE8IFsgI7yyYnPUsgfmTxXbXzeS1atsXp7stZCI5HXo7ighwgaSjurcgsvpkecglXioU=;
Date: Thu, 24 Apr 2025 17:00:39 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/2] tools/xen-hptool: Replace hard tabs
Message-ID: <aApSF7bWv-1Xy1EY@l14>
References: <20250423212821.42776-1-jason.andryuk@amd.com>
 <20250423212821.42776-3-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423212821.42776-3-jason.andryuk@amd.com>

On Wed, Apr 23, 2025 at 05:28:21PM -0400, Jason Andryuk wrote:
> With a tab stop of 8, the alignment is off.  Replace the hard tabs with
> spaces to match the file.
> 
> Fixes: 284d5633be37 ("Tools: add online/offline hotplug user interfaces")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

