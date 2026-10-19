Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC56606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=4ypTgErH
Received: from list by lists.xenproject.org with outflank-mailman.1454763.1668282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGR-0005oG-Vg; Mon, 19 Oct 2026 19:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454763.1668282; Mon, 19 Oct 2026 19:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGR-0005o9-SZ; Mon, 19 Oct 2026 19:43:19 +0000
Received: by outflank-mailman (input) for mailman id 1454763;
 Mon, 19 Oct 2026 19:43:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItGQ-0005l1-Fu
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:43:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGQ-000000022js-0xCB;
 Mon, 19 Oct 2026 19:43:18 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGP-00000001FjN-44FX;
 Mon, 19 Oct 2026 19:43:17 +0000
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
	bh=gVZuKX9SYj+BXemwpZoxl0keumPErYRZAVZ10RQNwMQ=; b=4ypTgErHnSe8mBjfFUTfHIqJzn
	yeBSQhXXpoISNR4eZo5O2S6gT26l9DBcKRYRigqNwuBekiz36jrdZwxkShvoBwcU1G3ZEdcvv3LCQ
	dt1jBQ2zrsODVGcUWADvQgDPxGR/rbX5ddUeajgTyvFpthdoczv0DyjaxxrNtogg8owU=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 03/30] x86/mm: purge unneeded destroy_perdomain_mapping()
Date: Mon, 19 Oct 2026 20:42:34 +0100
Message-ID: <20261019-asi-hvm-v4-3-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
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

Note that free_compat_arg_xlat() keeps its explicit teardown:
switch_compat() calls it on the failure path.  While in practice most
toolstacks will immediately destroy the domain, in theory a toolstack
could let it live on as a 64-bit guest.  Release the resources
immediately rather than waiting for domain destruction.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
- Remove an unnecessary comment (Jan).

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
 2 files changed, 11 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd057..6aefe91e02 100644
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
index 0c42ae58aa..28ea0742ab 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -319,12 +319,6 @@ static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
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
@@ -333,7 +327,6 @@ void pv_vcpu_destroy(struct vcpu *v)
         release_compat_l4(v);
     }
 
-    pv_destroy_gdt_ldt_l1tab(v);
     XFREE(v->arch.pv.trap_ctxt);
 }
 
@@ -381,9 +374,6 @@ void pv_domain_destroy(struct domain *d)
 {
     pv_l1tf_domain_destroy(d);
 
-    destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
-                              GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
-
     XFREE(d->arch.pv.cpuidmasks);
 
     FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
-- 
2.55.0


