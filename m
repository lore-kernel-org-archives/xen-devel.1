Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90610C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400932.1636629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvT-0000Lf-8h; Thu, 27 Aug 2026 15:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400932.1636629; Thu, 27 Aug 2026 15:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvT-0000LP-1l; Thu, 27 Aug 2026 15:21:59 +0000
Received: by outflank-mailman (input) for mailman id 1400932;
 Thu, 27 Aug 2026 15:21:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvR-0008Te-0c
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvQ-009ktn-Ce
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905605-e002-0a2a0a5209dd-0a2a4506aa28-24
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:56 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905611-195a-0a2a45060019-d1558036d9cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:53 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-499d1ab3f9dso9565155e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:53 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844113; x=1788448913; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wl9JDmFXe2GvW88zrD2RV31XZyZ+r6BwzzFfNH1Lx2E=;
        b=AJxKSmdcMEjF6PcSQzIE+c5zAohR/jYMzTNgYf9VXWnBNsQqk0NhkM2l++5txIcFpz
         0kT3YPRABmEYTd8xHjXqXSIfFuPqPv8YufkFiykx25RqUQWKV8ljrxfSDddd9Bhe6du6
         /B8SYhoB4gUx7Fv3i1q44xyv/IlXuw8PnLCDTPw0nzEdlCwpCb7TbJPn2p+/ZxQLuUt7
         dtl7rxTi9Usl1aBqSqj11d6/IQRI85bTFdHy/4Lx32BE4QQ3EpUY7h1hBERTDxnOEDhw
         yyxP//iPgIs8jdzK7SU4MOBZJZgv9PbPwMuGDyldGVy+p49UrFde7VyWfQrIjsGjO1F+
         GkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844113; x=1788448913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wl9JDmFXe2GvW88zrD2RV31XZyZ+r6BwzzFfNH1Lx2E=;
        b=hALeyDfvvbUEFNMhORFFYwL0A2cRXzlO3KYLXG9I3l3DjqCV26TCDXR0FC8T49ArFS
         HjvGgiDk7lUGlGnwvrCTmr+0BATHZiSCIczhIZjhQvqe639bGsrsUwaDMCSH2aQMcl/6
         ALUJVJg8dn2/WKHLchlzSir4hb21IrLPsEC9Lko0vCT5Ri6wItcThmHbIqB3TcKddW2w
         XOCVa4gloFa4TgEQV83vebZTQ5ufLNZ4BIKYRPmC/jsLgw2VKH3AUiXQ+7EnPb4LPTKV
         3EtCKvJH6AfjA7+YNKI5VstVGPaR64ZM/5++3NBx3hhCekye7rEdHDx9LeOKea6u/qc2
         EuTA==
X-Gm-Message-State: AFuF++lwVeP0u7cy30gS77WUGbIjvQTJxXXSqdRBdJf0Y3DuXrkjYg/o
	eACdGkEIL1GNh7AONO1NR9FlIXqVwG1aktND6KGrDy/wkOXkdaAqkDN/Hc5ufg==
X-Gm-Gg: AR+sD13NN2+B11xIkBqpocoFCYNPMSJim7wOiEUb7qJXfdN05e0HXwH2b7FUtGcvN9e
	bYoGyT3qrXan7/wxLa173ZqZX6rQILWp8uMHV+2XFmfMQQrcHXzL/eB1PmG6hJsuPEQBAdxJRwr
	4eCHpM+5z7K9GUOzc8Et1rj69TZDQOL4mz5AojHiVKckwbU52HkG8Rj3ykBHtzXkiztb9iJpP4g
	ZPTgDJl/a5z6s/1SVIfbE2wzkoAtV7w/GNMtzPbqDoSGPJswqe4Wkdj09/Q1rqHfXVELVZ5a9QV
	Lx01HiteXJ7OH5P4zY1aO8DJ//rGMuIlBGbrbh2sq5bGP0z4b0WEZU/c/ei33sKKM+2ALBO9n7u
	w9+sbliFIUx7wArp9ySbyUUwVB7i4E3oZkPb1W5ad7DspFy3w0hJ3j5/X3hdlQnh+nXShvsH5XX
	UcgcYVfM7YMCjv5Z516vTJC1f2bd1TyYbpbQcqYMYumBP/7i4Jw92jwCyW0ugS9s5ksJoTP1CT2
	toQM2GsfDAQjrAmJ5+t36OPLOsRT0cq
