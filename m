Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D09CA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:33:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436560.1655229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalZ-0006Il-Te; Tue, 29 Sep 2026 16:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436560.1655229; Tue, 29 Sep 2026 16:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalZ-0006Ie-Q8; Tue, 29 Sep 2026 16:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1436560;
 Tue, 29 Sep 2026 16:33:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504@swg.vates.tech>)
 id 1xBalX-0006Gz-UC
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:33:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBalX-009fcQ-Aw
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:33:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504@swg.vates.tech>)
 id 6abbe841-8faa-0a2a0a5109dd-0a2a450abf7c-26
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:15 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504@swg.vates.tech>)
 id 6abbe84a-f2d2-0a2a450a0019-b9ff1c22a145-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ee0340f9000b504.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Sep 2026 16:33:05 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id DBC2E823AA;
 Tue, 29 Sep 2026 18:33:04 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=CTS+/Cwb14lBhAsJE+PEEI767YXC301XYqZf4BQVRzE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=MVVipobHsgnoU7UarKJ72h9G3YoCoOoIhw9HA0xc8Q5K1S2Z1/8gpv5+HHdkNH47sCJVl0ZzT
 LsU1sOzehvKBmABF2pnbhm7koehcNTyJVZbFOggMV+CmTdJcp4uyl8CZb71GsXrrpzqm0pM4Ydh
 isSme/HPdaB/HBP7IQnOf4RfvctP3A28PUeMOFDwS/8qaXNvHB9jvW8eWn3/ezf+M/KKnfdIisa
 4DjBuHAZEeK6hSMzvbx/3sm2oDQgygomX4k1EomjlslXTNjcD7WuCGzUUH4OcWE64CC/ku4bQNY
 XGBxfIwWQBGn+NEW5PIzs8ZYRythYqUUB1+y02t56k1w==
X-Zone-Loop: 63d9cefa3dd7d43bbd3948d8b16e3843011ef6c02335
x-campaign-type: default
x-transaction-id: fb08bb70-5a72-4b45-b456-bb80af0b281c
x-swg-uid: 01-98c699a9-7980-4f43-b6e3-5a58f6ddfb3c
X-Mailer: Sweego
Message-ID:
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504@vates.tech>
x-swg-bid: 1790699585.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504
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
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3 3/6] xen/riscv: fix A/D bit handling in G-stage mappings
Date: Tue, 29 Sep 2026 18:32:44 +0200
In-Reply-To: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699289; l=10414; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=Mk8xGybs2kVRu6/g1isOlfwZyZJ4XtFG3h9cBFjFKtg=; b=8oJMCfkQP58xS7GtTJYIzHNMGGc5HhAcr1L1GPm5/i3fTUh+lKZh78DytTq4r0LHkrGp45QVd oMobD2lzEWgCJ45nC7pz8RIC8OBQThwniC4/sO1AW8K8EZagjYS0IRz
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790699585075
X-purgate-ID: tlsNG-4011c0/1790699595-53AD4CFC-CA8090B2/0/0
X-purgate-type: clean
X-purgate-size: 10416

There are two schemes for managing the PTE A/D bits: either a page fault is
raised when an access requires A or D to be set (ratified as Svade), or
hardware updates the bits itself (ratified as Svadu).

p2m_set_pte_flags() presets the A/D bits in G-stage PTEs only when Svade is
present in the device tree. When neither Svade nor Svadu is present, this
causes an unhandled page fault.

The four possible Svade/Svadu combinations in the device tree mean (see
[1]):
- neither present: the scheme is unknown, so the A/D bits have to be
  preset. This is harmless if hardware actually updates them itself.
- only Svade present: page faults, so the A/D bits have to be preset.
- only Svadu present: hardware updates the A/D bits.
- both present: hardware updating is off at boot and has to be enabled
  through the SBI FWFT extension, which Xen doesn't support yet, so the A/D
  bits have to be preset.

Hence preset the A/D bits in p2m_set_pte_flags() unless only Svadu is
present, i.e. when (!svadu || svade). Add riscv_resolve_ad_scheme(), called
once from riscv_fill_hwcap(), to warn when both are present but SBI FWFT is
missing, as dropping 'svade' from the DT is then the only way to get Svadu.

