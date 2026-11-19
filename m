Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5788C606A32A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=M+vliMFk
Received: from list by lists.xenproject.org with outflank-mailman.1497118.1695439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i5-0002Pb-16; Thu, 19 Nov 2026 21:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497118.1695439; Thu, 19 Nov 2026 21:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i4-0002On-Nv; Thu, 19 Nov 2026 21:30:24 +0000
Received: by outflank-mailman (input) for mailman id 1497118;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001CY-8R
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tGD-22Sn;
 Thu, 19 Nov 2026 21:30:18 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Ml-0000000CVBH-2DZE;
 Thu, 19 Nov 2026 21:08:23 +0000
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
	bh=lVipAUCmGONwCt5LCT1zFu1hK5zv9sdEbfda0XvBF2E=; b=M+vliMFkAACrgh2n4cZhtCvQun
	Nh6AJ21M1XdsZtAB05hpOKXO2QxzM9/YIbzOAZiNOBM53e6E3NQoymSsVm6G7kGKXtWvTEVSXCgl2
	RvCMHajBUkA0Xol2jG+w3xbmscV05gwg8h3uE9DLWTsB6k0rgIH5rikU9W3A0SEaXwhE=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v7 35/50] x86/domain_page: clear a mapcache slot at its last unmap
Date: Thu, 19 Nov 2026 21:07:26 +0000
Message-ID: <20261119-asi-hvm-v7-35-6551b6d5c879@xenproject.org>
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

unmap_domain_page() keeps a recently unmapped slot in the vCPU's
maphash (MAPHASH_ENTRIES, 8 per vCPU) for a quick remap of the same
MFN, and leaves its PTE in place until the entry is displaced by a later
unmap or reclaimed by a full cache.  Until then the page stays mapped,
although nothing refers to the mapping and the mapcache holds no
reference to the page.  Where the mapcache clears a slot's PTE, it
defers the flush: the slot's translation can stay in the TLB of the CPU
which used it until that CPU next flushes.

While the full directmap is loaded, that reaches nothing it does not
map anyway.  On the sparse view of the directmap, Xen reaches
domain-heap memory only through mappings made for the purpose.  A
mapping or a translation left behind keeps the page reachable after its
last unmap: while Xen serves another of the guest's contexts on the
same vCPU, and, once the page is freed and handed to another domain,
from a context which has nothing to do with it.

So clear a slot's PTE when its last reference goes, maphash slots
included: the hash entry keeps the slot, not the mapping, and a later
hit maps the page again in the same slot.  The slot has mapped nothing
else in between, so that needs no flush.  Reusing the slot for another
page still goes through the garbage map, or through the replacement of
a hash entry when the cache is full, both of which flush first.

In a per-vCPU mapcache, as vCPU-PT domains have, also mark the local
CPU when a slot's PTE is cleared.  When the mark is set, reload CR3 as
the last step before the next VM entry, and at a lazy switch to the
idle vCPU, which keeps the vCPU's page-tables loaded while the CPU
idles.  A full TLB flush, and a CPU loading other page-tables
(switch_cr3_cr4()), drop the slot's translation too, and clear the
mark.  No other CPU holds the translation, as the vCPU's page-tables
are loaded on one CPU at a time.

A CR3 reload is enough.  The slot has a second address, in the mirror
of the per-domain area that every domain but a 64-bit PV one gets for
the compat argument translation area.  The mapcache's PTEs are not
global, and HVM page-tables never run with CR4.PCIDE, so the reload
drops every non-global translation of the loaded page-tables, the
slot's at both its addresses included.  It leaves Xen's global
translations alone, and the guest's own, tagged by VPID or ASID.

So the guest never runs with a stale slot translation: none outlives the
exit in which the slot was cleared, and later exits, whichever of the
guest's contexts they serve, reach nothing through one.  What remains is
the rest of that exit: a page freed and handed out again in that time
stays reachable from that CPU until the exit ends.  In builds with PV
support, the flush the allocator makes before reusing a page freed by
its owner reaches every CPU not fully flushed since the free, which
covers owned pages.  It does not cover a page with no owner, such as an
IOMMU page-table not shared with the p2m, nor any page in a build
without PV support.

A PV domain's domain-wide mapcache has its PTEs cleared but marks no
CPU, as CPUs running the domain's other vCPUs may hold the slot's
translation too, which a local flush would not reach.  For it, as
before, builds with PV support flush a page freed by its owner from
TLBs before the page is handed out again.

