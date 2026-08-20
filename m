Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF8DC5DF85
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 17:44:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396846.1634490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6o8-0000vG-HR; Thu, 20 Aug 2026 17:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396846.1634490; Thu, 20 Aug 2026 17:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6o8-0000v4-D0; Thu, 20 Aug 2026 17:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1396846;
 Thu, 20 Aug 2026 17:44:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wx6o7-0000sP-3b
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:44:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6o6-00E23K-1p;
 Thu, 20 Aug 2026 17:44:02 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6o6-00DjFg-07;
 Thu, 20 Aug 2026 17:44:02 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=cEDD9mG2oPJvt6c9y//9kSMyh8V/fAJEbBVdy3IMrMU=; b=JOC6YU5ZVo9GVFtmytXAbvbrsj
	CTSBtdd+DAtuDSjpPO4AaLsztgfgGZfoEfav+R65oU3ro7b1ZuO2cUD0RHmNLub1yJjN11xyEn6F7
	OjYj5G5+4bQMeiGcFAw0bykcl3C1x2zGYYJmL/BgR/jzwE2kLEckZ5S+YznQh8PDAoLk=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/7] x86/mm: allocate the per-domain page-tables from the xenheap
Date: Thu, 20 Aug 2026 18:43:41 +0100
Message-ID: <20260820-asi-part1-1-f2dbd92b8459@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-domain area's L3, L2 and L1 page-tables are currently
domain-heap pages with no owner, and accessed through
map_domain_page() whenever they need editing.  That has two costs.
First, every edit not going through the linear mappings of the loaded
page-tables goes through map_domain_page() per level.  Even now that is
sometimes a mapcache round trip; once the direct map becomes on-demand
it always will be.  Second, the mapcache is not usable everywhere;
specifically, it cannot be called in the context switch before the
incoming vCPU's page-tables are loaded.

Currently the Xen slot of a PV vcpu's full GDT is written during context
switch; that works by special-casing the GDT/LDT L1 tables into the
xenheap and stashing their addresses in d->arch.pv.gdt_ldt_l1tab.
Later in the series the mappings of the guest's root page-table (for
the XPTI root sync) and of the CPU's own stack (for per-CPU stack
isolation) need writing at context switch too, and per-vCPU roots add
writes on the PV kernel/user switch and new-CR3 paths.

Instead of adding more ad-hoc pointers, or arranging to be able to
call map_domain_page() from within a context switch, allocate *all* of
the per-domain page-tables from the xenheap.  Keep a pointer directly
to the L3 page within the xenheap, and when walking the page-tables,
use the MFN in the entry to reconstruct the virtual address of the
xenheap page directly.  Xenheap pages are mapped in every context, so
the tables can be edited from anywhere through their always-mapped
alias: no mapcache, no special case for the context switch.  Under the
planned on-demand direct map, xenheap pages remain mapped at that
alias for their lifetime, so this stays true.

It may seem strange for a series whose end goal is to move things out
of global mappings to start by requiring a further class of pages to
stay globally mapped.  The series is about protecting *guest* data.
The pages in question here hold page-table entries only -- MFNs and
flags, reachable through the linear mappings whenever the tables are
loaded anyway -- not guest data; XPTI's per-CPU root page-tables are
xenheap pages by the same reasoning.  The pages mapped *by* these
tables (GDT/LDT frames, the mapcache's targets, the compat
argument-translation area) are unaffected and stay domain-heap pages.

The "capture" mode of create_perdomain_mapping() no longer needs to take
its L1s from a different heap than the others; it now only records the
pointers.  The is_xen_heap_page() check in free_perdomain_mappings() goes
away with it.  No change for callers.

Two side effects to note.  First, the tables are subject to the
xenheap allocation limit (within the PV-visible direct map), as the
stashed L1s, the GDTs and XPTI's root page-tables already are -- a few
pages per vcpu at most.

