Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF762CD4F54
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 12:47:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1321981.1588393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwcY-0001V6-F5; Fri, 29 May 2026 12:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321981.1588393; Fri, 29 May 2026 12:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwcY-0001Uz-CJ; Fri, 29 May 2026 12:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1321981;
 Fri, 29 May 2026 12:47:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSwcX-0001Sx-9h
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 12:47:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSwcW-00E0DQ-MN
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:47:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198ad7-2eae-0a2a0a5409dd-0a2a4502ce02-20
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:47:24 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198adb-af86-0a2a45020019-a0658309a9f0-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:47:24 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 56E4482767E4;
 Fri, 29 May 2026 08:46:08 -0400 (EDT)
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
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/7] xen/mm: Static memory: Widen domstatic plumbing to unsigned long
Date: Fri, 29 May 2026 13:43:58 +0100
Message-Id: <bd67d70e6c134977e95ac771df3fc720b93b9441.1780058608.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780058608.git.bernhard.kaindl@citrix.com>
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780058844-81573161-D3AC4B9C/0/0
X-purgate-type: clean
X-purgate-size: 3006

As assign_pages() accepts unsigned long nr, we can widen
its domstatic users to pass unsigned long nr_mfns to it:

- acquire_domstatic_pages(), assign_domstatic_pages(): Widen nr_mfns.
- acquire_static_memory_bank() remove check for psize to fit in unsigned int

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/device-tree/static-memory.c | 7 -------
 xen/common/page_alloc.c                | 4 ++--
 xen/include/xen/mm.h                   | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/xen/common/device-tree/static-memory.c b/xen/common/device-tree/static-memory.c
index ffbc12aa24df..e04d6cc06505 100644
--- a/xen/common/device-tree/static-memory.c
+++ b/xen/common/device-tree/static-memory.c
@@ -46,13 +46,6 @@ static mfn_t __init acquire_static_memory_bank(struct domain *d,
 
     device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
     ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
-    if ( PFN_DOWN(*psize) > UINT_MAX )
-    {
-        printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
-               d, *psize);
-        return INVALID_MFN;
-    }
-
     smfn = maddr_to_mfn(*pbase);
     res = acquire_domstatic_pages(d, smfn, PFN_DOWN(*psize), 0);
     if ( res )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 8670233c550d..cb2618f6aee5 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -3368,7 +3368,7 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
 }
 
 static int assign_domstatic_pages(struct domain *d, struct page_info *pg,
-                                  unsigned int nr_mfns, unsigned int memflags)
+                                  unsigned long nr_mfns, unsigned int memflags)
 {
     if ( !d || (memflags & (MEMF_no_owner | MEMF_no_refcount)) )
     {
@@ -3391,7 +3391,7 @@ static int assign_domstatic_pages(struct domain *d, struct page_info *pg,
  * then assign them to one specific domain #d.
  */
 int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
-                                   unsigned int nr_mfns, unsigned int memflags)
+                                   unsigned long nr_mfns, unsigned int memflags)
 {
     struct page_info *pg;
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b4330269418d..48feb664f057 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -107,7 +107,7 @@ bool scrub_free_pages(void);
 void unprepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                                bool need_scrub);
 void free_domstatic_page(struct page_info *page);
-int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
+int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned long nr_mfns,
                             unsigned int memflags);
 
 /* Map machine page range in Xen virtual address space. */
-- 
2.39.5


