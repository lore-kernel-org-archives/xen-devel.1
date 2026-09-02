Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0070AC624D5
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:49:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405530.1639035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hag-0007D4-71; Wed, 02 Sep 2026 09:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405530.1639035; Wed, 02 Sep 2026 09:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1haf-0007BO-Vk; Wed, 02 Sep 2026 09:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1405530;
 Wed, 02 Sep 2026 09:49:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1had-00071f-Ue
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:49:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1had-00HNoW-BK
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:49:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97f112-2eae-0a2a0a5409dd-0a2a4507ac00-10
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:49:07 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-b4ea-0a2a45070019-d99ba50cfdf1-1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id 2B0F036928E9; Wed,  2 Sep 2026 10:44:06 +0100 (BST)
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
Subject: [PATCH v2 07/14] x86/mm: simplify create_perdomain_mapping() interface
Date: Wed,  2 Sep 2026 10:43:51 +0100
Message-ID: <20260901-asi-part2-7-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788342246-344CBAE4-F05E644D/0/0
X-purgate-type: clean
X-purgate-size: 12132

From: Roger Pau Monné <roger.pau@citrix.com>

create_perdomain_mapping()'s interface is richer than any caller needs.
The paging structure for the requested range is built to a depth
selected by the pl1tab and ppg arguments, each of which distinguishes
NULL from NIL() from a real pointer:

 - nr == 0: only ensure the per-domain L3 exists; nothing else is
   allocated, and the other arguments are ignored.
 - pl1tab == a pointer: allocate the L1 tables covering the range from
   the *xenheap*, and return their (stable, direct-map) addresses in
   the array -- the mode that existed to build the GDT/LDT stash.
 - pl1tab == NIL(): allocate the L1 tables from the domain heap, and
   return nothing.
 - pl1tab == NULL: do not plumb L1 tables for their own sake (they are
   still allocated on demand if data-page population requires them).
 - ppg == a pointer: allocate and install zeroed data pages across the
   range, and return their struct page_info pointers in the array.
 - ppg == NIL(): allocate and install the zeroed data pages, but hand
   nothing back; the pages are reachable only through the mapping.
 - ppg == NULL: do not allocate data pages.
 - both NULL, nr > 0: stop after the slot's L2; do not plumb L1 tables
   at all.

Very few of these modes have users now.  The last user of the
pl1tab capture mode was removed when we removed the GDT/LDT stash.
The ppg capture mode never had any users.  Nothing uses the both-NULL
L2-only mode with nr != 0.  What remains is exactly one bit of
information: whether the caller wants the range populated with zeroed,
area-owned data pages, or merely plumbed down to the L1 tables, ready
for populate_perdomain_mapping() to install caller-owned pages.

Replace the two arguments with a boolean expressing that bit.  With the
stashing mode gone the NIL()/IS_NIL() macros lose their last user, so
drop them as well; and document the resulting interface.

No caller changes behaviour: every existing call maps onto the boolean
exactly.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- Describe, in the mode enumeration, which heap each pl1tab mode
   allocates the L1 tables from (capture mode: xenheap; NIL(): the
   domain heap).  With "x86/mm: allocate the per-domain page-tables
   from the xenheap" dropped from the series, upstream's heap split is
   back in force at this point, and the previous patch's message
   refers to it.

Changes since the previously posted version:
- Drop the now-unused NIL()/IS_NIL() macros as requested during review
- Describe the prior interface in the commit message and add a doc
   comment for the simplified one.
---
 xen/arch/x86/domain_page.c    | 10 +++---
 xen/arch/x86/hvm/hvm.c        |  2 +-
 xen/arch/x86/include/asm/mm.h |  6 +---
 xen/arch/x86/mm.c             | 67 ++++++++++++++++-------------------
 xen/arch/x86/pv/domain.c      |  4 +--
 xen/arch/x86/x86_64/mm.c      |  3 +-
 6 files changed, 39 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 1fc1580e62..b42cf1c8cf 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -279,8 +279,7 @@ int mapcache_domain_init(struct domain *d)
     spin_lock_init(&dcache->lock);
 
     return create_perdomain_mapping(d, (unsigned long)dcache->inuse,
-                                    2 * bitmap_pages + 1,
-                                    NIL(l1_pgentry_t *), NULL);
+                                    2 * bitmap_pages + 1, false);
 }
 
 int mapcache_vcpu_init(struct vcpu *v)
@@ -297,16 +296,15 @@ int mapcache_vcpu_init(struct vcpu *v)
     if ( ents > dcache->entries )
     {
         /* Populate page tables. */
-        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents,
-                                          NIL(l1_pgentry_t *), NULL);
+        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents, false);
 
         /* Populate bit maps. */
         if ( !rc )
             rc = create_perdomain_mapping(d, (unsigned long)dcache->inuse,
-                                          nr, NULL, NIL(struct page_info *));
+                                          nr, true);
         if ( !rc )
             rc = create_perdomain_mapping(d, (unsigned long)dcache->garbage,
-                                          nr, NULL, NIL(struct page_info *));
+                                          nr, true);
 
         if ( rc )
             return rc;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9a4147b62e..a6e0818468 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -620,7 +620,7 @@ int hvm_domain_initialise(struct domain *d,
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
-    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
+    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, false);
     if ( rc )
         goto fail;
 
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 1888807394..30eaec9179 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -600,12 +600,8 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-#define NIL(type) ((type *)-sizeof(type))
-#define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
-
 int create_perdomain_mapping(struct domain *d, unsigned long va,
-                             unsigned int nr, l1_pgentry_t **pl1tab,
-                             struct page_info **ppg);
+                             unsigned int nr, bool populate);
 void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 const mfn_t *mfn, unsigned int nr,
                                 unsigned int flags);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 552559ecf1..48d1b427c5 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6211,9 +6211,31 @@ static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
            (_PAGE_PRESENT | _PAGE_AVAIL0);
 }
 
