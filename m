Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C7E606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=SDTvLHjW
Received: from list by lists.xenproject.org with outflank-mailman.1463815.1674836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD7G-0007nL-2i; Wed, 28 Oct 2026 23:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463815.1674836; Wed, 28 Oct 2026 23:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD7E-0007gm-Qp; Wed, 28 Oct 2026 23:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1463815;
 Wed, 28 Oct 2026 23:30:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6P-00055U-NC
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00000000pOJ-36qj;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjN-00000001KpM-3zh4;
 Wed, 28 Oct 2026 23:06:54 +0000
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
	bh=5bWt48oVbFgfls5ydUXDK8NsiQisFqKXCpJUHopfOnc=; b=SDTvLHjW/YSxnSJ3a96OEGrNH8
	56YaEkp6Ix9pie1XPnaoAu/WYXDehwNiRzrU5VfXWm7Pxan/VdCBgJ1hmMAFdHQbpPCV+zUNN8Q6R
	PCqqQhldGWeP9z3XhJwYSG4XMKWXIufzsZX3kPOLTGgq5Y6b8t6jAp0+z6U38ZDgInaQ=;
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
Subject: [PATCH v5 17/45] x86/mm: add hooks for a sparse view of the directmap
Date: Wed, 28 Oct 2026 23:05:31 +0000
Message-ID: <20261028-asi-hvm-v5-17-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The directmap maps all of RAM, and every root page-table carries it,
so while any guest context runs, all guest memory is reachable from
Xen's address space.  For ASI, guest contexts are to run on a sparse
view of the directmap which maps only what Xen must reach through it
at all times, leaving guest memory to transient mappings
(map_domain_page()).

A later patch builds such a sparse view alongside the full directmap,
once the boot allocator has handed its memory to the heap.  It is then
kept in step:

 - xenheap allocations are added, and taken out again before the pages
   are freed.  If that fails the pages stay mapped, and are leaked with
   a warning rather than reused;
 - memory handed to the heap later (boot modules, .init) is taken out,
   and is not handed over if that fails;
 - a PV dom0's initrd, assigned to dom0 in place, is taken out;
 - page-tables from the boot allocator, which the sparse view maps with
   every other boot-time allocation, are taken out when idle_pg_table's
   hierarchy frees them, and are not freed if that fails, so that the
   sparse view never keeps a page the heap may hand out;
 - changes to the full directmap through map_pages_to_xen() and
   modify_xen_mappings() are mirrored.  After boot, map_pages_to_xen()
   maps into the directmap only memory Xen keeps (stack guard and shadow
   stack pages, firmware tables); memory hot-add maps the new range into
   the full directmap only, so that the sparse view never needs
   page-table pages for it.

Add a hook at each of these points, and one where the view is to be
built; x86's are stubs in a new asm/sparse-directmap.h.  map_pages_in()
and modify_mappings_in() are no longer static: memory hot-add calls
map_pages_in() on idle_pg_table, and the sparse view will use both.

Common code gains four hooks for this, arch_heap_pages_init(),
arch_xenheap_needs_scrub() and arch_xenheap_pages_{alloc,free}(), no-ops
until an architecture implements them.  A failed
arch_xenheap_pages_alloc() may have mapped part of the pages:
alloc_xenheap_pages() then takes them out through
arch_xenheap_pages_free(), as a free would, before freeing them, and
leaks them if that fails too.

alloc_xenheap_pages() accepts pages still awaiting scrubbing
(MEMF_no_scrub).  That is harmless while the directmap maps all memory
anyway, but the sparse view would make such a page's contents, a dying
domain's data for instance, reachable from every context on it until
overwritten.  With a sparse view configured, arch_xenheap_needs_scrub()
makes xenheap allocations scrub those pages first, as domain heap
allocations do; clean pages need nothing extra.

arch_mfns_in_directmap() says whether an MFN range is reachable through
the directmap; it now answers for every context, so false once a sparse
view is configured.  Its one caller, init_node_heap(), then keeps a NUMA
node's heap metadata in the xenheap instead of carving it out of the
node's memory through the directmap: carved out of a range handed to the
heap, it would be left out of the sparse view, which every heap
allocation needs it in.

