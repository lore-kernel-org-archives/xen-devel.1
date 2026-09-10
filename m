Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BECC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:35:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414227.1644001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBN-0003A0-UW; Thu, 10 Sep 2026 09:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414227.1644001; Thu, 10 Sep 2026 09:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBN-00039t-QO; Thu, 10 Sep 2026 09:35:01 +0000
Received: by outflank-mailman (input) for mailman id 1414227;
 Thu, 10 Sep 2026 09:35:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@swg.vates.tech>)
 id 1x4bBM-00039m-30
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:35:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bBL-007nqx-Fy
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:34:59 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@swg.vates.tech>)
 id 6aa279bd-8faa-0a2a0a5109dd-0a2a4502cc62-22
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:34:59 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@swg.vates.tech>)
 id 6aa279c3-6ca4-0a2a45020019-b9ff1c23b5c1-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:34:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08aab9d76000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 09:34:57 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3373E81DDF;
 Thu, 10 Sep 2026 11:34:57 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=gYWVowcg1/XIljyI4nY8iK28MBBdYrH7NMXkWVSNpfM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=sTiR6FgdvGnCzho+hwFBWWNTxCNMZavPQLPoiXrUorI83SUmBEeVjdpzI4tFBPnkPPkDFtRbw
 qi2/biOF69sDiFNgiEf0sDL6idkS1NbnyYn8LpgOJ075O2IR5la1LUS2vCJuHQTg9msnWdhF6qO
 1yYUL1cWgCaVUjAAQwIiAw89EHD2gaIxSMYadeFFcR+Shw/OSoHnBgIQqJ21l53XOXho0drjFMt
 K2vI0qbbxwVLcci8X0q4fCu5HyuaMNrUhgxNAWI/UT+fECgnURQ3dO06kwClPzeferFUrNXzsLy
 RpAO43oae5+DlT7x8LPOhzipeQ2lesjh2sQK6NBGRvUA==
X-Zone-Loop: 500b563be99b06f20e9ebef69834de1db2119f884266
x-campaign-type: default
x-transaction-id: 60bd194f-56ef-4de6-9b44-6482c5c4eda9
x-swg-uid: 01-0624438b-142b-4702-b68e-5c575101639d
X-Mailer: Sweego
Message-ID:
 <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
x-swg-bid: 1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/6] xen/riscv: fix Svade/Svadu A/D bit handling
Date: Thu, 10 Sep 2026 11:34:49 +0200
In-Reply-To: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789032264; l=10641; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=O+TAA7wrcm6AfiwPOIR/C5+ZEMAyiEayDxvF+dXKij4=; b=OBLZp0zMgkk12Yg/gEuepBjWKf+LHBW3gB7JCv2AO4uChiyS8U4eqLm1A0SZ5UmNBakPr67/z 2q0QUiAHQyGCGr1JLUCw23KK7UnDeig4i1JM2tDy7D2zTG5TPWPxKN6
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789032897403
X-purgate-ID: tlsNG-720697/1789032899-668B42AC-2613E51E/0/0
X-purgate-type: clean
X-purgate-size: 10643

p2m_set_permission() only presets the PTE A/D bits when the Svade extension
is present in the device tree. This causes an unhandled page fault when
neither Svade nor Svadu is present (the platform's actual behaviour is then
unknown), and when both are present in the device tree.

Move the Svade/Svadu resolution out of p2m_set_permission() and into a new
riscv_resolve_ad_scheme(), called once from riscv_fill_hwcap(). For each of
the four possible Svade/Svadu combinations (inspired by [1]), it decides
whether software has to preset the A/D bits and, if so, sets
RISCV_ISA_EXT_svade to record that decision:
- neither present: assume Svade, since assuming Svade is harmless on real
  Svadu hardware, while assuming Svadu on real Svade hardware risks an
  unhandled page fault
- only Svade present: assume Svade
- only Svadu present: leave A/D management to hardware
- both present: Svade wins until Xen supports the SBI FWFT call needed to
  enable hardware updating of A/D bits, so assume Svade and warn that
  dropping 'svade' from the DT is the only way to get Svadu.