Second, the xenheap allocator takes no domain, so there is no
round-robin over the domain's node affinity: so we place the tables
with MEMF_node(domain_to_node(d)), on the node of the domain's first
vcpu (or the allocating CPU's node before it exists), as the stashed
L1s already were.

Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
 xen/arch/x86/domain.c             |   4 +-
 xen/arch/x86/include/asm/domain.h |   3 +-
 xen/arch/x86/mm.c                 | 121 ++++++++++--------------------
 3 files changed, 45 insertions(+), 83 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 996b50af7a..163a2c97ae 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2015,8 +2015,8 @@ void cf_check paravirt_ctxt_switch_to(struct vcpu *v)
 
     if ( root_pgt )
         root_pgt[root_table_offset(PERDOMAIN_VIRT_START)] =
-            l4e_from_page(v->domain->arch.perdomain_l3_pg,
-                          __PAGE_HYPERVISOR_RW);
+            l4e_from_paddr(__pa(v->domain->arch.perdomain_l3),
+                           __PAGE_HYPERVISOR_RW);
 
     if ( unlikely(v->arch.dr7 & DR7_ACTIVE_MASK) )
         activate_debugregs(v);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 2d0a915410..5275bb10ea 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -332,7 +332,8 @@ struct monitor_write_data {
 
 struct arch_domain
 {
-    struct page_info *perdomain_l3_pg;
+    /* Xenheap page: the per-domain page-tables are always mapped. */
+    l3_pgentry_t *perdomain_l3;
 
     /* I/O-port admin-specified access capabilities. */
     struct rangeset *ioport_caps;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b158742408..38a0f984fc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1679,7 +1679,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
 
     /* Slot 260: Per-domain mappings. */
     l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
-        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
+        l4e_from_mfn(virt_to_mfn(d->arch.perdomain_l3), __PAGE_HYPERVISOR_RW);
 
     /* Slot 4: Per-domain mappings mirror. */
     BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
@@ -6219,54 +6219,47 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
     l3_pgentry_t *l3tab;
     l2_pgentry_t *l2tab;
     l1_pgentry_t *l1tab;
+    unsigned int memflags = MEMF_node(domain_to_node(d));
     int rc = 0;
 
     ASSERT(va >= PERDOMAIN_VIRT_START &&
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
 
-    if ( !d->arch.perdomain_l3_pg )
+    /*
+     * The per-domain page-tables come from the xenheap, so that they can be
+     * edited from any context through their always-mapped alias, without
+     * going through the mapcache -- in particular from the context switch,
+     * which writes the incoming vcpu's tables before loading them.
+     */
+    l3tab = d->arch.perdomain_l3;
+    if ( !l3tab )
     {
-        pg = alloc_domheap_page(d, MEMF_no_owner);
-        if ( !pg )
+        l3tab = alloc_xenheap_pages(0, memflags);
+        if ( !l3tab )
             return -ENOMEM;
-        l3tab = __map_domain_page(pg);
         clear_page(l3tab);
-        d->arch.perdomain_l3_pg = pg;
-        if ( !nr )
-        {
-            unmap_domain_page(l3tab);
-            return 0;
-        }
+        d->arch.perdomain_l3 = l3tab;
     }
-    else if ( !nr )
+
+    if ( !nr )
         return 0;
-    else
-        l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
 
     ASSERT(!l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
     if ( !(l3e_get_flags(l3tab[l3_table_offset(va)]) & _PAGE_PRESENT) )
     {
-        pg = alloc_domheap_page(d, MEMF_no_owner);
-        if ( !pg )
-        {
-            unmap_domain_page(l3tab);
+        l2tab = alloc_xenheap_pages(0, memflags);
+        if ( !l2tab )
             return -ENOMEM;
-        }
-        l2tab = __map_domain_page(pg);
         clear_page(l2tab);
-        l3tab[l3_table_offset(va)] = l3e_from_page(pg, __PAGE_HYPERVISOR_RW);
+        l3tab[l3_table_offset(va)] = l3e_from_mfn(virt_to_mfn(l2tab),
+                                                  __PAGE_HYPERVISOR_RW);
     }
     else
-        l2tab = map_l2t_from_l3e(l3tab[l3_table_offset(va)]);
-
-    unmap_domain_page(l3tab);
+        l2tab = maddr_to_virt(l3e_get_paddr(l3tab[l3_table_offset(va)]));
 
     if ( !pl1tab && !ppg )
-    {
-        unmap_domain_page(l2tab);
         return 0;
-    }
 
     for ( l1tab = NULL; !rc && nr--; )
     {
@@ -6274,33 +6267,22 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
 
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
+            l1tab = alloc_xenheap_pages(0, memflags);
+            if ( !l1tab )
+            {
+                rc = -ENOMEM;
+                break;
+            }
             if ( pl1tab && !IS_NIL(pl1tab) )
             {
-                l1tab = alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
-                if ( !l1tab )
-                {
-                    rc = -ENOMEM;
-                    break;
-                }
                 ASSERT(!pl1tab[l2_table_offset(va)]);
                 pl1tab[l2_table_offset(va)] = l1tab;
-                pg = virt_to_page(l1tab);
-            }
-            else
-            {
-                pg = alloc_domheap_page(d, MEMF_no_owner);
-                if ( !pg )
-                {
-                    rc = -ENOMEM;
-                    break;
-                }
-                l1tab = __map_domain_page(pg);
             }
             clear_page(l1tab);
-            *pl2e = l2e_from_page(pg, __PAGE_HYPERVISOR_RW);
+            *pl2e = l2e_from_mfn(virt_to_mfn(l1tab), __PAGE_HYPERVISOR_RW);
         }
         else if ( !l1tab )
-            l1tab = map_l1t_from_l2e(*pl2e);
+            l1tab = maddr_to_virt(l2e_get_paddr(*pl2e));
 
         if ( ppg &&
              !(l1e_get_flags(l1tab[l1_table_offset(va)]) & _PAGE_PRESENT) )
@@ -6321,15 +6303,10 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
 
         va += PAGE_SIZE;
         if ( rc || !nr || !l1_table_offset(va) )
-        {
-            /* Note that this is a no-op for the alloc_xenheap_page() case. */
-            unmap_domain_page(l1tab);
             l1tab = NULL;
-        }
     }
 
     ASSERT(!l1tab);
-    unmap_domain_page(l2tab);
 
     return rc;
 }
@@ -6343,15 +6320,15 @@ void destroy_perdomain_mapping(struct domain *d, unsigned long va,
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
     ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
-    if ( !d->arch.perdomain_l3_pg )
+    l3tab = d->arch.perdomain_l3;
+    if ( !l3tab )
         return;
 
-    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
     pl3e = l3tab + l3_table_offset(va);
 
     if ( l3e_get_flags(*pl3e) & _PAGE_PRESENT )
     {
-        const l2_pgentry_t *l2tab = map_l2t_from_l3e(*pl3e);
+        const l2_pgentry_t *l2tab = maddr_to_virt(l3e_get_paddr(*pl3e));
         const l2_pgentry_t *pl2e = l2tab + l2_table_offset(va);
         unsigned int i = l1_table_offset(va);
 
@@ -6359,7 +6336,7 @@ void destroy_perdomain_mapping(struct domain *d, unsigned long va,
         {
             if ( l2e_get_flags(*pl2e) & _PAGE_PRESENT )
             {
-                l1_pgentry_t *l1tab = map_l1t_from_l2e(*pl2e);
+                l1_pgentry_t *l1tab = maddr_to_virt(l2e_get_paddr(*pl2e));
 
                 for ( ; nr && i < L1_PAGETABLE_ENTRIES; --nr, ++i )
                 {
@@ -6367,8 +6344,6 @@ void destroy_perdomain_mapping(struct domain *d, unsigned long va,
                         free_domheap_page(l1e_get_page(l1tab[i]));
                     l1tab[i] = l1e_empty();
                 }
-
-                unmap_domain_page(l1tab);
             }
             else if ( nr + i < L1_PAGETABLE_ENTRIES )
                 break;
@@ -6378,60 +6353,46 @@ void destroy_perdomain_mapping(struct domain *d, unsigned long va,
             ++pl2e;
             i = 0;
         }
-
-        unmap_domain_page(l2tab);
     }
-
-    unmap_domain_page(l3tab);
 }
 
 void free_perdomain_mappings(struct domain *d)
 {
-    l3_pgentry_t *l3tab;
+    l3_pgentry_t *l3tab = d->arch.perdomain_l3;
     unsigned int i;
 
-    if ( !d->arch.perdomain_l3_pg )
+    if ( !l3tab )
         return;
 
-    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
-
     for ( i = 0; i < PERDOMAIN_SLOTS; ++i)
         if ( l3e_get_flags(l3tab[i]) & _PAGE_PRESENT )
         {
-            struct page_info *l2pg = l3e_get_page(l3tab[i]);
-            l2_pgentry_t *l2tab = __map_domain_page(l2pg);
+            l2_pgentry_t *l2tab = maddr_to_virt(l3e_get_paddr(l3tab[i]));
             unsigned int j;
 
             for ( j = 0; j < L2_PAGETABLE_ENTRIES; ++j )
                 if ( l2e_get_flags(l2tab[j]) & _PAGE_PRESENT )
                 {
-                    struct page_info *l1pg = l2e_get_page(l2tab[j]);
+                    l1_pgentry_t *l1tab =
+                        maddr_to_virt(l2e_get_paddr(l2tab[j]));
 
                     if ( l2e_get_flags(l2tab[j]) & _PAGE_AVAIL0 )
                     {
-                        l1_pgentry_t *l1tab = __map_domain_page(l1pg);
                         unsigned int k;
 
                         for ( k = 0; k < L1_PAGETABLE_ENTRIES; ++k )
                             if ( perdomain_l1e_needs_freeing(l1tab[k]) )
                                 free_domheap_page(l1e_get_page(l1tab[k]));
-
-                        unmap_domain_page(l1tab);
                     }
 
-                    if ( is_xen_heap_page(l1pg) )
-                        free_xenheap_page(page_to_virt(l1pg));
-                    else
-                        free_domheap_page(l1pg);
+                    free_xenheap_page(l1tab);
                 }
 
-            unmap_domain_page(l2tab);
-            free_domheap_page(l2pg);
+            free_xenheap_page(l2tab);
         }
 
-    unmap_domain_page(l3tab);
-    free_domheap_page(d->arch.perdomain_l3_pg);
-    d->arch.perdomain_l3_pg = NULL;
+    free_xenheap_page(l3tab);
+    d->arch.perdomain_l3 = NULL;
 }
 
 static void write_sss_token(unsigned long *ptr)
-- 
2.55.0


