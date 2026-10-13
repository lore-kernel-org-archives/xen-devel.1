Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4092FCC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:07:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446886.1662999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZPq-0004CE-GJ; Tue, 13 Oct 2026 10:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446886.1662999; Tue, 13 Oct 2026 10:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZPq-0004C7-DH; Tue, 13 Oct 2026 10:07:26 +0000
Received: by outflank-mailman (input) for mailman id 1446886;
 Tue, 13 Oct 2026 10:07:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@swg.vates.tech>)
 id 1xGZPp-0004By-2L
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:07:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZPo-00EvYK-6M
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:07:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@swg.vates.tech>)
 id 6ace02d0-e002-0a2a0a5209dd-0a2a4509b680-46
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:07:24 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@swg.vates.tech>)
 id 6ace02db-be1a-0a2a45090019-b9ff1c229891-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:07:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a134bb169d0008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 10:07:18 +0000
Received: from leducb.home (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B4E2182990;
 Tue, 13 Oct 2026 12:07:17 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=8teWVWejhPLG6xNGLIN8xlYcoOyIlp83feFf6NZmWPw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=WBlOfhpQ+US+Yw2OYVZosa+rMrX0x4NaEbpAr5B+AkO/CtzZDP4bhbGiqjr+aNdW767+SqmrS
 /qVW8SAjAIKmGhbvMLQp5B0eunO62TL3gNY5CNaPhXVZQ+vOl76YMYWKD/LQjH+8M3aljQi/cu5
 FgdaRRJhIX662qD0lg6YmVBhu1KGZGenyRrCr+1IqcfSo99RUrmo42fcGUhNyFDOYeP3Jm9gAGu
 T7XRhtMMhfMzJf5mSqYcC6rEwBJt2PCMd9fXRe80lInYvbHqIw/GrUOFn13sxPcMSy+/umrIX9Z
 RC/nkNrANpjwDmERm3qEbc/TheHVOhy3b7n18RpC8KSA==
X-Zone-Loop: 711da3f44893e60fb7830ddb2da63de3298db7ec2e8f
x-campaign-type: default
x-transaction-id: 937a9762-1bc2-42aa-982b-644ce61b6688
x-swg-uid: 01-896914e9-55ab-4bc5-9b6c-be76e1224f87
X-Mailer: Sweego
Message-ID:
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
x-swg-bid: 1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>
Subject: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at boot
Date: Tue, 13 Oct 2026 12:07:10 +0200
In-Reply-To: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791885856; l=6663; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=OTMIVll/AQFPtyeJIuGVE8cRR2HbRSAUit0myRvwEDQ=; b=dqgWVqjSlntGy/q+e6qgOVUhs9UJGRQN3mt8zjil3THgpaFM0FusztA0PdX9zgSn3GOiC37Bo L1wkzmJcT/MCQWeat/GD4P199dIh6R/ekvD08hXi2dXCku1gA708Su0
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791886037948
X-purgate-ID: tlsNG-bad1c0/1791886044-BDAC0034-D2CB0D37/0/0
X-purgate-type: clean
X-purgate-size: 6665

p2m_set_pte_flags() presets the A/D bits of G-stage PTEs only when
RISCV_ISA_EXT_svade is set, which today only reflects the device tree.
Platforms that fault on clear A/D bits without advertising Svade, such as
the HiFive Premier P550, then leave A/D clear and take guest-page faults
that Xen does not handle. The device tree cannot be trusted alone to tell
which scheme is in effect.

Introduce probe_hw_ad_update(): map a scratch page through the FIX_MISC
fixmap slot with a PTE whose A bit is clear, and read from it under an
exception table fixup. The read succeeds if hardware updates A/D bits and
faults otherwise.

Introduce resolve_ad_scheme(), called from riscv_fill_hwcap(), to check the
probe against what the device tree advertises, following the DT binding:
- Svade and Svadu: if the probe faults, Svade applies. Warn that hardware
  updating can be used by dropping Svade from the device tree, or through
  SBI FWFT once Xen supports it. Otherwise hardware updating applies and
  nothing is needed.
- Svadu only: firmware must have enabled hardware updating. Panic if the
  probe faults.
- Svade only: the hart must not update A/D bits. Assert the probe faults.
- Neither: record the probed scheme by setting RISCV_ISA_EXT_svadu or
  RISCV_ISA_EXT_svade.

Add Svadu to the known ISA extensions so it can be told apart from Svade.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v5:
- new patch, probe the A/D bits update scheme instead of trusting the
  device tree alone.
---
 xen/arch/riscv/cpufeature.c             | 97 +++++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  1 +
 2 files changed, 98 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 3d5bbd2228..60e48652a6 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -20,6 +20,8 @@
 
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/fixmap.h>
+#include <asm/pmap.h>
 
 #ifdef CONFIG_ACPI
 # error "cpufeature.c functions should be updated to support ACPI"
@@ -200,6 +202,7 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
     RISCV_ISA_EXT_ENTRY(ssaia,          ANY),
     RISCV_ISA_EXT_ENTRY(sstc,           NONE),
     RISCV_ISA_EXT_ENTRY(svade,          NONE),
+    RISCV_ISA_EXT_ENTRY(svadu,          NONE),
     RISCV_ISA_EXT_ENTRY(svpbmt,         NONE),
 };
 
