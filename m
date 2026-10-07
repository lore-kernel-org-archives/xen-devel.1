Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F1DCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:41:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442106.1659682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP5B-0007cF-L3; Wed, 07 Oct 2026 10:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442106.1659682; Wed, 07 Oct 2026 10:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP5B-0007bw-HU; Wed, 07 Oct 2026 10:41:09 +0000
Received: by outflank-mailman (input) for mailman id 1442106;
 Wed, 07 Oct 2026 10:41:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEP5A-0007Tq-3D
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:41:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5A-001bj0-01;
 Wed, 07 Oct 2026 10:41:08 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP59-001QnT-2n;
 Wed, 07 Oct 2026 10:41:07 +0000
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
	bh=dhqUQmvZLvbJ486b5VhpqBi7A5iX71jVcCO1Kn2eJgk=; b=Oux8bGxlk0zuVswcqf2KM8B1xF
	qPJZf1b1rdYN1TRjZZy7yzL/qU9OLjTt2xD/bE79ikYVkc4o3Tpip4VDlmqIju3EeWbuxlzRr7rVj
	fqjl3Bo3eE+S/kuzK5eQxi9TJTUUgvsSsf530NRrAolbf6TMQQJtCtrI6zPL6EOFyA1Y=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 08/18] x86/domain_page: prepare the mapcache for per-vCPU accounting
Date: Wed,  7 Oct 2026 11:40:41 +0100
Message-ID: <20261007104051.48841-9-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

Currently, only PV domains have a mapcache, which is domain-wide one.
In preparation for enabling per-vCPU mapcaches for HVM domains, split
the accounting out into a struct mapcache, embedded in struct
mapcache_domain.

Introduce has_mapcache(), for whether a vCPU has a mapcache, and
vcpu_mapcache(), which returns the accounting for a vCPU's mapcache
and, in *dcache, the domain-wide mapcache whose lock and TLB epoch the
caller has to take into account.  For now has_mapcache() is
is_pv_vcpu(), and vcpu_mapcache() always returns the domain's
accounting.  map_domain_page() and unmap_domain_page() stop repeating
the is_pv_vcpu() check mapcache_current_vcpu() has made.

Move map_domain_page()'s handling of the domain-wide lock and TLB epoch
into three helpers: mapcache_lock() takes the lock and catches up with
a wrap another vCPU caused, mapcache_new_epoch() starts a new epoch
after a wrap, and mapcache_unlock() drops the lock.  A per-vCPU
mapcache can then skip them without map_domain_page() being
re-indented.

struct mapcache_domain keeps its size (40 bytes, x86_64 debug build),
and so do the structures containing it.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- New in this version, split out of "x86/hvm: introduce per-vCPU
  mapcache for vCPU-PT domains" for review.
---
 xen/arch/x86/domain_page.c        | 155 ++++++++++++++++++++----------
 xen/arch/x86/include/asm/domain.h |  19 ++--
 2 files changed, 116 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 9119f735f5..5d90f77bed 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -18,17 +18,23 @@
 #include <asm/hardirq.h>
 #include <asm/setup.h>
 
