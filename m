Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34498CA5FA5
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 09:07:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438053.1656933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCClK-0000RY-Fd; Thu, 01 Oct 2026 09:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438053.1656933; Thu, 01 Oct 2026 09:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCClK-0000RR-CV; Thu, 01 Oct 2026 09:07:34 +0000
Received: by outflank-mailman (input) for mailman id 1438053;
 Thu, 01 Oct 2026 09:07:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCClJ-0000RL-8P
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:07:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCClI-007rtg-L8
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:07:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b801920003f66@swg.vates.tech>)
 id 6abe22d4-e002-0a2a0a5209dd-0a2a450b9688-0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:07:32 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b801920003f66@swg.vates.tech>)
 id 6abe22d4-b7e8-0a2a450b0019-b9ff1c22802d-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:07:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f6b801920003f66.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 01 Oct 2026 09:07:29 +0000
Received: from leducb.home (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7AEC782407;
 Thu,  1 Oct 2026 11:07:28 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=hIXBqLlDxx0K/kQnZq8JWDabTK1TpS/NxsX703pn8ic=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=H3+O53pYPeRZ9qrUglXRshbWWs397qeocUlaJUObrmfCZ8sfVX9ZgGQqIqBTIs06KI4b3YkH7
 aQN0O1JEdDdpUxBpwUF5oTLVs7Qf0OGvRUO5SUdRN2dGE3DOBsJqzaHkNvXDdAfwTiroF03mtVf
 vlc+IlBj7OwWBn1o02I0t3xqArX1FbcFYx0UOGiez5WO+asR7SZQpC0cRfLevCU5969iFAv3Xt5
 gO/DBvU/nwP7FiE0L/JAR3rfCI4F01UGyiOnspQE98frIeAEp1Xy8MJhsu1Od23WHmsF40Swmgc
 La5VN/qDHT5J/62Om+bSICbRwQ1702FkTPp04DEP7h1Q==
X-Zone-Loop: 2004158124ce4150e84e21f7f2c5d74ccb3b91e1583f
x-campaign-type: default
x-transaction-id: 0f6fabbf-ea14-4bbe-8d6c-5c8504b73a66
x-swg-uid: 01-4623a960-a353-4396-94b7-ca4492c5c873
X-Mailer: Sweego
Message-ID:
 <1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b801920003f66@vates.tech>
x-swg-bid: 1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b801920003f66
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
Subject: [PATCH v4 1/4] xen/riscv: rename PTE "permissions" to "pte_flags"
Date: Thu,  1 Oct 2026 11:07:20 +0200
In-Reply-To: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790845141; l=3824; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=XdiiczWFyM/LIOzMORFXdmlnH1HzIt2R6VuUNrV2b20=; b=zSkFUNXea73u4ALYVErAA0YFHJ6H5j9PC7kfm/v/aFUM/NiaZducfZe4uz43GsxUbm1YyQnsn NqcNyHeILROCMkDkEwnEXSBfcxbozateW2s8FIrLeoGbQ7JztEFGtzX
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790845648690
X-purgate-ID: tlsNG-42698a/1790845652-1BAD09EA-4C94B252/10/78276251493
X-purgate-type: spam
X-purgate-size: 3826

paddr_to_pte()'s "permissions" parameter, the matching local in
setup_initial_mapping() and p2m_set_permission() don't only deal with
permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and
PTE_DIRTY.

Rename them to "pte_flags" and p2m_set_pte_flags() respectively.

No functional change.

Requested-by: Jan Beulich <jbeulich@suse.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v3:
- apply nits: fix indention and line length
---
Changes since v2:
- new patch
---
 xen/arch/riscv/include/asm/mm.h |  5 +++--
 xen/arch/riscv/mm.c             | 12 +++++-------
 xen/arch/riscv/p2m.c            |  4 ++--
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 9e28c24954..1ac66283ec 100644
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
index 610d111945..a9bce48f4a 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -140,22 +140,20 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
         case 1: /* Level 0 */
             {
                 unsigned long paddr = (page_addr - map_start) + pa_start;
-                unsigned int permissions = PTE_LEAF_DEFAULT;
+                unsigned int pte_flags = PTE_LEAF_DEFAULT;
                 unsigned long addr = is_identity_mapping
                                      ? page_addr : virt_to_maddr(page_addr);
                 pte_t pte_to_be_written;
 
                 index = pt_index(0, page_addr);
 
-                if ( is_kernel_text(addr) ||
-                     is_kernel_inittext(addr) )
-                        permissions =
-                            PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
+                if ( is_kernel_text(addr) || is_kernel_inittext(addr) )
+                    pte_flags = PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
 
                 if ( is_kernel_rodata(addr) )
-                    permissions = PTE_READABLE | PTE_VALID;
+                    pte_flags = PTE_READABLE | PTE_VALID;
 
-                pte_to_be_written = paddr_to_pte(paddr, permissions);
+                pte_to_be_written = paddr_to_pte(paddr, pte_flags);
 
                 if ( !pte_is_valid(pgtbl[index]) )
                     pgtbl[index] = pte_to_be_written;
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 1cea86512c..f7b380b90a 100644
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
2.55.0


