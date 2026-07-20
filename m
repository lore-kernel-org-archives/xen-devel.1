Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A92C44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367147.1616990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRz-0000Fx-Ah; Mon, 20 Jul 2026 16:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367147.1616990; Mon, 20 Jul 2026 16:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRz-0000Fh-61; Mon, 20 Jul 2026 16:02:39 +0000
Received: by outflank-mailman (input) for mailman id 1367147;
 Mon, 20 Jul 2026 16:02:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqRx-00007U-EK
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqRw-001mtW-R3
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4698-2eae-0a2a0a5409dd-0a2a4509cb62-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:36 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e469c-be1a-0a2a45090019-d155802fb065-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:36 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4954d29264cso13155345e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:36 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563356; x=1785168156; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLZE3oGfTQzGELWS1cNY2z7sEIDuJoIskaYtsyWoDoo=;
        b=qOoI3Pg0a6vI7EOfouhVyRJIZKCxZnX149fXz0M8SVCKUfsqJRIjkTB9DqXybjxali
         syzt1LjIC74x+yYJzc+jEIZSzViEkeRqJyEln35IPg/RmG25ym1S74mzcUm0KyHTlhNi
         +SAcHzI34Lh8X2V+u1A4MKB4OolYwVEl5uKQ93oD1VwfN53W/juJ5+jRRfoCawHLpKU4
         IndF+H+0w4+jczAHWPYyhcuTUAOzXCgoYsp3GZNxdqVk6HKLGKW/fUtM7lmz7eeh7DmZ
         XS65YxehjTEchxWVBfXY3WjKUHkJZ1SU/sC1ZzYuRjKVkP+ILzAUyJ6+9597GBTN91Uf
         PbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563356; x=1785168156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sLZE3oGfTQzGELWS1cNY2z7sEIDuJoIskaYtsyWoDoo=;
        b=bmA7h44cbKo3LN71OdZvH3vGqESqESJdB+PktLyiDf0MDx0ieh+0aNwKwVIRcv3yUe
         4vtpppHkkZbBRtOKRsrf9u8KrpGcbygum2cC9V9uh8M2pBvCIaLXtRVuExzwieKL+oz8
         jQ7UH5ua14TB/n6kUVX0AK5Th2kP1H+WR912QqqNsgt3t/FIobW7vGO1b5/iZiGgLBog
         NlXFx6s3d2Qu2XqtS5Vma56N0/WlD/VNMHy4zhh7tiyooqqvHEqef9oCoBAUIDcOQiCX
         05abck6vi7I68YTKs46bRxBrDdI36DcVt1RWIqLIgKQyy65p1O14YikVJtH6frv/n7zF
         dMLA==
X-Gm-Message-State: AOJu0YzaAkz6dzF63/8EvxPxemCY8r/FeQItTeJLuKhhHsEuekLPqDFd
	KAdwy68Y3QoKiOl3A4RE5WZ5Rmx1tSFVChminYXC6xcYUzXOiNlmzE8kFCOiug==
X-Gm-Gg: AfdE7cnrcoqJi6fJAhuv3andIlUjlJml2Y8AVZ9nIHf6AWIzvA9sxZ/YDFzFASu0URO
	IbLEZ5wspVmFPu2DWQI8NxvixX2YnVQBXRSvYw5eF53EvHDi5rHe2L4ycQal1W8VZ+fzZ+UaRma
	KEzOXhR2oSRpR4m67f3R1eKdamvh1iP6RI7PScrRs2547T9BrRfYX5y1Lvpx5zL2ABWe1opsUmO
	lKG6PppVn1GmG9f7veq6VyBfqmasyYR6mgHtuMp3Oh4TL8e1QVWEh7nWXKDVf9Y2Wfs4dc+C+Gv
	sqmJngeDqdDxerKrfS+iZKmaTqnvNdtJlMjDCyJEeMjkXm+WUXgdVy+J1hv9Hray9x1WO5+Red3
	G9+/BsgLlYNJJ4q7iYVE3dgE1JkOvAsir8RJd0Fr00KwvrPrrif8TIlksWAq+RGcwmrsOB6BNXA
	vWg090sqBDEn/qynvKv+wONHm0Kl8M8kyqHHQV41GOgKTqAl0=
