Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA25606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=o5nm8nJB
Received: from list by lists.xenproject.org with outflank-mailman.1463797.1674662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6W-0006as-ED; Wed, 28 Oct 2026 23:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463797.1674662; Wed, 28 Oct 2026 23:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6V-0006WY-DI; Wed, 28 Oct 2026 23:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1463797;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00048j-UK
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00000000pPV-0BTK;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCje-00000001KpM-4BIA;
 Wed, 28 Oct 2026 23:07:11 +0000
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
	bh=jMfdoAPkdAJPjogk0SgB6TI+M2sU6aQzGFQz4Pr0JLg=; b=o5nm8nJBEuIXNmjlt2hZK3iJ5c
	rMi+TSpqrt/SJUXfLcr2at3zU/rNo4QBWDav9fJnyPChHIScyEnPkVecanYX1tEY/2BHlj7EIXNAp
	frrR6bfTo95p77VQElE3EjQHV8/vyjbU0R3UjoKfnfnCJpB6+jl0NowN/amaU3i2Jb7c=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 33/45] x86: move the saved register frame behind the vCPU state window
Date: Wed, 28 Oct 2026 23:05:47 +0000
Message-ID: <20261028-asi-hvm-v5-33-13b908e0df0b@xenproject.org>
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

While a vCPU is not running, its register frame is saved in struct
vcpu: a xenheap page, mapped in every context, the sparse directmap view
included.  Under Address Space Isolation that leaves the general-purpose
registers of every descheduled vCPU reachable from other domains'
contexts, whether or not the vCPU's own domain is on the sparse view.

Keep the frame instead in a domain-heap page of the vCPU's own, mapped
for the life of the vCPU at a new slot (index 6) of its state window,
like the SVM VMCB and the VMX MSR list; indexes 3-5 are left for the
guest XSAVE area, which takes up to three pages.  Like the VMCB and MSR
list moves, this does not depend on asi=, and it applies to every guest
vCPU, PV and HVM: struct vcpu no longer holds a copy.  The page is
allocated in arch_vcpu_create() ahead of arch_vcpu_regs_init(), which
initialises the frame, and unmapped before it is freed, on the failure
path as at teardown.

An HVM vCPU using per-vCPU page tables has its window in its own page
tables.  For any other vCPU, PV ones included, the window is in the
per-domain area that all its domain's vCPUs share, which only that
domain's page tables map: a context on the sparse view reaches no other
domain's frames.  That includes a domain left off the sparse view, such
as dom0 under asi=1,dom0=0, whose vCPUs' frames are no longer mapped in
the contexts of the domUs on the sparse view.

__context_switch() saves the outgoing vCPU's frame while its page tables
are still loaded, and now restores the incoming vCPU's only after
write_ptbase(), once its window is mapped.  Nothing in between reads the
frame: set_xcr0(), the FPU restore, the ctxt_switch->to() hooks, and the
PSR and GDT updates.  Both copies go through the window address, with
interrupts off; a transient mapping would complete the lazy context
switch and re-enter __context_switch().

The save is skipped if the outgoing vCPU's page tables are no longer
loaded.  Only the shadow-mode paths which abandon a PV vCPU's page
tables early (update_cr3() failure in new_guest_cr3() and
_toggle_guest_pt()) leave them so, loading the idle page tables once
they have crashed the domain; anything else reaching that point is a
page-table tracking bug, fatal in every build.  After such a crash the
vCPU's saved frame is the one it was last switched in with, not its
registers at the crash, and that is what XEN_DOMCTL_getvcpucontext and
the debug keys report for it.

VCPU_MAP_REGS() returns the window address when the vCPU is running
here on its own page tables (v == current and this_cpu(pgtable_vcpu) ==
v), and otherwise a transient mapping of the page, which, for a single
page, cannot fail.  Its users all work on a vCPU other than the one
running here, normally paused or not yet run: vCPU creation, the
toolstack's vCPU context, the HVM CPU record, VCPUOP_initialise,
INIT/SIPI and S3 resets, a hypercall continued on another CPU, PV dom0
construction, and the debug-key dumps.  The vCPU's own page tables
being loaded is not enough: while a CPU holds a vCPU's state lazily
they are loaded there, but an IPI syncing that state for another CPU
can switch them away at any time.  VCPU_UNMAP_REGS() drops a transient
mapping with unmap_vcpu_state_page(), which also flushes this CPU's
translation.

The live frame on the pCPU's stack, which holds a running vCPU's
registers, is not affected.

Cost: a page per guest vCPU, and a transient mapping on each of the
cold paths above.  On every switch into a guest vCPU, the restore
reaches the frame through a 4KiB, non-global PTE in the per-domain
area, just after switch_cr3_cr4() has flushed the TLB, so it takes a
page walk, where struct vcpu was reached through a superpage of the
full directmap.  struct vcpu shrinks from 3072 to 2880 bytes (x86_64
defconfig).

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.
---
 xen/arch/x86/domain.c             | 98 ++++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/config.h |  1 +
 xen/arch/x86/include/asm/domain.h | 26 +++++---
 3 files changed, 116 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 6911f8484c..2c27be4437 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -17,6 +17,7 @@
 #include <xen/cpu.h>
 #include <xen/delay.h>
 #include <xen/domain.h>
