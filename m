Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F368CA5FE2
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 07:06:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440588.1657994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDclS-0002pl-HY; Mon, 05 Oct 2026 07:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440588.1657994; Mon, 05 Oct 2026 07:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDclS-0002pe-Ee; Mon, 05 Oct 2026 07:05:34 +0000
Received: by outflank-mailman (input) for mailman id 1440588;
 Mon, 05 Oct 2026 07:05:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <m.szyprowski@samsung.com>) id 1xDclQ-0002pY-6h
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 07:05:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDclO-00BLBw-Ve
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 09:05:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <m.szyprowski@samsung.com>)
 id 6ac34c30-bab6-0a2a0a5309dd-0a2a4501ab56-46
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 09:05:30 +0200
Received: from [210.118.77.12] (helo=mailout2.w1.samsung.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <m.szyprowski@samsung.com>)
 id 6ac34c39-5984-0a2a45010019-d2764d0cf7d6-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 09:05:29 +0200
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20261005070529euoutp02459e45710f21251dc7cb1ff0e4225fd8~bkEshCAH_2592325923euoutp02N
 for <xen-devel@lists.xenproject.org>; Mon,  5 Oct 2026 07:05:29 +0000 (GMT)
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20261005070528eucas1p18d16ec6ecc4e879d0adc66538122132c~bkEsU7ZkM1887318873eucas1p1T;
 Mon,  5 Oct 2026 07:05:28 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20261005070528eusmtip1b88e4c060af8fd0102f58eef95fae4dd~bkErlAe2r2672226722eusmtip1G;
 Mon,  5 Oct 2026 07:05:28 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail20170921 header.d=samsung.com header.i="@samsung.com" header.h="From:To:Cc:Subject:Date:References"
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261005070529euoutp02459e45710f21251dc7cb1ff0e4225fd8~bkEshCAH_2592325923euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791183929;
	bh=LI1PY/lp2Uaq3ccGVqctwJ7GhEhUeqzl4hfjynZeaG8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=IUkx1HNDA0Ce0WVEr0ao5DI7gy0CMBPsbPTzPoH85+3oggsJMvxhJOxmMxm36/r28
	 Js3UdcmTu5NNN2QVFUR7zJwIdhN9iflz37cpmw4aOb55MYN4sZJqCGFLJwdqHBP8bV
	 dBD4t3FwZKIO32AV80IxRIAyj0Zx1bC2v7SJR89E=
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Petr Tesarik
	<petr.tesarik.ext@huawei.com>, Andreas Greve <andreas.greve@a-greve.de>,
	James Dingwall <james@dingwall.me.uk>
Subject: [PATCH] swiotlb: fix default_swiotlb_limit() for non-growable
 default pool
Date: Mon,  5 Oct 2026 09:05:17 +0200
Message-ID: <20261005070518.1590097-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261005070528eucas1p18d16ec6ecc4e879d0adc66538122132c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261005070528eucas1p18d16ec6ecc4e879d0adc66538122132c
X-EPHeader: CA
X-CMS-RootMailID: 20261005070528eucas1p18d16ec6ecc4e879d0adc66538122132c
References: <CGME20261005070528eucas1p18d16ec6ecc4e879d0adc66538122132c@eucas1p1.samsung.com>
X-purgate-ID: tlsNG-d62444/1791183930-1FC69757-A942B5BE/0/0
X-purgate-type: clean
X-purgate-size: 2041

Commit ad96ce3252db ("swiotlb: determine potential physical address
limit") changed default_swiotlb_limit() to return the maximum physical
address that could ever be used by dynamically allocated pools, so that
the value stays constant when CONFIG_SWIOTLB_DYNAMIC=y. However,
io_tlb_default_mem.phys_limit is returned even when the default pool
cannot grow, e.g. when swiotlb_init_remap() is called with a remap
callback.

This breaks Xen dom0 on x86: pci_xen_swiotlb_init() passes SWIOTLB_ANY
and xen_swiotlb_fixup(), so phys_limit is set to the top of dom0 memory,
although xen_swiotlb_fixup() makes the default pool below the 32-bit
boundary. xen_swiotlb_dma_supported() then rejects 32-bit DMA masks,
even though the bounce buffer is perfectly usable by such devices.

Return phys_limit only if the default pool can actually grow, otherwise
report the real end of the default pool, like in the
!CONFIG_SWIOTLB_DYNAMIC case.

Reported-by: Andreas Greve <andreas.greve@a-greve.de>
Reported-by: James Dingwall <james@dingwall.me.uk>
Fixes: ad96ce3252db ("swiotlb: determine potential physical address limit")
Closes: https://lore.kernel.org/xen-devel/f74668db-52fd-4575-8372-7bfdf10d62ac@a-greve.de/
Cc: stable@vger.kernel.org
Assisted-by: Claude Opus 5.5 (1M context) <noreply@anthropic.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 kernel/dma/swiotlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index aa2f1c4588b9..5edea93ec635 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1844,10 +1844,10 @@ phys_addr_t default_swiotlb_base(void)
 phys_addr_t default_swiotlb_limit(void)
 {
 #ifdef CONFIG_SWIOTLB_DYNAMIC
-	return io_tlb_default_mem.phys_limit;
-#else
-	return io_tlb_default_mem.defpool.end - 1;
+	if (io_tlb_default_mem.can_grow)
+		return io_tlb_default_mem.phys_limit;
 #endif
+	return io_tlb_default_mem.defpool.end - 1;
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.43.0