X-Received: by 2002:a05:600c:3b89:b0:495:5d9d:a2dc with SMTP id 5b1f17b1804b1-4955d9da70emr76588915e9.30.1784563355996;
        Mon, 20 Jul 2026 09:02:35 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 05/17] xen/riscv: implement virtual APLIC MMIO emulation
Date: Mon, 20 Jul 2026 18:02:03 +0200
Message-ID: <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1784563356-BE2C4034-8EEB24B7/10/73395122804
X-purgate-type: spam
X-purgate-size: 22282

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
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech> # vaplic_mmio_{read,write}

The downstream changes related to `vaplic_mmio_{read,write}` were originally
in a separate patch (which was reviewed by Baptiste). However, before
upstreaming, it was decided to merge them into the current patch.
I added `Reviewed-by: Baptiste` in this form for now, but Baptiste will
probably review the remaining changes as well.
Once that happens, I'll simply move the `Reviewed-by` tag up and
remove the `#`.

If it will be easier I can move that changes to separate commit.
---
Changes in v3:
 - Drop ->is_access(), ->emulate_{store,load}() from struct vintc_ops and
   use MMIO framework instead.
 - Rename local variable base_ppn to tppn to not confuse it with base_ppn
   from AIA specification in the correspondent formula.
 - Move aplic_msi_target_gen() from vaplic.c to aplic.c.
 - Extract static aplic_hart_field() helper to compute the combined
   hart + group-index field for the TARGET register.
 - Use MASK_INSR() with APLIC_TARGET_GUEST_IDX_MASK and
   APLIC_TARGET_HART_IDX_MASK instead of open-coded shifts in
   aplic_msi_target_gen().
 - Add APLIC_xMSICFGADDR_PPN_SHIFT, _HHX_MASK, and _HHX_SHIFT macros
   to asm/aplic.h; use them in aplic_hart_field() to extract the group
   index from base_ppn.
 - Move APLIC_TARGET_{HART,GUEST}_IDX_MASK definitions to the preceding
   patch ("add missing APLIC register offsets, masks").
 - xen/arch/riscv/aplic.c:
   - Extend ASSERT() in aplic_hw_read_reg() and aplic_hw_write_reg() to
     also check 4-byte alignment via IS_ALIGNED(offset, sizeof(uint32_t)).
   - Use (volatile void __iomem *)aplic.regs + offset in readl()/writel()
     instead of the uintptr_t cast.
 - xen/arch/riscv/include/asm/aplic.h:
   - Drop unused APLIC_NUM_REGS macro.
   - Rewrite APLIC_SETCLR_OFFSET_MASK as
     (sizeof_field(struct aplic_regs, setip) - sizeof(uint32_t)) and add a
     comment explaining the choice of setip as a representative field.
 - xen/arch/riscv/include/asm/vaplic.h:
   - Change regs_size type from paddr_t to unsigned int.
 - xen/arch/riscv/vaplic.c:
   - s/regindx_to_irqn/regoffset_to_word_idx and add an explanatory comment.
   - s/irqsn/word_idx in generate_auth_mask().
   - Replace pointer-cast bitmap access in generate_auth_mask() with proper
     index arithmetic via first_bit to avoid strict-aliasing violation.
   - Add cf_check to vaplic_emulate_load().
   - s/vcpu/v in vaplic_emulate_load(), vaplic_emulate_store() and
     vaplic_is_access().
   - Fix comment typos: s/start for/start from/, s/substracting/subtracting/,
     drop stray 'of' after 'subtracting' in two comments.
   - AUTH_IRQ_BIT() intentionally uses '<' rather than '<=' when
     comparing irqn against nr_virqs: nr_virqs is a count of virtual IRQs
     and irqn is a 0-based index, so the valid range is
     [0, nr_virqs - 1] and irqn == nr_virqs is already out of bounds.
   - Update handling of 'case APLIC_DOMAINCFG'.
