Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF10CA600B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:00:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442171.1659728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNr-0005z2-Kr; Wed, 07 Oct 2026 11:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442171.1659728; Wed, 07 Oct 2026 11:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNr-0005yv-I1; Wed, 07 Oct 2026 11:00:27 +0000
Received: by outflank-mailman (input) for mailman id 1442171;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-0005y4-CP
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:00:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-001bwE-0E;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5F-001QnT-3A;
 Wed, 07 Oct 2026 10:41:14 +0000
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
	bh=TM6vht0L2x66h0TuR6VE5MmWXE909ZBf8rVHG8TYJUE=; b=WOyYOzYsAKYp3mrMUOmh1+fLW6
	mX0fITo87iQr26jqqSPOH2gVRr4e8mf17UerDfMSQAP9TKX8LdR6sjnAWT5Txoz9PgzSNRWp8ugxd
	uZ2asj2H3zjdeewbgiqWxHmTCbMNKEZSVnUgDtRfW0lHMM/BzLX8wdr2NWGK1ZlqZGNo=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 14/18] x86/domain_page: key the directmap fast paths on the loaded view
Date: Wed,  7 Oct 2026 11:40:47 +0100
Message-ID: <20261007104051.48841-15-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_domain_page() returns directmap addresses whenever it can: for any
MFN the directmap covers in release builds, and for vCPUs without a
mapcache.  Once guest contexts may run on the sparse view of the
directmap, modify this to take the fast path returning the directmap
address only when the full directmap is loaded.

The release-build shortcut ahead of the vCPU lookup looks at the vCPU
whose page-tables are loaded, without completing a lazy context
switch: if that vCPU is not on the sparse view, its page-tables map
the page through the directmap, and completing the switch would only
move the CPU to the idle vCPU's page-tables, which map it too.

mapcache_current_vcpu() may complete the lazy context switch
(sync_local_execstate()) and switch us onto the idle vCPU (which has a
full view), so check again if we can use the directmap afterwards.

A vCPU on the sparse view always has a mapcache: HVM ones through
per-vCPU page-tables, PV ones through the domain-wide mapcache, which
mapcache_domain_init() now sets up for a domain using the sparse view in
release builds too, rather than only when the directmap does not cover
all memory.

map_domain_page_global() mappings must be valid in every context: use
vmap() for all of them once a sparse view is configured, as
arch_mfns_in_directmap() then says.

Add d->arch.sparse_dmap and sparse_dmap_active for this; nothing sets
them yet.

No functional change.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- New in this version.
---
 xen/arch/x86/domain_page.c                  | 44 +++++++++++++++++++--
 xen/arch/x86/include/asm/domain.h           |  6 +++
 xen/arch/x86/include/asm/sparse-directmap.h |  8 ++++
 xen/arch/x86/sparse-directmap.c             |  1 +
 4 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 0500bb9dba..48f85b670d 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -61,6 +61,16 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     return ACCESS_ONCE(this_cpu(pgtable_vcpu));
 }
 
+/*
+ * Whether the directmap in @v's page-tables is the sparse view, which maps
+ * none of the heap's memory beyond the xenheap: the mapcache must serve
+ * every mapping then.
+ */
+static bool on_sparse_dmap(const struct vcpu *v)
+{
+    return sparse_dmap_active && v->domain->arch.sparse_dmap;
+}
+
 /*
  * The accounting for v's mapcache: its own for a vCPU-PT domain, the domain's
  * otherwise, in which case *dcache is set so the caller takes the domain-wide
@@ -142,17 +152,39 @@ void *map_domain_page(mfn_t mfn)
 
 #ifdef NDEBUG
     if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
-        return mfn_to_virt(mfn_x(mfn));
+    {
+        const struct vcpu *pt_vcpu = this_cpu(pgtable_vcpu);
+
+        /*
+         * The page-tables loaded map @mfn through the directmap, unless they
+         * carry the sparse view.  Don't complete a lazy context switch to
+         * find out: it would only move this CPU to the idle vCPU's
+         * page-tables, which map @mfn too.
+         */
+        if ( !pt_vcpu || !on_sparse_dmap(pt_vcpu) )
+            return mfn_to_virt(mfn_x(mfn));
+    }
 #endif
 
