Return-Path: <SRS0=/1jQ=MV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7C4C2BB02
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jul 2021 20:16:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE0D60F48
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jul 2021 20:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BE0D60F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.162064.297451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9CSF-0003Z7-3r; Thu, 29 Jul 2021 20:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162064.297451; Thu, 29 Jul 2021 20:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9CSE-0003Yi-Uh; Thu, 29 Jul 2021 20:16:30 +0000
Received: by outflank-mailman (input) for mailman id 162064;
 Thu, 29 Jul 2021 20:16:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yd/7=MV=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m9CSE-0005pZ-57
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 20:16:30 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74a2c327-19c4-4728-a474-9ce532552b34;
 Thu, 29 Jul 2021 20:15:58 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRe-0008VN-G4; Thu, 29 Jul 2021 14:15:55 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRV-0001U5-El; Thu, 29 Jul 2021 14:15:45 -0600
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
X-Inumbo-ID: 74a2c327-19c4-4728-a474-9ce532552b34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=6y6u7mqV1FaPPB3FCU6tc5JcXwZSIOmHMoiIHkmUZvc=; b=e4d60/OLYdyc6xXPUN9l5vbTgC
	5kYPrlDotb8/CzFuWOeAmYTUwjYP2ETS2BEJBZnaRrMkl6QE2YK+Z0X4WLU3XVyZjIQPJd4KPKLVX
	9z1RalZ7Rj3cm60xKdgm4DrLx9xVrQ5x6SIIDJnoY84I41lD3GvvjW8lGYIEkc8MCPIMSdYmjHOsX
	G+3Dz3xqoaTHQ5lz6bICLu3UcD8WnMIwPrNA4AdT/XXsUGvw+HnZk86aH6Qn5dG1mndxUertWJyzN
	1LaZJlW3gZ4l+iarh3qgXxqLmb6x2oqs+HVl63DPEgPGRsfIKlztFQlxYovSPreen45BHo7q/NT+l
	G12R1I2g==;
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
	"David S. Miller" <davem@davemloft.net>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 29 Jul 2021 14:15:32 -0600
Message-Id: <20210729201539.5602-15-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, davem@davemloft.net, schnelle@linux.ibm.com, mpe@ellerman.id.au
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v3 14/21] sparc/iommu: return error codes from .map_sg() ops
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

Returning an errno from __sbus_iommu_map_sg() results in
sbus_iommu_map_sg_gflush() and sbus_iommu_map_sg_pflush() returning an
errno, as those functions are wrappers around __sbus_iommu_map_sg().

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/sparc/kernel/iommu.c     | 4 ++--
 arch/sparc/kernel/pci_sun4v.c | 4 ++--
 arch/sparc/mm/iommu.c         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index a034f571d869..0589acd34201 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -448,7 +448,7 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 	iommu = dev->archdata.iommu;
 	strbuf = dev->archdata.stc;
 	if (nelems == 0 || !iommu)
-		return 0;
+		return -EINVAL;
 
 	spin_lock_irqsave(&iommu->lock, flags);
 
@@ -580,7 +580,7 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 	}
 	spin_unlock_irqrestore(&iommu->lock, flags);
 
-	return 0;
+	return -EINVAL;
 }
 
 /* If contexts are being used, they are the same in all of the mappings
diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
index 9de57e88f7a1..d90e80fa5705 100644
--- a/arch/sparc/kernel/pci_sun4v.c
+++ b/arch/sparc/kernel/pci_sun4v.c
@@ -486,7 +486,7 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 
 	iommu = dev->archdata.iommu;
 	if (nelems == 0 || !iommu)
-		return 0;
+		return -EINVAL;
 	atu = iommu->atu;
 
 	prot = HV_PCI_MAP_ATTR_READ;
@@ -619,7 +619,7 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 	}
 	local_irq_restore(flags);
 
-	return 0;
+	return -EINVAL;
 }
 
 static void dma_4v_unmap_sg(struct device *dev, struct scatterlist *sglist,
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index 0c0342e5b10d..9e3f6933ca13 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -256,7 +256,7 @@ static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *sgl,
 		sg->dma_address =__sbus_iommu_map_page(dev, sg_page(sg),
 				sg->offset, sg->length, per_page_flush);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
-			return 0;
+			return -EIO;
 		sg->dma_length = sg->length;
 	}
 
-- 
2.20.1