---
Changes in v2:
 - Merge the following patches into one:
    xen/riscv: add vaplic access check:
      - Add check that address is properly aligned.
      - Check vaplic range intead of APLIC one.
      - Return bool from vaplic_is_access instead of int.
    xen/riscv: emulate guest writes to virtual APLIC MMIO
      - Drop CALC_REG_VALUE.
      - Use unsigned int instead of uin32_t for offset.
      - s/.../subtracting in the comment.
      - start one line comments from the upper case.
      - Check the value before being written to sourcecfg register.
      - 'unsigned int' for loop index.
      - Omit unneessary braces.
      - s/vaplic_update_target/aplic_msi_target_gen.
      - Use IMSIC_MMIO_PAGE_SHIFT instead of 12 in aplic_msi_target_gen().
      - Drop explicit usage of APLIC register in store function.
      - Drop APLIC_REG_{GET,SET} macros and introudce APLIC specific funtcions.
      - Ignore write to SOURCECFG_BASE when value is out-of-range.
      - Drop ASSERT(!target_vcpu) inside handler of targer register setting,
        just avoid such writings + debug message.
      - domain_crash() instead of panic() in the case of default case.
      - Drop ASSERT() in APLIC_SOURCE_CFG_BASE case and use domain_crash()
        instead.
    xen/riscv: emulate guest reads from virtual APLIC MMIO:
      - s/regval_to_irqn/regindx_to_irqn.
      - pass to to_vaplic() a domain instead of vintc.
      - add check that load access is aligned.
      - instead of panic() just crash a domain().
      - use 'unsigned int' for local variable offset.
      - Return 0 in the case APLIC_CLRIE_BASE ...APLIC_CLRIE_LAST reading to
        follow AIA spec.
      - Drop explicit usage of physical APLIC registers.
---
---
 xen/arch/riscv/aplic-priv.h         |   2 +
 xen/arch/riscv/aplic.c              |  55 +++++
 xen/arch/riscv/include/asm/aplic.h  |  24 +++
 xen/arch/riscv/include/asm/imsic.h  |  10 +
 xen/arch/riscv/include/asm/vaplic.h |   3 +
 xen/arch/riscv/vaplic.c             | 301 ++++++++++++++++++++++++++++
 6 files changed, 395 insertions(+)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index 1391837f89b9..96bc56dbe585 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -48,4 +48,6 @@ struct aplic_priv {
  */
 extern unsigned int guest_aplic_num_sources;
 
+uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu, uint32_t base_val);
+
 #endif /* ASM_RISCV_APLIC_PRIV_H */
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 3681f0669efb..87f2134bc561 100644
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
@@ -38,6 +39,60 @@ static struct intc_info __ro_after_init aplic_info = {
     .hw_variant = INTC_APLIC,
 };
 
