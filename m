Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69F4C624D5
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:44:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405453.1638952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVp-0002Vm-8G; Wed, 02 Sep 2026 09:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405453.1638952; Wed, 02 Sep 2026 09:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVp-0002VY-1d; Wed, 02 Sep 2026 09:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1405453;
 Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hVm-0002G4-Vz
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hVl-00B1Tu-V3
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:44:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe1-e002-0a2a0a5209dd-0a2a4504ec92-22
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:05 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe5-b57f-0a2a45040019-d99ba50cef06-1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:05 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id 698C936928D4; Wed,  2 Sep 2026 10:44:05 +0100 (BST)
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
Cc: George Dunlap <gwd@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 01/14] x86/domain_page: introduce IRQs-off variants of {,un}map_domain_page()
Date: Wed,  2 Sep 2026 10:43:45 +0100
Message-ID: <20260901-asi-part2-1-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788342245-C12DCB50-5B4BB83C/0/0
X-purgate-type: clean
X-purgate-size: 10808

From: George Dunlap <gwd@xenproject.org>

Currently, map_domain_page() cannot be called in the context switch
path.  However, Xen already needs to update the slot of an incoming PV
vcpu's GDT during context switch; and when we soon switch to per-vCPU
root pagetables, we'll have to modify two more places.

Xen currently solves the problem by special-casing the GDT/LDT L1
tables to be allocated from the xenheap, and stashing a pointer to its
address in the xenheap in the domain struct.  Rather than add more Xen
pagetable pages to the xenheap, introduce a version of map_domain_page
which can be called from the context switch path.

The reason map_domain_page() cannot be called from the context switch
path is x86's lazy context-switch state.  Mapcache mappings are
created in the page-tables that are loaded on the pCPU.  When Xen is
in a lazy context-switch state, current is the idle vCPU while the
previously-running vCPU's page-tables remain loaded.  If in this
state, another pcpu wants access to the lazily-swapped-out vcpu's
state, it will send a FLUSH_VCPU_STATE IPI to the processor, which
will call sync_local_execstate().

sync_local_execstate() is implemented internally by calling a full
__context_switch().  In addition to copying the processor state into
the vcpu structure, this also switches the loaded pagetables to the
idle vcpu's, which would in turn cause mappings created before the IPI
to disappear mid-use.  Therefore, mappings cannot be held in the
mapcache when a FLUSH_VCPU_STATE IPI may execute.  To this end,
map_domain_page() calls sync_local_execstate() itself proactively when
it detects a lazy context-switch state.  This guarantees that the
pagetables will remain consistent at least until the next context
switch.

But of course, that synchronization must not be triggered from the
context switch path itself: sync_local_execstate() ends up in
__context_switch(), so a call made while a context switch is in
progress would recurse, and the assertions along that path (current
being the idle vCPU) don't hold there either.

A full synchronization is sufficient to prevent a FLUSH_VCPU_STATE IPI
from switching the pagetables; however, it is not necessary.  It
suffices to maintain interrupts disabled from before the page is
mapped until after it is unmapped.  This condition is satisfied for
the mappings used on the context switch path.

