Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A74CA5FA5
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 09:07:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438055.1656951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCClQ-0000xc-0F; Thu, 01 Oct 2026 09:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438055.1656951; Thu, 01 Oct 2026 09:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCClP-0000xQ-Sm; Thu, 01 Oct 2026 09:07:39 +0000
Received: by outflank-mailman (input) for mailman id 1438055;
 Thu, 01 Oct 2026 09:07:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b803f90003f66@swg.vates.tech>)
 id 1xCClO-0000vR-TB
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:07:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCClO-007rz7-9c
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:07:38 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b803f90003f66@swg.vates.tech>)
 id 6abe22d4-e002-0a2a0a5209dd-0a2a450b9688-36
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:07:38 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b803f90003f66@swg.vates.tech>)
 id 6abe22d4-b7e8-0a2a450b0019-b9ff1c22802d-4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:07:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f6b803f90003f66.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 01 Oct 2026 09:07:29 +0000
Received: from leducb.home (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 46CF98283A;
 Thu,  1 Oct 2026 11:07:29 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=aqjSWKhom+EllHagP7vIaGwtm55nQ/Lm4ovQZLM51hU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=sFzw3HmUKxu3SaK84FES6cylk9sab5nVFur1n2ci7fIz2G8gXwHcsej7//FAVzNDMWQ0W9UwH
 ngAmjy1VhwquRslpmDM0HVzPH1u/0/QTlUwndElOzeSdEpu6VCsemDnrd18TmzCfX3+GaZ4gmLa
 pkisLawPLikdaVKz3jfQbuIREGST/HPYOdjn4VAg4rfODoPIGezWJpdhhuYpTVx7ebv90pH9gC2
 xw2OUtObgfuFvbDr4HRnjWqt0mjXI+VImynTDNzTyLEEAE8oC1EiNLhfc9DgIbN02cov1iR9LEg
 6JeaB9MBZ3Yz8N/CVm02p0qCkrIKdPE4BgWHcTEIvJhw==
X-Zone-Loop: 8f542c57e0fcbcb0ae8429d1c1c66e312814cdbfebb0
x-campaign-type: default
x-transaction-id: 982a716b-17eb-4606-a09e-094b31cb8b7a
x-swg-uid: 01-34b648bd-5b7d-4fca-8880-4fbc668365be
X-Mailer: Sweego
Message-ID:
 <1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b803f90003f66@vates.tech>
x-swg-bid: 1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b803f90003f66
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
Subject: [PATCH v4 3/4] xen/riscv: fix A/D bits in Xen's page-table mappings
Date: Thu,  1 Oct 2026 11:07:22 +0200
In-Reply-To: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790845141; l=7385; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=dwsW0rW2RXWzTl0I0RDM6CrL2fok5jqVeN/cSdcD6mc=; b=NImNhHyOZvEnef7AUZniCiif1O8wmWuC7RcJfWGY1oz6sNaQ/pdpZzymOku4WRqNnftWlkZWE hjPhDlxl7xpCOdbVcCiiLg31XRM5Tr5ecugFSfyU5JO7GTiNEQTLHSm
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790845649469
X-purgate-ID: tlsNG-42698a/1790845657-A92CC9EA-3C85C45A/0/0
X-purgate-type: clean
X-purgate-size: 7387

Xen does not handle page faults caused by clear A/D bits, so it presets
them when creating PTEs. pt_update_entry() does so, but three places build
leaf PTEs directly without going through it: setup_initial_mapping() (the
boot page tables), check_pgtbl_mode_support() (the temporary root entry
used to probe SATP mode support) and arch_pmap_map() (the fixmap).

Without Svadu, all three fault on first access. For
check_pgtbl_mode_support(), the fault is raised by the instruction fetch
right after the SATP write, before any trap handler is set.

Add PTE_ACCESSED and PTE_DIRTY to PAGE_HYPERVISOR_RO, and build
PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX on top of it. PTE_DIRTY is set in
all cases for consistency with pt_update_entry() which sets it at runtime.

This fixes arch_pmap_map() for free, since it already builds its PTE from
PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
its default, text and rodata permissions, and check_pgtbl_mode_support() to
use PAGE_HYPERVISOR_RX for its temporary root entry. The latter drops
PTE_WRITABLE, going from RWX to RX, but this is harmless, as that entry
only has to make the current instruction stream fetchable between the two
CSR_SATP writes, and nothing writes through it.

Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
open-coded site above leaves it with no user outside page.h itself.

pte_is_table() and pte_is_mapping() both assert that a PTE doesn't use one
of the two reserved encodings, (V=1, W=1, R=0) and (V=1, X=1, W=1, R=0), by
masking it with PAGE_HYPERVISOR_RW. Now that PAGE_HYPERVISOR_RW also
carries A and D, a reserved PTE with A or D set would no longer be caught.
Mask with the V, R and W bits explicitly instead, and factor the check out
into pte_has_reserved_rwx().

Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v3:
- rebase patch 2/6 which modified wrong indentation.
- change commit message to address review comments.
---
Changes since v2:
- add fixes commit ref.
- add A/D bits to PAGE_HYPERVISOR_RO and derive PAGE_HYPERVISOR_RW/RX
  from it for consistency with runtime.
- introduce pte_is_reserved() to factor out the reserved-encoding assert
  shared by pte_is_table() and pte_is_mapping().
- reword commit title
---
Changes since v1:
- change commit title
- mention in patch message that arch_pmap_map() is fixed too, via the
  PAGE_HYPERVISOR_RW change, not just setup_initial_mapping().
- convert check_pgtbl_mode_support()'s temporary root entry to
  PAGE_HYPERVISOR_RX, as it's harmless.
- drop PTE_LEAF_DEFAULT entirely instead of keeping it, now that no site
  open-codes it anymore.
- drop the pte_is_table() comment line that referenced PAGE_HYPERVISOR_RW,
  now stale.
---
 xen/arch/riscv/include/asm/page.h | 33 +++++++++++++++++----------------
 xen/arch/riscv/mm.c               |  8 ++++----
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index b465a90325..8a3e3e1e66 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -46,12 +46,12 @@
 #define PTE_PBMT_NOCACHE            BIT(61, UL)
 #define PTE_PBMT_IO                 BIT(62, UL)
 
-#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
-#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
-#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
-#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
+#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE | \
+                                     PTE_ACCESSED | PTE_DIRTY)
+#define PAGE_HYPERVISOR_RW          (PAGE_HYPERVISOR_RO | PTE_WRITABLE)
+#define PAGE_HYPERVISOR_RX          (PAGE_HYPERVISOR_RO | PTE_EXECUTABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
 /*
@@ -161,31 +161,32 @@ static inline bool pte_is_valid(pte_t p)
  *      X W R Meaning
  *      0 0 0 Pointer to next level of page table.
  *      0 0 1 Read-only page.
- *      0 1 0 Reserved for future use.
+ *      0 1 0 Reserved for future use. [1]
  *      0 1 1 Read-write page.
  *      1 0 0 Execute-only page.
  *      1 0 1 Read-execute page.
- *      1 1 0 Reserved for future use.
+ *      1 1 0 Reserved for future use. [2]
  *      1 1 1 Read-write-execute page.
+ *
+ *   So if V=1 and W=1 then R also needs to be 1 as R = 0 is reserved for
+ *   future use ([1], [2]).
  */
