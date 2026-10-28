Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E76606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=gQRWe4tY
Received: from list by lists.xenproject.org with outflank-mailman.1463801.1674702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6e-000823-8j; Wed, 28 Oct 2026 23:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463801.1674702; Wed, 28 Oct 2026 23:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6c-0007tU-Ow; Wed, 28 Oct 2026 23:30:54 +0000
Received: by outflank-mailman (input) for mailman id 1463801;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00049B-3Q
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00000000pQF-0wHy;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjK-00000001KpM-2C4W;
 Wed, 28 Oct 2026 23:06:50 +0000
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
	bh=OyV4YAPF4e+PZiLpSD0A+0i1GRo90xWbIXsdeH11W3w=; b=gQRWe4tYspPm+HvX4TgDpN28XP
	ca4RJADHHXUhU95j7CeZS5UO9XT30wVrX18XNtPymEQQsJfQn1LspmGz/r1A8VBT7gEjPlZyyQuBb
	bkkaldyKuWY8j4IcxZnvqWjCTxGEvlRF1YmgIbgVbqQQiw4KU5zFLOvgSkiQQJ/FKAEQ=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 14/45] x86/hvm: introduce per-vCPU mapcache for vCPU-PT domains
Date: Wed, 28 Oct 2026 23:05:28 +0000
Message-ID: <20261028-asi-hvm-v5-14-13b908e0df0b@xenproject.org>
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

Add a struct mapcache to struct mapcache_vcpu for the per-vCPU
accounting, with MAPCACHE_PERVCPU_ENTRIES (64) slots. Its inuse and
garbage bitmaps are then an unsigned long each: declare them inline
in struct mapcache_vcpu, rather than mapping them in the per-domain
area as the domain-wide bitmaps are.

A per-vCPU mapcache is only ever used by its own vCPU, and so by one
pCPU at a time. We can therefore skip both the lock and the TLB-epoch
tracking the domain-wide mapcache needs; a wrap still flushes the
local TLB.

struct mapcache_vcpu grows from 136 to 176 bytes, and struct vcpu from
3008 to 3072 bytes (x86_64, debug build), within its page.

Unlike a domain-wide mapcache, whose one pool all the domain's vCPUs
draw on, a per-vCPU one cannot, by design, use more than its own
slots: MAPCACHE_PERVCPU_ENTRIES (64) is the most single-page
mappings such a vCPU can hold at once, interrupt handlers' included,
and one more hits the BUG_ON() in map_domain_page(). The PoD
zero-page sweep held up to 16 on top of its callers' until "x86/PoD:
map one page at a time in p2m_pod_zero_check()". A domain-wide
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

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
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
 xen/arch/x86/domain_page.c        | 61 +++++++++++++++++++++++--------
 xen/arch/x86/include/asm/config.h |  2 +
 xen/arch/x86/include/asm/domain.h |  6 +++
 3 files changed, 53 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 47ccefa4e9..770fee80a4 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -21,7 +21,7 @@
 /* Whether the vCPU supports mapcache usage, might not be in use. */
 static bool has_mapcache(const struct vcpu *v)
 {
-    return is_pv_vcpu(v);
+    return is_pv_vcpu(v) || v->domain->arch.asi.vcpu_pt;
 }
 
 static inline struct vcpu *mapcache_current_vcpu(void)
@@ -34,10 +34,10 @@ static inline struct vcpu *mapcache_current_vcpu(void)
         return NULL;
 
     /*
-     * If we are in a lazy context-switch state from a PV vCPU do a full switch
-     * to the idle vCPU now, otherwise an incoming FLUSH_VCPU_STATE IPI would
-     * change the page tables under our feet an invalidate any in-use mapcache
-     * entries.
+     * If we are in a lazy context-switch state from a vCPU with a mapcache do
+     * a full switch to the idle vCPU now, otherwise an incoming
+     * FLUSH_VCPU_STATE IPI would change the page tables under our feet and
+     * invalidate any in-use mapcache entries.
      */
     if ( unlikely(this_cpu(curr_vcpu) != curr) )
     {
@@ -57,14 +57,21 @@ static inline struct vcpu *mapcache_current_vcpu(void)
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
@@ -72,6 +79,10 @@ static struct mapcache *vcpu_mapcache(struct vcpu *v,
 static void mapcache_enter(struct mapcache_domain *dcache,
                            struct mapcache_vcpu *vcache)
 {
+    /* Only its own vCPU uses a per-vCPU mapcache: no lock or epoch needed. */
+    if ( !dcache )
+        return;
+
     /* The domain's vCPUs share the mapcache's slots. */
     spin_lock(&dcache->lock);
 
@@ -91,6 +102,10 @@ static void mapcache_enter(struct mapcache_domain *dcache,
 static void mapcache_new_epoch(struct mapcache_domain *dcache,
                                struct mapcache_vcpu *vcache)
 {
+    /* Per-vCPU: no epoch, as page-table loads flush its non-global entries. */
+    if ( !dcache )
+        return;
+
     ASSERT(spin_is_locked(&dcache->lock));
 
     vcache->shadow_epoch = ++dcache->epoch;
@@ -99,7 +114,8 @@ static void mapcache_new_epoch(struct mapcache_domain *dcache,
 
 static void mapcache_exit(struct mapcache_domain *dcache)
 {
-    spin_unlock(&dcache->lock);
+    if ( dcache )
+        spin_unlock(&dcache->lock);
 }
 
 #define mapcache_l2_entry(e) ((e) >> PAGETABLE_ORDER)
@@ -299,15 +315,25 @@ int mapcache_vcpu_init(struct vcpu *v)
     struct mapcache_domain *dcache;
     struct mapcache *cache;
     unsigned long i;
-    unsigned int ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
-    unsigned int nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
+    unsigned int ents, nr;
 
     if ( !has_mapcache(v) )
         return 0;
 
     cache = vcpu_mapcache(v, &dcache);
-    if ( !cache->inuse )
+    if ( !dcache )
+    {
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
@@ -315,13 +341,16 @@ int mapcache_vcpu_init(struct vcpu *v)
         int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents,
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
index aebd3e8f45..ee84c57432 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -279,6 +279,8 @@ extern unsigned long xen_phys_start;
 
 /* map_domain_page() map cache. The second per-domain-mapping sub-area. */
 #define MAPCACHE_VCPU_ENTRIES    (CONFIG_PAGING_LEVELS * CONFIG_PAGING_LEVELS)
+/* Single-page slots of a per-vCPU mapcache (vCPU-PT domains). */
+#define MAPCACHE_PERVCPU_ENTRIES 64
 #define MAPCACHE_ENTRIES         (MAX_VIRT_CPUS * MAPCACHE_VCPU_ENTRIES)
 #define MAPCACHE_VIRT_START      PERDOMAIN_VIRT_SLOT(1)
 #define MAPCACHE_VIRT_END        (MAPCACHE_VIRT_START + \
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 45d308407e..7076e38848 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -80,6 +80,12 @@ struct mapcache_vcpu {
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
-- 
2.56.0


