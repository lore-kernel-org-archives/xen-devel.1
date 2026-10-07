Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861EDCA600D
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:41:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442107.1659687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP5C-0007fN-1N; Wed, 07 Oct 2026 10:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442107.1659687; Wed, 07 Oct 2026 10:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP5B-0007fA-Rz; Wed, 07 Oct 2026 10:41:09 +0000
Received: by outflank-mailman (input) for mailman id 1442107;
 Wed, 07 Oct 2026 10:41:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEP5A-0007aX-Vk
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:41:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP59-001biv-08;
 Wed, 07 Oct 2026 10:41:07 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP58-001QnT-2a;
 Wed, 07 Oct 2026 10:41:07 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=dxYHMPntQ+4kmk+nNJUY+2zkq3fsoiDnWTQiSZvrAmg=; b=sEIS1rJ1iqPopni0BxJAmvyFTL
	A66gDejbvn7BMqOQPgpPVcmtcSnkq2RP9hnvkeIP1Yh79ZDNDeiaOe9QGRsan3grlAGnCNGW4kOjJ
	Py3/gcQS5h7kt0B1phthmC7HKQ3+0aqZ1kfeOLuV1o0mz84nt5SeM8kPBhrgjf98RlFw=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v3 07/18] x86/hvm: introduce per-vCPU L3 page-table
Date: Wed,  7 Oct 2026 11:40:40 +0100
Message-ID: <20261007104051.48841-8-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

The per-domain area is currently a single domain-wide structure: one L3,
referenced from every root page-table associated with the domain, so
every mapping in it is visible to every vCPU of the domain.  Its
contents are already laid out in per-vCPU slices (each vCPU's
COMPAT_ARG_XLAT pages, and for PV each vCPU's GDT/LDT window and
mapcache entries), but the visibility is domain-wide.  Meanwhile, much
of the per-vCPU state Xen maintains -- the VMCB, the VMX MSR load/save
areas, FPU/XSAVE state -- lives in always-mapped memory.

Allow the "per-domain" area to be per-vCPU instead ("VCPU-PT") for HVM
domains.  HVM monitor tables are already per-vCPU, so this needs nothing
at context switch: every monitor table carries its vCPU's own L3 from
creation, and the per-vCPU mappings are isolated from other running
vCPUs at once.  We will later build on this, adding a per-vCPU mapcache
and per-vCPU mapped areas, into which we can move the vCPU state
mentioned above.

Add pervcpu_l3_pg to the arch_vcpu struct, to correspond to the
perdomain_l3_pg in the domain struct.  (We retain both so that we can
switch between per-domain and per-vCPU on a domain-by-domain basis; PV
domains always use the domain-wide one.)

In {create,destroy}_perdomain_mapping(), if d->arch.vcpu_pt, use
pervcpu_l3_pg as the per-domain L3 (allocating it for a vCPU if it's
NULL, just as we allocate for a domain in !vcpu_pt mode); otherwise,
use perdomain_l3_pg.  Introduce a helper, perdomain_l3(), to
consistently choose the correct one.

Introduce free_pervcpu_mappings() to free this tree, called from
arch_vcpu_destroy() on normal teardown.  Since the vcpu structure holds
the only reference to pervcpu_l3_pg, arch_vcpu_create() must also call
it on its error paths: nothing else records the allocation once the
vcpu struct is torn down.  The domain-wide free_perdomain_mappings() is
unchanged and keeps covering non-vCPU-PT domains.

Give init_xen_l4_slots() the vCPU a table is private to, and use
perdomain_l3() to select the value to install in slot 260 when one is
given.  The HVM monitor tables and the 32-bit PV Xen-owned L4s pass
their vCPU; tables the domain's vCPUs share -- promoted PV guest L4s,
PV shadow L4s, and the PV dom0 L4 under construction -- pass NULL and
keep the domain-wide L3, which is all a PV domain has.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-fable-5-1, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- HVM only: PV domains keep the domain-wide area, so the PV parts go
  (the single-vCPU limit, the shadow refusals, the XPTI slot install).
  init_xen_l4_slots() takes the vCPU as an extra, optional argument
  rather than in place of the domain, so PV guest L4s, which no vCPU
  owns, are promoted exactly as before.
- Retitle (was: "x86/mm: introduce per-vCPU L3 page-table").
- free_compat_arg_xlat()'s comment names free_pervcpu_mappings() as the
  teardown for a vCPU-PT domain.

Changes in v2:
- Added to the series

Changes since the previously posted version:
- Expand the commit message with the motivation and the design
  rationale.