+/*
+ * Whether v has a mapcache: PV vCPUs (whose domain-wide mapcache may still be
+ * disabled, see mapcache_domain_init()).  HVM vCPUs reach everything through
+ * the directmap, which covers all physical address space for them.
+ */
+static bool has_mapcache(const struct vcpu *v)
+{
+    return is_pv_vcpu(v);
+}
+
 static inline struct vcpu *mapcache_current_vcpu(void)
 {
     struct vcpu *v = this_cpu(pgtable_vcpu);
     struct vcpu *curr = current;
 
-    /*
-     * During early boot pgtable_vcpu is not set, callers must handle NULL.
-     * Non-PV domains don't have a mapcache, the directmap covers all physical
-     * address space.
-     */
-    if ( !v || !is_pv_vcpu(v) )
+    /* During early boot pgtable_vcpu is not set, callers must handle NULL. */
+    if ( !v || !has_mapcache(v) )
         return NULL;
 
     /*
@@ -54,6 +60,55 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     return ACCESS_ONCE(this_cpu(pgtable_vcpu));
 }
 
+/*
+ * The accounting for v's mapcache: the domain's, with *dcache set so the
+ * caller takes the domain-wide lock and TLB-epoch machinery into account.
+ */
+static struct mapcache *vcpu_mapcache(struct vcpu *v,
+                                      struct mapcache_domain **dcache)
+{
+    struct domain *d = v->domain;
+
+    *dcache = &d->arch.pv.mapcache;
+    return &(*dcache)->cache;
+}
+
+/*
+ * The domain-wide mapcache's lock and TLB-epoch machinery, taken around
+ * allocating a slot: the domain's vCPUs share the mapcache's slots, and each
+ * catches up with a wrap another one caused, flushing its TLB if it has not
+ * been flushed since.
+ */
+static void mapcache_lock(struct mapcache_domain *dcache,
+                          struct mapcache_vcpu *vcache)
+{
+    spin_lock(&dcache->lock);
+
+    /* Has some other CPU caused a wrap? We must flush if so. */
+    if ( unlikely(dcache->epoch != vcache->shadow_epoch) )
+    {
+        vcache->shadow_epoch = dcache->epoch;
+        if ( NEED_FLUSH(this_cpu(tlbflush_time), dcache->tlbflush_timestamp) )
+        {
+            perfc_incr(domain_page_tlb_flush);
+            flush_tlb_local();
+        }
+    }
+}
+
+/* A wrap has just flushed this CPU's TLB: start a new epoch. */
+static void mapcache_new_epoch(struct mapcache_domain *dcache,
+                               struct mapcache_vcpu *vcache)
+{
+    vcache->shadow_epoch = ++dcache->epoch;
+    dcache->tlbflush_timestamp = tlbflush_current_time();
+}
+
+static void mapcache_unlock(struct mapcache_domain *dcache)
+{
+    spin_unlock(&dcache->lock);
+}
+
 #define mapcache_l2_entry(e) ((e) >> PAGETABLE_ORDER)
 #define MAPCACHE_L2_ENTRIES (mapcache_l2_entry(MAPCACHE_ENTRIES - 1) + 1)
 #define MAPCACHE_L1ENT(idx) \
@@ -66,6 +121,7 @@ void *map_domain_page(mfn_t mfn)
     struct vcpu *v;
     struct mapcache_domain *dcache;
     struct mapcache_vcpu *vcache;
+    struct mapcache *cache;
     struct vcpu_maphash_entry *hashent;
 
 #ifdef NDEBUG
@@ -74,12 +130,12 @@ void *map_domain_page(mfn_t mfn)
 #endif
 
     v = mapcache_current_vcpu();
-    if ( !v || !is_pv_vcpu(v) )
+    if ( !v )
         return mfn_to_virt(mfn_x(mfn));
 
-    dcache = &v->domain->arch.pv.mapcache;
+    cache = vcpu_mapcache(v, &dcache);
     vcache = &v->arch.pv.mapcache;
-    if ( !dcache->inuse )
+    if ( !cache->inuse )
         return mfn_to_virt(mfn_x(mfn));
 
     perfc_incr(map_domain_page_count);
@@ -90,41 +146,30 @@ void *map_domain_page(mfn_t mfn)
     if ( hashent->mfn == mfn_x(mfn) )
     {
         idx = hashent->idx;
-        ASSERT(idx < dcache->entries);
+        ASSERT(idx < cache->entries);
         hashent->refcnt++;
         ASSERT(hashent->refcnt);
         ASSERT(mfn_eq(l1e_get_mfn(MAPCACHE_L1ENT(idx)), mfn));
         goto out;
     }
 
-    spin_lock(&dcache->lock);
-
-    /* Has some other CPU caused a wrap? We must flush if so. */
-    if ( unlikely(dcache->epoch != vcache->shadow_epoch) )
-    {
-        vcache->shadow_epoch = dcache->epoch;
-        if ( NEED_FLUSH(this_cpu(tlbflush_time), dcache->tlbflush_timestamp) )
-        {
-            perfc_incr(domain_page_tlb_flush);
-            flush_tlb_local();
-        }
-    }
+    mapcache_lock(dcache, vcache);
 
-    idx = find_next_zero_bit(dcache->inuse, dcache->entries, dcache->cursor);
-    if ( unlikely(idx >= dcache->entries) )
+    idx = find_next_zero_bit(cache->inuse, cache->entries, cache->cursor);
+    if ( unlikely(idx >= cache->entries) )
     {
         unsigned long accum = 0, prev = 0;
 
         /* /First/, clean the garbage map and update the inuse list. */
-        for ( i = 0; i < BITS_TO_LONGS(dcache->entries); i++ )
+        for ( i = 0; i < BITS_TO_LONGS(cache->entries); i++ )
         {
             accum |= prev;
-            dcache->inuse[i] &= ~xchg(&dcache->garbage[i], 0);
-            prev = ~dcache->inuse[i];
+            cache->inuse[i] &= ~xchg(&cache->garbage[i], 0);
+            prev = ~cache->inuse[i];
         }
 
-        if ( accum | (prev & BITMAP_LAST_WORD_MASK(dcache->entries)) )
-            idx = find_first_zero_bit(dcache->inuse, dcache->entries);
+        if ( accum | (prev & BITMAP_LAST_WORD_MASK(cache->entries)) )
+            idx = find_first_zero_bit(cache->inuse, cache->entries);
         else
         {
             /* Replace a hash entry instead. */
@@ -144,19 +189,18 @@ void *map_domain_page(mfn_t mfn)
                     i = 0;
             } while ( i != MAPHASH_HASHFN(mfn_x(mfn)) );
         }
-        BUG_ON(idx >= dcache->entries);
+        BUG_ON(idx >= cache->entries);
 
         /* /Second/, flush TLBs. */
         perfc_incr(domain_page_tlb_flush);
         flush_tlb_local();
-        vcache->shadow_epoch = ++dcache->epoch;
-        dcache->tlbflush_timestamp = tlbflush_current_time();
+        mapcache_new_epoch(dcache, vcache);
     }
 