The hooks for now are just stubs.  No functional change.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version, split out of "x86/mm: build and maintain a sparse
  view of the directmap".
---
 xen/arch/x86/include/asm/mm.h               | 12 +++++-
 xen/arch/x86/include/asm/sparse-directmap.h | 30 +++++++++++++++
 xen/arch/x86/mm.c                           | 30 ++++++++++++---
 xen/arch/x86/pv/dom0_build.c                |  4 ++
 xen/arch/x86/setup.c                        |  4 ++
 xen/arch/x86/x86_64/mm.c                    | 10 ++++-
 xen/common/page_alloc.c                     | 41 ++++++++++++++++++++-
 xen/include/xen/mm.h                        | 21 +++++++++++
 8 files changed, 142 insertions(+), 10 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/sparse-directmap.h

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 12d1c06c12..6264f67af4 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -7,6 +7,7 @@
 #include <xen/rwlock.h>
 #include <asm/io.h>
 #include <asm/page.h>
+#include <asm/sparse-directmap.h>
 #include <asm/uaccess.h>
 
 /*
@@ -597,6 +598,11 @@ mfn_t alloc_xen_pagetable(void);
 void free_xen_pagetable(mfn_t mfn);
 void *alloc_mapped_pagetable(mfn_t *pmfn);
 
+int map_pages_in(l4_pgentry_t *root, unsigned long virt, mfn_t mfn,
+                 unsigned long nr_mfns, pte_attr_t flags);
+int modify_mappings_in(l4_pgentry_t *root, unsigned long s, unsigned long e,
+                       pte_attr_t nf);
+
 int __sync_local_execstate(void);
 
 /* Arch-specific portion of memory_op hypercall. */
@@ -657,12 +663,16 @@ void write_32bit_pse_identmap(uint32_t *l2);
 
 /*
  * x86 maps part of physical memory via the directmap region.
- * Return whether the range of MFN falls in the directmap region.
+ * Return whether the range of MFN falls in the directmap region in every
+ * context: never, with a sparse directmap view configured.
  */
 static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
     unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
 
+    if ( sparse_dmap_configured() )
+        return false;
+
     return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
 }
 
diff --git a/xen/arch/x86/include/asm/sparse-directmap.h b/xen/arch/x86/include/asm/sparse-directmap.h
new file mode 100644
index 0000000000..53747a98ad
--- /dev/null
+++ b/xen/arch/x86/include/asm/sparse-directmap.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_SPARSE_DIRECTMAP_H
+#define X86_SPARSE_DIRECTMAP_H
+
+#include <xen/mm-frame.h>
+#include <xen/mm-types.h>
+#include <asm/page.h>
+
+static inline bool sparse_dmap_configured(void) { return false; }
+static inline void sparse_dmap_init(void) {}
+static inline int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn,
+                                         unsigned long nr, pte_attr_t flags)
+{
+    return 0;
+}
+static inline int sparse_dmap_mirror_modify(unsigned long s, unsigned long e,
+                                            pte_attr_t nf)
+{
+    return 0;
+}
+static inline int sparse_dmap_remove(mfn_t mfn, unsigned long nr)
+{
+    return 0;
+}
+static inline int sparse_dmap_drop_pagetable(mfn_t mfn)
+{
+    return 0;
+}
+
+#endif /* X86_SPARSE_DIRECTMAP_H */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4bfb690017..6028408b82 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -127,6 +127,7 @@
 #include <asm/setup.h>
 #include <asm/shadow.h>
 #include <asm/shared.h>
+#include <asm/sparse-directmap.h>
 #include <asm/trampoline.h>
 #include <asm/traps.h>
 #include <asm/x86_emulate.h>