+static unsigned long aplic_hart_field(unsigned long hartid)
+{
+    const struct imsic_config *imsic = imsic_get_config();
+    unsigned int lhxw = imsic->hart_index_bits;
+    unsigned int hhxw = imsic->group_index_bits;
+    unsigned int hhxs =
+        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
+    unsigned long tppn =
+        imsic->msi[hartid].base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
+    unsigned long group_index =
+        (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
+        APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
+
+    return (group_index << lhxw) | hartid;
+}
+
+uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu, uint32_t base_val)
+{
+    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
+    unsigned long hart_id = cpuid_to_hartid(target_vcpu->processor);
+    unsigned long hart_field = aplic_hart_field(hart_id);
+
+    base_val &= APLIC_TARGET_EIID_MASK;
+    base_val |= MASK_INSR(guest_id, APLIC_TARGET_GUEST_IDX_MASK);
+    base_val |= MASK_INSR(hart_field, APLIC_TARGET_HART_IDX_MASK);
+
+    return base_val;
+}
+
+uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask)
+{
+    unsigned long flags;
+    uint32_t val;
+
+    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
+
+    spin_lock_irqsave(&aplic.lock, flags);
+    val = readl((volatile void __iomem *)aplic.regs + offset) & mask;
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
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index f22622b9a23f..4ae5fb8f26d1 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -28,6 +28,8 @@
 #define APLIC_DOMAINCFG_BE      BIT(0, U)
 
 /* sourcecfg register fields */
+#define APLIC_SOURCECFG_D       BIT(10, U)
+
 #define APLIC_SOURCECFG_SM_INACTIVE     0x0
 #define APLIC_SOURCECFG_SM_DETACH       0x1
 #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
@@ -38,6 +40,16 @@
 /* target register fields */
 #define APLIC_TARGET_HART_IDX_SHIFT 18
 #define APLIC_TARGET_EIID_MASK      0x7ff
+#define APLIC_TARGET_HART_IDX_MASK  0xfffc0000
+#define APLIC_TARGET_GUEST_IDX_MASK 0x3f000
+
+/* xmsicfgaddr/h register fields */
+#define APLIC_xMSICFGADDR_PPN_SHIFT IMSIC_MMIO_PAGE_SHIFT
+
+#define APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw) \
+    (BIT(hhxw, UL) - 1)
+#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs) \
+    ((hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
 
 #define APLIC_DOMAINCFG         0x0000
 #define APLIC_SOURCECFG_BASE    0x0004
@@ -77,6 +89,15 @@
 #define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
                                  APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
 
+/*
+ * Using setip is fine here, as all SET* and CLR* register groups consist of 32
+ * registers and therefore have identical sizes.
+ *
+ * Lowest 2 bits are always zero for SET* and CLR* registers.
+ */
+#define APLIC_SETCLR_OFFSET_MASK \
+    (sizeof_field(struct aplic_regs, setip) - sizeof(uint32_t))
+
 struct aplic_regs {
     uint32_t domaincfg;         /* 0x0000 */
     uint32_t sourcecfg[1023];   /* 0x0004 */
@@ -120,4 +141,7 @@ struct aplic_regs {
     uint32_t target[1023];      /* 0x3008 */
 };
 
+uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask);
+void aplic_hw_write_reg(unsigned int offset, uint32_t value);
+
 #endif /* ASM_RISCV_APLIC_H */
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index e1ec3d03c4e9..612f503b5799 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -40,6 +40,16 @@ struct imsic_config {
     /* Base address */
     paddr_t base_addr;
 
+    /*
+     * MSI Target Address Scheme
+     *
+     * XLEN-1                                                12     0
+     * |                                                     |     |
+     * -------------------------------------------------------------
+     * |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
+     * -------------------------------------------------------------
+     */
+
     /* Bits representing Guest index, HART index, and Group index */
     unsigned int guest_index_bits;
     unsigned int hart_index_bits;
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index 96080bfbc23b..7bf9247f4eae 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -26,6 +26,9 @@ struct vaplic_regs {
 struct vaplic {
     struct vintc vintc;
     struct vaplic_regs regs;
+
+    paddr_t regs_start;
+    unsigned int regs_size;
 };
 
 int domain_vaplic_init(struct domain *d);
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 449240c5cd23..03240730e344 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -17,6 +17,7 @@
 #include <asm/aia.h>
 #include <asm/imsic.h>
 #include <asm/intc.h>
+#include <asm/mmio.h>
 #include <asm/vaplic.h>
 
 #include "aplic-priv.h"
@@ -27,6 +28,256 @@ unsigned int __ro_after_init guest_aplic_num_sources;
 
 #define FDT_VAPLIC_INT_CELLS 2
 
+#define AUTH_IRQ_BIT(d, irqn) ( \
+    ((irqn) < (d)->arch.vintc->nr_virqs) && \
+    test_bit(irqn, (d)->arch.vintc->used_irqs) )
+
+/*
+ * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
+ * a 32-bit word index into the allocated_irqs bitmap.  Each word covers 32
+ * interrupt sources.  For SOURCECFG and TARGET groups the same division also
+ * yields the interrupt number directly, because those arrays store one 32-bit
+ * register per source.
+ */
+#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
+
+static inline uint32_t generate_auth_mask(const struct domain *d,
+                                          unsigned int word_idx)
+{
+    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
+
+    if ( word_idx >= DIV_ROUND_UP(d->arch.vintc->nr_virqs,
+                                  sizeof(uint32_t) * BITS_PER_BYTE) )
+    {
+        dprintk(XENLOG_DEBUG, "incorrect word_idx(%u) is passed\n", word_idx);
+
+        return 0U;
+    }
+
+    return (uint32_t)(d->arch.vintc->used_irqs[first_bit / BITS_PER_LONG] >>
+                      (first_bit % BITS_PER_LONG));
+}
+
+static int cf_check vaplic_emulate_load(const struct vcpu *v,
+                                        const unsigned long addr,
+                                        uint32_t *out)
+{
+    const struct domain *d = v->domain;
+    const struct vaplic *vaplic = to_vaplic(d);
+    const unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
+    uint32_t auth_mask;
+    unsigned int i;
+
+    switch ( offset )
+    {
+    case APLIC_DOMAINCFG:
+        *out = vaplic->regs.domaincfg;
+
+        return 0;
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
+        return 0;
+
+    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
+    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+        i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
+        auth_mask = generate_auth_mask(d, i);
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
+        if ( !AUTH_IRQ_BIT(d, i) )
+        {
+            *out = 0;
+
+            return 0;
+        }
+
+        auth_mask = ~0U;
+
+        break;
+
+    default:
+        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
+                 offset);
+
+        return -EINVAL;
+    }
+
+    *out = aplic_hw_read_reg(offset, auth_mask);
+
+    return 0;
+}
+
+static int cf_check vaplic_emulate_store(const struct vcpu *v,
+                                         unsigned long addr, uint32_t value)
+{
+    int rc = -EINVAL;
+    const struct domain *d = v->domain;
+    unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
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
+        value &= generate_auth_mask(d, word_idx);
+
+        break;
+    }
+
+    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
+        if ( value & APLIC_SOURCECFG_D )
+        {
+            rc = -EOPNOTSUPP;
+
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
+        if ( !AUTH_IRQ_BIT(d, regoffset_to_word_idx(offset - APLIC_DOMAINCFG)) )
+            /* Interrupt not enabled, ignore it */
+            return 0;
+
+        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
+        {
+            gdprintk(XENLOG_ERR,
+                     "value(%u) is incorrect for sourcecfg register\n", value);
+
+            return 0;
+        }
+
+        break;
+
+    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
+    {
+        struct vcpu *target_vcpu = NULL;
+        unsigned int hart_idx = value >> APLIC_TARGET_HART_IDX_SHIFT;
+
+        /*
+         * Look at vaplic_emulate_load() for explanation why
+         * APLIC_GENMSI is subtracted.
+         */
+        if ( !AUTH_IRQ_BIT(d, regoffset_to_word_idx(offset - APLIC_GENMSI)) )
+            /* Interrupt not enabled, ignore it */
+            return 0;
+
+        if ( hart_idx < v->domain->max_vcpus )
+            target_vcpu = v->domain->vcpu[hart_idx];
+
+        if ( !target_vcpu )
+        {
+            dprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
+
+            /* Ignore such writings */
+            return 0;
+        }
+
+        value = aplic_msi_target_gen(target_vcpu, value);
+
+        break;
+    }
+
+    case APLIC_SETIPNUM:
+    case APLIC_SETIPNUM_LE:
+    case APLIC_CLRIPNUM:
+    case APLIC_SETIENUM:
+    case APLIC_CLRIENUM:
+        if ( !value || !AUTH_IRQ_BIT(d, value) )
+            return 0;
+
+        break;
+
+    case APLIC_DOMAINCFG:
+    {
+        struct vaplic *vaplic = to_vaplic(v->domain);
+
+        /*
+         * The domaincfg register has this format:
+         * bits 31:24 read-only 0x80
+         * bit 8      IE
+         * bit 7      read-only 0
+         * bit 2      DM (WARL)
+         * bit 0      BE (WARL)
+         *
+         * The most interesting bit for us is IE(Interrupt Enable) bit.
+         * At the moment, at least, Linux doesn't use domaincfg.IE bit to
+         * disable interrupts globally, but if one day someone will use it
+         * then extra actions should be done.
+         *
+         * Only DM (bit 2) and IE (bit 8) are writable here. They are assigned
+         * (not OR-ed) so that a write of 0 can also clear them (WARL), and the
+         * read-only high byte (0x80) is always kept set on read-back.
+         */
+        if ( value & ~(APLIC_DOMAINCFG_RO | APLIC_DOMAINCFG_DM |
+                       APLIC_DOMAINCFG_IE) )
+            printk_once("%s: Ignore writes to non-writable domaincfg bits as "
+                        "they are set by aplic during initialization in Xen\n",
+                        __func__);
+
+        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
+                                 (value & (APLIC_DOMAINCFG_DM |
+                                           APLIC_DOMAINCFG_IE));
+
+        return 0;
+    }
+
+    default:
+        goto fail;
+    }
+
+    aplic_hw_write_reg(offset, value);
+
+    return 0;
+
+ fail:
+    gdprintk(XENLOG_WARNING,
+             "Unhandled APLIC write at offset %#x (value %#x)\n", offset,
+             value);
+
+    return rc;
+}
+
 static int cf_check vaplic_init(struct vcpu *v)
 {
     return vcpu_imsic_init(v);
@@ -105,6 +356,50 @@ static const struct vintc_init_ops __initconstrel init_ops = {
     .make_domu_dt_node = vaplic_make_domu_dt_node,
 };
 
+static enum io_state cf_check vaplic_mmio_read(struct vcpu *v, mmio_info_t *info,
+                                               register_t *r)
+{
+    uint32_t data = 0;
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
+    if ( vaplic_emulate_load(v, info->gpa, &data) < 0 )
+        return IO_ABORT;
+
+    *r = data;
+    return IO_HANDLED;
+}
+
+static enum io_state cf_check vaplic_mmio_write(struct vcpu *v, mmio_info_t *info,
+                                                register_t r)
+{
+    if ( info->len != sizeof(uint32_t) ||
+         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
+    {
+        gdprintk(XENLOG_DEBUG,
+                 "VAPLIC: unaligned/wrong-width write gpa=%"PRIpaddr" len=%u\n",
+                 info->gpa, info->len);
+        return IO_ABORT;
+    }
+
+    if ( vaplic_emulate_store(v, info->gpa, r) < 0 )
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
     .vcpu_init = vaplic_init,
     .vcpu_deinit = vaplic_deinit,
@@ -132,6 +427,12 @@ int domain_vaplic_init(struct domain *d)
      */
     d->arch.vintc->nr_virqs = guest_aplic_num_sources + 1;
 
+    vaplic->regs_start = GUEST_APLIC_S_BASE;
+    vaplic->regs_size = APLIC_SIZE(d->max_vcpus);
+
+    register_mmio_handler(d, &vaplic_mmio_ops,
+                          vaplic->regs_start, vaplic->regs_size);
+
     return 0;
 }
 
-- 
2.54.0


