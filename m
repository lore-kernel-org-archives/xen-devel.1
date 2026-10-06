Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B4FCA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 16:53:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441675.1659260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE8Pw-0001SD-1R; Tue, 06 Oct 2026 16:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441675.1659260; Tue, 06 Oct 2026 16:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE8Pv-0001S5-Ua; Tue, 06 Oct 2026 16:53:27 +0000
Received: by outflank-mailman (input) for mailman id 1441675;
 Tue, 06 Oct 2026 16:53:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xE8Pv-0001Ry-An
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 16:53:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xE8Pu-0007qv-21;
 Tue, 06 Oct 2026 16:53:26 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xE8Pu-00EIBy-0t;
 Tue, 06 Oct 2026 16:53:26 +0000
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
	bh=kOlS+lL1hkPrA+M+rforELABkTt5NUaGOO8i1B5fYL8=; b=GpXwiAbtFyf1k/eR8dnrCFI3Nn
	W2cx9MDoU6bHdFiUSJxufc4F+qJB0+P5hJ+xkZ7Xx0OQGcf7noud9pUdrcLINKGBf9mbkfmPihhpS
	SkO6gm9ve4wDfIkRj4z2bshFvSw58sIowSp/JTz51tdBhkjugiMS/1yX+y+NasuYWBFA=;
Date: Tue, 6 Oct 2026 18:53:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>, stable@vger.kernel.org
Subject: Re: [PATCH v2] xen-blkfront: Fix IO race during unplug
Message-ID: <asUng9P2n1duQLrO@Mac.lan>
References: <20261006163411.2583538-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006163411.2583538-1-ross.lagerwall@citrix.com>

On Tue, Oct 06, 2026 at 05:34:07PM +0100, Ross Lagerwall wrote:
> During unplug, blkfront stops the hw queues and marks the disk as dead,
> then later during removal calls del_gendisk(). However, IO issued after
> the hw queues are stopped but before the call to del_gendisk() will be
> queued but never handled. This causes del_gendisk() to hang forever
> waiting for the queue refcount to drop to zero.
> 
> This can be reproduced by issuing IO during an artificial delay after
> stopping the hw queues.
> 
> Fix this by simply not stopping the hw queues directly. Marking the disk
> as dead already freezes the queue which prevents new requests being
> added and it synchronously runs the hw queues to clear anything pending.
> If the hw queues are stopped when calling blk_mark_disk_dead(), running
> the hw queues is a no-op and can leave queued requests unprocessed.
> 
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

