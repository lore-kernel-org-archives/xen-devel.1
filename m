Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888FB606A31D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=cBWH6k1M
Received: from list by lists.xenproject.org with outflank-mailman.1461474.1672494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPX-0004wW-11; Mon, 26 Oct 2026 15:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461474.1672494; Mon, 26 Oct 2026 15:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPW-0004wO-UC; Mon, 26 Oct 2026 15:14:54 +0000
Received: by outflank-mailman (input) for mailman id 1461474;
 Mon, 26 Oct 2026 15:14:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLMPV-0004vo-Q1
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:14:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMPV-00DhdS-6h
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:14:53 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c7373e000f79f@swg.vates.tech>)
 id 6adf6e6b-e002-0a2a0a5209dd-0a2a4508c308-2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:14:53 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c7373e000f79f@swg.vates.tech>)
 id 6adf6e68-f659-0a2a45080019-b9ff1c238a77-4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:14:53 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a178c7373e000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 15:14:44 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 55E4D81DAB;
 Mon, 26 Oct 2026 16:14:43 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=BEakajGWIf4LAv0+KdHp6x8rDSwbOS2sEWIM5GTzxlI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=cBWH6k1M+xwapho8bUp5WAL+HJH0rH1z230l696ANNB9KQcvmY7zLKRbt0v7IexfAdgGJEoQm
 sY1rtBm7EaQkBKfo6jp5THQYIno1ZwA73+rFdoKunj8YdlyHYW3+9V81muGQ3jbfkPbolx4MKgp
 Q/pGc/p3OStjajel8SFd+764TuWk5lpeIZB6mCuhXGK4NL7R97Ig7oc3NhsFTkruJBKk3uWFpSi
 vuZPDuU0bxz0WBumf017DRMsugZi2CFCNQ51lhOXD+1BYasusz9cQwIlAgMmJBQVq0/+7IkKo93
 zktGS69Zbb8RjHx5hEwHWjZbn4uwfY++RjpvIW0I01Ww==
X-Zone-Loop: e35bf4dbb0f12bb4a17d10a26a0ab471ea6b595f8f5e
x-campaign-type: default
x-transaction-id: ff6cdbcc-aebf-46ef-9970-30530ccb3459
x-swg-uid: 01-0613efb9-1d56-44ea-80bb-626674cd8285
X-Mailer: Sweego
Message-ID:
 <1793027684.8631fc262581453bbf619ec5b2062170.1a178c7373e000f79f@vates.tech>
x-swg-bid: 1793027684.8631fc262581453bbf619ec5b2062170.1a178c7373e000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
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
Subject: [PATCH v8 2/5] xen/riscv: fix A/D bits in Xen's page-table mappings
Date: Mon, 26 Oct 2026 16:14:34 +0100
In-Reply-To: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793027331; l=8050; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=z2JA5ykm5jV3OWJlXaV6V4FclNBYupnFTEqpKHl8hJU=; b=jvzkOplkM3u99GMDbajurUUlsQuoad9RAE6VgqclDRnPsvuZKo5KVhD4+J014TW/OlRkv/ntS IGglk5XGfVWAD61rznvUH8LoezqwMbROZb7ytCKvEU2VHWbuAiqFw5P
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793027683537
X-purgate-ID: tlsNG-c1860d/1793027693-DFAD487B-C812CC5C/10/78276251493
X-purgate-type: spam
X-purgate-size: 8052
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xen does not handle page faults caused by clear A/D bits, so it presets
them when creating PTEs. pt_update_entry() does so, but three places build
leaf PTEs directly without going through it: setup_initial_mapping() (the
boot page tables), check_pgtbl_mode_support() (the temporary root entry
used to probe SATP mode support) and arch_pmap_map() (the fixmap).

On implementations that fault on clear A/D bits (Svade), all three fault
on first access. For check_pgtbl_mode_support(), the fault is raised by the
instruction fetch right after the SATP write, before any trap handler is
set.

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
Fixes: f89e1a170299 ("xen/riscv: introduce asm/pmap.h header")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Tested-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v7:
- collect A-by and T-by.
---
Changes since v6:
- add a 2nd Fixes tag, as arch_pmap_map() was introduced by a later
  commit.
---
Changes since v5:
- no changes, already reviewed and waiting to be merged.
---
Changes since v4:
- rebase on top of staging.
- add a missing changes line in "Changes since v3".
---
Changes since v3:
- rebase patch 2/6 which modified wrong indentation.
- change commit message to address review comments.
- rename pte_is_reserved() to pte_has_reserved_rwx()
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
 xen/arch/riscv/mm.c               | 11 +++++------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index c8bb334b85..f9e59e61de 100644
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
 
     return pte_is_valid(p) && (p.pte & PTE_ACCESS_MASK);
 }
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 06f0406781..6f7dcd10b2 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -140,19 +140,18 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
         case 1: /* Level 0 */
             {
                 unsigned long paddr = (page_addr - map_start) + pa_start;
-                unsigned int pte_flags = PTE_LEAF_DEFAULT;
+                unsigned int pte_flags = PAGE_HYPERVISOR_RW;
                 unsigned long addr = is_identity_mapping
                                      ? page_addr : virt_to_maddr(page_addr);
                 pte_t pte_to_be_written;
 
                 index = pt_index(0, page_addr);
 
-                if ( is_kernel_text(addr) ||
-                     is_kernel_inittext(addr) )
-                    pte_flags = PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
+                if ( is_kernel_text(addr) || is_kernel_inittext(addr) )
+                    pte_flags = PAGE_HYPERVISOR_RX;
 
                 if ( is_kernel_rodata(addr) )
-                    pte_flags = PTE_READABLE | PTE_VALID;
+                    pte_flags = PAGE_HYPERVISOR_RO;
 
                 pte_to_be_written = paddr_to_pte(paddr, pte_flags);
 
@@ -197,7 +196,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
 
     index = pt_index(page_table_level, aligned_load_start);
     stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
-                                            PTE_LEAF_DEFAULT | PTE_EXECUTABLE);
+                                            PAGE_HYPERVISOR_RX);
 
     sfence_vma();
     csr_write(CSR_SATP,

-- 
2.56.0


