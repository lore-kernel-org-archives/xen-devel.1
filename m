Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85683C56201
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 11:12:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D6B12073C
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 11:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D6B12073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.35767.67405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khWFW-0003P0-U7; Tue, 24 Nov 2020 11:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35767.67405; Tue, 24 Nov 2020 11:12:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khWFW-0003Ot-QF; Tue, 24 Nov 2020 11:12:42 +0000
Received: by outflank-mailman (input) for mailman id 35767;
 Tue, 24 Nov 2020 11:12:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1khWFV-0003Oo-Sn
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 11:12:41 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8476b3c8-252c-416f-b1ad-4d35d64ba8c2;
 Tue, 24 Nov 2020 11:12:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 968561396;
 Tue, 24 Nov 2020 03:12:39 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4F243F71F;
 Tue, 24 Nov 2020 03:12:38 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1khWFV-0003Oo-Sn
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 11:12:41 +0000
X-Inumbo-ID: 8476b3c8-252c-416f-b1ad-4d35d64ba8c2
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 8476b3c8-252c-416f-b1ad-4d35d64ba8c2;
	Tue, 24 Nov 2020 11:12:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 968561396;
	Tue, 24 Nov 2020 03:12:39 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4F243F71F;
	Tue, 24 Nov 2020 03:12:38 -0800 (PST)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Add workaround for Cortex-A55 erratum #1530923
Date: Tue, 24 Nov 2020 11:12:15 +0000
Message-Id: <61a105672650e7470710183f37351b821b818d1e.1606215998.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

On the Cortex A55, TLB entries can be allocated by a speculative AT
instruction. If this is happening during a guest context switch with an
inconsistent page table state in the guest, TLBs with wrong values might
be allocated.
The ARM64_WORKAROUND_AT_SPECULATE workaround is used as for erratum
1165522 on Cortex A76 or Neoverse N1.

This change is also introducing the MIDR identifier for the Cortex-A55.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 docs/misc/arm/silicon-errata.txt | 1 +
 xen/arch/arm/cpuerrata.c         | 6 ++++++
 xen/include/asm-arm/processor.h  | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
index d183ba543f..27bf957ebf 100644
--- a/docs/misc/arm/silicon-errata.txt
+++ b/docs/misc/arm/silicon-errata.txt
@@ -45,6 +45,7 @@ stable hypervisors.
 | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_827319    |
 | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_824069    |
 | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_819472    |
+| ARM            | Cortex-A55      | #1530923        | N/A                     |
 | ARM            | Cortex-A57      | #852523         | N/A                     |
 | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_832075    |
 | ARM            | Cortex-A57      | #834220         | ARM64_ERRATUM_834220    |
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index cb4795beec..b398d480f1 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -514,6 +514,12 @@ static const struct arm_cpu_capabilities arm_errata[] = {
         .capability = ARM64_WORKAROUND_AT_SPECULATE,
         MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
     },
+    {
+        /* Cortex-A55 (All versions as erratum is open in SDEN v14) */
+        .desc = "ARM erratum 1530923",
+        .capability = ARM64_WORKAROUND_AT_SPECULATE,
+        MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
+    },
     {},
 };
 
diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
index d3d12a9d19..87c8136022 100644
--- a/xen/include/asm-arm/processor.h
+++ b/xen/include/asm-arm/processor.h
@@ -53,6 +53,7 @@
 #define ARM_CPU_PART_CORTEX_A17     0xC0E
 #define ARM_CPU_PART_CORTEX_A15     0xC0F
 #define ARM_CPU_PART_CORTEX_A53     0xD03
+#define ARM_CPU_PART_CORTEX_A55     0xD05
 #define ARM_CPU_PART_CORTEX_A57     0xD07
 #define ARM_CPU_PART_CORTEX_A72     0xD08
 #define ARM_CPU_PART_CORTEX_A73     0xD09
@@ -64,6 +65,7 @@
 #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A17)
 #define MIDR_CORTEX_A15 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A15)
 #define MIDR_CORTEX_A53 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A53)
+#define MIDR_CORTEX_A55 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A55)
 #define MIDR_CORTEX_A57 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A57)
 #define MIDR_CORTEX_A72 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A72)
 #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A73)
-- 
2.17.1


