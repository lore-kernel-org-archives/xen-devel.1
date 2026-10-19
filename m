Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6B606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=jgoFtm5p
Received: from list by lists.xenproject.org with outflank-mailman.1454845.1668459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS8-0005l2-B7; Mon, 19 Oct 2026 19:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454845.1668459; Mon, 19 Oct 2026 19:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS7-0005he-Sl; Mon, 19 Oct 2026 19:55:23 +0000
Received: by outflank-mailman (input) for mailman id 1454845;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-0003hw-P4
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022zl-3YoA;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGg-00000001FjN-0lcO;
 Mon, 19 Oct 2026 19:43:34 +0000
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
	bh=dbeZKV9O+bmNdrh0qt89ublfkcV74oImeh0hl17sAps=; b=jgoFtm5p3xGtx39+eoGKrwQ/W9
	5PsVIafcft7cfDUDsGeu2STkBtHg3nkAD2IxUNQz98NiQnpb50qQp+2QRWtnFcfa4VmlufVd+8Z/1
	EtD349aaIv1/hXmZxn2mQ6HaIbLCAFlA/C1wqDs3zBhx8EQeQfkwPzDRfAz7dH3iH3e4=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 18/30] x86/domain_page: clear a mapcache slot at its last unmap
Date: Mon, 19 Oct 2026 20:42:49 +0100
Message-ID: <20261019-asi-hvm-v4-18-b68b66652266@xenproject.org>
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

unmap_domain_page() keeps a recently unmapped slot in the vCPU's
maphash (MAPHASH_ENTRIES, 8 per vCPU) for a quick remap of the same
MFN, and leaves its PTE in place until the entry is displaced by a later
unmap or reclaimed by a full cache.  Until then the page stays mapped,
although nothing refers to the mapping and the mapcache holds no
reference to the page.  Where the mapcache clears a slot's PTE, it
defers the flush: the slot's translation can stay in the TLB of the CPU
which used it until that CPU next flushes.

While the full directmap is loaded, that reaches nothing it does not
map anyway.  On the sparse view of the directmap, Xen reaches
domain-heap memory only through mappings made for the purpose.  A
mapping or a translation left behind keeps the page reachable after its
last unmap: while Xen serves another of the guest's contexts on the
same vCPU, and, once the page is freed and handed to another domain,
from a context which has nothing to do with it.

So clear a slot's PTE when its last reference goes, maphash slots
included: the hash entry keeps the slot, not the mapping, and a later
hit maps the page again in the same slot.  The slot has mapped nothing
else in between, so that needs no flush.  Reusing the slot for another
page still goes through the garbage map, or through the replacement of
a hash entry when the cache is full, both of which flush first.

In a per-vCPU mapcache, as vCPU-PT domains have, also invalidate the
slot's translation on the local CPU, right after clearing the PTE.  The
slot has a second address, in the mirror of the per-domain area that
every domain but a 64-bit PV one gets for the compat argument
translation area, and its translation is invalidated too: two INVLPGs.
That leaves no translation on any CPU, as the vCPU's page-tables are
loaded on one CPU at a time, and a CPU loading other page-tables
(switch_cr3_cr4()) flushes non-global translations, the mapcache's
included.

A PV domain's domain-wide mapcache has its PTEs cleared but no
INVLPG, as CPUs running the domain's other vCPUs may hold the slot's
translation too, which a local INVLPG would not reach.  For it, as
before, builds with PV support flush a page freed by its owner from
TLBs before the page is handed out again.

The cost is one PTE write per unmap into the maphash and per remap from
it, and in a per-vCPU mapcache two INVLPGs per slot's last unmap.  A
second unmap of an entry in the maphash now finds its PTE not present
and is caught by the check unmap_domain_page() has for entries the
first unmap zapped, rather than by the reference count's ASSERT() in
debug builds only.

The change does not depend on asi= or on a sparse view of the directmap
being configured: PV vCPUs use the domain-wide mapcache on the default
command line too.  For them it adds the PTE writes above, and leaves up
to MAPHASH_ENTRIES fewer pages per vCPU mapped in the domain-wide area.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- Merge v3's 15/18 ("x86/mm: flush owned pages before reuse with the
  sparse directmap view") and 16/18 ("x86/domain_page: keep the
  maphash's slots, not their mappings").  Rather than flush pages freed
  by their owner before reuse wherever a sparse view is configured,
  invalidate a per-vCPU mapcache slot's translations on the local CPU
  right after its PTE is cleared (Roger).
- Message: don't restate when PV vCPUs use the mapcache (Roger).

Changes in v3:
- New in this version.

For reviewers: with a slot cleared and invalidated at its last unmap,
a per-vCPU mapcache's maphash saves only the search for a free slot,
and a second slot for a page mapped twice at once.  One page in two
slots is fine, and already happens when it is not in the maphash.  So
per-vCPU mapcaches could drop the maphash, and with it their garbage
map and wrap-time flush.  In v5, or as a follow-up?
---
 xen/arch/x86/domain_page.c        | 53 +++++++++++++++++++++++++------
 xen/arch/x86/include/asm/domain.h |  5 ++-
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 6b662706fb..4198ee7c18 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -130,6 +130,26 @@ static void mapcache_exit(struct mapcache_domain *dcache)
 #define MAPCACHE_L1ENT(idx) \
     __linear_l1_table[l1_linear_offset(MAPCACHE_VIRT_START + pfn_to_paddr(idx))]
 
