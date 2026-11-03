Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686C5606D806
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=H0D515jY
Received: from list by lists.xenproject.org with outflank-mailman.1470809.1679584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONy3-0005mO-Jc; Tue, 03 Nov 2026 23:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470809.1679584; Tue, 03 Nov 2026 23:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONy1-0005cJ-FR; Tue, 03 Nov 2026 23:31:01 +0000
Received: by outflank-mailman (input) for mailman id 1470809;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000e2-Hj
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000000CovU-1Q6V;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONnz-0000000EMFa-0qxf;
 Tue, 03 Nov 2026 23:20:39 +0000
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
	bh=q/qAmagFc51kjK9l6VNA/qd139u3x0RJhFQgQhsvBr0=; b=H0D515jYxLVoIp5Z8X3NjblJ3Z
	WyIh54JUx1ENVuehDiLvIXhgK8EiqTzF4wO7hk4xiklLTsu7BvH9nWOGH8aJRtRL44QNRPKwTWccp
	cRL63PE7PWz+akQrObCLp5nzMdjAtVY0nw/c3ang53KLEGiPjwFq5Kf1vD2dF+dtzwLY=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 20/44] x86/mm: run guest contexts on the sparse directmap view
Date: Tue,  3 Nov 2026 17:13:42 -0500
Message-ID: <20261103-asi-hvm-v6-20-59dbc5ce9615@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In _init_xen_l4_slots(), if d->arch.asi.sparse_dmap is set, point the
directmap slots at the sparse view, copying from idle_pg_table only
the Xen slots below them.  A root page-table not shared with a PV
guest gets no extended directmap, which the sparse view does not
cover.

d->arch.asi.sparse_dmap is decided at domain creation: PV domains all
have a mapcache, HVM domains need per-vCPU page-tables for one.  No
option asks for the sparse view yet.

The sparse view is built before any domain is created, so the root
page-tables of every domain using it carry it from their creation,
dom0's included.  Dom0's builders reach dom0's memory only through guest
virtual addresses and map_domain_page().  In PV shim mode,
replace_va_mapping() reads the guest's L4 through the directmap; map it
with map_domain_page() instead, as the lower levels already are.  Shadow
L4s, dom0=shadow's included, get the sparse view from
init_xen_l4_slots_pv().

The two directmaps differ where the sparse view leaves memory out, so no
translation of the full directmap may remain usable on page-tables
carrying the sparse view.  Directmap mappings stay global nevertheless:
every CR3 write which can move a CPU onto the sparse view goes through
switch_cr3_cr4(), which flushes the old page-tables' translations,
global entries included, before it returns.  The CR3 writes which keep
entries -- a PV vCPU's switch between its kernel and user page-tables,
XPTI's entry and exit -- stay within one vCPU's page-tables, which carry
the same directmap, or go to XPTI's per-CPU root, which maps only Xen's
own per-CPU pages there.  Removals from the sparse view are flushed on
every CPU, global entries included.  PV guests that run with global
pages, among them a PV dom0 not using the sparse view, therefore keep
their directmap TLB entries across switches between guest kernel and
user mode.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v6:
- Port onto new dual-init_xen_l4_slots system.

Changes in v4:
- d->arch.vcpu_pt and d->arch.sparse_dmap are now d->arch.asi.vcpu_pt
  and d->arch.asi.sparse_dmap.
- Drop sparse_dmap_active and sparse_dmap_activate(): root page-tables
  carry the sparse view from their creation, dom0's included (Roger).
- The sparse view's slots are now marked NX in "x86/mm: build and
  maintain a sparse view of the directmap".
- PV shim: replace_va_mapping() maps the guest's L4 with
  map_domain_page().
- Give sparse_dmap_wanted() its hardware-domain case (Roger).
- init_xen_l4_slots() takes the directmap slots from the sparse view,
  rather than copying the full directmap's and overwriting them;
  sparse_dmap_install() goes (Roger).
- Message: drop the sentence on NX (Roger).

Changes in v3:
- New in this version.
---
 xen/arch/x86/include/asm/sparse-directmap.h |  9 +++++++
 xen/arch/x86/mm.c                           | 28 +++++++++++++++++++--
 xen/arch/x86/pv/shim.c                      |  4 ++-
 xen/arch/x86/spec_ctrl.c                    |  7 ++++++
 4 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/sparse-directmap.h b/xen/arch/x86/include/asm/sparse-directmap.h
index ea14d44334..2f8b94f4c1 100644
--- a/xen/arch/x86/include/asm/sparse-directmap.h
+++ b/xen/arch/x86/include/asm/sparse-directmap.h
@@ -31,6 +31,14 @@ static inline bool sparse_dmap_configured(void)
     return opt_sparse_dmap_pv || opt_sparse_dmap_hvm || opt_sparse_dmap_hwdom;
 }
 
