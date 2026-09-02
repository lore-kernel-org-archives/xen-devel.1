Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59304C624D6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:44:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405452.1638946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVo-0002TD-UD; Wed, 02 Sep 2026 09:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405452.1638946; Wed, 02 Sep 2026 09:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVo-0002T6-RA; Wed, 02 Sep 2026 09:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1405452;
 Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hVn-0002GB-2H
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hVm-0093D7-F3
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:44:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe1-8faa-0a2a0a5109dd-0a2a4502e798-16
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-720697.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-6ca4-0a2a45020019-d99ba50ce8c0-1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id F2A1036928E5; Wed,  2 Sep 2026 10:44:05 +0100 (BST)
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
Subject: [PATCH v2 06/14] x86/pv: remove stashing of GDT/LDT L1 page-tables
Date: Wed,  2 Sep 2026 10:43:50 +0100
Message-ID: <20260901-asi-part2-6-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788342246-F22A92AC-867215E0/0/0
X-purgate-type: clean
X-purgate-size: 4378

From: Roger Pau Monné <roger.pau@citrix.com>

There are no remaining users of the stashed L1 page-tables in
pv_domain.gdt_ldt_l1tab.  Remove it, and all helpers.  This removes a
globally-mapped xenheap allocation, and sets the stage for per-vCPU
root page tables.

pv_create_gdt_ldt_l1tab() now passes NIL() rather than the stash
array.  This will cause create_perdomain_mapping() to still eagerly
allocate the L1 tables covering the GDT/LDT range; but their addresses
are no longer handed back.  Doing this is necessary because
populate_perdomain_mapping() only fills existing tables, and treats
missing structure as a bug.

Another side effect of passing NIL() rather than a pointer is that the
L1 tables move from the xenheap to the domheap.  Residing in the
xenheap was only ever a requirement when the stashed pointer had to
stay usable; with that requirement dropped, we can relax the
allocation requirement as well.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- With "x86/mm: allocate the per-domain page-tables from the xenheap"
   dropped from the series, passing NIL() now does move the GDT/LDT L1
   tables to the domheap (upstream's allocation for non-capture mode);
   in v1 they stayed in the xenheap in all modes.  Reword the commit
   message accordingly.

Changes since the previously posted version:
- Note the implications of changing from pointer to NIL() in
   pv_create_gdt_ldt_l1tab().  In v2 this also changed where new
   GDT/LDT L1 tables were allocated from: upstream's capture mode
   takes them from the xenheap (the stashed pointer has to stay
   usable), the NIL() mode from the domheap.  Here they come from the
   xenheap in all modes ("x86/mm: allocate the per-domain page-tables
   from the xenheap"), so the switch only stops the addresses being
   handed back.
---
 xen/arch/x86/include/asm/domain.h |  9 ---------
 xen/arch/x86/pv/domain.c          | 10 +---------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 61a9fe00f0..5c7fad26a6 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -287,8 +287,6 @@ struct time_scale {
 
 struct pv_domain
 {
-    l1_pgentry_t **gdt_ldt_l1tab;
-
     atomic_t nr_l4_pages;
 
     /* Is a 32-bit PV guest? */
@@ -524,13 +522,6 @@ struct arch_domain
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
 #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
 
-#define gdt_ldt_pt_idx(v) \
-      ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
-#define pv_gdt_ptes(v) \
-    ((v)->domain->arch.pv.gdt_ldt_l1tab[gdt_ldt_pt_idx(v)] + \
-     (((v)->vcpu_id << GDT_LDT_VCPU_SHIFT) & (L1_PAGETABLE_ENTRIES - 1)))
-#define pv_ldt_ptes(v) (pv_gdt_ptes(v) + 16)
-
 struct pv_vcpu
 {
     /* map_domain_page() mapping cache. */
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 7ddab1949f..35d1761c9c 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -315,7 +315,7 @@ static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
     return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
                                     1U << GDT_LDT_VCPU_SHIFT,
-                                    v->domain->arch.pv.gdt_ldt_l1tab,
+                                    NIL(l1_pgentry_t *),
                                     NULL);
 }
 
@@ -389,8 +389,6 @@ void pv_domain_destroy(struct domain *d)
                               GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
 
     XFREE(d->arch.pv.cpuidmasks);
-
-    FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
 }
 
 void noreturn cf_check continue_pv_domain(void);
@@ -406,12 +404,6 @@ int pv_domain_initialise(struct domain *d)
 
     pv_l1tf_domain_init(d);
 
-    d->arch.pv.gdt_ldt_l1tab =
-        alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
-    if ( !d->arch.pv.gdt_ldt_l1tab )
-        goto fail;
-    clear_page(d->arch.pv.gdt_ldt_l1tab);
-
     if ( levelling_caps & ~LCAP_faulting &&
          (d->arch.pv.cpuidmasks = xmemdup(&cpuidmask_defaults)) == NULL )
         goto fail;
-- 
2.55.0


