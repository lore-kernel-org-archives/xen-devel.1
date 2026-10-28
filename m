Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6C6606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=AtgzRgNp
Received: from list by lists.xenproject.org with outflank-mailman.1463809.1674777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6w-0003RZ-QR; Wed, 28 Oct 2026 23:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463809.1674777; Wed, 28 Oct 2026 23:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6u-0003FX-Sv; Wed, 28 Oct 2026 23:31:12 +0000
Received: by outflank-mailman (input) for mailman id 1463809;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-0004AF-HD
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00000000pRe-2iRK;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjq-00000001KpM-3Rir;
 Wed, 28 Oct 2026 23:07:23 +0000
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
	bh=ld4BxAzvJvhftiGylQHLlBGsLps0YgvS9JWe5NAWOXA=; b=AtgzRgNpkoHR6CcHNEJH7rLXV6
	/VxlzUYpWvt365O+Kdihs66lM1YTYV9HyC8oS90IzbZo0stziG4mdN2vpiWx7XyxLUju+ukRBVCv/
	NVkwBFUSf5siK3bA3DKWIvbiJwVUj5wraTFZlJWcEfFSqh+IKXp7WhsbqvlGy7gBHlZw=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 45/45] x86/xstate: move guest XSAVE areas behind the vCPU state window
Date: Wed, 28 Oct 2026 23:05:59 +0000
Message-ID: <20261028-asi-hvm-v5-45-13b908e0df0b@xenproject.org>
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

Guest vCPUs' XSAVE areas hold guest-owned register state, yet live in
always-mapped memory: xenheap objects when they fit a page, vmap-backed
allocations on hardware (AMX-class) where they do not.  Under Address
Space Isolation both placements leave the state reachable from every
context.  Move them to individual domain-heap pages, installed once at
vCPU creation at a fixed reservation (indexes 3-5) in the per-vCPU
state window, following the pattern set by the SVM VMCB and VMX MSR
list relocations.  With this, all eight slots of the state window are
in use.

The seam introduced by the VCPU_MAP_XSAVE_AREA() wrappers now gains
its real implementation.  The window address serves when v runs here
on its own page tables: v == current, and this_cpu(pgtable_vcpu) == v.
Neither test suffices alone.  Inside the EFI runtime bracket, and after
a shadow-mode update_cr3() failure, `current`'s own page tables are not
loaded.  While a CPU holds v's state lazily, v's page tables are
loaded, but an IPI syncing that state for another CPU can switch them
away at any time.  The page-table test also structurally rules out one
vCPU reaching through a same-vcpu_id window address into another
domain's state, which a dispatch on `current` alone would have made
possible to get wrong silently.  With the owning vCPU running on its
tables, or for an idle vCPU, the map is a pointer fetch, so the hot
paths map nothing.  Otherwise (a paused, never-started or
lazily held vCPU) the full-area map uses map_domain_pages() and can
fail; those callers gained error handling in "x86/xstate: classify
xsave-area seam accesses by failure mode".  The prefix variant maps
only the area's first page, which the legacy region and header always
fit, and hence cannot fail.  A mapping of a single page is dropped with
unmap_vcpu_state_page(), which also flushes this CPU's translation of
it; unmap_domain_pages() flushes a multipage mapping itself.

__context_switch() saves the outgoing vCPU's FPU state after `current`
has moved to the incoming vCPU, with interrupts off, while the outgoing
vCPU's page tables -- and therefore its window -- are normally still
loaded.  It takes the window address through a path of its own,
vcpu_save_fpu_ctxt_switch(): the transient-mapping fallback must not
run from there, as it would sync the local execution state and
re-enter __context_switch().  The shadow-mode paths which abandon a
vCPU's page tables early (update_cr3() failure in new_guest_cr3() and
_toggle_guest_pt()) leave the idle tables loaded with the outgoing
vCPU's state still in registers.  Those paths have already crashed the
domain, so there is nothing worth saving, and the save is skipped there,
as the register frame's already is: both sit under one test of the
loaded page tables.  Anything else failing it is a page-table tracking
bug rather than a recoverable state, so it is fatal in every build.

