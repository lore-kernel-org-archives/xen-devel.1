Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A57606A31D
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=LEkmzKEb
Received: from list by lists.xenproject.org with outflank-mailman.1463719.1674537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCjH-0004Ip-Sh; Wed, 28 Oct 2026 23:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463719.1674537; Wed, 28 Oct 2026 23:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCjH-0004I1-OV; Wed, 28 Oct 2026 23:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1463719;
 Wed, 28 Oct 2026 23:06:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMCjG-0003so-3q
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:06:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjG-00000000ozt-0Kas;
 Wed, 28 Oct 2026 23:06:45 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjF-00000001KpM-2k5o;
 Wed, 28 Oct 2026 23:06:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=8H0V8RA4Wa1e0SSpnxuGjwXcA2NpA35aSMRyM//0g9w=; b=LEkmzKEb8grjFBVa8Av8slbbtX
	90D0ME/bQPlsBSEcif7UmL2vdCiA34p9wuRRXt0Dphen5sg1ULFa0pgkvJmiM0ZWSGvmAWevS4ri9
	F7xVwdYqowjmsyqBF9wEaRJ76+ZizQTqEmVrGtnNw8/h0BZnbQnOTSdFWASbNHrf3a08=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 09/45] x86/hvm: introduce per-vCPU L3 page-table
Date: Wed, 28 Oct 2026 23:05:23 +0000
Message-ID: <20261028-asi-hvm-v5-9-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roger Pau Monné <roger.pau@citrix.com>

Currently all of a domain's vCPUs share its per-domain area: one L3,
referenced from every root page-table associated with the domain, so
every mapping in it is visible to every vCPU of the domain.  Much of the
area is already laid out in per-vCPU slices (each vCPU's COMPAT_ARG_XLAT
pages, and for PV each vCPU's GDT/LDT window), but the visibility is
domain-wide.  Meanwhile, much of the per-vCPU state Xen maintains -- the
VMCB, the VMX MSR load/save areas, FPU/XSAVE state -- lives in
always-mapped memory.

For HVM domains, allow each vCPU a per-domain area of its own instead
("vCPU-PT").  HVM monitor tables are already per-vCPU, so this needs
nothing at context switch: every monitor table carries its vCPU's own L3
from creation, and the per-vCPU mappings are isolated from other running
vCPUs at once.  We will later build on this, adding a per-vCPU mapcache
and a per-vCPU state window, into which we can move the vCPU state
mentioned above.

Add pervcpu_l3_pg to the arch_vcpu struct, to correspond to the
perdomain_l3_pg in the domain struct.  (We retain both so that
vCPU-PT can be chosen domain by domain; PV domains always use the
domain-wide L3.)

In {create,destroy}_perdomain_mapping(), if d->arch.asi.vcpu_pt, use
pervcpu_l3_pg as the per-domain L3 (allocating it for a vCPU if it's
NULL, just as we allocate for a domain in !vcpu_pt mode); otherwise,
use perdomain_l3_pg.  Introduce a helper, perdomain_l3(), to
consistently choose the correct one.

Introduce free_pervcpu_mappings() to free this tree, called from
arch_vcpu_destroy() on normal teardown.  Since the vcpu structure holds
the only reference to pervcpu_l3_pg, arch_vcpu_create() must also call
it on its error paths: nothing else records the allocation once the
vcpu struct is torn down.  The domain-wide free_perdomain_mappings()
keeps covering non-vCPU-PT domains.

init_xen_l4_slots() is given the vCPU that a table is private to or,
for a table that the domain's vCPUs share, any of them.  Have it
install that vCPU's perdomain_l3() in slot 260: the tables that a
domain's vCPUs share are PV ones, and a PV domain's vCPUs all use the
domain-wide L3.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-fable-5-1, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- init_xen_l4_slots()'s BUG_ON() follows slot 260 to perdomain_l3().
- Message: all of a domain's vCPUs share its per-domain area; the
  mapcache is not among the per-vCPU slices; the mode is "vCPU-PT".
  The comment above init_xen_l4_slots() names perdomain_l3(v) and the
  domain-wide L3.

Changes in v4:
- Rebase over earlier changes
- d->arch.vcpu_pt is now d->arch.asi.vcpu_pt.
- init_xen_l4_slots() taking a vCPU in place of the domain, and
  promote_l4_table() failing while the domain has none, are now patches
  of their own (Roger, Jan).
- Drop the fail_early label: every cleanup step after fail: is safe
  before its setup has run (Roger).
- free_pervcpu_mappings(): clear the pointer, then free, as XFREE()
  does (Roger).
- Likewise in free_perdomain_mappings().

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
 xen/arch/x86/domain.c             |  9 ++--
 xen/arch/x86/include/asm/domain.h |  4 ++
 xen/arch/x86/include/asm/mm.h     |  2 +
 xen/arch/x86/mm.c                 | 68 +++++++++++++++++++++++--------
 4 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 94a1ea904a..7a4da203d4 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -513,7 +513,7 @@ int arch_vcpu_create(struct vcpu *v)
 
     rc = mapcache_vcpu_init(v);
     if ( rc )
-        return rc;
+        goto fail;
 
     if ( !is_idle_domain(d) )
     {
@@ -523,12 +523,12 @@ int arch_vcpu_create(struct vcpu *v)
          */
         rc = create_perdomain_mapping(v, PERDOMAIN_VIRT_START, 0, NULL, NULL);
         if ( rc )
-            return rc;
+            goto fail;
 
         paging_vcpu_init(v);
 
         if ( (rc = vcpu_init_fpu(v)) != 0 )
-            return rc;
+            goto fail;
 
         vmce_init_vcpu(v);
 
@@ -576,6 +576,7 @@ int arch_vcpu_create(struct vcpu *v)
     vcpu_destroy_fpu(v);
     xfree(v->arch.msrs);
     v->arch.msrs = NULL;
+    free_pervcpu_mappings(v);
 
     return rc;
 }
@@ -596,6 +597,8 @@ void arch_vcpu_destroy(struct vcpu *v)
         pv_vcpu_destroy(v);
     else
         ASSERT_UNREACHABLE();
+
+    free_pervcpu_mappings(v);
 }
 
 int arch_sanitise_domain_config(const struct xen_domctl_createdomain *config)
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 12f79feb42..4140a92f15 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -332,6 +332,7 @@ struct monitor_write_data {
 
 struct arch_domain
 {
+    /* Domain-wide L3 for the per-domain slot; NULL in a vCPU-PT domain. */
     struct page_info *perdomain_l3_pg;
 
     /* I/O-port admin-specified access capabilities. */
@@ -688,6 +689,9 @@ struct arch_vcpu
 
     struct vcpu_msrs *msrs;
 
+    /* Per-vCPU L3 for the per-domain slot; NULL in a non-vCPU-PT domain. */
+    struct page_info *pervcpu_l3_pg;
+
     struct {
         bool next_interrupt_enabled;
     } monitor;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index de45a111f3..12d1c06c12 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -369,6 +369,7 @@ int devalidate_page(struct page_info *page, unsigned long type,
                          int preemptible);
 
 void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
+struct page_info *perdomain_l3(const struct vcpu *v);
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
                        const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt);
 bool fill_ro_mpt(mfn_t mfn);
@@ -612,6 +613,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
+void free_pervcpu_mappings(struct vcpu *v);
 
 void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index f2122a68ce..6e3b1c4c7d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1681,6 +1681,18 @@ static int promote_l3_table(struct page_info *page)
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
+    return d->arch.asi.vcpu_pt ? v->arch.pervcpu_l3_pg
+                               : d->arch.perdomain_l3_pg;
+}
+
 /*
  * Fill an L4 with Xen entries.
  *
@@ -1693,7 +1705,8 @@ static int promote_l3_table(struct page_info *page)
  * extended directmap.
  *
  * v is the vCPU the table is private to or, for a table the domain's vCPUs
- * share, any of them.
+ * share, any of them: slot 260 gets perdomain_l3(v), which in a domain
+ * whose vCPUs share tables (PV) is the domain-wide L3.
  */
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
                        const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt)
