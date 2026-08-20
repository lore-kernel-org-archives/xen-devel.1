Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C20C5DF8B
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 17:44:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396852.1634547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6oH-0002Uh-8y; Thu, 20 Aug 2026 17:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396852.1634547; Thu, 20 Aug 2026 17:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6oH-0002U3-4W; Thu, 20 Aug 2026 17:44:13 +0000
Received: by outflank-mailman (input) for mailman id 1396852;
 Thu, 20 Aug 2026 17:44:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wx6oG-0002Hb-2t
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:44:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6oF-00E24S-17;
 Thu, 20 Aug 2026 17:44:11 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6oE-00DjFg-2j;
 Thu, 20 Aug 2026 17:44:11 +0000
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
	bh=/Kcw94vkaHCxYDdapb519eUOueMrlstSp7fpRrLXQ38=; b=ljM+ma/aVDVEQo/PRvbC3bv2Zd
	rJmyXQwNQTKn/Ou5LBOPke8rER0kGMa3abJV/NVi9hyp4nHoaPD1jDxFTVOXjnsvZq8XJGzoRMlc9
	OEKN4lQE6XKS1AE6YG99iqB0HR8R2I9SAH4RT4B0rc1DFV68ZgKSTUIR7bFMfwLigPeE=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 7/7] x86/mm: simplify create_perdomain_mapping() interface
Date: Thu, 20 Aug 2026 18:43:47 +0100
Message-ID: <20260820-asi-part1-7-f2dbd92b8459@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

create_perdomain_mapping()'s interface is richer than any caller needs.
The paging structure for the requested range is built to a depth
selected by the pl1tab and ppg arguments, each of which distinguishes
NULL from NIL() from a real pointer:

 - nr == 0: only ensure the per-domain L3 exists; nothing else is
   allocated, and the other arguments are ignored.
 - pl1tab == a pointer: allocate the L1 tables covering the range, and
   return their addresses in the array -- the mode that existed to
   build the GDT/LDT stash.
 - pl1tab == NIL(): allocate the L1 tables, and return nothing.
 - pl1tab == NULL: do not plumb L1 tables for their own sake (they are
   still allocated on demand if data-page population requires them).
 - ppg == a pointer: allocate and install zeroed data pages across the
   range, and return their struct page_info pointers in the array.
 - ppg == NIL(): allocate and install the zeroed data pages, but hand
   nothing back; the pages are reachable only through the mapping.
 - ppg == NULL: do not allocate data pages.
 - both NULL, nr > 0: stop after the slot's L2; do not plumb L1 tables
   at all.

Very few of these modes have users now.  The last user of the
pl1tab capture mode was removed when we removed the GDT/LDT stash.
The ppg capture mode never had any users.  Nothing uses the both-NULL
L2-only mode with nr != 0.  What remains is exactly one bit of
information: whether the caller wants the range populated with zeroed,
area-owned data pages, or merely plumbed down to the L1 tables, ready
for populate_perdomain_mapping() to install caller-owned pages.

Replace the two arguments with a boolean expressing that bit.  With the
stashing mode gone the NIL()/IS_NIL() macros lose their last user, so
drop them as well; and document the resulting interface.

No caller changes behaviour: every existing call maps onto the boolean
exactly.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes since the previously posted version:
- Drop the now-unused NIL()/IS_NIL() macros as requested during review
- Describe the prior interface in the commit message and add a doc
   comment for the simplified one.
---
 xen/arch/x86/domain_page.c    | 10 ++++-----
 xen/arch/x86/hvm/hvm.c        |  2 +-
 xen/arch/x86/include/asm/mm.h |  6 +-----
 xen/arch/x86/mm.c             | 40 +++++++++++++++++++++++------------
 xen/arch/x86/pv/domain.c      |  4 +---
 xen/arch/x86/x86_64/mm.c      |  3 +--
 6 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 72c00194f3..1c1deeeebc 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -246,8 +246,7 @@ int mapcache_domain_init(struct domain *d)
     spin_lock_init(&dcache->lock);
 
     return create_perdomain_mapping(d, (unsigned long)dcache->inuse,
-                                    2 * bitmap_pages + 1,
-                                    NIL(l1_pgentry_t *), NULL);
+                                    2 * bitmap_pages + 1, false);
 }
 
 int mapcache_vcpu_init(struct vcpu *v)