The window reservation is fixed at three pages, sized for the largest
save area current hardware produces (AMX TILEDATA); xstate_init()
refuses, with an explanatory panic, hardware whose enabled feature
set exceeds it.  It does so on every boot, with or without asi=: every
guest vCPU's area moves.

Idle vCPUs keep a globally-reachable area (xenheap, or vmap space where
it exceeds a page, as with AMX) deliberately: it is scratch for
accesses which execute with a guest's page tables loaded
(read_bndcfgu(), xstate_set_init()) and holds no guest register state.
On such paths the area a guest's MPX state is transiently saved into
remains reachable from other contexts, as today.

The backing pages are caller-owned (no _PAGE_AVAIL0): the per-domain
teardown reclaims only the page tables, so xstate_free_save_area()
unmaps the pages from the window and frees them itself.  Without
per-vCPU page tables (every PV domain) the window is in the per-domain
area that all its domain's vCPUs share, which outlives a vCPU whose
creation fails.  A failed partial allocation unwinds in place, and
xstate_free_save_area() tolerates the resulting half-built state, which
arch_vcpu_create()'s failure path relies on.

Memory cost: sub-page areas (all non-AMX hardware) round up from a
2.7KiB xenheap object to a full page per vCPU.  

The move does not depend on asi=, and applies to PV vCPUs as to HVM
ones.  A context switch now calls vcpu_xsave_area_ctxt_switch() for the
save, and vcpu_map_xsave_area() and vcpu_unmap_xsave_area() around the
restore, out of line, instead of reading v->arch.xsave_area.  The XRSTOR
following write_ptbase() reaches the area through a 4KiB, non-global PTE
in the per-domain area.  As switch_cr3_cr4() has just flushed every
non-global translation, that takes a page walk on every switch to a
guest vCPU, where a sub-page area, a xenheap object, was reached through
a superpage of the full directmap; the walk goes through the L1 table
which the register frame's restore has just walked.  On an Intel NUC, a
64-bit PV guest's vCPU context switch takes 15-30ns longer, with XPTI
off or on and against either the tree before the XSAVE work or the one
just before this change; code placement alone moves that measurement by
up to about 20ns between builds.  That was measured while the PV
guest's register frames were still in struct vcpu.

On AMX-class hardware, where the area takes three pages, a full-area
map for a vCPU other than the one running here goes through
map_domain_pages(): XEN_DOMCTL_getvcpuextstate and
XEN_DOMCTL_setvcpuextstate make one for PV save, restore and migration,
as the HVM XSAVE save record does for HVM guests.  The area is then
mapped in the calling vCPU's multipage slots, which only the calling
domain's page tables carry, and dropping the mapping flushes the
calling CPU's translations alone.  Each of those operations can now
fail with -ENOMEM.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.

xstate_init() now panics, with or without asi=, if the enabled XSAVE
features need more than the three pages the window reserves.  No
current hardware does.  Would you rather this did more, for instance
size the window's XSAVE range from the size found at boot, or fall back
to xenheap areas on such hardware?
---
 xen/arch/x86/domain.c             |  19 ++--
 xen/arch/x86/i387.c               |  23 +++-
 xen/arch/x86/include/asm/config.h |   3 +
 xen/arch/x86/include/asm/domain.h |  15 ++-
 xen/arch/x86/include/asm/i387.h   |   1 +
 xen/arch/x86/include/asm/xstate.h |  60 +++++------
 xen/arch/x86/xstate.c             | 172 +++++++++++++++++++++++++++++-
 7 files changed, 243 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index e57a99504b..b3f346020c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -595,7 +595,11 @@ int arch_vcpu_create(struct vcpu *v)
         BUILD_BUG_ON(VCPU_STATE_IDX_VMCB >= VCPU_STATE_NR_PAGES);
         BUILD_BUG_ON(VCPU_STATE_IDX_N2VMCB >= VCPU_STATE_NR_PAGES);
         BUILD_BUG_ON(VCPU_STATE_IDX_VMX_MSR >= VCPU_STATE_NR_PAGES);