+/* Whether a new domain of the given type is to use the sparse view. */
+static inline bool sparse_dmap_wanted(bool pv, bool hwdom)
+{
+    return sparse_dmap_root &&
+           (hwdom ? opt_sparse_dmap_hwdom
+                  : pv ? opt_sparse_dmap_pv : opt_sparse_dmap_hvm);
+}
+
 void sparse_dmap_init(void);
 int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn, unsigned long nr,
                            pte_attr_t flags);
@@ -42,6 +50,7 @@ int sparse_dmap_drop_pagetable(mfn_t mfn);
 #else /* !CONFIG_SPARSE_DIRECTMAP */
 
 static inline bool sparse_dmap_configured(void) { return false; }
+static inline bool sparse_dmap_wanted(bool pv, bool hwdom) { return false; }
 static inline void sparse_dmap_init(void) {}
 static inline int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn,
                                          unsigned long nr, pte_attr_t flags)
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0d475432ff..36a241a41c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1704,7 +1704,8 @@ struct page_info *perdomain_l3(const struct vcpu *v)
  * l4t, l4mfn, and d are mandatory, but l4mfn doesn't need to be the mfn under
  * *l4t.  All other parameters are optional and will either fill or zero the
  * appropriate slots.  Pagetables not shared with guests will gain the
- * extended directmap.
+ * extended directmap, unless the domain runs on the sparse view of the
+ * directmap, which replaces the directmap slots.
  */
 static void _init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
                                const struct domain *d,
@@ -1713,7 +1714,7 @@ static void _init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
 {
     /*
      * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
-     * directmap.
+     * directmap, unless the domain runs on the sparse view (below).
      */
     bool short_directmap = !paging_mode_external(d);
 
@@ -1748,6 +1749,29 @@ static void _init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
             l4t[l4_table_offset(PERDOMAIN_VIRT_START)];
 
     /* Slot 261-: text/data/bss, RW M2P, vmap, frametable, directmap. */
+#ifdef CONFIG_SPARSE_DIRECTMAP
+    if ( d->arch.asi.sparse_dmap )
+    {
+        unsigned int i = l4_table_offset(SPARSE_DMAP_START);
+
+        memcpy(&l4t[l4_table_offset(XEN_VIRT_START)],
+               &idle_pg_table[l4_table_offset(XEN_VIRT_START)],
+               (i - l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
+
+        /*
+         * Every slot the sparse view covers gets its L3, whatever the full
+         * directmap has there, so that memory added later is covered too.  A
+         * PV root has guest slots above; any other root loses the rest of the
+         * directmap, which the sparse view does not cover.
+         */
+        for ( ; i < l4_table_offset(SPARSE_DMAP_END); i++ )
+            l4t[i] = sparse_dmap_root[i];
+        if ( !short_directmap )
+            for ( ; i < l4_table_offset(DIRECTMAP_VIRT_END); i++ )
+                l4t[i] = l4e_empty();
+    }
+    else
+#endif
 #ifndef NDEBUG
     if ( short_directmap &&
          unlikely(root_pgt_pv_xen_slots < ROOT_PAGETABLE_PV_XEN_SLOTS) )
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 41000b0523..2a47dbc56c 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -148,12 +148,14 @@ const struct platform_bad_page *__init pv_shim_reserved_pages(unsigned int *size
 static void __init replace_va_mapping(struct domain *d, l4_pgentry_t *l4start,
                                       unsigned long va, mfn_t mfn)
 {
-    l4_pgentry_t l4e = l4start[l4_table_offset(va)];
+    const l4_pgentry_t *l4t = map_domain_page(virt_to_mfn(l4start));
+    l4_pgentry_t l4e = l4t[l4_table_offset(va)];
     l3_pgentry_t l3e = l3e_from_l4e(l4e, l3_table_offset(va));
     l2_pgentry_t l2e = l2e_from_l3e(l3e, l2_table_offset(va));
     l1_pgentry_t *pl1e = map_l1t_from_l2e(l2e) + l1_table_offset(va);
     struct page_info *page = mfn_to_page(l1e_get_mfn(*pl1e));
 
+    unmap_domain_page(l4t);
     put_page_and_type(page);
 
     *pl1e = l1e_from_mfn(mfn, (!is_pv_32bit_domain(d) ? L1_PROT
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 8797523a62..bcdcdf0476 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1953,6 +1953,13 @@ void spec_ctrl_init_domain(struct domain *d)
 
     d->arch.asi.vcpu_pt = !pv && (is_hardware_domain(d) ? opt_vcpu_pt_hwdom
                                                         : opt_vcpu_pt_hvm);
+
+    /*
+     * The sparse directmap view needs a mapcache: PV domains all have one,
+     * HVM domains through per-vCPU page-tables.
+     */
+    d->arch.asi.sparse_dmap = (pv || d->arch.asi.vcpu_pt) &&
+                              sparse_dmap_wanted(pv, is_hardware_domain(d));
 }
 
 void __init init_speculation_mitigations(void)
-- 
2.56.0


