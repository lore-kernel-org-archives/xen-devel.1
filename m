Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C63C5DF8C
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 17:44:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396850.1634530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6oE-0001yd-HM; Thu, 20 Aug 2026 17:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396850.1634530; Thu, 20 Aug 2026 17:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6oE-0001yR-Ck; Thu, 20 Aug 2026 17:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1396850;
 Thu, 20 Aug 2026 17:44:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wx6oC-0001kB-VQ
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:44:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6oC-00E247-1M;
 Thu, 20 Aug 2026 17:44:08 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6oB-00DjFg-2z;
 Thu, 20 Aug 2026 17:44:08 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=R1q6Hy5ynYIAwwjvHwGLb/Kb5YMqyXOjLpgHFR8Cx8w=; b=pdYwYHiyc31hVa8zA+xb6TO8bJ
	loPp6CKyaWscSnC9EfUqCb4GVETAO7ezbJOlK0dPnM9b5nNZ69wzKl2uUvM/00AYg4VvwyWmVgq9I
	Vyu9oSD9IpdbKnKv1GoCJyOqMsClNuJQ36cpm5m3dASBwytVbPXKOqHkBY61dtRHpN54=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/7] x86/pv: update guest LDT mappings using {populate,destroy}_perdomain_mapping()
Date: Thu, 20 Aug 2026 18:43:45 +0100
Message-ID: <20260820-asi-part1-5-f2dbd92b8459@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

Until two patches ago, update_xen_slot_in_full_gdt() used the stashed
pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vCPU's page
tables with Xen's GDT; this was necessary because perdomain pagetables
were mapped from the domheap by default, and map_domain_page() couldn't
be called in a context switch.  Having a handy pointer to an
always-mapped version of the GDT/LDT L1 table, other sites which modify
the table started using it for convenience, even if they weren't called
from within a context switch.  These include pv_map_ldt_shadow_page()
and pv_destroy_ldt().

Now that all perdomain pagetables are allocated from the xenheap and
their root L3 stashed in d->arch.perdomain_l3,
d->arch.pv.gdt_ldt_l1tab is redundant.  The previous two patches
removed the GDT users; continue that process by refactoring the LDT
sites as well.

pv_map_ldt_shadow_page() is, by definition, always modifying the
currently-running vCPU: it runs from the #PF handler for a guest-mode
descriptor fetch, and running the guest implies its page tables are
loaded.  So it could simply write the linear recursive mappings
directly.  Go through populate_perdomain_mapping() anyway, to keep a
single writer for the per-domain area.

For pv_destroy_ldt(), use destroy_perdomain_mapping().

Previously, pv_destroy_ldt() used the L1 LDT entries themselves to
determine which MFNs to drop type and count references to.  Since we
don't have the L1 handy, we must now keep the MFNs corresponding to L1
slots in an array in the vCPU structure, as we do in the GDT case.

Note that mappings_dropped (the return value of pv_destroy_ldt()) now
reflects the *number of valid MFNs in this array*, not *the number of
non-empty L1 entries*.  This introduces an invariant we must maintain:
pv_map_ldt_shadow_page() writes both the array entry and the mapping,
and pv_destroy_ldt() clears both, so the two stay in lockstep.

Also note that, unlike pv_destroy_gdt() from the previous patch,
pv_destroy_ldt() doesn't fill in the values with zero_l1e (see
61031e64d3), so there's no change here.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes since the previously posted version:
- Initialise ldt_frames[] ahead of the first fail-able initialisation step.
- Call destroy_perdomain_mapping() with its existing domain parameter;
   the switch to a vCPU parameter moves to a future patch.
- Use populate_perdomain_mapping() in pv_map_ldt_shadow_page() rather
   than open-coding the linear-map write; retitle accordingly.
- Comment the INVALID_MFN skip in pv_destroy_ldt(): the LDT is
   demand-faulted, so its pages may be sparsely mapped (Alejandro's
   question on v2).