+        BUILD_BUG_ON(VCPU_STATE_IDX_XSAVE + VCPU_STATE_XSAVE_PAGES >
+                     VCPU_STATE_NR_PAGES);
         BUILD_BUG_ON(VCPU_STATE_IDX_REGS >= VCPU_STATE_NR_PAGES);
+        BUILD_BUG_ON(VCPU_STATE_IDX_REGS < VCPU_STATE_IDX_XSAVE +
+                                           VCPU_STATE_XSAVE_PAGES);
         BUILD_BUG_ON(VCPU_STATE_IDX_EMUL >= VCPU_STATE_NR_PAGES);
         BUILD_BUG_ON(VCPU_STATE_IDX_EMUL == VCPU_STATE_IDX_REGS);
         /* Page tables only; torn down with the rest of the per-domain area. */
@@ -2228,17 +2232,20 @@ static void __context_switch(void)
     {
         ASSERT(read_atomic(&p->dirty_cpu) == cpu);
         /*
-         * p's frame is reached through its state window, mapped while p's
-         * own page tables are loaded, as they normally still are here.  Not
-         * so after the shadow-mode paths which abandon a vCPU's tables early
-         * (update_cr3() failure), which have crashed the domain: the frame
-         * is left unsaved.  A transient mapping would re-enter this function.
+         * p's frame and XSAVE area are reached through its state window,
+         * mapped while p's own page tables are loaded, as they normally
+         * still are here.  Not so after the shadow-mode paths which abandon
+         * a vCPU's tables early (update_cr3() failure), which have crashed
+         * the domain: both are left unsaved.  A transient mapping would
+         * re-enter this function.
          */
         if ( likely(this_cpu(pgtable_vcpu) == p) )
+        {
             memcpy(vcpu_user_regs(p), stack_regs, CTXT_SWITCH_STACK_BYTES);
+            vcpu_save_fpu_ctxt_switch(p);
+        }
         else
             BUG_ON(!domain_shutting_down(pd));
-        vcpu_save_fpu(p);
         pd->arch.ctxt_switch->from(p);
     }
 
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index d49e391e99..239404b37b 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -177,7 +177,9 @@ void vcpu_restore_fpu(struct vcpu *v)
 
     ASSERT(!is_idle_vcpu(v));
 
+    /* v runs here on its own page tables: the map cannot fail. */
     xsave_area = VCPU_MAP_XSAVE_AREA(v);
+    BUG_ON(!xsave_area);
 
     if ( cpu_has_xsave )
         fpu_xrstor(v, xsave_area, XSTATE_ALL);
@@ -195,25 +197,36 @@ void vcpu_restore_fpu(struct vcpu *v)
  * On each context switch, save the necessary FPU info of VCPU being switch 
  * out. It dispatches saving operation based on CPU's capability.
  */
-void vcpu_save_fpu(struct vcpu *v)
+static void save_fpu(struct vcpu *v, struct xsave_struct *xsave_area)
 {
-    struct xsave_struct *xsave_area;
-
     ASSERT(!is_idle_vcpu(v));
 
     /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
     clts();
 
-    xsave_area = VCPU_MAP_XSAVE_AREA(v);
-
     if ( cpu_has_xsave )
         fpu_xsave(v, xsave_area);
     else
         fpu_fxsave(v, &xsave_area->fpu_sse);
+}
 
+/* Save the FPU state of v, the vCPU running here. */
+void vcpu_save_fpu(struct vcpu *v)
+{
+    /* As in vcpu_restore_fpu(): the fastpath, which cannot fail. */
+    struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
+
+    BUG_ON(!xsave_area);
+    save_fpu(v, xsave_area);
     VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 }
 
