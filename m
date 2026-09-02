Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB28DC624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:46:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405508.1639008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hXm-0006BC-2B; Wed, 02 Sep 2026 09:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405508.1639008; Wed, 02 Sep 2026 09:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hXl-0006B0-Vp; Wed, 02 Sep 2026 09:46:09 +0000
Received: by outflank-mailman (input) for mailman id 1405508;
 Wed, 02 Sep 2026 09:46:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hXk-0006AZ-EU
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:46:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hXj-00HNId-RZ
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:46:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97f056-2eae-0a2a0a5409dd-0a2a4504b044-42
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:46:07 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-b57f-0a2a45040019-d99ba50cfba4-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:07 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id 532A23692902; Wed,  2 Sep 2026 10:44:07 +0100 (BST)
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
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 14/14] x86/mm: introduce per-vCPU L3 page-table
Date: Wed,  2 Sep 2026 10:43:58 +0100
Message-ID: <20260901-asi-part2-14-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788342247-C0CDFB50-70616C36/0/0
X-purgate-type: clean
X-purgate-size: 25501

From: Roger Pau Monné <roger.pau@citrix.com>

The per-domain area is currently a single domain-wide structure: one L3,
referenced from every root page-table associated with the domain, so
every mapping in it is visible to every vCPU of the domain.  Its
contents are already laid out in per-vCPU slices (each vCPU's GDT/LDT
window, COMPAT_ARG_XLAT pages, and mapcache entries), but the visibility
is domain-wide.  Meanwhile, much of the per-vCPU state Xen maintains --
the VMCB, the VMX MSR load/save areas, FPU/XSAVE state -- lives in
always-mapped memory, and so do the pCPU stacks.

Allow the "per-domain" area to be per-vCPU instead ("VCPU-PT").  This
will immediately isolate the existing per-vCPU mappings from other
running vCPUs on HVM domains (PV SMP for VCPU-PT requires further
work; see below).  We will later build on this, adding per-vCPU mapped
areas (into which we can put vCPU state currently in the xenheap,
mentioned above); per-vCPU mapcaches (which will eventually allow us
to remove domheap pages from the direct map), and finally transient
mappings of the pCPU stack on which the vCPU is currently running.

Add pervcpu_l3_pg to the arch_vcpu struct, to correspond to the
perdomain_l3_pg in the domain struct.  (We retain both so that we can
switch between per-domain and per-vCPU on a domain-by-domain basis.)

