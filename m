Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6BB606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=xUcokWrc
Received: from list by lists.xenproject.org with outflank-mailman.1497116.1695423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i3-0001sR-9O; Thu, 19 Nov 2026 21:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497116.1695423; Thu, 19 Nov 2026 21:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i2-0001pf-MC; Thu, 19 Nov 2026 21:30:22 +0000
Received: by outflank-mailman (input) for mailman id 1497116;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001CK-5k
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tGt-2y6e;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mb-0000000CVBH-0TiD;
 Thu, 19 Nov 2026 21:08:13 +0000
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
	bh=nrwbDtXKt+31nm2TnyNnVLPFupNYjy9rQsu/1DwGk0k=; b=xUcokWrc00QBw7bsoOGB48jGEL
	S18+JUhfg5CkJGxSPSxsajTK02iJPTuyH3BkxwlON9sV6FfmP5BTc8N/YDYUeyu05eDfq9oZdZJrc
	y4AHJrnIv3zSXA5ykqwagy6qx3MyNgegQ/Oa8ZQT4+oUjzjz6vJu6YOaOHKmHo5ciVAc=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 25/50] x86/hvm: introduce per-vCPU L3 page-table
Date: Thu, 19 Nov 2026 21:07:16 +0000
Message-ID: <20261119-asi-hvm-v7-25-6551b6d5c879@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
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
pages, its state window and its map_domain_pages() slots, and for PV
each vCPU's GDT/LDT window), but the visibility is domain-wide.  The
per-vCPU state Xen keeps behind the state window -- the VMCB, the VMX
guest MSR load/save list, the register frame, FPU/XSAVE state -- is
therefore mapped in the page-tables of every vCPU of the domain, not
only in its owner's.

For HVM domains, allow each vCPU a per-domain area of its own instead
("vCPU-PT").  HVM monitor tables are already per-vCPU, so this needs
nothing at context switch: every monitor table carries its vCPU's own L3
from creation, and the per-vCPU mappings, the state window's included,
are isolated from other running vCPUs at once.  We will later build on
this, adding a per-vCPU mapcache.

Add pervcpu_l3_pg to the arch_vcpu struct, to correspond to the
perdomain_l3_pg in the domain struct.  (We retain both so that vCPU-PT
can be chosen domain by domain; PV domains always use the domain-wide
L3.)  Modify arch_domain_create() to only allocate a per-domain L3 if
vcpu_pt is not enabled for the domain; modify arch_vcpu_create() to
allocate a per-vCPU L3 if it is.

In {create,populate,destroy}_perdomain_mapping(), if
d->arch.asi.vcpu_pt, use pervcpu_l3_pg as the per-domain L3; otherwise,
use perdomain_l3_pg.
Introduce a helper, perdomain_l3(), to consistently choose the correct
one.

Introduce free_pervcpu_mappings() to free this tree, called from
arch_vcpu_destroy() on normal teardown.  Since the vcpu structure holds
the only reference to pervcpu_l3_pg, arch_vcpu_create() must also call
it on its error paths: nothing else records the allocation once the
vcpu struct is torn down.  The domain-wide free_perdomain_mappings()
keeps covering non-vCPU-PT domains.

init_xen_l4_slots() is given the vCPU that a table is private to.
Have it install that vCPU's perdomain_l3() in slot 260.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-fable-5-1, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v7:
- Rebased over the vCPU state window, which now comes earlier in the
  series: populate_perdomain_mapping() takes its L3 from perdomain_l3()
  too, the comments of unmap_vcpu_state() say what per-vCPU page-tables
  change, and the message no longer promises the window.

Changes in v6:
- Port to new explicit L3 allocation regime.

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
 xen/arch/x86/domain.c             | 17 +++++--
 xen/arch/x86/include/asm/domain.h |  4 ++
 xen/arch/x86/include/asm/mm.h     |  2 +
 xen/arch/x86/mm.c                 | 73 +++++++++++++++++++++++--------
 4 files changed, 74 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 6e33d56588..1df6763530 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -576,9 +576,16 @@ int arch_vcpu_create(struct vcpu *v)
 
     v->arch.flags = TF_kernel_mode;
 
+    if ( d->arch.asi.vcpu_pt &&
+         (v->arch.pervcpu_l3_pg = allocate_perdomain_l3(d)) == NULL )
+    {
+        rc = -ENOMEM;
+        goto fail;
+    }
+
     rc = mapcache_vcpu_init(v);
     if ( rc )
-        return rc;
+        goto fail;
 
     if ( !is_idle_domain(d) )
     {
@@ -601,7 +608,7 @@ int arch_vcpu_create(struct vcpu *v)
         paging_vcpu_init(v);
 
         if ( (rc = vcpu_init_fpu(v)) != 0 )
-            return rc;
+            goto fail;
 
         vmce_init_vcpu(v);
 
@@ -654,6 +661,7 @@ int arch_vcpu_create(struct vcpu *v)
     vcpu_regs_free(v);
     xfree(v->arch.msrs);
     v->arch.msrs = NULL;
+    free_pervcpu_mappings(v);
 
     return rc;
 }
@@ -676,6 +684,8 @@ void arch_vcpu_destroy(struct vcpu *v)
         ASSERT_UNREACHABLE();
 
     vcpu_regs_free(v);
