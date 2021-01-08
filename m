Return-Path: <SRS0=/Lw+=GL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A146C433DB
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 19:23:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05FFC23A9B
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 19:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05FFC23A9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.63808.113149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxxLU-0005Cb-E4; Fri, 08 Jan 2021 19:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63808.113149; Fri, 08 Jan 2021 19:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxxLU-0005CU-At; Fri, 08 Jan 2021 19:22:48 +0000
Received: by outflank-mailman (input) for mailman id 63808;
 Fri, 08 Jan 2021 19:22:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkaL=GL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kxxLS-0005CP-N0
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 19:22:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4b4cb00-b856-4960-97f4-109e75fbd829;
 Fri, 08 Jan 2021 19:22:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24FBB23A9B;
 Fri,  8 Jan 2021 19:22:45 +0000 (UTC)
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
X-Inumbo-ID: c4b4cb00-b856-4960-97f4-109e75fbd829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610133765;
	bh=VcCnKhlvAIal1HEWiKu/4DIc/8/pap0Opnq4gl9VYk8=;
	h=From:To:Cc:Subject:Date:From;
	b=pz3GxDeInu9RFUf8SMkQfo1n8cU7s7FT3V82i9nAzRu7Ba/zLsQoQZ7WfYBdDDMvG
	 ChZtihlFtOyvVWSlea0gPeT5q7IJACvF3PDWYNo8XBFbD5yDiskk/yHpwKz9OKzLS8
	 NLqZwD3cSHYVWAXGAktSXJPgA4xJiCZs91dJZaEAZjmj8/w8/vDejZnvVLIHomiLuZ
	 Nl8HHTYX6PIZd/r+CpYzXrgFDxLb+t/yuDNNg3sFSeeF8XYprt1inOSpo5iozPPEp+
	 phvKRCNHmw/qhsxYfjEx0005PxYeAjlQGM6+GMrjz9c6b0QpZvVR8CRfBbp/gmW+b3
	 mG5PKYX4CnUng==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
Date: Fri,  8 Jan 2021 11:22:43 -0800
Message-Id: <20210108192243.25889-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

MVFR2 is not available on ARMv7. It is available on ARMv8 aarch32 and
aarch64. If Xen reads MVFR2 on ARMv7 it could crash.

Avoid the issue by doing the following:

- define MVFR2_MAYBE_UNDEFINED on arm32
- if MVFR2_MAYBE_UNDEFINED, do not attempt to read MVFR2 in Xen
- keep the 3rd register_t in struct cpuinfo_arm.mvfr on arm32 so that a
  guest read to the register returns '0' instead of crashing the guest.

'0' is an appropriate value to return to the guest because it is defined
as "no support for miscellaneous features".

Aarch64 Xen is not affected by this patch.

Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/cpufeature.c           | 2 ++
 xen/include/asm-arm/arm32/sysregs.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 1f6a85aafe..698bfa0201 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -150,7 +150,9 @@ void identify_cpu(struct cpuinfo_arm *c)
 
         c->mvfr.bits[0] = READ_SYSREG(MVFR0_EL1);
         c->mvfr.bits[1] = READ_SYSREG(MVFR1_EL1);
+#ifndef MVFR2_MAYBE_UNDEFINED
         c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
+#endif
 }
 
 /*
diff --git a/xen/include/asm-arm/arm32/sysregs.h b/xen/include/asm-arm/arm32/sysregs.h
index 25cdcbfa4e..6841d5de43 100644
--- a/xen/include/asm-arm/arm32/sysregs.h
+++ b/xen/include/asm-arm/arm32/sysregs.h
@@ -62,6 +62,9 @@
 #define READ_SYSREG(R...)       READ_SYSREG32(R)
 #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
 
+/* MVFR2 is not defined on ARMv7 */
+#define MVFR2_MAYBE_UNDEFINED
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_ARM_ARM32_SYSREGS_H */
-- 
2.17.1


