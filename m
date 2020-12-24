Return-Path: <SRS0=mNaa=F4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21664C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 24 Dec 2020 15:24:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B508C22288
	for <xen-devel@archiver.kernel.org>; Thu, 24 Dec 2020 15:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B508C22288
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.58741.103490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksSTY-0004cq-EO; Thu, 24 Dec 2020 15:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58741.103490; Thu, 24 Dec 2020 15:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksSTY-0004cj-AW; Thu, 24 Dec 2020 15:24:24 +0000
Received: by outflank-mailman (input) for mailman id 58741;
 Thu, 24 Dec 2020 15:24:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ksSTW-0004ce-VG
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 15:24:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksSTW-000857-HI; Thu, 24 Dec 2020 15:24:22 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksSTW-0003H1-52; Thu, 24 Dec 2020 15:24:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=BCKy0pbM4tZ5ytPu0zUJpTYg/wcrS8QruCKIKZ+10yw=; b=lZpFF2qALH2gGVj+jA87gVOuvp
	lF8IFS96oiqPXytVu1fwp+0jhrsqWXjm2dBvyu3XP5HVEdiEjCN1qDNVN1q2UlvIohXT90Qy5SOZG
	xlK2jZSWjedr6NSgl+s8g4JfZ6j8Iv4qyLHVVWbBcTIKu5KTxFv/xTmNG9szcdSItRwI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/iommu: smmu: Use 1UL << 31 rather than 1 << 31
Date: Thu, 24 Dec 2020 15:24:19 +0000
Message-Id: <20201224152419.22453-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Replace all the use of 1 << 31 with 1UL << 31 to prevent undefined
behavior in the SMMU driver.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/drivers/passthrough/arm/smmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index ed04d85e05e9..3e8aa378669b 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -405,7 +405,7 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 #define ID0_NUMSMRG_SHIFT		0
 #define ID0_NUMSMRG_MASK		0xff
 
-#define ID1_PAGESIZE			(1 << 31)
+#define ID1_PAGESIZE			(1U << 31)
 #define ID1_NUMPAGENDXB_SHIFT		28
 #define ID1_NUMPAGENDXB_MASK		7
 #define ID1_NUMS2CB_SHIFT		16
@@ -438,7 +438,7 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 
 /* Stream mapping registers */
 #define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
-#define SMR_VALID			(1 << 31)
+#define SMR_VALID			(1U << 31)
 #define SMR_MASK_SHIFT			16
 #define SMR_MASK_MASK			0x7fff
 #define SMR_ID_SHIFT			0
@@ -506,7 +506,7 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 #define RESUME_RETRY			(0 << 0)
 #define RESUME_TERMINATE		(1 << 0)
 
-#define TTBCR_EAE			(1 << 31)
+#define TTBCR_EAE			(1U << 31)
 
 #define TTBCR_PASIZE_SHIFT		16
 #define TTBCR_PASIZE_MASK		0x7
@@ -562,7 +562,7 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 #define MAIR_ATTR_IDX_CACHE		1
 #define MAIR_ATTR_IDX_DEV		2
 
-#define FSR_MULTI			(1 << 31)
+#define FSR_MULTI			(1U << 31)
 #define FSR_SS				(1 << 30)
 #define FSR_UUT				(1 << 8)
 #define FSR_ASF				(1 << 7)
-- 
2.17.1


