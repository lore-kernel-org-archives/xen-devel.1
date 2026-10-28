Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060C0606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=2I66xFRa
Received: from list by lists.xenproject.org with outflank-mailman.1463716.1674511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCjE-0003ci-Q3; Wed, 28 Oct 2026 23:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463716.1674511; Wed, 28 Oct 2026 23:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCjE-0003cZ-M2; Wed, 28 Oct 2026 23:06:44 +0000
Received: by outflank-mailman (input) for mailman id 1463716;
 Wed, 28 Oct 2026 23:06:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMCjD-0003Kj-1Y
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:06:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjC-00000000ozS-2c3F;
 Wed, 28 Oct 2026 23:06:42 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjC-00000001KpM-0mqd;
 Wed, 28 Oct 2026 23:06:42 +0000
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
	bh=esXrd0Jka8WbHwkPGFhLd2S1JxqJTf5kbPSe2y2FeJo=; b=2I66xFRaZkkUlK/FZSf+w5CKg/
	SHYX6FNyz38Sx03bhnqUVOUy+3NwrrhXEesq3ia4Ht/Nij2eULdBsQn2shgCSnOP6biskYb1X7U0f
	5kD9tdNXfquydm6pkRp33fouSzvJQU1uY5UmtVsdq7qvAJ2cqbANs1axMN4q+ZjJPf88=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 06/45] x86/mm: prepare create_perdomain_mapping() for per-vCPU perdomain areas
Date: Wed, 28 Oct 2026 23:05:20 +0000
Message-ID: <20261028-asi-hvm-v5-6-13b908e0df0b@xenproject.org>
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

We want to change per-domain mappings to be per-vCPU mappings.  In
preparation for that, we want to arrange that
create_perdomain_mapping() work either with a single perdomain area,
or with a per-vCPU perdomain area.

Most of the remaining callers are already in a vCPU context.  This is
no accident: much of the perdomain area has always been laid out in
per-vCPU slices -- each vCPU has its own GDT/LDT window and its own
COMPAT_ARG_XLAT pages -- and each vCPU's slice is set up as that vCPU
is created.  For these callers, we just need to change the parameter
from a domain pointer to a vCPU pointer.  Once the perdomain area
itself becomes per-vCPU, the same calls will populate the owning
vCPU's own area rather than slices of a shared one.

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
tables referencing it are built.  For PV guests nothing observable
changes: the root was already being created during vCPU creation as a
side effect (by mapcache_vcpu_init(), or failing that
pv_create_gdt_ldt_l1tab()); it now merely becomes explicit.

Note that we cannot yet do a parallel movement of
free_perdomain_mappings(): the per-domain page-table hierarchy is
still a single domain-wide structure shared by all vCPUs, so tearing
it down from a per-vCPU path would pull the mappings out from under
sibling vCPUs (e.g. on a partially failed, retryable
XEN_DOMCTL_max_vcpus), and vCPU-create error paths can rely on domain
destruction to free a partially set up hierarchy.  Once a domain's area
is per-vCPU, a later change gives its vCPUs a teardown of their own; the
domain-wide teardown stays for domains with a shared area, PV ones
included.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
- Message: the domain-wide mapcache is one pool, not per-vCPU windows:
  drop it from the per-vCPU slices, and say "much of" the area.

Changes in v4:
- Message: drop a sentence repeating its paragraph, and say that the
  domain-wide teardown stays for domains with a shared area (Roger).
- End the comment in arch_vcpu_create() at the colon (Roger).

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
 xen/arch/x86/domain.c         | 8 ++++++++
 xen/arch/x86/domain_page.c    | 6 +++---
 xen/arch/x86/hvm/hvm.c        | 5 -----
 xen/arch/x86/include/asm/mm.h | 2 +-
 xen/arch/x86/mm.c             | 3 ++-
 xen/arch/x86/pv/domain.c      | 2 +-
 xen/arch/x86/x86_64/mm.c      | 2 +-
 7 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8e17fbe6d9..94a1ea904a 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -517,6 +517,14 @@ int arch_vcpu_create(struct vcpu *v)
 
     if ( !is_idle_domain(d) )
     {
+        /*
+         * Make sure the per-domain L3 exists ahead of any consumer (e.g.
+         * init_xen_l4_slots() for the HVM monitor tables).
+         */
+        rc = create_perdomain_mapping(v, PERDOMAIN_VIRT_START, 0, NULL, NULL);
+        if ( rc )
+            return rc;
+
         paging_vcpu_init(v);
 
         if ( (rc = vcpu_init_fpu(v)) != 0 )
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index f02be1675b..f3e65e2d44 100644
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
index 6aefe91e02..71da15c0a4 100644
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
index 20a1d27cd0..c9085214fd 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -606,7 +606,7 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 #define NIL(type) ((type *)-sizeof(type))
 #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
 
-int create_perdomain_mapping(struct domain *d, unsigned long va,
+int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg);
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 72c1865e7e..8153683a0c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6238,10 +6238,11 @@ static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
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
index 28ea0742ab..f3c711b85b 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -313,7 +313,7 @@ int switch_compat(struct domain *d)
 
 static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
-    return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
+    return create_perdomain_mapping(v, GDT_VIRT_START(v),
                                     1U << GDT_LDT_VCPU_SHIFT,
                                     v->domain->arch.pv.gdt_ldt_l1tab,
                                     NULL);
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index f467ed426b..7b04537066 100644
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
2.56.0


