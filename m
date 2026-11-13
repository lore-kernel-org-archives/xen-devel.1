Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81990606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1e5F1k2
Received: from list by lists.xenproject.org with outflank-mailman.1487713.1689968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWc-000158-NH; Fri, 13 Nov 2026 15:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487713.1689968; Fri, 13 Nov 2026 15:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWc-000147-J0; Fri, 13 Nov 2026 15:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1487713;
 Fri, 13 Nov 2026 15:49:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWb-0000k3-1i
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWa-00Gq2H-F0
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:12 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73173-8faa-0a2a0a5109dd-0a2a4501b498-10
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:12 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73178-5984-0a2a45010019-d155dd2cb907-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:12 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-491846221ffso1207707f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:12 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:11 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584952; x=1795189752; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VqFQyL72WTet9johlcAP4deu1Ss9grGm1GdY6x1fHoo=;
        b=T1e5F1k2xHPImNEZBA3yWOra321EfhNImO24fiqFgG8M+sVbGB0rtHNTgAaACSEcuv
         Btsz90H+RXeW7VRwKuKcN5VxpK/PQNwM08yf0IfZqL8qtwGBa5PfOTqVSww0ZC96Q6i3
         8jkke+smMHYlpx9kADYEEK3SFeJSPj5O8EEcKjTHH6GTbUw77OfROcsa10gxodnreN/V
         fUKQwMy/7s8dfX60wlDlJhMJCBhaHNufH+0Szs/fQ3f7CS/8jMWHqPs2D65+fBSyt+YM
         AwH17mAApzDz9xBphyDuOX7gHV7KaI03fUdwTibdriuV8Lk1RcH26TajkKEYW6r4owvH
         7muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584952; x=1795189752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VqFQyL72WTet9johlcAP4deu1Ss9grGm1GdY6x1fHoo=;
        b=AlSpfl+nuGo8zgBp5fDuNIqXCKAsXz44JPB0sWLwFPgb1zbvVmxyB3jjCFfeodEaC7
         EWHd1epb/IhKyXypu6+3EXjUUyGS+IBHIH7pV+MTUgYF7fLTn/Z/yYMiaTuiSOAc3+sd
         5M3+vNkzx9OItbiQu0Y1HITSc+cttvoSD5u+y/ZtF4/NiRlbVPoBQYwHHNudUnpUu5EO
         WRL1PDm0v47zkuJk/7+U3i35ODIAYoz2DScsKNHK+hsBah0dBjoQhBKGq39ICnyr4EtA
         1TXUMRf5ApR2A+yCwWg8oRTXk0wumtcCYWS9q5de+Y1TZl8oN7BBPjh+dMgGdcpO6kxo
         bQ/Q==
X-Gm-Message-State: APuU4Z84ot91ubkhbiShOoIr+OlKIxmaOTahVa83rAEj3F2ZBs2gAaaZ
	e0fA5SH2XLwQiHpKdKXtqPE0yhBGQnyNzmYgU9eq6SPCn8w+GY7cxSIQx3TA2w==
X-Gm-Gg: AYBFou19+v8DgZGVmTTziraIczc2EcIJgdGfoBfsqcV7qLR2rvUslN8flHRZvN9jmSY
	TiX6YJj3af9S8fU6i6sRwIzoQ/7T4xgBHz8H9y4Zo/MUZZZD9toxw1F3LYhN2RNnoS1T4QZI271
	uqfg1XYsBBbFsdwHdQRn9JQOmm574CJ0Ubfby/ykh5RD0ex8049hcQotXRqrYabPTI6G5tm4ibQ
	kkfR4lIYYIH/A4E3k5jVafeGhUPcOKGoX8kbMCc7Jd5l7zPvoIGkoLDe9ajOnr1IkO4WBZ0qcwu
	fdqexbXzOBgsY/GYOeR7LrLIi6qcbT78pZ+uOl3aHvhnyJuppJ/RP69mUDe9y6/DrutkVQUyvFE
	JRhBa9QXC5zbKLRF/KUTQsN6VptSwBgT/vyJJ2a6msoT4GRMqyio72VCPv86GzN2srDffw2ULS/
	XpxlJGYP2t5u1icOrV1j8broaCu7VLhzn980DfQU4dXc/cL3Q2BWbxel0jEpT/yyfeyP5TQKir2
	Aa8Nfa0OPXWKzTi2icpLc004QuiBktKKeY7uij1YNTeGnmrC1S2OTY9UfDILiyGPNh33Xfzlu6r
	sxXwyvFT2V20/r4byA30MPimHWDJfcQrID2fIpKrZjZHYnhrsiwykVoyXBlbeTgXK0tDUA==
X-Received: by 2002:a5d:584b:0:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-49c723071ffmr6432019f8f.37.1794584951734;
        Fri, 13 Nov 2026 07:49:11 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 05/42] xen/riscv: build the target hart index via aplic_hart_index()
