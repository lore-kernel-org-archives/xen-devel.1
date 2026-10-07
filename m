Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60921CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:00:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442177.1659764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNt-0006ZL-LN; Wed, 07 Oct 2026 11:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442177.1659764; Wed, 07 Oct 2026 11:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNt-0006XJ-Ad; Wed, 07 Oct 2026 11:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1442177;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-0005yd-QZ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:00:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEPNp-001bwA-3B;
 Wed, 07 Oct 2026 11:00:25 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5H-001QnT-13;
 Wed, 07 Oct 2026 10:41:15 +0000
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
	bh=lKK7xvuX4KaLB6q8iiI3K8qFh2zb9vOgIFdBlslvfS4=; b=SbnMG71qmDmAShULXYcfZDKMO/
	7vaer8XkcruYMK9QQs0whBB9/ckI9o485iK2WNcUMFTGg93/lxcbg1aBssljhsgj2UYISaPVV/5NY
	xybQ0No0nYsvGRooTrlSDKRFw6CRiBJwrAykq4na0ANReJ2hxhm4XRV2jRgaRVqXkPQE=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 15/18] x86/mm: flush owned pages before reuse with the sparse directmap view
Date: Wed,  7 Oct 2026 11:40:48 +0100
Message-ID: <20261007104051.48841-16-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since d7bf1b8ea275 ("x86/mm: limit deferred TLB flushing to PV domain
support") a page freed by its owner is flushed from TLBs before it is
handed out again only in builds with PV support, on the premise that PV
domains, with their (limited) control over the host MMU and over when
flushes happen, are the only ones to leave stale entries behind.

Xen's transient mappings of domain pages are another source.  The
mapcache zaps a slot when it is unmapped but defers the flush: the
slot's translation can stay in the TLB of the CPU which used it until
that CPU next flushes, by which time the page may have been freed and
handed to another domain.  Before "x86/hvm: introduce per-vCPU
mapcache for vCPU-PT domains", only PV vCPUs use the mapcache, so the
PV condition covers it.  Now that the vCPUs of an HVM domain with
per-vCPU page-tables have one as well.

While the full directmap is loaded in every context, stale transient
mappings only map what's already mapped in the full directmap.  On the
sparse view of the directmap, a stale translation of a page handed to
another domain would keep it reachable from a context which has
nothing to do with it.

So flush owned pages before reuse wherever a sparse view is
configured, as before d7bf1b8ea275.  In builds without PV support,
mark_page_free() now also asks a new hook,
arch_freed_pages_need_tlbflush(), declared with the xenheap hooks the
sparse view already uses.  x86 answers with sparse_dmap_configured();
without CONFIG_SPARSE_DIRECTMAP, and on other architectures, the
answer is no.  Builds with PV support flush as before, and HVM-only
builds keep d7bf1b8ea275's saving unless a sparse view is configured,
which nothing does until a later patch.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- New in this version.
---
 xen/arch/x86/sparse-directmap.c | 14 ++++++++++++++
 xen/common/page_alloc.c         | 14 +++++++++-----
 xen/include/xen/mm.h            |  6 ++++++
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/sparse-directmap.c b/xen/arch/x86/sparse-directmap.c
index a41731ccfa..ef13f9e95d 100644
--- a/xen/arch/x86/sparse-directmap.c
+++ b/xen/arch/x86/sparse-directmap.c
@@ -185,6 +185,20 @@ bool arch_xenheap_needs_scrub(void)
     return sparse_dmap_configured();
 }
 
+/*
+ * Pages freed by their owner are flushed from TLBs before reuse once a
+ * sparse view is configured.  Contexts on the sparse view reach domain-heap
+ * memory only through mappings made for the purpose, and the mapcache zaps a
+ * transient mapping when it is dropped but defers the flush: a translation
+ * left behind would keep the page reachable after it has been handed to
+ * another owner.  With PV support, owned pages are flushed before reuse
+ * anyway.
+ */
+bool arch_freed_pages_need_tlbflush(void)
+{
+    return sparse_dmap_configured();
+}
+
 /* Pages have been allocated from the heap as xenheap pages. */
 int arch_xenheap_pages_alloc(mfn_t mfn, unsigned int order)
 {
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 69e8e982b6..477301ef7c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1539,12 +1539,16 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
     }
 
     /*
-     * If a page has no owner and there's no PV domain support it does not need
-     * a safety TLB flush.  PV domains are the only domain types that can keep
-     * stale entries on the TLB, as they have (limited) control over the host
-     * MMU and when flushes are performed.
+     * If a page has no owner, or there's no PV domain support and the
+     * architecture doesn't ask for one, it does not need a safety TLB flush.
+     * PV domains can keep stale entries on the TLB, as they have (limited)
+     * control over the host MMU and when flushes are performed.  On x86,
+     * while a sparse directmap view is configured, so can Xen's transient
+     * mappings of the page, whose translations may outlive the mappings.
      */
-    pg->u.free.need_tlbflush = IS_ENABLED(CONFIG_PV) && page_get_owner(pg);
+    pg->u.free.need_tlbflush = page_get_owner(pg) &&
+                               (IS_ENABLED(CONFIG_PV) ||
+                                arch_freed_pages_need_tlbflush());
     if ( pg->u.free.need_tlbflush )
         page_set_tlbflush_timestamp(pg);
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 2bcc45cf58..1628f7a897 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -110,6 +110,8 @@ bool arch_xenheap_needs_scrub(void);
 int arch_xenheap_pages_alloc(mfn_t mfn, unsigned int order);
 /* Xenheap pages are to be freed.  Non-zero: failed, don't reuse them. */
 int arch_xenheap_pages_free(mfn_t mfn, unsigned int order);
+/* Pages freed by their owner need a TLB flush before they are reused. */
+bool arch_freed_pages_need_tlbflush(void);
 #else
 static inline bool arch_heap_pages_init(mfn_t mfn, unsigned long nr)
 {
@@ -127,6 +129,10 @@ static inline int arch_xenheap_pages_free(mfn_t mfn, unsigned int order)
 {
     return 0;
 }
+static inline bool arch_freed_pages_need_tlbflush(void)
+{
+    return false;
+}
 #endif
 
 /* Free an allocation, and zero the pointer to it. */
-- 
2.55.0


