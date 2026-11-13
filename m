Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3569F606A334
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qxr5gQ7a
Received: from list by lists.xenproject.org with outflank-mailman.1487786.1690174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXL-0000o5-DG; Fri, 13 Nov 2026 15:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487786.1690174; Fri, 13 Nov 2026 15:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXK-0000h0-3b; Fri, 13 Nov 2026 15:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1487786;
 Fri, 13 Nov 2026 15:49:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtX5-0006IQ-Bi
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtX4-004T1N-N3
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:42 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73196-2eae-0a2a0a5409dd-0a2a4504bfec-0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:42 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73196-b57f-0a2a45040019-d155dd2ba83e-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:42 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4910b863b84so1324633f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:42 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:41 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584982; x=1795189782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfoEH08SnVd7voBkOOlwylfmHTiwkQJP7iFDqgJ9zDk=;
        b=Qxr5gQ7ap1eepvJgP/Ezd+sdX2iv20+EGFrRgmjml4sZdwtoZjXUnQvN5JTHcJm/34
         chQMit4hiS4+iEs5pCxTA2mvvAEkkTfSvz+sEefXMPY6fFFc+ieFisCXzeeEA7q8m+U7
         JYGHPHmVL4gk9mMM1a9S679ZhHfNr9VZw+/rmh9M14NzgLuSo0TVP+IRJBqqyWRi8c9H
         Vd5/5wo6PuKTbLOemJf/51YJ2xAyYq5jnbY/8LeIzM1dskt6L+6vjRmRuO8HiXenN0AR
         A0ob5gKVg1Opbh/RLRFm0JiGiuS+jLq1YTkQt1NcwZsmPqGjS9gKDSHsjgvgSucW6ExJ
         5fGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584982; x=1795189782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfoEH08SnVd7voBkOOlwylfmHTiwkQJP7iFDqgJ9zDk=;
        b=QSekWUOR2P4tx4KzCe1p9D6OlUM6DyZo3Z/vEsectMERJeRR1qVHPUW2rG+VdryDKU
         RCa8Mr8+k0wh96xzpc1ezBCQggvNZQTsHbd2InZqv/BAtrjH2FRid2AkejHie4j3nBd3
         ZSnvQSO1avWCWacxiYk56DqKXAq9R4zEw+im0L4+U6llxC44x7ZVwJ3Hr/USdru72DMw
         BIZROvpLZQg4kBrAqIqhKExxItZ4vH1Ny5zYP+X0p6Hqk4E/Oxiq6eq9YHQVeC103DJy
         EPqfbcwj4uQL4Vg4wJzWDIyTbmfSZ7H9c+UWboKne/rJjNKyg8C1QYotjx4yq7q2aL/d
         hUAg==
X-Gm-Message-State: APuU4Z8v76+wStpuOPtxX6fjgocTAUAMfgc4YWZP9P45SvVIYkufE8m8
	LqeU5qluzhB0DYTnGKAHryI25+PrfhsG79QTfUdxppjEQHcR4Dnwsa40b7XM+A==
X-Gm-Gg: AYBFou1yXvQ2i8YCniLbXyX7zPoThhp9wOu7IT2KMgRmAo9J/RF5LoDdVkfzyHhgZt5
	rQKx2cMKiQle/vmsRqoLMoLw7lA7PLRiGhagH0IgPazPCi3/ch0T5oynCvz8QbatXAQpMAuK3No
	fW354QoXyuvWh5p3SgcNHNtPpR4R4WDUFaIChgLQyk1ndPTxKrL2wjZP2kj6lZP8ubnNbwLMAds
	/1TEvcLumMpajxYY39363BVWORmeVyPRlig9PWGTseCHBEDObyUj49NA1VG2YlMxhP1//gCoBDZ
	nIsLTbVYbdU+w8DByh68JlFeYlPM+LMBG0//yQzDcepwiDMJeZdc/lh0UcRIJltn2S1MjVZFNoV
	01KOiJYyUGVJF2VUxKOQwOEIbwAph4EkvtPNbUR8nZv1WlOmqEtE3JoyQmjlWcigSU6CGwo8gTB
	Aq7ulAl1XnREeTAPsUHhYBobtYl/GlUQ/nhjn5iBjKI/Zh4wMISf/j+hBNmQ5Og7yi8Z8ahocJ1
	DK41q1LRlzkmwC/Xivpx5KujcrYYl2YbQmxdtz8OtgN/4vVaX7lDQjv5wNmIygo05XkUC+uSAZJ
	EPAcU/SxkzZViY6LCivtMKPkzoFyHTEqBBDU3vs1K8WlcHXcTEHoWte4Wllpv9M5ZVNXcCuvEH3
	7rfHS4oHppbkimQ==