+/*
+ * Ensure the paging structure for [va, va + nr * PAGE_SIZE) of d's
+ * per-domain area is in place, allocating whichever levels are missing:
+ * the (domain-wide) L3 root, the slot's L2, and all L1 tables covering
+ * the range.  All allocations come from the domain heap.  The range must
+ * lie within a single per-domain slot (one L3 entry), and already-present
+ * levels and entries are left untouched, so calls are idempotent over
+ * existing ranges.
+ *
+ * nr == 0: only ensure the per-domain L3 itself exists; populate is
+ * ignored.  Used to set the area up before any sub-range is known.
+ *
+ * populate == false: stop once the L1 tables are in place.  The range is
+ * then ready for caller-owned pages to be mapped and unmapped via
+ * populate_perdomain_mapping() / destroy_perdomain_mapping(), which only
+ * fill existing tables and treat missing structure as a bug.
+ *
+ * populate == true: additionally install a freshly allocated, zeroed page
+ * at every not-yet-present entry in the range.  Such pages are marked
+ * _PAGE_AVAIL0, "owned by the per-domain area": teardown frees them (see
+ * perdomain_l1e_needs_freeing()), whereas caller-owned mappings are only
+ * ever unmapped.
+ */
 int create_perdomain_mapping(struct domain *d, unsigned long va,
-                             unsigned int nr, l1_pgentry_t **pl1tab,
-                             struct page_info **ppg)
+                             unsigned int nr, bool populate)
 {
     struct page_info *pg;
     l3_pgentry_t *l3tab;
@@ -6262,55 +6284,32 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
 
     unmap_domain_page(l3tab);
 
-    if ( !pl1tab && !ppg )
-    {
-        unmap_domain_page(l2tab);
-        return 0;
-    }
-
     for ( l1tab = NULL; !rc && nr--; )
     {
         l2_pgentry_t *pl2e = l2tab + l2_table_offset(va);
 
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
-            if ( pl1tab && !IS_NIL(pl1tab) )
-            {
-                l1tab = alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
-                if ( !l1tab )
-                {
-                    rc = -ENOMEM;
-                    break;
-                }
-                ASSERT(!pl1tab[l2_table_offset(va)]);
-                pl1tab[l2_table_offset(va)] = l1tab;
-                pg = virt_to_page(l1tab);
-            }
-            else
+            pg = alloc_domheap_page(d, MEMF_no_owner);
+            if ( !pg )
             {
-                pg = alloc_domheap_page(d, MEMF_no_owner);
-                if ( !pg )
-                {
-                    rc = -ENOMEM;
-                    break;
-                }
-                l1tab = __map_domain_page(pg);
+                rc = -ENOMEM;
+                break;
             }
+            l1tab = __map_domain_page(pg);
             clear_page(l1tab);
             *pl2e = l2e_from_page(pg, __PAGE_HYPERVISOR_RW);
         }
         else if ( !l1tab )
             l1tab = map_l1t_from_l2e(*pl2e);
 
-        if ( ppg &&
+        if ( populate &&
              !(l1e_get_flags(l1tab[l1_table_offset(va)]) & _PAGE_PRESENT) )
         {
             pg = alloc_domheap_page(d, MEMF_no_owner);
             if ( pg )
             {
                 clear_domain_page(page_to_mfn(pg));
-                if ( !IS_NIL(ppg) )
-                    *ppg++ = pg;
                 l1tab[l1_table_offset(va)] =
                     l1e_from_page(pg, __PAGE_HYPERVISOR_RW | _PAGE_AVAIL0);
                 l2e_add_flags(*pl2e, _PAGE_AVAIL0);
@@ -6322,7 +6321,6 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
         va += PAGE_SIZE;
         if ( rc || !nr || !l1_table_offset(va) )
         {
-            /* Note that this is a no-op for the alloc_xenheap_page() case. */
             unmap_domain_page(l1tab);
             l1tab = NULL;
         }
@@ -6543,10 +6541,7 @@ void free_perdomain_mappings(struct domain *d)
                         unmap_domain_page(l1tab);
                     }
 
-                    if ( is_xen_heap_page(l1pg) )
-                        free_xenheap_page(page_to_virt(l1pg));
-                    else
-                        free_domheap_page(l1pg);
+                    free_domheap_page(l1pg);
                 }
 
             unmap_domain_page(l2tab);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 35d1761c9c..15a8238aff 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -314,9 +314,7 @@ int switch_compat(struct domain *d)
 static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
     return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
-                                    1U << GDT_LDT_VCPU_SHIFT,
-                                    NIL(l1_pgentry_t *),
-                                    NULL);
+                                    1U << GDT_LDT_VCPU_SHIFT, false);
 }
 
 static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 8eadab7933..ffeda06e08 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -733,8 +733,7 @@ void __init zap_low_mappings(void)
 int setup_compat_arg_xlat(struct vcpu *v)
 {
     return create_perdomain_mapping(v->domain, ARG_XLAT_START(v),
-                                    PFN_UP(COMPAT_ARG_XLAT_SIZE),
-                                    NULL, NIL(struct page_info *));
+                                    PFN_UP(COMPAT_ARG_XLAT_SIZE), true);
 }
 
 void free_compat_arg_xlat(struct vcpu *v)
-- 
2.55.0


