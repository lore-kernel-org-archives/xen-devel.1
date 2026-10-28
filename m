Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF6606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=oNClwR3Q
Received: from list by lists.xenproject.org with outflank-mailman.1463806.1674749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6r-000277-5F; Wed, 28 Oct 2026 23:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463806.1674749; Wed, 28 Oct 2026 23:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6p-000209-JY; Wed, 28 Oct 2026 23:31:07 +0000
Received: by outflank-mailman (input) for mailman id 1463806;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00049m-9r
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00000000pQs-1aHH;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCji-00000001KpM-0cW6;
 Wed, 28 Oct 2026 23:07:14 +0000
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
	bh=7+SfUGkgBYMN0fY336uRRwse3Bcl2E3YDqRetUP0NXs=; b=oNClwR3QfY5jjFZbB/6OJx/3AR
	wF/nDfGiph18juJTprE26VvtnNekzmVLqd+4Vn7yzcW1HBcJ6OpAiDhaKK8khriIqdmzjiH+W9tqg
	wEGtamMT2/I0SqVf5U2srqeV9M8+LFXrp0jm71w9ixyKpVY67VzY5QjGdwIKpOK3JygM=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 36/45] x86/domain_page: introduce map_domain_pages()
Date: Wed, 28 Oct 2026 23:05:50 +0000
Message-ID: <20261028-asi-hvm-v5-36-13b908e0df0b@xenproject.org>
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

map_domain_page() maps a single page, so callers needing a virtually
contiguous mapping of several (not necessarily physically contiguous)
frames have had to fall back to vmap(), which maps whatever the frames
hold in every context, those of domains on the sparse directmap view
included, for the lifetime of the mapping.  Provide a multipage
counterpart which maps them in the calling vCPU's per-domain area
instead, which only its domain's page tables carry:

    map_domain_pages(mfn, nr) / unmap_domain_pages(ptr, nr)

Each vCPU has MAPCACHE_MULTIPAGE_ENTRIES slots of its own for such
mappings.  With per-vCPU page tables, they are just above the vCPU's
single-page mapcache.  Where a domain's vCPUs share one per-domain
area, they are at the end of the mapcache sub-area, where each vCPU
has a fixed block of its own.  No single-page mapcache is needed: the
multipage slots are in the same VA range whether or not the domain has
one.  The mappings are order-aligned and tracked in a per-vCPU bitmap,
and bypass the maphash and the deferred garbage/epoch machinery.

At unmap a mapping's PTEs are cleared, and a local flush done.  Since
each vCPU has its own slots, even with a domain-wide L3, the local
flush suffices for correctness: even if a stray TLB entry is
speculatively loaded on another processor, no other vCPU will use that
mapping, and it will be flushed before the vCPU which owns the slots
runs on that CPU.

With regard to exposure: in a domain whose vCPUs share one per-domain
area, other vCPUs may be able to reach the mapping speculatively while
it exists, and afterwards through a stale TLB entry until their CPU
next flushes.  For guests on the full directmap, this doesn't expose
anything new, as the page is already mapped in the directmap anyway
(unless it's a PV domain and the page is past the short directmap).
For PV guests on the sparse directmap view, it's still an improvement
over the status quo, as exposure is limited to the domain, rather than
the whole system (as in the case of vmap).

An unmap will BUG() when given a pointer or a @nr which indexes
outside the vCPU's slots, unless that pointer is in the vmap area (see
below).

These slots are not available before the first page-table switch in
boot, nor with the idle vCPU's page tables loaded.  Currently no calls
are made during boot, and the only known way to reach
map_domain_pages() with the idle page tables loaded is on an error path
that will already ultimately crash the host.  Nonetheless, for
robustness, if called from a context where no mapping is available, it
will fall back to using vmap(); and unmap recognizes such an address
and vunmap()'s it.  This briefly exposes contents to every context,
and requires a system-wide TLB shootdown on unmap, but allows
execution to continue.  The alternative would be to BUG() in such a
context.  For those who want stricter isolation guarantees, at the
risk that more situations might come up in the future, a new
sub-option, asi=vmap-strict, off by default, makes the fallback a
BUG() instead.  The first fallback is logged.

The handling of a lazy context switch in mapcache_current_vcpu() moves
into pgtable_current_vcpu(), which map_domain_pages() uses whatever the
domain: an IPI can switch away page tables held lazily at any time.

