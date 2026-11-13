Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E34606A330
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 12:48:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1487494.1689901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqgx-00055e-Hs; Fri, 13 Nov 2026 12:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487494.1689901; Fri, 13 Nov 2026 12:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqgx-00055X-F7; Fri, 13 Nov 2026 12:47:43 +0000
Received: by outflank-mailman (input) for mailman id 1487494;
 Fri, 13 Nov 2026 12:47:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xRqgw-00055R-Qe
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:47:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRqgv-00AR9R-TE
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 13:47:41 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6af706dc-e002-0a2a0a5209dd-0a2a4501ccac-44
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:47:41 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6af706ec-5984-0a2a45010019-a065830999e0-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:47:41 +0100
Received: from cdev-nkg (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id BED5D8510DB9;
 Fri, 13 Nov 2026 07:46:18 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Lin Liu <lin.liu01@citrix.com>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lin Liu <lin.liu01@citrix.com>
Subject: [PATCH] xen/swiotlb: Check the segment boundary in range_straddles_page_boundary()
Date: Fri, 13 Nov 2026 12:47:33 +0000
Message-ID: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794574061-BDA7E757-2CCBAA05/0/0
X-purgate-type: clean
X-purgate-size: 3354
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The block layer applies a device's DMA segment boundary to
pseudo-physical addresses, but in a Xen PV domain the bus address is the
machine address.  A range that is contiguous in both spaces can still
cross the boundary in machine space and reach the device.  AHCI declares
a 4 GiB boundary, and controllers that do not carry across it (e.g.
Marvell 88SE9230) then DMA the tail of the transfer 4 GiB too low.

Make range_straddles_page_boundary() also reject a contiguous range that
crosses the device's segment boundary in bus space, so all its callers
cover it.  Streaming mappings are bounced; coherent allocations are
already naturally aligned via range_requires_alignment().

Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
 drivers/xen/swiotlb-xen.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index e2538824e..181f8cef2 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -82,10 +82,13 @@ static inline bool range_requires_alignment(phys_addr_t p, size_t size)
 	return IS_ALIGNED(p, algn) && !IS_ALIGNED(bus_addr, algn);
 }
 
-static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
+static inline int range_straddles_page_boundary(struct device *dev,
+						phys_addr_t p, size_t size)
 {
 	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
 	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
+	unsigned long mask;
+	dma_addr_t dma;
 
 	next_bfn = pfn_to_bfn(xen_pfn);
 
@@ -93,7 +96,10 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
 		if (pfn_to_bfn(++xen_pfn) != ++next_bfn)
 			return 1;
 
-	return 0;
+	/* Contiguous, but may cross the segment boundary in bus space */
+	mask = dma_get_seg_boundary(dev);
+	dma = xen_phys_to_dma(dev, p);
+	return size - 1 <= mask && ((dma ^ (dma + size - 1)) & ~mask);
 }
 
 static struct io_tlb_pool *xen_swiotlb_find_pool(struct device *dev,
@@ -158,7 +164,7 @@ xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
 
 	*dma_handle = xen_phys_to_dma(dev, phys);
 	if (*dma_handle + size - 1 > dma_mask ||
-	    range_straddles_page_boundary(phys, size) ||
+	    range_straddles_page_boundary(dev, phys, size) ||
 	    range_requires_alignment(phys, size)) {
 		if (xen_create_contiguous_region(phys, order, fls64(dma_mask),
 				dma_handle) != 0)
@@ -185,7 +191,7 @@ xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
 	size = ALIGN(size, XEN_PAGE_SIZE);
 
 	if (WARN_ON_ONCE(dma_handle + size - 1 > dev->coherent_dma_mask) ||
-	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size) ||
+	    WARN_ON_ONCE(range_straddles_page_boundary(dev, phys, size) ||
 			 range_requires_alignment(phys, size)))
 	    	return;
 
@@ -233,7 +239,7 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
 	 */
 	if (dma_capable(dev, dev_addr, size, true, attrs) &&
 	    !dma_kmalloc_needs_bounce(dev, size, dir) &&
-	    !range_straddles_page_boundary(phys, size) &&
+	    !range_straddles_page_boundary(dev, phys, size) &&
 		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
 		!is_swiotlb_force_bounce(dev))
 		goto done;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.52.0