- Rewrite commit message (including describing the ldt_frames[]
   array's role directly, as Jan asked).
---
 xen/arch/x86/include/asm/domain.h   |  2 ++
 xen/arch/x86/pv/descriptor-tables.c | 20 +++++++++++---------
 xen/arch/x86/pv/domain.c            |  4 ++++
 xen/arch/x86/pv/mm.c                | 16 ++++++++++++----
 4 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5275bb10ea..2c9efd59bf 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -542,6 +542,8 @@ struct pv_vcpu
     struct trap_info *trap_ctxt;
 
     unsigned long gdt_frames[FIRST_RESERVED_GDT_PAGE];
+    /* Max LDT entries is 8192, so 8192 * 8 = 64KiB (16 pages). */
+    mfn_t ldt_frames[16];
     unsigned long ldt_base;
     unsigned int gdt_ents, ldt_ents;
 
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 5dda5bffe3..261bf29c90 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -20,28 +20,30 @@
  */
 bool pv_destroy_ldt(struct vcpu *v)
 {
-    l1_pgentry_t *pl1e;
+    const unsigned int nr_frames = ARRAY_SIZE(v->arch.pv.ldt_frames);
     unsigned int i, mappings_dropped = 0;
-    struct page_info *page;
 
     ASSERT(!in_irq());
 
     ASSERT(v == current || !vcpu_cpu_dirty(v));
 
-    pl1e = pv_ldt_ptes(v);
+    destroy_perdomain_mapping(v->domain, LDT_VIRT_START(v), nr_frames);
 
-    for ( i = 0; i < 16; i++ )
+    for ( i = 0; i < nr_frames; i++ )
     {
-        if ( !(l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) )
-            continue;
+        mfn_t mfn = v->arch.pv.ldt_frames[i];
+        struct page_info *page;
 
-        page = l1e_get_page(pl1e[i]);
-        l1e_write(&pl1e[i], l1e_empty());
-        mappings_dropped++;
+        /* The LDT is demand-faulted, so its pages may be sparsely mapped. */
+        if ( mfn_eq(mfn, INVALID_MFN) )
+            continue;
 
+        v->arch.pv.ldt_frames[i] = INVALID_MFN;
+        page = mfn_to_page(mfn);
         ASSERT_PAGE_IS_TYPE(page, PGT_seg_desc_page);
         ASSERT_PAGE_IS_DOMAIN(page, v->domain);
         put_page_and_type(page);
+        mappings_dropped++;
     }
 
     return mappings_dropped;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 0c42ae58aa..7ddab1949f 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -340,10 +340,14 @@ void pv_vcpu_destroy(struct vcpu *v)
 int pv_vcpu_initialise(struct vcpu *v)
 {
     struct domain *d = v->domain;
+    unsigned int i;
     int rc;
 
     ASSERT(!is_idle_domain(d));
 
+    for ( i = 0; i < ARRAY_SIZE(v->arch.pv.ldt_frames); i++ )
+        v->arch.pv.ldt_frames[i] = INVALID_MFN;
+
     rc = pv_create_gdt_ldt_l1tab(v);
     if ( rc )
         return rc;
diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 5378299b8c..da280d7757 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -53,7 +53,8 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
     struct page_info *page;
-    l1_pgentry_t gl1e, *pl1e, nl1e;
+    l1_pgentry_t gl1e;
+    mfn_t mfn;
     unsigned long linear = curr->arch.pv.ldt_base + offset;
 
     BUG_ON(in_irq());
@@ -87,10 +88,17 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
         return false;
     }
 
-    pl1e = &pv_ldt_ptes(curr)[offset >> PAGE_SHIFT];
-    nl1e = l1e_from_pfn(l1e_get_pfn(gl1e), __PAGE_HYPERVISOR_RW);
+    mfn = page_to_mfn(page);
+    curr->arch.pv.ldt_frames[offset >> PAGE_SHIFT] = mfn;
 
-    l1e_write(pl1e, nl1e);
+    /*
+     * Running the guest implies its page-tables are loaded, so the linear
+     * mappings would do; go through the interface anyway to keep a single
+     * writer for the per-domain area.
+     */
+    populate_perdomain_mapping(curr,
+                               LDT_VIRT_START(curr) + (offset & PAGE_MASK),
+                               &mfn, 1, __PAGE_HYPERVISOR_RW);
 
     return true;
 }
-- 
2.55.0