X-Received: by 2002:a05:6000:29ce:b0:492:9c9:65de with SMTP id ffacd0b85a97d-49c6f5e833bmr4971805f8f.5.1794584981974;
        Fri, 13 Nov 2026 07:49:41 -0800 (PST)
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
Subject: [PATCH v4 30/42] xen/riscv: implement APLIC-IMSIC-hart sync barrier for vCPU migration
Date: Fri, 13 Nov 2026 16:48:51 +0100
Message-ID: <2a550952791c51f2f895e954da6f280a42d13cbe.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794584982-C1ED6B50-82263122/10/73395122804
X-purgate-type: spam
X-purgate-size: 11948
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

The last interrupt identity (nr_ids) is reserved for this purpose. As
Xen gives each APLIC source the EIID equal to its number, the sources
from nr_ids on are left unused, so that none of them can satisfy the
barrier early.

Migration doesn't use the barrier at this stage, so imsic_aplic_sync()
is marked __maybe_unused for now.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Order the pending bit clear before the genmsi write with
   RISCV_FENCE(o, o).
 - Replace the sync_id field of struct imsic_config with imsic_sync_id(),
   as it always equals nr_ids.
 - Limit the APLIC sources Xen uses to the identities below the reserved
   ones, as told by the new imsic_nr_free_ids(), and turn the sync_id
   check in imsic_irq_enable() into an ASSERT().
 - Mark imsic_aplic_sync() __maybe_unused rather than referencing it
   from imsic_migrate_vcpu(), which now comes after this patch.
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
 xen/arch/riscv/aplic.c             | 51 ++++++++++++++++++++++++++++++
 xen/arch/riscv/imsic.c             | 47 +++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  3 ++
 xen/arch/riscv/include/asm/imsic.h | 23 ++++++++++++++
 4 files changed, 124 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 825eb60bf444..0be62c9d90f1 100644
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
@@ -185,6 +187,37 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
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
+     * imsic_sync_id() is nr_ids, which imsic_parse_node() limits to
+     * IMSIC_MAX_ID, so it always fits into the EIID field.
+     */
+    BUILD_BUG_ON(IMSIC_MAX_ID > MASK_EXTR(~0U, APLIC_TARGET_EIID));
+    ASSERT(imsic_sync_id(imsic) <= IMSIC_MAX_ID);
+
+    val = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) |
+          imsic_sync_id(imsic);
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
@@ -215,6 +248,7 @@ static int __init cf_check aplic_init(void)
     uint64_t size, paddr;
     const struct dt_device_node *imsic_node;
     const struct dt_device_node *node = aplic_info.node;
+    const struct imsic_config *imsic;
     int rc;
 
     /* Check for associated imsic node */
@@ -239,6 +273,23 @@ static int __init cf_check aplic_init(void)
         panic("%s: failed to get number of interrupt sources\n",
               node->full_name);
 
+    /*
+     * Xen drives the APLIC in MSI delivery mode only, mapping each source 1:1
+     * to an interrupt identity of its own IMSIC interrupt file: source i is
+     * given EIID i (see aplic_set_irq_affinity()). Hence only the sources
+     * numbered up to imsic_nr_free_ids() can be used: the identities above
+     * are either reserved or not implemented.
+     */
+    imsic = imsic_get_config();
+    if ( aplic_info.num_irqs > imsic_nr_free_ids(imsic) )
+    {
+        printk(XENLOG_WARNING
+               "%s: only %u of %u interrupt sources usable with %u IMSIC identities\n",
+               node->full_name, imsic_nr_free_ids(imsic), aplic_info.num_irqs,
+               imsic->nr_ids);
+        aplic_info.num_irqs = imsic_nr_free_ids(imsic);
+    }
+
     guest_aplic_num_sources = min(GUEST_APLIC_MAX_SOURCES, aplic_info.num_irqs);
 
     if ( aplic_info.num_irqs > ARRAY_SIZE(aplic.regs->sourcecfg) )
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 259cf7418f00..3d947226f371 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -27,6 +27,7 @@
 #include <xen/xvmalloc.h>
 
 #include <asm/aia.h>
