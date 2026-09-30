Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E84CA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:06:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437218.1656050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBu1A-0006FR-SS; Wed, 30 Sep 2026 13:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437218.1656050; Wed, 30 Sep 2026 13:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBu1A-0006FK-Of; Wed, 30 Sep 2026 13:06:40 +0000
Received: by outflank-mailman (input) for mailman id 1437218;
 Wed, 30 Sep 2026 13:06:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1xBu19-0006EM-Fs
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:06:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1xBu17-006iVM-0U;
 Wed, 30 Sep 2026 13:06:37 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1xBu17-00CtKY-0H;
 Wed, 30 Sep 2026 13:06:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=kBbOHfO1bJTVVodf2gheW1EdA0LJUcbhwaB4uc+7gd0=; b=rTov10qlGdJnnzAr/+FU3YyAiF
	uQ6cAZHgIL0PJDPwo6DqVZIoVZgQYdIbdcZ4lgpEOGSf40F1Ysv4dbF5JIf6mECmRGFbwFhI4ImCL
	SdQzS/boXI+9I7FjNkxdB2jN6k7WVvkIIf/ikyzFl9Z8ye16MKKrMBX1t8GJ5KnCAdko=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH RESEND v3 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
Date: Wed, 30 Sep 2026 15:04:48 +0200
Message-ID: <20260930130448.49634-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
References: <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Baptiste Le Duc <baptiste.le-duc@vates.tech>

paddr_to_pte()'s "permissions" parameter, the matching local in
setup_initial_mapping() and p2m_set_permission() don't only deal with
permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and
PTE_DIRTY.

Rename them to "pte_flags" and p2m_set_pte_flags() respectively.

No functional change.

Requested-by: Jan Beulich <jbeulich@suse.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/include/asm/mm.h | 5 +++--
 xen/arch/riscv/mm.c             | 8 ++++----
 xen/arch/riscv/p2m.c            | 4 ++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 9e28c2495462..1ac66283ec9b 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -22,9 +22,10 @@ extern vaddr_t directmap_virt_start;
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
 
 static inline pte_t paddr_to_pte(paddr_t paddr,
-                                 unsigned int permissions)
+                                 unsigned int pte_flags)
 {
-    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) | permissions };
+    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) |
+                            pte_flags };
 }
 
 static inline paddr_t pte_to_paddr(pte_t pte)
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 610d11194588..0e26c5751f17 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -140,7 +140,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
         case 1: /* Level 0 */
             {
                 unsigned long paddr = (page_addr - map_start) + pa_start;
-                unsigned int permissions = PTE_LEAF_DEFAULT;
+                unsigned int pte_flags = PTE_LEAF_DEFAULT;
                 unsigned long addr = is_identity_mapping
                                      ? page_addr : virt_to_maddr(page_addr);
                 pte_t pte_to_be_written;
@@ -149,13 +149,13 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
 
                 if ( is_kernel_text(addr) ||
                      is_kernel_inittext(addr) )
-                        permissions =
+                        pte_flags =
                             PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
 
                 if ( is_kernel_rodata(addr) )
-                    permissions = PTE_READABLE | PTE_VALID;
+                    pte_flags = PTE_READABLE | PTE_VALID;
 
-                pte_to_be_written = paddr_to_pte(paddr, permissions);
+                pte_to_be_written = paddr_to_pte(paddr, pte_flags);
 
                 if ( !pte_is_valid(pgtbl[index]) )
                     pgtbl[index] = pte_to_be_written;
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 1cea86512c8c..f7b380b90a4e 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -584,7 +584,7 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
     p2m_write_pte(p, pte, clean_cache);
 }
 
-static void p2m_set_permission(pte_t *e, p2m_type_t t)
+static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
 {
     e->pte &= ~PTE_ACCESS_MASK;
 
@@ -676,7 +676,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
             break;
         }
 
-        p2m_set_permission(&e, t);
+        p2m_set_pte_flags(&e, t);
         p2m_set_type(&e, t, ctx);
     }
     else
-- 
Anthony PERARD


