Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D57EFCE096
	for <xen-devel@archiver.kernel.org>; Thu, 26 Feb 2026 14:35:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1241848.1542726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcSH-0004W0-EY; Thu, 26 Feb 2026 14:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241848.1542726; Thu, 26 Feb 2026 14:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcSH-0004Vt-Bk; Thu, 26 Feb 2026 14:35:05 +0000
Received: by outflank-mailman (input) for mailman id 1241848;
 Thu, 26 Feb 2026 14:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcSF-0004VT-U5
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:35:03 +0000
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55065a17-1320-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 15:35:01 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 84C00814F34A;
 Thu, 26 Feb 2026 09:34:29 -0500 (EST)
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
X-Inumbo-ID: 55065a17-1320-11f1-9ccf-f158ae23cfc8
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 01/10] xen/page_alloc: Extract code for consuming claims into inline function
Date: Thu, 26 Feb 2026 14:29:15 +0000
Message-Id: <7dd887bc26830d6c50e5bc2606391963e65285a1.1772098423.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1772098423.git.bernhard.kaindl@citrix.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the claims consumption code in preparation for node-claims.
Lays the groundwork for adding the consumption of NUMA claims to it.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/page_alloc.c | 56 +++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 588b5b99cbc7..6f7f30c64605 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -518,6 +518,34 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
     return d->tot_pages;
 }
 
+/* Release outstanding claims on the domain, host and later also node */
+static inline
+void release_outstanding_claims(struct domain *d, unsigned long release)
+{
+    ASSERT(spin_is_locked(&heap_lock));
+    BUG_ON(outstanding_claims < release);
+    outstanding_claims -= release;
+    d->outstanding_pages -= release;
+}
+
+/*
+ * Consume outstanding claimed pages when allocating pages for a domain.
+ * NB. The alloc could (in principle) fail in assign_pages() afterwards. In that
+ * case, the consumption is not reversed, but as claims are used only during
+ * domain build and d is destroyed if the build fails, this has no significance.
+ */
+static inline
+void consume_outstanding_claims(struct domain *d, unsigned long allocation)
+{
+    if ( !d || !d->outstanding_pages )
+        return;
+    ASSERT(spin_is_locked(&heap_lock));
+
+    /* Of course, the domain can only release up its outstanding claims */
+    allocation = min(allocation, d->outstanding_pages + 0UL);
+    release_outstanding_claims(d, allocation);
+}
+
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 {
     int ret = -ENOMEM;
@@ -535,8 +563,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     /* pages==0 means "unset" the claim. */
     if ( pages == 0 )
     {
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
+        release_outstanding_claims(d, d->outstanding_pages);
         ret = 0;
         goto out;
     }
@@ -1048,29 +1075,8 @@ static struct page_info *alloc_heap_pages(
     total_avail_pages -= request;
     ASSERT(total_avail_pages >= 0);
 
-    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
-    {
-        /*
-         * Adjust claims in the same locked region where total_avail_pages is
-         * adjusted, not doing so would lead to a window where the amount of
-         * free memory (avail - claimed) would be incorrect.
-         *
-         * Note that by adjusting the claimed amount here it's possible for
-         * pages to fail to be assigned to the claiming domain while already
-         * having been subtracted from d->outstanding_pages.  Such claimed
-         * amount is then lost, as the pages that fail to be assigned to the
-         * domain are freed without replenishing the claim.  This is fine given
-         * claims are only to be used during physmap population as part of
-         * domain build, and any failure in assign_pages() there will result in
-         * the domain being destroyed before creation is finished.  Losing part
-         * of the claim makes no difference.
-         */
-        unsigned long outstanding = min(d->outstanding_pages + 0UL, request);
-
-        BUG_ON(outstanding > outstanding_claims);
-        outstanding_claims -= outstanding;
-        d->outstanding_pages -= outstanding;
-    }
+    if ( !(memflags & MEMF_no_refcount) )
+        consume_outstanding_claims(d, request);
 
     check_low_mem_virq();
 
-- 
2.39.5