+#include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/event.h>
 #include <xen/grant_table.h>
@@ -493,6 +494,66 @@ unsigned int arch_domain_struct_memflags(void)
     return MEMF_bits(bits);
 }
 
+/*
+ * A vCPU keeps its register frame, while it is not running, in a domain-heap
+ * page of its own, mapped for the life of the vCPU at a fixed slot of its
+ * state window.
+ */
+static struct cpu_user_regs *regs_window(const struct vcpu *v)
+{
+    return (void *)VCPU_STATE_ADDR(v, VCPU_STATE_IDX_REGS);
+}
+
+static int vcpu_regs_alloc(struct vcpu *v)
+{
+    struct page_info *pg = alloc_domheap_page(v->domain, MEMF_no_owner);
+    mfn_t mfn;
+
+    if ( !pg )
+        return -ENOMEM;
+
+    mfn = page_to_mfn(pg);
+    clear_domain_page(mfn);
+    populate_perdomain_mapping(v, VCPU_STATE_ADDR(v, VCPU_STATE_IDX_REGS),
+                               &mfn, 1, __PAGE_HYPERVISOR_RW);
+    v->arch.regs_pg = pg;
+
+    return 0;
+}
+
+static void vcpu_regs_free(struct vcpu *v)
+{
+    struct page_info *pg = v->arch.regs_pg;
+
+    if ( !pg )
+        return;
+
+    unmap_vcpu_state(v, VCPU_STATE_IDX_REGS, 1);
+    v->arch.regs_pg = NULL;
+    free_domheap_page(pg);
+}
+
+struct cpu_user_regs *vcpu_map_regs(const struct vcpu *v)
+{
+    /*
+     * v's page tables being loaded is not enough: while this CPU holds v's
+     * state lazily, an IPI syncing that state for another CPU can switch
+     * them away at any time.
+     */
+    if ( v == current && this_cpu(pgtable_vcpu) == v )
+        return regs_window(v);
+
+    return __map_domain_page(v->arch.regs_pg);
+}
+
+void vcpu_unmap_regs(const struct vcpu *v, const struct cpu_user_regs *regs)
+{
+    if ( !regs || regs == regs_window(v) )
+        return;
+
+    unmap_vcpu_state_page(regs);
+}
+
 /* Initialise various registers to their architectural INIT/RESET state. */
 void arch_vcpu_regs_init(struct vcpu *v)
 {
@@ -534,6 +595,7 @@ int arch_vcpu_create(struct vcpu *v)
         BUILD_BUG_ON(VCPU_STATE_IDX_VMCB >= VCPU_STATE_NR_PAGES);
         BUILD_BUG_ON(VCPU_STATE_IDX_N2VMCB >= VCPU_STATE_NR_PAGES);
         BUILD_BUG_ON(VCPU_STATE_IDX_VMX_MSR >= VCPU_STATE_NR_PAGES);
+        BUILD_BUG_ON(VCPU_STATE_IDX_REGS >= VCPU_STATE_NR_PAGES);
         /* Page tables only; torn down with the rest of the per-domain area. */
         rc = create_perdomain_mapping(v, VCPU_STATE_START(v),
                                       VCPU_STATE_NR_PAGES,
@@ -548,6 +610,10 @@ int arch_vcpu_create(struct vcpu *v)
 
         vmce_init_vcpu(v);
 
+        /* The frame's storage, ahead of its initialisation. */
+        if ( (rc = vcpu_regs_alloc(v)) != 0 )
+            goto fail;
+
         arch_vcpu_regs_init(v);
 
         if ( (rc = init_vcpu_msr_policy(v)) )
@@ -590,6 +656,7 @@ int arch_vcpu_create(struct vcpu *v)
  fail:
     paging_vcpu_teardown(v);
     vcpu_destroy_fpu(v);
+    vcpu_regs_free(v);
     xfree(v->arch.msrs);
     v->arch.msrs = NULL;
     free_pervcpu_mappings(v);
@@ -614,6 +681,8 @@ void arch_vcpu_destroy(struct vcpu *v)
     else
         ASSERT_UNREACHABLE();
 
+    vcpu_regs_free(v);
+
     free_pervcpu_mappings(v);
 }
 
@@ -2129,6 +2198,19 @@ static void load_default_gdt(unsigned int cpu)
     per_cpu(full_gdt_loaded, cpu) = false;
 }
 
