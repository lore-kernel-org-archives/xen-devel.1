Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6CC606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=xdT15Cba
Received: from list by lists.xenproject.org with outflank-mailman.1497143.1695631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9ik-0002OM-3Q; Thu, 19 Nov 2026 21:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497143.1695631; Thu, 19 Nov 2026 21:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9ii-0002IV-UP; Thu, 19 Nov 2026 21:31:04 +0000
Received: by outflank-mailman (input) for mailman id 1497143;
 Thu, 19 Nov 2026 21:30:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9i0-0001Eb-45
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-00000006tKI-2yO4;
 Thu, 19 Nov 2026 21:30:20 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mf-0000000CVBH-452j;
 Thu, 19 Nov 2026 21:08:18 +0000
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
	bh=HGL2d4pfoMGCE9kjBG8zX8+XeOTokJ943X2UQzHnats=; b=xdT15CbaS/gcv8OMkqN4CSlZlm
	R0yA6pN6alujYDGGtGvpN9y9HEUAxJLVpCTMhZmvHrCL5LfaqmfyGS9W9qYzoe9vyN8lUM+eM5vHb
	6eleOHtDb25wVWacFcS2TZ2PwpRiPAPpcsS8PoW/jr8L758JHVQe4wnLSH/CWZmgLW6M=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 30/50] x86/hvm: introduce per-vCPU mapcache for vCPU-PT domains
Date: Thu, 19 Nov 2026 21:07:21 +0000
Message-ID: <20261119-asi-hvm-v7-30-6551b6d5c879@xenproject.org>
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

Add a struct mapcache to struct mapcache_vcpu for the per-vCPU
accounting, with MAPCACHE_PERVCPU_ENTRIES (64) slots. Its inuse and
garbage bitmaps are then an unsigned long each: declare them inline
in struct mapcache_vcpu, rather than mapping them in the per-domain
area as the domain-wide bitmaps are.

A per-vCPU mapcache is only ever used by its own vCPU, and so by one
pCPU at a time. We can therefore skip both the lock and the TLB-epoch
tracking the domain-wide mapcache needs; a wrap still flushes the
local TLB.

struct mapcache_vcpu grows from 136 to 176 bytes, into padding ahead of
a 64-byte-aligned member of struct arch_vcpu: struct vcpu stays at 2880
bytes (x86_64, debug build).

Unlike a domain-wide mapcache, whose one pool all the domain's vCPUs
draw on, a per-vCPU one cannot, by design, use more than its own
slots: MAPCACHE_PERVCPU_ENTRIES (64) is the most single-page
mappings such a vCPU can hold at once, interrupt handlers' included,
and one more hits the BUG_ON() in map_domain_page(). The PoD
zero-page sweep held up to 16 on top of its callers' until
41ddcfe808ec ("x86/PoD: map one page at a time in
p2m_pod_zero_check()"). A domain-wide
mapcache is sized at MAPCACHE_VCPU_ENTRIES (16) slots per vCPU, in
one shared pool; a per-vCPU one gets 64, for a wider margin. The
extra slots take no memory: the area is a whole L1 page whatever the
number of slots, and each bitmap is still one unsigned long. Wraps,
each of which flushes the local TLB, also come less often.

mapcache_current_vcpu()'s lazy-context-switch handling
(sync_local_execstate() plus a pgtable_vcpu re-read) now applies to
any vCPU with a mapcache: when the idle vCPU runs lazily on an HVM
vCPU's monitor table, the full switch happens before the idle context
uses a mapcache.

In release builds map_domain_page() still tries the directmap first,
for any vCPU; debug builds exercise the new mapcache.

For a vCPU-PT domain, the slots of map_domain_pages() move too: a
vCPU's MAPCACHE_MULTIPAGE_ENTRIES slots are just above the single-page
ones of its own mapcache, and its block of the domain-wide multipage
area is no longer set up.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v7:
- Rebased over map_domain_pages(), which now comes earlier in the
  series: a vCPU-PT domain's multipage slots are above its per-vCPU
  mapcache, as that patch had them.  struct vcpu's size measured
  again.

Changes in v6:
- Message: "x86/PoD: map one page at a time in p2m_pod_zero_check()" is
  in staging now, so cite it by its hash.

Changes in v5:
- Message: a domain-wide mapcache is one pool that all the domain's
  vCPUs draw on, not per-vCPU slots another vCPU could borrow.

Changes in v4:
- d->arch.vcpu_pt is now d->arch.asi.vcpu_pt.
- mapcache_lock() / mapcache_unlock() are now mapcache_enter() /
  mapcache_exit().  has_mapcache()'s comment no longer changes, and the
  early return in mapcache_enter() has a one-line comment instead of a
  sentence added to the block (Roger).
- mapcache_vcpu_init(): ents and nr become assignments here, ents now
  depending on the kind of mapcache (Jan).
- A per-vCPU mapcache gets 64 slots (MAPCACHE_PERVCPU_ENTRIES) in
  place of MAPCACHE_VCPU_ENTRIES (16), which still sizes the
  domain-wide mapcache; its bitmaps, now full, are described as an
  unsigned long each (Roger).
- Move the comment on why a per-vCPU mapcache needs only a local flush
  from map_domain_page()'s TLB flush to mapcache_new_epoch()'s early
  return, as one line (Roger).

Changes in v3:
- HVM only, and per-vCPU from the start: the HVM enablement of "x86:
  Initialize the mapcache for PV, HVM, and idle domains" (from the
  directmap removal series) is folded in, without the idle domain and
  without a domain-wide HVM mapcache.
