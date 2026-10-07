Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C5BCA600A
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:00:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442172.1659733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNr-00061S-R7; Wed, 07 Oct 2026 11:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442172.1659733; Wed, 07 Oct 2026 11:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNr-00060h-NC; Wed, 07 Oct 2026 11:00:27 +0000
Received: by outflank-mailman (input) for mailman id 1442172;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-0005y7-DU
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:00:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-001bwS-0k;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5D-001QnT-2H;
 Wed, 07 Oct 2026 10:41:11 +0000
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
	bh=s8gKbLWFi6wgE9b8CopwbaynqyW9W4JENY9bvZeWPyQ=; b=RTJdZXiZ9hOcVUqeIYc0rzDHem
	KQEr6odiA8Vib09s/JCjysCQbx64bRWAttC2MnHSmlc88ttE/AMeAuvsIE0ZjTB4UDMIwGXBe9NYK
	sU1kymKGSoxusls3hoNU0qAaY83+5HX8cx7oASKlMn+2PFkUDmepItVd6NeNSe1c0B50=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 12/18] x86/mm: let Xen's page-table walker operate on a given root
Date: Wed,  7 Oct 2026 11:40:45 +0100
Message-ID: <20261007104051.48841-13-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_pages_to_xen() and modify_xen_mappings() maintain Xen's own mappings,
walking from idle_pg_table, whose Xen slots every other root page-table
copies.  A later patch introduces a second directmap hierarchy: page
tables for the directmap virtual address range that some guest contexts
use in place of idle_pg_table's.  It needs the same maintenance at the
same virtual addresses.

Give virt_to_xen_l{3,2,1}e() the L4 to walk from, and move the bodies of
map_pages_to_xen() and modify_xen_mappings() into map_pages_in() and
modify_mappings_in(), which take the root as well.  The public functions
pass idle_pg_table.  The EFI runtime-services page-tables mirror
idle_pg_table's L4 entries only, so a newly allocated L3 is propagated
to them only when the root is idle_pg_table.

TLB flushing is unaffected: it is by virtual address, and the same
addresses are mapped in either hierarchy.

No functional change.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- New in this version.
---
 xen/arch/x86/mm.c | 55 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 7258935528..94b96c3d9b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5201,13 +5201,14 @@ static DEFINE_SPINLOCK(map_pgdir_lock);
 
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
@@ -5223,7 +5224,8 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
             l4_pgentry_t l4e = l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
 
             l4e_write(pl4e, l4e);
-            efi_update_l4_pgtable(l4_table_offset(v), l4e);
+            if ( root == idle_pg_table )
+                efi_update_l4_pgtable(l4_table_offset(v), l4e);
             l3mfn = INVALID_MFN;
         }
         if ( locking )
@@ -5234,11 +5236,11 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
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
 
@@ -5272,11 +5274,11 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
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
 
@@ -5352,7 +5354,7 @@ mfn_t xen_map_to_mfn(unsigned long va)
     bool locking = system_state > SYS_STATE_boot;
     unsigned int l2_offset = l2_table_offset(va);
     unsigned int l1_offset = l1_table_offset(va);
-    const l3_pgentry_t *pl3e = virt_to_xen_l3e(va);
+    const l3_pgentry_t *pl3e = virt_to_xen_l3e(idle_pg_table, va);
     const l2_pgentry_t *pl2e = NULL;
     const l1_pgentry_t *pl1e = NULL;
     struct page_info *l3page;
@@ -5392,7 +5394,12 @@ mfn_t xen_map_to_mfn(unsigned long va)
     return ret;
 }
 
-int map_pages_to_xen(
+/*
+ * map_pages_to_xen() in the hierarchy rooted at @root: idle_pg_table's, or
+ * another hierarchy sharing its virtual addresses.
+ */
+static int map_pages_in(
+    l4_pgentry_t *root,
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
@@ -5443,7 +5450,7 @@ int map_pages_to_xen(
         UNMAP_DOMAIN_PAGE(pl3e);
         UNMAP_DOMAIN_PAGE(pl2e);
 
-        pl3e = virt_to_xen_l3e(virt);
+        pl3e = virt_to_xen_l3e(root, virt);
         if ( !pl3e )
             goto out;
 
@@ -5567,7 +5574,7 @@ int map_pages_to_xen(
             free_xen_pagetable(l2mfn);
         }
 
-        pl2e = virt_to_xen_l2e(virt);
+        pl2e = virt_to_xen_l2e(root, virt);
         if ( !pl2e )
             goto out;
 
@@ -5612,7 +5619,7 @@ int map_pages_to_xen(
             /* Normal page mapping. */
             if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
             {
-                pl1e = virt_to_xen_l1e(virt);
+                pl1e = virt_to_xen_l1e(root, virt);
                 if ( pl1e == NULL )
                     goto out;
             }
@@ -5797,6 +5804,15 @@ int map_pages_to_xen(
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
@@ -5813,8 +5829,12 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
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
@@ -5841,7 +5861,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
         UNMAP_DOMAIN_PAGE(pl2e);
         UNMAP_DOMAIN_PAGE(pl3e);
 
-        pl3e = virt_to_xen_l3e(v);
+        pl3e = virt_to_xen_l3e(root, v);
         if ( !pl3e )
             goto out;
 
@@ -6092,6 +6112,11 @@ int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
 
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
2.55.0