+
+    free_pervcpu_mappings(v);
 }
 
 int arch_sanitise_domain_config(const struct xen_domctl_createdomain *config)
@@ -989,7 +999,8 @@ int arch_domain_create(struct domain *d,
 
     psr_domain_init(d);
 
-    if ( (d->arch.perdomain_l3_pg = allocate_perdomain_l3(d)) == NULL )
+    if ( !d->arch.asi.vcpu_pt &&
+         (d->arch.perdomain_l3_pg = allocate_perdomain_l3(d)) == NULL )
     {
         rc = -ENOMEM;
         goto fail;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 0ec0db0b91..17903d62cb 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -329,6 +329,7 @@ struct monitor_write_data {
 
 struct arch_domain
 {
+    /* Domain-wide L3 for the per-domain slot; NULL in a vCPU-PT domain. */
     struct page_info *perdomain_l3_pg;
 
     /* I/O-port admin-specified access capabilities. */
@@ -701,6 +702,9 @@ struct arch_vcpu
     /* Which of the vCPU's map_domain_pages() slots are in use. */
     unsigned long multipage_inuse;
 
+    /* Per-vCPU L3 for the per-domain slot; NULL in a non-vCPU-PT domain. */
+    struct page_info *pervcpu_l3_pg;
+
     struct {
         bool next_interrupt_enabled;
     } monitor;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 3fa70e420b..c66969c093 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -369,6 +369,7 @@ int devalidate_page(struct page_info *page, unsigned long type,
                          int preemptible);
 
 void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
+struct page_info *perdomain_l3(const struct vcpu *v);
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
                        const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt);
 void init_xen_l4_slots_pv(l4_pgentry_t *l4t, mfn_t l4mfn,
@@ -620,6 +621,7 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
 void unmap_vcpu_state(const struct vcpu *v, unsigned int idx, unsigned int nr);
 void unmap_vcpu_state_page(const void *va);
 void free_perdomain_mappings(struct domain *d);
+void free_pervcpu_mappings(struct vcpu *v);
 
 void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 446732911b..d1fc57cf82 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1685,6 +1685,18 @@ static int promote_l3_table(struct page_info *page)
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
@@ -1783,8 +1795,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
                        const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt)
 {
     const struct domain *d = v->domain;
+    struct page_info *l3_pg = perdomain_l3(v);
 
-    _init_xen_l4_slots(l4t, l4mfn, d, d->arch.perdomain_l3_pg, sl4mfn, ro_mpt);
+    BUG_ON(!l3_pg);
+
+    _init_xen_l4_slots(l4t, l4mfn, d, l3_pg, sl4mfn, ro_mpt);
 }
 
 /*
@@ -6275,7 +6290,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              struct page_info **ppg)
 {
     struct domain *d = v->domain;
-    struct page_info *pg;
+    struct page_info *pg, *l3_pg = perdomain_l3(v);
     l3_pgentry_t *l3tab;
     l2_pgentry_t *l2tab;
     l1_pgentry_t *l1tab;
@@ -6284,12 +6299,12 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
     ASSERT(va >= PERDOMAIN_VIRT_START &&
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
 
-    BUG_ON(!d->arch.perdomain_l3_pg);
+    BUG_ON(!l3_pg);
 
     if ( !nr )
         return 0;
 
-    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+    l3tab = __map_domain_page(l3_pg);
 
     ASSERT(!l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
@@ -6396,7 +6411,7 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 const mfn_t *mfn, unsigned int nr,
                                 unsigned int flags)
 {
-    struct page_info *l3_pg = v->domain->arch.perdomain_l3_pg;
+    struct page_info *l3_pg = perdomain_l3(v);
     const l3_pgentry_t *l3tab;
     const l2_pgentry_t *l2tab;
     l1_pgentry_t *l1tab = NULL;
@@ -6448,16 +6463,16 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
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
@@ -6500,14 +6515,18 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
  * Take @nr slots of @v's state window, from @idx, out of the per-domain
  * area, before the caller frees the pages behind them: the pages are the
  * caller's own, and must not stay mapped once freed.  The window's
- * translations are usable only on CPUs whose page-tables carry it: those of
- * any of the domain's vCPUs, all in the domain's dirty mask.
+ * translations are usable only on CPUs whose page-tables carry it, all in
+ * the domain's dirty mask: with per-vCPU page-tables, the CPU running v or
+ * holding it lazily; otherwise, those of any of the domain's vCPUs.
  */
 void unmap_vcpu_state(const struct vcpu *v, unsigned int idx, unsigned int nr)
 {
     const struct domain *d = v->domain;
 
-    /* Beyond the stride is the next vCPU's window. */
+    /*
+     * Beyond the stride is the next vCPU's window, where the domain's vCPUs
+     * share a per-domain area.
+     */
     BUG_ON(idx >= VCPU_STATE_NR_PAGES || nr > VCPU_STATE_NR_PAGES - idx);
 
     destroy_perdomain_mapping(v, VCPU_STATE_ADDR(v, idx), nr);
@@ -6538,16 +6557,11 @@ void unmap_vcpu_state_page(const void *va)
     }
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
@@ -6583,8 +6597,29 @@ void free_perdomain_mappings(struct domain *d)
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