[1] https://lwn.net/Articles/980016/

Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v1:
- change commit title
- expose RISCV_ISA_EXT_svadu so the two extensions can be told apart.
- move the Svade/Svadu resolution to a new riscv_resolve_ad_scheme(),
  called once from riscv_fill_hwcap().
- expose sbi_probe_extension() (was static) to probe for SBI FWFT.
- stop presetting A/D bits unconditionally in p2m_set_permission(), do it
  only when Svade is present.
---
 xen/arch/riscv/cpufeature.c             | 59 +++++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  1 +
 xen/arch/riscv/include/asm/sbi.h        |  8 +++++
 xen/arch/riscv/p2m.c                    | 47 ++++++++++----------------
 4 files changed, 86 insertions(+), 29 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 92235fdfd5..19454544a7 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -18,6 +18,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/sbi.h>
 
 #ifdef CONFIG_ACPI
 # error "cpufeature.c functions should be updated to support ACPI"
@@ -468,6 +469,62 @@ static bool __init has_isa_extensions_property(void)
     return false;
 }
 
+/*
+ * Svade and Svadu extensions represent two schemes for managing the PTE A/D
+ * bits. When the PTE A/D bits need to be set, the Svade extension indicates
+ * that a page fault will be raised. In contrast, the Svadu extension supports
+ * hardware updating of the PTE A/D bits.
+ *
+ * There are 4 possible combinations of these extensions in the device tree.
+ * The default hardware behavior for each is:
+ *
+ * 1) Neither Svade nor Svadu present in DT => It is technically unknown
+ *    whether the platform uses Svade or Svadu. Xen should be prepared to
+ *    handle either hardware updating of the PTE A/D bits or page faults when
+ *    they need updating. In that case, Xen assumes Svade because it's
+ *    harmless if the platform is actually Svadu, while assuming Svadu on real
+ *    Svade hardware risks an unhandled page fault.
+ *
+ * 2) Only Svade present in DT => Xen must assume Svade to be always enabled.
+ *
+ * 3) Only Svadu present in DT => Xen must assume Svadu to be always enabled.
+ *
+ * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned off
+ *    at boot time by setting A/D bits. To use Svadu, the supervisor must
+ *    explicitly enable it using the SBI FWFT extension.
+ *
+ * The Svade extension is mandatory and the Svadu extension is optional in the
+ * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
+ * option 3. Platforms aware of the profile can choose option 4, and Xen won't
+ * get the benefit of Svadu until the SBI FWFT extension is available.
+ *
+ * In other words, hardware manages the A/D bits on its own only in case 3, in
+ * all the other cases software has to preset them. Instead of open coding this
+ * in every A/D bits user, RISCV_ISA_EXT_svade is used to mean "software is
+ * responsible for the A/D bits" and is set here for the cases 1, 2 and 4.
+ */
+static void __init riscv_resolve_ad_scheme(void)
+{
+    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
+    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
+
+    /* Case 3: leave the A/D bits management to hardware. */
+    if ( svadu && !svade )
+        return;
+
+    /* Case 4 */
+    if ( svadu && svade ){
+        if ( !sbi_probe_extension(SBI_EXT_FWFT) ){
+          printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
+                  "RISC-V: Defaulting to software A/D updates (Svade).\n"
+                  "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");
+        }
+    }
+
+    /* Cases 1, 2: Xen assume Svade to be enabled */
+    __set_bit(RISCV_ISA_EXT_svade, riscv_isa);
+}
+
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
                                    enum riscv_isa_ext_id id)
 {
@@ -513,6 +570,8 @@ void __init riscv_fill_hwcap(void)
         __set_bit(RISCV_ISA_EXT_sstc, riscv_isa);
     }
 