Date: Fri, 13 Nov 2026 16:48:26 +0100
Message-ID: <c190e50262ea2b4987bc66c1ed324ac6bb9c03ef.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794584952-BE27A757-FAFD6C76/10/73395122804
X-purgate-type: spam
X-purgate-size: 10683
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aplic_set_irq_affinity() computes the target register value by hand:

    cpu         = cpuid_to_hartid(<cpu picked from mask>);
    group_index = <bits taken from msi[cpu].base_addr>;
    hart_index  = cpu;

This is wrong in three ways:

- msi[] is indexed by logical CPU id, not by hart id. When the two
  differ, the wrong CPU's interrupt file is used, or msi[] is read
  out of bounds.

- The hart id is used as the low hart index. The AIA spec defines
  the low hart index as bits of the IMSIC interrupt file address,
  and the two are not guaranteed to be equal.

- The group index is taken from msi[].base_addr only. base_addr is
  the start of the IMSIC MMIO region, which may hold the interrupt
  files of several harts; the file of this CPU is at base_addr +
  msi[].offset, and both indexes must be extracted from that
  address.

Introduce aplic_hart_index(), together with the
APLIC_xMSICFGADDR_PPN_* macros it uses, which does this correctly: it
derives both indexes from the full address of the CPU's interrupt file
and packs them the way the Hart Index field expects. Use it here, and
insert the result with MASK_INSR(APLIC_TARGET_HART_IDX) rather than a
plain shift, so it cannot overflow the 14-bit field.
APLIC_TARGET_HART_IDX_SHIFT has no users left and is removed.

desc->irq is written as the EIID unchanged. Assert that it is a
valid APLIC source number, which also ensures it fits in the EIID
field.

No functional change on platforms with a single group, hart ids
equal to CPU ids, and one interrupt file per IMSIC MMIO region.

Fixes: d4676a1398bc ("xen/riscv: implementation of aplic and imsic operations")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Reword the commit message.
 - Initialize cpu in its declaration.
 - Introduce aplic_hart_index() and the APLIC_xMSICFGADDR_PPN_* macros
   here, moving them from "xen/riscv: implement virtual APLIC MMIO
   emulation", so that this patch no longer depends on it.
 - In the comment on the MSI address, describe g and h as the group
   number and the hart number relative to the group: the Hart Index
   is (g << lhxw) | h, not h.
---
Changes in v3:
 - s/aplic_hart_field/aplic_hart_index/ (in the subject too) following the
   rename of the helper in "xen/riscv: implement virtual APLIC MMIO
   emulation".
 - Don't mask desc->irq with APLIC_TARGET_EIID. Instead, bound it by
   the APLIC source range rather than NR_IRQS, which will also have to
   cover device MSIs: add a BUILD_BUG_ON() that ARRAY_SIZE(target) fits
   the EIID field and an ASSERT() that desc->irq is a valid APLIC source
   (1..num_irqs), which also covers the target[desc->irq - 1] index.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aplic.c             | 117 +++++++++++++++++++++++------
 xen/arch/riscv/include/asm/aplic.h |  10 ++-
 2 files changed, 103 insertions(+), 24 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index bffa29bb21ac..29663bc29b7b 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -41,6 +41,90 @@ static bool aplic_msi_mode(void)
     return readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM;
 }
 
