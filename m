Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA20C433EF
	for <xen-devel@archiver.kernel.org>; Wed,  4 May 2022 17:15:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.320932.541916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmIaz-0007xV-RJ; Wed, 04 May 2022 17:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320932.541916; Wed, 04 May 2022 17:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmIaz-0007xO-OP; Wed, 04 May 2022 17:15:25 +0000
Received: by outflank-mailman (input) for mailman id 320932;
 Wed, 04 May 2022 17:15:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mWz8=VM=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1nmIay-0007xH-Qj
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 17:15:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c7f3bf00-cbcd-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 19:15:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26DEE1042;
 Wed,  4 May 2022 10:15:22 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3644B3FA27;
 Wed,  4 May 2022 10:15:21 -0700 (PDT)
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
X-Inumbo-ID: c7f3bf00-cbcd-11ec-8fc4-03012f2f19d4
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/its: enable LPIs before mapping the collection table
Date: Wed,  4 May 2022 18:15:12 +0100
Message-Id: <b19768d1db24123c76e50a410965582502937bb4.1651684160.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Xen boots on the platform that implements the GIC 600, ITS
MAPC_LPI_OFF uncorrectable command error issue is observed.

As per the GIC-600 TRM (Revision: r1p6) MAPC_LPI_OFF command error can
be reported if the MAPC command has tried to map a collection to a core
that does not have LPIs enabled. The definition of GICR.EnableLPIs
also suggests enabling the LPIs before sending any ITS command that
involves LPIs

0b0 LPI support is disabled. Any doorbell interrupt generated as a
    result of a write to a virtual LPI register must be discarded,
    and any ITS translation requests or commands involving LPIs in
    this Redistributor are ignored.

0b1 LPI support is enabled.

To fix the MAPC command error issue, enable the LPIs using
GICR_CTLR.EnableLPIs before mapping the collection table.

gicv3_enable_lpis() is using writel_relaxed(), write to the GICR_CTLR
register may not be visible before gicv3_its_setup_collection() send the
MAPC command. Use wmb() after writel_relaxed() to make sure register
write to enable LPIs is visible.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
v2 changes:
- Add more info about issue in commit msg and specification details.
- Use wmb() after writel_relaxed() to make sure register write to enable LPIs
  is visible
---
 xen/arch/arm/gic-v3.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 3c472ed768..64b36cec25 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -696,6 +696,9 @@ static bool gicv3_enable_lpis(void)
     val = readl_relaxed(GICD_RDIST_BASE + GICR_CTLR);
     writel_relaxed(val | GICR_CTLR_ENABLE_LPIS, GICD_RDIST_BASE + GICR_CTLR);
 
+    /* Make sure the GIC has seen the above */
+    wmb();
+
     return true;
 }
 
@@ -812,11 +815,11 @@ static int gicv3_cpu_init(void)
     /* If the host has any ITSes, enable LPIs now. */
     if ( gicv3_its_host_has_its() )
     {
+        if ( !gicv3_enable_lpis() )
+            return -EBUSY;
         ret = gicv3_its_setup_collection(smp_processor_id());
         if ( ret )
             return ret;
-        if ( !gicv3_enable_lpis() )
-            return -EBUSY;
     }
 
     /* Set priority on PPI and SGI interrupts */
-- 
2.25.1


