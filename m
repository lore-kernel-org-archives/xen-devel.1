Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B47606A319
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=0/spY6nD
Received: from list by lists.xenproject.org with outflank-mailman.1454839.1668416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS4-0004g1-6g; Mon, 19 Oct 2026 19:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454839.1668416; Mon, 19 Oct 2026 19:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS3-0004cT-Rm; Mon, 19 Oct 2026 19:55:19 +0000
Received: by outflank-mailman (input) for mailman id 1454839;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-0003ha-KT
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022zJ-34G7;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGn-00000001FjN-09tA;
 Mon, 19 Oct 2026 19:43:41 +0000
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
	bh=KIMuN+gRzQ2bf6n6qCzbyKF+T+td17QWHkd6BfMjllw=; b=0/spY6nDQijmbovDb1WpQiYZ8m
	d2R+DPchyj5phcApmFz5PjEZcDTGwmmv06NMT9R8BzCYeCd0kegJnMACDtxqjeXVgml0TgedsDwPM
	Fv9U769D1bjWa45owU+3eQ2aYcGBiH+y1DB27EN10mhIH7y+eKV1lxqt4aINsXiijiq4=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 24/30] x86/mm: introduce a per-vCPU state window in the perdomain area
Date: Mon, 19 Oct 2026 20:42:55 +0100
Message-ID: <20261019-asi-hvm-v4-24-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Under Address Space Isolation, guest-owned register state that Xen
keeps in always-mapped memory moves to the domain heap, mapped only in
the contexts that use it.  The long-lived per-vCPU structures involved
(the SVM VMCB, the VMX guest MSR load/save list, the guest XSAVE area,
and later the aggregated small per-vCPU allocations) all want the same
shape: one or more domain-heap pages, mapped once at fixed per-vCPU
virtual addresses for the life of the vCPU.

Add a fourth per-domain-mapping sub-area providing that destination: a
small per-vCPU stride of page slots, with a fixed index assigned to
each relocated structure and the page tables created at vCPU creation
time.  Consumers allocate their own pages and install them with
populate_perdomain_mapping(); the backing pages remain caller-owned,
so their lifetime stays with the consumer, while the page tables are
torn down with the rest of the perdomain area.

Before freeing their pages, consumers take them out of the window with
unmap_vcpu_state(), on failure paths as at teardown: vCPU creation can
fail once a consumer has mapped its pages, and the domain lives on.
It flushes the domain's dirty CPUs, which include every CPU whose
page-tables carry the window, in the vCPU's own area or in the shared
one; so far that mask is empty on every call, as the vCPU has not run
or the domain is paused.  A consumer reaching a page from another
context, through a transient map_domain_page() mapping, drops the
mapping with unmap_vcpu_state_page(), which also flushes this CPU's
translations of it, there and at its alias in the per-domain mirror:
a domain-wide mapcache defers that flush, and the translations would
otherwise outlive the mapping.

For a domain running without per-vCPU page tables the window has the
same domain-wide visibility as the other perdomain sub-areas: the
virtual addresses are keyed on vcpu_id, so the same VA arithmetic
serves both modes.  With vcpu-pt enabled, a vCPU's window is simply
absent from its siblings' address spaces.

This is infrastructure for moving the SVM VMCB, the VMX MSR load/save
lists and the guest XSAVE areas off always-mapped memory.  Nothing
occupies the area yet; the only behavioural change is the page-table
allocation itself and the failure path that comes with it: vCPU
creation can now fail with -ENOMEM.  Both apply to every guest vCPU,
with or without asi=, PV ones included.  A domain with per-vCPU page
tables gets an L2 and an L1 per vCPU; any other domain, every PV domain
among them, one L2 plus an L1 per 64 vCPUs: 2 pages for up to 64 vCPUs.
A PV domain's window stays empty until the XSAVE areas move there.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- New in this version.
---
 xen/arch/x86/domain.c             | 12 +++++++++
 xen/arch/x86/include/asm/config.h | 21 ++++++++++++++-
 xen/arch/x86/include/asm/mm.h     |  2 ++
 xen/arch/x86/mm.c                 | 44 +++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7a4da203d4..04868a781e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -525,6 +525,18 @@ int arch_vcpu_create(struct vcpu *v)
         if ( rc )
             goto fail;
 
+        BUILD_BUG_ON((MAX_VIRT_CPUS << VCPU_STATE_VA_SHIFT) >
+                     (PERDOMAIN_SLOT_MBYTES << 20));
+        BUILD_BUG_ON(VCPU_STATE_IDX_VMCB >= VCPU_STATE_NR_PAGES);
+        BUILD_BUG_ON(VCPU_STATE_IDX_N2VMCB >= VCPU_STATE_NR_PAGES);
+        BUILD_BUG_ON(VCPU_STATE_IDX_VMX_MSR >= VCPU_STATE_NR_PAGES);
+        /* Page tables only; torn down with the rest of the perdomain area. */
+        rc = create_perdomain_mapping(v, VCPU_STATE_START(v),
+                                      VCPU_STATE_NR_PAGES,
+                                      NIL(l1_pgentry_t *), NULL);
+        if ( rc != 0 )
+            goto fail;
+
         paging_vcpu_init(v);
 
         if ( (rc = vcpu_init_fpu(v)) != 0 )
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index ee84c57432..8a265e25c8 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -158,7 +158,7 @@
 /* Slot 260: per-domain mappings (including map cache). */
 #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
 #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_ORDER))
