Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5917FCA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:33:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436562.1655238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalf-0006aP-3h; Tue, 29 Sep 2026 16:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436562.1655238; Tue, 29 Sep 2026 16:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalf-0006aI-0s; Tue, 29 Sep 2026 16:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1436562;
 Tue, 29 Sep 2026 16:33:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee034220000b504@swg.vates.tech>)
 id 1xBald-0006XY-2U
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:33:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBalc-00DLzD-4Q
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:33:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee034220000b504@swg.vates.tech>)
 id 6abbe839-bab6-0a2a0a5309dd-0a2a450bbd5c-34
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:20 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee034220000b504@swg.vates.tech>)
 id 6abbe84f-b7e8-0a2a450b0019-b9ff1c23a31f-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ee034220000b504.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Sep 2026 16:33:06 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 75F5981FC1;
 Tue, 29 Sep 2026 18:33:05 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=kKPNIhp+A4+dr7qNXhZlECXliG/Lv9mfBHv0bnTfetM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=O5u4BE/4QmFNOJjDs+p0mIYl3LXmhh58qjvXUVafiBLUGeQEEPCtqKNTBaHydCMQw2dswO+mf
 appecEDDpEtG/2IyKPytugYW9Z/9fRqLfy37/PoTsLcFPcQgcol9pKk38EV24L3z5YbF3x2/9gu
 iGs72RriktHwAyN9ucA76uBbFWQRmqWKQGSC0YqC5lWAaLMrBncimgStdDvpxrxnxxTN8EFDEsm
 SScH0j4pgYNm4ALihOPgq0w4EdSllL44QxpzZVE9LLCtPFI4tm/IExllzkHtOrfGUw3FTzHUi5D
 MDKoZ9WYiJSRTQZwmlV0VZpojE77HemXqbqSl1vn0r9A==
X-Zone-Loop: f6d83337c7b6caa7eff60fde5990cf531c17ca8769ac
x-campaign-type: default
x-transaction-id: beb69862-1969-4380-a14c-db1491c1bb83
x-swg-uid: 01-919144b0-3ebe-4cf3-bbe9-3ac605092d68
X-Mailer: Sweego
Message-ID:
 <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034220000b504@vates.tech>
x-swg-bid: 1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034220000b504
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
Subject: [PATCH v3 4/6] xen/riscv: fix A/D bits in Xen's page-table mappings
Date: Tue, 29 Sep 2026 18:32:45 +0200
In-Reply-To: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699289; l=7057; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=NxTTVXHRsTwSY9lWWDjt0yaKRyTXaowqbId9133pEl8=; b=oxymPBL7vRDbHp4tyNT+A76AZRvRzGhI9mL280/WyZ/3UfXRCocgQUID4YD1CibKcabIIeN4W og23zJBcT3CBziNNkJkTitee80u2W3/2gmH9GKvGdnbzI2x+UYqaJcq
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790699585664
X-purgate-ID: tlsNG-42698a/1790699600-AA0C59EA-F37F4F45/0/0
X-purgate-type: clean
X-purgate-size: 7059

Xen does not handle page faults caused by clear A/D bits, so it presets
them when creating PTEs. pt_update_entry() does so, but
setup_initial_mapping() (the boot page tables) and arch_pmap_map() (the
fixmap) build leaf PTEs directly without going through it. Without Svadu,
both would fault on first access.

Add PTE_ACCESSED and PTE_DIRTY to PAGE_HYPERVISOR_RO, and build
PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX on top of it. PTE_DIRTY is set in
all cases for consistency with pt_update_entry() which sets it at runtime.

This fixes arch_pmap_map() for free, since it already builds its PTE from
PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
its default, text and rodata permissions, and for the temporary root entry
built by check_pgtbl_mode_support(), instead of the equivalent raw bit
lists. The latter drops PTE_WRITABLE, going from RWX to RX, but this is
harmless, as that entry only has to make the current instruction stream
fetchable between the two CSR_SATP writes used to probe SATP mode support,
and nothing writes through it.

Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
open-coded site above leaves it with no user outside page.h itself.

pte_is_table() and pte_is_mapping() both assert that a PTE doesn't use one
of the two reserved encodings, (V=1, W=1, R=0) and (V=1, X=1, W=1, R=0), by
masking it with PAGE_HYPERVISOR_RW. Now that PAGE_HYPERVISOR_RW also
carries A and D, a reserved PTE with A or D set would no longer be caught.
Mask with the V, R and W bits explicitly instead, and factor the check out
into pte_is_reserved().

Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
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
 xen/arch/riscv/mm.c               |  9 ++++-----
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index b465a90325..7772e2f572 100644
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
+static inline bool pte_is_reserved(pte_t p)
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
+    ASSERT(!pte_is_reserved(p));
 
     return ((p.pte & (PTE_VALID | PTE_ACCESS_MASK)) == PTE_VALID);
 }
 
 static inline bool pte_is_mapping(pte_t p)
 {
-    /* See pte_is_table() */
-    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
+    ASSERT(!pte_is_reserved(p));
 
     return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
 }
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 0e26c5751f..b7b9bff0bf 100644
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
@@ -149,11 +149,10 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
 
                 if ( is_kernel_text(addr) ||
                      is_kernel_inittext(addr) )
-                        pte_flags =
-                            PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
+                    pte_flags = PAGE_HYPERVISOR_RX;
 
                 if ( is_kernel_rodata(addr) )
-                    pte_flags = PTE_READABLE | PTE_VALID;
+                    pte_flags = PAGE_HYPERVISOR_RO;
 
                 pte_to_be_written = paddr_to_pte(paddr, pte_flags);
 
@@ -198,7 +197,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
 
     index = pt_index(page_table_level, aligned_load_start);
     stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
-                                            PTE_LEAF_DEFAULT | PTE_EXECUTABLE);
+                                            PAGE_HYPERVISOR_RX);
 
     sfence_vma();
     csr_write(CSR_SATP,

-- 
2.55.0


