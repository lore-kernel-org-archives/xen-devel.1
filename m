Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092A606D814
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=PejvEQ5O
Received: from list by lists.xenproject.org with outflank-mailman.1470801.1679497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxl-0002XH-JA; Tue, 03 Nov 2026 23:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470801.1679497; Tue, 03 Nov 2026 23:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxl-0002RV-04; Tue, 03 Nov 2026 23:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1470801;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000dC-8n
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000000Couu-0oEt;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONo3-0000000EMFa-0hqE;
 Tue, 03 Nov 2026 23:20:43 +0000
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
	bh=bXTFHOrcLhUOodXtLyqMdEEiIJaFfjlDFEIJV1YrfvQ=; b=PejvEQ5O3VI5tzJZp2wI//NpQ2
	m+Ot+wXdCQWCAa1tBiuo2FktJtMbdK/nYweFNsEpGmGhDnVkMe8BLymF+CFsNp6iaPscRKz4AKkC4
	trz+cw4sGR/stbOAXVZoBYqpbi+aWRZ86/U/XFt5lfVPobCuP/UZx/mVgsVDWluuFDOs=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 25/44] x86/mm: introduce a per-vCPU state window in the perdomain area
Date: Tue,  3 Nov 2026 17:13:47 -0500
Message-ID: <20261103-asi-hvm-v6-25-59dbc5ce9615@xenproject.org>
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
torn down with the rest of the per-domain area.

Before freeing their pages, consumers take them out of the window with
unmap_vcpu_state(), on failure paths as at teardown: vCPU creation can
fail once a consumer has mapped its pages, and the domain lives on.
It flushes the domain's dirty CPUs, which include every CPU whose
page-tables carry the window, in the vCPU's own per-domain area or in
the one its domain's vCPUs share; so far that mask is empty on every
call, as the vCPU has not run or the domain is paused.  A consumer
reaching a page from another context, through a transient
map_domain_page() mapping, drops the mapping with
unmap_vcpu_state_page(), which also flushes this CPU's translations of
it, there and at its alias in the per-domain mirror: a domain-wide
mapcache defers that flush, and the translations would otherwise
outlive the mapping.

For a domain running without per-vCPU page tables the window has the
same domain-wide visibility as the other per-domain sub-areas: the
virtual addresses are keyed on vcpu_id, so the same VA arithmetic
serves both modes.  With vcpu-pt enabled, a vCPU's window is simply
absent from its siblings' address spaces.

This is infrastructure for moving the SVM VMCB, the VMX MSR load/save
lists, the saved register frames, the HVM emulator's caches and the
guest XSAVE areas off always-mapped memory.  Nothing occupies the area
yet; the only behavioural change is the page-table allocation itself and
the failure path that comes with it: vCPU creation can now fail with
-ENOMEM.  Both apply to every guest vCPU, with or without asi=, PV ones
included.  A domain with per-vCPU page tables gets an L2 and an L1 per
vCPU; any other domain, every PV domain among them, one L2 plus an L1
per 64 vCPUs: 2 pages for up to 64 vCPUs.  A PV domain's window stays
empty until the register frames and XSAVE areas move there.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v6:
- Port over change to L3 allocation.

Changes in v5:
- Say that the PV register frames move into the window too, not only
  the XSAVE areas.
- Message and comments: "per-domain area", and which vCPUs share it.

Changes in v4:
- New in this version.
---
 xen/arch/x86/domain.c             | 12 ++++++++
 xen/arch/x86/include/asm/config.h | 21 +++++++++++++-
 xen/arch/x86/include/asm/mm.h     |  2 ++
 xen/arch/x86/mm.c                 | 47 +++++++++++++++++++++++++++++++
 4 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 46ca945b48..633619b400 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -524,6 +524,18 @@ int arch_vcpu_create(struct vcpu *v)
 
     if ( !is_idle_domain(d) )
     {
+        BUILD_BUG_ON((MAX_VIRT_CPUS << VCPU_STATE_VA_SHIFT) >
+                     (PERDOMAIN_SLOT_MBYTES << 20));
+        BUILD_BUG_ON(VCPU_STATE_IDX_VMCB >= VCPU_STATE_NR_PAGES);
+        BUILD_BUG_ON(VCPU_STATE_IDX_N2VMCB >= VCPU_STATE_NR_PAGES);
+        BUILD_BUG_ON(VCPU_STATE_IDX_VMX_MSR >= VCPU_STATE_NR_PAGES);
+        /* Page tables only; torn down with the rest of the per-domain area. */
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
index d04a935aff..b253f4a807 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -628,6 +628,8 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 unsigned int flags);
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
+void unmap_vcpu_state(const struct vcpu *v, unsigned int idx, unsigned int nr);
+void unmap_vcpu_state_page(const void *va);
 void free_perdomain_mappings(struct domain *d);
 void free_pervcpu_mappings(struct vcpu *v);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0edf01f363..768270ec36 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6681,6 +6681,53 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
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
+    /*
+     * Beyond the stride is the next vCPU's window, where the domain's vCPUs
+     * share a per-domain area.
+     */
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
2.56.0


