Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87047CA6007
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:41:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442104.1659663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP57-00070b-Uz; Wed, 07 Oct 2026 10:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442104.1659663; Wed, 07 Oct 2026 10:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP57-0006zE-Q0; Wed, 07 Oct 2026 10:41:05 +0000
Received: by outflank-mailman (input) for mailman id 1442104;
 Wed, 07 Oct 2026 10:41:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEP56-0006VT-I5
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:41:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP56-001bid-0Y;
 Wed, 07 Oct 2026 10:41:04 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP55-001QnT-31;
 Wed, 07 Oct 2026 10:41:04 +0000
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
	bh=YN/PwYdSyq7VIT0fmDEyLm8kDVbqAXggB4l9ZiyBJMg=; b=RkBIxN5W8+L9JPPHukfY1G4qdh
	Q48ollnxvI89JXACHnR91jF1kUTQ5a1Da4URTfytAyTeXBA823JWKVUpKLmApnc1N6ZNW2otEL1ot
	e8mY91fd61hIloJ33EmNx/MYl3uCYEI0iGcaCEeBs9+vtmO0r3Gz85ZOrGMnzVAEi6d4=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 05/18] x86/mm: prepare create_perdomain_mapping() for per-vCPU perdomain areas
Date: Wed,  7 Oct 2026 11:40:38 +0100
Message-ID: <20261007104051.48841-6-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
is the call that will allocate every vCPU's root before any page
tables referencing it are built.  vCPU creation is
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
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- Rebased onto staging without the GDT/LDT conversions (for the
  HVM-only series): the capture parameters stay, as the PV GDT/LDT
  stash still uses them.

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
 xen/arch/x86/mm.c             |  3 ++-
 xen/arch/x86/pv/domain.c      |  2 +-
 xen/arch/x86/x86_64/mm.c      |  2 +-
 7 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 85cedc3d03..b670cea52b 100644
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
+        rc = create_perdomain_mapping(v, PERDOMAIN_VIRT_START, 0, NULL, NULL);
+        if ( rc )
+            return rc;
+
         paging_vcpu_init(v);
 
         if ( (rc = vcpu_init_fpu(v)) != 0 )
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 3c90acd2bc..9119f735f5 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -260,15 +260,15 @@ int mapcache_vcpu_init(struct vcpu *v)
     if ( ents > dcache->entries )
     {
         /* Populate page tables. */
-        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents,
+        int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents,
                                           NIL(l1_pgentry_t *), NULL);
 
         /* Populate bit maps. */
         if ( !rc )
-            rc = create_perdomain_mapping(d, (unsigned long)dcache->inuse,
+            rc = create_perdomain_mapping(v, (unsigned long)dcache->inuse,
                                           nr, NULL, NIL(struct page_info *));
         if ( !rc )
-            rc = create_perdomain_mapping(d, (unsigned long)dcache->garbage,
+            rc = create_perdomain_mapping(v, (unsigned long)dcache->garbage,
                                           nr, NULL, NIL(struct page_info *));
 
         if ( rc )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 3924c1b204..5572728db3 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -620,10 +620,6 @@ int hvm_domain_initialise(struct domain *d,
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
-    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
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
index b19b1ae53f..87bbe1a6f5 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -603,7 +603,7 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 #define NIL(type) ((type *)-sizeof(type))
 #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
 
-int create_perdomain_mapping(struct domain *d, unsigned long va,
+int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg);
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 769b9b3016..ca22107cd3 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6211,10 +6211,11 @@ static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
            (_PAGE_PRESENT | _PAGE_AVAIL0);
 }
 
-int create_perdomain_mapping(struct domain *d, unsigned long va,
+int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg)
 {
+    struct domain *d = v->domain;
     struct page_info *pg;
     l3_pgentry_t *l3tab;
     l2_pgentry_t *l2tab;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 07ea4bb4d2..9877771cd4 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -326,7 +326,7 @@ int switch_compat(struct domain *d)
 
 static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
-    return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
+    return create_perdomain_mapping(v, GDT_VIRT_START(v),
                                     1U << GDT_LDT_VCPU_SHIFT,
                                     v->domain->arch.pv.gdt_ldt_l1tab,
                                     NULL);
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 8c576acdc7..0f9e0469ef 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -732,7 +732,7 @@ void __init zap_low_mappings(void)
 
 int setup_compat_arg_xlat(struct vcpu *v)
 {
-    return create_perdomain_mapping(v->domain, ARG_XLAT_START(v),
+    return create_perdomain_mapping(v, ARG_XLAT_START(v),
                                     PFN_UP(COMPAT_ARG_XLAT_SIZE),
                                     NULL, NIL(struct page_info *));
 }
-- 
2.55.0