+/*
+ * Clear a slot's PTE.  For a per-vCPU mapcache (HVM domains only), then also
+ * drop the slot's translations from this CPU's TLB, at its address and at its
+ * alias in the per-domain mirror, which every HVM domain has.  No other CPU
+ * can hold them: the vCPU's page-tables are loaded on one CPU at a time, and
+ * loading other page-tables flushes non-global translations.
+ */
+static void mapcache_zap(const struct mapcache_domain *dcache,
+                         unsigned int idx)
+{
+    unsigned long va = MAPCACHE_VIRT_START + pfn_to_paddr(idx);
+
+    l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
+    if ( dcache )
+        return;
+
+    flush_tlb_one_local(va);
+    flush_tlb_one_local(va - PERDOMAIN_VIRT_START + PERDOMAIN_ALT_VIRT_START);
+}
+
 void *map_domain_page(mfn_t mfn)
 {
     unsigned long flags;
@@ -176,6 +196,14 @@ void *map_domain_page(mfn_t mfn)
     {
         idx = hashent->idx;
         ASSERT(idx < cache->entries);
+        /*
+         * An entry the maphash kept holds on to its slot, not to its mapping
+         * (see unmap_domain_page()): map the page again.  No flush is needed,
+         * as the slot has mapped nothing else since.
+         */
+        if ( !hashent->refcnt )
+            l1e_write(&MAPCACHE_L1ENT(idx),
+                      l1e_from_mfn(mfn, __PAGE_HYPERVISOR_RW));
         hashent->refcnt++;
         ASSERT(hashent->refcnt);
         ASSERT(mfn_eq(l1e_get_mfn(MAPCACHE_L1ENT(idx)), mfn));
@@ -208,8 +236,8 @@ void *map_domain_page(mfn_t mfn)
                 if ( hashent->idx != MAPHASHENT_NOTINUSE && !hashent->refcnt )
                 {
                     idx = hashent->idx;
-                    ASSERT(l1e_get_pfn(MAPCACHE_L1ENT(idx)) == hashent->mfn);
-                    l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
+                    ASSERT(!(l1e_get_flags(MAPCACHE_L1ENT(idx)) &
+                             _PAGE_PRESENT));
                     hashent->idx = MAPHASHENT_NOTINUSE;
                     hashent->mfn = ~0UL;
                     break;
@@ -273,32 +301,39 @@ void unmap_domain_page(const void *ptr)
 
     local_irq_save(flags);
 
+    /*
+     * The maphash keeps a freed slot, not its mapping: the page may change
+     * hands meanwhile.  A domain-wide mapcache's translation left in a TLB
+     * is covered by the flush the allocator makes before reusing an owned
+     * page.
+     */
     if ( hashent->idx == idx )
     {
         ASSERT(hashent->mfn == mfn);
         ASSERT(hashent->refcnt);
         hashent->refcnt--;
+        if ( !hashent->refcnt )
+            mapcache_zap(dcache, idx);
     }
     else if ( !hashent->refcnt )
     {
+        /* The entry replaced has no mapping left: mark its slot as garbage. */
         if ( hashent->idx != MAPHASHENT_NOTINUSE )
         {
-            /* /First/, zap the PTE. */
-            ASSERT(l1e_get_pfn(MAPCACHE_L1ENT(hashent->idx)) ==
-                   hashent->mfn);
-            l1e_write(&MAPCACHE_L1ENT(hashent->idx), l1e_empty());
-            /* /Second/, mark as garbage. */
+            ASSERT(!(l1e_get_flags(MAPCACHE_L1ENT(hashent->idx)) &
+                     _PAGE_PRESENT));
             set_bit(hashent->idx, cache->garbage);
         }
 
-        /* Add newly-freed mapping to the maphash. */
+        /* Add the newly-freed slot to the maphash, without its mapping. */
+        mapcache_zap(dcache, idx);
         hashent->mfn = mfn;
         hashent->idx = idx;
     }
     else
     {
         /* /First/, zap the PTE. */
-        l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
+        mapcache_zap(dcache, idx);
         /* /Second/, mark as garbage. */
         set_bit(idx, cache->garbage);
     }
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f84ac15759..0e405157b4 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -74,7 +74,10 @@ struct mapcache_vcpu {
     /* Shadow of mapcache_domain.epoch. */
     unsigned int shadow_epoch;
 
-    /* Lock-free per-VCPU hash of recently-used mappings. */
+    /*
+     * Lock-free per-VCPU hash of recently-used mappings.  An entry without
+     * references keeps its slot but not its mapping (see unmap_domain_page()).
+     */
     struct vcpu_maphash_entry {
         unsigned long mfn;
         uint32_t      idx;
-- 
2.55.0


