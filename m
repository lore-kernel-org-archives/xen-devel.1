Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05C1CD4F24
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2026 17:10:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1307275.1578998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc6-00062Q-DI; Tue, 12 May 2026 17:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307275.1578998; Tue, 12 May 2026 17:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc6-00062I-AP; Tue, 12 May 2026 17:09:46 +0000
Received: by outflank-mailman (input) for mailman id 1307275;
 Tue, 12 May 2026 17:09:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqc4-0005cE-PB
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqc4-00AZDT-64
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ece-e002-0a2a0a5209dd-0a2a4503d7ac-8
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:44 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ed8-672d-0a2a45030019-d155802ac93e-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:44 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so36427515e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:44 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605783; x=1779210583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8mWSeU/iVgrcW8itSSelUy+85kdfMSQifdUDUET2DY=;
        b=LTPP27S+Io1RZQjOui0W3qz/JnNkHBqUjIVY3wmDAlNzQfCa8vrYp7qL/fbtTIc7OQ
         hJpFIsh2h5sMTl/qwY8UAzcwT2Kpg3yrNxFtWFNIV+nCb+LwmGImTpkGGCOCTQ0XHyoQ
         O/A3/ro7kMd3J6WHhLKBSD8jpv6TQD0pudvISbCvlhl2A+ae3Bh5uTEJ3NYavcU3FcT8
         wNgSXYroYryWf49b1i8T4mQmmmz9/dxA4YOIyiRvmpqEJLHv5gSYyGwz3qUlnT+89gDh
         Re+0wJdz+1zFqw8TVBKk48nyyWHYsXVxF5sesObe1xJ9XkdpilXZjx1QSP22P5D11F/T
         y4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605783; x=1779210583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b8mWSeU/iVgrcW8itSSelUy+85kdfMSQifdUDUET2DY=;
        b=E10hxMnlujv+pfw7jv8DZjTaWMhSMJXWj7/1I2lo/dOYC6A49CUEBpVDF57K1vnaKv
         cqm3HOZ4lASRg5sjc4OXe4ZenQzLvOMOH/g91MnmZ4aQHQ/HWU+Ipvm9BFrUW0ofq/Kt
         i/fdtBEgO+rnS4B/+m5s5oGll/mFlLHZrRUxm36VXLnrhpmvqaIzA7aqTnxzis57nqPb
         tQbdVEeKVAJsjteJaUrACO6GvF7wyl4vKTttgKA6J7gsgr3z/AD2DAaDBXLf/YdPfidv
         dBXZH6VDtFbgcN4iH6HJYnlxdskEg66ELZCRlz4WGalodUT7Oi5RKkwkCczcZt1Mdbq1
         jqew==
X-Gm-Message-State: AOJu0YyUG4zpY0blEwCqNL+qBeZ4/U5LDaelOzGlfD5Y5uCwgcdBOgaC
	H15l6fdFYN7bIKeorzrwNFeugdKVSeI8pihQzBUdJtIvxYhcLIiboKdWl5rsgg==
X-Gm-Gg: Acq92OG/R6lU0U+iucan/6yYLwJY678mJXxXDHRzumHdDiSlaNNoQJSacgSrjQZ0ApS
	/CRArLJOBn7d6YEt55beP2zSebZQmHFk372dbTtmFldHbEfAyeSeKLLlXwWeTg5Vi5XDFmM5tqY
	NbW5wcQPHy1rvrtC3rd92r3E86NbZVqD/YWv2cTSFtvCxaCNX8xRMXHrF0kqpW5IfNamLZpojdb
	Jhoq4UTrQZVhEgovWCb071++vmZ9UEc3/YSB0tFwq5EVmK/cZnfDUloDSkb+Ixg0FwvBMuEq7bL
	sjpyfDoNwufLkNuSDfs5rEofr5eqIsysTS6dSd/1q6gfi7K8SA6wOjIJeJS+Rf423uOfO1E9jIN
	C8oo9WhbmXHbk6XwFOaihbcnV3oa5lxPCFv8LnjU8PNzzAMh0IppvtTCw3eWzmwsE2KIJCpQ+b2
	s8z+thUo5EnuwcxZrj32xmvke9Og==
X-Received: by 2002:a05:600c:c166:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-48e8fe7227cmr61787625e9.14.1778605783038;
        Tue, 12 May 2026 10:09:43 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
