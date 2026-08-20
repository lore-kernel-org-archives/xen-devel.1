Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E18C5DF8D
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 17:44:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396847.1634502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6o9-0001Hq-RB; Thu, 20 Aug 2026 17:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396847.1634502; Thu, 20 Aug 2026 17:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6o9-0001Hj-O1; Thu, 20 Aug 2026 17:44:05 +0000
Received: by outflank-mailman (input) for mailman id 1396847;
 Thu, 20 Aug 2026 17:44:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wx6o8-00015l-R5
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:44:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6o8-00E23U-0B;
 Thu, 20 Aug 2026 17:44:03 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6o7-00DjFg-1e;
 Thu, 20 Aug 2026 17:44:03 +0000
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
	bh=uIVVXYNBp/ouS5mM6fbgcFwcP3APHMH5u1xUU28Itjw=; b=vzAZ3DGb7CsElFQ64hD05qH3Vw
	Rx4tQ/GJZg+MWIcm2oDqeGutDxIXPhpXVHDda7QlhU0JOn7+rSQNzYbdyMTyyJt5l6gauzFbFGRQT
	ekAUEi3k/u+wwTHYRSkN+WkLQYO4rrgSFR5mshKUrMSjILW97fYLAVfSyv2V9hCRRAns=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/7] x86/mm: introduce populate_perdomain_mapping()
Date: Thu, 20 Aug 2026 18:43:42 +0100
Message-ID: <20260820-asi-part1-2-f2dbd92b8459@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

