Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD88C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:33:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401163.1636917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6m-0004FP-Or; Thu, 27 Aug 2026 15:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401163.1636917; Thu, 27 Aug 2026 15:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6m-0004FI-L3; Thu, 27 Aug 2026 15:33:40 +0000
Received: by outflank-mailman (input) for mailman id 1401163;
 Thu, 27 Aug 2026 15:33:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad225000c4f3@swg.vates.tech>)
 id 1wzc6l-0004Cx-9j
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:33:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzc6i-004lPY-Nm
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:33:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad225000c4f3@swg.vates.tech>)
 id 6a9058cd-bab6-0a2a0a5309dd-0a2a4501bec4-8
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:36 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad225000c4f3@swg.vates.tech>)
 id 6a9058cc-5984-0a2a45010019-b9ff1c22a3e9-4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:36 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a043dad225000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 15:33:29 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 954BC83BA7;
 Thu, 27 Aug 2026 17:33:28 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=fail header.s=selector1 header.d=vates.tech header.i="@vates.tech"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=jcfiniJ2HA0oc4SB8mrHlmNbUSh8Qghq5rzk6gnCeY8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=D/xlDEqVdcgftFYisevE8fJyf/ewwlg7HLKv4qaTmZmuP3oZbsjvAPXqEWzO1tMV/ocuuG6Ml
 E/6NuBzGJMn21s5qperhcoth6RvgeVtO75uIy0BAQDYEfh72lagou4GXo09AXN/mX6Vuec22H+m
 HMZltC/IlkyGWWlQOUtGLLt+B21CVPRdClfypPJvfjz0vNBmNd7poJ/FHWDTHFzX7LN8/DSVPip
 RNII8kTKFhsBc76P1K9lSV40mV3XvOiblYnQ1UV3bOsOsj5JpGWo4Po1gzaGVt6MZd+c39uzt7Z
 Qxh4ognsL2kT3JXPobUwPti7MBnLIPDh4BOoYimG94cA==
X-Zone-Loop: 15c7b58b3f858a58634ac03164e0b85424a6a3df628b
x-campaign-type: default
x-transaction-id: edd5e07d-fa9a-4cb4-aae8-ff9f0fcad810
x-swg-uid: 01-208d7c0e-4823-4280-8031-623dbfa18acb
X-Mailer: Sweego
Message-ID:
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad225000c4f3@vates.tech>
x-swg-bid: 1787844809.8631fc262581453bbf619ec5b2062170.1a043dad225000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: zhangzheng@iscas.ac.cn,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/5] xen/riscv: preset A/D bits in Xen's own page-table mappings
Date: Thu, 27 Aug 2026 17:33:16 +0200
In-Reply-To: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787844808798
X-purgate-ID: tlsNG-d62444/1787844816-1FC69757-FBF9F4D1/0/0
X-purgate-type: clean
X-purgate-size: 4228

The previous patch made p2m_set_permission() always set the PTE A/D bits to
map pages in G-stage, to avoid a page fault on platforms that implement
neither Svade nor Svadu, or that declare both in the device tree. Xen's own
page tables, built by setup_initial_mapping(), never go through
p2m_set_permission() and need the same fix.

Add PTE_ACCESSED to PTE_LEAF_DEFAULT and make it the minimal common leaf
permission set by dropping PTE_WRITABLE. Rebuild PAGE_HYPERVISOR_RO,
PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX from that common base, with
PAGE_HYPERVISOR_RW also adding PTE_DIRTY. Switch setup_initial_mapping() to
use these macros for its default, text, and rodata permissions instead of
the equivalent raw bit lists.

A PTE is a table entry iff PTE_VALID is set and R/W/X are all clear, so
update pte_is_table() accordingly.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/include/asm/page.h | 14 ++++++++------
 xen/arch/riscv/mm.c               |  7 +++----
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index b465a90325..5c02f64a17 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -46,12 +46,12 @@
 #define PTE_PBMT_NOCACHE            BIT(61, UL)
 #define PTE_PBMT_IO                 BIT(62, UL)
 
-#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
+#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_ACCESSED)
 #define PTE_TABLE                   (PTE_VALID)
 
-#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
-#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
-#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
+#define PAGE_HYPERVISOR_RO          (PTE_LEAF_DEFAULT)
+#define PAGE_HYPERVISOR_RW          (PTE_LEAF_DEFAULT | PTE_WRITABLE | PTE_DIRTY)
+#define PAGE_HYPERVISOR_RX          (PTE_LEAF_DEFAULT | PTE_EXECUTABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
 /*
@@ -177,7 +177,8 @@ static inline bool pte_is_table(pte_t p)
      *
      * PAGE_HYPERVISOR_RW contains PTE_VALID too.
      */
-    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
+    ASSERT((p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) !=
+           (PTE_VALID | PTE_WRITABLE));
 
     return ((p.pte & (PTE_VALID | PTE_ACCESS_MASK)) == PTE_VALID);
 }
@@ -185,7 +186,8 @@ static inline bool pte_is_table(pte_t p)
 static inline bool pte_is_mapping(pte_t p)
 {
     /* See pte_is_table() */
-    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
+    ASSERT((p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) !=
+            (PTE_VALID | PTE_WRITABLE));
 
     return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
 }
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 4d3b8c2204..baff49cf09 100644
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
 