- Keep domain-wide freeing intact and introduce a vCPU-scoped
  free_pervcpu_mappings() instead of re-scoping
  free_perdomain_mappings(); fix the arch_vcpu_create() error-path
  leaks of a partially built per-vCPU hierarchy.
- Add a perdomain_l3() helper for the root selection, rather than
  open-coding the vcpu_pt choice (and testing both root pointers) at
  each site.
---
 xen/arch/x86/domain.c             | 10 +++--
 xen/arch/x86/include/asm/domain.h | 12 +++++
 xen/arch/x86/include/asm/mm.h     |  5 ++-
 xen/arch/x86/mm.c                 | 73 ++++++++++++++++++++++---------
 xen/arch/x86/mm/hap/hap.c         |  2 +-
 xen/arch/x86/mm/shadow/hvm.c      |  2 +-
 xen/arch/x86/mm/shadow/multi.c    |  5 ++-
 xen/arch/x86/pv/dom0_build.c      |  2 +-
 xen/arch/x86/pv/domain.c          |  2 +-
 xen/arch/x86/x86_64/mm.c          |  7 +--
 10 files changed, 87 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b670cea52b..0aba2cca2e 100644
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
         rc = create_perdomain_mapping(v, PERDOMAIN_VIRT_START, 0, NULL, NULL);
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
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b192c86bc1..a6c6eaf53a 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -335,6 +335,11 @@ struct monitor_write_data {
 
 struct arch_domain
 {
+    /*
+     * Domain-wide L3 page-table for the L4 per-domain slot, used when
+     * the domain does not use per-vCPU page-tables (!d->arch.vcpu_pt).
+     * NULL otherwise (see v->arch.pervcpu_l3_pg and perdomain_l3()).
+     */
     struct page_info *perdomain_l3_pg;
 
     /* I/O-port admin-specified access capabilities. */
@@ -691,6 +696,13 @@ struct arch_vcpu
 
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
index 87bbe1a6f5..87131dd4bf 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -369,8 +369,10 @@ int devalidate_page(struct page_info *page, unsigned long type,
                          int preemptible);
 
 void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
+struct page_info *perdomain_l3(const struct vcpu *v);
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt);
+                       const struct domain *d, const struct vcpu *v,
+                       mfn_t sl4mfn, bool ro_mpt);
 bool fill_ro_mpt(mfn_t mfn);
 void zap_ro_mpt(mfn_t mfn);
 
@@ -609,6 +611,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
+void free_pervcpu_mappings(struct vcpu *v);
 
 void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index ca22107cd3..7258935528 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1638,6 +1638,17 @@ static int promote_l3_table(struct page_info *page)
 }
 #endif /* CONFIG_PV */
 
