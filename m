Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A81C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 08:35:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428351.1651077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vyN-0005KN-S0; Tue, 22 Sep 2026 08:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428351.1651077; Tue, 22 Sep 2026 08:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vyN-0005KG-PC; Tue, 22 Sep 2026 08:35:31 +0000
Received: by outflank-mailman (input) for mailman id 1428351;
 Tue, 22 Sep 2026 08:35:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x8vyM-0005KA-ED
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:35:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8vyJ-00AiKl-0a;
 Tue, 22 Sep 2026 08:35:27 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8vyJ-005P5n-1y;
 Tue, 22 Sep 2026 08:35:27 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=in5miQYTc3LbtSaYzXdTxL0Fg8Xm0nJOMms6+76vWBc=; b=dc3dEUSsMAiLyhZ8Hulk5Iludw
	a1IqcerfvlF8rbrGAMO1ZHwlkGEc8HTyQ9PMLEeJZGYxPQEoVNSzaczEQqV/2T0N9mBwIWO5oMboL
	ne5HW3VXVPbSBhMOOT6abD4yoSCDsZvM5Wj46NvfDSW3owHMAO2xylkUtiW89XR3nK5c=;
Date: Tue, 22 Sep 2026 10:35:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Yuchao Zhang <ndaugoing@gmail.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] xen-blkfront: unbind irq before tearing down ring and
 shadow requests
Message-ID: <arI9zQrvacVVR_Sm@macbook.local>
References: <arD7FHmbqJlLHmyE@macbook.local>
 <20260922072155.34625-1-ndaugoing@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922072155.34625-1-ndaugoing@gmail.com>

On Tue, Sep 22, 2026 at 03:21:55PM +0800, Yuchao Zhang wrote:
> In blkif_free_ring(), the driver tears down the ring's persistent grants,
> shadow request arrays, and shared ring structure (xenbus_teardown_ring),
> and only calls unbind_from_irqhandler() at the very end.
> 
> While blkif_free_ring() is freeing persistent grants and clearing the
> shadow array, the event channel interrupt (blkif_interrupt) is still
> registered and active.  If an interrupt arrives from the backend during
> this teardown window, blkif_interrupt() reads rinfo->ring.sring and,
> via blkif_completion(), accesses rinfo->shadow[id].grants_used and
> rinfo->shadow[id].sg.  blkif_free_ring() tears these structures down
> without holding rinfo->ring_lock, and the handler only checks
> info->connected at entry, so this is a real race resulting in a
> use-after-free or NULL pointer dereference.
> 
> Fix this by moving unbind_from_irqhandler() to the beginning of
> blkif_free_ring().  Calling unbind_from_irqhandler() first frees the
> IRQ and synchronizes with any in-flight interrupt handlers on other CPUs
> before ring memory and shadow request structures are deallocated,
> matching the teardown order in drivers/net/xen-netfront.c.
> 
> Fixes: 11659569f720 ("xen/blkfront: split per device io_lock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

