Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32272606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=hnt901M2
Received: from list by lists.xenproject.org with outflank-mailman.1454851.1668515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItSK-0007vI-1c; Mon, 19 Oct 2026 19:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454851.1668515; Mon, 19 Oct 2026 19:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItSI-0007r6-QH; Mon, 19 Oct 2026 19:55:34 +0000
Received: by outflank-mailman (input) for mailman id 1454851;
 Mon, 19 Oct 2026 19:55:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItS4-0004vB-TC
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022zw-3qRA;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGl-00000001FjN-0CHb;
 Mon, 19 Oct 2026 19:43:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=LeUN4GWtDg25LdWPguyYFlprUdbIgPn6gxNUTDepJeY=; b=hnt901M2zDsh7qOiplQLH+lttG
	ZIewuytRXco8S5EaFg5m7vVL+ERIbqIQSDb3K63SXuDxtpiEmCFAz23l/r2RFs6p/67N5CvAIvHo7
	/Itu3oUx8U3F/4f22ni/Gw1n6A+4ghpeZQ+1wZUDayOWVvVEmq4NhBwhKWygtZuuGDcY=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 22/30] x86/mm: split a sparse directmap superpage with a page being freed
Date: Mon, 19 Oct 2026 20:42:53 +0100
Message-ID: <20261019-asi-hvm-v4-22-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A xenheap free takes its pages out of the sparse directmap view.  Where a
superpage covers them, the superpage has to be split, and
modify_mappings_in() allocates the page-table page for that.  The sparse
view has such superpages wherever a xenheap block of 2MiB or more was
mapped whole, and wherever map_pages_in() merged the entries of a 2MiB
region into one, as it does in the full directmap, once all 512 pages
were mapped.  The allocation can fail once the hardware domain exists,
and the free then keeps its pages out of the heap for good, with a
warning.

Use one of the pages being freed instead.  The sparse view's free hook
makes the first of them what alloc_xen_pagetable() would return, and
passes it to modify_mappings_in(), which uses it, should a split need a
page, before allocating one.  The new L1 maps the rest of the superpage,
and the page's own entry is cleared along with the others being freed.
The hook tells free_xenheap_pages() whether it kept the page, and
free_xenheap_pages() then frees the rest of the block as blocks of orders
0 to order - 1.  The page goes back to the heap once the L1 has emptied,
as any page-table page of the sparse view does.

One page is enough if the sparse view has no 1GiB pages: a block smaller
than 2MiB lies within one 2MiB page and needs one L1, and a larger block
covers whole 2MiB pages and needs none, where a block within a 1GiB page
could need an L2 as well.  So map_pages_in() makes 1GiB pages, by mapping
or by merging, only in idle_pg_table's hierarchy; the sparse view keeps
its 2MiB pages, mapped and merged.  A xenheap free then allocates nothing
in the sparse view.

The costs: a 2MiB region split this way can merge again only once it has
emptied, as its L1 is one of its own pages; where the sparse view maps a
whole 1GiB region, which takes memory never handed to the heap and
xenheap memory filling it, contexts on it use 2MiB pages instead of one
1GiB page; and arch_xenheap_pages_free() gains a parameter.  The other
removals from the sparse view (memory handed to the heap,
idle_pg_table's boot-time page-tables, and the undo of a failed xenheap
allocation) still allocate when they split a superpage.

