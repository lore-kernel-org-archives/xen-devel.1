Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4985ECA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:00:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442179.1659780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNu-0006uL-MO; Wed, 07 Oct 2026 11:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442179.1659780; Wed, 07 Oct 2026 11:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNu-0006qV-7Q; Wed, 07 Oct 2026 11:00:30 +0000
Received: by outflank-mailman (input) for mailman id 1442179;
 Wed, 07 Oct 2026 11:00:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEPNr-0005yp-8T
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:00:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEPNp-001bw8-2z;
 Wed, 07 Oct 2026 11:00:25 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5F-001QnT-08;
 Wed, 07 Oct 2026 10:41:13 +0000
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
	bh=n89simzdmROfxUVTPCbuqHlbqGiH8SNCmEeAKkxXiY8=; b=cx9kdRn6GVCDclNUoGjK+lRlMa
	xwFzR9Jwf8sOsBeBE3BgO5xZnuEyOjcT69S7Hne2/DGqWF47LKOqvOrRrjbREp+8ibTAxowh7hqTf
	vjYzT5JJ6K+umk8QmwArrYN2nGDt3tJb5i8ntzmASJwKde6MfU8gM8StGV+1dPMTM3+U=;
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
Subject: [PATCH v3 13/18] x86/mm: build and maintain a sparse view of the directmap
Date: Wed,  7 Oct 2026 11:40:46 +0100
Message-ID: <20261007104051.48841-14-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The directmap maps all of RAM, and every root page-table carries it, so
while any guest context runs, all guest memory is reachable from Xen's
address space.  For ASI, guest contexts are to run on a view of the
directmap which maps only what Xen must reach through it at all times,
leaving guest memory to transient mappings (map_domain_page()).

Rather than remove the directmap for everyone, keep the full directmap
as it is, for the idle domain and for guest contexts not using ASI, and
build a second, sparse view: page-tables for the same virtual addresses
(the part of the directmap PV guests can see, where everything Xen
reaches through the directmap lives), mapping a subset of what the full
directmap maps, each entry a copy of the full directmap's.  Boot, dom0
construction and the idle domain keep the full directmap, so nothing in
them needs converting.