Date: Tue, 12 May 2026 20:07:09 +0300
Message-ID: <613c8d67a66924ea62c2436dac14708d939f6784.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1778605784-37141938-096D7344/0/0
X-purgate-type: clean
X-purgate-size: 11669

From: Mirela Simonovic <mirela.simonovic@aggios.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Transient physical SGI pending state (GICD_CPENDSGIRn/GICD_SPENDSGIRn)
is intentionally excluded. CPU-interface active-priority state is also
not restored across suspend/resume. Xen reaches the final suspend path
at a quiescent point, so there is no active-priority execution context
to replay after resume. Enforce this with a runtime check after
disabling the CPU interface: if any implemented GICC_APRn word is still
non-zero, restore GICC_CTLR and abort suspend with -EBUSY.

This does not apply to distributor active state. With GICv2 EOImode==1,
EOIR only drops the interrupt priority; final deactivation is a separate
step. For guest-routed interrupts, Xen can have already EOIed the physical
IRQ while deactivation is still pending on the vGIC/GICV path. Therefore
GICD_ISACTIVER is preserved as architectural in-flight interrupt state.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V9:
- Skip saving/restoring GICD_ITARGETSR0..7 because SGI/PPI target
  registers hold no state (read-only on MP, RAZ/WI on UP).
- Add a runtime GICC_APRn quiescence check after disabling the CPU
  interface, and restore GICC_CTLR before returning -EBUSY.

Changes in V8:
- disable cpu interface + distributor before suspend
- change 0xffffffff to GENMASK;
- cosmetic changes;

Changes in V7:
- Allocate one contiguous memory block for the GICv2 dist suspend context.
- gicv2_resume() no longer unconditionally re-enables the distributor/CPU
  interface; it now writes back the saved CTLR values as-is.
- gicv2_alloc_context() now returns 0 on success and panics on failure,
  since suspend context allocation is not recoverable.
---
 xen/arch/arm/gic-v2.c          | 181 +++++++++++++++++++++++++++++++++
 xen/arch/arm/gic.c             |  29 ++++++
 xen/arch/arm/include/asm/gic.h |  12 +++
 3 files changed, 222 insertions(+)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 43a379fdda..1970c4feb9 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1108,6 +1108,178 @@ static int gicv2_iomem_deny_access(struct domain *d)
     return iomem_deny_access(d, mfn, mfn + nr - 1);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represents block of 32 IRQs */