+/* As vcpu_save_fpu(), for __context_switch() switching v out. */
+void vcpu_save_fpu_ctxt_switch(struct vcpu *v)
+{
+    save_fpu(v, vcpu_xsave_area_ctxt_switch(v));
+}
+
 /* Initialize FPU's context save area */
 int vcpu_init_fpu(struct vcpu *v)
 {
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 52d1ebc0e7..498e3c91fa 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -325,6 +325,9 @@ extern unsigned long xen_phys_start;
 #define VCPU_STATE_IDX_VMCB      0
 #define VCPU_STATE_IDX_N2VMCB    1
 #define VCPU_STATE_IDX_VMX_MSR   2
+#define VCPU_STATE_IDX_XSAVE     3
+/* Pages reserved for the XSAVE area; bounded at boot in xstate_init(). */
+#define VCPU_STATE_XSAVE_PAGES   3
 #define VCPU_STATE_IDX_REGS      6
 #define VCPU_STATE_IDX_EMUL      7
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 3748e417ce..69ab854177 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -685,12 +685,19 @@ struct arch_vcpu
     unsigned long cr3;                  /* (MA) value to install in HW CR3 */
 
     /*
-     * The save area for Processor Extended States and the bitmask of the
-     * XSAVE/XRSTOR features. They are used by: 1) when a vcpu (which has
-     * dirtied FPU/SSE) is scheduled out we XSAVE the states here; 2) in
-     * #NM handler, we XRSTOR the states we XSAVE-ed;
+     * The save area for Processor Extended States, XSAVEd on context
+     * switch out and XRSTORed on context switch in.  For guest vCPUs
+     * the backing pages (xsave_pg[], xsave_pgcnt of them) come from the
+     * domain heap and are mapped once, for the life of the vCPU, at a
+     * fixed spot in the per-vCPU state window; xsave_area holds that
+     * window address, valid whenever the owning vCPU's page tables are
+     * loaded.  Idle vCPUs' areas are ordinary Xen allocations (xenheap,
+     * or vmap space when larger than a page), reachable from every
+     * context.  Any other access goes through VCPU_MAP_XSAVE_AREA().
      */
     struct xsave_struct *xsave_area;
+    struct page_info *xsave_pg[VCPU_STATE_XSAVE_PAGES];
+    unsigned int xsave_pgcnt;
     uint64_t xcr0;
     /* Accumulated eXtended features mask for using XSAVE/XRESTORE by Xen
      * itself, as we can never know whether guest OS depends on content
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index 0717005d31..8d28de3ba8 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -29,6 +29,7 @@ struct ix87_env {
 
 void vcpu_restore_fpu(struct vcpu *v);
 void vcpu_save_fpu(struct vcpu *v);
+void vcpu_save_fpu_ctxt_switch(struct vcpu *v);
 int vcpu_init_fpu(struct vcpu *v);
 void vcpu_destroy_fpu(struct vcpu *v);
 
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index c23308cbe2..a906df11ad 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -130,46 +130,43 @@ xsave_area_compressed(const struct xsave_struct *xsave_area)
 }
 
 /*
- * Fetch a pointer to a vCPU's XSAVE area
+ * Fetch a pointer to a vCPU's XSAVE area.
  *
- * TL;DR: If v == current, the mapping is guaranteed to already exist.
+ * Guest vCPUs' areas live on the domain heap, mapped once for the life
+ * of the vCPU at a fixed spot in the owning vCPU's state window.  For a
+ * vCPU running here on its own page tables, and for an idle vCPU, the
+ * "map" is a pointer fetch.
  *
- * Despite the name, this macro might not actually map anything. The only case
- * in which a mutation of page tables is strictly required is when ASI==on &&
- * v!=current. For everything else the mapping already exists and needs not
- * be created nor destroyed.
+ * Otherwise -- a paused, never-started or lazily held vCPU -- the area
+ * is genuinely mapped, and mapping the full, possibly multi-page area
+ * can fail: VCPU_MAP_XSAVE_AREA() may return NULL, and callers must
+ * handle that.  The _PREFIX variant below cannot fail.
  *
- *                         +-----------------+--------------+
- *                         |   v == current  | v != current |
- *          +--------------+-----------------+--------------+
- *          | ASI  enabled | per-vCPU fixmap |  actual map  |
- *          +--------------+-----------------+--------------+
- *          | ASI disabled |             directmap          |
- *          +--------------+--------------------------------+
- *
- * There MUST NOT be outstanding maps of XSAVE areas of the non-current vCPU
- * at the point of context switch. Otherwise, the unmap operation will
- * misbehave.
- *
- * TODO: Expand the macro to the ASI cases after infra to do so is in place.
+ * There MUST NOT be outstanding maps of another vCPU's XSAVE area at
+ * the point of context switch: such a mapping is only valid on the
+ * pCPU that created it, and only until the next reschedule.
  *
  * @param v Owner of the XSAVE area
  */
-#define VCPU_MAP_XSAVE_AREA(v) ((v)->arch.xsave_area)
+struct xsave_struct *vcpu_map_xsave_area(const struct vcpu *v);
+void vcpu_unmap_xsave_area(const struct vcpu *v, const void *area);
+struct xsave_struct *vcpu_map_xsave_area_prefix(const struct vcpu *v);
+void vcpu_unmap_xsave_area_prefix(const struct vcpu *v, const void *area);
+struct xsave_struct *vcpu_xsave_area_ctxt_switch(const struct vcpu *v);
+
+#define VCPU_MAP_XSAVE_AREA(v) vcpu_map_xsave_area(v)
 
 /*
- * Drops the mapping of a vCPU's XSAVE area and nullifies its pointer on exit
- *
- * See VCPU_MAP_XSAVE_AREA() for additional information on the persistence of
- * these mappings. This macro only tears down the mappings in the ASI=on &&
- * v!=current case.
- *
- * TODO: Expand the macro to the ASI cases after infra to do so is in place.
+ * Drops the mapping of a vCPU's XSAVE area and nullifies the local
+ * pointer on exit.
  *
  * @param v Owner of the XSAVE area
  * @param x XSAVE blob of v
  */
-#define VCPU_UNMAP_XSAVE_AREA(v, x) do { (void)(v); (x) = NULL; } while (0)
+#define VCPU_UNMAP_XSAVE_AREA(v, x) do {  \
+    vcpu_unmap_xsave_area(v, x);          \
+    (x) = NULL;                           \
+} while ( false )
 
 /*
  * Variant of VCPU_MAP_XSAVE_AREA() for accessors which touch nothing
@@ -177,7 +174,10 @@ xsave_area_compressed(const struct xsave_struct *xsave_area)
  * XSTATE_AREA_MIN_SIZE bytes).  That prefix always fits within the
  * area's first page, so this variant cannot fail.
  */
