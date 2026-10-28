Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E978606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=R1Kya5KS
Received: from list by lists.xenproject.org with outflank-mailman.1463792.1674613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6R-0005Pu-G1; Wed, 28 Oct 2026 23:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463792.1674613; Wed, 28 Oct 2026 23:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6Q-0005NJ-Qs; Wed, 28 Oct 2026 23:30:42 +0000
Received: by outflank-mailman (input) for mailman id 1463792;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00048M-Rj
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00000000pP8-41Eh;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjL-00000001KpM-1nmm;
 Wed, 28 Oct 2026 23:06:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=nAVXITYKBWjP/mczkyb/Slf4KhG5mPyW4p/IRHHh7AM=; b=R1Kya5KSrFacKoY00DDWtzx7bW
	tAmkAY/EoompgfcR81/oNuur1sy93tUAFg1v9rtTX2ICqqCAZ/obLR+ZAcAb3L/YGwVUf8hzKUG2J
	rgHAJZq9Csw7I7IxpT4smNVAuHkk9kmTWW2i3ZJshS84nXrLoloW4t6W7bra2spvmbaI=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 15/45] x86/mm: let Xen's page-table walker operate on a given root
Date: Wed, 28 Oct 2026 23:05:29 +0000
Message-ID: <20261028-asi-hvm-v5-15-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

map_pages_to_xen() and modify_xen_mappings() maintain Xen's own
mappings, walking from idle_pg_table, whose Xen slots every other root
page-table copies.  A later patch introduces a second, sparse directmap
hierarchy: page tables for the directmap virtual address range that some
guest contexts use in place of idle_pg_table's.  It needs the same
maintenance at the same virtual addresses.

Give virt_to_xen_l{3,2,1}e() the L4 to walk from, and move the bodies of
map_pages_to_xen() and modify_xen_mappings() into map_pages_in() and
modify_mappings_in(), which take the root as well.  The public functions
pass idle_pg_table.  The EFI runtime-services page-tables mirror
idle_pg_table's L4 entries only, so a newly allocated L3 is propagated
to them only when the root is idle_pg_table.

map_pages_in() and modify_mappings_in() free page-table pages through
free_pagetable_in(), which takes the root too and for now only calls
free_xen_pagetable().

TLB flushing is unaffected: flushes are by virtual address and go to
every online CPU, which covers both hierarchies.

No functional change.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- Free page-table pages through free_pagetable_in(), for now a plain
  wrapper, split out of "x86/mm: build and maintain a sparse view of the
  directmap".

Changes in v4:
- Message: name the second hierarchy as sparse; flushes reach every CPU
  (Roger).

Changes in v3:
- New in this version.
---
 xen/arch/x86/mm.c | 78 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 6e3b1c4c7d..4bfb690017 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5230,13 +5230,14 @@ static DEFINE_SPINLOCK(map_pgdir_lock);
 
 /*
  * For virt_to_xen_lXe() functions, they take a linear address and return a
- * pointer to Xen's LX entry. Caller needs to unmap the pointer.
+ * pointer to Xen's LX entry in the page-table hierarchy rooted at @root
+ * (idle_pg_table for Xen's own mappings).  Caller needs to unmap the pointer.
  */
-static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
+static l3_pgentry_t *virt_to_xen_l3e(l4_pgentry_t *root, unsigned long v)
 {
     l4_pgentry_t *pl4e;
 
-    pl4e = &idle_pg_table[l4_table_offset(v)];
+    pl4e = &root[l4_table_offset(v)];
     if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
@@ -5252,7 +5253,8 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
             l4_pgentry_t l4e = l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
 
             l4e_write(pl4e, l4e);
-            efi_update_l4_pgtable(l4_table_offset(v), l4e);
+            if ( root == idle_pg_table )
+                efi_update_l4_pgtable(l4_table_offset(v), l4e);
             l3mfn = INVALID_MFN;
         }
         if ( locking )
@@ -5263,11 +5265,11 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
     return map_l3t_from_l4e(*pl4e) + l3_table_offset(v);
 }
 
-static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
+static l2_pgentry_t *virt_to_xen_l2e(l4_pgentry_t *root, unsigned long v)
 {
     l3_pgentry_t *pl3e, l3e;
 
-    pl3e = virt_to_xen_l3e(v);
+    pl3e = virt_to_xen_l3e(root, v);
     if ( !pl3e )
         return NULL;
 
@@ -5301,11 +5303,11 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
     return map_l2t_from_l3e(l3e) + l2_table_offset(v);
 }
 
-static l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
+static l1_pgentry_t *virt_to_xen_l1e(l4_pgentry_t *root, unsigned long v)
 {
     l2_pgentry_t *pl2e, l2e;
 
-    pl2e = virt_to_xen_l2e(v);
+    pl2e = virt_to_xen_l2e(root, v);
     if ( !pl2e )
         return NULL;
 
@@ -5381,7 +5383,7 @@ mfn_t xen_map_to_mfn(unsigned long va)
     bool locking = system_state > SYS_STATE_boot;
     unsigned int l2_offset = l2_table_offset(va);
     unsigned int l1_offset = l1_table_offset(va);
-    const l3_pgentry_t *pl3e = virt_to_xen_l3e(va);
+    const l3_pgentry_t *pl3e = virt_to_xen_l3e(idle_pg_table, va);
     const l2_pgentry_t *pl2e = NULL;
     const l1_pgentry_t *pl1e = NULL;
     struct page_info *l3page;
@@ -5421,7 +5423,21 @@ mfn_t xen_map_to_mfn(unsigned long va)
     return ret;
 }
 