The per-domain area already has central machinery for building its
page-tables and for managing the backing pages it owns itself:
create_perdomain_mapping() / destroy_perdomain_mapping(), used by the
mapcache bitmaps, the compat argument-translation area, and the
GDT/LDT slots alike.  What the interface lacks is a way to install a
caller's own pages at a chosen address.  The PV GDT and LDT code
open-codes its own modifications to the per-domain area, capturing
aliases of its L1 tables at creation time
(create_perdomain_mapping()'s pl1tab argument) and stashing them in
d->arch.pv.gdt_ldt_l1tab.

Introduce populate_perdomain_mapping(v, va, mfn, nr, flags) to close
this gap, giving the perdomain area's rules a single place to live.
populate_perdomain_mapping writes the given MFNs, with the given
page-table flags, into v's view of the per-domain area by walking its
per-domain page-tables.  Those are xenheap pages, reached through
their always-mapped alias, so the walk involves no mapping and is
usable from any context -- including the context switch, before the
incoming vcpu's page-tables are loaded.  Callers don't need to know
where the page-tables live, how the area is structured, or whether it
is per-domain or per-vcpu.

We require the range to already have been populated down to the L1
tables by create_perdomain_mapping().  TLB flushing is left to the
caller.  A present entry not owned by the area (!_PAGE_AVAIL0) is
replaced.  A present entry owned by the area (_PAGE_AVAIL0, installed
by create_perdomain_mapping() itself) is freed and replaced: such a
page is referenced only by the mapping, so displacing it without
freeing it would leak it.  Nothing in this series replaces area-owned
backing, so the free is marked ASSERT_UNREACHABLE(); note that freeing
requires a context where the allocator may be entered -- IRQs enabled,
not in interrupt context (see ASSERT_ALLOC_CONTEXT()) -- so any future
caller replacing area-owned backing must not do so from the context
switch path.  Missing page-table structure is a hypervisor bug and
BUG_ON(): there is no safe continuation, least of all from the context
switch, where the next descriptor fetch through an unmapped GDT slot
would be fatal.

Subsequent patches convert the users of the stashed L1 tables to this
interface, starting with the Xen slots of the full GDT; the stash --
which could in any case not represent per-vcpu mappings without being
replicated for every vcpu and slot -- is then removed, leaving
create_perdomain_mapping() to manage only the page-table structure and
the pages the area owns itself.  Later parts of the series use the new
interface for their own mappings rather than adding further
mechanisms.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes since the previously posted version:
- Split the introduction of populate_perdomain_mapping() from its first
   user (previously one patch: "x86/pv: introduce function to populate
   perdomain area and use it to map Xen GDT").
- Drop the linear-map fast path and the sync_local_execstate() call:
   with the per-domain page-tables in the xenheap (previous patch) the
   walk needs no mapping, so a single path serves all callers and
   contexts.
- Keep the ASSERT_UNREACHABLE() + free_domheap_page() handling of a
   replaced area-owned entry, and document the allocation-context
   requirement it places on callers replacing such entries.  BUG_ON()
   missing page-table structure, instead of domain_crash().
- Take the page-table flags as a parameter (the Xen GDT and guest GDT
   slots want RW mappings; the zero page backing torn-down GDT slots is
   mapped read-only, as today).
- Document the contract in a header comment.
- Make the mfn parameter const and nr unsigned int, matching
   {create,destroy}_perdomain_mapping().
- Drop the unused cr3_mfn() helper.

Considered, but not done to limit churn against the previously posted
version: splitting the interface into a "populate" variant (any present
entry is a bug) and an "update" variant (replacement expected), so that
call sites declare their intent and unexpected collisions become
detectable.  Of the eventual call sites in the wider series, roughly
half are of each kind.  Could be done as a follow-up if there is
interest.
---
 xen/arch/x86/include/asm/mm.h |  3 ++
 xen/arch/x86/mm.c             | 68 +++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 2254a7e3fe..1888807394 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -606,6 +606,9 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 int create_perdomain_mapping(struct domain *d, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg);
+void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
+                                const mfn_t *mfn, unsigned int nr,
+                                unsigned int flags);
 void destroy_perdomain_mapping(struct domain *d, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 38a0f984fc..1810971677 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6311,6 +6311,74 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
     return rc;
 }
 
+/*
+ * Map @nr pages, @mfn[0..nr-1], at consecutive pages from @va in v's view of
+ * the per-domain area, with page-table @flags.  The range must lie within a
+ * single per-domain slot, and must already have been plumbed down to the L1
+ * tables by create_perdomain_mapping(): missing structure is a bug.  A
+ * present entry not owned by the area (no _PAGE_AVAIL0) is silently
+ * replaced, as that is how callers update their mappings; a present
+ * area-owned entry is freed and replaced, which constrains the calling
+ * context (see the comment in the body).  No TLB flushing is done: the
+ * caller decides whether the old translations can still be cached
+ * anywhere.
+ *
+ * The walk goes through the always-mapped xenheap alias of the per-domain
+ * page-tables, so it needs nothing from the current address space and is
+ * usable from any context -- including the context switch, before the
+ * incoming vcpu's page-tables are loaded.
+ */
+void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
+                                const mfn_t *mfn, unsigned int nr,
+                                unsigned int flags)
+{
+    l1_pgentry_t *l1tab = NULL, *pl1e;
+    const l3_pgentry_t *l3tab;
+    const l2_pgentry_t *l2tab;
+
+    ASSERT(va >= PERDOMAIN_VIRT_START &&
+           va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
+    ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
+    /* Area-owned pages are installed by create_perdomain_mapping() only. */
+    ASSERT(!(flags & _PAGE_AVAIL0));
+
+    l3tab = v->domain->arch.perdomain_l3;
+    BUG_ON(!l3tab);
+    BUG_ON(!(l3e_get_flags(l3tab[l3_table_offset(va)]) & _PAGE_PRESENT));
+
+    l2tab = maddr_to_virt(l3e_get_paddr(l3tab[l3_table_offset(va)]));
+
+    for ( ; nr--; va += PAGE_SIZE, mfn++ )
+    {
+        if ( !l1tab || !l1_table_offset(va) )
+        {
+            const l2_pgentry_t *pl2e = l2tab + l2_table_offset(va);
+
+            BUG_ON(!(l2e_get_flags(*pl2e) & _PAGE_PRESENT));
+            l1tab = maddr_to_virt(l2e_get_paddr(*pl2e));
+        }
+
+        pl1e = &l1tab[l1_table_offset(va)];
+
+        /*
+         * An area-owned entry (installed by create_perdomain_mapping(),
+         * marked _PAGE_AVAIL0) holds the only reference to its page, so
+         * displacing it means freeing it.  Nothing in this series replaces
+         * area-owned backing, hence the ASSERT_UNREACHABLE(); any future
+         * caller doing so must run where freeing is permitted -- IRQs
+         * enabled, not in interrupt context (see ASSERT_ALLOC_CONTEXT())
+         * -- which the context switch path is not.
+         */
+        if ( unlikely(perdomain_l1e_needs_freeing(*pl1e)) )
+        {
+            ASSERT_UNREACHABLE();
+            free_domheap_page(l1e_get_page(*pl1e));
+        }
+
+        l1e_write(pl1e, l1e_from_mfn(*mfn, flags));
+    }
+}
+
 void destroy_perdomain_mapping(struct domain *d, unsigned long va,
                                unsigned int nr)
 {
-- 
2.55.0


