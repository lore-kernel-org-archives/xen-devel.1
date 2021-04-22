Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BA7C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 07:20:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE32960200
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 07:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE32960200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115022.219319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTdC-0003iZ-Ve; Thu, 22 Apr 2021 07:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115022.219319; Thu, 22 Apr 2021 07:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTdC-0003iS-SB; Thu, 22 Apr 2021 07:20:10 +0000
Received: by outflank-mailman (input) for mailman id 115022;
 Thu, 22 Apr 2021 07:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Z8K=JT=bombadil.srs.infradead.org=batv+ccca8c562e79e8576e72+6451+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lZTdB-0002oJ-D1
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:20:09 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15421345-e757-4d72-94d1-251613525182;
 Thu, 22 Apr 2021 07:19:47 +0000 (UTC)
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTcf-00DRlY-M8; Thu, 22 Apr 2021 07:19:38 +0000
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
X-Inumbo-ID: 15421345-e757-4d72-94d1-251613525182
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=xD8ROuypRPJNh1m/ueF1N/0zbojT8vOodof5U8gwwPw=; b=hl0mLAPtI4EUUTxHX9rKGAwXEe
	oymWWAiTedNj4Ts234A61u45CuUHmD7rWNj3wG+PoV/7AYwMnLUP2uFHT2aAwoE7YvYPxjrbRDmHx
	r2JtfJC0WOShuUl81WCs1Y7d6eYIczxE5z8zT2V3NyEX9qwU4tEEbArvXb5X+QGbZjOu3xc8AHXWJ
	wZ9YNoqEWYD2Bhdffx+5mRsV6gNmsqZm/TmyxKfCZtA0zBIgQT6B7C54T5t31g365WE2u8rBllDOT
	KibaOsAYfbEmn7HqDwTN2geflsIvhw6FBUXjrPzT6SjsT7cOwIv0uW39tQ9rBtgIKvCdbiJb2SY61
	zOiYWgug==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 5/7] MIPS/octeon: simplify swiotlb initialization
Date: Thu, 22 Apr 2021 09:19:19 +0200
Message-Id: <20210422071921.1428607-6-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Just use swiotlb_adjust_size and swiotlb_init to initialize
swiotlb instead of doing a lot of manual work.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/cavium-octeon/dma-octeon.c      | 16 ++--------------
 arch/mips/include/asm/octeon/pci-octeon.h |  1 -
 arch/mips/pci/pci-octeon.c                |  2 +-
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index 020b8ce5b8ff7c..6bc9ef5e3790ec 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -186,15 +186,12 @@ phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 	return daddr;
 }
 
-char *octeon_swiotlb;
-
 void __init plat_swiotlb_setup(void)
 {
 	phys_addr_t start, end;
 	phys_addr_t max_addr;
 	phys_addr_t addr_size;
 	size_t swiotlbsize;
-	unsigned long swiotlb_nslabs;
 	u64 i;
 
 	max_addr = 0;
@@ -236,15 +233,6 @@ void __init plat_swiotlb_setup(void)
 	if (OCTEON_IS_OCTEON2() && max_addr >= 0x100000000ul)
 		swiotlbsize = 64 * (1<<20);
 #endif
-	swiotlb_nslabs = swiotlbsize >> IO_TLB_SHIFT;
-	swiotlb_nslabs = ALIGN(swiotlb_nslabs, IO_TLB_SEGSIZE);
-	swiotlbsize = swiotlb_nslabs << IO_TLB_SHIFT;
-
-	octeon_swiotlb = memblock_alloc_low(swiotlbsize, PAGE_SIZE);
-	if (!octeon_swiotlb)
-		panic("%s: Failed to allocate %zu bytes align=%lx\n",
-		      __func__, swiotlbsize, PAGE_SIZE);
-
-	if (swiotlb_init_with_tbl(octeon_swiotlb, swiotlbsize, 1) == -ENOMEM)
-		panic("Cannot allocate SWIOTLB buffer");
+	swiotlb_adjust_size(swiotlbsize);
+	swiotlb_init(false);
 }
diff --git a/arch/mips/include/asm/octeon/pci-octeon.h b/arch/mips/include/asm/octeon/pci-octeon.h
index b12d9a3fbfb6c0..a2f20a44fb6143 100644
--- a/arch/mips/include/asm/octeon/pci-octeon.h
+++ b/arch/mips/include/asm/octeon/pci-octeon.h
@@ -64,6 +64,5 @@ enum octeon_dma_bar_type {
 extern enum octeon_dma_bar_type octeon_dma_bar_type;
 
 void octeon_pci_dma_init(void);
-extern char *octeon_swiotlb;
 
 #endif
diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index fc29b85cfa926d..ff26cd9dc083f6 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -664,7 +664,7 @@ static int __init octeon_pci_setup(void)
 
 		/* BAR1 movable regions contiguous to cover the swiotlb */
 		octeon_bar1_pci_phys =
-			virt_to_phys(octeon_swiotlb) & ~((1ull << 22) - 1);
+			io_tlb_default_mem->start & ~((1ull << 22) - 1);
 
 		for (index = 0; index < 32; index++) {
 			union cvmx_pci_bar1_indexx bar1_index;
-- 
2.30.1


