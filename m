Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14DFF588E0
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 14:25:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286088.1567218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZD-0004kf-IJ; Mon, 20 Apr 2026 14:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286088.1567218; Mon, 20 Apr 2026 14:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZD-0004jM-ES; Mon, 20 Apr 2026 14:25:39 +0000
Received: by outflank-mailman (input) for mailman id 1286088;
 Mon, 20 Apr 2026 14:25:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpZC-0004bZ-Td
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:25:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpZC-00BFc6-9u
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:25:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63760-2eae-0a2a0a5409dd-0a2a450882fc-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:37 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63761-63b5-0a2a45080019-d98c6eac96be-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:37 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5300916F2;
 Mon, 20 Apr 2026 07:25:31 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9A5C3F7B4;
 Mon, 20 Apr 2026 07:25:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776695136; bh=zydSLBd6tN5qexvU/dn56PdspdQkRiPjvNZz/rLJDIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S8XRPHeMliAOMeBJjotCrRwclZtbZiPa/8onyrk1Y/8K4Rnnxfk2/nqWtrOyPljAD
	 cAREu9wb91FmJFuKP8XtSqPxOMMvHdzI6CtOGP6jhbEBE3qfyF7GB45Vra1iAz3sG4
	 jdd8cmIyTM/X1GqKEe6Q95TxRQ3zw1665byMvIoA=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 3/8] xen/mpu: enable device passthrough in MPU system
Date: Mon, 20 Apr 2026 15:25:19 +0100
Message-Id: <20260420142524.1804073-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420142524.1804073-1-luca.fancellu@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1776695137-C1F6ADB1-76E20B7C/0/0
X-purgate-type: clean
X-purgate-size: 1422

From: Penny Zheng <Penny.Zheng@arm.com>

In order to enable device passthrough in MPU system, we only need to
provide p2m_mmio_direct_dev permission set up.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/mpu/p2m.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index 681717eacf37..f2482237412b 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -13,6 +13,7 @@
 static inline unsigned int build_p2m_flags(p2m_type_t t)
 {
     unsigned int flags = 0;
+    unsigned int attr_idx = MT_NORMAL;
 
     BUILD_BUG_ON(p2m_max_real_type > (1 << 4));
 
@@ -30,11 +31,15 @@ static inline unsigned int build_p2m_flags(p2m_type_t t)
         flags |= _PAGE_XN | _PAGE_RO;
         break;
 
+    case p2m_mmio_direct_dev:
+        flags |= _PAGE_XN;
+        attr_idx = MT_DEVICE_nGnRE;
+        break;
+
     case p2m_max_real_type:
         BUG();
         break;
 
-    case p2m_mmio_direct_dev:
     case p2m_mmio_direct_nc:
     case p2m_mmio_direct_c:
     case p2m_iommu_map_ro:
@@ -47,7 +52,7 @@ static inline unsigned int build_p2m_flags(p2m_type_t t)
         break;
     }
 
-    flags |= MT_NORMAL;
+    flags |= attr_idx;
 
     return flags;
 }
-- 
2.34.1


