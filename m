Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A69CA5FCB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:25:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437577.1656639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6n-0008Kh-KL; Wed, 30 Sep 2026 16:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437577.1656639; Wed, 30 Sep 2026 16:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6m-0008G1-8A; Wed, 30 Sep 2026 16:24:40 +0000
Received: by outflank-mailman (input) for mailman id 1437577;
 Wed, 30 Sep 2026 16:24:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6i-0007Op-1W
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6h-00GhY9-Dy
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:35 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b7-8faa-0a2a0a5109dd-0a2a4503edf2-32
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:35 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c3-fae8-0a2a45030019-4a7de18dbec0-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:35 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49ccf3ca626so34554065e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:35 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785475; x=1791390275; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KA/gB3ogwiCD2vdEVkhrFhPeGIZ+VRrxnqBF242SsNk=;
        b=sXVrniVBZpFMSttLvhkJGdDQ6rdmLi82XszK0P+Uvsm/DX5qEMlqWjgk+NulW26z1d
         PQMZJTz0mOP/NaK9f/XS0b6qPV3BGtJGcKeEe+6lg85RAJQiFRGBUofo/jtuba9xzrBy
         t1RtCQ+l6GC3rBEtQYcd++s5uLC6NZdml/au0YOBdV0G1PuHmpTK2F/gUHQKYsySVcom
         XJ/3Wbivrc7YjnQjK0wYgS8eUOOIMXX/kNnmJ6KO1zDOXnzk6/YYMtk1orA2ErTrf/OQ
         7VJ2jjZS+Z5iA3BSRSa1Jg1zpW2EvLDR4gqqbrRroo9Ro+397R062l5HUtszW1fJ+LtU
         es3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785475; x=1791390275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KA/gB3ogwiCD2vdEVkhrFhPeGIZ+VRrxnqBF242SsNk=;
        b=F7yZgP8SK9bqzsI5B/DDHocLWggYfJSN3U+vf8MgqS0ijDG5j70i+p93N0N8rlElQn
         0MNRKVekgZX/cLNecFgH8ViMOZjMlZti0CvC1MjtVb2cllVZmljA/fudh2Y58pSpwjHj
         i2wKlZSyncr8vqlrDzuqocVJKaRSoN/C6ojkj0XEWvD604cZo1g3smsLhX4JQIla/JLd
         nuoDRRipMT2PUxXsDRLtLcGOEwEFBzXTFcI2UmnEReuwtXaigFSLwciY3Iqf/aLcyvRP
         oLwNIzjK+obCb5GmVg6IGBGsKQWkgayE16QXAkAiSR8S8Zw/W/iK2eTNaZpqmpu4GJyt
         1CfA==
X-Gm-Message-State: AFuF++kVt44lBxJghNOKzEp+5CS2ABLZu/sqkgvLO4NY2nO2jSoU7dMV
	5R+KHFgb0LYiURvba2jkNOwG830RpMV2bgbCgpwvI8VBpAETfEFqim4EaJ4yow==
X-Gm-Gg: AYBFou0jTCOczxy5YK+TZOZGpUoJuFaA8pXjRdbwMpIc48IIj4irN+vrxwl+Nff8NnW
	k6QaENP31BZsYVAbDdRg78n+NGmH4Jf1XFwJfn65LZuclBjTwxv5OwMEroPSFcGViOdLbdp4oKn
	GvwYQ1rBpfSkZ3Nn2BtITZZJduTXm/XmxddhruUCr5pOko5M+y9btL4jQrtXexRX7XrTWzH/eX9
	7i1m+HeJG6OruZJPr/gDEXlqxMYE5DlD1l7GmTa9weSvvvdJ8ezo1MKfPOyjqiLS+qOQJw60MTv
	f5FnFKZUXsoWf1KkS2I3UhtrBawQK+z9//PK5yMmv4wuzPhAhIvTUnjs8yyAXZfsZAplaefHC6y
	IjHGYJXkS35pwVqhZ4WYv0BgcVdtM8Njr7bz3fbrhfDmb6nZoq8QwLDDxmgUuJKXLtiYVbnM4Vi
	eEDBr9o4vAF5nTNTaPR29NRs+/Zbeqai1VrB5Kvk/26Ewpj4/5h5s0fSsgyRmi92QKn2LGrw5TZ
	4hpmL7OC83MgMYajSIMgBbn0XGnpej3aLcJKPhtYdmFV0m57llh
X-Received: by 2002:a05:600c:3b23:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a01b119661mr35155385e9.19.1790785474621;
        Wed, 30 Sep 2026 09:24:34 -0700 (PDT)
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
Subject: [PATCH v3 30/39] xen/riscv: implement APLIC-IMSIC-hart sync barrier for vCPU migration
Date: Wed, 30 Sep 2026 18:23:49 +0200
Message-ID: <2075cb10e5f6df787b29f2f087632c82b787a007.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790785475-752854E9-060C0423/10/73395122804
X-purgate-type: spam
X-purgate-size: 9612

