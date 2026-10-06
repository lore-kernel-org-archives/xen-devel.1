Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F35CA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 10:37:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441368.1658950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2Xk-0004QH-Pi; Tue, 06 Oct 2026 10:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441368.1658950; Tue, 06 Oct 2026 10:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2Xk-0004QA-Mo; Tue, 06 Oct 2026 10:37:08 +0000
Received: by outflank-mailman (input) for mailman id 1441368;
 Tue, 06 Oct 2026 10:37:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xE2Xj-0004Q1-1L
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:37:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xE2Xi-00Hb1P-1D;
 Tue, 06 Oct 2026 10:37:06 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xE2Xi-00AYEe-0F;
 Tue, 06 Oct 2026 10:37:06 +0000
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
	Message-ID:Date:Subject:Cc:To:From;
	bh=Fddexj0qF+CV/q7hZq0askrBKEoYQXsJn4bqOqq+0zs=; b=1qdx7cANRdyNj3MwZ7VDqZu/1B
	INygTAjR4BGhgryHY+YLwJRPEH4Jrju5dWoOX+dsCzsRPsck5/7eN/rbiGweT/6KbHgyXj3Po9R0X
	2FtiiNH9do7gFzpWNadxL/Og37HNo1Vaz5RqHMuyHkDhOy8M4FeWz7S2w5ejPuv3uGuY=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/pv: drop the old GDT frames only after their translations are flushed
Date: Tue,  6 Oct 2026 11:37:01 +0100
Message-ID: <20261006103702.55276-1-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pv_set_gdt() tears down the old GDT before installing the new one, and
the teardown, pv_destroy_gdt(), puts each old frame's reference before
it rewrites the slot's entry; the flush of the slot's translation is
left to the hypercall wrappers, after pv_set_gdt() returns.  If a put
drops the last reference, the frame can be freed and reused while this
pCPU's TLB still translates the slot to it.

This is safe today only by inspection.  The only consumers of a vCPU's
GDT slots are descriptor fetches by that vCPU and Xen's trap-handling
paths on its behalf, none of which run between the put and the flush;
and every other caller of pv_destroy_gdt() acts on a vCPU that no pCPU
has loaded, which holds no translations at all.  pv_destroy_ldt() is
in the same position: it unmaps and puts, and returns whether its
callers need to flush, so there too the put precedes the flush, and
the arrangement holds only because nothing fetches through the slots
in between.

Restructure pv_set_gdt() so that the flush sits between the two: take
the references on the new frames, install them (and the zero page over
the unused slots) over the old mappings, flush if the vCPU is the
current one, and only then put the old frames.  The flush moves out of
do_set_gdt() and compat_set_gdt() to sit next to what it protects.
pv_destroy_gdt() is then only reached for vCPUs that are not loaded
anywhere, so it asserts that directly (!vcpu_cpu_dirty()), which also
covers the lazy switched-out state that a plain v != current test
would let through.  Like pv_destroy_ldt(), it does no flush of its own
and is safe because the mappings it tears down are not live; it
unmaps before it puts all the same, so that a flush has its natural
place should one ever become necessary there.

No change to what guests observe: a slot always holds the old frame,
the new frame, or the zero page; there is never an unmapped slot.

Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
This is a candidate for backport.

This was originally requested to be packaged as a backport-able fix
during review of v2 of my version of the ASI series; I've taken a
slightly different direction, so posting this separately.
---
 xen/arch/x86/pv/descriptor-tables.c | 57 +++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 8a32b9ae5c..7a97ae753c 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -54,19 +54,27 @@ void pv_destroy_gdt(struct vcpu *v)
     l1_pgentry_t zero_l1e = l1e_from_mfn(zero_mfn, __PAGE_HYPERVISOR_RO);
     unsigned int i;
 