@@ -620,6 +623,98 @@ static void __init compute_guest_isa(void)
         panic("Failed to build guest \"riscv,isa\" string\n");
 }
 
+static bool __init probe_hw_ad_update(void)
+{
+    bool updated = false;
+    unsigned int slot = FIX_MISC;
+    vaddr_t va = FIXMAP_ADDR(slot);
+    struct page_info *pg;
+    pte_t *entry, pte;
+    mfn_t mfn;
+    unsigned long tmp;
+
+    pg = alloc_domheap_page(NULL, 0);
+    if ( !pg )
+        return false;
+
+    mfn = page_to_mfn(pg);
+
+    arch_pmap_map(FIX_MISC, mfn);
+    entry = &xen_fixmap[slot];
+    pte = pte_from_mfn(mfn, PTE_VALID | PTE_READABLE);
+    write_pte(entry, pte);
+
+    flush_tlb_one_local(va);
+
+    asm_inline volatile (
+        "1: ld %[tmp], 0(%[va])\n"
+        "   li %[updated], 1\n"
+        "2:\n"
+        ASM_EXTABLE(1b, 2b)
+        : [tmp] "=&r" (tmp), [updated] "+r" (updated)
+        : [va] "r" (va)
+        : "memory" );
+
+    arch_pmap_unmap(slot);
+    free_domheap_page(pg);
+
+    return updated;
+}
+
+/*
+ * The privileged spec allows exactly two schemes for the PTE A and D bits:
+ *  1) hardware sets them on access and on write.
+ *  2) accessing a page whose A and/or D bit is clear raises a page fault,
+ *     so that software can set them (ratified as Svade).
+ *
+ * Hence an implementation without Svade uses the hardware scheme (1), and one
+ * that faults on clear A/D bits implements Svade, whether or not it says so.
+ *
+ * Svadu isn't itself a scheme: it adds menvcfg.ADUE, selecting between the
+ * two for S-mode and G-stage translation, and henvcfg.ADUE, doing the same
+ * for VS-stage translation (read-only zero when menvcfg.ADUE is zero).
+ *
+ * Rather than trusting the DTS alone, probe the scheme in effect with a read
+ * through a PTE whose A bit is clear, and check it against what the DTS
+ * advertises, as described by the DT binding. Panic on a mismatch Xen cannot
+ * run with, and record the probed scheme when the DTS advertises neither.
+ */
+static void __init resolve_ad_scheme(void)
+{
+    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
+    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
+    bool has_hw_update = probe_hw_ad_update();
+
+    /* Both advertised: Svade applies until FWFT enables hardware updating. */
+    if ( svade && svadu )
+    {
+        if ( !has_hw_update )
+            printk(XENLOG_WARNING
+                   "Svade and Svadu are both advertised, but software updates A/D bits. "
+                   "To use hardware updating, drop Svade from the DTS or use FWFT (not implemented yet)\n");
+        return;
+    }
+
+    /* Only Svadu advertised: firmware must have enabled hardware updating. */
+    if ( svadu )
+    {
+        if ( !has_hw_update )
+            panic("Svadu is advertised but A/D bits are not updated by hardware\n");
+        return;
+    }
+
+    /* Only Svade advertised: the hart must not update A/D bits. */
+    if ( svade )
+    {
+        ASSERT(!has_hw_update);
+        return;
+    }
+
+    /* Neither advertised: trust the probe. */
+    __set_bit(has_hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
+              riscv_isa);
+}
+
 void init_guest_isa(struct domain *d)
 {
     d->arch.isa = guest_isa;
@@ -674,6 +769,8 @@ void __init riscv_fill_hwcap(void)
                "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
                "wire up this platform's pause equivalent in cpu_relax()\n");
 
+    resolve_ad_scheme();
+
     for ( i = 0; i < req_extns_amount; i++ )
     {
         const struct riscv_isa_ext_data ext = required_extensions[i];
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 2973eb13a5..6fb8ad4b9c 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -42,6 +42,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_sstc,
     RISCV_ISA_EXT_svade,
     RISCV_ISA_EXT_svpbmt,
+    RISCV_ISA_EXT_svadu,
     RISCV_ISA_EXT_MAX
 };
 

-- 
2.55.0


