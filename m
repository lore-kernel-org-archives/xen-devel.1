Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8E6C624D6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:49:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405533.1639069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hak-0008Be-Dg; Wed, 02 Sep 2026 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405533.1639069; Wed, 02 Sep 2026 09:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hak-0008BL-6Y; Wed, 02 Sep 2026 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1405533;
 Wed, 02 Sep 2026 09:49:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hai-000869-Vw
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:49:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hai-003afr-CK
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:49:12 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97f10a-bab6-0a2a0a5309dd-0a2a45029afe-40
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:49:12 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-720697.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-6ca4-0a2a45020019-d99ba50ce8c0-5
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:07 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id CF50036928F7; Wed,  2 Sep 2026 10:44:06 +0100 (BST)
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
Subject: [PATCH v2 11/14] x86/mm: prepare create_perdomain_mapping() for per-vCPU perdomain areas
Date: Wed,  2 Sep 2026 10:43:55 +0100
Message-ID: <20260901-asi-part2-11-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788342247-F34BE2AC-9385394E/0/0
X-purgate-type: clean
X-purgate-size: 9636

From: Roger Pau Monné <roger.pau@citrix.com>

We want to change per-domain mappings to be per-vCPU mappings.  In
preparation for that, we want to arrange that
create_perdomain_mapping() work either with a single perdomain area,
or with a per-vCPU perdomain area.

Most of the remaining callers are already in a vCPU context.  This is
no accident: the perdomain area has always been laid out in per-vCPU
slices -- each vCPU has its own GDT/LDT window, its own
COMPAT_ARG_XLAT pages, its own window of mapcache entries -- and each
vCPU's slice is set up as that vCPU is created.  For these callers, we
just need to change the parameter from a domain pointer to a vCPU
pointer.  Once the perdomain area itself becomes per-vCPU, the same
calls will populate the owning vCPU's own area rather than slices of a
shared one.

One exception is the call in hvm_domain_initialise().  An HVM vCPU's
monitor table is created during vCPU initialisation, and
init_xen_l4_slots() stamps the perdomain slot into it at that point --
far earlier than for PV, where the Xen slots are written only once
guest page tables are built.  hvm_domain_initialise() therefore had an
explicit create_perdomain_mapping() call just to make the perdomain
root exist ahead of that.  Move it to arch_vcpu_create(), covering HVM
and PV alike.  With a single shared area, the call allocates at most
once per domain; but once each vCPU has its own perdomain area, this
is the call that will allocate every vCPU's root -- PV included --
before any page tables referencing it are built.  vCPU creation is
where the call must end up; move it there directly.  For PV guests
nothing observable changes: the root was already being created during
vCPU creation as a side effect (by mapcache_vcpu_init(), or failing
that pv_create_gdt_ldt_l1tab()); it now merely becomes explicit.

Note that we cannot yet do a parallel movement of
free_perdomain_mappings(): the per-domain page-table hierarchy is
still a single domain-wide structure shared by all vCPUs, so tearing
it down from a per-vCPU path would pull the mappings out from under
sibling vCPUs (e.g.  on a partially failed, retryable
XEN_DOMCTL_max_vcpus), and vCPU-create error paths can rely on domain
destruction to free a partially set up hierarchy.  Teardown will move
to vCPU scope only once the structure itself becomes per-vCPU.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- Added to the series

Changes since the previously posted version:
- Keep free_perdomain_mappings() (and hence perdomain teardown)
  domain-scoped.