- Retitle (was: "x86/mm: introduce a per-vCPU mapcache when using ASI").
- Say which second unmaps the not-present check in unmap_domain_page()
  catches: those of an entry the first unmap zapped.
- State the budget of single-page mappings a vCPU can hold at once.
- The mapcache accounting refactor, the move of struct mapcache_vcpu
  to struct arch_vcpu and the not-present check in unmap_domain_page()
  are split out, for review, into the three patches before this one.
---
 xen/arch/x86/domain_page.c        | 74 +++++++++++++++++++++++--------
 xen/arch/x86/include/asm/config.h |  7 ++-
 xen/arch/x86/include/asm/domain.h |  6 +++
 xen/arch/x86/mm.c                 |  8 ++--
 4 files changed, 72 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 1cce58a466..7bd6399ca6 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -22,7 +22,7 @@
 /* Whether the vCPU supports mapcache usage, might not be in use. */
 static bool has_mapcache(const struct vcpu *v)
 {
-    return is_pv_vcpu(v);
+    return is_pv_vcpu(v) || v->domain->arch.asi.vcpu_pt;
 }
 
 /*
@@ -71,14 +71,21 @@ static inline struct vcpu *mapcache_current_vcpu(void)
 }
 
 /*
- * The accounting for v's mapcache: the domain's, with *dcache set so the
- * caller takes the domain-wide lock and TLB-epoch machinery into account.
+ * The accounting for v's mapcache: its own for a vCPU-PT domain, the domain's
+ * otherwise, in which case *dcache is set so the caller takes the domain-wide
+ * lock and TLB-epoch machinery into account.
  */
 static struct mapcache *vcpu_mapcache(struct vcpu *v,
                                       struct mapcache_domain **dcache)
 {
     struct domain *d = v->domain;
 
+    if ( d->arch.asi.vcpu_pt )
+    {
+        *dcache = NULL;
+        return &v->arch.mapcache.cache;
+    }
+
     *dcache = &d->arch.pv.mapcache;
     return &(*dcache)->cache;
 }