@@ -1725,9 +1738,9 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
         l4e_from_mfn(sl4mfn, __PAGE_HYPERVISOR_RW);
 
     /* Slot 260: Per-domain mappings. */
-    BUG_ON(!d->arch.perdomain_l3_pg);
+    BUG_ON(!perdomain_l3(v));
     l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
-        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
+        l4e_from_page(perdomain_l3(v), __PAGE_HYPERVISOR_RW);
 
     /* Slot 4: Per-domain mappings mirror. */
     BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
@@ -6250,7 +6263,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              struct page_info **ppg)
 {
     struct domain *d = v->domain;
-    struct page_info *pg;
+    struct page_info *pg, *l3_pg = perdomain_l3(v);
     l3_pgentry_t *l3tab;
     l2_pgentry_t *l2tab;
     l1_pgentry_t *l1tab;
@@ -6259,14 +6272,17 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
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
+        if ( d->arch.asi.vcpu_pt )
+            v->arch.pervcpu_l3_pg = pg;
+        else
+            d->arch.perdomain_l3_pg = pg;
         if ( !nr )
         {
             unmap_domain_page(l3tab);
@@ -6276,7 +6292,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
     else if ( !nr )
         return 0;
     else
-        l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+        l3tab = __map_domain_page(l3_pg);
 
     ASSERT(!l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
@@ -6373,16 +6389,16 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
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
@@ -6421,16 +6437,11 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
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
@@ -6466,8 +6477,29 @@ void free_perdomain_mappings(struct domain *d)
         }
 
     unmap_domain_page(l3tab);
-    free_domheap_page(d->arch.perdomain_l3_pg);
+    free_domheap_page(l3pg);
+}
+
+void free_perdomain_mappings(struct domain *d)
+{
+    struct page_info *l3pg = d->arch.perdomain_l3_pg;
+
+    if ( !l3pg )
+        return;
+
     d->arch.perdomain_l3_pg = NULL;
+    free_perdomain_l3(l3pg);
+}
+
+void free_pervcpu_mappings(struct vcpu *v)
+{
+    struct page_info *l3pg = v->arch.pervcpu_l3_pg;
+
+    if ( !l3pg )
+        return;
+
+    v->arch.pervcpu_l3_pg = NULL;
+    free_perdomain_l3(l3pg);
 }
 
 static void write_sss_token(unsigned long *ptr)
-- 
2.56.0


