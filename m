Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813EE606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=KOmSyLxS
Received: from list by lists.xenproject.org with outflank-mailman.1463711.1674464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCj9-0002ZF-Lo; Wed, 28 Oct 2026 23:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463711.1674464; Wed, 28 Oct 2026 23:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCj9-0002Z8-Iz; Wed, 28 Oct 2026 23:06:39 +0000
Received: by outflank-mailman (input) for mailman id 1463711;
 Wed, 28 Oct 2026 23:06:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMCj7-0002Mh-RT
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:06:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCj7-00000000oyo-2U6I;
 Wed, 28 Oct 2026 23:06:37 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCj7-00000001KpM-0VHz;
 Wed, 28 Oct 2026 23:06:37 +0000
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
	bh=B2+5XOSM+cuv0+hYCmliA8wrwB1HxetxuWUGkc2sz6A=; b=KOmSyLxSbUt7uJQzQ8K8WPC3uI
	9a+eV3JAettdVNSipin03TCoi9GC2IQk84oZYKwiq2x5iA7XSULBSQO+/aJJ4Ik0d9n7hSLI7dfVX
	aZ9KiIYewwPXivAIqbXDOoHQj8neYvcH+HYQSgM0GWGjYj59ipSKmPlfg9YsbS6e/KlY=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 01/45] x86/PoD: map one page at a time in p2m_pod_zero_check()
Date: Wed, 28 Oct 2026 23:05:15 +0000
Message-ID: <20261028-asi-hvm-v5-1-13b908e0df0b@xenproject.org>
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

p2m_pod_zero_check() maps every page of its batch that passes its
checks, up to POD_SWEEP_STRIDE (16) of them, and keeps them mapped
across the p2m lookups and updates which follow, each of which maps
page-table pages of its own.  Its callers hold mappings too: the p2m
lookup which found the entry to populate still has its page-table page
mapped, and a PV mmu_update() the L1 page it is writing.

map_domain_page() cannot always provide that many at once.  It uses the
mapcache on behalf of PV vCPUs only.  The mapcache has
MAPCACHE_VCPU_ENTRIES (16) slots per vCPU of the domain, shared by its
vCPUs, and a mapping which finds no slot free or reclaimable hits the
BUG_ON() in map_domain_page(): the host crashes.

The sweep runs in the context of whichever vCPU populates a PoD entry
while the domain's PoD cache is empty.  The guest's own vCPUs, being
HVM, map through the directmap; a PV vCPU gets there when its domain
maps or copies the guest's memory: a device model in dom0 or in a stub
domain, a backend doing grant copies.  A single-vCPU PV domain, such
as a device-model stub domain or a dom0 booted with dom0_max_vcpus=1,
has 16 slots, and a sweep over 16 candidate pages needs more.