-    set_bit(idx, dcache->inuse);
-    dcache->cursor = idx + 1;
+    set_bit(idx, cache->inuse);
+    cache->cursor = idx + 1;
 
-    spin_unlock(&dcache->lock);
+    mapcache_unlock(dcache);
 
     l1e_write(&MAPCACHE_L1ENT(idx), l1e_from_mfn(mfn, __PAGE_HYPERVISOR_RW));
 
@@ -170,6 +214,7 @@ void unmap_domain_page(const void *ptr)
     unsigned int idx;
     struct vcpu *v;
     struct mapcache_domain *dcache;
+    struct mapcache *cache;
     unsigned long va = (unsigned long)ptr, mfn, flags;
     struct vcpu_maphash_entry *hashent;
 
@@ -179,10 +224,10 @@ void unmap_domain_page(const void *ptr)
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
 
     v = mapcache_current_vcpu();
-    ASSERT(v && is_pv_vcpu(v));
+    ASSERT(v);
 
-    dcache = &v->domain->arch.pv.mapcache;
-    ASSERT(dcache->inuse);
+    cache = vcpu_mapcache(v, &dcache);
+    ASSERT(cache->inuse);
 
     idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
     mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
@@ -205,7 +250,7 @@ void unmap_domain_page(const void *ptr)
                    hashent->mfn);
             l1e_write(&MAPCACHE_L1ENT(hashent->idx), l1e_empty());
             /* /Second/, mark as garbage. */
-            set_bit(hashent->idx, dcache->garbage);
+            set_bit(hashent->idx, cache->garbage);
         }
 
         /* Add newly-freed mapping to the maphash. */
@@ -217,7 +262,7 @@ void unmap_domain_page(const void *ptr)
         /* /First/, zap the PTE. */
         l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
         /* /Second/, mark as garbage. */
