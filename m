Return-Path: <SRS0=xmOv=JR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D71C433B4
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 07:09:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59AD561220
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 07:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59AD561220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.113314.215966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVm-0006kh-Pa; Tue, 20 Apr 2021 07:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113314.215966; Tue, 20 Apr 2021 07:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVm-0006kX-LP; Tue, 20 Apr 2021 07:09:30 +0000
Received: by outflank-mailman (input) for mailman id 113314;
 Tue, 20 Apr 2021 07:09:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8gRw=JR=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lYkVk-0006Ja-Nu
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 07:09:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c0dce763-5849-4b01-a9c2-2b35e0483262;
 Tue, 20 Apr 2021 07:09:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24EB91435;
 Tue, 20 Apr 2021 00:09:12 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.29.239])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05F603F85F;
 Tue, 20 Apr 2021 00:09:10 -0700 (PDT)
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
X-Inumbo-ID: c0dce763-5849-4b01-a9c2-2b35e0483262
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH 5/9] arm/mm: Get rid of READ/WRITE_SYSREG32
Date: Tue, 20 Apr 2021 09:08:49 +0200
Message-Id: <20210420070853.8918-6-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210420070853.8918-1-michal.orzel@arm.com>
References: <20210420070853.8918-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AArch64 system registers are 64bit whereas AArch32 ones
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.
We should also use register_t type when reading sysregs
which can correspond to uint64_t or uint32_t.
Even though many AArch64 sysregs have upper 32bit reserved
it does not mean that they can't be widen in the future.

Modify SCTLR_EL2 accesses to use READ/WRITE_SYSREG.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/mm.c    | 2 +-
 xen/arch/arm/traps.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 59f8a3f15f..0e07335291 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -613,7 +613,7 @@ void __init remove_early_mappings(void)
  */
 static void xen_pt_enforce_wnx(void)
 {
-    WRITE_SYSREG32(READ_SYSREG32(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
+    WRITE_SYSREG(READ_SYSREG(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
     /*
      * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
      * before flushing the TLBs.
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index c7acdb2087..e7384381cc 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -915,7 +915,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
     printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
     printk("\n");
 
-    printk(" SCTLR_EL2: %08"PRIx32"\n", READ_SYSREG32(SCTLR_EL2));
+    printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
     printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
     printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
     printk("\n");
-- 
2.29.0