The sweep has mapped its whole batch at once since 9ad9a1609fbe ("PoD
memory 5/9: emergency scan"), when x86-64 reached all memory through the
directmap.  The per-vCPU budget came with the mapcache's return to
x86-64 in 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al").

Map one page at a time instead, as p2m_pod_zero_check_superpage()
already does: map a page for the quick check and unmap it again, and
map it anew for the full check after the p2m update and the TLB flush.
The checks and their order are unchanged.  Each page is mapped twice,
which costs little next to scanning it, and the error paths no longer
have mappings to undo.

Fixes: 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al")
Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
Acked-by: Roger Pau Monné <roger@xenproject.org>
---
Changes in v5:
- Use __set_bit() and __clear_bit() on the bitmask (Roger).
- Description: drop the memory limit at which the mapcache starts to be
  used, and the list of what makes map_domain_page() use it (Roger).

Changes in v4:
- Track the pages to check in a bitmask walked with for_each_set_bit(),
  not an array of bools (Andrew).
- Drop the new comment above the first loop; edit the old one's "and map
  the pages" instead (Andrew).

NB this issue was raised in review and verified only by code
inspection; it hasn't been demonstrated.
---
 xen/arch/x86/mm/p2m-pod.c | 72 +++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 4602c32cff..ae1210e279 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -901,9 +901,10 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
 {
     mfn_t mfns[POD_SWEEP_STRIDE];
     p2m_type_t types[POD_SWEEP_STRIDE];
-    unsigned long *map[POD_SWEEP_STRIDE];
+    unsigned int check = 0;
+    const unsigned long *map;
     struct domain *d = p2m->domain;
-    unsigned int i, j, max_ref = 1;
+    unsigned int j, max_ref = 1;
 
     BUG_ON(count > POD_SWEEP_STRIDE);
 
@@ -911,8 +912,11 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
     if ( paging_mode_shadow(d) )
         max_ref++;
 
-    /* First, get the gfn list, translate to mfns, and map the pages. */
-    for ( i = 0; i < count; i++ )
+    /*
+     * First, get the gfn list, translate to mfns, and check for being a
+     * plausible candidate.
+     */
+    for ( unsigned int i = 0; i < count; i++ )
     {
         p2m_access_t a;
 
@@ -921,9 +925,8 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
 
         /*
          * If this is ram, and not a pagetable or a special page, and
-         * probably not mapped elsewhere, map it; otherwise, skip.
+         * probably not mapped elsewhere, check it; otherwise, skip.
          */
-        map[i] = NULL;
         if ( p2m_is_ram(types[i]) )
         {
             const struct page_info *pg = mfn_to_page(mfns[i]);
@@ -932,7 +935,7 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
                  (pg->count_info & PGC_allocated) &&
                  !(pg->count_info & PGC_shadowed_pt) &&
                  ((pg->count_info & PGC_count_mask) <= max_ref) )
-                map[i] = map_domain_page(mfns[i]);
+                __set_bit(i, &check);
         }
     }
 
@@ -940,20 +943,23 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
      * Then, go through and check for zeroed pages, removing write permission
      * for those with zeroes.
      */
-    for ( i = 0; i < count; i++ )
+    for_each_set_bit ( i, check )
     {
-        if ( !map[i] )
-            continue;
-
         /* Quick zero-check */
+        map = map_domain_page(mfns[i]);
         for ( j = 0; j < 16; j++ )
-            if ( *(map[i] + j) != 0 )
-                goto skip;
+            if ( map[j] != 0 )
+                break;
+        unmap_domain_page(map);
 
         /* Try to remove the page, restoring old mapping if it fails. */
-        if ( p2m_set_entry(p2m, gfns[i], INVALID_MFN, PAGE_ORDER_4K,
+        if ( j < 16 ||
+             p2m_set_entry(p2m, gfns[i], INVALID_MFN, PAGE_ORDER_4K,
                            p2m_populate_on_demand, p2m->default_access) )
-            goto skip;
+        {
+            __clear_bit(i, &check);
+            continue;
+        }
 
         /*
          * See if the page was successfully unmapped.  (Allow one refcount
@@ -961,6 +967,8 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
          */
         if ( (mfn_to_page(mfns[i])->count_info & PGC_count_mask) > 1 )
         {
+            __clear_bit(i, &check);
+
             /*
              * If the previous p2m_set_entry call succeeded, this one shouldn't
              * be able to fail.  If it does, crashing the domain should be safe.
@@ -970,38 +978,27 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
             {
                 ASSERT_UNREACHABLE();
                 domain_crash(d);
-                goto out_unmap;
+                return;
             }
-
-        skip:
-            unmap_domain_page(map[i]);
-            map[i] = NULL;
-
-            continue;
         }
     }
 
     p2m_tlb_flush_sync(p2m);
 
     /* Now check each page for real */
-    for ( i = 0; i < count; i++ )
+    for_each_set_bit ( i, check )
     {
-        if ( !map[i] )
-            continue;
-
-        for ( j = 0; j < (PAGE_SIZE / sizeof(*map[i])); j++ )
-            if ( *(map[i] + j) != 0 )
+        map = map_domain_page(mfns[i]);
+        for ( j = 0; j < (PAGE_SIZE / sizeof(*map)); j++ )
+            if ( map[j] != 0 )
                 break;
-
-        unmap_domain_page(map[i]);
-
-        map[i] = NULL;
+        unmap_domain_page(map);
 
         /*
          * See comment in p2m_pod_zero_check_superpage() re gnttab
          * check timing.
          */
-        if ( j < (PAGE_SIZE / sizeof(*map[i])) )
+        if ( j < (PAGE_SIZE / sizeof(*map)) )
         {
             /*
              * If the previous p2m_set_entry call succeeded, this one shouldn't
@@ -1012,14 +1009,7 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
             {
                 ASSERT_UNREACHABLE();
                 domain_crash(d);
- out_unmap:
-                /*
-                 * Something went wrong, probably crashing the domain.  Unmap
-                 * everything and return.
-                 */
-                for ( i = 0; i < count; i++ )
-                    if ( map[i] )
-                        unmap_domain_page(map[i]);
+                return;
             }
         }
         else
-- 
2.56.0