-#define PERDOMAIN_SLOTS         3
+#define PERDOMAIN_SLOTS         4
 #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
                                  (PERDOMAIN_SLOT_MBYTES << 20))
 /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
@@ -293,6 +293,25 @@ extern unsigned long xen_phys_start;
 #define ARG_XLAT_START(v)        \
     (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
 
+/*
+ * Per-vCPU state window. The fourth per-domain-mapping sub-area: a small
+ * per-vCPU stride of page slots holding long-lived per-vCPU structures kept
+ * out of always-mapped memory, each mapped once for the life of the vCPU at
+ * a fixed index within the stride.
+ */
+#define VCPU_STATE_SLOT          3
+#define VCPU_STATE_VIRT_START    PERDOMAIN_VIRT_SLOT(VCPU_STATE_SLOT)
+#define VCPU_STATE_ORDER         3
+#define VCPU_STATE_NR_PAGES      (1U << VCPU_STATE_ORDER)
+#define VCPU_STATE_VA_SHIFT      (VCPU_STATE_ORDER + PAGE_SHIFT)
+#define VCPU_STATE_START(v)      \
+    (VCPU_STATE_VIRT_START + ((v)->vcpu_id << VCPU_STATE_VA_SHIFT))
+#define VCPU_STATE_ADDR(v, idx)  \
+    (VCPU_STATE_START(v) + (idx) * PAGE_SIZE)
+#define VCPU_STATE_IDX_VMCB      0
+#define VCPU_STATE_IDX_N2VMCB    1
+#define VCPU_STATE_IDX_VMX_MSR   2
+
 #define ELFSIZE 64
 
 #define ARCH_CRASH_SAVE_VMCOREINFO
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 6d50e17259..6eaea3ba01 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -625,6 +625,8 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 unsigned int flags);
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
+void unmap_vcpu_state(const struct vcpu *v, unsigned int idx, unsigned int nr);
+void unmap_vcpu_state_page(const void *va);
 void free_perdomain_mappings(struct domain *d);
 void free_pervcpu_mappings(struct vcpu *v);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index bf029df566..9c9f3e728c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6668,6 +6668,50 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
     unmap_domain_page(l3tab);
 }
 
+/*
+ * Take @nr slots of @v's state window, from @idx, out of the per-domain
+ * area, before the caller frees the pages behind them: the pages are the
+ * caller's own, and must not stay mapped once freed.  The window's
+ * translations are usable only on CPUs whose page-tables carry it, all in
+ * the domain's dirty mask: with per-vCPU page-tables, the CPU running v or
+ * holding it lazily; otherwise, those of any of the domain's vCPUs.
+ */
+void unmap_vcpu_state(const struct vcpu *v, unsigned int idx, unsigned int nr)
+{
+    const struct domain *d = v->domain;
+
+    /* Beyond the stride is the next vCPU's window, in a shared area. */
+    BUG_ON(idx >= VCPU_STATE_NR_PAGES || nr > VCPU_STATE_NR_PAGES - idx);
+
+    destroy_perdomain_mapping(v, VCPU_STATE_ADDR(v, idx), nr);
+
+    flush_tlb_mask(d->dirty_cpumask);
+}
+
+/*
+ * Drop a transient mapping of a page behind a vCPU's state window, and this
+ * CPU's translations of it: at its address, and at its alias in the
+ * per-domain mirror, which every domain but a 64-bit PV one has (flushing
+ * that address there is harmless).  A per-vCPU mapcache flushes both
+ * already, with the slot's last mapping; a domain-wide one defers the
+ * flush, and CPUs running other vCPUs of its domain may have cached the
+ * slot too.  A directmap address, where the caller has no mapcache, needs
+ * nothing.
+ */
+void unmap_vcpu_state_page(const void *va)
+{
+    unsigned long addr = (unsigned long)va;
+
+    unmap_domain_page(va);
+
+    if ( addr < DIRECTMAP_VIRT_START )
+    {
+        flush_tlb_one_local(addr);
+        flush_tlb_one_local(addr - PERDOMAIN_VIRT_START +
+                            PERDOMAIN_ALT_VIRT_START);
+    }
+}
+
 static void free_perdomain_l3(struct page_info *l3pg)
 {
     l3_pgentry_t *l3tab = __map_domain_page(l3pg);
-- 
2.55.0