Introduce {,un}map_domain_page_irqoff() variants for callers which
guarantee that interrupts remain disabled from the map until the
matching unmap.  Under that guarantee the synchronization is
unnecessary rather than merely inconvenient: no IPI can be delivered
while the mapping is in use, so the lazy state cannot change under the
caller's feet, and this_cpu(pgtable_vcpu) accurately identifies the
mapcache to use (see 622c9a5ba95d "x86/mm: accurately track which vCPU
page-tables are loaded").  The variants assert that interrupts are
disabled on entry; the rest of the contract remains the caller's
responsibility.

This will be used by the next patch, which introduces a function which
will be used to modify the incoming vCPU's per-domain mappings from
within __context_switch(); it will also be used in future ASI
patches (tearing down and establishing per-CPU stack mappings during
context switch).

No functional change for existing callers.

Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- New in this version.  Replaces "x86/mm: allocate the per-domain
  page-tables from the xenheap".

NB an alternate approach would be to disable the lazy context switch
entirely.  This simplifies the Xen code in general, and makes a patch
like this completely unnecessary, as then map_domain_page would itself
be safe to call in a context switch.  Tests show, however, that simply
removing the lazy context switch measurably hurts wake-heavy
workloads: on a wake-paced ping flood, throughput drops 22%
(round-trip latency 13→17 µs) on my NUC.

Another approach is to take up the GDT/LDT L1 technique instead.  v1
of the series made all perdomain pagetables allocated out of the
xenheap; but this was objected to due to the additional xenheap
allocations.  An alternate version would allocate from the domheap,
and then make permanent mappings in the vmap instead.  Another
potential performance improvement would be stashing the exact pages we
want to map, rather than needing to walk from the L3 each time.  We
leave both of these for future work.
---
 xen/arch/x86/domain_page.c    | 53 ++++++++++++++++++++++++++++-------
 xen/include/xen/domain_page.h | 14 +++++++++
 2 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 72c00194f3..1fc1580e62 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -18,7 +18,7 @@
 #include <asm/hardirq.h>
 #include <asm/setup.h>
 
-static inline struct vcpu *mapcache_current_vcpu(void)
+static inline struct vcpu *mapcache_current_vcpu(bool irqs_off)
 {
     struct vcpu *v = this_cpu(pgtable_vcpu);
     struct vcpu *curr = current;
@@ -36,8 +36,15 @@ static inline struct vcpu *mapcache_current_vcpu(void)
      * to the idle vCPU now, otherwise an incoming FLUSH_VCPU_STATE IPI would
      * change the page tables under our feet an invalidate any in-use mapcache
      * entries.
+     *
+     * Callers of the irqs_off variants instead guarantee that interrupts stay
+     * disabled until the matching unmap: no IPI can be delivered while the
+     * mapping is in use, so the lazy state cannot change under our feet and
+     * pgtable_vcpu identifies the right mapcache directly.  This also makes
+     * those variants usable from the context switch path itself, where
+     * calling sync_local_execstate() would recurse into __context_switch().
      */
-    if ( unlikely(this_cpu(curr_vcpu) != curr) )
+    if ( !irqs_off && unlikely(this_cpu(curr_vcpu) != curr) )
     {
         ASSERT(curr == idle_vcpu[smp_processor_id()]);
         sync_local_execstate();
@@ -46,10 +53,12 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     }
 
     /*
-     * At this point we can guarantee Xen is not in lazy context switch: either
-     * the code above will have synced the state, or an incoming
-     * FLUSH_VCPU_STATE IPI has done so behind our back.  Use ACCESS_ONCE to
-     * ensure the compiler never returns the locally cached pgtable_vcpu value.
+     * At this point either Xen is not in a lazy context switch (the code
+     * above will have synced the state, or an incoming FLUSH_VCPU_STATE IPI
+     * has done so behind our back), or the caller holds interrupts disabled
+     * and the state cannot change until it re-enables them.  Use ACCESS_ONCE
+     * to ensure the compiler never returns the locally cached pgtable_vcpu
+     * value.
      */
     return ACCESS_ONCE(this_cpu(pgtable_vcpu));
 }
@@ -59,7 +68,7 @@ static inline struct vcpu *mapcache_current_vcpu(void)
 #define MAPCACHE_L1ENT(idx) \
     __linear_l1_table[l1_linear_offset(MAPCACHE_VIRT_START + pfn_to_paddr(idx))]
 
-void *map_domain_page(mfn_t mfn)
+static void *do_map_domain_page(mfn_t mfn, bool irqs_off)
 {
     unsigned long flags;
     unsigned int idx, i;
@@ -73,7 +82,7 @@ void *map_domain_page(mfn_t mfn)
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
-    v = mapcache_current_vcpu();
+    v = mapcache_current_vcpu(irqs_off);
     if ( !v || !is_pv_vcpu(v) )
         return mfn_to_virt(mfn_x(mfn));
 
@@ -165,7 +174,19 @@ void *map_domain_page(mfn_t mfn)
     return (void *)MAPCACHE_VIRT_START + pfn_to_paddr(idx);
 }
 
-void unmap_domain_page(const void *ptr)
+void *map_domain_page(mfn_t mfn)
+{
+    return do_map_domain_page(mfn, false);
+}
+
+void *map_domain_page_irqoff(mfn_t mfn)
+{
+    ASSERT(!local_irq_is_enabled());
+
+    return do_map_domain_page(mfn, true);
+}
+
+static void do_unmap_domain_page(const void *ptr, bool irqs_off)
 {
     unsigned int idx;
     struct vcpu *v;
@@ -178,7 +199,7 @@ void unmap_domain_page(const void *ptr)
 
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
 
-    v = mapcache_current_vcpu();
+    v = mapcache_current_vcpu(irqs_off);
     ASSERT(v && is_pv_vcpu(v));
 
     dcache = &v->domain->arch.pv.mapcache;
@@ -223,6 +244,18 @@ void unmap_domain_page(const void *ptr)
     local_irq_restore(flags);
 }
 
+void unmap_domain_page(const void *ptr)
+{
+    do_unmap_domain_page(ptr, false);
+}
+
+void unmap_domain_page_irqoff(const void *ptr)
+{
+    ASSERT(!local_irq_is_enabled());
+
+    do_unmap_domain_page(ptr, true);
+}
+
 int mapcache_domain_init(struct domain *d)
 {
     struct mapcache_domain *dcache = &d->arch.pv.mapcache;
diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
index c89b149e54..b72dffb4c7 100644
--- a/xen/include/xen/domain_page.h
+++ b/xen/include/xen/domain_page.h
@@ -31,6 +31,16 @@ void *map_domain_page(mfn_t mfn);
  */
 void unmap_domain_page(const void *ptr);
 
+/*
+ * Variants of the above for callers which guarantee that interrupts are
+ * kept disabled from map until the matching unmap.  Under that guarantee
+ * no state synchronization is required to keep the mapping valid, so these
+ * are safe to use in contexts where such a synchronization must not be
+ * triggered, in particular from the context switch path itself.
+ */
+void *map_domain_page_irqoff(mfn_t mfn);
+void unmap_domain_page_irqoff(const void *ptr);
+
 /*
  * Given a VA from map_domain_page(), return its underlying MFN.
  */
@@ -45,6 +55,7 @@ void *map_domain_page_global(mfn_t mfn);
 void unmap_domain_page_global(const void *ptr);
 
 #define __map_domain_page(pg)        map_domain_page(page_to_mfn(pg))
+#define __map_domain_page_irqoff(pg) map_domain_page_irqoff(page_to_mfn(pg))
 
 static inline void *__map_domain_page_global(const struct page_info *pg)
 {
@@ -54,8 +65,11 @@ static inline void *__map_domain_page_global(const struct page_info *pg)
 #else /* !CONFIG_ARCH_MAP_DOMAIN_PAGE */
 
 #define map_domain_page(mfn)                __mfn_to_virt(mfn_x(mfn))
+#define map_domain_page_irqoff(mfn)         map_domain_page(mfn)
 #define __map_domain_page(pg)               page_to_virt(pg)
+#define __map_domain_page_irqoff(pg)        __map_domain_page(pg)
 #define unmap_domain_page(ptr)              ((void)(ptr))
+#define unmap_domain_page_irqoff(ptr)       unmap_domain_page(ptr)
 #define domain_page_map_to_mfn(ptr)         _mfn(__virt_to_mfn((unsigned long)(ptr)))
 
 static inline void *map_domain_page_global(mfn_t mfn)
-- 
2.55.0