Eight slots hold the largest mapping a known caller needs, a
three-page XSAVE area (four slots, order 2), with room for a two-page
mapping beside it.  Where a domain's vCPUs share one per-domain area,
the multipage area takes 256MiB of address space for MAX_VIRT_CPUS,
and one L1 table per 64 vCPUs.

Later patches convert the two known in-tree consumers.  Moving the
XSAVE areas off always-mapped memory needs the primitive too: the
XSAVE area exceeds one page on AMX-class hardware, and XSAVE/XRSTOR
require it to be virtually contiguous.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.
---
 docs/misc/xen-command-line.pandoc    |  10 +-
 xen/arch/x86/domain_page.c           | 171 +++++++++++++++++++++++++--
 xen/arch/x86/include/asm/config.h    |  14 +++
 xen/arch/x86/include/asm/domain.h    |   3 +
 xen/arch/x86/include/asm/spec_ctrl.h |   1 +
 xen/arch/x86/spec_ctrl.c             |   7 ++
 xen/include/xen/domain_page.h        |  21 ++++
 7 files changed, 216 insertions(+), 11 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 092c858f34..52e10eb393 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -203,7 +203,7 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     buggy or malicious other domain spamming the ring.
 
 ### asi (x86)
-> `= List of [ <bool>, {pv,hvm,dom0}=<bool>, directmap=<bool>,
+> `= List of [ <bool>, {pv,hvm,dom0}=<bool>, {directmap,vmap-strict}=<bool>,
 >              vcpu-pt=<bool> | vcpu-pt=hvm=<bool> ]`
 
 > Default: `false`
@@ -245,6 +245,14 @@ are meant to be used for debugging purposes only.**
   and `dom0=`) set this too, on builds that support it; on other builds they
   leave it off.
 
+* `vmap-strict` crashes the host when a multipage transient mapping
+  (`map_domain_pages()`) is requested where the loaded page-tables
+  have no slots for one: in early boot, or on the idle vCPU's
+  page-tables.  By default such a mapping falls back to `vmap()`,
+  which maps the pages in every context.  The first such mapping is
+  logged.  The option is for hosts where a crash is preferable to such
+  a mapping; none is known to be made in normal operation.
+
 ### asid (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 4198ee7c18..8e5ef4a34a 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2003-2006, Keir Fraser <keir@xensource.com>
  */
 
+#include <xen/bitmap.h>
 #include <xen/domain_page.h>
 #include <xen/efi.h>
 #include <xen/mm.h>
@@ -17,6 +18,7 @@
 #include <asm/flushtlb.h>
 #include <asm/hardirq.h>
 #include <asm/setup.h>
+#include <asm/spec_ctrl.h>
 
 /* Whether the vCPU supports mapcache usage, might not be in use. */
 static bool has_mapcache(const struct vcpu *v)
@@ -24,20 +26,22 @@ static bool has_mapcache(const struct vcpu *v)
     return is_pv_vcpu(v) || v->domain->arch.asi.vcpu_pt;
 }
 
-static inline struct vcpu *mapcache_current_vcpu(void)
+/*
+ * The vCPU whose page tables are loaded here, and stay loaded until the
+ * caller is done with what it maps in them.
+ */
+static struct vcpu *pgtable_current_vcpu(void)
 {
-    const struct vcpu *v = this_cpu(pgtable_vcpu);
     const struct vcpu *curr = current;
 
     /* During early boot pgtable_vcpu is not set, callers must handle NULL. */
-    if ( !v || !has_mapcache(v) )
+    if ( !this_cpu(pgtable_vcpu) )
         return NULL;
 
     /*
-     * If we are in a lazy context-switch state from a vCPU with a mapcache do
-     * a full switch to the idle vCPU now, otherwise an incoming
-     * FLUSH_VCPU_STATE IPI would change the page tables under our feet and
-     * invalidate any in-use mapcache entries.
+     * If we are in a lazy context-switch state do a full switch to the idle
+     * vCPU now, otherwise an incoming FLUSH_VCPU_STATE IPI would change the
+     * page tables under our feet and invalidate any in-use mappings in them.
      */
     if ( unlikely(this_cpu(curr_vcpu) != curr) )
     {
@@ -56,6 +60,17 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     return ACCESS_ONCE(this_cpu(pgtable_vcpu));
 }
 
+static inline struct vcpu *mapcache_current_vcpu(void)
+{
+    const struct vcpu *v = this_cpu(pgtable_vcpu);
+
+    /* During early boot pgtable_vcpu is not set, callers must handle NULL. */
+    if ( !v || !has_mapcache(v) )
+        return NULL;
+
+    return pgtable_current_vcpu();
+}
+
 /* Whether @v's page-tables carry the sparse view of the directmap. */
 static bool on_sparse_dmap(const struct vcpu *v)
 {
@@ -341,6 +356,124 @@ void unmap_domain_page(const void *ptr)
     local_irq_restore(flags);
 }
 
+/*
+ * The mapcache index of @v's first map_domain_pages() slot: above the
+ * single-page slots of its own mapcache with per-vCPU page tables, otherwise
+ * at its stride of the domain-wide multipage area.
+ */
+static unsigned int multipage_first_slot(const struct vcpu *v)
+{
+    if ( v->domain->arch.asi.vcpu_pt )
+        return MAPCACHE_PERVCPU_ENTRIES;
+
+    return PFN_DOWN(MAPCACHE_MULTIPAGE_START(v) - MAPCACHE_VIRT_START);
+}
+
+/*
+ * Multipage mappings come from slots of the vCPU whose page tables are
+ * loaded, which no other vCPU uses, and bypass the maphash and the
+ * garbage/epoch machinery: at unmap a mapping's PTEs are zapped, and their
+ * translations dropped from this CPU's TLB, at their addresses and at their
+ * aliases in the per-domain mirror.
+ */
+void *map_domain_pages(const mfn_t *mfn, unsigned int nr)
+{
+    unsigned long flags;
+    unsigned int i, first;
+    struct vcpu *v;
+    int idx;
+
+    if ( !nr || nr > MAPCACHE_MULTIPAGE_ENTRIES )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    if ( nr == 1 )
+        return map_domain_page(mfn[0]);
+
+    /* Early boot, or the idle vCPU's page tables: no multipage slots. */
+    v = pgtable_current_vcpu();
+    if ( !v || is_idle_vcpu(v) )
+    {
+        BUG_ON(opt_vmap_strict);
+        printk_once(XENLOG_WARNING
+                    "%pS: map_domain_pages() falling back to vmap()\n",
+                    __builtin_return_address(0));
+        return vmap(mfn, nr);
+    }
+
+    first = multipage_first_slot(v);
+
+    local_irq_save(flags);
+
+    idx = bitmap_find_free_region(&v->arch.mapcache.multipage_inuse,
+                                  MAPCACHE_MULTIPAGE_ENTRIES,
+                                  get_order_from_pages(nr));
+    if ( idx >= 0 )
+        for ( i = 0; i < nr; i++ )
+            l1e_write(&MAPCACHE_L1ENT(first + idx + i),
+                      l1e_from_mfn(mfn[i], __PAGE_HYPERVISOR_RW));
+
+    local_irq_restore(flags);
+
+    if ( idx < 0 )
+        return NULL;
+
+    return (void *)MAPCACHE_VIRT_START + pfn_to_paddr(first + idx);
+}
+
+void unmap_domain_pages(const void *ptr, unsigned int nr)
+{
+    unsigned long va = (unsigned long)ptr & PAGE_MASK;
+    unsigned long flags, slot;
+    unsigned int idx, first, i;
+    struct vcpu *v;
+
+    BUG_ON(!nr);
+
+    if ( nr == 1 )
+    {
+        unmap_domain_page(ptr);
+        return;
+    }
+
+    if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
+    {
+        vunmap((void *)va);
+        return;
+    }
+
+    v = pgtable_current_vcpu();
+    BUG_ON(!v || is_idle_vcpu(v) || va < MAPCACHE_VIRT_START);
+
+    first = multipage_first_slot(v);
+    slot = PFN_DOWN(va - MAPCACHE_VIRT_START);
+    BUG_ON(slot < first || slot - first >= MAPCACHE_MULTIPAGE_ENTRIES);
+
+    idx = slot - first;
+    BUG_ON(nr > MAPCACHE_MULTIPAGE_ENTRIES - idx);
+
+    local_irq_save(flags);
+
+    for ( i = 0; i < nr; i++ )
+    {
+        unsigned long addr = va + i * PAGE_SIZE;
+
+        ASSERT(l1e_get_flags(MAPCACHE_L1ENT(slot + i)) & _PAGE_PRESENT);
+        l1e_write(&MAPCACHE_L1ENT(slot + i), l1e_empty());
+        flush_tlb_one_local(addr);
+        if ( !is_pv_64bit_vcpu(v) )
+            flush_tlb_one_local(addr - PERDOMAIN_VIRT_START +
+                                PERDOMAIN_ALT_VIRT_START);
+    }
+
+    bitmap_release_region(&v->arch.mapcache.multipage_inuse, idx,
+                          get_order_from_pages(nr));
+
+    local_irq_restore(flags);
+}
+
 void mapcache_domain_init(struct domain *d)
 {
     struct mapcache_domain *dcache = &d->arch.pv.mapcache;
@@ -359,7 +492,7 @@ void mapcache_domain_init(struct domain *d)
 
     BUILD_BUG_ON(MAPCACHE_VIRT_END + PAGE_SIZE * (3 +
                  2 * PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long))) >
-                 MAPCACHE_VIRT_START + (PERDOMAIN_SLOT_MBYTES << 20));
+                 MAPCACHE_MULTIPAGE_VIRT_START);
     bitmap_pages = PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long));
     dcache->cache.inuse = (void *)MAPCACHE_VIRT_END + PAGE_SIZE;
     dcache->cache.garbage = dcache->cache.inuse +
@@ -376,12 +509,28 @@ int mapcache_vcpu_init(struct vcpu *v)
     unsigned long i;
     unsigned int ents, nr;
 
+    BUILD_BUG_ON(MAPCACHE_MULTIPAGE_ENTRIES > BITS_PER_LONG);
+
+    /* Without per-vCPU page tables, the vCPU's stride of the multipage area. */
+    if ( !is_idle_domain(d) && !d->arch.asi.vcpu_pt )
+    {
+        int rc = create_perdomain_mapping(v, MAPCACHE_MULTIPAGE_START(v),
+                                          MAPCACHE_MULTIPAGE_ENTRIES,
+                                          NIL(l1_pgentry_t *), NULL);
+
+        if ( rc )
+            return rc;
+    }
+
     if ( !has_mapcache(v) )
         return 0;
 
     cache = vcpu_mapcache(v, &dcache);
     if ( !dcache )
     {
+        BUILD_BUG_ON(MAPCACHE_PERVCPU_ENTRIES + MAPCACHE_MULTIPAGE_ENTRIES >
+                     MAPCACHE_ENTRIES);
+
         /* Per-vCPU bitmaps are an unsigned long each, in the vCPU itself. */
         cache->inuse = v->arch.mapcache.inuse;
         cache->garbage = v->arch.mapcache.garbage;
@@ -396,8 +545,10 @@ int mapcache_vcpu_init(struct vcpu *v)
 
     if ( ents > cache->entries )
     {
-        /* Populate page tables. */
-        int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents,
+        /* Populate page tables, a per-vCPU cache's multipage slots included. */
+        int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START,
+                                          ents + (dcache ? 0
+                                                  : MAPCACHE_MULTIPAGE_ENTRIES),
                                           NIL(l1_pgentry_t *), NULL);
 
         /* Populate the domain-wide bit maps (kept in the per-domain area). */
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 5bd9970fce..52d1ebc0e7 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -281,10 +281,24 @@ extern unsigned long xen_phys_start;
 #define MAPCACHE_VCPU_ENTRIES    (CONFIG_PAGING_LEVELS * CONFIG_PAGING_LEVELS)
 /* Single-page slots of a per-vCPU mapcache (vCPU-PT domains). */
 #define MAPCACHE_PERVCPU_ENTRIES 64
+/*
+ * Multipage slots of each vCPU: above the single-page ones of a per-vCPU
+ * mapcache, otherwise at the vCPU's stride of the multipage area.
+ */
+#define MAPCACHE_MULTIPAGE_ORDER    3
+#define MAPCACHE_MULTIPAGE_ENTRIES  (1U << MAPCACHE_MULTIPAGE_ORDER)
 #define MAPCACHE_ENTRIES         (MAX_VIRT_CPUS * MAPCACHE_VCPU_ENTRIES)
 #define MAPCACHE_VIRT_START      PERDOMAIN_VIRT_SLOT(1)
 #define MAPCACHE_VIRT_END        (MAPCACHE_VIRT_START + \
                                   MAPCACHE_ENTRIES * PAGE_SIZE)
+/* The multipage area, at the end of the sub-area. */
+#define MAPCACHE_MULTIPAGE_VA_SHIFT (MAPCACHE_MULTIPAGE_ORDER + PAGE_SHIFT)
+#define MAPCACHE_MULTIPAGE_VIRT_START \
+    (MAPCACHE_VIRT_START + (PERDOMAIN_SLOT_MBYTES << 20) - \
+     (MAX_VIRT_CPUS << MAPCACHE_MULTIPAGE_VA_SHIFT))
+#define MAPCACHE_MULTIPAGE_START(v) \
+    (MAPCACHE_MULTIPAGE_VIRT_START + \
+     ((v)->vcpu_id << MAPCACHE_MULTIPAGE_VA_SHIFT))
 
 /* Argument translation area. The third per-domain-mapping sub-area. */
 #define ARG_XLAT_VIRT_START      PERDOMAIN_VIRT_SLOT(2)
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 6b27af9eb5..3748e417ce 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -84,6 +84,9 @@ struct mapcache_vcpu {
         uint32_t      refcnt;
     } hash[MAPHASH_ENTRIES];
 
+    /* Which of the vCPU's map_domain_pages() slots are in use. */
+    unsigned long multipage_inuse;
+
     /* Accounting of a per-vCPU mapcache (vCPU-PT domains). */
     struct mapcache cache;
     /* Backing for cache.{inuse,garbage}. */
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index b62229ab5d..d9ad94ddb0 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -88,6 +88,7 @@ extern uint8_t default_scf;
 extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
 extern bool opt_vcpu_pt_hwdom, opt_vcpu_pt_hvm;
+extern bool opt_vmap_strict;
 
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index c86f5ff886..3c52916eda 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -86,6 +86,9 @@ bool __ro_after_init opt_bp_spec_reduce = true;
 
 static bool __initdata opt_ibpb_alt;
 
+/* BUG() where map_domain_pages() would fall back to vmap() (vmap-strict). */
+bool __ro_after_init opt_vmap_strict;
+
 /* Give each vCPU of an HVM domain its own per-domain area (vCPU-PT). */
 bool __ro_after_init opt_vcpu_pt_hvm;
 bool __ro_after_init opt_vcpu_pt_hwdom;
@@ -591,6 +594,8 @@ static int __init cf_check parse_asi(const char *s)
                     rc = -EINVAL;
                 }
             }
+            else if ( (val = parse_boolean("vmap-strict", s, ss)) >= 0 )
+                opt_vmap_strict = val;
             else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
             {
                 switch ( val )
@@ -840,6 +845,8 @@ static void __init print_details(enum ind_thunk thunk)
             printk("  ASI features for PV VMs:%s\n",
                    sparse_dmap_pv() && !opt_xpti_domu
                                           ? " sparse-directmap" : " None");
+        printk("  ASI vmap-strict: %s\n",
+               opt_vmap_strict            ? "enabled"           : "disabled");
     }
 }
 
diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
index c89b149e54..bf45a4cf55 100644
--- a/xen/include/xen/domain_page.h
+++ b/xen/include/xen/domain_page.h
@@ -31,6 +31,27 @@ void *map_domain_page(mfn_t mfn);
  */
 void unmap_domain_page(const void *ptr);
 
+/*
+ * Map @nr page frames, not necessarily physically contiguous, at
+ * consecutive virtual addresses.  Returns the virtual address of the
+ * first frame, or NULL when no space is available.  As with
+ * map_domain_page(), the mapping is only valid within the current VCPU,
+ * and must be unmapped by it; unmap_domain_pages() takes the same @nr,
+ * and accepts a pointer carrying an in-page offset.  Implemented on x86
+ * only at present.
+ *
+ * @nr has an implementation-defined upper bound (x86:
+ * MAPCACHE_MULTIPAGE_ENTRIES).  Exceeding it is a caller bug rather than a
+ * transient failure, and fails the mapping; callers needing more pages
+ * than a per-VCPU window holds want vmap() directly.
+ *
+ * unmap_domain_pages() is fatal given a pointer or an @nr which indexes
+ * outside the current VCPU's multipage slots.  A wrong @nr within them
+ * is not detected: callers must pass the @nr they mapped with.
+ */
+void *map_domain_pages(const mfn_t *mfn, unsigned int nr);
+void unmap_domain_pages(const void *ptr, unsigned int nr);
+
 /*
  * Given a VA from map_domain_page(), return its underlying MFN.
  */
-- 
2.56.0