+#include <asm/aplic.h>
 #include <asm/imsic.h>
 #include <asm/p2m.h>
 #include <asm/vaplic.h>
@@ -62,6 +63,12 @@ static unsigned int __ro_after_init guest_num_msis;
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
@@ -178,6 +185,8 @@ void imsic_irq_enable(unsigned int irq)
      * spin_lock_irqsave() should be used instead of spin_lock().
      */
     ASSERT(!local_irq_is_enabled());
+    /* aplic_init() keeps the APLIC sources off the reserved identities. */
+    ASSERT(irq && irq <= imsic_nr_free_ids(&imsic_cfg));
 
     spin_lock(&imsic_cfg.lock);
     /*
@@ -217,6 +226,15 @@ void imsic_irq_disable(unsigned int irq)
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
@@ -587,6 +605,35 @@ static void imsic_vsfile_deselect(const struct imsic_vsfile_ctx *ctx)
     csr_write(CSR_VSISELECT, ctx->vsiselect);
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
+static void __maybe_unused imsic_aplic_sync(void *unused)
+{
+    imsic_local_eix_update(imsic_sync_id(&imsic_cfg), 1, true, false);
+
+    /*
+     * For FENCE, a CSR write counts as device output, which neither
+     * spin_lock() nor writel() in aplic_genmsi_barrier() orders before the
+     * write to genmsi: should the IMSIC see the clear after the extempore
+     * MSI, the loop below would never end.
+     */
+    RISCV_FENCE(o, o);
+
+    aplic_genmsi_barrier();
+
+    while ( !imsic_local_is_pending(imsic_sync_id(&imsic_cfg)) )
+        cpu_relax();
+}
+
 static void imsic_vsfile_local_clear(const struct imsic_vsfile_data *idata)
 {
     unsigned int i;
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index b2f1d140f6f8..37584039107b 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -89,6 +89,7 @@
 #define APLIC_SETIPNUM_BE               0x2004
 
 #define APLIC_GENMSI                    0x3000
+#define APLIC_GENMSI_BUSY               BIT(12, U)
 
 #define APLIC_TARGET_BASE               0x3004
 #define APLIC_TARGET_LAST               0x3ffc
@@ -173,4 +174,6 @@ struct aplic_regs {
 uint32_t aplic_hw_read_reg(unsigned int offset);
 void aplic_hw_write_reg(unsigned int offset, uint32_t value);
 
+void aplic_genmsi_barrier(void);
+
 #endif /* RISCV_APLIC_H */
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 090e902e4579..1f3ccfbccd1e 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -69,6 +69,29 @@ struct imsic_config {
     spinlock_t lock;
 };
 
+/*
+ * The identities of Xen's own interrupt file are allocated statically:
+ *  - the reserved ones are taken from the top down; so far that's only the
+ *    last one, nr_ids, for APLIC-to-hart synchronization;
+ *  - 1 .. imsic_nr_free_ids(), i.e. all those below the reserved ones, are
+ *    left for the APLIC sources, as Xen gives source N the EIID N
+ *    (aplic_init() drops the sources which don't fit).
+ * A new reserved identity has to be taken below the lowest one reserved so
+ * far, with imsic_nr_free_ids() lowered accordingly.
+ */
+
+/* Interrupt identity reserved for APLIC-to-hart synchronization. */
+static inline unsigned int imsic_sync_id(const struct imsic_config *cfg)
+{
+    return cfg->nr_ids;
+}
+
+/* Interrupt identities 1 .. imsic_nr_free_ids() aren't reserved. */
+static inline unsigned int imsic_nr_free_ids(const struct imsic_config *cfg)
+{
+    return imsic_sync_id(cfg) - 1;
+}
+
 struct vimsic_state {
     /* IMSIC VS-file */
     rwlock_t vsfile_lock;
-- 
2.56.1