When a vCPU is moved to a different guest interrupt file, MSIs that the
APLIC has already sent towards the old file may still be in flight. They
must land before the old file's state is saved and the switch is done,
otherwise they would be lost.

To wait for them, use the APLIC's genmsi register. Writing it makes the
APLIC itself send an MSI (an "extempore" MSI) with a given interrupt
identity to a given hart. genmsi can only target the hart's hypervisor-
level interrupt file, not a guest one, but the AIA spec guarantees that
all MSIs previously sent by the same APLIC to the same hart become
visible at the hart's IMSIC before the extempore MSI does. So once the
extempore MSI has been delivered, no older MSI from this APLIC to the
hart can still be in flight, whichever interrupt file it targets.

genmsi's Busy bit clearing only tells that the APLIC has sent the
extempore MSI, not that it has arrived, so the sequence described in the
AIA spec under "Synchronizing interactions between a hart and the APLIC"
is split in two. aplic_genmsi_barrier() does the APLIC side, while
imsic_aplic_sync() does the hart side: it clears the pending bit of the
reserved identity before the genmsi write and spins on it afterwards,
which is what tells that the extempore MSI, and hence every older MSI
from this APLIC to this hart, has really arrived. Keeping the hart side
in imsic.c leaves the APLIC code free of the IMSIC local CSR accessors.

The last interrupt identity (nr_ids) is reserved for this purpose.

Migration doesn't use the barrier at this stage, so imsic_migrate_vcpu()
only references imsic_aplic_sync() to keep the compiler from complaining
about it being unused.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Rename from "xen/riscv: implement APLIC-hart sync barrier for vCPU
   migration", as the barrier waits for the MSIs to reach the hart's IMSIC.
 - Re-word the commit message, describing in it how the sequence is split
   between aplic_genmsi_barrier() and imsic_aplic_sync().
 - Move imsic_aplic_sync(), imsic_local_is_pending() and imsic_csr_read()
   here from "xen/riscv: remap interrupts to new IMSIC VS-file", so that
   both halves of the synchronization sequence are introduced together.
 - s/aplic_hart_field/aplic_hart_index/ following the rename of the helper
   in "xen/riscv: implement virtual APLIC MMIO emulation".
 - Drop masking of sync_id with APLIC_TARGET_EIID, which could silently
   chop off bits; instead add BUILD_BUG_ON() and ASSERT() to make it
   explicit that sync_id always fits into the EIID field.
 - Drop the redundant parentheses around the macro argument in
   imsic_csr_read().
 - Use unsigned int for isel in imsic_local_is_pending() and drop the
   redundant !! as the function returns bool.
 - Rename the unused argument of imsic_aplic_sync() to unused.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aplic.c             | 33 +++++++++++++++++++
 xen/arch/riscv/imsic.c             | 52 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  3 ++
 xen/arch/riscv/include/asm/imsic.h |  8 +++++
 4 files changed, 96 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 283e5d6046a6..5f9a894b5a76 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -27,7 +27,9 @@
 #include <asm/imsic.h>
 #include <asm/intc.h>
 #include <asm/io.h>
+#include <asm/processor.h>
 #include <asm/riscv_encoding.h>
+#include <asm/smp.h>
 
 static struct aplic_priv aplic = {
     .lock = SPIN_LOCK_UNLOCKED,
@@ -183,6 +185,37 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
     spin_unlock_irqrestore(&aplic.lock, flags);
 }
 
