Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57152CA5FFF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:41:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442101.1659635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP55-0006GT-Uu; Wed, 07 Oct 2026 10:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442101.1659635; Wed, 07 Oct 2026 10:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP55-0006FP-Od; Wed, 07 Oct 2026 10:41:03 +0000
Received: by outflank-mailman (input) for mailman id 1442101;
 Wed, 07 Oct 2026 10:41:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEP54-0006DW-2I
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:41:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP53-001biB-2h;
 Wed, 07 Oct 2026 10:41:01 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP52-001QnT-30;
 Wed, 07 Oct 2026 10:41:01 +0000
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
	bh=6F4975xROA4Reejah9p3olstS3Fw/yLAgfx1ings2V8=; b=nmlrjvuu3lPXyJn0kGJ9MeqIEV
	sg9DtgM5em1DTeXrSTinPasdGpSch/Kl1QigB5IDM+SaHf6YbwS+2DcxpFqzjCYD2ZI+srlGZphO4
	2QgwM//vGv8UvussFgbA258MQMW903xs/KfYOBXKWQg8H17b8oiudJFwgRaubM6Hteb0=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 02/18] x86/mm: purge unneeded destroy_perdomain_mapping()
Date: Wed,  7 Oct 2026 11:40:35 +0100
Message-ID: <20261007104051.48841-3-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

We want to change per-domain mappings to be per-vCPU mappings.  In
preparation for that, we want to arrange that
destroy_perdomain_mapping() work either with a single perdomain area,
or with a per-vCPU perdomain area.

There are two calls made from domain-scoped contexts; both calls turn
out to be unnecessary:

- destroy_perdomain_mapping() is not logically the undo of
  create_perdomain_mapping(), as the name and its use in
  hvm_domain_initialise() suggest.  create_ allocates a per-domain L3,
  but destroy_ tears down mappings without freeing it; and since the
  call here passes nr == 0, it tears down nothing at all.  The
  per-domain L3 page is actually freed by free_perdomain_mappings(),
  which hvm_domain_initialise()'s caller, arch_domain_create(),
  already invokes on its failure path.

- The call in pv_domain_destroy() is redundant at both of its call
  sites.  arch_domain_destroy() unconditionally calls
  free_perdomain_mappings(), which tears down the same entries and
  additionally frees the page-table structures; and the other caller,
  the error path of pv_domain_initialise(), returns into
  arch_domain_create()'s failure path, which invokes
  free_perdomain_mappings() as well.

One vCPU-scoped caller, pv_destroy_gdt_ldt_l1tab(), is covered the
same way: a vCPU is only ever destroyed together with its domain, or
on the failure path of creating it, and both routes end in
free_perdomain_mappings(); the GDT/LDT slots hold no area-owned pages,
so there is nothing else for the call to do.  While we're getting rid
of unneccessary callers, drop this one too.

Note that free_compat_arg_xlat() keeps its explicit teardown: in
addition to vCPU teardown, it serves switch_compat()'s undo path,
where the domain lives on as a 64-bit one and the argument-translation
pages have to go.  Add a comment to make sure it isn't missed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- Note that pv_domain_destroy()'s other call site, the error path of
  pv_domain_initialise(), is covered the same way (Jan).
- Also drop pv_destroy_gdt_ldt_l1tab(), the per-vCPU teardown call
  (Jan), and comment on why free_compat_arg_xlat() keeps its own.  The
  Reviewed-by tags given for the previous form are dropped.

Changes in v2:
- Added to the series

Changes since the previously posted version:
- Reworked the commit message to make it more clear how it fits in
  with the larger series.  No functional change.
---
 xen/arch/x86/hvm/hvm.c   |  1 -
 xen/arch/x86/pv/domain.c | 10 ----------
 xen/arch/x86/x86_64/mm.c |  5 +++++
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 192309c2fc..3924c1b204 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -730,7 +730,6 @@ int hvm_domain_initialise(struct domain *d,
     XFREE(d->arch.hvm.irq);
  fail0:
     hvm_destroy_cacheattr_region_list(d);
-    destroy_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0);
  fail:
     hvm_domain_relinquish_resources(d);
     XFREE(d->arch.hvm.io_handler);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 03262a4952..07ea4bb4d2 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -332,12 +332,6 @@ static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
                                     NULL);
 }
 
-static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
-{
-    destroy_perdomain_mapping(v->domain, GDT_VIRT_START(v),
-                              1U << GDT_LDT_VCPU_SHIFT);
-}
-
 void pv_vcpu_destroy(struct vcpu *v)
 {
     if ( is_pv_32bit_vcpu(v) )
@@ -346,7 +340,6 @@ void pv_vcpu_destroy(struct vcpu *v)
         release_compat_l4(v);
     }
 
-    pv_destroy_gdt_ldt_l1tab(v);
     XFREE(v->arch.pv.trap_ctxt);
 }
 
@@ -394,9 +387,6 @@ void pv_domain_destroy(struct domain *d)
 {
     pv_l1tf_domain_destroy(d);
 
-    destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
-                              GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
-
     XFREE(d->arch.pv.cpuidmasks);
 
     FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 8eadab7933..2a1805964d 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -737,6 +737,11 @@ int setup_compat_arg_xlat(struct vcpu *v)
                                     NULL, NIL(struct page_info *));
 }
 
+/*
+ * Besides vCPU teardown, which free_perdomain_mappings() would cover, this
+ * serves switch_compat()'s undo path: the domain lives on as a 64-bit one
+ * there, so the translation area has to go right away.
+ */
 void free_compat_arg_xlat(struct vcpu *v)
 {
     destroy_perdomain_mapping(v->domain, ARG_XLAT_START(v),
-- 
2.55.0


