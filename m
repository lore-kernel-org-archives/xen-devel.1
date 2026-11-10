Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BCA606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 01:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLwdMFW/
Received: from list by lists.xenproject.org with outflank-mailman.1480502.1684378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQaE4-0001MC-20; Tue, 10 Nov 2026 01:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480502.1684378; Tue, 10 Nov 2026 01:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQaE3-0001LX-Ve; Tue, 10 Nov 2026 01:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1480502;
 Tue, 10 Nov 2026 01:00:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xQaE2-0000pL-O5
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 01:00:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQaE1-00B32o-Qw
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 02:00:37 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6af26c68-8faa-0a2a0a5109dd-0a2a4508cb26-48
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 02:00:37 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6af26bc3-f659-0a2a45080019-aceafc1fc056-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 01:56:37 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AB68544D04;
 Tue, 10 Nov 2026 00:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F921F008A1;
 Tue, 10 Nov 2026 00:56:34 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794272195;
	bh=POYNQ8UFORjsZSBOAZpmVOdf956zxHeg9590atUMmfM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=DLwdMFW/60LVnTLa0yQmFg0tJx5vXiCHVmG3eQvGbHS3Idmk3+SseDFBk4e4QF6db
	 QGhyDVdv2TP7uE6I7XG/AK58MazhLRnlCZ5IuW+IA6DhA5bLWD/ACaImWurFZy0tQz
	 lG0sil3FGULB2pGRmHFZtabyVEjLG1JEgXDwUhr7Ds+JfrM4HvX/XQnnIh6+HycLwT
	 PjlB5wVDGsd8SFJO8h51aceVX/oB5ajpAbcSzJ1OiF2SPzAMsPLPlO4hwHFHxz2rJF
	 tOrhtc7ad9zvKgBlPUII/yBcXSRUtAqULMSVRHxrRdbVxmN/lbj6eJxUfYj0lJyQdy
	 SPIVp3mRgcmJA==
Date: Mon, 9 Nov 2026 16:56:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
    boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xen/pvcalls: destroy the per-socket workqueue on
 release
In-Reply-To: <20261109122324.30134-3-yhlee@isslab.korea.ac.kr>
Message-ID: <604a9832-80ac-107c-b36f-4bb338519cbc@kernel.org>
References: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr> <20261109122324.30134-3-yhlee@isslab.korea.ac.kr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c1860d/1794272197-D534D87B-649FF1C0/13/0
X-purgate-type: clean
X-purgate-size: 1764
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 9 Nov 2026, Yehyeong Lee wrote:
> pvcalls_new_active_socket() gives every active socket its own ordered
> workqueue:
> 
> 	map->ioworker.wq = alloc_ordered_workqueue("pvcalls_io", 0);
> 
> and nothing ever destroys it.  pvcalls_back_release_active() flushes
> map->ioworker.register_work and frees map, but the workqueue and its
> pool_workqueues stay allocated, so a frontend leaks a workqueue per socket
> it connects and releases - a loop a guest can run as long as it likes.
> 
> Destroy it after the IRQ is unbound, so no new work can be queued, and
> before map is freed.  pvcalls_back_ioworker() takes no locks, in
> particular not fedata->socket_lock, which the backend_disconnect() caller
> holds here, so draining it from this point is safe; the flush_work() just
> above already has the same requirement.
> 
> Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
> ---
>  drivers/xen/pvcalls-back.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
> index dcefa91a40cd05..27aa06289a7b92 100644
> --- a/drivers/xen/pvcalls-back.c
> +++ b/drivers/xen/pvcalls-back.c
> @@ -456,6 +456,7 @@ static int pvcalls_back_release_active(struct xenbus_device *dev,
>  	xenbus_unmap_ring_vfree(dev, map->bytes);
>  	xenbus_unmap_ring_vfree(dev, (void *)map->ring);
>  	unbind_from_irqhandler(map->irq, map);
> +	destroy_workqueue(map->ioworker.wq);

Please move the call to destroy_workqueue() just after flush_work().
With that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  	sock_release(map->sock);
>  	kfree(map);
> -- 
> 2.43.0
> 