-    ASSERT(v == current || !vcpu_cpu_dirty(v));
+    /*
+     * Only reached for a vCPU that no pCPU has loaded (paused and synced,
+     * or never run), so no TLB holds a translation of its GDT slots and
+     * no flush is needed between unmapping and putting the frames.  Keep
+     * that order all the same, so a flush has its place should one ever
+     * become necessary here.  Replacing a running vCPU's own GDT is
+     * pv_set_gdt()'s job.
+     */
+    ASSERT(!vcpu_cpu_dirty(v));
 
     v->arch.pv.gdt_ents = 0;
     for ( i = 0; i < FIRST_RESERVED_GDT_PAGE; i++ )
     {
-        mfn_t mfn = l1e_get_mfn(pl1e[i]);
-
-        if ( (l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) &&
-             !mfn_eq(mfn, zero_mfn) )
-            put_page_and_type(mfn_to_page(mfn));
+        l1_pgentry_t l1e = pl1e[i];
 
         l1e_write(&pl1e[i], zero_l1e);
         v->arch.pv.gdt_frames[i] = 0;
+
+        if ( (l1e_get_flags(l1e) & _PAGE_PRESENT) &&
+             !mfn_eq(l1e_get_mfn(l1e), zero_mfn) )
+            put_page_and_type(l1e_get_page(l1e));
     }
 }
 
@@ -75,6 +83,9 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
 {
     struct domain *d = v->domain;
     l1_pgentry_t *pl1e;
+    l1_pgentry_t zero_l1e = l1e_from_mfn(_mfn(virt_to_mfn(zero_page)),
+                                         __PAGE_HYPERVISOR_RO);
+    unsigned long old_frames[ARRAY_SIZE(v->arch.pv.gdt_frames)];
     unsigned int i, nr_frames = DIV_ROUND_UP(entries, 512);
 
     ASSERT(v == current || !vcpu_cpu_dirty(v));
@@ -92,18 +103,34 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
             goto fail;
     }
 
-    /* Tear down the old GDT. */
-    pv_destroy_gdt(v);
+    /*
+     * Install the new GDT over the old one, flush, and only then drop the
+     * old frames: a translation of an old frame must be gone from this
+     * pCPU's TLB before the reference keeping the frame allocated is put.
+     * A vCPU that is not current is not loaded on any pCPU (see the
+     * assertion above), so nothing holds a translation and no flush is
+     * needed.
+     */
+    memcpy(old_frames, v->arch.pv.gdt_frames, sizeof(old_frames));
 
-    /* Install the new GDT. */
     v->arch.pv.gdt_ents = entries;
     pl1e = pv_gdt_ptes(v);
-    for ( i = 0; i < nr_frames; i++ )
+    for ( i = 0; i < ARRAY_SIZE(v->arch.pv.gdt_frames); i++ )
     {
-        v->arch.pv.gdt_frames[i] = frames[i];
-        l1e_write(&pl1e[i], l1e_from_pfn(frames[i], __PAGE_HYPERVISOR_RW));
+        v->arch.pv.gdt_frames[i] = i < nr_frames ? frames[i] : 0;
+        l1e_write(&pl1e[i],
+                  i < nr_frames ? l1e_from_pfn(frames[i], __PAGE_HYPERVISOR_RW)
+                                : zero_l1e);
     }
 
+    if ( v == current )
+        flush_tlb_local();
+
+    /* MFN 0 can never pass get_page_and_type(), so 0 marks unused slots. */
+    for ( i = 0; i < ARRAY_SIZE(old_frames); i++ )
+        if ( old_frames[i] )
+            put_page_and_type(mfn_to_page(_mfn(old_frames[i])));
+
     return 0;
 
  fail:
@@ -130,8 +157,7 @@ long do_set_gdt(
 
     domain_lock(curr->domain);
 
-    if ( (ret = pv_set_gdt(curr, frames, entries)) == 0 )
-        flush_tlb_local();
+    ret = pv_set_gdt(curr, frames, entries);
 
     domain_unlock(curr->domain);
 
@@ -168,8 +194,7 @@ int compat_set_gdt(
 
     domain_lock(curr->domain);
 
-    if ( (ret = pv_set_gdt(curr, frames, entries)) == 0 )
-        flush_tlb_local();
+    ret = pv_set_gdt(curr, frames, entries);
 
     domain_unlock(curr->domain);
 
-- 
2.55.0


