Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634DBFF8868
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2026 12:00:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1295631.1572276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh6y-0003uz-2j; Tue, 28 Apr 2026 12:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295631.1572276; Tue, 28 Apr 2026 12:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh6x-0003us-VG; Tue, 28 Apr 2026 12:00:19 +0000
Received: by outflank-mailman (input) for mailman id 1295631;
 Tue, 28 Apr 2026 12:00:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wHh6w-0003ui-4X
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:00:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHh6v-0085f6-GT
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:00:17 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f0a151-2eae-0a2a0a5409dd-0a2a45068db6-0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:00:17 +0200
Received: from [209.85.167.54] (helo=mail-lf1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f0a151-7371-0a2a45060019-d155a736e54b-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:00:17 +0200
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5a2b636b944so15909019e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 05:00:17 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.216])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a7462d5874sm565531e87.30.2026.04.28.05.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 05:00:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777377616; x=1777982416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cV194dS4Y9gm/XzkIef3s5vtQr1HG+oamEfHcdXX4Xw=;
        b=PxRPCeA13mglDuJKePeDqP0UV4ztMYSp8CgnajdsajH7mTXA7wSdS2yQ7DlOL2DLLs
         IkcGcVWY6CY2oIYF1ypm2UetC/USaqoUmkcL0jEzRNc7I4mjPyiNsnrbDf2GFZ1UeOyD
         SfJKRSRo5VtddgEswL3z+kQ1XtHPKMF+ykaRgl71a9rbK5t8CEvlJnzEb5aydqb89LoP
         tWziiZ0Rah+9kMUzlySUk+2MqFEpS9TRVl6qe/bk0Dt4IX7fb9rNmGc5aJ/bp7Uk/RXk
         GM51MeN6gYFz2GZqtzz6Fd8qLUDzPSSWkRJFOgmF7Rvyi0HZqSlKvGkFVPD/hhFEJn97
         2VLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377616; x=1777982416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV194dS4Y9gm/XzkIef3s5vtQr1HG+oamEfHcdXX4Xw=;
        b=KJHuZxdS83rP2gU1z2xrIB0JhYdUW17EAO8VGJSZiIOQZwmY5v7xwdl0DMXpTDOWcT
         EvQ2zZiL7WwzEl526h6Sy8pAGO+q6xtoXsNrLfwVbzPAJ9SF2+Ka+lgg6ucCA+fM9CLv
         jXZnHwBZRsSc/lHnaPC1kzcj9xjD1d80Bdqj+IFUqnrW84mckvLilJCf79v2KMEN5QPH
         WqnG+UZbCdWjnqvPyumd7Z/ggzeP2k2rKTNIzAGMQ9Uj+CRcrDonGpxV6b+fmvvMsx+g
         47mtwFKgM9/tLlIb89c7/JduDxlLdmqfEAj+sc4LmK+rfzaTygDmm6g7LS/fwxwsrVap
         VzMw==
X-Gm-Message-State: AOJu0YwwM+1v3SAzKiw28Z7TBL6MbXHEl8zBcR24KqhypsVJUsZz222C
	7Jsq2760PbYWrLAxvFsN1CdSUBEN77/9jDlqV1HZ8MuRtuB5CL/gAUqh4XqfcA==
X-Gm-Gg: AeBDiesF6LRmnDMcMnqn+210QOA3qvlOR82MCO/kt6xrccsmLZI73YvElnvjTM7XWIU
	9SQ2dxWQXi5SPzorMiy/0rV04GMr7DNgfZjsovodqGzs1HwLsERLUmguSrmisVjMT5Mgk6+1xU+
	PzevcyHyzYOStN7gmA8eQ48ByHl0iIH0QeU2TfGOgM9twE2QLumYLLDN5Ili6s040r1SfLRefU0
	D3f+TAnKXoQYnNhLPmpJWFXZPngAHSC78bO33YKPHU5o+bNwUT19Fwfuba8S8dFqzw7Soe6HCfL
	NGzUdodfO33q/j5nDykw8hw05z/tvu2T7/wVO5Sy/yaPYGl/kCKA606gswLgUkdNmczAjHEs8uz
	kZFK/GlDC8AzEvWBHt5LZ3V+xXQokT11ZJ5ycjqvRcXtR3rBD6CTvZeBYTv4CU11qp7YddGRblQ
	1FyWR+ymTfducGhrRI4QeKqFsKk6VeS2DxBLFnwPafWd7VhMVX
X-Received: by 2002:a05:6512:1046:b0:5a2:c409:8ed3 with SMTP id 2adb3069b0e04-5a7466179efmr1005797e87.40.1777377615327;
        Tue, 28 Apr 2026 05:00:15 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: gic-v2: disable interrupt bypass on CPU shutdown
Date: Tue, 28 Apr 2026 14:57:55 +0300
Message-ID: <18c5532816d852fca073d0552dcb6d497730a6c2.1777377278.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1777377617-90E7CD75-8B022F77/0/0
X-purgate-type: clean
X-purgate-size: 4201