The sparse view maps the xenheap, and memory never handed to the heap
allocator (Xen's image, boot-time allocations, firmware tables).  It is
built once the boot allocator has handed its memory to the heap, from
the full directmap minus the ranges the heap was given, plus the xenheap
allocations made meanwhile (NUMA node heap metadata).  The page-tables
then come from the heap, and no other CPU is up.  The sparse view has an
L3 for each of its L4 slots from the start, so its L4 entries never
change and root page-tables can take copies of them.  It is then kept in
step:

 - xenheap allocations are added, and taken out again before the pages
   are freed.  If that fails the pages stay mapped, and are leaked with
   a warning rather than reused (the same reasoning as in "xen/page_alloc:
   Add a path for xenheap when there is no direct map" of the directmap
   removal series);
 - memory handed to the heap later (boot modules, .init, memory
   hot-add) is taken out, and is not handed over if that fails;
 - a PV dom0's initrd, assigned to dom0 in place, is taken out;
 - page-tables from the boot allocator, which the sparse view maps with
   every other boot-time allocation, are taken out when idle_pg_table's
   hierarchy frees them, and are not freed if that fails, so that the
   sparse view never keeps a page the heap may hand out;
 - changes to the full directmap through map_pages_to_xen() and
   modify_xen_mappings() are mirrored.  After boot, map_pages_to_xen()
   maps into the directmap only memory Xen keeps (stack guard and shadow
   stack pages, firmware tables) or hot-added memory about to be handed
   to the heap, which the second rule then takes out again.

Common code gains four hooks for this, arch_heap_pages_init(),
arch_xenheap_needs_scrub() and arch_xenheap_pages_{alloc,free}(), no-ops
unless CONFIG_SPARSE_DIRECTMAP is selected.  A failed
arch_xenheap_pages_alloc() may have mapped part of the pages:
alloc_xenheap_pages() then takes them out through
arch_xenheap_pages_free(), as a free would, before freeing them, and
leaks them if that fails too.  xen_mapping_lookup(), built only with
CONFIG_SPARSE_DIRECTMAP, reads an entry of either hierarchy under the
L3 table lock.

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

The sparse view is built only when some guest type is to use it, which
nothing can request yet: this patch changes nothing on its own.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- New in this version.
---
 xen/arch/x86/Kconfig                        |   1 +
 xen/arch/x86/Makefile                       |   1 +
 xen/arch/x86/include/asm/mm.h               |  17 +-
 xen/arch/x86/include/asm/sparse-directmap.h |  63 +++
 xen/arch/x86/mm.c                           | 128 +++++-
 xen/arch/x86/pv/dom0_build.c                |   4 +
 xen/arch/x86/setup.c                        |   4 +
 xen/arch/x86/sparse-directmap.c             | 424 ++++++++++++++++++++
 xen/common/Kconfig                          |  18 +
 xen/common/page_alloc.c                     |  41 +-
 xen/include/xen/mm.h                        |  35 ++
 11 files changed, 722 insertions(+), 14 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/sparse-directmap.h
 create mode 100644 xen/arch/x86/sparse-directmap.c

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index e5535ac484..cd72102ccc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -31,6 +31,7 @@ config X86
 	select HAS_SCHED_GRANULARITY
 	select HAS_SHARED_INFO
 	imply HAS_SOFT_RESET
+	select HAS_SPARSE_DIRECTMAP
 	select HAS_UBSAN
 	select HAS_VMAP
 	select HAS_VPCI if HVM
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 8a205c3d27..22b3c8bf6b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -63,6 +63,7 @@ obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
 obj-y += spec_ctrl.o
+obj-$(CONFIG_SPARSE_DIRECTMAP) += sparse-directmap.o
 obj-y += srat.o
 obj-y += string.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 87131dd4bf..0d1e319c09 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -7,6 +7,7 @@
 #include <xen/rwlock.h>
 #include <asm/io.h>
 #include <asm/page.h>
+#include <asm/sparse-directmap.h>
 #include <asm/uaccess.h>
 
 /*
@@ -595,6 +596,15 @@ mfn_t alloc_xen_pagetable(void);
 void free_xen_pagetable(mfn_t mfn);
 void *alloc_mapped_pagetable(mfn_t *pmfn);
 
+int map_pages_in(l4_pgentry_t *root, unsigned long virt, mfn_t mfn,
+                 unsigned long nr_mfns, pte_attr_t flags);
+int modify_mappings_in(l4_pgentry_t *root, unsigned long s, unsigned long e,
+                       pte_attr_t nf);
+#ifdef CONFIG_SPARSE_DIRECTMAP
+mfn_t xen_mapping_lookup(l4_pgentry_t *root, unsigned long va,
+                         pte_attr_t *flags, unsigned long *nr);
+#endif
+
 int __sync_local_execstate(void);
 
 /* Arch-specific portion of memory_op hypercall. */
@@ -655,12 +665,17 @@ void write_32bit_pse_identmap(uint32_t *l2);
 
 /*
  * x86 maps part of physical memory via the directmap region.
- * Return whether the range of MFN falls in the directmap region.
+ * Return whether the range of MFN falls in the directmap region, as seen from
+ * every context: with a sparse directmap view configured (see
+ * asm/sparse-directmap.h), no range is, except through a xenheap allocation.
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
index 0000000000..48c1f3c951
--- /dev/null
+++ b/xen/arch/x86/include/asm/sparse-directmap.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_SPARSE_DIRECTMAP_H
+#define X86_SPARSE_DIRECTMAP_H
+
+#include <xen/mm-frame.h>
+#include <xen/mm-types.h>
+#include <asm/page.h>
+
+#ifdef CONFIG_SPARSE_DIRECTMAP
+
+/*
+ * The part of the directmap the sparse view covers: the part PV guests can
+ * see, which is where everything Xen reaches through the directmap lives.
+ * SPARSE_DMAP_END_MFN is the first MFN past it.
+ */
+#define SPARSE_DMAP_START   DIRECTMAP_VIRT_START
+#define SPARSE_DMAP_END     HYPERVISOR_VIRT_END
+#define SPARSE_DMAP_END_MFN (virt_to_mfn(SPARSE_DMAP_END - 1) + 1)
+
+extern bool opt_sparse_dmap_pv, opt_sparse_dmap_hvm;
+
+/* Root of the sparse view, once built (NULL before, or if not configured). */
+extern l4_pgentry_t *sparse_dmap_root;
+
+static inline bool sparse_dmap_configured(void)
+{
+    return opt_sparse_dmap_pv || opt_sparse_dmap_hvm;
+}
+
+void sparse_dmap_init(void);
+int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn, unsigned long nr,
+                           pte_attr_t flags);
+int sparse_dmap_mirror_modify(unsigned long s, unsigned long e,
+                              pte_attr_t nf);
+int sparse_dmap_remove(mfn_t mfn, unsigned long nr);
+int sparse_dmap_drop_pagetable(mfn_t mfn);
+
+#else /* !CONFIG_SPARSE_DIRECTMAP */
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
+#endif /* CONFIG_SPARSE_DIRECTMAP */
+
+#endif /* X86_SPARSE_DIRECTMAP_H */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 94b96c3d9b..4a1bd9d146 100644
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
@@ -5394,11 +5395,104 @@ mfn_t xen_map_to_mfn(unsigned long va)
     return ret;
 }
 