+/*
+ * The root of the per-domain area in use by @v: the vCPU's own L3 for a
+ * vCPU-PT domain, the domain-wide one otherwise.
+ */
+struct page_info *perdomain_l3(const struct vcpu *v)
+{
+    const struct domain *d = v->domain;
+
+    return d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg : d->arch.perdomain_l3_pg;
+}
+
 /*
  * Fill an L4 with Xen entries.
  *
@@ -1645,12 +1656,16 @@ static int promote_l3_table(struct page_info *page)
  * values a guest may have left there from promote_l4_table().
  *
  * l4t, l4mfn, and d are mandatory, but l4mfn doesn't need to be the mfn under
- * *l4t.  All other parameters are optional and will either fill or zero the
- * appropriate slots.  Pagetables not shared with guests will gain the
+ * *l4t.  v names the vCPU the table is private to (an HVM monitor table, a
+ * 32-bit PV vCPU's Xen-owned L4), or is NULL for tables the domain's vCPUs
+ * share; it is mandatory for a vCPU-PT domain, whose per-domain area is
+ * per-vCPU.  All other parameters are optional and will either fill or zero
+ * the appropriate slots.  Pagetables not shared with guests will gain the
  * extended directmap.
  */
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt)
+                       const struct domain *d, const struct vcpu *v,
+                       mfn_t sl4mfn, bool ro_mpt)
 {
     /*
      * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
@@ -1678,8 +1693,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
         l4e_from_mfn(sl4mfn, __PAGE_HYPERVISOR_RW);
 
     /* Slot 260: Per-domain mappings. */
+    ASSERT(!v || v->domain == d);
+    ASSERT(v || !d->arch.vcpu_pt);
     l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
-        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
+        l4e_from_page(v ? perdomain_l3(v) : d->arch.perdomain_l3_pg,
+                      __PAGE_HYPERVISOR_RW);
 
     /* Slot 4: Per-domain mappings mirror. */
     BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
@@ -1835,7 +1853,7 @@ static int promote_l4_table(struct page_info *page)
     if ( !rc )
     {
         init_xen_l4_slots(pl4e, l4mfn,
-                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
+                          d, NULL, INVALID_MFN, VM_ASSIST(d, m2p_strict));
         atomic_inc(&d->arch.pv.nr_l4_pages);
     }
     unmap_domain_page(pl4e);
@@ -6216,7 +6234,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              struct page_info **ppg)
 {
     struct domain *d = v->domain;
-    struct page_info *pg;
+    struct page_info *pg, *l3_pg = perdomain_l3(v);
     l3_pgentry_t *l3tab;
     l2_pgentry_t *l2tab;
     l1_pgentry_t *l1tab;
@@ -6225,14 +6243,17 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
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
@@ -6242,7 +6263,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
     else if ( !nr )
         return 0;
     else
-        l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+        l3tab = __map_domain_page(l3_pg);
 
     ASSERT(!l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
@@ -6339,16 +6360,16 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
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
 
-    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+    l3tab = __map_domain_page(l3_pg);
     pl3e = l3tab + l3_table_offset(va);
 
     if ( l3e_get_flags(*pl3e) & _PAGE_PRESENT )
@@ -6387,16 +6408,11 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
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
@@ -6432,10 +6448,27 @@ void free_perdomain_mappings(struct domain *d)
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
index 0ede4181a0..9fc59f0702 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -407,7 +407,7 @@ static mfn_t hap_make_monitor_table(struct vcpu *v)
     m4mfn = page_to_mfn(pg);
     l4e = map_domain_page(m4mfn);
 
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, d, v, INVALID_MFN, false);
     unmap_domain_page(l4e);
 
     return m4mfn;
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index e6fb97c4b6..833e378e30 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -760,7 +760,7 @@ mfn_t sh_make_monitor_table(const struct vcpu *v, unsigned int shadow_levels)
      * shadow-linear mapping will either be inserted below when creating
      * lower level monitor tables, or later in sh_update_cr3().
      */
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, d, v, INVALID_MFN, false);
 
     if ( shadow_levels < 4 )
     {
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 7f72b4b7b2..b2017c1010 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -974,8 +974,9 @@ sh_make_shadow(struct vcpu *v, mfn_t gmfn, u32 shadow_type)
 
             BUILD_BUG_ON(sizeof(l4_pgentry_t) != sizeof(shadow_l4e_t));
 
-            init_xen_l4_slots(l4t, gmfn, d, smfn, (!is_pv_32bit_domain(d) &&
-                                                   VM_ASSIST(d, m2p_strict)));
+            init_xen_l4_slots(l4t, gmfn, d, NULL, smfn,
+                              (!is_pv_32bit_domain(d) &&
+                               VM_ASSIST(d, m2p_strict)));
             unmap_domain_page(l4t);
         }
         break;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index ddeb144b06..bf980eba8c 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -726,7 +726,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
         l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
         clear_page(l4tab);
         init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
-                          d, INVALID_MFN, true);
+                          d, NULL, INVALID_MFN, true);
         v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
     }
     else
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 9877771cd4..c1611fdcff 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -127,7 +127,7 @@ static int setup_compat_l4(struct vcpu *v)
     mfn = page_to_mfn(pg);
     l4tab = map_domain_page(mfn);
     clear_page(l4tab);
-    init_xen_l4_slots(l4tab, mfn, v->domain, INVALID_MFN, false);
+    init_xen_l4_slots(l4tab, mfn, v->domain, v, INVALID_MFN, false);
     unmap_domain_page(l4tab);
 
     /* This page needs to look like a pagetable so that it can be shadowed */
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 0f9e0469ef..baee0a9cfe 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -738,9 +738,10 @@ int setup_compat_arg_xlat(struct vcpu *v)
 }
 
 /*
- * Besides vCPU teardown, which free_perdomain_mappings() would cover, this
- * serves switch_compat()'s undo path: the domain lives on as a 64-bit one
- * there, so the translation area has to go right away.
+ * Besides vCPU teardown, which the per-domain area's own teardown would
+ * cover (free_perdomain_mappings(), or free_pervcpu_mappings() for a
+ * vCPU-PT domain), this serves switch_compat()'s undo path: the domain lives
+ * on as a 64-bit one there, so the translation area has to go right away.
  */
 void free_compat_arg_xlat(struct vcpu *v)
 {
-- 
2.55.0


