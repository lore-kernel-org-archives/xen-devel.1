Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB4DC79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:35:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414229.1644018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBW-0003do-FJ; Thu, 10 Sep 2026 09:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414229.1644018; Thu, 10 Sep 2026 09:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBW-0003dh-C6; Thu, 10 Sep 2026 09:35:10 +0000
Received: by outflank-mailman (input) for mailman id 1414229;
 Thu, 10 Sep 2026 09:35:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@swg.vates.tech>)
 id 1x4bBU-0003cL-TQ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:35:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bBU-00G7oY-A2
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:35:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@swg.vates.tech>)
 id 6aa279bd-8faa-0a2a0a5109dd-0a2a4502cc62-48
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:08 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@swg.vates.tech>)
 id 6aa279cb-6ca4-0a2a45020019-b9ff1c22b70b-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08aab9fe1000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 09:34:58 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E19E581E0F;
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
 q=dns/txt; s=selector1; bh=y+IsxIUnoTJ7eAPggcrJIaoVT6eUFG1bxyCAiLEuHMg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=mVEoV+cdWmYpo0yN2PoFoFm6su5rVz9xmpjr2yWvBwTfeGCwU96zUfmc9E0dv31V+3n0L6SqX
 +PWI9+HXQzGFqDsxOYcO4Z820DzupzKK5U5dCg8Fj5W8E+ZSYamWl759jj7I3JAWrBsEqChpI1t
 1s9GuejpFOvyLtUH7lA4JYTbw4IMYhVc2jnCWOuC3xuEphcxH1HTkT8m/cEgAxrNnF0NNsk8FVo
 MXaho4VsObjRpr2I+H0IMjeVx6Bs1XhFSW/5qYizoZa5mJqK5L/nVP6glqHXIFrgQ22HwTgAyhy
 Jz8lJAu568BFdwK9rwxaD7KZY0ufZ8U0a7HQ1HxIMFrQ==
X-Zone-Loop: fed367620279910bd4afbcd0f0efd652e782570c53d3
x-campaign-type: default
x-transaction-id: df48f6a2-9f66-4e4c-a685-0a9b35d69214
x-swg-uid: 01-a095095e-5f1b-4da2-8e07-b164421b7cdd
X-Mailer: Sweego
Message-ID:
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@vates.tech>
x-swg-bid: 1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3
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
Subject: [PATCH v2 3/6] xen/riscv: make Svpbmt no longer a required extension
Date: Thu, 10 Sep 2026 11:34:51 +0200
In-Reply-To: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789032264; l=6794; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=jrynfzaXIgAgy7hsDbMYdbj40qrjRkErilQHWPhMvw4=; b=jL58PSCbRDoyd13ZmmFspDh5pZCqXjOmrh0K13a6ZPVkYgmY5IWP9x+fS03FnnxWULDTx4l7h Y8s8jl0vBxBBVXMlCqdTfn2fFLY9fQANeduvMqcWWxF/HvFFkatZITX
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789032898104
X-purgate-ID: tlsNG-720697/1789032908-F2EB32AC-725EF78D/0/0
X-purgate-type: clean
X-purgate-size: 6796

Without the Svpbmt extension, memory attributes (such as cacheability and
ordering) are strictly tied to physical address ranges and enforced by the
hardware's Physical Memory Attributes (PMA) checker.

In this configuration, supervisor software relies on the platform's memory
map:
    - peripheral device registers (MMIO) are physically mapped into
      hardware-defined I/O regions (which are implicitly non-cacheable and
      strongly-ordered)
    - regular RAM is mapped as cacheable main memory.

S-mode paging can safely map these physical ranges without specifying
page-based memory types in the PTEs, as the hardware MMU and PMA pipeline
will correctly bypass caches for MMIO accesses and use caches for RAM
accesses, based on the target physical address.

Furthermore, on platforms that either feature fully hardware-coherent DMA
or don't expose non-coherent DMA agents to the OS, page-level programmatic
cache control via Svpbmt is not required, making it safe to boot and run
when Svpbmt is absent.

Drop Svpbmt from required_extensions. Introduce svpbmt_enabled, a
__ro_after_init flag computed once in init_csr_masks() from ISA
availability and the henvcfg.PBMTE bit. Xen cannot read menvcfg.PBMTE
directly, since menvcfg is M-mode-only and unreadable from HS-mode, but the
spec guarantees henvcfg.PBMTE reads as zero whenever menvcfg.PBMTE is zero,
so checking henvcfg.PBMTE alone is sufficient. Use svpbmt_enabled in
pte_pbmt_nocache()/pte_pbmt_io(), two new inline helpers that mask the PBMT
encoding down to 0 when Svpbmt is unavailable.