@@ -86,6 +93,10 @@ static struct mapcache *vcpu_mapcache(struct vcpu *v,
 static void mapcache_enter(struct mapcache_domain *dcache,
                            struct mapcache_vcpu *vcache)
 {
+    /* Only its own vCPU uses a per-vCPU mapcache: no lock or epoch needed. */
+    if ( !dcache )
+        return;
+
     /* The domain's vCPUs share the mapcache's slots. */
     spin_lock(&dcache->lock);
 
@@ -105,6 +116,10 @@ static void mapcache_enter(struct mapcache_domain *dcache,
 static void mapcache_new_epoch(struct mapcache_domain *dcache,
                                struct mapcache_vcpu *vcache)
 {
+    /* Per-vCPU: no epoch, as page-table loads flush its non-global entries. */
+    if ( !dcache )
+        return;
+
     ASSERT(spin_is_locked(&dcache->lock));
 
     vcache->shadow_epoch = ++dcache->epoch;
@@ -113,7 +128,8 @@ static void mapcache_new_epoch(struct mapcache_domain *dcache,
 
 static void mapcache_exit(struct mapcache_domain *dcache)
 {
-    spin_unlock(&dcache->lock);
+    if ( dcache )
+        spin_unlock(&dcache->lock);
 }
 
 #define mapcache_l2_entry(e) ((e) >> PAGETABLE_ORDER)
@@ -285,11 +301,15 @@ void unmap_domain_page(const void *ptr)
 }
 
 /*
- * The mapcache index of @v's first map_domain_pages() slot: at its stride of
- * the multipage area.
+ * The mapcache index of @v's first map_domain_pages() slot: above the
+ * single-page slots of its own mapcache with per-vCPU page tables, otherwise
+ * at its stride of the domain-wide multipage area.
  */
 static unsigned int multipage_first_slot(const struct vcpu *v)
 {
+    if ( v->domain->arch.asi.vcpu_pt )
+        return MAPCACHE_PERVCPU_ENTRIES;
+
     return PFN_DOWN(MAPCACHE_MULTIPAGE_START(v) - MAPCACHE_VIRT_START);
 }
 
@@ -426,13 +446,12 @@ int mapcache_vcpu_init(struct vcpu *v)
     struct mapcache_domain *dcache;
     struct mapcache *cache;
     unsigned long i;
-    unsigned int ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
-    unsigned int nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
+    unsigned int ents, nr;
 
     BUILD_BUG_ON(MAPCACHE_MULTIPAGE_ENTRIES > BITS_PER_LONG);
 
-    /* The vCPU's stride of the multipage area. */
-    if ( !is_idle_domain(d) )
+    /* Without per-vCPU page tables, the vCPU's stride of the multipage area. */
+    if ( !is_idle_domain(d) && !d->arch.asi.vcpu_pt )
     {
         int rc = create_perdomain_mapping(v, MAPCACHE_MULTIPAGE_START(v),
                                           MAPCACHE_MULTIPAGE_ENTRIES,
@@ -446,22 +465,41 @@ int mapcache_vcpu_init(struct vcpu *v)
         return 0;
 
     cache = vcpu_mapcache(v, &dcache);
-    if ( !cache->inuse )
+    if ( !dcache )
+    {
+        BUILD_BUG_ON(MAPCACHE_PERVCPU_ENTRIES + MAPCACHE_MULTIPAGE_ENTRIES >
+                     MAPCACHE_ENTRIES);
+
+        /* Per-vCPU bitmaps are an unsigned long each, in the vCPU itself. */
+        cache->inuse = v->arch.mapcache.inuse;
+        cache->garbage = v->arch.mapcache.garbage;
+        ents = MAPCACHE_PERVCPU_ENTRIES;
+    }
+    else if ( !cache->inuse )
         return 0;
+    else
+        ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
+
+    nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
 
     if ( ents > cache->entries )
     {
-        /* Populate page tables. */
-        int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents,
+        /* Populate page tables, a per-vCPU cache's multipage slots included. */
+        int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START,
+                                          ents + (dcache ? 0
+                                                  : MAPCACHE_MULTIPAGE_ENTRIES),
                                           NIL(l1_pgentry_t *), NULL);
 
-        /* Populate bit maps. */
-        if ( !rc )
+        /* Populate the domain-wide bit maps (kept in the per-domain area). */
+        if ( !rc && dcache )
+        {
             rc = create_perdomain_mapping(v, (unsigned long)cache->inuse,
                                           nr, NULL, NIL(struct page_info *));
-        if ( !rc )
-            rc = create_perdomain_mapping(v, (unsigned long)cache->garbage,
-                                          nr, NULL, NIL(struct page_info *));
+            if ( !rc )
+                rc = create_perdomain_mapping(v, (unsigned long)cache->garbage,
+                                              nr, NULL,
+                                              NIL(struct page_info *));
+        }
 
         if ( rc )
             return rc;
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index cea4cd4662..5768b6efe3 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -279,7 +279,12 @@ extern unsigned long xen_phys_start;
 
 /* map_domain_page() map cache. The second per-domain-mapping sub-area. */
 #define MAPCACHE_VCPU_ENTRIES    (CONFIG_PAGING_LEVELS * CONFIG_PAGING_LEVELS)
-/* Multipage slots of each vCPU, at its stride of the multipage area. */
+/* Single-page slots of a per-vCPU mapcache (vCPU-PT domains). */
+#define MAPCACHE_PERVCPU_ENTRIES 64
+/*
+ * Multipage slots of each vCPU: above the single-page ones of a per-vCPU
+ * mapcache, otherwise at the vCPU's stride of the multipage area.
+ */
 #define MAPCACHE_MULTIPAGE_ORDER    3
 #define MAPCACHE_MULTIPAGE_ENTRIES  (1U << MAPCACHE_MULTIPAGE_ORDER)
 #define MAPCACHE_ENTRIES         (MAX_VIRT_CPUS * MAPCACHE_VCPU_ENTRIES)
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index d2515cd01a..5084848730 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -77,6 +77,12 @@ struct mapcache_vcpu {
         uint32_t      idx;
         uint32_t      refcnt;
     } hash[MAPHASH_ENTRIES];
+
+    /* Accounting of a per-vCPU mapcache (vCPU-PT domains). */
+    struct mapcache cache;
+    /* Backing for cache.{inuse,garbage}. */
+    DECLARE_BITMAP(inuse, MAPCACHE_PERVCPU_ENTRIES);
+    DECLARE_BITMAP(garbage, MAPCACHE_PERVCPU_ENTRIES);
 };
 
 struct mapcache_domain {
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d1fc57cf82..8900cde2d0 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6538,10 +6538,10 @@ void unmap_vcpu_state(const struct vcpu *v, unsigned int idx, unsigned int nr)
  * Drop a transient mapping of a page behind a vCPU's state window, and this
  * CPU's translations of it: at its address, and at its alias in the
  * per-domain mirror, which every domain but a 64-bit PV one has (flushing
- * that address there is harmless).  The mapcache does not drop them with
- * the slot's last mapping: it defers the flush, and CPUs running other vCPUs
- * of its domain may have cached the slot too.  A directmap address, where
- * the caller has no mapcache, needs nothing.
+ * that address there is harmless).  Neither kind of mapcache drops them with
+ * the slot's last mapping: each defers the flush, and CPUs running other
+ * vCPUs of the domain may have cached a domain-wide one's slot too.  A
+ * directmap address, where the caller has no mapcache, needs nothing.
  */
 void unmap_vcpu_state_page(const void *va)
 {
-- 
2.56.0