[1] https://lwn.net/Articles/980016/

Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v2:
- change commit title.
- preset A/D bits in p2m_set_pte_flags() if (!svadu || svade), instead of
setting RISCV_ISA_EXT_svade in the riscv_isa bitmap for cases 1, 2 and 4.
- riscv_resolve_ad_scheme() now only warns when both Svade and Svadu are
present and SBI FWFT is missing; drop the dead 'svadu && svade' operand.
- repeat XENLOG_WARNING on each line of the warning.
- drop ASSERT(svade != svadu) from p2m_set_pte_flags().
- only add the sbi_probe_extension() declaration to sbi.h.
- rework the comment in p2m_set_pte_flags().
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
 xen/arch/riscv/cpufeature.c             | 43 +++++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  1 +
 xen/arch/riscv/include/asm/sbi.h        |  8 ++++++
 xen/arch/riscv/p2m.c                    | 40 +++++++++---------------------
 4 files changed, 63 insertions(+), 29 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 2d12dffae7..ee35c7a17c 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -20,6 +20,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/sbi.h>
 
 #ifdef CONFIG_ACPI
 # error "cpufeature.c functions should be updated to support ACPI"
@@ -200,6 +201,7 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
     RISCV_ISA_EXT_ENTRY(ssaia,          ANY),
     RISCV_ISA_EXT_ENTRY(sstc,           NONE),
     RISCV_ISA_EXT_ENTRY(svade,          NONE),
+    RISCV_ISA_EXT_ENTRY(svadu,          NONE),
     RISCV_ISA_EXT_ENTRY(svpbmt,         NONE),
 };
 
@@ -500,6 +502,45 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
     }
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
+ *    they need updating.
+ *
+ * 2) Only Svade present in DT => Xen must assume Svade to be always enabled.
+ *
+ * 3) Only Svadu present in DT => Xen must assume Svadu to be always enabled.
+ *
+ * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned off
+ *    at boot time, so it presets the A/D bits. To use Svadu, the supervisor
+ *    must explicitly enable it using the SBI FWFT extension.
+ *
+ * The Svade extension is mandatory and the Svadu extension is optional in the
+ * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
+ * option 3. Platforms aware of the profile can choose option 4, and Xen won't
+ * get the benefit of Svadu until the SBI FWFT extension is available.
+ */
+static void __init riscv_resolve_ad_scheme(void)
+{
+    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
+    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
+
+    if ( svadu && svade )
+        if ( sbi_probe_extension(SBI_EXT_FWFT) <= 0 )
+            printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
+                XENLOG_WARNING "RISC-V: Defaulting to software A/D updates (Svade).\n"
+                XENLOG_WARNING "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");
+}
+
 static bool __init has_isa_extensions_property(void)
 {
     const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
@@ -664,6 +705,8 @@ void __init riscv_fill_hwcap(void)
         __set_bit(RISCV_ISA_EXT_sstc, riscv_isa);
     }
 
+    riscv_resolve_ad_scheme();
+
     for ( i = 0; i < req_extns_amount; i++ )
     {
         const struct riscv_isa_ext_data ext = required_extensions[i];
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 2973eb13a5..7a448d6111 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -41,6 +41,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_ssaia,
     RISCV_ISA_EXT_sstc,
     RISCV_ISA_EXT_svade,
+    RISCV_ISA_EXT_svadu,
     RISCV_ISA_EXT_svpbmt,
     RISCV_ISA_EXT_MAX
 };
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 1952868e96..4efa166603 100644
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
 
+/*
+ * Check if an SBI extension ID is supported or not.
+ *
+ * @return: > 0 if supported, 0 if not, negative errno on SBI error.
+ */
+int sbi_probe_extension(long extid);
+
 /*
  * Initialize SBI library
  *
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index f7b380b90a..5c8e480050 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -586,42 +586,24 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
 
 static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
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
+     * A RISC-V implementation can choose to either:
+     * 1) Update 'A' and 'D' PTE bits in hardware.
+     * 2) Generate page fault when 'A' and/or 'D' PTE bits are not set so that
+     *    software can update these bits.
      *
-     *       To support the more general case and the optimizations mentioned
-     *       above, it would be better to stop setting the A/D bits here and
-     *       instead handle page faults that occur due to unset A/D bits.
+     * Xen supports both options mentioned above: unless the platform guarantees
+     * (1), i.e. only Svadu is present, set 'A' and 'D' so that (2) never
+     * faults.
      */
-    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
+    if ( !svadu || svade )
         e->pte |= PTE_ACCESSED | PTE_DIRTY;
 
     switch ( t )

-- 
2.55.0


