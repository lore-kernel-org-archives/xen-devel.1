Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642BCCA6007
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:00:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442175.1659750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNs-0006JX-NV; Wed, 07 Oct 2026 11:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442175.1659750; Wed, 07 Oct 2026 11:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNs-0006HI-IQ; Wed, 07 Oct 2026 11:00:28 +0000
Received: by outflank-mailman (input) for mailman id 1442175;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-0005y3-FD
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:00:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-001bwM-0X;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5I-001QnT-0o;
 Wed, 07 Oct 2026 10:41:16 +0000
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
	bh=uTtFastgCN5QzSIxMSLM2WRMVTyMNwx08i8QJomPSZ4=; b=E/3A8IsJsQ8CdM5jaS3m1u6wCc
	MAfj8CUS0mhwRfZtW0E/DI7wswq0NEUGyP/mGzmDs0gQa8MbsiBpzeVG4BJ4Fl4KTHd/KsRRYK2B7
	OR+YgZwi/PQbLU07SpnvZIXi+fke+SaQGfI+nElTTto0z3tCI092ceDbBw/t7+hO93b8=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 16/18] x86/domain_page: keep the maphash's slots, not their mappings
Date: Wed,  7 Oct 2026 11:40:49 +0100
Message-ID: <20261007104051.48841-17-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unmap_domain_page() keeps a recently unmapped slot in the vCPU's
maphash (MAPHASH_ENTRIES, 8 per vCPU) for a quick remap of the same
MFN, and leaves its PTE in place until the entry is displaced by a later
unmap or reclaimed by a full cache.  Until then the page stays mapped,
although nothing refers to the mapping and the mapcache holds no
reference to the page.  A page freed meanwhile and handed to another
domain stays mapped in the previous user's mapcache: in the vCPU's own
area for a domain with per-vCPU page-tables, in the domain-wide area of
a PV domain, where all of its vCPUs can reach it.

While the full directmap is loaded, that reaches nothing it does not
map anyway.  On the sparse view of the directmap, Xen reaches
domain-heap memory only through mappings made for the purpose, and a
mapping kept in the maphash would leave another domain's page
reachable from a context which has nothing to do with it.

Keep the slot, not the mapping: unmapping the last reference zaps the
PTE and keeps the hash entry, and a later hit maps the page again in the
same slot.  The slot has mapped nothing else in between, so that needs
no flush.  Reusing the slot for another page still goes through the
garbage map, or through the replacement of a hash entry when the cache
is full, both of which flush first.  A translation of the zapped PTE
left in a TLB is covered, for owned pages, by the flush the page
allocator arranges before a freed page is reused wherever a sparse view
is configured ("x86/mm: flush owned pages before reuse with the sparse
directmap view").

The cost is one PTE write per unmap into the maphash and per remap from
it.  A second unmap of an entry in the maphash now finds its PTE not
present and is caught by the check unmap_domain_page() has for entries
the first unmap zapped, rather than by the reference count's ASSERT()
in debug builds only.

The change does not depend on asi= or on a sparse view of the directmap
being configured.  PV vCPUs use the domain-wide mapcache on the default
command line too: in debug builds for every page, in release builds for
pages beyond the reach of the full directmap in their page-tables (5TiB,
3.5TiB with CONFIG_BIGMEM).  For them the change adds the PTE writes
above.  It also leaves up to MAPHASH_ENTRIES fewer pages per vCPU mapped
in the domain-wide area.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- New in this version.
---
 xen/arch/x86/domain_page.c        | 34 +++++++++++++++++++++++--------
 xen/arch/x86/include/asm/domain.h |  5 ++++-
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 48f85b670d..eee66b848c 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -195,6 +195,14 @@ void *map_domain_page(mfn_t mfn)
     {
         idx = hashent->idx;
         ASSERT(idx < cache->entries);
+        /*
+         * An entry the maphash kept holds on to its slot, not to its mapping
+         * (see unmap_domain_page()): map the page again.  No flush is needed,
+         * as the slot has mapped nothing else since.
+         */
+        if ( !hashent->refcnt )
+            l1e_write(&MAPCACHE_L1ENT(idx),
+                      l1e_from_mfn(mfn, __PAGE_HYPERVISOR_RW));
         hashent->refcnt++;
         ASSERT(hashent->refcnt);
         ASSERT(mfn_eq(l1e_get_mfn(MAPCACHE_L1ENT(idx)), mfn));
@@ -227,8 +235,8 @@ void *map_domain_page(mfn_t mfn)
                 if ( hashent->idx != MAPHASHENT_NOTINUSE && !hashent->refcnt )
                 {
                     idx = hashent->idx;
-                    ASSERT(l1e_get_pfn(MAPCACHE_L1ENT(idx)) == hashent->mfn);
-                    l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
+                    ASSERT(!(l1e_get_flags(MAPCACHE_L1ENT(idx)) &
+                             _PAGE_PRESENT));
                     hashent->idx = MAPHASHENT_NOTINUSE;
                     hashent->mfn = ~0UL;
                     break;
@@ -298,25 +306,35 @@ void unmap_domain_page(const void *ptr)
 
     local_irq_save(flags);
 
+    /*
+     * The maphash keeps recently freed slots for a quick remap of the same
+     * page, but not their mappings: the page may change hands meanwhile, and
+     * must not stay reachable from this context then.  A translation left in
+     * a TLB is covered, for owned pages, by the flush the page allocator
+     * arranges before a freed page is handed out again wherever a sparse
+     * directmap view is configured; without one, the directmap maps the page
+     * anyway.
+     */
     if ( hashent->idx == idx )
     {
         ASSERT(hashent->mfn == mfn);
         ASSERT(hashent->refcnt);
         hashent->refcnt--;
+        if ( !hashent->refcnt )
+            l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
     }
     else if ( !hashent->refcnt )
     {
+        /* The entry replaced has no mapping left: mark its slot as garbage. */
         if ( hashent->idx != MAPHASHENT_NOTINUSE )
         {
-            /* /First/, zap the PTE. */
-            ASSERT(l1e_get_pfn(MAPCACHE_L1ENT(hashent->idx)) ==
-                   hashent->mfn);
-            l1e_write(&MAPCACHE_L1ENT(hashent->idx), l1e_empty());
-            /* /Second/, mark as garbage. */
+            ASSERT(!(l1e_get_flags(MAPCACHE_L1ENT(hashent->idx)) &
+                     _PAGE_PRESENT));
             set_bit(hashent->idx, cache->garbage);
         }
 
-        /* Add newly-freed mapping to the maphash. */
+        /* Add the newly-freed slot to the maphash, without its mapping. */
+        l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
         hashent->mfn = mfn;
         hashent->idx = idx;
     }
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 76a22b4040..51741f9d42 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -74,7 +74,10 @@ struct mapcache_vcpu {
     /* Shadow of mapcache_domain.epoch. */
     unsigned int shadow_epoch;
 
-    /* Lock-free per-VCPU hash of recently-used mappings. */
+    /*
+     * Lock-free per-VCPU hash of recently-used mappings.  An entry without
+     * references keeps its slot but not its mapping (see unmap_domain_page()).
+     */
     struct vcpu_maphash_entry {
         unsigned long mfn;
         uint32_t      idx;
-- 
2.55.0