X-Received: by 2002:a05:600c:3155:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-499dc6feffcmr156361545e9.8.1787844112313;
        Thu, 27 Aug 2026 08:21:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO emulation
Date: Thu, 27 Aug 2026 17:20:53 +0200
Message-ID: <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1787844113-F460277B-28EEC48C/10/73395122804
X-purgate-type: spam
X-purgate-size: 26121

Guests running under Xen program interrupt routing by writing to APLIC
MMIO registers. Xen must intercept these accesses to enforce interrupt
isolation between domains and to translate guest routing intent into the
underlying physical MSI topology.

Writes are gated by the domain's authorised interrupt bitmap so that a
guest cannot affect interrupts it does not own. TARGET register writes
additionally require translation of the hart and IMSIC guest-file
indices from virtual to physical, as the APLIC uses these fields
directly to compute the MSI delivery address.

Delegation (APLIC_SOURCECFG_D) is not yet supported.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Shadow the guest-written target registers in a per-domain array and
   serve reads of APLIC_TARGET_* from it: the hardware register holds the
   value produced by aplic_msi_target_gen() (physical hart field, VS-file
   id), so reading it back would expose the host layout and return
   something the guest never wrote. A non-zero guest index is dropped with
   a one-time warning instead of being echoed back.
 - aplic_hart_field(): take a CPU id instead of a hartid and derive both
   the group and the hart index from msi->base_addr + msi->offset - the
   hart index bits are a part of that offset, so the hartid can't be used
   as the hart index. Add APLIC_xMSICFGADDR_PPN_LHX_{MASK,SHIFT} for that.
 - Document the IMSIC MSI target address layout and the APLIC hart index
   packing above aplic_hart_field(), and correct the corresponding diagram
   in asm/imsic.h.
 - Drop the mask parameter of aplic_hw_read_reg() and apply the
   authorization mask in vaplic_emulate_load() instead.
 - vaplic_emulate_{load,store}(): return bool instead of int, rename v/d to
   curr/currd and add ASSERT(curr == current).
 - Use domain_vcpu() instead of open-coded d->vcpu[] indexing when
   resolving the target hart index.
 - s/APLIC_REG_OFFSET_MASK/APLIC_CTRL_REGION_OFFSET_MASK/.
 - Update store emulation handling for target register to be able to deal
   with target format in both cases (MSI and Direct).
 - Update store emulation handling of domaincfg. There is no need to force
   DM/IE mode here (it will be forced/checked on Xen irq handler side).
 - Rename APLIC_DEFAULT_PRIORITY and move to aplic.h as default prioity
   value is used in vaplic code too now.
---
---
 xen/arch/riscv/aplic-priv.h         |   3 +
 xen/arch/riscv/aplic.c              | 128 +++++++++-
 xen/arch/riscv/include/asm/aplic.h  |  34 +++
 xen/arch/riscv/include/asm/imsic.h  |  13 ++
 xen/arch/riscv/include/asm/vaplic.h |   5 +
 xen/arch/riscv/vaplic.c             | 350 +++++++++++++++++++++++++++-
 6 files changed, 528 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index 35100d3a64fe..b3a1f79c5b76 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -47,4 +47,7 @@ struct aplic_priv {
  */
 extern unsigned int guest_aplic_num_sources;
 
+uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
+                              uint32_t base_val);
+
 #endif /* ASM_RISCV_APLIC_PRIV_H */
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 3681f0669efb..66ba4986a9ff 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -16,6 +16,7 @@
 #include <xen/irq.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
 #include <xen/types.h>
 #include <xen/vmap.h>