Also switch vcpu_csr_init() branch to determine if Svpbmt was enabled to
svpbmt_enabled as it does the same logic.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

---
Changes since v1:
- Replace the pte_pbmt() macro, which re-checked
  riscv_isa_extension_available() on every call, with a svpbmt_enabled
  flag cached once in init_csr_masks().
- Add pte_pbmt_nocache()/pte_pbmt_io() inline helpers instead, used by
  PAGE_HYPERVISOR_NOCACHE/WC and p2m_pte_from_mfn().
- Switch vcpu_csr_init() to the same cached svpbmt_enabled flag instead
  of re-deriving Svpbmt availability itself.
---
 xen/arch/riscv/cpufeature.c       |  1 -
 xen/arch/riscv/domain.c           | 10 ++++++++--
 xen/arch/riscv/include/asm/page.h | 22 +++++++++++++++++++---
 xen/arch/riscv/p2m.c              |  2 +-
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 19454544a7..986a6dec78 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -158,7 +158,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(zifencei),
     RISCV_ISA_EXT_DATA(zihintpause),
     RISCV_ISA_EXT_DATA(zbb),
-    RISCV_ISA_EXT_DATA(svpbmt),
 };
 
 static bool __init is_lowercase_extension_name(const char *str)
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 2819ff4e7c..f6f20824e3 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -47,6 +47,8 @@ static struct csr_masks __ro_after_init csr_masks;
 #define HENVCFG_VALID_MASK 0xe0000003000000ffUL
 #define HSTATEEN0_VALID_MASK 0xde00000000000007UL
 
+bool __ro_after_init svpbmt_enabled;
+
 void __init init_csr_masks(void)
 {
     /*
@@ -79,6 +81,10 @@ void __init init_csr_masks(void)
         INIT_RO_ONE_MASK(HSTATEEN0, hstateen0);
     }
 
+    svpbmt_enabled = (riscv_isa_extension_available(NULL,
+                RISCV_ISA_EXT_svpbmt)) && (ENVCFG_PBMTE &
+                csr_masks.henvcfg);
+
 #undef INIT_CSR_MASK
 #undef INIT_RO_ONE_MASK
 }
@@ -97,8 +103,8 @@ static void vcpu_csr_init(struct vcpu *v)
      */
     v->arch.hcounteren = HCOUNTEREN_TM;
 
-    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
-        v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
+    if ( svpbmt_enabled )
+        v->arch.henvcfg = ENVCFG_PBMTE;
 
     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
     {
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 1977634efc..a7d087ff52 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -11,6 +11,7 @@
 #include <xen/types.h>
 
 #include <asm/atomic.h>
+#include <asm/cpufeature.h>
 #include <asm/page-bits.h>
 
 #define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)
@@ -42,7 +43,21 @@
  *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
  *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
  *  11 - Rsvd   Reserved for future standard use
+ *
+ * These bits are only meaningful when Svpbmt is enabled. Otherwise they must
+ * stay 0 (PMA).
  */
+extern bool svpbmt_enabled;
+static inline unsigned long pte_pbmt_nocache(void)
+{
+    return svpbmt_enabled ? BIT(61, UL) : 0;
+}
+
+static inline unsigned long pte_pbmt_io(void)
+{
+    return svpbmt_enabled ? BIT(62, UL) : 0;
+}
+
 #define PTE_PBMT_NOCACHE            BIT(61, UL)
 #define PTE_PBMT_IO                 BIT(62, UL)
 
@@ -53,6 +68,7 @@
 #define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE | PTE_ACCESSED)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
+
 /*
  * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
  *
@@ -60,8 +76,8 @@
  * is that IO is non-idempotent and strongly ordered, which makes it a good
  * candidate for mapping IOMEM.
  */
-#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PBMT_IO)
-#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PBMT_NOCACHE)
+#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | pte_pbmt_io())
+#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | pte_pbmt_nocache())
 
 /*
  * The PTE format does not contain the following bits within itself;
@@ -82,7 +98,7 @@ enum pbmt_type {
 
 #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
 
-#define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
+#define PTE_PBMT_MASK   (BIT(61, UL) | BIT(62, UL))
 
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 22ad4a2aee..15cbc92b76 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -658,7 +658,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
         switch ( t )
         {
         case p2m_mmio_direct_io:
-            e.pte |= PTE_PBMT_IO;
+            e.pte |= pte_pbmt_io();
             break;
 
         default:

-- 
2.55.0


