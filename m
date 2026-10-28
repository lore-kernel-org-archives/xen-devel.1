Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41EA606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=iBu5Wnto
Received: from list by lists.xenproject.org with outflank-mailman.1463791.1674591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6P-0004vS-9K; Wed, 28 Oct 2026 23:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463791.1674591; Wed, 28 Oct 2026 23:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6O-0004r3-Vm; Wed, 28 Oct 2026 23:30:40 +0000
Received: by outflank-mailman (input) for mailman id 1463791;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00048N-Rx
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00000000pO3-2KnS;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjW-00000001KpM-3fYZ;
 Wed, 28 Oct 2026 23:07:03 +0000
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
	bh=6StxVuF+DxVESv0W4X+e1gdp43IG04FSqlKMUwh8lP8=; b=iBu5WntoYtpv4VxcBVX1Lykv7U
	Bh72UDB2nSzLYZZ8rad5cOxQ6WWGZmsyHCIgs+je9ddjAibFiK6/NAV0JVJHHrqQgbBZgtbbMy+jU
	LCFiihS5hY2uyCHCWYC/iwPQ78YN+CrPWnxyOqetuL4Gcc3/9BWtXbEE0nJKMVmLWmxk=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 25/45] x86/mm: introduce populate_perdomain_mapping()
Date: Wed, 28 Oct 2026 23:05:39 +0000
Message-ID: <20261028-asi-hvm-v5-25-13b908e0df0b@xenproject.org>
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

The per-domain area has central machinery for building its page-tables
and for managing the backing pages it owns itself:
create_perdomain_mapping() / destroy_perdomain_mapping(), used by the
mapcache and the compat argument-translation area.  What the interface
lacks is a way to install a caller's own pages at a chosen address,
which a per-vCPU state window, introduced by a later patch, needs: its
users allocate their pages themselves and map them there.

Introduce populate_perdomain_mapping(v, va, mfn, nr, flags) for this.
It writes the given MFNs, with the given page-table flags, into v's view
of the per-domain area, walking the per-domain page-table structures
with transient mappings, so v need not be current.  Callers don't need
to know where the page-tables live, how the area is structured, or
whether v has a per-domain area of its own or shares its domain's.

We require the range to already have been populated down to the L1
tables by create_perdomain_mapping().  TLB flushing is left to the
caller.  A present entry not owned by the area (!_PAGE_AVAIL0) is
replaced.  A present entry owned by the area (_PAGE_AVAIL0, installed
by create_perdomain_mapping() itself) is never expected: such a page is
referenced only by the mapping, and no caller replaces area-owned
backing.  Should one ever do so, the page is leaked with a message
rather than freed.

The function is not for contexts with interrupts off: its users map
their pages when allocating them.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- Comment above populate_perdomain_mapping(): the range lies within one
  sub-area (one PERDOMAIN_VIRT_SLOT()), not one "per-domain slot".
- Message: "whether v has a per-domain area of its own or shares its
  domain's".

Changes in v4:
- Re-introduced into the series.
- HVM only: the users are the state window's, all of which map their
  pages at allocation time, so drop the linear-mapping fast path and the
  IRQs-off walk that context-switch callers needed, along with the
  map_domain_page_irqoff() variants.
---
 xen/arch/x86/include/asm/mm.h |  3 ++
 xen/arch/x86/mm.c             | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index af43ae01b0..6d50e17259 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -620,6 +620,9 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg);
+void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
+                                const mfn_t *mfn, unsigned int nr,
+                                unsigned int flags);
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 8d09a8e2c8..b10cc03840 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6555,6 +6555,68 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
     return rc;
 }
 
+/*
+ * Map @nr pages, @mfn[0..nr-1], at consecutive pages from @va in v's view of
+ * the per-domain area, with page-table @flags.  The range must lie within a
+ * single sub-area (one PERDOMAIN_VIRT_SLOT()), and must already have been
+ * plumbed down to the L1 tables by create_perdomain_mapping().  Present
+ * entries are replaced, and no TLB flushing is done.
+ *
+ * The walk maps the per-domain page-table pages transiently, so v need not
+ * be current.  It is not for contexts with interrupts disabled.
+ */
+void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
+                                const mfn_t *mfn, unsigned int nr,
+                                unsigned int flags)
+{
+    struct page_info *l3_pg = perdomain_l3(v);
+    const l3_pgentry_t *l3tab;
+    const l2_pgentry_t *l2tab;
+    l1_pgentry_t *l1tab = NULL;
+    unsigned int i;
+
+    ASSERT(va >= PERDOMAIN_VIRT_START &&
+           va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
+    ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
+    ASSERT(local_irq_is_enabled());
+
+    if ( !nr )
+        return;
+
+    BUG_ON(!l3_pg);
+    l3tab = __map_domain_page(l3_pg);
+    BUG_ON(!(l3e_get_flags(l3tab[l3_table_offset(va)]) & _PAGE_PRESENT));
+    l2tab = map_l2t_from_l3e(l3tab[l3_table_offset(va)]);
+    unmap_domain_page(l3tab);
+
+    for ( i = 0; i < nr; i++, va += PAGE_SIZE )
+    {
+        l1_pgentry_t *pl1e;
+
+        if ( !l1tab || !l1_table_offset(va) )
+        {
+            const l2_pgentry_t *pl2e = &l2tab[l2_table_offset(va)];
+
+            unmap_domain_page(l1tab);
+            BUG_ON(!(l2e_get_flags(*pl2e) & _PAGE_PRESENT));
+            l1tab = map_l1t_from_l2e(*pl2e);
+        }
+
+        pl1e = &l1tab[l1_table_offset(va)];
+        if ( perdomain_l1e_needs_freeing(*pl1e) )
+        {
+            printk(XENLOG_ERR
+                   "%pv: leaking area-owned page %"PRI_mfn" at %#lx\n",
+                   v, mfn_x(l1e_get_mfn(*pl1e)), va);
+            ASSERT_UNREACHABLE();
+        }
+        l1e_write(pl1e, l1e_from_mfn(mfn[i], flags));
+    }
+
+    unmap_domain_page(l1tab);
+    unmap_domain_page(l2tab);
+}
+
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr)
 {
-- 
2.56.0