@@ -28,8 +29,6 @@
 #include <asm/io.h>
 #include <asm/riscv_encoding.h>
 
-#define APLIC_DEFAULT_PRIORITY  1
-
 static struct aplic_priv aplic = {
     .lock = SPIN_LOCK_UNLOCKED,
 };
@@ -38,6 +37,127 @@ static struct intc_info __ro_after_init aplic_info = {
     .hw_variant = INTC_APLIC,
 };
 
+/*
+ * The arrangement of IMSIC interrupt files in MMIO space follows a topology
+ * defined by the RISC-V AIA specification. An IMSIC group is a set of
+ * interrupt files (e.g., in a cluster or socket) co-located in memory.
+ *
+ * The physical address of an outgoing MSI is calculated by bitwise ORing a
+ * Base Physical Page Number (Base PPN) with the Group Index (g), the Hart
+ * Index (h) and, for a supervisor-level interrupt domain, the Guest Index:
+ *
+ *   ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | guest ) << 12
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
+ * For wired interrupts in MSI delivery mode (domaincfg.DM = 1) the APLIC
+ * builds that address itself from the "Hart Index" field (bits 31:18) of the
+ * corresponding target[i] register. That field holds a hart index *number*,
+ * in which both indices are packed adjacently:
+ *
+ * 13          lhxw+hhxw   lhxw       0
+ * |           |           |          |
+ * ------------------------------------
+ * |     0     |Group Index|Hart Index|
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
+static unsigned long aplic_hart_field(unsigned int cpu)
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
+uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
+                              uint32_t base_val)
+{
+    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
+    unsigned long hart_field = aplic_hart_field(target_vcpu->processor);
+
+    base_val &= APLIC_TARGET_EIID;
+    base_val |= MASK_INSR(guest_id, APLIC_TARGET_GUEST_IDX);
+    base_val |= MASK_INSR(hart_field, APLIC_TARGET_HART_IDX);
+
+    return base_val;
+}
+
+uint32_t aplic_hw_read_reg(unsigned int offset)
+{
+    unsigned long flags;
+    uint32_t val;
+
+    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
+
+    spin_lock_irqsave(&aplic.lock, flags);
+    val = readl((volatile void __iomem *)aplic.regs + offset);
+    spin_unlock_irqrestore(&aplic.lock, flags);
+
+    return val;
+}
+
+void aplic_hw_write_reg(unsigned int offset, uint32_t value)
+{
+    unsigned long flags;
+
+    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
+
+    spin_lock_irqsave(&aplic.lock, flags);
+    writel(value, (volatile void __iomem *)aplic.regs + offset);
+    spin_unlock_irqrestore(&aplic.lock, flags);
+}
+
 static void __init aplic_init_hw_interrupts(void)
 {
     unsigned int i;
@@ -53,9 +173,9 @@ static void __init aplic_init_hw_interrupts(void)
         /*
          * Low bits of target register contains Interrupt Priority bits which
          * can't be zero according to AIA spec.
-         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
+         * Thereby they are initialized to APLIC_TARGET_IPRIO_DEFAULT.
          */
-        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i]);
+        writel(APLIC_TARGET_IPRIO_DEFAULT, &aplic.regs->target[i]);
     }
 
     writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index a2af55d54fc0..babba386071f 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -39,6 +39,13 @@
 #define  APLIC_DOMAINCFG_IE             BIT(8, U)
 #define  APLIC_DOMAINCFG_DM             BIT(2, U)
 #define  APLIC_DOMAINCFG_BE             BIT(0, U)
