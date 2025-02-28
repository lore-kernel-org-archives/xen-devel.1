Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A1FC282C1
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2025 16:18:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.898960.1307449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34M-0004Ve-PM; Fri, 28 Feb 2025 16:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898960.1307449; Fri, 28 Feb 2025 16:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34M-0004UX-Gz; Fri, 28 Feb 2025 16:18:34 +0000
Received: by outflank-mailman (input) for mailman id 898960;
 Fri, 28 Feb 2025 16:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/q7=VT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1to34L-0003Ub-M6
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:18:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a78a906d-f5ef-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 17:18:33 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9EA7176A;
 Fri, 28 Feb 2025 08:18:47 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87CE23F5A1;
 Fri, 28 Feb 2025 08:18:31 -0800 (PST)
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
X-Inumbo-ID: a78a906d-f5ef-11ef-9aaf-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/9] arm/mpu: Introduce utility functions for the pr_t type
Date: Fri, 28 Feb 2025 16:18:13 +0000
Message-Id: <20250228161817.3342443-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228161817.3342443-1-luca.fancellu@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce few utility function to manipulate and handle the
pr_t type.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index c63a9e6e5455..3a09339818a0 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -50,6 +50,42 @@ typedef struct {
     prlar_t prlar;
 } pr_t;
 
+/* Set base address of MPU protection region(pr_t). */
+static inline void pr_set_base(pr_t *pr, paddr_t base)
+{
+    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
+}
+
+/* Set limit address of MPU protection region(pr_t). */
+static inline void pr_set_limit(pr_t *pr, paddr_t limit)
+{
+    pr->prlar.reg.limit = ((limit - 1) >> MPU_REGION_SHIFT);
+}
+
+/*
+ * Access to get base address of MPU protection region(pr_t).
+ * The base address shall be zero extended.
+ */
+static inline paddr_t pr_get_base(pr_t *pr)
+{
+    return (paddr_t)(pr->prbar.reg.base << MPU_REGION_SHIFT);
+}
+
+/*
+ * Access to get limit address of MPU protection region(pr_t).
+ * The limit address shall be concatenated with 0x3f.
+ */
+static inline paddr_t pr_get_limit(pr_t *pr)
+{
+    return (paddr_t)((pr->prlar.reg.limit << MPU_REGION_SHIFT)
+                     | ~MPU_REGION_MASK);
+}
+
+static inline bool region_is_valid(pr_t *pr)
+{
+    return pr->prlar.reg.en;
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ARM64_MPU_H__ */
-- 
2.34.1