In {create,populate,destroy}_perdomain_mapping(), if d->arch.vcpu_pt,
use pervcpu_l3_pg as the per-domain L3 (allocating it for a vCPU if
it's NULL, just as we allocate for a domain in !vcpu_pt mode);
otherwise, use perdomain_l3_pg.  Introduce a helper, perdomain_l3(),
to consistently choose the correct one.

Introduce free_pervcpu_mappings() to free this tree, called from
arch_vcpu_destroy() on normal teardown.  Since the vcpu structure holds
the only reference to pervcpu_l3_pg, arch_vcpu_create() must also call
it on its error paths: nothing else records the allocation once the
vcpu struct is torn down.  The domain-wide free_perdomain_mappings() is
unchanged and keeps covering non-vCPU-PT domains.

Modify init_xen_l4_slots() to take a vCPU, and use perdomain_l3() to
select the value to install in slot 260.  Most callers have the
specific vCPU in hand (the HVM monitor tables, setup_compat_l4(), PV
shadow L4s).  Note that this includes dom0_construct(), since at that
point we're actually building vCPU 0, so passing in d->vcpu[0] is
exactly what we want.

In promote_l4_table() we pass in d->vcpu[0].  This is correct without
vCPU-PT, where every vCPU selects the same domain-wide L3.  With
vCPU-PT this is a temporary arrangement: the promoted L4 carries vCPU
0's L3 until the per-pCPU shadow L4 -- which supersedes promoted L4s
as what the CPU actually runs on -- arrives in the series (see
the SMP note below).  Since slot 260 is now keyed off d->vcpu[0],
promote_l4_table() refuses (-EINVAL) a domain that has no vCPUs yet,
as can happen if a toolstack pins page tables before creating vCPUs.

paravirt_ctxt_switch_to() now installs the XPTI root_pgt per-domain
slot only when the domain has a domain-wide perdomain area to install.
XPTI and vCPU-PT are mutually exclusive (xpti_init_default() disables
vCPU-PT if both are explicitly requested, and each defaults off when
the other is on) -- so the vCPU-PT slot stays empty, as
paravirt_ctxt_switch_from() left it.

vCPU-PT is not currently implemented for shadow paging.  L4 shadows
are currently per-domain objects shared by all vCPUs shadowing the
same guest root, just as non-ASI non-shadow PV L4s are.  Enabling
vCPU-PT for PV shadow guests would require adding vCPU-PT
functionality along all the shadow paths, which is outside the scope
of the current work.

This is guarded on every path that can turn shadow on for a PV domain:
paging_domctl() refuses shadow/log-dirty ops (xl save/migrate) for
such domains; dom0=shadow is ignored with a warning when dom0 uses
vCPU-PT; and shadow_one_bit_enable() refuses the mode with
-EOPNOTSUPP.

The PV L1TF mitigation cannot be refused up front: it acts at runtime,
when a guest installs a not-present PTE whose address is unsafe, by
forcing the domain into shadow mode -- which is what a vCPU-PT domain
cannot currently have.  No special handling is needed, though:
pv_l1tf_check_pte() refuses the PTE write and schedules the shadowing
tasklet as usual; the tasklet's shadow_one_bit_enable() call fails
with -EOPNOTSUPP like any other enable failure; and the tasklet's
existing error handling crashes the domain.  That is the right
disposition -- the entry being installed is precisely what the
mitigation exists to catch, so continuing unmitigated is not an option
-- and it matches what a build without CONFIG_SHADOW_PAGING does for
the same write, with a log trail showing the mitigation was attempted
and could not be enabled.  Hardware without the erratum is unaffected,
the mitigation being off there by default.

Note SMP vCPU-PT PV guests are not yet functional at this point in the
series: promoted guest L4s embed vCPU#0's L3 in slot 260 for all
vCPUs; the per-pCPU shadow L4 that gives each vCPU its own slot 260
arrives with the guest_root_pt and per-pCPU-L4 patches later in the
series.  HVM vCPU-PT guests are fully functional, SMP included:
monitor tables are already per-vCPU, so every HVM vCPU's root carries
its own L3 from creation.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- Added to the series

Changes since the previously posted version:
- Expand the commit message with the motivation and the design
  rationale.
- pv-l1tf: let the mitigation's shadowing request fail in
  shadow_one_bit_enable() and rely on the tasklet's existing failure
  handling to crash the domain, rather than special-casing vCPU-PT in
  pv_l1tf_check_pte() or forcing the mitigation off at boot (an
  earlier revision did the latter, silently withdrawing a protection
  that is on by default on affected hardware).
- Keep domain-wide freeing intact and introduce a vCPU-scoped
  free_pervcpu_mappings() instead of re-scoping
  free_perdomain_mappings(); fix the arch_vcpu_create() error-path
  leaks of a partially built per-vCPU hierarchy.
- Exclude PV shadow for vCPU-PT domains on all enable paths:
  refuse shadow/log-dirty paging_domctl() ops (gate
  moved here from the later per-pCPU-L4 patch so hazard and gate land
  together), ignore dom0=shadow with a warning, and refuse the mode
  (-EOPNOTSUPP) in shadow_one_bit_enable().
- Add a perdomain_l3() helper for the root selection, rather than
  open-coding the vcpu_pt choice (and testing both root pointers) at
  each site.
- Guard promote_l4_table() against vCPU-less domains.
- Install the XPTI root_pgt per-domain slot only when the domain has
  a perdomain L3; the posted version computed an L4E from the NULL
  pointer for vCPU-PT domains.  (A new preparatory patch pairs the
  slot's maintenance with a switch-out clear.)
- Do not log the refusal for XEN_DOMCTL_SHADOW_OP_OFF.  Turning paging
  off is the de-facto "make sure it is off" interface: the save path
  issues it unconditionally as best-effort cleanup and discards the
  result, so every save of a PV domain otherwise printed a hypervisor
  error for an operation nothing was asking to succeed.
---
 xen/arch/x86/domain.c             | 21 +++++---
 xen/arch/x86/include/asm/domain.h | 12 +++++
 xen/arch/x86/include/asm/mm.h     |  3 +-
 xen/arch/x86/mm.c                 | 87 +++++++++++++++++++++++--------
 xen/arch/x86/mm/hap/hap.c         |  2 +-
 xen/arch/x86/mm/paging.c          | 14 +++++
 xen/arch/x86/mm/shadow/common.c   | 11 ++++
 xen/arch/x86/mm/shadow/hvm.c      |  2 +-
 xen/arch/x86/mm/shadow/multi.c    |  2 +-
 xen/arch/x86/pv/dom0_build.c      |  8 ++-
 xen/arch/x86/pv/domain.c          |  2 +-
 11 files changed, 126 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 79555e6964..3e571272d8 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -513,7 +513,7 @@ int arch_vcpu_create(struct vcpu *v)
 
     rc = mapcache_vcpu_init(v);
     if ( rc )
-        return rc;
+        goto fail_early;
 
     if ( !is_idle_domain(d) )
     {
@@ -525,12 +525,12 @@ int arch_vcpu_create(struct vcpu *v)
          */
         rc = create_perdomain_mapping(v, PERDOMAIN_VIRT_START, 0, false);
         if ( rc )
-            return rc;
+            goto fail_early;
 
         paging_vcpu_init(v);
 
         if ( (rc = vcpu_init_fpu(v)) != 0 )
-            return rc;
+            goto fail_early;
 
         vmce_init_vcpu(v);
 
@@ -578,6 +578,8 @@ int arch_vcpu_create(struct vcpu *v)
     vcpu_destroy_fpu(v);
     xfree(v->arch.msrs);
     v->arch.msrs = NULL;
+ fail_early:
+    free_pervcpu_mappings(v);
 
     return rc;
 }
@@ -598,6 +600,8 @@ void arch_vcpu_destroy(struct vcpu *v)
         pv_vcpu_destroy(v);
     else
         ASSERT_UNREACHABLE();
+
+    free_pervcpu_mappings(v);
 }
 
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
@@ -2033,12 +2037,13 @@ void cf_check paravirt_ctxt_switch_to(struct vcpu *v)
     root_pgentry_t *root_pgt = this_cpu(root_pgt);
 
     /*
-     * If XPTI is active, install the incoming domain's per-domain area
-     * in the per-domain slot of the L4 we run on while in guest mode.
-     * The slot was cleared on the way out (see
-     * paravirt_ctxt_switch_from()).
+     * If XPTI is active and the domain has a domain-wide perdomain area,
+     * install it in the per-domain slot of the L4 we run on while in
+     * guest mode.  vCPU-PT domains have none (they don't use the XPTI
+     * machinery); their slot stays as paravirt_ctxt_switch_from() left
+     * it: empty.
      */
-    if ( root_pgt )
+    if ( root_pgt && v->domain->arch.perdomain_l3_pg )
         root_pgt[root_table_offset(PERDOMAIN_VIRT_START)] =
             l4e_from_page(v->domain->arch.perdomain_l3_pg,
                           __PAGE_HYPERVISOR_RW);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index fdf7b205ea..5c90d7627f 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -330,6 +330,11 @@ struct monitor_write_data {
 
 struct arch_domain
 {
+    /*
+     * Domain-wide L3 page-table for the L4 per-domain slot, used when
+     * the domain does not use per-vCPU page-tables (!d->arch.vcpu_pt).
+     * NULL otherwise (see v->arch.pervcpu_l3_pg and perdomain_l3()).
+     */
     struct page_info *perdomain_l3_pg;
 
     /* I/O-port admin-specified access capabilities. */
@@ -678,6 +683,13 @@ struct arch_vcpu
 
     struct vcpu_msrs *msrs;
 
+    /*
+     * Per-vCPU L3 page-table for the L4 per-domain slot, used when the
+     * domain uses per-vCPU page-tables (d->arch.vcpu_pt).  NULL
+     * otherwise (see d->arch.perdomain_l3_pg and perdomain_l3()).
+     */
+    struct page_info *pervcpu_l3_pg;
+
     struct {
         bool next_interrupt_enabled;
     } monitor;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 97924a639b..acb553df48 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -370,7 +370,7 @@ int devalidate_page(struct page_info *page, unsigned long type,
 
 void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt);
+                       const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt);
 bool fill_ro_mpt(mfn_t mfn);
 void zap_ro_mpt(mfn_t mfn);
 
@@ -608,6 +608,7 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
+void free_pervcpu_mappings(struct vcpu *v);
 
 void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 6dfd75475a..48266b1d27 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1638,20 +1638,32 @@ static int promote_l3_table(struct page_info *page)
 }
 #endif /* CONFIG_PV */
 
+/*
+ * The root of the per-domain area in use by @v: the vCPU's own L3 for a
+ * vCPU-PT domain, the domain-wide one otherwise.
+ */
+static struct page_info *perdomain_l3(const struct vcpu *v)
+{
+    const struct domain *d = v->domain;
+
+    return d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg : d->arch.perdomain_l3_pg;
+}
+
 /*
  * Fill an L4 with Xen entries.
  *
  * This function must write all ROOT_PAGETABLE_PV_XEN_SLOTS, to clobber any
  * values a guest may have left there from promote_l4_table().
  *
- * l4t, l4mfn, and d are mandatory, but l4mfn doesn't need to be the mfn under
+ * l4t, l4mfn, and v are mandatory, but l4mfn doesn't need to be the mfn under
  * *l4t.  All other parameters are optional and will either fill or zero the
  * appropriate slots.  Pagetables not shared with guests will gain the
  * extended directmap.
  */
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt)
+                       const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt)
 {
+    const struct domain *d = v->domain;
     /*
      * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
      * directmap.
@@ -1679,7 +1691,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
 
     /* Slot 260: Per-domain mappings. */
     l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
-        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
+        l4e_from_page(perdomain_l3(v), __PAGE_HYPERVISOR_RW);
 
     /* Slot 4: Per-domain mappings mirror. */
     BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
@@ -1755,11 +1767,17 @@ static int promote_l4_table(struct page_info *page)
 {
     struct domain *d = page_get_owner(page);
     mfn_t          l4mfn = page_to_mfn(page);
-    l4_pgentry_t  *pl4e = map_domain_page(l4mfn);
+    l4_pgentry_t  *pl4e;
     unsigned int   i;
     int            rc = 0;
     unsigned int   partial_flags = page->partial_flags;
 
+    /* init_xen_l4_slots() needs a vCPU to key the per-domain slot off. */
+    if ( unlikely(!d->vcpu || !d->vcpu[0]) )
+        return -EINVAL;
+
+    pl4e = map_domain_page(l4mfn);
+
     for ( i = page->nr_validated_ptes; i < L4_PAGETABLE_ENTRIES;
           i++, partial_flags = 0 )
     {
@@ -1834,8 +1852,15 @@ static int promote_l4_table(struct page_info *page)
 
     if ( !rc )
     {
+        /*
+         * Use vCPU#0 unconditionally.  When not running with ASI enabled the
+         * per-domain table is shared between all vCPUs, so it doesn't matter
+         * which vCPU gets passed to init_xen_l4_slots().  When running with
+         * ASI enabled this L4 will not be used, as a shadow per-vCPU L4 is
+         * used instead.
+         */
         init_xen_l4_slots(pl4e, l4mfn,
-                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
+                          d->vcpu[0], INVALID_MFN, VM_ASSIST(d, m2p_strict));
         atomic_inc(&d->arch.pv.nr_l4_pages);
     }
     unmap_domain_page(pl4e);
@@ -6238,7 +6263,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, bool populate)
 {
     struct domain *d = v->domain;
-    struct page_info *pg;
+    struct page_info *pg, *l3_pg = perdomain_l3(v);
     l3_pgentry_t *l3tab;
     l2_pgentry_t *l2tab;
     l1_pgentry_t *l1tab;
@@ -6247,14 +6272,17 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
     ASSERT(va >= PERDOMAIN_VIRT_START &&
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
 
-    if ( !d->arch.perdomain_l3_pg )
+    if ( !l3_pg )
     {
         pg = alloc_domheap_page(d, MEMF_no_owner);
         if ( !pg )
             return -ENOMEM;
         l3tab = __map_domain_page(pg);
         clear_page(l3tab);
-        d->arch.perdomain_l3_pg = pg;
+        if ( d->arch.vcpu_pt )
+            v->arch.pervcpu_l3_pg = pg;
+        else
+            d->arch.perdomain_l3_pg = pg;
         if ( !nr )
         {
             unmap_domain_page(l3tab);
@@ -6264,7 +6292,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
     else if ( !nr )
         return 0;
     else
-        l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+        l3tab = __map_domain_page(l3_pg);
 
     ASSERT(!l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
@@ -6359,7 +6387,7 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
     l1_pgentry_t *l1tab = NULL, *pl1e;
     const l3_pgentry_t *l3tab;
     const l2_pgentry_t *l2tab;
-    struct domain *d = v->domain;
+    struct page_info *l3_pg;
     unsigned long irq_flags;
 
     ASSERT(va >= PERDOMAIN_VIRT_START &&
@@ -6401,7 +6429,8 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
         return;
     }
 
-    BUG_ON(!d->arch.perdomain_l3_pg);
+    l3_pg = perdomain_l3(v);
+    BUG_ON(!l3_pg);
 
     /*
      * Slow path: walk v's per-domain page-table pages.  All mappings are
@@ -6413,7 +6442,7 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
      */
     local_irq_save(irq_flags);
 
-    l3tab = __map_domain_page_irqoff(d->arch.perdomain_l3_pg);
+    l3tab = __map_domain_page_irqoff(l3_pg);
 
     /*
      * Missing page-table structure is a hypervisor bug: there is no safe
@@ -6461,13 +6490,13 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr)
 {
     const l3_pgentry_t *l3tab, *pl3e;
-    const struct domain *d = v->domain;
+    struct page_info *l3_pg = perdomain_l3(v);
 
     ASSERT(va >= PERDOMAIN_VIRT_START &&
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
     ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
-    if ( !d->arch.perdomain_l3_pg )
+    if ( !l3_pg )
         return;
 
     if ( likely(this_cpu(pgtable_vcpu) == v) )
@@ -6490,7 +6519,7 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
         return;
     }
 
-    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+    l3tab = __map_domain_page(l3_pg);
     pl3e = l3tab + l3_table_offset(va);
 
     if ( l3e_get_flags(*pl3e) & _PAGE_PRESENT )
@@ -6529,16 +6558,11 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
     unmap_domain_page(l3tab);
 }
 
-void free_perdomain_mappings(struct domain *d)
+static void free_perdomain_l3(struct page_info *l3pg)
 {
-    l3_pgentry_t *l3tab;
+    l3_pgentry_t *l3tab = __map_domain_page(l3pg);
     unsigned int i;
 
-    if ( !d->arch.perdomain_l3_pg )
-        return;
-
-    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
-
     for ( i = 0; i < PERDOMAIN_SLOTS; ++i)
         if ( l3e_get_flags(l3tab[i]) & _PAGE_PRESENT )
         {
@@ -6571,10 +6595,27 @@ void free_perdomain_mappings(struct domain *d)
         }
 
     unmap_domain_page(l3tab);
-    free_domheap_page(d->arch.perdomain_l3_pg);
+    free_domheap_page(l3pg);
+}
+
+void free_perdomain_mappings(struct domain *d)
+{
+    if ( !d->arch.perdomain_l3_pg )
+        return;
+
+    free_perdomain_l3(d->arch.perdomain_l3_pg);
     d->arch.perdomain_l3_pg = NULL;
 }
 
+void free_pervcpu_mappings(struct vcpu *v)
+{
+    if ( !v->arch.pervcpu_l3_pg )
+        return;
+
+    free_perdomain_l3(v->arch.pervcpu_l3_pg);
+    v->arch.pervcpu_l3_pg = NULL;
+}
+
 static void write_sss_token(unsigned long *ptr)
 {
     /*
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 0ede4181a0..aba4f77df9 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -407,7 +407,7 @@ static mfn_t hap_make_monitor_table(struct vcpu *v)
     m4mfn = page_to_mfn(pg);
     l4e = map_domain_page(m4mfn);
 
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, v, INVALID_MFN, false);
     unmap_domain_page(l4e);
 
     return m4mfn;
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 14ab7defd8..ab68dfa415 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -675,6 +675,20 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
         return -EINVAL;
     }
 
+    if ( is_pv_domain(d) && d->arch.vcpu_pt )
+    {
+        /*
+         * Turning paging off is the de-facto "make sure it is off"
+         * interface: the save path issues it unconditionally as
+         * best-effort cleanup and discards the result, so logging an
+         * error for it is noise on every save of a PV domain.
+         */
+        if ( sc->op != XEN_DOMCTL_SHADOW_OP_OFF )
+            gprintk(XENLOG_ERR,
+                    "Paging not supported on PV domains with ASI\n");
+        return -EOPNOTSUPP;
+    }
+
     if ( resuming
          ? (d->arch.paging.preempt.dom != current->domain ||
             d->arch.paging.preempt.op != sc->op)
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index e30c6c49e1..b559db84b1 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2361,6 +2361,17 @@ static int shadow_one_bit_enable(struct domain *d, u32 mode)
         return -EINVAL;
     }
 
+    /*
+     * PV shadows embed the (per-vCPU) per-domain slot in L4 shadows shared
+     * by all vCPUs of the domain, so shadow modes are unavailable to
+     * domains using per-vCPU page-tables.  Toolstack requests are refused
+     * in paging_domctl(); the pv-l1tf tasklet can still request
+     * PG_SH_forced at runtime, and crashes the domain when this refusal
+     * reaches it.
+     */
+    if ( is_pv_domain(d) && d->arch.vcpu_pt )
+        return -EOPNOTSUPP;
+
     mode |= PG_SH_enable;
 
     if ( d->arch.paging.total_pages < sh_min_allocation(d) )
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index e6fb97c4b6..0b23326214 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -760,7 +760,7 @@ mfn_t sh_make_monitor_table(const struct vcpu *v, unsigned int shadow_levels)
      * shadow-linear mapping will either be inserted below when creating
      * lower level monitor tables, or later in sh_update_cr3().
      */
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, v, INVALID_MFN, false);
 
     if ( shadow_levels < 4 )
     {
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 1ae1091acd..5b7dbc12dc 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -974,7 +974,7 @@ sh_make_shadow(struct vcpu *v, mfn_t gmfn, u32 shadow_type)
 
             BUILD_BUG_ON(sizeof(l4_pgentry_t) != sizeof(shadow_l4e_t));
 
-            init_xen_l4_slots(l4t, gmfn, d, smfn, (!is_pv_32bit_domain(d) &&
+            init_xen_l4_slots(l4t, gmfn, v, smfn, (!is_pv_32bit_domain(d) &&
                                                    VM_ASSIST(d, m2p_strict)));
             unmap_domain_page(l4t);
         }
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index ddeb144b06..52139cffb3 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -726,7 +726,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
         l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
         clear_page(l4tab);
         init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
-                          d, INVALID_MFN, true);
+                          d->vcpu[0], INVALID_MFN, true);
         v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
     }
     else
@@ -1048,7 +1048,11 @@ static int __init dom0_construct(const struct boot_domain *bd)
     }
 
     /* Activate shadow mode, if requested.  Reuse the pv_l1tf tasklet. */
-    if ( opt_dom0_shadow )
+    if ( opt_dom0_shadow && d->arch.vcpu_pt )
+        /* Shadow paging is incompatible with per-vCPU page-tables (ASI). */
+        printk(XENLOG_WARNING
+               "Ignoring dom0=shadow: incompatible with per-vCPU page-tables\n");
+    else if ( opt_dom0_shadow )
     {
         printk("Switching dom0 to using shadow paging\n");
         tasklet_schedule(&d->arch.paging.shadow.pv_l1tf_tasklet);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 50f2d1284a..b1d57083f2 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -127,7 +127,7 @@ static int setup_compat_l4(struct vcpu *v)
     mfn = page_to_mfn(pg);
     l4tab = map_domain_page(mfn);
     clear_page(l4tab);
-    init_xen_l4_slots(l4tab, mfn, v->domain, INVALID_MFN, false);
+    init_xen_l4_slots(l4tab, mfn, v, INVALID_MFN, false);
     unmap_domain_page(l4tab);
 
     /* This page needs to look like a pagetable so that it can be shadowed */
-- 
2.55.0


