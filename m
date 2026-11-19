Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E850B606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=wNcyFSN+
Received: from list by lists.xenproject.org with outflank-mailman.1497113.1695403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i1-0001WC-Qd; Thu, 19 Nov 2026 21:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497113.1695403; Thu, 19 Nov 2026 21:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i1-0001Tf-Jo; Thu, 19 Nov 2026 21:30:21 +0000
Received: by outflank-mailman (input) for mailman id 1497113;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001Bx-07
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tG9-1iLK;
 Thu, 19 Nov 2026 21:30:18 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9MN-0000000CVBH-2vu6;
 Thu, 19 Nov 2026 21:07:59 +0000
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
	bh=WJ3aymglgYVjgjhwjh7T6Sw3B0M8iQ/bEW93NzEf/2U=; b=wNcyFSN+LXrrTZJeBAYTkDY7Un
	YF9j0JV8jOqPs7bLGh2Y+8r72BPd5WMfDIoLEG8ZTzTfNH7eyBtV6nDyNuxMeBJQHGLyvmi2Sj4wX
	OHl8VHPu1FX00c/zGuDJXfEV9koeS+VAknCFZF99oxyULlERg7gbKmCDGpm2d9dcq4CY=;
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
Subject: [PATCH v7 12/50] x86/domain_page: introduce map_domain_pages()
Date: Thu, 19 Nov 2026 21:07:03 +0000
Message-ID: <20261119-asi-hvm-v7-12-6551b6d5c879@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
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
hold in every context for the lifetime of the mapping, and whose
vunmap() flushes every CPU's TLB, once per page.  Provide a multipage
counterpart which maps them in the per-domain area of the calling
vCPU's domain instead, which only that domain's page tables carry:

    map_domain_pages(mfn, nr) / unmap_domain_pages(ptr, nr)

Each vCPU has MAPCACHE_MULTIPAGE_ENTRIES slots of its own for such
mappings, a fixed block at the end of the mapcache sub-area.  No
single-page mapcache is needed: the multipage slots are in the same VA
range whether or not the domain has one.  The mappings are
order-aligned and tracked in a per-vCPU bitmap, and bypass the maphash
and the deferred garbage/epoch machinery.

At unmap a mapping's PTEs are cleared, and a local flush done.  Since
each vCPU has its own slots, the local flush suffices for correctness,
although every vCPU's slots are in the domain's one L3: even if a stray
TLB entry is speculatively loaded on another processor, no other vCPU
will use that mapping, and it will be flushed before the vCPU which owns
the slots runs on that CPU.