@@ -5425,10 +5426,17 @@ mfn_t xen_map_to_mfn(unsigned long va)
 
 /*
  * Free a page-table page that the hierarchy rooted at @root has stopped
- * using.
+ * using.  One of idle_pg_table's may be in the sparse directmap view: it is
+ * taken out first, under the sparse view's L3 lock inside an L3 lock of
+ * idle_pg_table's hierarchy (the only order in which the two nest), and
+ * kept if that fails.  The sparse view's own page-tables are not in it, and
+ * are freed directly: the caller may hold the sparse view's L3 lock.
  */
 static void free_pagetable_in(const l4_pgentry_t *root, mfn_t mfn)
 {
+    if ( root == idle_pg_table && sparse_dmap_drop_pagetable(mfn) )
+        return;
+
     free_xen_pagetable(mfn);
 }
 
@@ -5436,7 +5444,7 @@ static void free_pagetable_in(const l4_pgentry_t *root, mfn_t mfn)
  * map_pages_to_xen() in the hierarchy rooted at @root: idle_pg_table's, or
  * another hierarchy sharing its virtual addresses.
  */
-static int map_pages_in(
+int map_pages_in(
     l4_pgentry_t *root,
     unsigned long virt,
     mfn_t mfn,
@@ -5848,7 +5856,12 @@ int map_pages_to_xen(
     unsigned long nr_mfns,
     pte_attr_t flags)
 {
-    return map_pages_in(idle_pg_table, virt, mfn, nr_mfns, flags);
+    int rc = map_pages_in(idle_pg_table, virt, mfn, nr_mfns, flags);
+
+    if ( !rc )
+        rc = sparse_dmap_mirror_map(virt, mfn, nr_mfns, flags);
+
+    return rc;
 }
 
 int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
@@ -5871,8 +5884,8 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  * modify_mappings_in() does so in the hierarchy rooted at @root, as
  * map_pages_in() does.
  */
-static int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
-                              unsigned long e, pte_attr_t nf)
+int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
+                       unsigned long e, pte_attr_t nf)
 {
     bool locking = system_state > SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
@@ -6152,7 +6165,12 @@ static int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
 
 int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
 {
-    return modify_mappings_in(idle_pg_table, s, e, nf);
+    int rc = modify_mappings_in(idle_pg_table, s, e, nf);
+
+    if ( !rc )
+        rc = sparse_dmap_mirror_modify(s, e, nf);
+
+    return rc;
 }
 
 int destroy_xen_mappings(unsigned long s, unsigned long e)
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index dcb1d407ec..f18959f3b4 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -22,6 +22,7 @@
 #include <asm/pv/mm.h>
 #include <asm/setup.h>
 #include <asm/shadow.h>
+#include <asm/sparse-directmap.h>
 
 /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */
 #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
@@ -650,6 +651,9 @@ static int __init dom0_construct(const struct boot_domain *bd)
         {
             if ( assign_pages(mfn_to_page(_mfn(initrd_mfn)), count, d, 0) )
                 BUG();
+            /* The initrd is dom0's now: out of the sparse directmap. */
+            if ( sparse_dmap_remove(_mfn(initrd_mfn), PFN_UP(initrd_len)) )
+                panic("Cannot unmap dom0's initrd\n");
             /*
              * We have mapped the initrd directly into dom0, and assigned the
              * pages. Tell the boot_module handling that we've freed it, so the
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 446cd81276..bdc43dfe58 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -54,6 +54,7 @@
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
 #include <asm/tboot.h>
+#include <asm/sparse-directmap.h>
 #include <asm/trampoline.h>
 #include <asm/traps.h>
 
@@ -1949,6 +1950,9 @@ void asmlinkage __init noreturn __start_xen(void)
 
     system_state = SYS_STATE_boot;
 
+    /* The heap now has all memory: page-tables come from it from here on. */
+    sparse_dmap_init();
+
     bsp_stack = cpu_alloc_stack(0); /* Needs to know IDT vs FRED */
     if ( !bsp_stack )
         panic("No memory for BSP stack\n");
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 7b04537066..c5d9dd64a3 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1231,8 +1231,14 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
     i = virt_to_mfn(HYPERVISOR_VIRT_END - 1) + 1;
     if ( spfn < i )
     {
-        ret = map_pages_to_xen((unsigned long)mfn_to_virt(spfn), _mfn(spfn),
-                               min(epfn, i) - spfn, PAGE_HYPERVISOR);
+        /*
+         * Into the full directmap only, not a sparse directmap view: the
+         * frame table and M2P carved from the start of the range are
+         * reached through their own mappings, and the rest goes to the
+         * heap, which the sparse view leaves out.
+         */
+        ret = map_pages_in(idle_pg_table, (unsigned long)mfn_to_virt(spfn),
+                           _mfn(spfn), min(epfn, i) - spfn, PAGE_HYPERVISOR);
         if ( ret )
             goto destroy_directmap;
     }
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 5243dba29f..2150dcbd5e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1971,6 +1971,9 @@ static void init_heap_pages(
     unsigned long i;
     bool need_scrub = scrub_debug;
 
+    if ( !arch_heap_pages_init(page_to_mfn(pg), nr_pages) )
+        return;
+
     /*
      * Keep MFN 0 away from the buddy allocator to avoid crossing zone
      * boundary when merging two buddies.
@@ -2540,10 +2543,33 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( !(memflags >> _MEMF_bits) )
         memflags |= MEMF_bits(xenheap_bits);
 
-    pg = alloc_domheap_pages(NULL, order, memflags | MEMF_no_scrub);
+    /*
+     * Pages still awaiting scrubbing may do as xenheap pages: the directmap
+     * maps them anyway.  Not so if an arch's sparse directmap view makes them
+     * reachable where the rest of the heap's memory is not.
+     */
+    if ( !arch_xenheap_needs_scrub() )
+        memflags |= MEMF_no_scrub;
+
+    pg = alloc_domheap_pages(NULL, order, memflags);
     if ( unlikely(pg == NULL) )
         return NULL;
 
+    if ( arch_xenheap_pages_alloc(page_to_mfn(pg), order) )
+    {
+        /*
+         * The hook may have mapped part of the pages before failing: take
+         * them out again as a free would, and leak them if that fails too.
+         */
+        if ( arch_xenheap_pages_free(page_to_mfn(pg), order) )
+            printk(XENLOG_WARNING
+                   "Leaking xenheap pages %"PRI_mfn"+%u: still mapped\n",
+                   mfn_x(page_to_mfn(pg)), 1U << order);
+        else
+            free_domheap_pages(pg, order);
+        return NULL;
+    }
+
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info |= PGC_xen_heap;
 
@@ -2562,6 +2588,19 @@ void free_xenheap_pages(void *v, unsigned int order)
 
     pg = virt_to_page(v);
 
+    /*
+     * If the pages cannot be taken out of an arch's sparse directmap view,
+     * they may remain reachable through it: leak them rather than hand them
+     * out.
+     */
+    if ( arch_xenheap_pages_free(page_to_mfn(pg), order) )
+    {
+        printk(XENLOG_WARNING
+               "Leaking xenheap pages %"PRI_mfn"+%u: still mapped\n",
+               mfn_x(page_to_mfn(pg)), 1U << order);
+        return;
+    }
+
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info &= ~PGC_xen_heap;
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 153c57f5dd..e8f9993286 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -94,6 +94,27 @@ bool scrub_free_pages(void);
 #define alloc_xenheap_page() (alloc_xenheap_pages(0,0))
 #define free_xenheap_page(v) (free_xenheap_pages(v,0))
 
+/*
+ * Hooks for an architecture keeping a second, sparse view of its directmap,
+ * which maps the xenheap but not the rest of the heap's memory.
+ */
+static inline bool arch_heap_pages_init(mfn_t mfn, unsigned long nr)
+{
+    return true;
+}
+static inline bool arch_xenheap_needs_scrub(void)
+{
+    return false;
+}
+static inline int arch_xenheap_pages_alloc(mfn_t mfn, unsigned int order)
+{
+    return 0;
+}
+static inline int arch_xenheap_pages_free(mfn_t mfn, unsigned int order)
+{
+    return 0;
+}
+
 /* Free an allocation, and zero the pointer to it. */
 #define FREE_XENHEAP_PAGES(p, o) do { \
     void *_ptr_ = (p);                \
-- 
2.56.0