From: Mykola Kvach <mykola_kvach@epam.com>

The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.

Per IHI0048B.b section 2.3.1, clearing the architected bypass-disable
bits selects bypass rather than deasserted interrupt outputs when the
CPU interface stops driving them. Tables 2-2 and 2-3 show that a zeroed
GICC_CTLR can fall back to the legacy IRQ/FIQ inputs instead of fully
disabling the interface.

Fix this by reading GICC_CTLR, then setting the bypass-disable bits and
clearing the group-enable bits that are architecturally defined for the
current GICC_CTLR view before writing the value back. When Security
Extensions are implemented Xen accesses the Non-secure copy of
GICC_CTLR, where IRQBypDisGrp1 and FIQBypDisGrp1 are at bits [6:5] and
bits [8:7] are reserved.

Without Security Extensions there is no separate Secure/Non-secure CPU
interface view, so disabling both group-enable bits affects the shared
interface state. This is still appropriate for the CPU shutdown path,
which is expected to stop normal interrupt delivery through the interface
and rely only on the architecturally separate wakeup event signaling.

Section 2.3.2 also states that wakeup event signals remain available
even when both GIC interrupt signaling and interrupt bypass are
disabled, so disabling bypass does not break the power-management use
case, i.e. suspend modes.

Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

---
Changes in v2:
- derive the shutdown masks from the active GICC_CTLR layout
- use the Non-secure GICC_CTLR layout when GICD_TYPER.SecurityExtn is set
- stop writing reserved bits [8:7] on Security Extensions systems
---
 xen/arch/arm/gic-v2.c          | 16 +++++++++++++++-
 xen/arch/arm/include/asm/gic.h | 25 +++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 014f955967..241c1ff5c5 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -408,7 +408,21 @@ static void gicv2_cpu_init(void)
 
 static void gicv2_cpu_disable(void)
 {
-    writel_gicc(0x0, GICC_CTLR);
+    uint32_t ctlr = readl_gicc(GICC_CTLR);
+
+    if ( readl_gicd(GICD_TYPER) & GICD_TYPE_SEC )
+    {
+        ctlr |= GICC_NS_CTLR_BYPASS_DISABLE_GRP1_MASK;
+        ctlr &= ~GICC_CTL_ENABLE;
+    }
+    else
+    {
+        ctlr |= GICC_CTLR_BYPASS_DISABLE_GRP0_MASK |
+                GICC_CTLR_BYPASS_DISABLE_GRP1_MASK;
+        ctlr &= ~(GICC_CTL_ENABLE | GICC_CTL_ENABLE_GRP1);
+    }
+
+    writel_gicc(ctlr, GICC_CTLR);
 }
 
 static void gicv2_hyp_init(void)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 8e713aa477..ff22dea40d 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -102,8 +102,29 @@
 #define GICD_TYPE_SEC   0x400
 #define GICD_TYPER_DVIS (1U << 18)
 
-#define GICC_CTL_ENABLE 0x1
-#define GICC_CTL_EOI    (0x1 << 9)
+/*
+ * Xen runs in the Non-secure world. When Security Extensions are present,
+ * Xen accesses the Non-secure GICC_CTLR view, where bit[0] is EnableGrp1
+ * and bits[6:5] are the Group 1 bypass-disable bits. Otherwise Xen sees the
+ * common GICC_CTLR layout, where bit[0] is EnableGrp0, bit[1] is EnableGrp1,
+ * bits[6:5] are the Group 0 bypass-disable bits, and bits[8:7] are the
+ * Group 1 bypass-disable bits.
+ */
+#define GICC_CTL_ENABLE        (0x1 << 0)
+#define GICC_CTL_ENABLE_GRP1   (0x1 << 1)
+#define GICC_CTL_FIQBypDisGrp0 (0x1 << 5)
+#define GICC_CTL_IRQBypDisGrp0 (0x1 << 6)
+#define GICC_CTL_FIQBypDisGrp1 (0x1 << 7)
+#define GICC_CTL_IRQBypDisGrp1 (0x1 << 8)
+
+#define GICC_CTLR_BYPASS_DISABLE_GRP0_MASK              \
+    (GICC_CTL_FIQBypDisGrp0 | GICC_CTL_IRQBypDisGrp0)
+#define GICC_CTLR_BYPASS_DISABLE_GRP1_MASK              \
+    (GICC_CTL_FIQBypDisGrp1 | GICC_CTL_IRQBypDisGrp1)
+#define GICC_NS_CTLR_BYPASS_DISABLE_GRP1_MASK           \
+    GICC_CTLR_BYPASS_DISABLE_GRP0_MASK
+
+#define GICC_CTL_EOI           (0x1 << 9)
 
 #define GICC_IA_IRQ       0x03ff
 #define GICC_IA_CPU_MASK  0x1c00
-- 
2.43.0