+static inline bool pte_has_reserved_rwx(pte_t p)
+{
+    return (p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) ==
+           (PTE_VALID | PTE_WRITABLE);
+}
+
 static inline bool pte_is_table(pte_t p)
 {
-    /*
-     * According to the spec if V=1 and W=1 then R also needs to be 1 as
-     * R = 0 is reserved for future use ( look at the Table 4.5 ) so check
-     * in ASSERT that if (V==1 && W==1) then R isn't 0.
-     *
-     * PAGE_HYPERVISOR_RW contains PTE_VALID too.
-     */
-    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
+    ASSERT(!pte_has_reserved_rwx(p));
 
     return ((p.pte & (PTE_VALID | PTE_ACCESS_MASK)) == PTE_VALID);
 }
 
 static inline bool pte_is_mapping(pte_t p)
 {
-    /* See pte_is_table() */
-    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
+    ASSERT(!pte_has_reserved_rwx(p));
 
     return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
 }
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index a9bce48f4a..6f7dcd10b2 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -140,7 +140,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
         case 1: /* Level 0 */
             {
                 unsigned long paddr = (page_addr - map_start) + pa_start;
-                unsigned int pte_flags = PTE_LEAF_DEFAULT;
+                unsigned int pte_flags = PAGE_HYPERVISOR_RW;
                 unsigned long addr = is_identity_mapping
                                      ? page_addr : virt_to_maddr(page_addr);
                 pte_t pte_to_be_written;
@@ -148,10 +148,10 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
                 index = pt_index(0, page_addr);
 
                 if ( is_kernel_text(addr) || is_kernel_inittext(addr) )
-                    pte_flags = PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
+                    pte_flags = PAGE_HYPERVISOR_RX;
 
                 if ( is_kernel_rodata(addr) )
-                    pte_flags = PTE_READABLE | PTE_VALID;
+                    pte_flags = PAGE_HYPERVISOR_RO;
 
                 pte_to_be_written = paddr_to_pte(paddr, pte_flags);
 
@@ -196,7 +196,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
 
     index = pt_index(page_table_level, aligned_load_start);
     stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
-                                            PTE_LEAF_DEFAULT | PTE_EXECUTABLE);
+                                            PAGE_HYPERVISOR_RX);
 
     sfence_vma();
     csr_write(CSR_SATP,

-- 
2.55.0