+    riscv_resolve_ad_scheme();
+
     for ( i = 0; i < req_extns_amount; i++ )
     {
         const struct riscv_isa_ext_data ext = required_extensions[i];
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 0c48d57a03..74200ce7c9 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -41,6 +41,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_sstc,
     RISCV_ISA_EXT_svade,
     RISCV_ISA_EXT_svpbmt,
+    RISCV_ISA_EXT_svadu,
     RISCV_ISA_EXT_MAX
 };
 
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 1952868e96..4f13e8c7a0 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -30,6 +30,7 @@
 #define SBI_EXT_BASE                    0x10
 #define SBI_EXT_RFENCE                  0x52464E43
 #define SBI_EXT_TIME                    0x54494D45
+#define SBI_EXT_FWFT                    0x46574654
 
 /* SBI function IDs for BASE extension */
 #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
@@ -138,6 +139,13 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
 int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
                                 size_t size, unsigned long vmid);
 
+/**
+ * Check if an SBI extension ID is supported or not.
+ * @extid: The extension ID to be probed.
+ *
+ * @return: 1 or an extension specific nonzero value if yes, 0 otherwise.
+ */
+int sbi_probe_extension(long extid);
 /*
  * Initialize SBI library
  *
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 1cea86512c..22ad4a2aee 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -586,42 +586,31 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
 
 static void p2m_set_permission(pte_t *e, p2m_type_t t)
 {
+    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
+    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
+
     e->pte &= ~PTE_ACCESS_MASK;
 
     e->pte |= PTE_USER;
 
     /*
-     * Two schemes to manage the A and D bits are defined:
-     *   • The Svade extension: when a virtual page is accessed and the A bit
-     *     is clear, or is written and the D bit is clear, a page-fault
-     *     exception is raised.
-     *   • When the Svade extension is not implemented, the following scheme
-     *     applies.
-     *     When a virtual page is accessed and the A bit is clear, the PTE is
-     *     updated to set the A bit. When the virtual page is written and the
-     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
-     *     address translation is in use and is not Bare, the G-stage virtual
-     *     pages may be accessed or written by implicit accesses to VS-level
-     *     memory management data structures, such as page tables.
-     * Thereby to avoid a page-fault in case of Svade is available, it is
-     * necessary to set A and D bits.
-     *
-     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
-     *       delegates page faults to a lower privilege mode and so OpenSBI
-     *       isn't expect to handle page-faults occured in lower modes.
-     *       By setting the A/D bits here, page faults that would otherwise
-     *       be generated due to unset A/D bits will not occur in Xen.
-     *
-     *       Currently, Xen on RISC-V does not make use of the information
-     *       that could be obtained from handling such page faults, which
-     *       could otherwise be useful for several use cases such as demand
-     *       paging, cache-flushing optimizations, memory access tracking,etc.
+     * riscv_fill_hwcap() sets either RISCV_ISA_EXT_svade or
+     * RISCV_ISA_EXT_svadu (mutually exclusive) depending on the Svade/Svadu
+     * device tree combination (see riscv_resolve_ad_scheme()):
+     * - RISCV_ISA_EXT_svade means that software is responsible for the A/D
+     *   bits.
+     * - RISCV_ISA_EXT_svadu means the hardware is responsible for the A/D
+     *   bits.
      *
-     *       To support the more general case and the optimizations mentioned
-     *       above, it would be better to stop setting the A/D bits here and
-     *       instead handle page faults that occur due to unset A/D bits.
+     * Currently, when RISCV_ISA_EXT_svade is set, Xen doesn't track A/D
+     * bits, so it does not make use of the information that could be
+     * obtained from handling the resulting page faults, which could
+     * otherwise be useful for several use cases such as demand paging,
+     * cache-flushing optimizations, memory access tracking, etc. To avoid
+     * such a page fault, Xen presets the A and D bits instead.
      */
-    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
+    ASSERT(svade != svadu); /* exactly one of svade/svadu must be set by riscv_fill_hwcap() */
+    if ( svade )
         e->pte |= PTE_ACCESSED | PTE_DIRTY;
 
     switch ( t )

-- 
2.55.0