+/*
+ * The register frame of p or n, for __context_switch(), which runs with
+ * interrupts off and with the vCPU's own page tables loaded: the window
+ * address serves.  A transient mapping is not an option from here: it would
+ * complete the lazy context switch and re-enter __context_switch().
+ */
+static struct cpu_user_regs *vcpu_user_regs(const struct vcpu *v)
+{
+    BUG_ON(this_cpu(pgtable_vcpu) != v);
+
+    return regs_window(v);
+}
+
 static void __context_switch(void)
 {
     struct cpu_user_regs *stack_regs = guest_cpu_user_regs();
@@ -2143,7 +2225,17 @@ static void __context_switch(void)
     if ( !is_idle_domain(pd) )
     {
         ASSERT(read_atomic(&p->dirty_cpu) == cpu);
-        memcpy(&p->arch._user_regs, stack_regs, CTXT_SWITCH_STACK_BYTES);
+        /*
+         * p's frame is reached through its state window, mapped while p's
+         * own page tables are loaded, as they normally still are here.  Not
+         * so after the shadow-mode paths which abandon a vCPU's tables early
+         * (update_cr3() failure), which have crashed the domain: the frame
+         * is left unsaved.  A transient mapping would re-enter this function.
+         */
+        if ( likely(this_cpu(pgtable_vcpu) == p) )
+            memcpy(vcpu_user_regs(p), stack_regs, CTXT_SWITCH_STACK_BYTES);
+        else
+            BUG_ON(!domain_shutting_down(pd));
         vcpu_save_fpu(p);
         pd->arch.ctxt_switch->from(p);
     }
@@ -2159,7 +2251,6 @@ static void __context_switch(void)
 
     if ( !is_idle_domain(nd) )
     {
-        memcpy(stack_regs, &n->arch._user_regs, CTXT_SWITCH_STACK_BYTES);
         if ( cpu_has_xsave )
         {
             if ( !set_xcr0(n->arch.xcr0 ?: XSTATE_FP_SSE) )
@@ -2183,6 +2274,9 @@ static void __context_switch(void)
 
     write_ptbase(n);
 
+    if ( !is_idle_domain(nd) )
+        memcpy(stack_regs, vcpu_user_regs(n), CTXT_SWITCH_STACK_BYTES);
+
 #ifdef CONFIG_PV
     /* Prefetch the VMCB if we expect to use it later in the context switch */
     if ( using_svm() && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 8a265e25c8..c8d4a8ddc7 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -311,6 +311,7 @@ extern unsigned long xen_phys_start;
 #define VCPU_STATE_IDX_VMCB      0
 #define VCPU_STATE_IDX_N2VMCB    1
 #define VCPU_STATE_IDX_VMX_MSR   2
+#define VCPU_STATE_IDX_REGS      6
 
 #define ELFSIZE 64
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 457eb69ace..6b27af9eb5 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -633,11 +633,12 @@ struct pv_vcpu
 struct arch_vcpu
 {
     /*
-     * The vCPU's register frame while it is not running: __context_switch()
-     * copies it here from the stack when the vCPU is switched out, and back
-     * when it is switched in.  Everything else goes through VCPU_MAP_REGS().
+     * The page holding the vCPU's register frame while it is not running,
+     * mapped in its state window: __context_switch() copies the frame there
+     * from the stack when the vCPU is switched out, and back when it is
+     * switched in.  Everything else goes through VCPU_MAP_REGS().
      */
-    struct cpu_user_regs _user_regs;
+    struct page_info *regs_pg;
 
     /* Debug registers. */
     unsigned long dr[4];
@@ -752,12 +753,20 @@ static inline void free_vcpu_guest_context(struct vcpu_guest_context *vgc)
  * registers for code working on a vCPU other than the one running (whose
  * registers are on the stack, see guest_cpu_user_regs()).
  *
+ * The frame is in the vCPU's state window: the window address serves while
+ * the vCPU runs here on its own page tables, and the page is mapped
+ * transiently otherwise, which cannot fail.
+ *
  * The pointer is valid until VCPU_UNMAP_REGS(), which clears it.  A mapping
- * must not be held across a scheduling point.
+ * must not be held across a scheduling point: a transient one is only valid
+ * on the pCPU which made it.
  *
  * @param v Owner of the register frame
  */
-#define VCPU_MAP_REGS(v) (&(v)->arch._user_regs)
+struct cpu_user_regs *vcpu_map_regs(const struct vcpu *v);
+void vcpu_unmap_regs(const struct vcpu *v, const struct cpu_user_regs *regs);
+
+#define VCPU_MAP_REGS(v) vcpu_map_regs(v)
 
 /*
  * Drops the mapping of a vCPU's register frame and nullifies its pointer.
@@ -765,7 +774,10 @@ static inline void free_vcpu_guest_context(struct vcpu_guest_context *vgc)
  * @param v Owner of the register frame
  * @param r Register frame of v, from VCPU_MAP_REGS()
  */
-#define VCPU_UNMAP_REGS(v, r) do { (void)(v); (r) = NULL; } while ( false )
+#define VCPU_UNMAP_REGS(v, r) do {  \
+    vcpu_unmap_regs(v, r);          \
+    (r) = NULL;                     \
+} while ( false )
 
 void arch_vcpu_regs_init(struct vcpu *v);
 
-- 
2.56.0