+#ifdef CONFIG_SPARSE_DIRECTMAP
+/*
+ * Look @va up in the hierarchy rooted at @root, without allocating anything.
+ * Returns the MFN mapped at @va, or INVALID_MFN, with the mapping's flags in
+ * L1 form in *flags, and in *nr the number of pages from @va to the end of
+ * the entry that maps @va (or that finds it unmapped).
+ */
+mfn_t xen_mapping_lookup(l4_pgentry_t *root, unsigned long va,
+                         pte_attr_t *flags, unsigned long *nr)
+{
+    bool locking = system_state > SYS_STATE_boot;
+    l4_pgentry_t l4e = root[l4_table_offset(va)];
+    const l3_pgentry_t *pl3e = NULL;
+    const l2_pgentry_t *pl2e = NULL;
+    const l1_pgentry_t *pl1e = NULL;
+    struct page_info *l3page;
+    unsigned int shift = L4_PAGETABLE_SHIFT;
+    mfn_t ret = INVALID_MFN;
+
+    L3T_INIT(l3page);
+    *flags = 0;
+
+    if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
+        goto out;
+
+    pl3e = map_l3t_from_l4e(l4e) + l3_table_offset(va);
+    l3page = l4e_get_page(l4e);
+    L3T_LOCK(l3page);
+
+    shift = L3_PAGETABLE_SHIFT;
+    if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
+        goto out;
+    if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
+    {
+        /* The superpage PAT bit sits among the address bits. */
+        *flags = lNf_to_l1f(l3e_get_flags(*pl3e)) |
+                 (l3e_get_intpte(*pl3e) & _PAGE_PSE_PAT ? _PAGE_PAT : 0);
+        ret = _mfn((l3e_get_pfn(*pl3e) & ~((1UL << (2 * PAGETABLE_ORDER)) - 1)) +
+                   (PFN_DOWN(va) & ((1UL << (2 * PAGETABLE_ORDER)) - 1)));
+        goto out;
+    }
+
+    pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(va);
+    shift = L2_PAGETABLE_SHIFT;
+    if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
+        goto out;
+    if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
+    {
+        *flags = lNf_to_l1f(l2e_get_flags(*pl2e)) |
+                 (l2e_get_intpte(*pl2e) & _PAGE_PSE_PAT ? _PAGE_PAT : 0);
+        ret = _mfn((l2e_get_pfn(*pl2e) & ~((1UL << PAGETABLE_ORDER) - 1)) +
+                   l1_table_offset(va));
+        goto out;
+    }
+
+    pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(va);
+    shift = PAGE_SHIFT;
+    if ( l1e_get_flags(*pl1e) & _PAGE_PRESENT )
+    {
+        *flags = l1e_get_flags(*pl1e);
+        ret = l1e_get_mfn(*pl1e);
+    }
+
+ out:
+    L3T_UNLOCK(l3page);
+    unmap_domain_page(pl1e);
+    unmap_domain_page(pl2e);
+    unmap_domain_page(pl3e);
+    *nr = ((((va >> shift) + 1) << shift) - va) >> PAGE_SHIFT;
+    return ret;
+}
+#endif /* CONFIG_SPARSE_DIRECTMAP */
+
+/*
+ * Free a page-table page that the hierarchy rooted at @root has stopped
+ * using.  idle_pg_table's hierarchy has pages from the boot allocator,
+ * which the sparse directmap view maps along with every other boot-time
+ * allocation: such a page leaves the sparse view before it reaches the
+ * heap, and is kept if it cannot.  That takes the sparse view's L3 lock
+ * with an L3 lock of idle_pg_table's hierarchy held, the only order in
+ * which the two nest.  The sparse view's own page-tables come from the
+ * heap, which it does not map, and are freed directly, as the caller may
+ * hold the sparse view's L3 lock; so are tables freed straight after being
+ * allocated, having lost a race to be installed.
+ */
+static void free_pagetable_in(const l4_pgentry_t *root, mfn_t mfn)
+{
+    if ( root == idle_pg_table && sparse_dmap_drop_pagetable(mfn) )
+        return;
+
+    free_xen_pagetable(mfn);
+}
+
 /*
  * map_pages_to_xen() in the hierarchy rooted at @root: idle_pg_table's, or
  * another hierarchy sharing its virtual addresses.
  */