-int map_pages_to_xen(
+/*
+ * Free a page-table page that the hierarchy rooted at @root has stopped
+ * using.
+ */
+static void free_pagetable_in(const l4_pgentry_t *root, mfn_t mfn)
+{
+    free_xen_pagetable(mfn);
+}
+
+/*
+ * map_pages_to_xen() in the hierarchy rooted at @root: idle_pg_table's, or
+ * another hierarchy sharing its virtual addresses.
+ */
+static int map_pages_in(
+    l4_pgentry_t *root,
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
@@ -5472,7 +5488,7 @@ int map_pages_to_xen(
         UNMAP_DOMAIN_PAGE(pl3e);
         UNMAP_DOMAIN_PAGE(pl2e);
 
-        pl3e = virt_to_xen_l3e(virt);
+        pl3e = virt_to_xen_l3e(root, virt);
         if ( !pl3e )
             goto out;
 
@@ -5525,10 +5541,10 @@ int map_pages_to_xen(
                         ol2e = l2t[i];
                         if ( (l2e_get_flags(ol2e) & _PAGE_PRESENT) &&
                              !(l2e_get_flags(ol2e) & _PAGE_PSE) )
-                            free_xen_pagetable(l2e_get_mfn(ol2e));
+                            free_pagetable_in(root, l2e_get_mfn(ol2e));
                     }
                     unmap_domain_page(l2t);
-                    free_xen_pagetable(l3e_get_mfn(ol3e));
+                    free_pagetable_in(root, l3e_get_mfn(ol3e));
                 }
             }
 
@@ -5596,7 +5612,7 @@ int map_pages_to_xen(
             free_xen_pagetable(l2mfn);
         }
 
-        pl2e = virt_to_xen_l2e(virt);
+        pl2e = virt_to_xen_l2e(root, virt);
         if ( !pl2e )
             goto out;
 
@@ -5626,7 +5642,7 @@ int map_pages_to_xen(
                         flush_flags(l1e_get_flags(l1t[i]));
                     flush_area(virt, flush_flags);
                     unmap_domain_page(l1t);
-                    free_xen_pagetable(l2e_get_mfn(ol2e));
+                    free_pagetable_in(root, l2e_get_mfn(ol2e));
                 }
             }
 
@@ -5641,7 +5657,7 @@ int map_pages_to_xen(
             /* Normal page mapping. */
             if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
             {
-                pl1e = virt_to_xen_l1e(virt);
+                pl1e = virt_to_xen_l1e(root, virt);
                 if ( pl1e == NULL )
                     goto out;
             }
@@ -5758,7 +5774,7 @@ int map_pages_to_xen(
                     flush_area(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
-                    free_xen_pagetable(l2e_get_mfn(ol2e));
+                    free_pagetable_in(root, l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
                     spin_unlock(&map_pgdir_lock);
@@ -5805,7 +5821,7 @@ int map_pages_to_xen(
                 flush_area(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
-                free_xen_pagetable(l3e_get_mfn(ol3e));
+                free_pagetable_in(root, l3e_get_mfn(ol3e));
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5826,6 +5842,15 @@ int map_pages_to_xen(
     return rc;
 }
 
+int map_pages_to_xen(
+    unsigned long virt,
+    mfn_t mfn,
+    unsigned long nr_mfns,
+    pte_attr_t flags)
+{
+    return map_pages_in(idle_pg_table, virt, mfn, nr_mfns, flags);
+}
+
 int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return map_pages_to_xen(virt, INVALID_MFN, nr_mfns, MAP_SMALL_PAGES);
@@ -5842,8 +5867,12 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  * flags are ignored.
  *
  * It is an error to call with present flags over an unpopulated range.
+ *
+ * modify_mappings_in() does so in the hierarchy rooted at @root, as
+ * map_pages_in() does.
  */
-int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
+static int modify_mappings_in(l4_pgentry_t *root, unsigned long s,
+                              unsigned long e, pte_attr_t nf)
 {
     bool locking = system_state > SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
@@ -5870,7 +5899,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
         UNMAP_DOMAIN_PAGE(pl2e);
         UNMAP_DOMAIN_PAGE(pl3e);
 
-        pl3e = virt_to_xen_l3e(v);
+        pl3e = virt_to_xen_l3e(root, v);
         if ( !pl3e )
             goto out;
 
@@ -6053,7 +6082,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l1mfn);
+                free_pagetable_in(root, l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -6097,7 +6126,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l2mfn);
+                free_pagetable_in(root, l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -6121,6 +6150,11 @@ int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
 
 #undef flush_area
 
+int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
+{
+    return modify_mappings_in(idle_pg_table, s, e, nf);
+}
+
 int destroy_xen_mappings(unsigned long s, unsigned long e)
 {
     return modify_xen_mappings(s, e, _PAGE_NONE);
-- 
2.56.0