+/*
+ * The arrangement of IMSIC interrupt files in MMIO space follows a topology
+ * defined by the RISC-V AIA specification. An IMSIC group is a set of
+ * interrupt files (e.g., in a cluster or socket) co-located in memory.
+ *
+ * The physical address of an outgoing MSI is calculated by bitwise ORing a
+ * Base Physical Page Number (Base PPN) with the group number (g), the
+ * hart number relative to the group (h) and, for a supervisor-level
+ * interrupt domain, the Guest Index:
+ *
+ *   ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | Guest Index ) << 12
+ *
+ * where Base PPN, HHXS, LHXS, HHXW and LHXW come from the {m,s}msiaddrcfg[h]
+ * registers of the interrupt domain that sends the MSI:
+ *
+ * XLEN-1       HHXS+24          LHXS+12          12          0
+ * |            |                |                |           |
+ * ------------------------------------------------------------
+ * |xxxx|   g   |xxxxxxxx|   h   |xxxx|Guest Index|     0     |
+ * ------------------------------------------------------------
+ *
+ * - g: group number.
+ * - h: hart number relative to the group.
+ * - xxxx: remaining Base PPN bits; each gap may be zero-width.
+ * - Guest Index: selects one of the 4 KiB pages right above the hart's own
+ *   supervisor-level file, i.e. it starts at bit 12; LHXS must therefore be
+ *   at least as large as the number of guest index bits.
+ * - Bits 11:0: always zero because IMSIC files are 4 KiB page-aligned.
+ *
+ * For wired interrupts in MSI delivery mode (domaincfg.DM = 1), the APLIC
+ * computes the MSI target address itself from the "Hart Index" field
+ * (bits 31:18) of the corresponding target[i] register. This 14-bit field
+ * holds both g and h:
+ *
+ * 13          lhxw+hhxw   lhxw       0
+ * |           |           |          |
+ * ------------------------------------
+ * |     0     |     g     |    h     |
+ * ------------------------------------
+ *
+ * - lhxw (Low Hart Index Width): the number of bits used for the hart number
+ *   within a group.
+ * - hhxw (High Hart Index Width): the number of bits used for the group
+ *   number; the remaining bits of the field must be zero.
+ *
+ * The Guest Index isn't a part of it: for a supervisor-level interrupt domain
+ * it has its own field (bits 17:12) in target[i].
+ *
+ * Because there are "xxxx" gaps (Base PPN bits) between the indices in the
+ * physical address (depending on HHXS and LHXS), software must extract the
+ * group and hart components separately and pack them into the APLIC-defined
+ * Hart Index format to ensure correct MSI targeting.
+ */
+static unsigned long aplic_hart_index(unsigned int cpu)
+{
+    const struct imsic_config *imsic = imsic_get_config();
+    const struct imsic_msi *msi = &imsic->msi[cpu];
+    /* Low Hart Index Shift */
+    unsigned int lhxs = imsic->guest_index_bits;
+    /* Low Hart Index Width */
+    unsigned int lhxw = imsic->hart_index_bits;
+    /* High Hart Index Width */
+    unsigned int hhxw = imsic->group_index_bits;
+    /* High Hart Index Shift */
+    unsigned int hhxs =
+        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
+    /*
+     * msi->base_addr is the base of the MMIO regset this CPU's interrupt
+     * files live in, and one regset can cover several harts; msi->offset
+     * selects this CPU's block inside it. The hart index bits are part of
+     * that offset, so both indexes have to be derived from the full address.
+     */
+    paddr_t target_addr = msi->base_addr + msi->offset;
+    unsigned long tppn = target_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
+    unsigned long g =
+        (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
+        APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
+    unsigned long h =
+        (tppn >> APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs)) &
+        APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
+
+    return (g << lhxw) | h;
+}
+
 static void __init aplic_init_hw_interrupts(void)
 {
     unsigned int i;
@@ -207,10 +291,8 @@ static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
 
 static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
-    unsigned int cpu;
-    uint64_t group_index, base_ppn;
-    uint32_t hhxw, lhxw, hhxs, value;
-    const struct imsic_config *imsic = aplic.imsic_cfg;
+    unsigned int cpu = aplic_get_cpu_from_mask(mask);
+    uint32_t value;
 
     /*
      * TODO: Currently, APLIC is supported only with MSI interrupts.
@@ -223,27 +305,16 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
 
     ASSERT(spin_is_locked(&desc->lock));
 
-    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
-    hhxw = imsic->group_index_bits;
-    lhxw = imsic->hart_index_bits;
     /*
-     * Although this variable is used only once in the calculation of
-     * group_index, and it might seem that hhxs could be defined as:
-     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
-     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
-     * when calculating the group index.
-     * It was done intentionally this way to follow the formula from
-     * the AIA specification for calculating the MSI address.
+     * desc->irq is used as the EIID as-is, which is only valid for APLIC
+     * sources: they are numbered 1..num_irqs, with at most ARRAY_SIZE(target).
      */
-    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
-    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
-
-    /* Update hart and EEID in the target register */
-    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
-                  (BIT(hhxw, UL) - 1);
-    value = desc->irq;
-    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
-    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
+    BUILD_BUG_ON(ARRAY_SIZE(aplic.regs->target) >
+                 MASK_EXTR(~0U, APLIC_TARGET_EIID));
+    ASSERT(desc->irq && desc->irq <= aplic_info.num_irqs);
+
+    value = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) |
+            desc->irq;
 
     spin_lock(&aplic.lock);
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 6afdb9cae7a2..93f0033b52d0 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -85,7 +85,6 @@
 #define APLIC_TARGET_BASE               0x3004
 #define APLIC_TARGET_LAST               0x3ffc
 #define  APLIC_TARGET_HART_IDX          GENMASK(31, 18)
-#define  APLIC_TARGET_HART_IDX_SHIFT    18
 /* If target is in MSI delivery mode (domaincfg.DM = 1) */
 #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
 /* Bit 11 is reserved and reads as zero */
@@ -102,6 +101,15 @@
 #define APLIC_SIZE(nr_cpus) \
     (APLIC_MIN_SIZE + APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
 
+#define APLIC_xMSICFGADDR_PPN_SHIFT IMSIC_MMIO_PAGE_SHIFT
+
+#define APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw) (BIT(hhxw, UL) - 1)
+#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs) \
+    ((hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
+
+#define APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw) (BIT(lhxw, UL) - 1)
+#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs) (lhxs)
+
 struct aplic_regs {
     uint32_t domaincfg;         /* 0x0000 */
     uint32_t sourcecfg[1023];   /* 0x0004 */
-- 
2.56.1