With regard to exposure: the domain's other vCPUs may be able to reach
the mapping speculatively while it exists, and afterwards through a
stale TLB entry until their CPU next flushes.  This doesn't expose
anything new, as the page is already mapped in the directmap anyway
(unless it's a PV domain and the page is past the short directmap), and
it is less than vmap() exposes: every context carries the vmap area.

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
context.  The first fallback is logged.

The handling of a lazy context switch in mapcache_current_vcpu() moves
into pgtable_current_vcpu(), which map_domain_pages() uses whatever the
domain: an IPI can switch away page tables held lazily at any time.

Eight slots hold the largest mapping a known caller needs, a
three-page XSAVE area (four slots, order 2), with room for a two-page
mapping beside it.  The multipage area takes 256MiB of address space
for MAX_VIRT_CPUS, and one L1 table per 64 vCPUs.  The slot bitmap is a
field of struct arch_vcpu, as struct mapcache_vcpu exists for PV vCPUs
only; it sits in the struct's tail padding, which leaves its size
unchanged.

Later patches convert the two known in-tree consumers.  Moving the
XSAVE areas off the xenheap needs the primitive too: the XSAVE area
exceeds one page on AMX-class hardware, and XSAVE/XRSTOR require it to
be virtually contiguous.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v7:
- Standalone on staging, without the per-vCPU mapcache or the asi=
  option: the multipage slots are each vCPU's block of the domain-wide
  multipage area, the slot bitmap is a field of struct arch_vcpu (in its
  tail padding), and there is no vmap-strict sub-option; the vmap()
  fallback and its message stay.

Changes in v5:
- New in this version.
---
 xen/arch/x86/domain_page.c        | 166 +++++++++++++++++++++++++++---
 xen/arch/x86/include/asm/config.h |  11 ++
 xen/arch/x86/include/asm/domain.h |   3 +
 xen/include/xen/domain_page.h     |  21 ++++
 4 files changed, 188 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index f02be1675b..ea759155da 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2003-2006, Keir Fraser <keir@xensource.com>
  */
 
+#include <xen/bitmap.h>
 #include <xen/domain_page.h>
 #include <xen/efi.h>
 #include <xen/mm.h>
@@ -18,24 +19,22 @@
 #include <asm/hardirq.h>
 #include <asm/setup.h>
 
-static inline struct vcpu *mapcache_current_vcpu(void)
+/*
+ * The vCPU whose page tables are loaded here, and stay loaded until the
+ * caller is done with what it maps in them.
+ */
+static struct vcpu *pgtable_current_vcpu(void)
 {
-    const struct vcpu *v = this_cpu(pgtable_vcpu);
     const struct vcpu *curr = current;
 
-    /*
-     * During early boot pgtable_vcpu is not set, callers must handle NULL.
-     * Non-PV domains don't have a mapcache, the directmap covers all physical
-     * address space.
-     */
-    if ( !v || !is_pv_vcpu(v) )
+    /* During early boot pgtable_vcpu is not set, callers must handle NULL. */
+    if ( !this_cpu(pgtable_vcpu) )
         return NULL;
 
     /*
-     * If we are in a lazy context-switch state from a PV vCPU do a full switch
-     * to the idle vCPU now, otherwise an incoming FLUSH_VCPU_STATE IPI would
-     * change the page tables under our feet an invalidate any in-use mapcache
-     * entries.
+     * If we are in a lazy context-switch state do a full switch to the idle
+     * vCPU now, otherwise an incoming FLUSH_VCPU_STATE IPI would change the
+     * page tables under our feet and invalidate any in-use mappings in them.
      */
     if ( unlikely(this_cpu(curr_vcpu) != curr) )
     {
@@ -54,6 +53,21 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     return ACCESS_ONCE(this_cpu(pgtable_vcpu));
 }
 
+static inline struct vcpu *mapcache_current_vcpu(void)
+{
+    const struct vcpu *v = this_cpu(pgtable_vcpu);
+
+    /*
+     * During early boot pgtable_vcpu is not set, callers must handle NULL.
+     * Non-PV domains don't have a mapcache, the directmap covers all physical
+     * address space.
+     */
+    if ( !v || !is_pv_vcpu(v) )
+        return NULL;
+
+    return pgtable_current_vcpu();
+}
+
 #define mapcache_l2_entry(e) ((e) >> PAGETABLE_ORDER)
 #define MAPCACHE_L2_ENTRIES (mapcache_l2_entry(MAPCACHE_ENTRIES - 1) + 1)
 #define MAPCACHE_L1ENT(idx) \
@@ -223,6 +237,119 @@ void unmap_domain_page(const void *ptr)
     local_irq_restore(flags);
 }
 
+/*
+ * The mapcache index of @v's first map_domain_pages() slot: at its stride of
+ * the multipage area.
+ */
+static unsigned int multipage_first_slot(const struct vcpu *v)
+{
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
+    idx = bitmap_find_free_region(&v->arch.multipage_inuse,
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
+    bitmap_release_region(&v->arch.multipage_inuse, idx,
+                          get_order_from_pages(nr));
+
+    local_irq_restore(flags);
+}
+
 void mapcache_domain_init(struct domain *d)
 {
     struct mapcache_domain *dcache = &d->arch.pv.mapcache;
@@ -237,7 +364,7 @@ void mapcache_domain_init(struct domain *d)
 
     BUILD_BUG_ON(MAPCACHE_VIRT_END + PAGE_SIZE * (3 +
                  2 * PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long))) >
-                 MAPCACHE_VIRT_START + (PERDOMAIN_SLOT_MBYTES << 20));
+                 MAPCACHE_MULTIPAGE_VIRT_START);
     bitmap_pages = PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long));
     dcache->inuse = (void *)MAPCACHE_VIRT_END + PAGE_SIZE;
     dcache->garbage = dcache->inuse +
@@ -254,6 +381,19 @@ int mapcache_vcpu_init(struct vcpu *v)
     unsigned int ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
     unsigned int nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
 
+    BUILD_BUG_ON(MAPCACHE_MULTIPAGE_ENTRIES > BITS_PER_LONG);
+
+    /* The vCPU's stride of the multipage area. */
+    if ( !is_idle_domain(d) )
+    {
+        int rc = create_perdomain_mapping(d, MAPCACHE_MULTIPAGE_START(v),
+                                          MAPCACHE_MULTIPAGE_ENTRIES,
+                                          NIL(l1_pgentry_t *), NULL);
+
+        if ( rc )
+            return rc;
+    }
+
     if ( !is_pv_vcpu(v) || !dcache->inuse )
         return 0;
 
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index b3c68308ad..8e9b856a6c 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -279,10 +279,21 @@ extern unsigned long xen_phys_start;
 
 /* map_domain_page() map cache. The second per-domain-mapping sub-area. */
 #define MAPCACHE_VCPU_ENTRIES    (CONFIG_PAGING_LEVELS * CONFIG_PAGING_LEVELS)
+/* Multipage slots of each vCPU, at its stride of the multipage area. */
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
index 6ba59deeb5..3980d6228a 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -685,6 +685,9 @@ struct arch_vcpu
 
     struct vcpu_msrs *msrs;
 
+    /* Which of the vCPU's map_domain_pages() slots are in use. */
+    unsigned long multipage_inuse;
+
     struct {
         bool next_interrupt_enabled;
     } monitor;
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