The cost is one PTE write per unmap into the maphash and per remap from
it; in a per-vCPU mapcache, one CR3 reload per exit that cleared a slot
(at its VM entry, or at the lazy switch to idle); and a test of a
per-CPU flag on every VM entry, with or without asi=.  The reload does
not move the TLB clock, so filtered flushes still count the CPU as not
flushed since its last full flush, which errs on the side of flushing.
A second unmap of an entry in the maphash now finds its PTE not present
and is caught by the check unmap_domain_page() has for entries the first
unmap zapped, rather than by the reference count's ASSERT() in debug
builds only.

The change does not depend on asi= or on a sparse view of the directmap
being configured: PV vCPUs use the domain-wide mapcache on the default
command line too.  For them it adds the PTE writes above, and leaves up
to MAPHASH_ENTRIES fewer pages per vCPU mapped in the
domain-wide mapcache.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v7:
- Replace the two INVLPGs at a per-vCPU mapcache slot's last unmap
  with a mark on the CPU, and a CR3 reload when it is set, as the last
  step before the next VM entry and at a lazy switch to idle; a full
  flush or a page-table switch clears the mark.  This reverses Roger's
  request for v4, and takes the first of the alternatives he named on
  v3 15/18: a flush before returning to the guest.  On an Intel box the
  INVLPGs cost a PVH guest's yield ping-pong 1.81 us a round trip, the
  flush 0.24 us; a port read that QEMU answers, 4,537 ns and 339 ns.
- Drop the note for reviewers on dropping the maphash: with the flush
  deferred, a freed slot must not map another page before a flush, so
  the garbage map and the wrap-time flush stay.
- Rebased over the vCPU state window and the XSAVE area's move, which
  now come earlier in the series: the comments of
  unmap_vcpu_state_page() and vcpu_unmap_xsave_area() say what a
  per-vCPU mapcache now does.

Changes in v4:
- Merge v3's 15/18 ("x86/mm: flush owned pages before reuse with the
  sparse directmap view") and 16/18 ("x86/domain_page: keep the
  maphash's slots, not their mappings").  Rather than flush pages freed
  by their owner before reuse wherever a sparse view is configured,
  invalidate a per-vCPU mapcache slot's translations on the local CPU
  right after its PTE is cleared (Roger).
- Message: don't restate when PV vCPUs use the mapcache (Roger).

Changes in v3:
- New in this version.
---
 xen/arch/x86/domain.c             |  6 +++
 xen/arch/x86/domain_page.c        | 75 +++++++++++++++++++++++++++----
 xen/arch/x86/flushtlb.c           |  6 +++
 xen/arch/x86/hvm/svm/svm.c        |  3 ++
 xen/arch/x86/hvm/vmx/vmx.c        |  3 ++
 xen/arch/x86/include/asm/domain.h |  9 +++-
 xen/arch/x86/mm.c                 |  7 +--
 xen/arch/x86/xstate.c             |  5 ++-
 8 files changed, 99 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1df6763530..f3e393088f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2341,6 +2341,12 @@ void noreturn context_switch(struct vcpu *prev, struct vcpu *next)
     if ( (per_cpu(curr_vcpu, cpu) == next) ||
          (is_idle_domain(nextd) && cpu_online(cpu)) )
     {
+        /*
+         * Idling keeps prev's page-tables loaded: drop the translations of
+         * mapcache slots zapped on them, as a VM entry would.
+         */
+        if ( is_idle_domain(nextd) )
+            mapcache_flush_zapped();
         local_irq_enable();
     }
     else
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 86a91c3571..5fcce759dd 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -144,6 +144,47 @@ static void mapcache_exit(struct mapcache_domain *dcache)
 #define MAPCACHE_L1ENT(idx) \
     __linear_l1_table[l1_linear_offset(MAPCACHE_VIRT_START + pfn_to_paddr(idx))]
 