-        set_bit(idx, dcache->garbage);
+        set_bit(idx, cache->garbage);
     }
 
     local_irq_restore(flags);
@@ -239,9 +284,9 @@ void mapcache_domain_init(struct domain *d)
                  2 * PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long))) >
                  MAPCACHE_VIRT_START + (PERDOMAIN_SLOT_MBYTES << 20));
     bitmap_pages = PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long));
-    dcache->inuse = (void *)MAPCACHE_VIRT_END + PAGE_SIZE;
-    dcache->garbage = dcache->inuse +
-                      (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
+    dcache->cache.inuse = (void *)MAPCACHE_VIRT_END + PAGE_SIZE;
+    dcache->cache.garbage = dcache->cache.inuse +
+                            (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
 
     spin_lock_init(&dcache->lock);
 }
@@ -249,15 +294,23 @@ void mapcache_domain_init(struct domain *d)
 int mapcache_vcpu_init(struct vcpu *v)
 {
     struct domain *d = v->domain;
-    struct mapcache_domain *dcache = &d->arch.pv.mapcache;
+    struct mapcache_domain *dcache;
+    struct mapcache *cache;
     unsigned long i;
-    unsigned int ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
-    unsigned int nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
+    unsigned int ents, nr;
 
-    if ( !is_pv_vcpu(v) || !dcache->inuse )
+    if ( !has_mapcache(v) )
         return 0;
 
-    if ( ents > dcache->entries )
+    cache = vcpu_mapcache(v, &dcache);
+    if ( !cache->inuse )
+        /* Domain-wide mapcache disabled (fully direct-mapped build). */
+        return 0;
+
+    ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
+    nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
+
+    if ( ents > cache->entries )
     {
         /* Populate page tables. */
         int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents,
@@ -265,16 +318,16 @@ int mapcache_vcpu_init(struct vcpu *v)
 
         /* Populate bit maps. */
         if ( !rc )
-            rc = create_perdomain_mapping(v, (unsigned long)dcache->inuse,
+            rc = create_perdomain_mapping(v, (unsigned long)cache->inuse,
                                           nr, NULL, NIL(struct page_info *));
         if ( !rc )
-            rc = create_perdomain_mapping(v, (unsigned long)dcache->garbage,
+            rc = create_perdomain_mapping(v, (unsigned long)cache->garbage,
                                           nr, NULL, NIL(struct page_info *));
 
         if ( rc )
             return rc;
 
-        dcache->entries = ents;
+        cache->entries = ents;
     }
 
     /* Mark all maphash entries as not in use. */
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index a6c6eaf53a..6f5873879e 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -57,6 +57,16 @@ struct trap_bounce {
     unsigned long eip;
 };
 
+struct mapcache {
+    /* The number of array entries, and a cursor into the array. */
+    unsigned int entries;
+    unsigned int cursor;
+
+    /* Which mappings are in use, and which are garbage to reap next epoch? */
+    unsigned long *inuse;
+    unsigned long *garbage;
+};
+
 #define MAPHASH_ENTRIES 8
 #define MAPHASH_HASHFN(pfn) ((pfn) & (MAPHASH_ENTRIES-1))
 #define MAPHASHENT_NOTINUSE ((u32)~0U)
@@ -73,10 +83,6 @@ struct mapcache_vcpu {
 };
 
 struct mapcache_domain {
-    /* The number of array entries, and a cursor into the array. */
-    unsigned int entries;
-    unsigned int cursor;
-
     /* Protects map_domain_page(). */
     spinlock_t lock;
 
@@ -84,9 +90,8 @@ struct mapcache_domain {
     unsigned int epoch;
     u32 tlbflush_timestamp;
 
-    /* Which mappings are in use, and which are garbage to reap next epoch? */
-    unsigned long *inuse;
-    unsigned long *garbage;
+    /* Accounting of the domain-wide mapcache. */
+    struct mapcache cache;
 };
 
 void mapcache_domain_init(struct domain *d);
-- 
2.55.0


