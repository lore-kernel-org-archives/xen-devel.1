Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C325EB64DD
	for <xen-devel@archiver.kernel.org>; Mon, 26 Jun 2023 03:40:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.555018.866611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4w-0007E7-48; Mon, 26 Jun 2023 03:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555018.866611; Mon, 26 Jun 2023 03:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4v-00079C-EB; Mon, 26 Jun 2023 03:39:49 +0000
Received: by outflank-mailman (input) for mailman id 555018;
 Mon, 26 Jun 2023 03:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0z-0000HH-H9
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 87bbbe50-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:35:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 617721FB;
 Sun, 25 Jun 2023 20:36:27 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 96D703F64C;
 Sun, 25 Jun 2023 20:35:40 -0700 (PDT)
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
X-Inumbo-ID: 87bbbe50-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 12/52] xen/mmu: extract early uart mapping from setup_fixmap
Date: Mon, 26 Jun 2023 11:34:03 +0800
Message-Id: <20230626033443.2943270-13-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Original setup_fixmap is actually doing two seperate tasks, one is enabling
the early UART when earlyprintk on, and the other is to set up the fixmap
even when earlyprintk is not configured.

To be more dedicated and precise, the old function shall be split into two
functions, setup_early_uart and new setup_fixmap.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new patch
---
 xen/arch/arm/arm64/head.S     |  3 +++
 xen/arch/arm/arm64/mmu/head.S | 24 +++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index e63886b037..55a4cfe69e 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -258,7 +258,10 @@ real_start_efi:
         b     enable_boot_mm
 
 primary_switched:
+        bl    setup_early_uart
+#ifdef CONFIG_HAS_FIXMAP
         bl    setup_fixmap
+#endif
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
         ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 2b209fc3ce..295596aca1 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -367,24 +367,34 @@ identity_mapping_removed:
 ENDPROC(remove_identity_mapping)
 
 /*
- * Map the UART in the fixmap (when earlyprintk is used) and hook the
- * fixmap table in the page tables.
- *
- * The fixmap cannot be mapped in create_page_tables because it may
- * clash with the 1:1 mapping.
+ * Map the UART in the fixmap (when earlyprintk is used)
  *
  * Inputs:
- *   x20: Physical offset
  *   x23: Early UART base physical address
  *
  * Clobbers x0 - x3
  */
-ENTRY(setup_fixmap)
+ENTRY(setup_early_uart)
 #ifdef CONFIG_EARLY_PRINTK
         /* Add UART to the fixmap table */
         ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
         create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
+        /* Ensure any page table updates made above have occurred. */
+        dsb   nshst
+
+        ret
 #endif
+ENDPROC(setup_early_uart)
+
+/*
+ * Map the fixmap table in the page tables.
+ *
+ * The fixmap cannot be mapped in create_page_tables because it may
+ * clash with the 1:1 mapping.
+ *
+ * Clobbers x0 - x3
+ */
+ENTRY(setup_fixmap)
         /* Map fixmap into boot_second */
         ldr   x0, =FIXMAP_ADDR(0)
         create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
-- 
2.25.1