-static int map_pages_in(
+int map_pages_in(
     l4_pgentry_t *root,
     unsigned long virt,
     mfn_t mfn,
@@ -5503,10 +5597,10 @@ static int map_pages_in(
                         ol2e = l2t[i];
                         if ( (l2e_get_flags(ol2e) & _PAGE_PRESENT) &&
                              !(l2e_get_flags(ol2e) & _PAGE_PSE) )
-                            free_xen_pagetable(l2e_get_mfn(ol2e));
+                            free_pagetable_in(root, l2e_get_mfn(ol2e));
                     }
                     unmap_domain_page(l2t);
-                    free_xen_pagetable(l3e_get_mfn(ol3e));
+                    free_pagetable_in(root, l3e_get_mfn(ol3e));
                 }
             }
 
@@ -5604,7 +5698,7 @@ static int map_pages_in(
                         flush_flags(l1e_get_flags(l1t[i]));
                     flush_area(virt, flush_flags);
                     unmap_domain_page(l1t);
-                    free_xen_pagetable(l2e_get_mfn(ol2e));
+                    free_pagetable_in(root, l2e_get_mfn(ol2e));
                 }
             }
 
@@ -5736,7 +5830,7 @@ static int map_pages_in(
                     flush_area(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
-                    free_xen_pagetable(l2e_get_mfn(ol2e));
+                    free_pagetable_in(root, l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
                     spin_unlock(&map_pgdir_lock);
@@ -5783,7 +5877,7 @@ static int map_pages_in(
                 flush_area(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
-                free_xen_pagetable(l3e_get_mfn(ol3e));
+                free_pagetable_in(root, l3e_get_mfn(ol3e));
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5810,7 +5904,12 @@ int map_pages_to_xen(
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
@@ -5833,8 +5932,8 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
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
@@ -6044,7 +6143,7 @@ static int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l1mfn);
+                free_pagetable_in(root, l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -6088,7 +6187,7 @@ static int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l2mfn);
+                free_pagetable_in(root, l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -6114,7 +6213,12 @@ static int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
 
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
index bf980eba8c..f0a1197e62 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -22,6 +22,7 @@
 #include <asm/pv/mm.h>
 #include <asm/setup.h>
 #include <asm/shadow.h>
+#include <asm/sparse-directmap.h>
 
 /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */
 #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
@@ -651,6 +652,9 @@ static int __init dom0_construct(const struct boot_domain *bd)
             while ( count-- )
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
+            /* The initrd is dom0's now: out of the sparse directmap. */
+            if ( sparse_dmap_remove(_mfn(initrd_mfn), PFN_UP(initrd_len)) )
+                panic("Cannot unmap dom0's initrd\n");
             /*
              * We have mapped the initrd directly into dom0, and assigned the
              * pages. Tell the boot_module handling that we've freed it, so the
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a636e3205c..e52388ad28 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -54,6 +54,7 @@
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
 #include <asm/tboot.h>
+#include <asm/sparse-directmap.h>
 #include <asm/trampoline.h>
 #include <asm/traps.h>
 
@@ -1938,6 +1939,9 @@ void asmlinkage __init noreturn __start_xen(void)
 
     system_state = SYS_STATE_boot;
 
+    /* The heap now has all memory: page-tables come from it from here on. */
+    sparse_dmap_init();
+
     bsp_stack = cpu_alloc_stack(0); /* Needs to know IDT vs FRED */
     if ( !bsp_stack )
         panic("No memory for BSP stack\n");
diff --git a/xen/arch/x86/sparse-directmap.c b/xen/arch/x86/sparse-directmap.c
new file mode 100644
index 0000000000..1eb092c3ea
--- /dev/null
+++ b/xen/arch/x86/sparse-directmap.c
@@ -0,0 +1,424 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * A sparse view of the directmap.
+ *
+ * Xen maps all of RAM at DIRECTMAP_VIRT_START, and every root page-table
+ * carries those mappings.  The sparse view is a second set of page-tables
+ * for the same virtual addresses (the part of the directmap PV guests can
+ * see, which is where everything Xen reaches through the directmap lives),
+ * mapping only what Xen needs to reach through the directmap at all times.
+ *
+ * Memory in the full directmap can be classified into three groups:
+ *
+ * - Memory never handed to the heap.  This includes Xen's image,
+ *   boot-time allocations, and firmware tables.  Mapped in the sparse
+ *   view.
+ * - Memory handed to the heap, and not allocated to the xenheap.  Not
+ *   mapped in the sparse view: guest memory will come from here.
+ * - Memory handed to the heap, then allocated to the xenheap.  Mapped
+ *   in the sparse view.
+ *
+ * Guest contexts selected on the command line run on root page-tables
+ * carrying the sparse view's L3s in the directmap slots.
+ *
+ * Conceptually, the sparse view starts as a copy of the full directmap
+ * (idle_pg_table's hierarchy), and then:
+ * - Removes memory when it is handed to the heap.
+ * - Adds pages back when they are allocated as xenheap pages, and removes
+ *   them again when they are freed.
+ * - Mirrors changes to the full directmap (map_pages_to_xen(),
+ *   modify_xen_mappings()).
+ * - Removes memory handed to a domain without passing through the heap
+ *   (a PV dom0's initrd, used in place), and page-tables the boot
+ *   allocator provided when idle_pg_table's hierarchy frees them.
+ *
+ * Every virtual address mapping in the sparse view should be either
+ * identical to the corresponding full view mapping, or empty.
+ *
+ * The sparse view is built once the boot allocator has handed its
+ * memory to the heap (sparse_dmap_init()).  Until then, the hooks record
+ * the ranges handed to the heap and the xenheap allocations made from
+ * them, which sparse_dmap_init() leaves out and puts back.
+ */
+
+#include <xen/domain_page.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/numa.h>
+#include <xen/sort.h>
+
+#include <asm/page.h>
+#include <asm/sparse-directmap.h>
+
+bool __ro_after_init opt_sparse_dmap_pv;
+bool __ro_after_init opt_sparse_dmap_hvm;
+
+/* Root of the sparse view: only ever walked and copied from, never loaded. */
+static l4_pgentry_t __aligned(PAGE_SIZE) sparse_l4[L4_PAGETABLE_ENTRIES];
+l4_pgentry_t *__ro_after_init sparse_dmap_root;
+
+/*
+ * Before the sparse view is built: the MFN ranges handed to the heap, which
+ * it leaves out, and the xenheap allocations made meanwhile (heap metadata of
+ * NUMA nodes), which it puts back.
+ */
+struct mfn_range {
+    unsigned long s, e;
+};
+static struct mfn_range early_heap[256];
+static unsigned int nr_early_heap;
+static struct mfn_range early_xenheap[2 * MAX_NUMNODES];
+static unsigned int nr_early_xenheap;
+static bool early_overflow;
+
+/*
+ * Clip [*mfn, *mfn + *nr) to what the sparse view covers; false if nothing is
+ * left.
+ */
+static bool clip_to_sparse_view(unsigned long *mfn, unsigned long *nr)
+{
+    unsigned long end = SPARSE_DMAP_END_MFN;
+
+    if ( *mfn >= end )
+        return false;
+    if ( *nr > end - *mfn )
+        *nr = end - *mfn;
+
+    return *nr;
+}
+
+static void early_range_add(struct mfn_range *r, unsigned int *nr,
+                            unsigned int max, unsigned long s, unsigned long e)
+{
+    if ( *nr && r[*nr - 1].e == s )
+        r[*nr - 1].e = e;
+    else if ( *nr < max )
+        r[(*nr)++] = (struct mfn_range){ s, e };
+    else
+        early_overflow = true;
+}
+
+static void early_range_del(struct mfn_range *r, unsigned int *nr,
+                            unsigned long s, unsigned long e)
+{
+    unsigned int i;
+
+    for ( i = 0; i < *nr; i++ )
+        if ( r[i].s == s && r[i].e == e )
+        {
+            r[i] = r[--*nr];
+            return;
+        }
+}
+
+/*
+ * Copy the full directmap's mappings of MFNs [mfn, mfn + nr) into the sparse
+ * view.
+ */
+static int add_to_sparse_view(l4_pgentry_t *root, unsigned long mfn,
+                              unsigned long nr)
+{
+    unsigned long va = (unsigned long)mfn_to_virt(mfn);
+    unsigned long end = va + (nr << PAGE_SHIFT);
+
+    while ( va < end )
+    {
+        pte_attr_t flags;
+        unsigned long n;
+        mfn_t m = xen_mapping_lookup(idle_pg_table, va, &flags, &n);
+        int rc;
+
+        n = min(n, (end - va) >> PAGE_SHIFT);
+        if ( !mfn_eq(m, INVALID_MFN) &&
+             (rc = map_pages_in(root, va, m, n, flags)) )
+            return rc;
+        va += n << PAGE_SHIFT;
+    }
+
+    return 0;
+}
+
+static int remove_from_sparse_view(unsigned long mfn, unsigned long nr)
+{
+    unsigned long va = (unsigned long)mfn_to_virt(mfn);
+
+    return modify_mappings_in(sparse_dmap_root, va, va + (nr << PAGE_SHIFT),
+                              _PAGE_NONE);
+}
+
+/* Memory is about to be handed to the heap allocator. */
+bool arch_heap_pages_init(mfn_t mfn, unsigned long nr)
+{
+    unsigned long s = mfn_x(mfn);
+
+    if ( !sparse_dmap_configured() || !clip_to_sparse_view(&s, &nr) )
+        return true;
+
+    if ( !sparse_dmap_root )
+    {
+        early_range_add(early_heap, &nr_early_heap, ARRAY_SIZE(early_heap),
+                        s, s + nr);
+        return true;
+    }
+
+    if ( remove_from_sparse_view(s, nr) )
+    {
+        printk(XENLOG_ERR
+               "sparse directmap: cannot unmap MFNs %#lx-%#lx, not freeing\n",
+               s, s + nr - 1);
+        return false;
+    }
+
+    return true;
+}
+
+/*
+ * Xenheap pages enter the sparse view, which guest contexts run on: they
+ * must not bring along what a previous owner left in them, such as a dying
+ * domain's data still awaiting the scrubber.  Pages needing scrubbing are
+ * scrubbed as they are allocated then; clean ones need nothing.
+ */
+bool arch_xenheap_needs_scrub(void)
+{
+    return sparse_dmap_configured();
+}
+
+/* Pages have been allocated from the heap as xenheap pages. */
+int arch_xenheap_pages_alloc(mfn_t mfn, unsigned int order)
+{
+    unsigned long s = mfn_x(mfn), nr = 1UL << order;
+
+    if ( !sparse_dmap_configured() )
+        return 0;
+
+    /* Xenheap pages must be reachable through the sparse view. */
+    BUG_ON(s + nr > SPARSE_DMAP_END_MFN);
+
+    if ( !sparse_dmap_root )
+    {
+        early_range_add(early_xenheap, &nr_early_xenheap,
+                        ARRAY_SIZE(early_xenheap), s, s + nr);
+        return 0;
+    }
+
+    return add_to_sparse_view(sparse_dmap_root, s, nr);
+}
+
+/*
+ * Xenheap pages are about to be freed.  A failure means the pages may still
+ * be reachable through the sparse view, and must not be reused.
+ */
+int arch_xenheap_pages_free(mfn_t mfn, unsigned int order)
+{
+    unsigned long s = mfn_x(mfn), nr = 1UL << order;
+
+    if ( !sparse_dmap_configured() )
+        return 0;
+
+    BUG_ON(s + nr > SPARSE_DMAP_END_MFN);
+
+    if ( !sparse_dmap_root )
+    {
+        early_range_del(early_xenheap, &nr_early_xenheap, s, s + nr);
+        return 0;
+    }
+
+    return remove_from_sparse_view(s, nr);
+}
+
+/* Memory leaves Xen's hands without passing through the heap. */
+int sparse_dmap_remove(mfn_t mfn, unsigned long nr)
+{
+    return arch_heap_pages_init(mfn, nr) ? 0 : -ENOMEM;
+}
+
+/*
+ * A page-table page of idle_pg_table's hierarchy is about to be freed.  One
+ * the boot allocator provided is in the sparse view, as every boot-time
+ * allocation is: take it out before the heap may hand it on.  One allocated
+ * since came from the heap and is not in the sparse view, which a lookup
+ * finds without changing, or flushing, anything.  Non-zero: the page may
+ * still be mapped, and must not be freed.
+ */
+int sparse_dmap_drop_pagetable(mfn_t mfn)
+{
+    unsigned long s = mfn_x(mfn), nr = 1, n;
+    pte_attr_t flags;
+    int rc;
+
+    if ( !sparse_dmap_root || !clip_to_sparse_view(&s, &nr) ||
+         mfn_eq(xen_mapping_lookup(sparse_dmap_root,
+                                   (unsigned long)mfn_to_virt(s), &flags, &n),
+                INVALID_MFN) )
+        return 0;
+
+    rc = remove_from_sparse_view(s, 1);
+    if ( rc )
+        printk(XENLOG_WARNING
+               "Leaking page-table page %"PRI_mfn": still in the sparse directmap\n",
+               mfn_x(mfn));
+
+    return rc;
+}
+
+int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn, unsigned long nr,
+                           pte_attr_t flags)
+{
+    if ( !sparse_dmap_root || virt < SPARSE_DMAP_START ||
+         virt >= SPARSE_DMAP_END )
+        return 0;
+
+    nr = min(nr, (SPARSE_DMAP_END - virt) >> PAGE_SHIFT);
+
+    return map_pages_in(sparse_dmap_root, virt, mfn, nr, flags);
+}
+
+int sparse_dmap_mirror_modify(unsigned long s, unsigned long e,
+                              pte_attr_t nf)
+{
+    unsigned long va;
+
+    if ( !sparse_dmap_root || e <= SPARSE_DMAP_START ||
+         s >= SPARSE_DMAP_END )
+        return 0;
+
+    s = max(s, SPARSE_DMAP_START);
+    e = min(e, SPARSE_DMAP_END);
+
+    if ( !(nf & _PAGE_PRESENT) )
+        return modify_mappings_in(sparse_dmap_root, s, e, nf);
+
+    /*
+     * A permission change applies where the sparse view maps anything: it
+     * never creates mappings, and the sparse view need not map all of [s, e).
+     */
+    for ( va = s; va < e; )
+    {
+        pte_attr_t flags;
+        unsigned long n;
+        mfn_t m = xen_mapping_lookup(sparse_dmap_root, va, &flags, &n);
+        int rc;
+
+        n = min(n, (e - va) >> PAGE_SHIFT);
+        if ( !mfn_eq(m, INVALID_MFN) &&
+             (rc = modify_mappings_in(sparse_dmap_root, va,
+                                      va + (n << PAGE_SHIFT), nf)) )
+            return rc;
+        va += n << PAGE_SHIFT;
+    }
+
+    return 0;
+}
+
+static int __init cf_check cmp_mfn_range(const void *a, const void *b)
+{
+    const struct mfn_range *l = a, *r = b;
+
+    return l->s < r->s ? -1 : l->s > r->s;
+}
+
+static void __init cf_check swap_mfn_range(void *a, void *b)
+{
+    SWAP(*(struct mfn_range *)a, *(struct mfn_range *)b);
+}
+
+/*
+ * Build the sparse view: the full directmap, minus the ranges handed to the
+ * heap so far, plus the xenheap allocations made from them.  Called once the
+ * heap has taken over from the boot allocator, so that the page-tables come
+ * from the heap, and before any other CPU is up.
+ */
+void __init sparse_dmap_init(void)
+{
+    unsigned long va, mapped = 0;
+    unsigned int i, j;
+
+    if ( !sparse_dmap_configured() )
+        return;
+
+    if ( early_overflow )
+    {
+        printk(XENLOG_WARNING
+               "Sparse directmap: too many early heap ranges, disabled\n");
+        opt_sparse_dmap_pv = opt_sparse_dmap_hvm = false;
+        return;
+    }
+
+    /* An L3 for every slot, so that the L4 entries never change. */
+    for ( va = SPARSE_DMAP_START; va < SPARSE_DMAP_END;
+          va += 1UL << L4_PAGETABLE_SHIFT )
+    {
+        mfn_t l3mfn;
+        void *l3t = alloc_mapped_pagetable(&l3mfn);
+
+        if ( !l3t )
+            panic("Sparse directmap: out of memory\n");
+        unmap_domain_page(l3t);
+        sparse_l4[l4_table_offset(va)] =
+            l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
+    }
+
+    sort(early_heap, nr_early_heap, sizeof(*early_heap), cmp_mfn_range,
+         swap_mfn_range);
+
+    /*
+     * The full directmap, leaf by leaf, minus the ranges added to the
+     * heap.  Leaves come in address order, which is MFN order in the
+     * directmap, so the cursor into the sorted (and disjoint) heap
+     * ranges only moves forward.
+     */
+    for ( va = SPARSE_DMAP_START, j = 0; va < SPARSE_DMAP_END; )
+    {
+        pte_attr_t flags;
+        unsigned long n, s, e;
+        mfn_t m = xen_mapping_lookup(idle_pg_table, va, &flags, &n);
+
+        n = min(n, (SPARSE_DMAP_END - va) >> PAGE_SHIFT);
+        if ( mfn_eq(m, INVALID_MFN) )
+        {
+            va += n << PAGE_SHIFT;
+            continue;
+        }
+
+        for ( s = mfn_x(m), e = s + n; s < e; )
+        {
+            unsigned long upto = e;
+
+            while ( j < nr_early_heap && early_heap[j].e <= s )
+                j++;
+            if ( j < nr_early_heap && early_heap[j].s <= s )
+            {
+                s = min(e, early_heap[j].e);
+                continue;
+            }
+            if ( j < nr_early_heap )
+                upto = min(e, early_heap[j].s);
+
+            if ( map_pages_in(sparse_l4, va + ((s - mfn_x(m)) << PAGE_SHIFT),
+                              _mfn(s), upto - s, flags) )
+                panic("Sparse directmap: out of memory\n");
+            mapped += upto - s;
+            s = upto;
+        }
+
+        va += n << PAGE_SHIFT;
+    }
+
+    /*
+     * Now add back in ranges from the heap which were allocated to
+     * the xenheap.
+     */
+    for ( i = 0; i < nr_early_xenheap; i++ )
+    {
+        unsigned long nr = early_xenheap[i].e - early_xenheap[i].s;
+
+        if ( add_to_sparse_view(sparse_l4, early_xenheap[i].s, nr) )
+            panic("Sparse directmap: out of memory\n");
+        mapped += nr;
+    }
+
+    sparse_dmap_root = sparse_l4;
+
+    printk(XENLOG_INFO "Sparse directmap: %lu pages mapped\n", mapped);
+}
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b289e444f..8f2f605e45 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -167,6 +167,9 @@ config HAS_STATIC_MEMORY
 config HAS_SOFT_RESET
 	bool
 
+config HAS_SPARSE_DIRECTMAP
+	bool
+
 config HAS_STACK_PROTECTOR
 	bool
 
@@ -299,6 +302,21 @@ config SPECULATIVE_HARDEN_LOCK
 	  This option is disabled by default at run time, and needs to be
 	  enabled on the command line.
 
+
+config SPARSE_DIRECTMAP
+	bool "Sparse directmap view"
+	depends on HAS_SPARSE_DIRECTMAP
+	help
+	  Build support for a sparse view of the directmap, alongside the
+	  full one: it maps only the memory Xen needs to reach at all times
+	  (the Xen heap, Xen's own image, firmware tables), while guest
+	  memory is reached through transient mappings.  Guest contexts
+	  selected with the `asi=` command line option run on the sparse
+	  directmap view, narrowing the memory reachable from Xen's address
+	  space while they run, and hence the memory disclosure surface of
+	  speculative side channels.
+
+	  If unsure, say N.
 endmenu
 
 menu "Other hardening"
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index fe150eccd7..69e8e982b6 100644
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
index 153c57f5dd..2bcc45cf58 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -94,6 +94,41 @@ bool scrub_free_pages(void);
 #define alloc_xenheap_page() (alloc_xenheap_pages(0,0))
 #define free_xenheap_page(v) (free_xenheap_pages(v,0))
 
+/*
+ * Hooks for an architecture keeping a second, sparse view of its directmap,
+ * which maps the xenheap but not the rest of the heap's memory.
+ */
+#ifdef CONFIG_SPARSE_DIRECTMAP
+/* Memory is about to be handed to the heap.  False: don't, keep it out. */
+bool arch_heap_pages_init(mfn_t mfn, unsigned long nr);
+/* Xenheap pages are to be allocated.  True: scrub those needing it first. */
+bool arch_xenheap_needs_scrub(void);
+/*
+ * Xenheap pages were allocated.  Non-zero: failed, possibly part-way; the
+ * pages go through arch_xenheap_pages_free() before being freed again.
+ */
+int arch_xenheap_pages_alloc(mfn_t mfn, unsigned int order);
+/* Xenheap pages are to be freed.  Non-zero: failed, don't reuse them. */
+int arch_xenheap_pages_free(mfn_t mfn, unsigned int order);
+#else
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
+#endif
+
 /* Free an allocation, and zero the pointer to it. */
 #define FREE_XENHEAP_PAGES(p, o) do { \
     void *_ptr_ = (p);                \
-- 
2.55.0