@@ -264,16 +263,15 @@ int mapcache_vcpu_init(struct vcpu *v)
     if ( ents > dcache->entries )
     {
         /* Populate page tables. */
-        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents,
-                                          NIL(l1_pgentry_t *), NULL);
+        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents, false);
 
         /* Populate bit maps. */
         if ( !rc )
             rc = create_perdomain_mapping(d, (unsigned long)dcache->inuse,
-                                          nr, NULL, NIL(struct page_info *));
+                                          nr, true);
         if ( !rc )
             rc = create_perdomain_mapping(d, (unsigned long)dcache->garbage,
-                                          nr, NULL, NIL(struct page_info *));
+                                          nr, true);
 
         if ( rc )
             return rc;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 955fc062a5..e8fbe7ba27 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -620,7 +620,7 @@ int hvm_domain_initialise(struct domain *d,
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
-    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
+    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, false);
     if ( rc )
         goto fail;
 
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 1888807394..30eaec9179 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -600,12 +600,8 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-#define NIL(type) ((type *)-sizeof(type))
-#define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
-
 int create_perdomain_mapping(struct domain *d, unsigned long va,
-                             unsigned int nr, l1_pgentry_t **pl1tab,
-                             struct page_info **ppg);
+                             unsigned int nr, bool populate);
 void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 const mfn_t *mfn, unsigned int nr,
                                 unsigned int flags);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1810971677..aa26d12ac2 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6211,9 +6211,33 @@ static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
            (_PAGE_PRESENT | _PAGE_AVAIL0);
 }
 
+/*
+ * Ensure the paging structure for [va, va + nr * PAGE_SIZE) of d's
+ * per-domain area is in place, allocating whichever levels are missing:
+ * the (domain-wide) L3 root, the slot's L2, and all L1 tables covering
+ * the range.  The page-tables come from the xenheap, so that they stay
+ * reachable through their always-mapped alias; populated pages come from
+ * the domain heap.  The range must lie within a single per-domain slot
+ * (one L3 entry), and already-present levels and entries are left
+ * untouched, so calls are idempotent over existing ranges.
+ *
+ * nr == 0: only ensure the per-domain L3 itself exists; populate is
+ * ignored.  Used to set the area up before any sub-range is known.
+ *
+ * populate == false: stop once the L1 tables are in place.  The range is
+ * then ready for caller-owned pages to be mapped and unmapped via
+ * populate_perdomain_mapping() / destroy_perdomain_mapping(), which only
+ * fill (or clear) existing tables; populate treats missing structure as a
+ * bug, destroy skips it.
+ *
+ * populate == true: additionally install a freshly allocated, zeroed page
+ * at every not-yet-present entry in the range.  Such pages are marked
+ * _PAGE_AVAIL0, "owned by the per-domain area": teardown frees them (see
+ * perdomain_l1e_needs_freeing()), whereas caller-owned mappings are only
+ * ever unmapped.
+ */
 int create_perdomain_mapping(struct domain *d, unsigned long va,
-                             unsigned int nr, l1_pgentry_t **pl1tab,
-                             struct page_info **ppg)
+                             unsigned int nr, bool populate)
 {
     struct page_info *pg;
     l3_pgentry_t *l3tab;
@@ -6258,9 +6282,6 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
     else
         l2tab = maddr_to_virt(l3e_get_paddr(l3tab[l3_table_offset(va)]));
 
-    if ( !pl1tab && !ppg )
-        return 0;
-
     for ( l1tab = NULL; !rc && nr--; )
     {
         l2_pgentry_t *pl2e = l2tab + l2_table_offset(va);
@@ -6273,26 +6294,19 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
                 rc = -ENOMEM;
                 break;
             }
-            if ( pl1tab && !IS_NIL(pl1tab) )
-            {
-                ASSERT(!pl1tab[l2_table_offset(va)]);
-                pl1tab[l2_table_offset(va)] = l1tab;
-            }
             clear_page(l1tab);
             *pl2e = l2e_from_mfn(virt_to_mfn(l1tab), __PAGE_HYPERVISOR_RW);
         }
         else if ( !l1tab )
             l1tab = maddr_to_virt(l2e_get_paddr(*pl2e));
 
-        if ( ppg &&
+        if ( populate &&
              !(l1e_get_flags(l1tab[l1_table_offset(va)]) & _PAGE_PRESENT) )
         {
             pg = alloc_domheap_page(d, MEMF_no_owner);
             if ( pg )
             {
                 clear_domain_page(page_to_mfn(pg));
-                if ( !IS_NIL(ppg) )
-                    *ppg++ = pg;
                 l1tab[l1_table_offset(va)] =
                     l1e_from_page(pg, __PAGE_HYPERVISOR_RW | _PAGE_AVAIL0);
                 l2e_add_flags(*pl2e, _PAGE_AVAIL0);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 35d1761c9c..15a8238aff 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -314,9 +314,7 @@ int switch_compat(struct domain *d)
 static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
     return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
-                                    1U << GDT_LDT_VCPU_SHIFT,
-                                    NIL(l1_pgentry_t *),
-                                    NULL);
+                                    1U << GDT_LDT_VCPU_SHIFT, false);
 }
 
 static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 8eadab7933..ffeda06e08 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -733,8 +733,7 @@ void __init zap_low_mappings(void)
 int setup_compat_arg_xlat(struct vcpu *v)
 {
     return create_perdomain_mapping(v->domain, ARG_XLAT_START(v),
-                                    PFN_UP(COMPAT_ARG_XLAT_SIZE),
-                                    NULL, NIL(struct page_info *));
+                                    PFN_UP(COMPAT_ARG_XLAT_SIZE), true);
 }
 
 void free_compat_arg_xlat(struct vcpu *v)
-- 
2.55.0