- Keep the idle domain without a perdomain area.
- Retitle (was: "x86/mm: switch {create,destroy}_perdomain_mapping()
  domain parameter to vCPU"); destroy_perdomain_mapping() was switched
  in a separate patch.
- Split the removal of mapcache_domain_init()'s redundant
  create_perdomain_mapping() call into its own (preceding) patch.
---
 xen/arch/x86/domain.c         | 10 ++++++++++
 xen/arch/x86/domain_page.c    |  6 +++---
 xen/arch/x86/hvm/hvm.c        |  5 -----
 xen/arch/x86/include/asm/mm.h |  2 +-
 xen/arch/x86/mm.c             | 17 +++++++++--------
 xen/arch/x86/pv/domain.c      |  2 +-
 xen/arch/x86/x86_64/mm.c      |  2 +-
 7 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index efa72cd2f1..1f75d44fe0 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -517,6 +517,16 @@ int arch_vcpu_create(struct vcpu *v)
 
     if ( !is_idle_domain(d) )
     {
+        /*
+         * Make sure the per-domain L3 exists ahead of any consumer (e.g.
+         * init_xen_l4_slots() for the HVM monitor tables): with
+         * create_perdomain_mapping() taking a vCPU this can no longer be
+         * done when creating the domain.
+         */
+        rc = create_perdomain_mapping(v, PERDOMAIN_VIRT_START, 0, false);
+        if ( rc )
+            return rc;
+
         paging_vcpu_init(v);
 
         if ( (rc = vcpu_init_fpu(v)) != 0 )
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 449d4f2a7d..9b375e438a 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -293,14 +293,14 @@ int mapcache_vcpu_init(struct vcpu *v)
     if ( ents > dcache->entries )
     {
         /* Populate page tables. */
-        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents, false);
+        int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents, false);
 
         /* Populate bit maps. */
         if ( !rc )
-            rc = create_perdomain_mapping(d, (unsigned long)dcache->inuse,
+            rc = create_perdomain_mapping(v, (unsigned long)dcache->inuse,
                                           nr, true);
         if ( !rc )
-            rc = create_perdomain_mapping(d, (unsigned long)dcache->garbage,
+            rc = create_perdomain_mapping(v, (unsigned long)dcache->garbage,
                                           nr, true);
 
         if ( rc )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index cd425c3342..a41ae35374 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -620,10 +620,6 @@ int hvm_domain_initialise(struct domain *d,
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
-    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, false);
-    if ( rc )
-        goto fail;
-
     hvm_init_cacheattr_region_list(d);
 
     rc = paging_enable(d, PG_refcounts|PG_translate|PG_external);
@@ -730,7 +726,6 @@ int hvm_domain_initialise(struct domain *d,
     XFREE(d->arch.hvm.irq);
  fail0:
     hvm_destroy_cacheattr_region_list(d);
- fail:
     hvm_domain_relinquish_resources(d);
     XFREE(d->arch.hvm.io_handler);
     XFREE(d->arch.hvm.pl_time);
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 9a8fda782e..97924a639b 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -600,7 +600,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-int create_perdomain_mapping(struct domain *d, unsigned long va,
+int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, bool populate);
 void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 const mfn_t *mfn, unsigned int nr,
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index fc524ef0c3..6dfd75475a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6212,13 +6212,13 @@ static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
 }
 
 /*
- * Ensure the paging structure for [va, va + nr * PAGE_SIZE) of d's
- * per-domain area is in place, allocating whichever levels are missing:
- * the (domain-wide) L3 root, the slot's L2, and all L1 tables covering
- * the range.  All allocations come from the domain heap.  The range must
- * lie within a single per-domain slot (one L3 entry), and already-present
- * levels and entries are left untouched, so calls are idempotent over
- * existing ranges.
+ * Ensure the paging structure for [va, va + nr * PAGE_SIZE) of the
+ * per-domain area of v's domain is in place, allocating whichever levels
+ * are missing: the (domain-wide) L3 root, the slot's L2, and all L1
+ * tables covering the range.  All allocations come from the domain heap.
+ * The range must lie within a single per-domain slot (one L3 entry), and
+ * already-present levels and entries are left untouched, so calls are
+ * idempotent over existing ranges.
  *
  * nr == 0: only ensure the per-domain L3 itself exists; populate is
  * ignored.  Used to set the area up before any sub-range is known.
@@ -6234,9 +6234,10 @@ static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
  * perdomain_l1e_needs_freeing()), whereas caller-owned mappings are only
  * ever unmapped.
  */
-int create_perdomain_mapping(struct domain *d, unsigned long va,
+int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, bool populate)
 {
+    struct domain *d = v->domain;
     struct page_info *pg;
     l3_pgentry_t *l3tab;
     l2_pgentry_t *l2tab;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 40b834e1a4..50f2d1284a 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -313,7 +313,7 @@ int switch_compat(struct domain *d)
 
 static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
-    return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
+    return create_perdomain_mapping(v, GDT_VIRT_START(v),
                                     1U << GDT_LDT_VCPU_SHIFT, false);
 }
 
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index aa74acec82..bc7e49f4de 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -732,7 +732,7 @@ void __init zap_low_mappings(void)
 
 int setup_compat_arg_xlat(struct vcpu *v)
 {
-    return create_perdomain_mapping(v->domain, ARG_XLAT_START(v),
+    return create_perdomain_mapping(v, ARG_XLAT_START(v),
                                     PFN_UP(COMPAT_ARG_XLAT_SIZE), true);
 }
 
-- 
2.55.0


