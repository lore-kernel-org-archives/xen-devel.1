Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7D4C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:44:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405455.1638958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVp-0002dC-Jf; Wed, 02 Sep 2026 09:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405455.1638958; Wed, 02 Sep 2026 09:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVp-0002c0-Dx; Wed, 02 Sep 2026 09:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1405455;
 Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hVn-0002GD-FQ
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hVm-00G2d4-Kq
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:44:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efdb-bab6-0a2a0a5309dd-0a2a4508bd48-34
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe5-f659-0a2a45080019-d99ba50ce6fa-1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id 9FFCE36928DD; Wed,  2 Sep 2026 10:44:05 +0100 (BST)
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
Subject: [PATCH v2 04/14] x86/pv: set/clear guest GDT mappings using populate_perdomain_mapping()
Date: Wed,  2 Sep 2026 10:43:48 +0100
Message-ID: <20260901-asi-part2-4-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788342246-D674387B-B33CDC94/0/0
X-purgate-type: clean
X-purgate-size: 6510

From: Roger Pau Monné <roger.pau@citrix.com>

Until the previous patch, update_xen_slot_in_full_gdt() used the
stashed pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming
vCPU's page tables with Xen's GDT; this was previously necessary
because map_domain_page() couldn't be called in a context switch.
Having a handy pointer to an always-mapped version of the GDT/LDT L1
table, other sites which modify the table started using it for
convenience, even if they weren't called from within a context switch.
One example is pv_{set,destroy}_gdt().

The previous patch switched the main user of the stashed reference to
use populate_perdomain_mapping() instead.  Continue that process by
switching both pv_{set,destroy}_gdt() to it as well.

pv_destroy_gdt() currently loops over the L1 entries directly,
extracting the MFN from each, dropping the type and reference unless
it was the zero page, and replacing the entry with a read-only mapping
of the zero page.  Rather than reading from the stashed L1, drop the
references using v->arch.pv.gdt_frames[] instead, and install the
zero-page mappings with a single populate_perdomain_mapping() call.
This makes gdt_frames[] consistently the source of truth for MFNs.

Note that we must maintain the invariant introduced in cf6d39f819
("x86/PV: properly populate descriptor tables"): pv_destroy_gdt() maps
the zero page read-only in torn-down slots rather than unmapping them,
so that LAR/LSL/VERR/VERW on a selector beyond the guest's limit clear
ZF as on native rather than taking a #PF-converted #GP.  (And since
pv_set_gdt() tears down the old GDT before installing the new one,
guests never see unmapped entries, only zero-page entries.)

In the case of pv_set_gdt(), we have a slightly awkward situation with
types.  The ABI with the guest uses unsigned long[], but
populate_perdomain_mapping() wants an array of mfn_t.
v->arch.pv.gdt_frames being unsigned long means we can just copy from
it across the guest ABI with no conversions.  We could in theory
convert it to mfn_t[] instead, and then pass v->arch.pv.gdt_frames
into populate_perdomain_mapping(); but then we'd need to add a
conversion on all the places where frames are copied out.  We choose
instead to copy frames into a temporary mfn_t array on the stack to
pass into populate_perdomain_mapping().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- Reword commit message

Changes since the previously posted version:
- Retain the gdt_ents zeroing when tearing down the GDT (its removal
   was queried by Jan).
- Map torn-down slots read-only to the zero page (via the
   populate_perdomain_mapping() flags parameter) rather than removing
   the mappings with destroy_perdomain_mapping(): empty slots would be
   a guest-visible partial revert of cf6d39f819 (see the commit
   message).  With the destroy call gone, its v->arch.cr3 guard --
   also queried by Jan -- goes too: the zero-page rewrite runs
   unconditionally.
- Keep gdt_frames[] as unsigned long[] rather than switching it to
   mfn_t[] as Jan suggested; the commit message explains the
   trade-off.
- Retitle: destroy_perdomain_mapping() is no longer used here.
---
 xen/arch/x86/pv/descriptor-tables.c | 37 ++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 8a32b9ae5c..5dda5bffe3 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -49,33 +49,42 @@ bool pv_destroy_ldt(struct vcpu *v)
 
 void pv_destroy_gdt(struct vcpu *v)
 {
-    l1_pgentry_t *pl1e = pv_gdt_ptes(v);
-    mfn_t zero_mfn = _mfn(virt_to_mfn(zero_page));
-    l1_pgentry_t zero_l1e = l1e_from_mfn(zero_mfn, __PAGE_HYPERVISOR_RO);
+    const mfn_t zero_mfn = _mfn(virt_to_mfn(zero_page));
+    mfn_t zero_mfns[ARRAY_SIZE(v->arch.pv.gdt_frames)];
     unsigned int i;
 
     ASSERT(v == current || !vcpu_cpu_dirty(v));
 
     v->arch.pv.gdt_ents = 0;
-    for ( i = 0; i < FIRST_RESERVED_GDT_PAGE; i++ )
+
+    for ( i = 0; i < ARRAY_SIZE(zero_mfns); i++ )
     {
-        mfn_t mfn = l1e_get_mfn(pl1e[i]);
+        zero_mfns[i] = zero_mfn;
 
-        if ( (l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) &&
-             !mfn_eq(mfn, zero_mfn) )
-            put_page_and_type(mfn_to_page(mfn));
+        /* MFN 0 can never pass get_page_and_type(), so 0 marks unused slots. */
+        if ( !v->arch.pv.gdt_frames[i] )
+            continue;
 
-        l1e_write(&pl1e[i], zero_l1e);
+        put_page_and_type(mfn_to_page(_mfn(v->arch.pv.gdt_frames[i])));
         v->arch.pv.gdt_frames[i] = 0;
     }
+
+    /*
+     * Point every slot at the zero page, read-only: a descriptor fetch from
+     * the unused part of the GDT then finds a not-present descriptor rather
+     * than a missing mapping, so LAR/LSL/VERR/VERW on a selector beyond the
+     * guest's limit clear ZF as they do on native, instead of faulting.
+     */
+    populate_perdomain_mapping(v, GDT_VIRT_START(v), zero_mfns,
+                               ARRAY_SIZE(zero_mfns), __PAGE_HYPERVISOR_RO);
 }
 
 int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
                unsigned int entries)
 {
     struct domain *d = v->domain;
-    l1_pgentry_t *pl1e;
     unsigned int i, nr_frames = DIV_ROUND_UP(entries, 512);
+    mfn_t mfns[ARRAY_SIZE(v->arch.pv.gdt_frames)];
 
     ASSERT(v == current || !vcpu_cpu_dirty(v));
 
@@ -90,6 +99,8 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
         if ( !mfn_valid(mfn) ||
              !get_page_and_type(mfn_to_page(mfn), d, PGT_seg_desc_page) )
             goto fail;
+
+        mfns[i] = mfn;
     }
 
     /* Tear down the old GDT. */
@@ -97,12 +108,10 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
 
     /* Install the new GDT. */
     v->arch.pv.gdt_ents = entries;
-    pl1e = pv_gdt_ptes(v);
     for ( i = 0; i < nr_frames; i++ )
-    {
         v->arch.pv.gdt_frames[i] = frames[i];
-        l1e_write(&pl1e[i], l1e_from_pfn(frames[i], __PAGE_HYPERVISOR_RW));
-    }
+    populate_perdomain_mapping(v, GDT_VIRT_START(v), mfns, nr_frames,
+                               __PAGE_HYPERVISOR_RW);
 
     return 0;
 
-- 
2.55.0


