Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B759FC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:49:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405529.1639026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1haf-00079g-Rn; Wed, 02 Sep 2026 09:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405529.1639026; Wed, 02 Sep 2026 09:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1haf-00078g-Ou; Wed, 02 Sep 2026 09:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1405529;
 Wed, 02 Sep 2026 09:49:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1had-00071e-T4
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:49:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1had-00HNoW-9z
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:49:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97f112-2eae-0a2a0a5409dd-0a2a4507ac00-8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:49:07 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-b4ea-0a2a45070019-d99ba50cedd2-1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id CD25936928DF; Wed,  2 Sep 2026 10:44:05 +0100 (BST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: George Dunlap <dunlapg@umich.edu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 05/14] x86/pv: update guest LDT mappings using {populate,destroy}_perdomain_mapping()
Date: Wed,  2 Sep 2026 10:43:49 +0100
Message-ID: <20260901-asi-part2-5-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788342246-3C610AE4-9174E2E5/0/0
X-purgate-type: clean
X-purgate-size: 7040

From: Roger Pau Monné <roger.pau@citrix.com>

Until two patches ago, update_xen_slot_in_full_gdt() used the stashed
pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vCPU's page
tables with Xen's GDT; this was previously necessary because
map_domain_page() couldn't be called in a context switch.  Having a
handy pointer to an always-mapped version of the GDT/LDT L1 table,
other sites which modify the table started using it for convenience,
even if they weren't called from within a context switch.  These
include pv_map_ldt_shadow_page() and pv_destroy_ldt().

Continue the process of switching users of the stashed reference to use
populate_perdomain_mapping() instead.

pv_map_ldt_shadow_page() is, by definition, always modifying the
currently-running vCPU: it runs from the #PF handler for a descriptor
fetch on the guest's behalf, and running the guest implies its page
tables are loaded.  So it could simply write the linear recursive
mappings directly.  Go through populate_perdomain_mapping() anyway, to
keep a single writer for the per-domain area.

For pv_destroy_ldt(), use destroy_perdomain_mapping().

Previously, pv_destroy_ldt() used the L1 LDT entries themselves to
determine which MFNs to drop type and count references to.  Rather
than reading from the stashed L1, keep the MFNs corresponding to L1
slots in an array in the vCPU structure, as we do in the GDT case.
(Note that unlike the GDT case, these are not part of a public ABI, so
can be mfn_t, avoiding a recast-and-copy.)

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
Changes in v2:
- Reword the commit message

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
index 2d0a915410..61a9fe00f0 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -541,6 +541,8 @@ struct pv_vcpu
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


