Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F5EC07E96
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 10:54:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0886108B
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 10:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B0886108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.151079.279247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0iiS-00079r-DU; Tue, 06 Jul 2021 10:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151079.279247; Tue, 06 Jul 2021 10:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0iiS-00079k-Ae; Tue, 06 Jul 2021 10:54:12 +0000
Received: by outflank-mailman (input) for mailman id 151079;
 Tue, 06 Jul 2021 10:54:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zg9J=L6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1m0iiR-00079d-Ka
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 10:54:11 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ca720e2b-a021-4f4b-8373-f61dc560804c;
 Tue, 06 Jul 2021 10:54:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 587AB1FB;
 Tue,  6 Jul 2021 03:54:09 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70D623F694;
 Tue,  6 Jul 2021 03:54:08 -0700 (PDT)
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
X-Inumbo-ID: ca720e2b-a021-4f4b-8373-f61dc560804c
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smmuv1: Switch from kzalloc_array(..) to devm_kcalloc(..)
Date: Tue,  6 Jul 2021 11:53:59 +0100
Message-Id: <2c611dec5f1dbd6040d7a37d2d72ad2fc66e113f.1625568432.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

Switch from kzalloc_array(..) to devm_kcalloc(..) when allocating the
SMR to make code coherent.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index da2cd457d7..658c40433c 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -149,7 +149,8 @@ typedef enum irqreturn irqreturn_t;
 #define kzalloc(size, flags)		_xzalloc(size, sizeof(void *))
 #define devm_kzalloc(dev, size, flags)	_xzalloc(size, sizeof(void *))
 #define kmalloc_array(size, n, flags)	_xmalloc_array(size, sizeof(void *), n)
-#define kzalloc_array(size, n, flags)	_xzalloc_array(size, sizeof(void *), n)
+#define devm_kcalloc(dev, n, size, flags)			\
+	_xzalloc_array(size, sizeof(void *), n)
 
 static void __iomem *devm_ioremap_resource(struct device *dev,
 					   struct resource *res)
@@ -2222,7 +2223,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
 
 		/* Zero-initialised to mark as invalid */
-		smmu->smrs = kzalloc_array(sizeof(*smmu->smrs), size, GFP_KERNEL);
+		smmu->smrs = devm_kcalloc(smmu->dev, size, sizeof(*smmu->smrs),
+								GFP_KERNEL);
 		if (!smmu->smrs)
 			return -ENOMEM;
 
-- 
2.17.1


