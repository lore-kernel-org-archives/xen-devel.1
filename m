Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8684606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 06:39:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1495776.1694529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTvn7-0002Y1-1W; Thu, 19 Nov 2026 06:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495776.1694529; Thu, 19 Nov 2026 06:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTvn6-0002Xu-Uh; Thu, 19 Nov 2026 06:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1495776;
 Thu, 19 Nov 2026 06:38:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xTvn5-0002Wj-LZ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 06:38:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTvn4-004bgA-R8
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 07:38:38 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afe9963-8faa-0a2a0a5109dd-0a2a45048484-8
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 07:38:38 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afe996d-b57f-0a2a45040019-a06583098470-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 07:38:38 +0100
Received: from cdev-nkg (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 35C12852CB0A;
 Thu, 19 Nov 2026 01:37:06 -0500 (EST)
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
	ross.lagerwall@citrix.com,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] xen/swiotlb: Bounce mappings that cross the segment boundary
Date: Thu, 19 Nov 2026 06:38:32 +0000
Message-ID: <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1795070318-C04DBB50-F82460DB/0/0
X-purgate-type: clean
X-purgate-size: 2564
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The block layer applies a device's DMA segment boundary to
pseudo-physical addresses, but in a Xen PV domain the bus address is the
machine address.  A segment that is contiguous in both spaces can still
cross the boundary in machine space and reach the device.  AHCI declares
a 4 GiB boundary, and controllers that do not carry across it (e.g.
Marvell 88SE9230) then DMA the tail of the transfer 4 GiB too low.

Bounce such streaming mappings.  Coherent allocations need no check:
they are naturally aligned in bus space (range_requires_alignment()), so
they cannot cross a boundary they fit in.

Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
v2:
- Only check streaming mappings; coherent allocations are naturally
  aligned in bus space and cannot cross the boundary (Ross, Jürgen).
- Leave range_straddles_page_boundary() unchanged.
- Comment why alloc_coherent needs no boundary check (Jürgen).

 drivers/xen/swiotlb-xen.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index e2538824e..5041be7d3 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -96,6 +96,15 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
 	return 0;
 }
 
+/* Bus-contiguous, but may still cross the device's segment boundary */
+static inline bool range_crosses_seg_boundary(struct device *dev,
+					      dma_addr_t dma, size_t size)
+{
+	unsigned long mask = dma_get_seg_boundary(dev);
+
+	return size && ((dma ^ (dma + size - 1)) & ~mask);
+}
+
 static struct io_tlb_pool *xen_swiotlb_find_pool(struct device *dev,
 						 dma_addr_t dma_addr)
 {
@@ -157,6 +166,7 @@ xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
 	phys = virt_to_phys(ret);
 
 	*dma_handle = xen_phys_to_dma(dev, phys);
+	/* No seg boundary check: __get_free_pages() is naturally aligned */
 	if (*dma_handle + size - 1 > dma_mask ||
 	    range_straddles_page_boundary(phys, size) ||
 	    range_requires_alignment(phys, size)) {
@@ -234,6 +244,7 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
 	if (dma_capable(dev, dev_addr, size, true, attrs) &&
 	    !dma_kmalloc_needs_bounce(dev, size, dir) &&
 	    !range_straddles_page_boundary(phys, size) &&
+	    !range_crosses_seg_boundary(dev, dev_addr, size) &&
 		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
 		!is_swiotlb_force_bounce(dev))
 		goto done;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.52.0


