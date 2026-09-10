Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8FAC88E45
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:35:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414228.1644009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBQ-0003Ml-4M; Thu, 10 Sep 2026 09:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414228.1644009; Thu, 10 Sep 2026 09:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBQ-0003Me-11; Thu, 10 Sep 2026 09:35:04 +0000
Received: by outflank-mailman (input) for mailman id 1414228;
 Thu, 10 Sep 2026 09:35:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@swg.vates.tech>)
 id 1x4bBO-0003Kb-Rc
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:35:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bBO-007nqx-8P
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:35:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@swg.vates.tech>)
 id 6aa279bd-8faa-0a2a0a5109dd-0a2a4502cc62-34
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:02 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@swg.vates.tech>)
 id 6aa279c3-6ca4-0a2a45020019-b9ff1c23b5c1-4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:02 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08aab9ea7000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 09:34:58 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8FCB681E02;
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
 q=dns/txt; s=selector1; bh=OQMa161a+Wta8D11iB/ndQm1se8KfDbFH6WIHdvaHGI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=cWCdmEszRBcC73GGCImq8qDcfqxOmDvHgI6m4jSxSdHq2O9T8j15VYmlPKQZ2/NsFkkvCx+a6
 d0IyGfjCK4F+Qe7A1/iiAvjogboos/uESXFDF1K+5x2kocxbetN71mdAVctcnypbOMp4xIGpeQL
 HeraKIcSHVw93MyJW9FA/TO+2EEnmu0k/KPtdHHnGrWee8RXZWRIc3Gs1/7b+iqD55TmkujTN/V
 YuIa70Qw4+vnF5wkqlyekiClYKYNPwhBlNsOyJ6AM2BXDY0bTw8PLVFBgsPSPW41uEhpUl2SDY8
 /TKpzcVi9oKncoOr045sd0y2cChLQYuJlbiGhGAyy7TQ==
X-Zone-Loop: a778dacaedad8c10749e69f932d7b5b69dfed1b74b21
x-campaign-type: default
x-transaction-id: 4ea3cbea-497b-4bbe-8884-f42ffaf428a8
x-swg-uid: 01-05164e3a-3a95-4fc3-8b65-84eac62a50bc
X-Mailer: Sweego
Message-ID:
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@vates.tech>
x-swg-bid: 1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3
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
Subject: [PATCH v2 2/6] xen/riscv: set A/D bits in Xen's page-table mappings under Svade
Date: Thu, 10 Sep 2026 11:34:50 +0200
In-Reply-To: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789032264; l=5833; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=oru9y8klMzu0KQzmHiXjBGBZGoTU/bzItz+YJ4+V2kI=; b=aqJBmtx9lgcJ1XkvpeN6/IaSMIUP8hMfW5EQpERjH0bEvJa7oau9woD2G/ciY+RXwX1d+Hn1/ jYG7W1NW7bHDlMaBvBSpjurL2Svy54ID5y9f75bQHcwIDOjGAjUshUJ
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789032897774
X-purgate-ID: tlsNG-720697/1789032902-678BC2AC-0AED1F10/0/0
X-purgate-type: clean
X-purgate-size: 5835

The previous patch set A/D bits in case of the Svade extension for G-stage
mappings. Xen's own S-stage mappings need the same fix as both
setup_initial_mapping() (the boot page tables) and arch_pmap_map() (the
fixmap) build leaf PTEs directly instead of going through
pt_update_entry(), which is what adds A/D bits. So with Svade, both would
fault on first access.

Add PTE_ACCESSED to all PAGE_HYPERVISOR_* and also PTE_DIRTY to
PAGE_HYPERVISOR_RW as it needs to be set during a write to avoid a fault.
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

A PTE is a table entry iff PTE_VALID is set and R/W/X are all clear, so
update pte_is_table() and pte_is_mapping() accordingly.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
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
 xen/arch/riscv/include/asm/page.h | 15 +++++++--------
 xen/arch/riscv/mm.c               |  9 ++++-----
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index b465a90325..1977634efc 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -46,12 +46,11 @@
 #define PTE_PBMT_NOCACHE            BIT(61, UL)
 #define PTE_PBMT_IO                 BIT(62, UL)
 
-#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
-#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
-#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
-#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
+#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE | PTE_ACCESSED)
+#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE | PTE_ACCESSED | PTE_DIRTY)
+#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE | PTE_ACCESSED)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
 /*
@@ -174,10 +173,9 @@ static inline bool pte_is_table(pte_t p)
      * According to the spec if V=1 and W=1 then R also needs to be 1 as
      * R = 0 is reserved for future use ( look at the Table 4.5 ) so check
      * in ASSERT that if (V==1 && W==1) then R isn't 0.
-     *
-     * PAGE_HYPERVISOR_RW contains PTE_VALID too.
      */
-    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
+    ASSERT((p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) !=
+           (PTE_VALID | PTE_WRITABLE));
 
     return ((p.pte & (PTE_VALID | PTE_ACCESS_MASK)) == PTE_VALID);
 }
@@ -185,7 +183,8 @@ static inline bool pte_is_table(pte_t p)
 static inline bool pte_is_mapping(pte_t p)
 {
     /* See pte_is_table() */
-    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
+    ASSERT((p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) !=
+            (PTE_VALID | PTE_WRITABLE));
 
     return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
 }
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 4d3b8c2204..53bebbcabf 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -140,7 +140,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
         case 1: /* Level 0 */
             {
                 unsigned long paddr = (page_addr - map_start) + pa_start;
-                unsigned int permissions = PTE_LEAF_DEFAULT;
+                unsigned int permissions = PAGE_HYPERVISOR_RW;
                 unsigned long addr = is_identity_mapping
                                      ? page_addr : virt_to_maddr(page_addr);
                 pte_t pte_to_be_written;
@@ -149,11 +149,10 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
 
                 if ( is_kernel_text(addr) ||
                      is_kernel_inittext(addr) )
-                        permissions =
-                            PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
+                    permissions = PAGE_HYPERVISOR_RX;
 
                 if ( is_kernel_rodata(addr) )
-                    permissions = PTE_READABLE | PTE_VALID;
+                    permissions = PAGE_HYPERVISOR_RO;
 
                 pte_to_be_written = paddr_to_pte(paddr, permissions);
 
@@ -198,7 +197,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
 
     index = pt_index(page_table_level, aligned_load_start);
     stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
-                                            PTE_LEAF_DEFAULT | PTE_EXECUTABLE);
+                                            PAGE_HYPERVISOR_RX);
 
     sfence_vma();
     csr_write(CSR_SATP,

-- 
2.55.0