+/*
+ * The bits a write may change. Everything else, including the read-only zero
+ * bit 7 and the reserved bits, has to read back as zero, and BE is WARL and
+ * hardwired to 0 as Xen is little-endian only.
+ */
+#define  APLIC_DOMAINCFG_WMASK          (APLIC_DOMAINCFG_IE | \
+                                         APLIC_DOMAINCFG_DM)
 
 #define APLIC_SOURCECFG_BASE            0x0004
 #define APLIC_SOURCECFG_LAST            0x0ffc
@@ -89,6 +96,9 @@
 #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
 /* Bit 11 is reserved and reads as zero */
 #define  APLIC_TARGET_EIID              GENMASK(10, 0)
+/* If target is in DM mode */
+#define  APLIC_TARGET_IPRIO             GENMASK(7, 0)
+#define   APLIC_TARGET_IPRIO_DEFAULT    1U
 
 #define APLIC_IDC_SIZE                  32
 
@@ -98,6 +108,27 @@
 #define APLIC_SIZE(nr_cpus) \
     (APLIC_MIN_SIZE + APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
 
+/*
+ * Using setip is fine here, as all SET* and CLR* register groups consist of 32
+ * registers and therefore have identical sizes.
+ *
+ * Lowest 2 bits are always zero for SET* and CLR* registers.
+ */
+#define APLIC_SETCLR_OFFSET_MASK \
+    (sizeof_field(struct aplic_regs, setip) - sizeof(uint32_t))
+
+#define APLIC_xMSICFGADDR_PPN_SHIFT IMSIC_MMIO_PAGE_SHIFT
+
+#define APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw) \
+    (BIT(hhxw, UL) - 1)
+#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs) \
+    ((hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
+
+#define APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw) \
+    (BIT(lhxw, UL) - 1)
+#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs) \
+    (lhxs)
+
 struct aplic_regs {
     uint32_t domaincfg;         /* 0x0000 */
     uint32_t sourcecfg[1023];   /* 0x0004 */
@@ -141,4 +172,7 @@ struct aplic_regs {
     uint32_t target[1023];      /* 0x3004 */
 };
 
+uint32_t aplic_hw_read_reg(unsigned int offset);
+void aplic_hw_write_reg(unsigned int offset, uint32_t value);
+
 #endif /* ASM_RISCV_APLIC_H */
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 2425430ed116..93f9e44c7d2c 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -40,6 +40,19 @@ struct imsic_config {
     /* Base address */
     paddr_t base_addr;
 
+    /*
+     * MSI Target Address Scheme
+     *
+     * XLEN-1       HHXS+24          LHXS+12          12          0
+     * |            |                |                |           |
+     * ------------------------------------------------------------
+     * |xxxx|   g   |xxxxxxxx|   h   |xxxx|Guest Index|     0     |
+     * ------------------------------------------------------------
+     * - g: group number.
+     * - h: hart number relative to the group.
+     * - xxxx: remaining Base PPN bits; each gap may be zero-width.
+     */
+
     /* Bits representing Guest index, HART index, and Group index */
     unsigned int guest_index_bits;
     unsigned int hart_index_bits;
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index 96080bfbc23b..046c604915c4 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -21,11 +21,16 @@ struct domain;
 
 struct vaplic_regs {
     uint32_t domaincfg;
+
+    uint32_t *target;
 };
 
 struct vaplic {
     struct vintc vintc;
     struct vaplic_regs regs;
+
+    paddr_t regs_start;
+    unsigned int regs_size;
 };
 
 int domain_vaplic_init(struct domain *d);
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 14f6e3164a9b..8726f7203d6e 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -17,6 +17,7 @@
 #include <asm/aia.h>
 #include <asm/imsic.h>
 #include <asm/intc.h>
+#include <asm/mmio.h>
 #include <asm/vaplic.h>
 
 #include "aplic-priv.h"
@@ -27,6 +28,279 @@ unsigned int __ro_after_init guest_aplic_num_sources;
 
 #define FDT_VAPLIC_INT_CELLS 2
 
+#define AUTH_IRQ_BIT(d, irqn) \
+    (((irqn) < (d)->arch.vintc->nr_virqs) && \
+     test_bit(irqn, (d)->arch.vintc->used_irqs))
+
+/*
+ * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
+ * a 32-bit word index into the used_irqs bitmap. Each word covers 32
+ * interrupt sources. For SOURCECFG and TARGET groups the same division also
+ * yields the interrupt number directly, because those arrays store one 32-bit
+ * register per source.
+ */
+#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
+
+static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
+{
+    const struct vaplic *vaplic = to_vaplic(d);
+
+    /* target[0] doesn't exist so irqn == 0 should be impossible */
+    if ( !irqn || irqn >= vaplic->vintc.nr_virqs )
+        return 0;
+
+    return read_atomic(&vaplic->regs.target[irqn]);
+}
+
+static inline uint32_t generate_auth_mask(const struct domain *currd,
+                                          unsigned int word_idx)
+{
+    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
+
+    if ( word_idx >= DIV_ROUND_UP(currd->arch.vintc->nr_virqs,
+                                  sizeof(uint32_t) * BITS_PER_BYTE) )
+    {
+        gdprintk(XENLOG_DEBUG, "incorrect word_idx(%u) is passed\n", word_idx);
+
+        return 0;
+    }
+
+    return currd->arch.vintc->used_irqs[first_bit / BITS_PER_LONG] >>
+           (first_bit % BITS_PER_LONG);
+}
+
+static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
+                                uint32_t *out)
+{
+    const struct domain *currd = curr->domain;
+    const struct vaplic *vaplic = to_vaplic(currd);
+    const unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;
+    uint32_t auth_mask;
+    unsigned int i;
+
+    ASSERT(curr == current);
+
+    switch ( offset )
+    {
+    case APLIC_DOMAINCFG:
+        *out = vaplic->regs.domaincfg;
+
+        return true;
+
+    case APLIC_SETIPNUM:
+    case APLIC_SETIPNUM_LE:
+    case APLIC_CLRIPNUM:
+    case APLIC_SETIENUM:
+    case APLIC_CLRIENUM:
+    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
+        /*
+         * Based on the RISC-V AIA spec a read of these registers
+         * always returns zero
+         */
+        *out = 0;
+
+        return true;
+
+    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
+    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+        i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
+        auth_mask = generate_auth_mask(currd, i);
+
+        break;
+
+    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
+        /*
+         * As target registers start from 1:
+         *  0x3000 genmsi
+         *  0x3004 target[1]
+         *  0x3008 target[2]
+         *   ...
+         *  0x3FFC target[1023]
+         * It is necessary to calculate an interrupt number by subtracting
+         * APLIC_GENMSI instead of APLIC_TARGET_BASE.
+         */
+        i = regoffset_to_word_idx(offset - APLIC_GENMSI);
+
+        *out = AUTH_IRQ_BIT(currd, i) ? vaplic_target_read(currd, i) : 0;
+
+        return true;
+
+    default:
+        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
+                 offset);
+
+        return false;
+    }
+
+    *out = aplic_hw_read_reg(offset) & auth_mask;
+
+    return true;
+}
+
+static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
+                                 uint32_t value)
+{
+    const struct domain *currd = curr->domain;
+    unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;
+
+    ASSERT(curr == current);
+
+    switch ( offset )
+    {
+    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
+    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
+    {
+        unsigned int word_idx =
+            regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
+
+        value &= generate_auth_mask(currd, word_idx);
+
+        break;
+    }
+
+    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
+        if ( value & APLIC_SOURCECFG_D )
+        {
+            dprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
+
+            goto fail;
+        }
+
+        /*
+         * As sourcecfg register starts from 1:
+         *   0x0000 domaincfg
+         *   0x0004 sourcecfg[1]
+         *   0x0008 sourcecfg[2]
+         *    ...
+         *   0x0FFC sourcecfg[1023]
+         * It is necessary to calculate an interrupt number by subtracting
+         * APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
+         */
+        if ( !AUTH_IRQ_BIT(currd,
+                           regoffset_to_word_idx(offset - APLIC_DOMAINCFG)) )
+            /* Interrupt not enabled, ignore it */
+            return true;
+
+        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
+        {
+            gdprintk(XENLOG_ERR,
+                     "value(%#x) is incorrect for sourcecfg register\n",
+                     value);
+
+            return true;
+        }
+
+        break;
+
+    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
+    {
+        struct vaplic *vaplic = to_vaplic(currd);
+        struct vcpu *target_vcpu;
+        unsigned int guest_hart_idx = MASK_EXTR(value, APLIC_TARGET_HART_IDX);
+        /*
+         * Look at vaplic_emulate_load() for explanation why APLIC_GENMSI is
+         * subtracted.
+         */
+        unsigned int srcn = regoffset_to_word_idx(offset - APLIC_GENMSI);
+
+        if ( !AUTH_IRQ_BIT(currd, srcn) )
+            /* Interrupt not enabled, ignore it */
+            return true;
+
+        target_vcpu = domain_vcpu(currd, guest_hart_idx);
+
+        if ( !target_vcpu )
+        {
+            dprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
+
+            /* Ignore such writings */
+            return true;
+        }
+
+        if ( vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM )
+        {
+            /*
+             * A non-zero guest index asks for delivery to an interrupt file of
+             * nested guest. The vIMSIC node has no riscv,guest-index-bits
+             * property, so a guest is told its harts have no guest interrupt
+             * files and the field is read-only zero for them. The write isn't
+             * rejected (that would throw away a valid hart index and EIID);
+             * instead the field is dropped, which is also what
+             * aplic_msi_target_gen() does with it when programming the h/w.
+             */
+            if ( MASK_EXTR(value, APLIC_TARGET_GUEST_IDX) )
+            {
+                printk_once(XENLOG_WARNING
+                            "%pd: vAPLIC target guest index != 0 is unsupported\n",
+                            currd);
+
+                /* Ignore such writes ... */
+                return true;
+            }
+
+            write_atomic(&vaplic->regs.target[srcn], value);
+
+            value = aplic_msi_target_gen(target_vcpu, value);
+        }
+        else
+        {
+            /*
+             * IPRIO is WARL and zero isn't a legal value for it, so normalize
+             * it once: the guest then reads back exactly what it gets.
+             */
+            unsigned int iprio = MASK_EXTR(value, APLIC_TARGET_IPRIO) ?:
+                                 APLIC_TARGET_IPRIO_DEFAULT;
+            unsigned long h = cpuid_to_hartid(guest_hart_idx);
+
+            value = MASK_INSR(guest_hart_idx, APLIC_TARGET_HART_IDX) |
+                    MASK_INSR(iprio, APLIC_TARGET_IPRIO);
+
+            write_atomic(&vaplic->regs.target[srcn], value);
+
+            value = MASK_INSR(h, APLIC_TARGET_HART_IDX) |
+                    MASK_INSR(iprio, APLIC_TARGET_IPRIO);
+        }
+
+        break;
+    }
+
+    case APLIC_SETIPNUM:
+    case APLIC_SETIPNUM_LE:
+    case APLIC_CLRIPNUM:
+    case APLIC_SETIENUM:
+    case APLIC_CLRIENUM:
+        if ( !value || !AUTH_IRQ_BIT(currd, value) )
+            return true;
+
+        break;
+
+    case APLIC_DOMAINCFG:
+    {
+        struct vaplic *vaplic = to_vaplic(currd);
+
+        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
+                                 (value & APLIC_DOMAINCFG_WMASK);
+
+        return true;
+    }
+
+    default:
+    fail:
+        gdprintk(XENLOG_WARNING,
+                 "Unhandled APLIC write at offset %#x (value %#x)\n", offset,
+                 value);
+
+        return false;
+    }
+
+    aplic_hw_write_reg(offset, value);
+
+    return true;
+}
+
 static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
 {
     struct domain *d = kinfo->bd.d;
@@ -95,6 +369,56 @@ static const struct vintc_init_ops __initconstrel init_ops = {
     .make_domu_dt_node = vaplic_make_domu_dt_node,
 };
 
+static enum io_state cf_check vaplic_mmio_read(struct vcpu *v,
+                                               mmio_info_t *info)
+{
+    uint32_t val;
+
+    ASSERT(v == current);
+
+    if ( info->len != sizeof(uint32_t) ||
+         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
+    {
+        gdprintk(XENLOG_DEBUG,
+                 "VAPLIC: unaligned/wrong-width read gpa=%"PRIpaddr" len=%u\n",
+                 info->gpa, info->len);
+        return IO_ABORT;
+    }
+
+    if ( !vaplic_emulate_load(v, info->gpa, &val) )
+        return IO_ABORT;
+
+    /* APLIC registers are 32-bit; zero-extend to the guest register width. */
+    info->data = val;
+
+    return IO_HANDLED;
+}
+
+static enum io_state cf_check vaplic_mmio_write(struct vcpu *v,
+                                                const mmio_info_t *info)
+{
+    ASSERT(v == current);
+
+    if ( info->len != sizeof(uint32_t) ||
+         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
+    {
+        gdprintk(XENLOG_DEBUG,
+                 "VAPLIC: unaligned/wrong-width write gpa=%"PRIpaddr" len=%u\n",
+                 info->gpa, info->len);
+        return IO_ABORT;
+    }
+
+    if ( !vaplic_emulate_store(v, info->gpa, info->data) )
+        return IO_ABORT;
+
+    return IO_HANDLED;
+}
+
+static const struct mmio_handler_ops vaplic_mmio_ops = {
+    .read  = vaplic_mmio_read,
+    .write = vaplic_mmio_write,
+};
+
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vcpu_imsic_init,
     .vcpu_deinit = vcpu_imsic_deinit,
@@ -103,6 +427,7 @@ static const struct vintc_ops vintc_ops = {
 int domain_vaplic_init(struct domain *d)
 {
     struct vaplic *vaplic = xvzalloc(struct vaplic);
+    int rc;
 
     if ( !vaplic )
         return -ENOMEM;
@@ -122,7 +447,29 @@ int domain_vaplic_init(struct domain *d)
      */
     d->arch.vintc->nr_virqs = guest_aplic_num_sources + 1;
 
-    return 0;
+    /* Slot 0 is unused: APLIC source numbering starts at 1 (see used_irqs). */
+    vaplic->regs.target = xvzalloc_array(uint32_t, d->arch.vintc->nr_virqs);
+    if ( !vaplic->regs.target )
+    {
+        d->arch.vintc = NULL;
+        xvfree(vaplic);
+
+        return -ENOMEM;
+    }
+
+    vaplic->regs_start = GUEST_APLIC_S_BASE;
+    vaplic->regs_size = APLIC_SIZE(d->max_vcpus);
+
+    rc = register_mmio_handler(d, &vaplic_mmio_ops,
+                               vaplic->regs_start, vaplic->regs_size);
+    if ( rc )
+    {
+        d->arch.vintc = NULL;
+        xvfree(vaplic->regs.target);
+        xvfree(vaplic);
+    }
+
+    return rc;
 }
 
 void domain_vaplic_deinit(struct domain *d)
@@ -134,5 +481,6 @@ void domain_vaplic_deinit(struct domain *d)
 
     vaplic = to_vaplic(d);
     d->arch.vintc = NULL;
+    xvfree(vaplic->regs.target);
     xvfree(vaplic);
 }
-- 
2.55.0


