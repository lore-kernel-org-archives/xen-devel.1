Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804F9C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:49:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405527.1639017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1haf-000728-EO; Wed, 02 Sep 2026 09:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405527.1639017; Wed, 02 Sep 2026 09:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1haf-000721-Bn; Wed, 02 Sep 2026 09:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1405527;
 Wed, 02 Sep 2026 09:49:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1had-00071X-HH
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:49:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hac-003afr-UC
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:49:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97f10a-bab6-0a2a0a5309dd-0a2a45029afe-20
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:49:06 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-720697.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-6ca4-0a2a45020019-d99ba50ce8c0-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id 7AC9C36928EF; Wed,  2 Sep 2026 10:44:06 +0100 (BST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: George Dunlap <dunlapg@umich.edu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 09/14] x86/mm: prepare destroy_perdomain_mapping() for per-vCPU perdomain areas
Date: Wed,  2 Sep 2026 10:43:53 +0100
Message-ID: <20260901-asi-part2-9-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788342246-F1CAA2AC-EC0435F5/0/0
X-purgate-type: clean
X-purgate-size: 5444

From: Roger Pau Monné <roger.pau@citrix.com>

We want to change per-domain mappings to be per-vCPU mappings.  In
preparation for that, we want to arrange that
destroy_perdomain_mapping() work either with a single perdomain area,
or with a per-vCPU perdomain area.

The remaining callers are already in a vCPU context, so we just need
to change the parameter from a domain pointer to a vCPU pointer.

Since we now have a specific vCPU in mind, we have the option of using
the linear page table mapping rather than map-and-walk.  As in
populate_perdomain_mapping(), the linear page table fast path is keyed
off this_cpu(pgtable_vcpu) matching the target vCPU, which is the
conditional that implies "the linear mapping area points to v's
per-domain area".

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- Added to the series

Changes since the previously posted version:
- Key the fast path off pgtable_vcpu instead of current, matching
  populate_perdomain_mapping(), and drop the sync_local_execstate()
  call.
- Also convert the pv_destroy_ldt() call, added by the stash-removal
  batch.
- Reword and retitle for clarity (was: "x86/mm: switch
  destroy_perdomain_mapping() parameter from domain to vCPU").
---
 xen/arch/x86/include/asm/mm.h       |  2 +-
 xen/arch/x86/mm.c                   | 23 ++++++++++++++++++++++-
 xen/arch/x86/pv/descriptor-tables.c |  2 +-
 xen/arch/x86/pv/domain.c            |  3 +--
 xen/arch/x86/x86_64/mm.c            |  2 +-
 5 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 30eaec9179..9a8fda782e 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -605,7 +605,7 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
 void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 const mfn_t *mfn, unsigned int nr,
                                 unsigned int flags);
-void destroy_perdomain_mapping(struct domain *d, unsigned long va,
+void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 48d1b427c5..fc524ef0c3 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6456,10 +6456,11 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
     local_irq_restore(irq_flags);
 }
 
-void destroy_perdomain_mapping(struct domain *d, unsigned long va,
+void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr)
 {
     const l3_pgentry_t *l3tab, *pl3e;
+    const struct domain *d = v->domain;
 
     ASSERT(va >= PERDOMAIN_VIRT_START &&
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
@@ -6468,6 +6469,26 @@ void destroy_perdomain_mapping(struct domain *d, unsigned long va,
     if ( !d->arch.perdomain_l3_pg )
         return;
 
+    if ( likely(this_cpu(pgtable_vcpu) == v) )
+    {
+        l1_pgentry_t *pl1e;
+
+        /*
+         * Fast path: v's page-tables are loaded on this pCPU, so the L1
+         * entries can be zapped using the recursive linear mappings.
+         */
+        pl1e = &__linear_l1_table[l1_linear_offset(va)];
+
+        for ( ; nr--; pl1e++ )
+        {
+            if ( perdomain_l1e_needs_freeing(*pl1e) )
+                free_domheap_page(l1e_get_page(*pl1e));
+            l1e_write(pl1e, l1e_empty());
+        }
+
+        return;
+    }
+
     l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
     pl3e = l3tab + l3_table_offset(va);
 
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 261bf29c90..0c1ea4ce3a 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -27,7 +27,7 @@ bool pv_destroy_ldt(struct vcpu *v)
 
     ASSERT(v == current || !vcpu_cpu_dirty(v));
 
-    destroy_perdomain_mapping(v->domain, LDT_VIRT_START(v), nr_frames);
+    destroy_perdomain_mapping(v, LDT_VIRT_START(v), nr_frames);
 
     for ( i = 0; i < nr_frames; i++ )
     {
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index b936ca9b26..40b834e1a4 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -319,8 +319,7 @@ static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 
 static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
 {
-    destroy_perdomain_mapping(v->domain, GDT_VIRT_START(v),
-                              1U << GDT_LDT_VCPU_SHIFT);
+    destroy_perdomain_mapping(v, GDT_VIRT_START(v), 1U << GDT_LDT_VCPU_SHIFT);
 }
 
 void pv_vcpu_destroy(struct vcpu *v)
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index ffeda06e08..aa74acec82 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -738,7 +738,7 @@ int setup_compat_arg_xlat(struct vcpu *v)
 
 void free_compat_arg_xlat(struct vcpu *v)
 {
-    destroy_perdomain_mapping(v->domain, ARG_XLAT_START(v),
+    destroy_perdomain_mapping(v, ARG_XLAT_START(v),
                               PFN_UP(COMPAT_ARG_XLAT_SIZE));
 }
 
-- 
2.55.0


