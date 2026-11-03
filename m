Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C99606D83E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=hnVGcJnw
Received: from list by lists.xenproject.org with outflank-mailman.1470811.1679576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONy1-0005IG-D9; Tue, 03 Nov 2026 23:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470811.1679576; Tue, 03 Nov 2026 23:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxz-00059M-4k; Tue, 03 Nov 2026 23:30:59 +0000
Received: by outflank-mailman (input) for mailman id 1470811;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000dy-HU
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000000CovM-1Iuh;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONnw-0000000EMFa-012A;
 Tue, 03 Nov 2026 23:20:36 +0000
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
	bh=Y6ajORWqf8gpkH5v5C/jSbFAFNJo4H5wi/PdnzFQF1g=; b=hnVGcJnwAdVsodcqFoBr8j881f
	tyczsZaPBND8awqFECvJBujntyhSWR7/o81iKMLrTmD7CM+HCQ5l+Iz2tSeO56xcouyrEqfFkA4ml
	+wwX4U5Q6MHkCUsk1RD6tof9V2WDzyVTPDMdElcixiVchJG+8PJ0YibBwa9Lv09utzKk=;
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
Subject: [PATCH v6 17/44] x86/mm: build and maintain a sparse view of the directmap
Date: Tue,  3 Nov 2026 17:13:39 -0500
Message-ID: <20261103-asi-hvm-v6-17-59dbc5ce9615@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
directmap maps, each entry a copy of the full directmap's.  Boot and the
idle domain keep the full directmap, so nothing in them needs
converting.

