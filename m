Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F010DEDB7DF
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2026 09:59:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1274644.1560714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3DE-0004jk-JA; Tue, 07 Apr 2026 09:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274644.1560714; Tue, 07 Apr 2026 09:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3DE-0004jd-Fh; Tue, 07 Apr 2026 09:59:12 +0000
Received: by outflank-mailman (input) for mailman id 1274644;
 Tue, 07 Apr 2026 09:59:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wA3DD-0004i6-49
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 09:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3DC-0065UD-G4
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:59:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d56a-e002-0a2a0a5209dd-0a2a450bb540-48
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:59:10 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d56d-bca8-0a2a450b0019-a06583088bca-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:59:10 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id D8A6B421B5D1;
 Tue,  7 Apr 2026 05:58:29 -0400 (EDT)
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
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/5] xen/mm: alloc pages: Allow free pages to cover a shortfall of claims
Date: Tue,  7 Apr 2026 10:54:27 +0100
Message-Id: <1bd422498a1b258d3a733d12b5ca286d9d48ba58.1775505670.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1775505670.git.bernhard.kaindl@citrix.com>
References: <cover.1775505670.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775555950-EC75A2A1-07870CD3/0/0
X-purgate-type: clean
X-purgate-size: 3139

When an allocation has a shortfall of claims but free, unclaimed
memory can cover this shortfall, allow the allocation to proceed.

In preparation for NUMA claims, refactor this check into a reusable
function. This will enable the same logic to be applied for NUMA nodes.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

---

Changes since v4: Extracted into a dedicated patch and merged the
formerly separate functions into one, as suggested by Jan Beulich.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/page_alloc.c | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 3b0909cc3ce1..0fab1630e318 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -873,6 +873,42 @@ static void check_and_stop_scrub(struct page_info *head)
     }
 }
 
+/*
+ * Allow the request when unclaimed pages suffice, or when a refcounted
+ * domain's outstanding claims cover the shortfall.
+ */
+static bool claims_permit_request(const struct domain *d,
+                                  unsigned long avail_pages,
+                                  unsigned long competing_claims,
+                                  unsigned int memflags,
+                                  unsigned long requested_pages)
+{
+    unsigned long unclaimed_pages;
+
+    ASSERT(spin_is_locked(&heap_lock));
+    ASSERT(avail_pages >= competing_claims);
+
+    /* Start from the free pages not already claimed by other domains. */
+    unclaimed_pages = avail_pages - competing_claims;
+
+    /* Allow the request to proceed when unclaimed pages suffice. */
+    if ( requested_pages <= unclaimed_pages )
+        return true;
+
+    /*
+     * If unclaimed pages are insufficient, only a refcounted domain allocation
+     * may use claims to cover the shortfall.
+     */
+    if ( !d || (memflags & MEMF_no_refcount) )
+        return false;
+
+    /*
+     * Allow the request to proceed when combination of unclaimed pages and the
+     * claims held by the domain cover the shortfall for the requested_pages.
+     */
+    return requested_pages <= unclaimed_pages + d->outstanding_pages;
+}
+
 static struct page_info *get_free_buddy(unsigned int zone_lo,
                                         unsigned int zone_hi,
                                         unsigned int order, unsigned int memflags,
@@ -1017,9 +1053,8 @@ static struct page_info *alloc_heap_pages(
      * Claimed memory is considered unavailable unless the request
      * is made by a domain with sufficient unclaimed pages.
      */
-    if ( (outstanding_claims + request > total_avail_pages) &&
-          ((memflags & MEMF_no_refcount) ||
-           !d || d->outstanding_pages < request) )
+    if ( !claims_permit_request(d, total_avail_pages, outstanding_claims,
+                                memflags, request) )
     {
         spin_unlock(&heap_lock);
         return NULL;
-- 
2.39.5