-#define VCPU_MAP_XSAVE_AREA_PREFIX(v) VCPU_MAP_XSAVE_AREA(v)
-#define VCPU_UNMAP_XSAVE_AREA_PREFIX(v, x) VCPU_UNMAP_XSAVE_AREA(v, x)
+#define VCPU_MAP_XSAVE_AREA_PREFIX(v) vcpu_map_xsave_area_prefix(v)
+#define VCPU_UNMAP_XSAVE_AREA_PREFIX(v, x) do {  \
+    vcpu_unmap_xsave_area_prefix(v, x);          \
+    (x) = NULL;                                  \
+} while ( false )
 
 #endif /* __ASM_XSTATE_H */
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 2dd1699aba..7543edc160 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -5,6 +5,7 @@
  *
  */
 
+#include <xen/domain_page.h>
 #include <xen/param.h>
 #include <xen/percpu.h>
 #include <xen/sched.h>
@@ -14,6 +15,7 @@
 #include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/i387.h>
+#include <asm/mm.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/xstate.h>
@@ -555,9 +557,61 @@ int xstate_alloc_save_area(struct vcpu *v)
 
     /* XSAVE/XRSTOR requires the save area be 64-byte-boundary aligned. */
     BUILD_BUG_ON(__alignof(*save_area) < 64);