+struct irq_block {
+    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
+    uint32_t ipriorityr[8];
+    uint32_t isenabler;
+    uint32_t isactiver;
+    uint32_t itargetsr[8];
+};
+
+/* GICv2 registers to be saved/restored on system suspend/resume */
+struct gicv2_context {
+    /* GICC context */
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+    } cpu;
+
+    /* GICD context */
+    struct dist_ctx {
+        uint32_t ctlr;
+        /* Includes banked SGI/PPI state for the boot CPU. */
+        struct irq_block *irqs;
+    } dist;
+};
+
+static struct gicv2_context gic_ctx;
+
+#define GICV2_NR_APRS 4
+
+static int gicv2_suspend(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    /* Save GICC_CTLR configuration. */
+    gic_ctx.cpu.ctlr = readl_gicc(GICC_CTLR);
+
+    /* Quiesce the GIC CPU interface before suspend. */
+    gicv2_cpu_disable();
+
+    /*
+     * Check the active-priority state for the group Xen drives through the
+     * CPU interface. GICC_CTL_ENABLE enables Group 0 without SecurityExtn and
+     * Group 1 in Xen's Non-secure view with SecurityExtn, and in both cases
+     * the relevant state is visible through GICC_APRn. Only zero/non-zero
+     * matters here, not the implementation-defined bit layout.
+     */
+    for ( i = 0; i < GICV2_NR_APRS; i++ )
+    {
+        uint32_t apr = readl_gicc(GICC_APR + i * 4);
+
+        if ( !apr )
+            continue;
+
+        printk(XENLOG_ERR "GICv2: suspend aborted: GICC_APR%u=%#08x\n", i, apr);
+        writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+        return -EBUSY;
+    }
+
+    /* Save GICD configuration */
+    gic_ctx.dist.ctlr = readl_gicd(GICD_CTLR);
+    writel_gicd(0, GICD_CTLR);
+
+    gic_ctx.cpu.pmr = readl_gicc(GICC_PMR);
+    gic_ctx.cpu.bpr = readl_gicc(GICC_BPR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+
+        irqs->isenabler = readl_gicd(GICD_ISENABLER + off);
+
+        /*
+         * Save distributor active state as part of the hypervisor-owned
+         * physical interrupt state. In GICv2 EOImode==1, EOIR only drops the
+         * priority; final deactivation is separate. For guest-routed
+         * interrupts, Xen may have EOIed the physical IRQ while the guest/vGIC
+         * side still owns the deactivate step. Therefore GICD_ISACTIVER can
+         * legitimately remain set even though transient SGI pending state and
+         * CPU-interface active-priority state are expected to be quiesced here.
+         */
+        irqs->isactiver = readl_gicd(GICD_ISACTIVER + off);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
+            irqs->ipriorityr[j] = readl_gicd(GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < ARRAY_SIZE(irqs->itargetsr); j++ )
+                irqs->itargetsr[j] = readl_gicd(GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            irqs->icfgr[j] = readl_gicd(GICD_ICFGR + off + j * 4);
+    }
+
+    return 0;
+}
+
+static void gicv2_resume(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gicv2_cpu_disable();
+    /* Disable distributor */
+    writel_gicd(0, GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICENABLER + off);
+        writel_gicd(irqs->isenabler, GICD_ISENABLER + off);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICACTIVER + off);
+        writel_gicd(irqs->isactiver, GICD_ISACTIVER + off);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
+            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < ARRAY_SIZE(irqs->itargetsr); j++ )
+                writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
+    }
+
+    /* Make sure all registers are restored and enable distributor */
+    writel_gicd(gic_ctx.dist.ctlr, GICD_CTLR);
+
+    /* Restore GIC CPU interface configuration */
+    writel_gicc(gic_ctx.cpu.pmr, GICC_PMR);
+    writel_gicc(gic_ctx.cpu.bpr, GICC_BPR);
+
+    /* Enable GIC CPU interface */
+    writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+}
+
+static void __init gicv2_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gic_ctx.dist.irqs = xzalloc_array(struct irq_block, blocks);
+    if ( !gic_ctx.dist.irqs )
+        panic("Failed to allocate memory for GICv2 suspend context\n");
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #ifdef CONFIG_ACPI
 static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
 {
@@ -1312,6 +1484,11 @@ static int __init gicv2_init(void)
 
     spin_unlock(&gicv2.lock);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Allocate memory to be used for saving GIC context during the suspend */
+    gicv2_alloc_context();
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
     return 0;
 }
 
@@ -1355,6 +1532,10 @@ static const struct gic_hw_operations gicv2_ops = {
     .map_hwdom_extra_mappings = gicv2_map_hwdom_extra_mappings,
     .iomem_deny_access   = gicv2_iomem_deny_access,
     .do_LPI              = gicv2_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv2_suspend,
+    .resume              = gicv2_resume,
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 /* Set up the GIC */
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ee75258fc3..7727ffed5a 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -432,6 +432,35 @@ int gic_iomem_deny_access(struct domain *d)
     return gic_hw_ops->iomem_deny_access(d);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+int gic_suspend(void)
+{
+    /* Must be called by boot CPU#0 with interrupts disabled */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+
+    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
+        return -ENOSYS;
+
+    return gic_hw_ops->suspend();
+}
+
+void gic_resume(void)
+{
+    /*
+     * Must be called by boot CPU#0 with interrupts disabled after gic_suspend
+     * has returned successfully.
+     */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+    ASSERT(gic_hw_ops->resume);
+
+    gic_hw_ops->resume();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_gic_callback(struct notifier_block *nfb,
                             unsigned long action,
                             void *hcpu)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index ff22dea40d..fbf0d69edd 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -301,6 +301,12 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/* Suspend/resume */
+extern int gic_suspend(void);
+extern void gic_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* SGI (AKA IPIs) */
 enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
@@ -444,6 +450,12 @@ struct gic_hw_operations {
     int (*iomem_deny_access)(struct domain *d);
     /* Handle LPIs, which require special handling */
     void (*do_LPI)(unsigned int lpi);
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Save GIC configuration due to the system suspend */
+    int (*suspend)(void);
+    /* Restore GIC configuration due to the system resume */
+    void (*resume)(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 extern const struct gic_hw_operations *gic_hw_ops;
-- 
2.43.0