+    /* No vCPU (early boot), or no mapcache: the full directmap is loaded. */
     v = mapcache_current_vcpu();
     if ( !v )
         return mfn_to_virt(mfn_x(mfn));
 
+#ifdef NDEBUG
+    /* The lookup may have completed a lazy switch off the sparse view. */
+    if ( !on_sparse_dmap(v) &&
+         mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+        return mfn_to_virt(mfn_x(mfn));
+#endif
+
     cache = vcpu_mapcache(v, &dcache);
     vcache = &v->arch.mapcache;
     if ( !cache->inuse )
+    {
+        ASSERT(!on_sparse_dmap(v));
         return mfn_to_virt(mfn_x(mfn));
+    }
 
     perfc_incr(map_domain_page_count);
 
@@ -307,7 +339,9 @@ void mapcache_domain_init(struct domain *d)
     ASSERT(is_pv_domain(d));
 
 #ifdef NDEBUG
-    if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    /* Not needed when the directmap loaded for the domain covers everything. */
+    if ( !d->arch.sparse_dmap && !mem_hotplug &&
+         max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
         return;
 #endif
 
@@ -392,8 +426,12 @@ void *map_domain_page_global(mfn_t mfn)
              system_state < SYS_STATE_active) ||
             local_irq_is_enabled()));
 
+    /*
+     * Global mappings must hold in every context: a sparse view of the
+     * directmap rules the directmap out.
+     */
 #ifdef NDEBUG
-    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 80415ab2c2..76a22b4040 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -499,6 +499,12 @@ struct arch_domain
      */
     bool vcpu_pt;
 
+    /*
+     * Root page-tables carry the sparse view of the directmap, once it is
+     * active (see asm/sparse-directmap.h).
+     */
+    bool sparse_dmap;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/arch/x86/include/asm/sparse-directmap.h b/xen/arch/x86/include/asm/sparse-directmap.h
index 48c1f3c951..512f8064d6 100644
--- a/xen/arch/x86/include/asm/sparse-directmap.h
+++ b/xen/arch/x86/include/asm/sparse-directmap.h
@@ -22,6 +22,12 @@ extern bool opt_sparse_dmap_pv, opt_sparse_dmap_hvm;
 /* Root of the sparse view, once built (NULL before, or if not configured). */
 extern l4_pgentry_t *sparse_dmap_root;
 
+/*
+ * Set once guest contexts run on the sparse view: from then on, the root
+ * page-tables of domains with d->arch.sparse_dmap carry it.
+ */
+extern bool sparse_dmap_active;
+
 static inline bool sparse_dmap_configured(void)
 {
     return opt_sparse_dmap_pv || opt_sparse_dmap_hvm;
@@ -37,6 +43,8 @@ int sparse_dmap_drop_pagetable(mfn_t mfn);
 
 #else /* !CONFIG_SPARSE_DIRECTMAP */
 
+#define sparse_dmap_active false
+
 static inline bool sparse_dmap_configured(void) { return false; }
 static inline void sparse_dmap_init(void) {}
 static inline int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn,
diff --git a/xen/arch/x86/sparse-directmap.c b/xen/arch/x86/sparse-directmap.c
index 1eb092c3ea..a41731ccfa 100644
--- a/xen/arch/x86/sparse-directmap.c
+++ b/xen/arch/x86/sparse-directmap.c
@@ -57,6 +57,7 @@ bool __ro_after_init opt_sparse_dmap_hvm;
 /* Root of the sparse view: only ever walked and copied from, never loaded. */
 static l4_pgentry_t __aligned(PAGE_SIZE) sparse_l4[L4_PAGETABLE_ENTRIES];
 l4_pgentry_t *__ro_after_init sparse_dmap_root;
+bool __read_mostly sparse_dmap_active;
 
 /*
  * Before the sparse view is built: the MFN ranges handed to the heap, which
-- 
2.55.0