-    save_area = _xvzalloc(size, __alignof(*save_area));
-    if ( save_area == NULL )
-        return -ENOMEM;
+
+    if ( !is_idle_vcpu(v) )
+    {
+        /*
+         * The pages are the vCPU's own (no _PAGE_AVAIL0): the area teardown
+         * leaves them alone, and xstate_free_save_area() frees them.
+         */
+        unsigned int nr = PFN_UP(size), i;
+        mfn_t mfns[VCPU_STATE_XSAVE_PAGES];
+
+        /* xstate_init() bounds the host size against the reservation. */
+        BUG_ON(nr > VCPU_STATE_XSAVE_PAGES);
+
+        for ( i = 0; i < nr; i++ )
+        {
+            struct page_info *pg = alloc_domheap_page(v->domain,
+                                                      MEMF_no_owner);
+
+            if ( !pg )
+            {
+                while ( i-- )
+                {
+                    free_domheap_page(v->arch.xsave_pg[i]);
+                    v->arch.xsave_pg[i] = NULL;
+                }
+                return -ENOMEM;
+            }
+
+            v->arch.xsave_pg[i] = pg;
+            mfns[i] = page_to_mfn(pg);
+            clear_domain_page(mfns[i]);
+        }
+        v->arch.xsave_pgcnt = nr;
+
+        populate_perdomain_mapping(v, VCPU_STATE_ADDR(v, VCPU_STATE_IDX_XSAVE),
+                                   mfns, nr, __PAGE_HYPERVISOR_RW);
+
+        /*
+         * The window VA is not reachable from the creating context (v is
+         * still being built); seed the initial register values through a
+         * transient mapping of the first page instead.
+         */
+        save_area = map_domain_page(mfns[0]);
+    }
+    else
+    {
+        /*
+         * Idle vCPUs' areas must be reachable from every context: they are
+         * scratch for accesses made with a guest's page tables loaded
+         * (read_bndcfgu(), xstate_set_init()).
+         */
+        save_area = _xvzalloc(size, __alignof(*save_area));
+        if ( save_area == NULL )
+            return -ENOMEM;
+    }
 
     /*
      * We're creating a vCPU, so conceptually we should be choosing the
@@ -578,7 +632,15 @@ int xstate_alloc_save_area(struct vcpu *v)
     save_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
     save_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
 
-    v->arch.xsave_area = save_area;
+    if ( !is_idle_vcpu(v) )
+    {
+        unmap_domain_page(save_area);
+        v->arch.xsave_area =
+            (void *)VCPU_STATE_ADDR(v, VCPU_STATE_IDX_XSAVE);
+    }
+    else
+        v->arch.xsave_area = save_area;
+
     v->arch.xcr0 = 0;
     v->arch.xcr0_accum = 0;
 
@@ -587,7 +649,103 @@ int xstate_alloc_save_area(struct vcpu *v)
 
 void xstate_free_save_area(struct vcpu *v)
 {
-    XVFREE(v->arch.xsave_area);
+    if ( !is_idle_vcpu(v) )
+    {
+        unsigned int i, nr = v->arch.xsave_pgcnt;
+
+        if ( nr )
+        {
+            unmap_vcpu_state(v, VCPU_STATE_IDX_XSAVE, nr);
+            for ( i = 0; i < nr; i++ )
+            {
+                free_domheap_page(v->arch.xsave_pg[i]);
+                v->arch.xsave_pg[i] = NULL;
+            }
+            v->arch.xsave_pgcnt = 0;
+        }
+
+        v->arch.xsave_area = NULL;
+    }
+    else
+        XVFREE(v->arch.xsave_area);
+}
+
+struct xsave_struct *vcpu_map_xsave_area(const struct vcpu *v)
+{
+    mfn_t mfns[VCPU_STATE_XSAVE_PAGES];
+    unsigned int i;
+
+    if ( is_idle_vcpu(v) )
+        return v->arch.xsave_area;
+
+    /*
+     * The window VA is valid while v's own page tables are loaded, but that
+     * alone is not enough: while this CPU holds v's state lazily, an IPI
+     * syncing that state for another CPU can switch v's page tables away
+     * at any time.  Hence the window only for v running here on its own
+     * page tables, which current's are not inside the EFI runtime bracket
+     * or after a shadow-mode update_cr3() failure.
+     */
+    if ( v == current && this_cpu(pgtable_vcpu) == v )
+        return v->arch.xsave_area;
+
+    for ( i = 0; i < v->arch.xsave_pgcnt; i++ )
+        mfns[i] = page_to_mfn(v->arch.xsave_pg[i]);
+
+    return map_domain_pages(mfns, v->arch.xsave_pgcnt);
+}
+
+void vcpu_unmap_xsave_area(const struct vcpu *v, const void *area)
+{
+    if ( !area || is_idle_vcpu(v) ||
+         area == (const void *)v->arch.xsave_area )
+        return;
+
+    /*
+     * A single page comes from the single-page mapcache, whose
+     * domain-wide form defers its flushes; unmap_domain_pages() flushes a
+     * multipage mapping itself.
+     */
+    if ( v->arch.xsave_pgcnt == 1 )
+        unmap_vcpu_state_page(area);
+    else
+        unmap_domain_pages(area, v->arch.xsave_pgcnt);
+}
+
+struct xsave_struct *vcpu_map_xsave_area_prefix(const struct vcpu *v)
+{
+    /* The legacy region and header always fit the area's first page. */
+    BUILD_BUG_ON(sizeof(struct xsave_struct) > PAGE_SIZE);
+
+    /* The window VA under vcpu_map_xsave_area()'s conditions. */
+    if ( is_idle_vcpu(v) ||
+         (v == current && this_cpu(pgtable_vcpu) == v) )
+        return v->arch.xsave_area;
+
+    return map_domain_page(page_to_mfn(v->arch.xsave_pg[0]));
+}
+
+void vcpu_unmap_xsave_area_prefix(const struct vcpu *v, const void *area)
+{
+    if ( !area || is_idle_vcpu(v) ||
+         area == (const void *)v->arch.xsave_area )
+        return;
+
+    unmap_vcpu_state_page(area);
+}
+
+/*
+ * The XSAVE area of @v for __context_switch() saving it: `current` has
+ * moved on to the incoming vCPU, but @v's page tables are still loaded, and
+ * interrupts are off, so the window VA serves.  A transient mapping is not
+ * an option from there: it would sync the lazy state and re-enter
+ * __context_switch().
+ */
+struct xsave_struct *vcpu_xsave_area_ctxt_switch(const struct vcpu *v)
+{
+    BUG_ON(is_idle_vcpu(v) || this_cpu(pgtable_vcpu) != v);
+
+    return v->arch.xsave_area;
 }
 
 static bool valid_xcr0(uint64_t xcr0)
@@ -934,6 +1092,10 @@ void xstate_init(struct cpuinfo_x86 *c)
         xsave_cntxt_size = cpuid_count_ebx(0xd, 0);
         printk("xstate: size: %#x and states: %#"PRIx64"\n",
                xsave_cntxt_size, xfeature_mask);
+
+        if ( PFN_UP(xsave_cntxt_size) > VCPU_STATE_XSAVE_PAGES )
+            panic("XSAVE area needs %lu pages, vCPU state window reserves %u\n",
+                  PFN_UP(xsave_cntxt_size), VCPU_STATE_XSAVE_PAGES);
     }
     else
     {
-- 
2.56.0


