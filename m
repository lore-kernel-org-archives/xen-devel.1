Return-Path: <SRS0=xmOv=JR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579D1C433B4
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 07:09:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2067F611F2
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 07:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2067F611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.113318.215978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVr-0006rs-78; Tue, 20 Apr 2021 07:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113318.215978; Tue, 20 Apr 2021 07:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVr-0006rc-2e; Tue, 20 Apr 2021 07:09:35 +0000
Received: by outflank-mailman (input) for mailman id 113318;
 Tue, 20 Apr 2021 07:09:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8gRw=JR=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lYkVp-0006Ja-OD
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 07:09:33 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7712d985-1e7d-4a66-9b7f-6dea885bf582;
 Tue, 20 Apr 2021 07:09:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80A631474;
 Tue, 20 Apr 2021 00:09:13 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.29.239])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C7C13F85F;
 Tue, 20 Apr 2021 00:09:12 -0700 (PDT)
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
X-Inumbo-ID: 7712d985-1e7d-4a66-9b7f-6dea885bf582
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH 6/9] arm/page: Get rid of READ/WRITE_SYSREG32
Date: Tue, 20 Apr 2021 09:08:50 +0200
Message-Id: <20210420070853.8918-7-michal.orzel@arm.com>
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

Modify accesses to CTR_EL0 to use READ/WRITE_SYSREG.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/include/asm-arm/page.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/page.h b/xen/include/asm-arm/page.h
index 131507a517..c6f9fb0d4e 100644
--- a/xen/include/asm-arm/page.h
+++ b/xen/include/asm-arm/page.h
@@ -137,10 +137,10 @@ extern size_t dcache_line_bytes;
 
 static inline size_t read_dcache_line_bytes(void)
 {
-    uint32_t ctr;
+    register_t ctr;
 
     /* Read CTR */
-    ctr = READ_SYSREG32(CTR_EL0);
+    ctr = READ_SYSREG(CTR_EL0);
 
     /* Bits 16-19 are the log2 number of words in the cacheline. */
     return (size_t) (4 << ((ctr >> 16) & 0xf));
-- 
2.29.0