The sparse view is correct without this, as a free that cannot split its
superpage fails safe.  It is kept apart from "x86/mm: build and maintain a
sparse view of the directmap" so that it can be weighed on its own.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
 xen/arch/x86/include/asm/mm.h   |  2 +-
 xen/arch/x86/mm.c               | 34 ++++++++++++++++++++++------
 xen/arch/x86/sparse-directmap.c | 40 ++++++++++++++++++++++++++-------
 xen/common/page_alloc.c         | 14 ++++++++----
 xen/include/xen/mm.h            | 11 ++++++---
 5 files changed, 78 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 7612cf66ef..af43ae01b0 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -601,7 +601,7 @@ void *alloc_mapped_pagetable(mfn_t *pmfn);
 int map_pages_in(l4_pgentry_t *root, unsigned long virt, mfn_t mfn,
                  unsigned long nr_mfns, pte_attr_t flags);
 int modify_mappings_in(l4_pgentry_t *root, unsigned long s, unsigned long e,
-                       pte_attr_t nf);
+                       pte_attr_t nf, mfn_t *spare);
 #ifdef CONFIG_SPARSE_DIRECTMAP
 mfn_t xen_mapping_lookup(l4_pgentry_t *root, unsigned long va,
                          pte_attr_t *flags, unsigned long *nr);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 7b5a355e6e..449ae561dc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5540,6 +5540,10 @@ static void free_pagetable_in(const l4_pgentry_t *root, mfn_t mfn)
 /*
  * map_pages_to_xen() in the hierarchy rooted at @root: idle_pg_table's, or
  * another hierarchy sharing its virtual addresses.
+ *
+ * Only idle_pg_table's hierarchy gets 1GiB pages: a xenheap free splits a
+ * superpage of the sparse directmap view with one of the pages it frees,
+ * which is enough for a 2MiB page only.
  */
 int map_pages_in(
     l4_pgentry_t *root,
@@ -5549,6 +5553,7 @@ int map_pages_in(
     pte_attr_t flags)
 {
     bool locking = system_state > SYS_STATE_boot;
+    bool page1gb = cpu_has_page1gb && root == idle_pg_table;
     l3_pgentry_t *pl3e = NULL, ol3e;
     l2_pgentry_t *pl2e = NULL, ol2e;
     l1_pgentry_t *pl1e, ol1e;
@@ -5601,7 +5606,7 @@ int map_pages_in(
         L3T_LOCK(current_l3page);
         ol3e = *pl3e;
 
-        if ( cpu_has_page1gb &&
+        if ( page1gb &&
              IS_L3E_ALIGNED(virt, flags & _PAGE_PRESENT ? mfn : _mfn(0)) &&
              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
@@ -5887,7 +5892,7 @@ int map_pages_in(
         }
 
  check_l3:
-        if ( cpu_has_page1gb &&
+        if ( page1gb &&
              (flags == PAGE_HYPERVISOR) &&
              ((nr_mfns == 0) || IS_L3E_ALIGNED(virt, mfn)) )
         {
@@ -5966,6 +5971,18 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
     return map_pages_to_xen(virt, INVALID_MFN, nr_mfns, MAP_SMALL_PAGES);
 }
 
+static mfn_t take_or_alloc_pagetable(mfn_t *spare)
+{
+    mfn_t mfn = spare ? *spare : INVALID_MFN;
+
+    if ( mfn_eq(mfn, INVALID_MFN) )
+        return alloc_xen_pagetable();
+
+    *spare = INVALID_MFN;
+
+    return mfn;
+}
+
 /*
  * Alter the permissions of a range of Xen virtual address space.
  *
@@ -5979,10 +5996,13 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  * It is an error to call with present flags over an unpopulated range.
  *
  * modify_mappings_in() does so in the hierarchy rooted at @root, as
- * map_pages_in() does.
+ * map_pages_in() does.  @spare, if not NULL, may hold a page the caller
+ * gives up for a page-table page, which shattering a superpage then uses
+ * before allocating one.  *@spare reads INVALID_MFN once it has been used,
+ * and the page is then no longer the caller's.
  */
 int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
-                       unsigned long e, pte_attr_t nf)
+                       unsigned long e, pte_attr_t nf, mfn_t *spare)
 {
     bool locking = system_state > SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
@@ -6046,7 +6066,7 @@ int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
             }
 
             /* PAGE1GB: shatter the superpage and fall through. */
-            l2mfn = alloc_xen_pagetable();
+            l2mfn = take_or_alloc_pagetable(spare);
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -6104,7 +6124,7 @@ int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
             {
                 l1_pgentry_t *l1t;
                 /* PSE: shatter the superpage and try again. */
-                mfn_t l1mfn = alloc_xen_pagetable();
+                mfn_t l1mfn = take_or_alloc_pagetable(spare);
 
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
@@ -6262,7 +6282,7 @@ int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
 
 int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
 {
-    int rc = modify_mappings_in(idle_pg_table, s, e, nf);
+    int rc = modify_mappings_in(idle_pg_table, s, e, nf, NULL);
 
     if ( !rc )
         rc = sparse_dmap_mirror_modify(s, e, nf);
diff --git a/xen/arch/x86/sparse-directmap.c b/xen/arch/x86/sparse-directmap.c
index d35a8d6979..adec474f72 100644
--- a/xen/arch/x86/sparse-directmap.c
+++ b/xen/arch/x86/sparse-directmap.c
@@ -121,12 +121,13 @@ static int add_to_sparse_view(l4_pgentry_t *root, unsigned long mfn,
     return 0;
 }
 
-static int remove_from_sparse_view(unsigned long mfn, unsigned long nr)
+static int remove_from_sparse_view(unsigned long mfn, unsigned long nr,
+                                   mfn_t *spare)
 {
     unsigned long va = (unsigned long)mfn_to_virt(mfn);
 
     return modify_mappings_in(sparse_dmap_root, va, va + (nr << PAGE_SHIFT),
-                              _PAGE_NONE);
+                              _PAGE_NONE, spare);
 }
 
 /* Memory is about to be handed to the heap allocator. */
@@ -144,7 +145,7 @@ bool arch_heap_pages_init(mfn_t mfn, unsigned long nr)
         return true;
     }
 
-    if ( remove_from_sparse_view(s, nr) )
+    if ( remove_from_sparse_view(s, nr, NULL) )
     {
         printk(XENLOG_ERR
                "sparse directmap: cannot unmap MFNs %#lx-%#lx, not freeing\n",
@@ -188,10 +189,18 @@ int arch_xenheap_pages_alloc(mfn_t mfn, unsigned int order)
 /*
  * Xenheap pages are about to be freed.  A failure means the pages may still
  * be reachable through the sparse view, and must not be reused.
+ *
+ * If the caller allows, the first page serves as the page-table page that
+ * splitting a superpage of the sparse view needs: the new L1 maps the rest
+ * of the superpage, and the page leaves the sparse view with the others.
+ * One page is enough: the sparse view has no 1GiB pages, a block below 2MiB
+ * lies within one 2MiB page, and a larger one covers whole ones.
  */
-int arch_xenheap_pages_free(mfn_t mfn, unsigned int order)
+int arch_xenheap_pages_free(mfn_t mfn, unsigned int order, bool *first_kept)
 {
     unsigned long s = mfn_x(mfn), nr = 1UL << order;
+    mfn_t spare = INVALID_MFN;
+    int rc;
 
     if ( !sparse_dmap_configured() )
         return 0;
@@ -204,7 +213,22 @@ int arch_xenheap_pages_free(mfn_t mfn, unsigned int order)
         return 0;
     }
 
-    return remove_from_sparse_view(s, nr);
+    if ( first_kept )
+    {
+        struct page_info *pg = mfn_to_page(mfn);
+
+        /* Made what alloc_xen_pagetable() would return, in case it is used. */
+        pg->count_info &= ~PGC_xen_heap;
+        page_set_owner(pg, NULL);
+        spare = mfn;
+    }
+
+    rc = remove_from_sparse_view(s, nr, &spare);
+
+    if ( first_kept && mfn_eq(spare, INVALID_MFN) )
+        *first_kept = true;
+
+    return rc;
 }
 
 /* Memory leaves Xen's hands without passing through the heap. */
@@ -233,7 +257,7 @@ int sparse_dmap_drop_pagetable(mfn_t mfn)
                 INVALID_MFN) )
         return 0;
 
-    rc = remove_from_sparse_view(s, 1);
+    rc = remove_from_sparse_view(s, 1, NULL);
     if ( rc )
         printk(XENLOG_WARNING
                "Leaking page-table page %"PRI_mfn": still in the sparse directmap\n",
@@ -267,7 +291,7 @@ int sparse_dmap_mirror_modify(unsigned long s, unsigned long e,
     e = min(e, SPARSE_DMAP_END);
 
     if ( !(nf & _PAGE_PRESENT) )
-        return modify_mappings_in(sparse_dmap_root, s, e, nf);
+        return modify_mappings_in(sparse_dmap_root, s, e, nf, NULL);
 
     /*
      * A permission change applies where the sparse view maps anything: it
@@ -283,7 +307,7 @@ int sparse_dmap_mirror_modify(unsigned long s, unsigned long e,
         n = min(n, (e - va) >> PAGE_SHIFT);
         if ( !mfn_eq(mfn, INVALID_MFN) &&
              (rc = modify_mappings_in(sparse_dmap_root, va,
-                                      va + (n << PAGE_SHIFT), nf)) )
+                                      va + (n << PAGE_SHIFT), nf, NULL)) )
             return rc;
         va += n << PAGE_SHIFT;
     }
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 69e8e982b6..055e358f3a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2561,7 +2561,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
          * The hook may have mapped part of the pages before failing: take
          * them out again as a free would, and leak them if that fails too.
          */
-        if ( arch_xenheap_pages_free(page_to_mfn(pg), order) )
+        if ( arch_xenheap_pages_free(page_to_mfn(pg), order, NULL) )
             printk(XENLOG_WARNING
                    "Leaking xenheap pages %"PRI_mfn"+%u: still mapped\n",
                    mfn_x(page_to_mfn(pg)), 1U << order);
@@ -2580,6 +2580,7 @@ void free_xenheap_pages(void *v, unsigned int order)
 {
     struct page_info *pg;
     unsigned int i;
+    bool first_kept = false;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2593,7 +2594,7 @@ void free_xenheap_pages(void *v, unsigned int order)
      * they may remain reachable through it: leak them rather than hand them
      * out.
      */
-    if ( arch_xenheap_pages_free(page_to_mfn(pg), order) )
+    if ( arch_xenheap_pages_free(page_to_mfn(pg), order, &first_kept) )
     {
         printk(XENLOG_WARNING
                "Leaking xenheap pages %"PRI_mfn"+%u: still mapped\n",
@@ -2601,10 +2602,15 @@ void free_xenheap_pages(void *v, unsigned int order)
         return;
     }
 
-    for ( i = 0; i < (1u << order); i++ )
+    for ( i = first_kept ? 1 : 0; i < (1u << order); i++ )
         pg[i].count_info &= ~PGC_xen_heap;
 
-    free_heap_pages(pg, order, true);
+    if ( !first_kept )
+        free_heap_pages(pg, order, true);
+    else
+        /* The rest of the block, as the blocks of orders 0 to order - 1. */
+        for ( i = 0; i < order; i++ )
+            free_heap_pages(pg + (1u << i), i, true);
 }
 
 #endif  /* CONFIG_SEPARATE_XENHEAP */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 2bcc45cf58..debd511caf 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -108,8 +108,12 @@ bool arch_xenheap_needs_scrub(void);
  * pages go through arch_xenheap_pages_free() before being freed again.
  */
 int arch_xenheap_pages_alloc(mfn_t mfn, unsigned int order);
-/* Xenheap pages are to be freed.  Non-zero: failed, don't reuse them. */
-int arch_xenheap_pages_free(mfn_t mfn, unsigned int order);
+/*
+ * Xenheap pages are to be freed.  Non-zero: failed, don't reuse them.  With
+ * @first_kept not NULL, the arch may keep the first page for itself, and
+ * then sets *@first_kept to true: that page is not the caller's to free.
+ */
+int arch_xenheap_pages_free(mfn_t mfn, unsigned int order, bool *first_kept);
 #else
 static inline bool arch_heap_pages_init(mfn_t mfn, unsigned long nr)
 {
@@ -123,7 +127,8 @@ static inline int arch_xenheap_pages_alloc(mfn_t mfn, unsigned int order)
 {
     return 0;
 }
-static inline int arch_xenheap_pages_free(mfn_t mfn, unsigned int order)
+static inline int arch_xenheap_pages_free(mfn_t mfn, unsigned int order,
+                                          bool *first_kept)
 {
     return 0;
 }
-- 
2.55.0


