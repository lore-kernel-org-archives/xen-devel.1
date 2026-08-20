Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA17C5DF89
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 17:44:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396851.1634538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6oF-0002Ei-UW; Thu, 20 Aug 2026 17:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396851.1634538; Thu, 20 Aug 2026 17:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6oF-0002EZ-PI; Thu, 20 Aug 2026 17:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1396851;
 Thu, 20 Aug 2026 17:44:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wx6oE-0001yp-G0
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:44:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6oD-00E24I-2r;
 Thu, 20 Aug 2026 17:44:09 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6oD-00DjFg-1F;
 Thu, 20 Aug 2026 17:44:09 +0000
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
	bh=oJNvo8JLdTW3Dqid1mmBEIeehjw6UcTmR3AblTiyPqc=; b=YbMXUi63sZKy5I28G0wUZLoKxQ
	y7swpzEgPhHbQxJ5BItN+sT9hbK/KHHwbKYrYM4gFA/AFnebVE8RqPxOxAX3feR+behZhCI/6xig8
	/oYIzm68ix8KF2TLDHF2xgENXKiwUJsugl1DFqPvlttX3zzhl1FXMtLrQBHxkOAdzZbs=;
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
Subject: [PATCH 6/7] x86/pv: remove stashing of GDT/LDT L1 page-tables
Date: Thu, 20 Aug 2026 18:43:46 +0100
Message-ID: <20260820-asi-part1-6-f2dbd92b8459@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

There are no remaining users of the stashed L1 page-tables in
d->arch.pv.gdt_ldt_l1tab.  Remove it, and all helpers.

pv_create_gdt_ldt_l1tab() now passes NIL() rather than the stash
array.  create_perdomain_mapping() still eagerly allocates the L1
tables covering the GDT/LDT range, but their addresses are no longer
handed back.  Doing this is necessary because
populate_perdomain_mapping() only fills existing tables, and treats
missing structure as a bug.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
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
index 2c9efd59bf..7eab2ff597 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -287,8 +287,6 @@ struct time_scale {
 
 struct pv_domain
 {
-    l1_pgentry_t **gdt_ldt_l1tab;
-
     atomic_t nr_l4_pages;
 
     /* Is a 32-bit PV guest? */
@@ -525,13 +523,6 @@ struct arch_domain
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


