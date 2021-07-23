Return-Path: <SRS0=8S6Q=MP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA70C43214
	for <xen-devel@archiver.kernel.org>; Fri, 23 Jul 2021 17:51:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFA260C51
	for <xen-devel@archiver.kernel.org>; Fri, 23 Jul 2021 17:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CFA260C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.160218.294654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6zK3-0008GH-6Z; Fri, 23 Jul 2021 17:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160218.294654; Fri, 23 Jul 2021 17:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6zK3-0008G8-2m; Fri, 23 Jul 2021 17:50:55 +0000
Received: by outflank-mailman (input) for mailman id 160218;
 Fri, 23 Jul 2021 17:50:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLib=MP=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m6zK1-0003JD-CN
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 17:50:53 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78c022ed-ebde-11eb-9468-12813bfff9fa;
 Fri, 23 Jul 2021 17:50:31 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJb-0005Lg-SA; Fri, 23 Jul 2021 11:50:28 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJM-0005r8-BY; Fri, 23 Jul 2021 11:50:12 -0600
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
X-Inumbo-ID: 78c022ed-ebde-11eb-9468-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=L1b4mN92m3Z8Ycv5Au7RT1T/xTKMMtHSrAAz+sZBHZU=; b=ET8ruOrMt3mmCeZ34jiXdc2TdL
	gFJFpX62wDhFZJ9SERcczOaoRys/OxEHMCG+YxY/vdigNN+Bqg8A/qJpFlYbeMDLFpZVJDUwikAzf
	yr9BFCVPd7X9cpY5TCkShv5wTt4zgBUQrOT62bMiG+G1Af0QQZyVO+d273RRMPLYo8UVHCBOTNwf7
	MotCCWFSeBPff/nYUPd/EdwmTSVfczc4BNdfkMRWbxNlqMFoOXvAeTF7z2v7KpBUr5jmp6IuvR+sB
	Aa5GXzh+uyr3Vs8hJxtW+bE2p8twj6yYWiruPrNas2TjMzD6+2Ck7YfPlxTAU7zAEjbP/ZOLOhrLW
	XY/zW0Xw==;
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-parisc@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stephen Bates <sbates@raithlin.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Date: Fri, 23 Jul 2021 11:50:00 -0600
Message-Id: <20210723175008.22410-14-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v2 13/21] s390/pci: don't set failed sg dma_address to DMA_MAPPING_ERROR
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Setting the ->dma_address to DMA_MAPPING_ERROR is not part of
the ->map_sg calling convention, so remove it.

Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345@lst.de/
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
---
 arch/s390/pci/pci_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
index c78b02012764..be48e5b5bfcf 100644
--- a/arch/s390/pci/pci_dma.c
+++ b/arch/s390/pci/pci_dma.c
@@ -492,7 +492,6 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	for (i = 1; i < nr_elements; i++) {
 		s = sg_next(s);
 
-		s->dma_address = DMA_MAPPING_ERROR;
 		s->dma_length = 0;
 
 		if (s->offset || (size & ~PAGE_MASK) ||
-- 
2.20.1


