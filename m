Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113E5606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=f31WC/J4
Received: from list by lists.xenproject.org with outflank-mailman.1470712.1679327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnh-0002kT-Sf; Tue, 03 Nov 2026 23:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470712.1679327; Tue, 03 Nov 2026 23:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnh-0002kL-PU; Tue, 03 Nov 2026 23:20:21 +0000
Received: by outflank-mailman (input) for mailman id 1470712;
 Tue, 03 Nov 2026 23:20:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONng-0002jw-G5
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:20:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONng-0000000CofD-03Xm;
 Tue, 03 Nov 2026 23:20:20 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONnf-0000000EMFa-3ZGa;
 Tue, 03 Nov 2026 23:20:19 +0000
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
	bh=vtDia1dYtGzUpfOhr+PQWn9sLmMvXEnKI84jgzczGq4=; b=f31WC/J4b87av2JxQr7luwD5FJ
	3g+TvCXUdZG2ul0X5l1erbH1VuHgfOfRkhpmnsSGsYanPSEATpF7iAg4h4gWr/Bc7l9POIsEN9tu7
	CNch47ImuHvOO35AmXsW+gTqR26TtubTJAH5U7UlmJ07VgwfL9BQ7n+IUXB2DPrajqoU=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 01/44] x86/mm: allocate the per-domain L3 in arch_domain_create()
Date: Tue,  3 Nov 2026 17:13:23 -0500
Message-ID: <20261103-asi-hvm-v6-1-59dbc5ce9615@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

init_xen_l4_slots() relies on d->arch.perdomain_l3_pg being non-NULL,
or it will fill in a garbage value for slot 260.  Currently, this
is allocated only implicitly, as a side effect of calling
create_perdomain_mapping().  But depending on the specific
circumstances, this may not happen until several hypercalls after the
domain is created.  This is not robust: callers need to keep track of
when exactly certain structures happen to be created to ensure that
init_xen_l4_slots() operates properly.

Since fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT L3 slot at
domain creation"), a PV domain gets its L3 with its first vCPU
(pv_create_gdt_ldt_l1tab()).  Only mapcache_domain_init() makes it
earlier, and release builds skip that unless memory hotplug is enabled
or the host's memory reaches past the part of the directmap PV guests
can see.  So in release builds on most hosts, an L4 that is promoted
before XEN_DOMCTL_max_vcpus has created the domain's vCPUs gets a
slot 260 entry made from a NULL page (0x803e900000000063).  libxl is
unaffected: it creates the vCPUs before it builds or restores a domain.

Allocate it explicitly in arch_domain_create() instead.  Introduce
allocate_perdomain_l3(), which will allocate a page with the
appropriate parameters and zero it.  create_perdomain_mapping() now
requires the L3 to exist, and BUG()s if it does not.

We return a pg rather than setting d->arch.perdomain_l3_pg directly,
because later we'll use the same function to initialize the per-vCPU
perdomain L3.

This removes the need to allocate it semi-implicitly (calling
create_perdomain_mapping() with nr == 0) in hvm_domain_initialise().

Fixes: fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT L3 slot at domain creation")
Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v6:
- New in this version, replacing "x86/mm: refuse to promote an L4 while
  the domain has no per-domain L3": allocate the L3 with the domain
  instead (Jan).
---
 xen/arch/x86/domain.c         |  6 ++++++
 xen/arch/x86/hvm/hvm.c        |  5 -----
 xen/arch/x86/include/asm/mm.h |  1 +
 xen/arch/x86/mm.c             | 32 +++++++++++++++-----------------
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 368e4deff3..e67c336b82 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -901,6 +901,12 @@ int arch_domain_create(struct domain *d,
 
     psr_domain_init(d);
 
+    if ( (d->arch.perdomain_l3_pg = allocate_perdomain_l3(d)) == NULL )
+    {
+        rc = -ENOMEM;
+        goto fail;
+    }
+
     if ( is_hvm_domain(d) )
     {
         if ( (rc = hvm_domain_initialise(d, config)) != 0 )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd057..46d3a520d5 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -620,10 +620,6 @@ int hvm_domain_initialise(struct domain *d,
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
-    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
-    if ( rc )
-        goto fail;
-
     hvm_init_cacheattr_region_list(d);
 
     rc = paging_enable(d, PG_refcounts|PG_translate|PG_external);
@@ -731,7 +727,6 @@ int hvm_domain_initialise(struct domain *d,
  fail0:
     hvm_destroy_cacheattr_region_list(d);
     destroy_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0);
- fail:
     hvm_domain_relinquish_resources(d);
     XFREE(d->arch.hvm.io_handler);
     XFREE(d->arch.hvm.pl_time);
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index aa515efbee..e77ac5ccdf 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -606,6 +606,7 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 #define NIL(type) ((type *)-sizeof(type))
 #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
 
+struct page_info *allocate_perdomain_l3(struct domain *d);
 int create_perdomain_mapping(struct domain *d, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a1b7770db0..63e6aadcda 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6235,6 +6235,16 @@ static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
            (_PAGE_PRESENT | _PAGE_AVAIL0);
 }
 
+struct page_info *allocate_perdomain_l3(struct domain *d)
+{
+    struct page_info *pg = alloc_domheap_page(d, MEMF_no_owner);
+
+    if ( pg )
+        clear_domain_page(page_to_mfn(pg));
+
+    return pg;
+}
+
 int create_perdomain_mapping(struct domain *d, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg)
@@ -6248,24 +6258,12 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
     ASSERT(va >= PERDOMAIN_VIRT_START &&
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
 
-    if ( !d->arch.perdomain_l3_pg )
-    {
-        pg = alloc_domheap_page(d, MEMF_no_owner);
-        if ( !pg )
-            return -ENOMEM;
-        l3tab = __map_domain_page(pg);
-        clear_page(l3tab);
-        d->arch.perdomain_l3_pg = pg;
-        if ( !nr )
-        {
-            unmap_domain_page(l3tab);
-            return 0;
-        }
-    }
-    else if ( !nr )
+    BUG_ON(!d->arch.perdomain_l3_pg);
+
+    if ( !nr )
         return 0;
-    else
-        l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+
+    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
 
     ASSERT(!l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
-- 
2.56.0