+/*
+ * As needed, synchronize with all IOMMUs and APLICs to ensure that no
+ * straggler MSIs will arrive at the old interrupt file after this step.
+ */
+void aplic_genmsi_barrier(void)
+{
+    const struct imsic_config *imsic = imsic_get_config();
+    unsigned int cpu = smp_processor_id();
+    unsigned long flags;
+    uint32_t val;
+
+    /*
+     * sync_id is nr_ids, which imsic_parse_node() limits to IMSIC_MAX_ID,
+     * so it always fits into the EIID field.
+     */
+    BUILD_BUG_ON(IMSIC_MAX_ID > MASK_EXTR(~0U, APLIC_TARGET_EIID));
+    ASSERT(imsic->sync_id <= IMSIC_MAX_ID);
+
+    val = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) |
+          imsic->sync_id;
+
+    spin_lock_irqsave(&aplic.lock, flags);
+
+    writel(val, &aplic.regs->genmsi);
+
+    while ( readl(&aplic.regs->genmsi) & APLIC_GENMSI_BUSY )
+        cpu_relax();
+
+    spin_unlock_irqrestore(&aplic.lock, flags);
+}
+
 static void __init aplic_init_hw_interrupts(void)
 {
     unsigned int i;
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index f1e44dc56bb8..8e0273eab902 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -27,6 +27,7 @@
 #include <xen/xvmalloc.h>
 
 #include <asm/aia.h>
+#include <asm/aplic.h>
 #include <asm/imsic.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
@@ -60,6 +61,12 @@ static unsigned int __ro_after_init guest_num_msis;
 #define IMSIC_DISABLE_EITHRESHOLD   1
 #define IMSIC_ENABLE_EITHRESHOLD    0
 
+#define imsic_csr_read(c)       \
+({                              \
+    csr_write(CSR_SISELECT, c); \
+    csr_read(CSR_SIREG);        \
+})
+
 #define imsic_csr_write(c, v)   \
 do {                            \
     csr_write(CSR_SISELECT, c); \
@@ -203,6 +210,15 @@ void imsic_irq_enable(unsigned int irq)
      */
     ASSERT(!local_irq_is_enabled());
 
+    if ( irq == imsic_cfg.sync_id )
+    {
+        printk(XENLOG_WARNING
+               "irq%u is reserved for APLIC sync so shouldn't be set by %s\n",
+               irq, __func__);
+
+        return;
+    }
+
     spin_lock(&imsic_cfg.lock);
     /*
      * There is no irq - 1 here (look at aplic_set_irq_type()) because:
@@ -241,6 +257,15 @@ void imsic_irq_disable(unsigned int irq)
     spin_unlock(&imsic_cfg.lock);
 }
 
+static bool imsic_local_is_pending(unsigned int id)
+{
+    unsigned int isel =
+        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
+    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
+
+    return imsic_csr_read(isel) & bit;
+}
+
 /* Callers aren't intended to changed imsic_cfg so return const. */
 const struct imsic_config *imsic_get_config(void)
 {
@@ -387,6 +412,9 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
 
     imsic_cfg.nr_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1, 64);
 
+    /* Reserve last identity for APLIC-to-hart synchronization */
+    imsic_cfg.sync_id = imsic_cfg.nr_ids;
+
     /* Compute base address */
     *nr_mmios = 0;
     rc = dt_device_get_address(node, *nr_mmios, &base_addr, NULL);
@@ -497,6 +525,27 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
         on_selected_cpus(cpumask_of(cpu), func, data, 1);
 }
 
+/*
+ * Ensure that all the MSIs the APLIC has already generated for the hart this
+ * runs on have really reached the hart's IMSIC.
+ *
+ * The barrier is the one described by the AIA specification in
+ * "Synchronizing interactions between a hart and the APLIC": ask the APLIC to
+ * send an MSI to the hart itself and wait until it shows up as pending in the
+ * hart's own interrupt file. As it says nothing about MSIs on their way to
+ * any other hart, it has to be executed by the pCPU owning the interrupt file
+ * the MSIs were being sent to.
+ */
+static void cf_check imsic_aplic_sync(void *unused)
+{
+    imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);
+
+    aplic_genmsi_barrier();
+
+    while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
+        cpu_relax();
+}
+
 static void cf_check imsic_vsfile_local_clear(void *data)
 {
     unsigned int i;
@@ -862,5 +911,8 @@ void imsic_migrate_vcpu(struct vcpu *v)
     /* Zero-out new IMSIC VS-file */
     imsic_call_on_cpu(v->processor, imsic_vsfile_local_clear, &vsfile_data);
 
+    /* Avoid an unused-function error until the barrier has a user. */
+    (void)imsic_aplic_sync;
+
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 9018936ca95a..bfb510b2ae5e 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -94,6 +94,7 @@
 #define APLIC_SETIPNUM_LE               0x2000
 
 #define APLIC_GENMSI                    0x3000
+#define APLIC_GENMSI_BUSY               BIT(12, U)
 
 #define APLIC_TARGET_BASE               0x3004
 #define APLIC_TARGET_LAST               0x3ffc
@@ -177,4 +178,6 @@ struct aplic_regs {
 uint32_t aplic_hw_read_reg(unsigned int offset);
 void aplic_hw_write_reg(unsigned int offset, uint32_t value);
 
+void aplic_genmsi_barrier(void);
+
 #endif /* ASM_RISCV_APLIC_H */
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 8130d125f5c3..f86407e21765 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -62,6 +62,14 @@ struct imsic_config {
      */
     unsigned int nr_eix;
 
+    /*
+     * Interrupt identity reserved exclusively for APLIC-to-hart
+     * synchronization.
+     *
+     * Must not be allocated to any interrupt source.
+     */
+    unsigned int sync_id;
+
     /* MSI */
     const struct imsic_msi *msi;
 
-- 
2.55.0