The sparse view maps the xenheap, and memory never handed to the heap
allocator (Xen's image, boot-time allocations, firmware tables).  It is
built once the boot allocator has handed its memory to the heap, from
the full directmap minus the ranges the heap was given, plus the xenheap
allocations made meanwhile.  The page-tables then come from the heap,
and no other CPU is up.  The sparse view has an L3 for each of its L4
slots from the start, so its L4 entries never change and root
page-tables can take copies of them.  It is then kept in step through
the hooks added by "x86/mm: add hooks for a sparse view of the
directmap", which this patch implements for CONFIG_SPARSE_DIRECTMAP.

modify_xen_mappings_lite() needs no change: it only changes the mappings
of Xen's image, in L4 slot 261, which every root page-table shares with
idle_pg_table, outside the range the sparse view replaces.

xen_mapping_lookup(), built only with
CONFIG_SPARSE_DIRECTMAP, reads an entry of either hierarchy under the
L3 table lock.

The allocator may still have to scrub a page before returning it; this
will be mapped with map_domain_page().  This is fine for HVM domains
on the sparse view, as the mapcache is per-vCPU, so no other vCPU can
read unscrubbed data.  PV domains' mapcache is still domain-wide, so
for PV domains on the sparse view, this opens up a window where other
vCPUs could potentially speculatively access the unscrubbed data.
This would be fixed by having per-vCPU mapcaches for PV domains, or
synchronously scrubbing pages on free.  Neither are in the scope of the
current work.

The sparse view is built only when some domain type is to use it, which
nothing can request yet: this patch changes nothing on its own.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- Split: free_pagetable_in() moves to "x86/mm: let Xen's page-table
  walker operate on a given root", and the hooks with their stubs and
  callers to the new "x86/mm: add hooks for a sparse view of the
  directmap".

Changes in v4:
- Message: "domain type", not "guest type".
- Wrap a line that reached 80 columns.
- Memory hot-add maps the new range into the full directmap only.
- Define opt_sparse_dmap_hwdom here, beside the PV and HVM knobs
  (Roger).
- add_to_sparse_view(): assert that the lookup finds the MFN expected
  (Roger).
- cmp_mfn_range(): explicit return values, as in cmp_node() (Roger).
- Comments and variable name changes in sparse_dmap_init()'s loop over
  the heap's ranges (Roger).
- Message: drop "(NUMA node heap metadata)" (Roger).
- Message: drop the reference to the directmap removal series (Roger).
- Message: modify_xen_mappings_lite() needs no change (Roger).
- Message: note the limit of scrubbing at allocation for PV domains
  (Roger).
- Message: only boot and the idle domain keep the full directmap.
- Set the NX bit in this patch, rather than adding it in a later patch.

Changes in v3:
- New in this version.
---
 xen/arch/x86/Kconfig                        |   1 +
 xen/arch/x86/Makefile                       |   1 +
 xen/arch/x86/include/asm/mm.h               |   4 +
 xen/arch/x86/include/asm/sparse-directmap.h |  37 ++
 xen/arch/x86/mm.c                           |  74 ++++
 xen/arch/x86/sparse-directmap.c             | 431 ++++++++++++++++++++
 xen/common/Kconfig                          |  18 +
 xen/include/xen/mm.h                        |  14 +
 8 files changed, 580 insertions(+)
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
index 2be90ea098..86adf042e9 100644
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
index 61dc317dd4..113ade0bbd 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -604,6 +604,10 @@ int map_pages_in(l4_pgentry_t *root, unsigned long virt, mfn_t mfn,
                  unsigned long nr_mfns, pte_attr_t flags);
 int modify_mappings_in(l4_pgentry_t *root, unsigned long s, unsigned long e,
                        pte_attr_t nf);
+#ifdef CONFIG_SPARSE_DIRECTMAP
+mfn_t xen_mapping_lookup(l4_pgentry_t *root, unsigned long va,
+                         pte_attr_t *flags, unsigned long *nr);
+#endif
 
 int __sync_local_execstate(void);
 
diff --git a/xen/arch/x86/include/asm/sparse-directmap.h b/xen/arch/x86/include/asm/sparse-directmap.h
index 53747a98ad..ea14d44334 100644
--- a/xen/arch/x86/include/asm/sparse-directmap.h
+++ b/xen/arch/x86/include/asm/sparse-directmap.h
@@ -6,6 +6,41 @@
 #include <xen/mm-types.h>
 #include <asm/page.h>
 
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
+/*
+ * Which domains use the sparse view: PV domains and HVM domains other than
+ * the hardware domain, and the hardware domain, PV or PVH.
+ */
+extern bool opt_sparse_dmap_pv, opt_sparse_dmap_hvm, opt_sparse_dmap_hwdom;
+
+/* Root of the sparse view, once built (NULL before, or if not configured). */
+extern l4_pgentry_t *sparse_dmap_root;
+
+static inline bool sparse_dmap_configured(void)
+{
+    return opt_sparse_dmap_pv || opt_sparse_dmap_hvm || opt_sparse_dmap_hwdom;
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
 static inline bool sparse_dmap_configured(void) { return false; }
 static inline void sparse_dmap_init(void) {}
 static inline int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn,
@@ -27,4 +62,6 @@ static inline int sparse_dmap_drop_pagetable(mfn_t mfn)
     return 0;
 }
 
+#endif /* CONFIG_SPARSE_DIRECTMAP */
+
 #endif /* X86_SPARSE_DIRECTMAP_H */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 904ed7a258..0d475432ff 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5441,6 +5441,80 @@ mfn_t xen_map_to_mfn(unsigned long va)
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
+        ret = _mfn((l3e_get_pfn(*pl3e) &
+                    ~((1UL << (2 * PAGETABLE_ORDER)) - 1)) +
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
 /*
  * Free a page-table page that the hierarchy rooted at @root has stopped
  * using.  One of idle_pg_table's may be in the sparse directmap view: it is
diff --git a/xen/arch/x86/sparse-directmap.c b/xen/arch/x86/sparse-directmap.c
new file mode 100644
index 0000000000..d35a8d6979
--- /dev/null
+++ b/xen/arch/x86/sparse-directmap.c
@@ -0,0 +1,431 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * A sparse view of the directmap.
+ *
+ * Xen maps all of RAM at DIRECTMAP_VIRT_START, and every root page-table
+ * carries those mappings.  The sparse view is a second set of page-tables
+ * for the same virtual addresses (the part of the directmap PV guests can
+ * see), mapping only what Xen needs to reach through the directmap at all
+ * times:
+ *
+ * - Memory never handed to the heap: Xen's image, boot-time allocations,
+ *   firmware tables.  Not a PV dom0's initrd, used in place, nor the frame
+ *   table and M2P pages carved from hot-added memory.
+ * - Memory handed to the heap, then allocated to the xenheap.
+ *
+ * The rest of the heap's memory, where guest memory comes from, is not
+ * mapped.  Every mapping in the sparse view is either identical to the
+ * full directmap's at the same address, or empty.
+ *
+ * Guest contexts selected on the command line run on root page-tables
+ * carrying the sparse view's L3s in the directmap slots.
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
+bool __ro_after_init opt_sparse_dmap_hwdom;
+
+/* Root of the sparse view: only ever walked and copied from, never loaded. */
+static l4_pgentry_t __aligned(PAGE_SIZE) sparse_l4[L4_PAGETABLE_ENTRIES];
+l4_pgentry_t *__ro_after_init sparse_dmap_root;
+
+/*
+ * Before the sparse view is built: the MFN ranges handed to the heap, which
+ * it leaves out, and the xenheap allocations made since, which it puts back.
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
+    unsigned long start = (unsigned long)mfn_to_virt(mfn);
+    unsigned long va = start, end = start + (nr << PAGE_SHIFT);
+
+    while ( va < end )
+    {
+        pte_attr_t flags;
+        unsigned long n;
+        mfn_t va_mfn = xen_mapping_lookup(idle_pg_table, va, &flags, &n);
+        int rc;
+
+        ASSERT(mfn_eq(va_mfn, INVALID_MFN) ||
+               mfn_x(va_mfn) == mfn + ((va - start) >> PAGE_SHIFT));
+        n = min(n, (end - va) >> PAGE_SHIFT);
+        if ( !mfn_eq(va_mfn, INVALID_MFN) &&
+             (rc = map_pages_in(root, va, va_mfn, n, flags)) )
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
+ * Xenheap pages enter the sparse view, which guest contexts run on: those
+ * still holding a previous owner's data must be scrubbed first.
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
+        mfn_t mfn = xen_mapping_lookup(sparse_dmap_root, va, &flags, &n);
+        int rc;
+
+        n = min(n, (e - va) >> PAGE_SHIFT);
+        if ( !mfn_eq(mfn, INVALID_MFN) &&
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
+    if ( l->s > r->s )
+        return 1;
+    if ( l->s < r->s )
+        return -1;
+
+    return 0;
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
+    unsigned int i, heap_idx;
+
+    if ( !sparse_dmap_configured() )
+        return;
+
+    if ( early_overflow )
+    {
+        printk(XENLOG_WARNING
+               "Sparse directmap: too many early heap ranges, disabled\n");
+        opt_sparse_dmap_pv = opt_sparse_dmap_hvm = opt_sparse_dmap_hwdom =
+            false;
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
+     * directmap, and the heap ranges are sorted and disjoint, so
+     * heap_idx only moves forward.
+     */
+    for ( va = SPARSE_DMAP_START, heap_idx = 0; va < SPARSE_DMAP_END; )
+    {
+        pte_attr_t flags;
+        unsigned long n, s, e;
+
+        /* Get information about the leaf PTE at va. */
+        mfn_t mfn = xen_mapping_lookup(idle_pg_table, va, &flags, &n);
+
+        /* Clip the va range we're considering to SPARSE_DMAP_END. */
+        n = min(n, (SPARSE_DMAP_END - va) >> PAGE_SHIFT);
+        if ( mfn_eq(mfn, INVALID_MFN) )
+        {
+            va += n << PAGE_SHIFT;
+            continue;
+        }
+
+        /*
+         * Walk through the range [mfn, mfn + n) looking for ranges not
+         * handed to the heap.
+         */
+        for ( s = mfn_x(mfn), e = s + n; s < e; )
+        {
+            unsigned long upto = e;
+
+            /* Step past heap ranges that end at or before s. */
+            while ( heap_idx < nr_early_heap && early_heap[heap_idx].e <= s )
+                heap_idx++;
+
+            /* s lies in a heap range: skip to its end. */
+            if ( heap_idx < nr_early_heap && early_heap[heap_idx].s <= s )
+            {
+                s = min(e, early_heap[heap_idx].e);
+                continue;
+            }
+
+            /* Map up to the next heap range, or to the end of the leaf. */
+            if ( heap_idx < nr_early_heap )
+                upto = min(e, early_heap[heap_idx].s);
+
+            if ( map_pages_in(sparse_l4, va + ((s - mfn_x(mfn)) << PAGE_SHIFT),
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
+    /*
+     * Nothing in the directmap is executed: its slots are NX, as the full
+     * directmap's are.
+     */
+    if ( cpu_has_nx )
+        for ( i = l4_table_offset(SPARSE_DMAP_START);
+              i < l4_table_offset(SPARSE_DMAP_END); i++ )
+            l4e_add_flags(sparse_l4[i], _PAGE_NX_BIT);
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
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index e8f9993286..2bcc45cf58 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -98,6 +98,19 @@ bool scrub_free_pages(void);
  * Hooks for an architecture keeping a second, sparse view of its directmap,
  * which maps the xenheap but not the rest of the heap's memory.
  */
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
 static inline bool arch_heap_pages_init(mfn_t mfn, unsigned long nr)
 {
     return true;
@@ -114,6 +127,7 @@ static inline int arch_xenheap_pages_free(mfn_t mfn, unsigned int order)
 {
     return 0;
 }
+#endif
 
 /* Free an allocation, and zero the pointer to it. */
 #define FREE_XENHEAP_PAGES(p, o) do { \
-- 
2.56.0