+/*
+ * Set when this CPU zaps a slot of a per-vCPU mapcache, whose translations
+ * its TLB may then hold; cleared once they are dropped.
+ */
+DEFINE_PER_CPU(bool, mapcache_flush_pending);
+
+/*
+ * Clear a slot's PTE.  For a per-vCPU mapcache (HVM domains only), then also
+ * mark this CPU: its TLB may hold the slot's translations, at its address and
+ * at its alias in the per-domain mirror, which every HVM domain has, until
+ * mapcache_flush_zapped() or a flush drops them.  No other CPU can hold them:
+ * the vCPU's page-tables are loaded on one CPU at a time, and loading other
+ * page-tables flushes non-global translations.
+ */
+static void mapcache_zap(const struct mapcache_domain *dcache,
+                         unsigned int idx)
+{
+    l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
+    if ( dcache )
+        return;
+
+    this_cpu(mapcache_flush_pending) = true;
+}
+
+/*
+ * Drop the translations of the per-vCPU mapcache slots this CPU has zapped,
+ * if any.  The mapcache's PTEs are not global, and HVM page-tables run
+ * without CR4.PCIDE, so a CR3 reload drops them, with every other non-global
+ * translation of the loaded page-tables.
+ */
+void mapcache_flush_zapped(void)
+{
+    ASSERT(!local_irq_is_enabled());
+
+    if ( likely(!this_cpu(mapcache_flush_pending)) )
+        return;
+
+    write_cr3(read_cr3());
+    this_cpu(mapcache_flush_pending) = false;
+}
+
 void *map_domain_page(mfn_t mfn)
 {
     unsigned long flags;
@@ -190,6 +231,14 @@ void *map_domain_page(mfn_t mfn)
     {
         idx = hashent->idx;
         ASSERT(idx < cache->entries);
+        /*
+         * An entry the maphash kept holds on to its slot, not to its mapping
+         * (see unmap_domain_page()): map the page again.  No flush is needed,
+         * as the slot has mapped nothing else since.
+         */
+        if ( !hashent->refcnt )
+            l1e_write(&MAPCACHE_L1ENT(idx),
+                      l1e_from_mfn(mfn, __PAGE_HYPERVISOR_RW));
         hashent->refcnt++;
         ASSERT(hashent->refcnt);
         ASSERT(mfn_eq(l1e_get_mfn(MAPCACHE_L1ENT(idx)), mfn));
@@ -222,8 +271,8 @@ void *map_domain_page(mfn_t mfn)
                 if ( hashent->idx != MAPHASHENT_NOTINUSE && !hashent->refcnt )
                 {
                     idx = hashent->idx;
-                    ASSERT(l1e_get_pfn(MAPCACHE_L1ENT(idx)) == hashent->mfn);
-                    l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
+                    ASSERT(!(l1e_get_flags(MAPCACHE_L1ENT(idx)) &
+                             _PAGE_PRESENT));
                     hashent->idx = MAPHASHENT_NOTINUSE;
                     hashent->mfn = ~0UL;
                     break;
@@ -287,32 +336,40 @@ void unmap_domain_page(const void *ptr)
 
     local_irq_save(flags);
 
+    /*
+     * The maphash keeps a freed slot, not its mapping: the page may
+     * change hands meanwhile.  A domain-wide mapcache's translation
+     * left in a TLB is covered by the flush the allocator makes
+     * before reusing an owned page; a per-vCPU mapcache's translation
+     * is flushed at the next guest entry.
+     */
     if ( hashent->idx == idx )
     {
         ASSERT(hashent->mfn == mfn);
         ASSERT(hashent->refcnt);
         hashent->refcnt--;
+        if ( !hashent->refcnt )
+            mapcache_zap(dcache, idx);
     }
     else if ( !hashent->refcnt )
     {
+        /* The entry replaced has no mapping left: mark its slot as garbage. */
         if ( hashent->idx != MAPHASHENT_NOTINUSE )
         {
-            /* /First/, zap the PTE. */
-            ASSERT(l1e_get_pfn(MAPCACHE_L1ENT(hashent->idx)) ==
-                   hashent->mfn);
-            l1e_write(&MAPCACHE_L1ENT(hashent->idx), l1e_empty());
-            /* /Second/, mark as garbage. */
+            ASSERT(!(l1e_get_flags(MAPCACHE_L1ENT(hashent->idx)) &
+                     _PAGE_PRESENT));
             set_bit(hashent->idx, cache->garbage);
         }
 
-        /* Add newly-freed mapping to the maphash. */
+        /* Add the newly-freed slot to the maphash, without its mapping. */
+        mapcache_zap(dcache, idx);
         hashent->mfn = mfn;
         hashent->idx = idx;
     }
     else
     {
         /* /First/, zap the PTE. */
-        l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
+        mapcache_zap(dcache, idx);
         /* /Second/, mark as garbage. */
         set_bit(idx, cache->garbage);
     }
diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 5e2ed50ec9..ca7d76749f 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -98,6 +98,9 @@ static void do_tlb_flush(void)
     else
         write_cr3(read_cr3());
 
+    /* No translation of a zapped mapcache slot is left. */
+    this_cpu(mapcache_flush_pending) = false;
+
     if ( tlb_clk_enabled )
         post_flush(t);
 
@@ -172,6 +175,9 @@ void switch_cr3_cr4(struct vcpu *v, unsigned long cr3, unsigned long cr4)
     if ( cr4 & X86_CR4_PCIDE )
         invpcid_flush_all_nonglobals();
 
+    /* No translation of a zapped mapcache slot is left. */
+    this_cpu(mapcache_flush_pending) = false;
+
     if ( tlb_clk_enabled )
         post_flush(t);
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index c4d91947ba..09500d1510 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1050,6 +1050,9 @@ void asmlinkage svm_vmenter_helper(void)
     vmcb->rip = regs->rip;
     vmcb->rsp = regs->rsp;
     vmcb->rflags = regs->rflags | X86_EFLAGS_MBS;
+
+    /* Last: drop zapped mapcache slots' translations before the guest runs. */
+    mapcache_flush_zapped();
 }
 
 static void svm_guest_osvw_init(struct domain *d)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index bdbcd0ad4d..ba58fd3b45 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -5029,6 +5029,9 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     __vmwrite(GUEST_RSP,    regs->rsp);
     __vmwrite(GUEST_RFLAGS, regs->rflags | X86_EFLAGS_MBS);
 
+    /* Last: drop zapped mapcache slots' translations before the guest runs. */
+    mapcache_flush_zapped();
+
     return true;
 }
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index c4b06785aa..68764f8d39 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -71,7 +71,10 @@ struct mapcache_vcpu {
     /* Shadow of mapcache_domain.epoch. */
     unsigned int shadow_epoch;
 
-    /* Lock-free per-VCPU hash of recently-used mappings. */
+    /*
+     * Lock-free per-VCPU hash of recently-used mappings.  An entry without
+     * references keeps its slot but not its mapping (see unmap_domain_page()).
+     */
     struct vcpu_maphash_entry {
         unsigned long mfn;
         uint32_t      idx;
@@ -100,6 +103,10 @@ struct mapcache_domain {
 void mapcache_domain_init(struct domain *d);
 int mapcache_vcpu_init(struct vcpu *v);
 
+/* Whether this CPU's TLB may hold translations of zapped mapcache slots. */
+DECLARE_PER_CPU(bool, mapcache_flush_pending);
+void mapcache_flush_zapped(void);
+
 /* x86/64: toggle guest between kernel and user modes. */
 void toggle_guest_mode(struct vcpu *v);
 /* x86/64: toggle guest page tables between kernel and user modes. */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 9ac7ce656b..fd6ff4d3b6 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6665,9 +6665,10 @@ void unmap_vcpu_state(const struct vcpu *v, unsigned int idx, unsigned int nr)
  * CPU's translations of it: at its address, and at its alias in the
  * per-domain mirror, which every domain but a 64-bit PV one has (flushing
  * that address there is harmless).  Neither kind of mapcache drops them with
- * the slot's last mapping: each defers the flush, and CPUs running other
- * vCPUs of the domain may have cached a domain-wide one's slot too.  A
- * directmap address, where the caller has no mapcache, needs nothing.
+ * the slot's last mapping: a per-vCPU one flushes them before the CPU next
+ * enters the guest, a domain-wide one defers the flush, and CPUs running
+ * other vCPUs of its domain may have cached the slot too.  A directmap
+ * address, where the caller has no mapcache, needs nothing.
  */
 void unmap_vcpu_state_page(const void *va)
 {
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index c7b750db0a..7543edc160 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -702,8 +702,9 @@ void vcpu_unmap_xsave_area(const struct vcpu *v, const void *area)
         return;
 
     /*
-     * A single page comes from the single-page mapcache, which defers its
-     * flushes; unmap_domain_pages() flushes a multipage mapping itself.
+     * A single page comes from the single-page mapcache, whose
+     * domain-wide form defers its flushes; unmap_domain_pages() flushes a
+     * multipage mapping itself.
      */
     if ( v->arch.xsave_pgcnt == 1 )
         unmap_vcpu_state_page(area);
-- 
2.56.0


