Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C777CD3445
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2026 20:31:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1304115.1577253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLRr6-00020R-Qx; Fri, 08 May 2026 20:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304115.1577253; Fri, 08 May 2026 20:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLRr6-00020K-OR; Fri, 08 May 2026 20:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1304115;
 Fri, 08 May 2026 20:31:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wLRr4-00020C-NW
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 20:31:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLRr4-0008Mq-4d
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:31:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fe4817-5cb7-0a2a0a5109dd-0a2a450adec8-8
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:31:26 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fe481d-56b3-0a2a450a0019-a0658308cc16-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:31:25 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 620124373E19;
 Fri,  8 May 2026 16:30:30 -0400 (EDT)
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v7 1/3] xen/mm: Introduce per-node free page counter
Date: Fri,  8 May 2026 21:27:57 +0100
Message-Id: <a0b83b0781319009c3862389469dc59db59e0b29.1778272036.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1778272036.git.bernhard.kaindl@citrix.com>
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778272286-7176D8B7-6DC2C879/0/0
X-purgate-type: clean
X-purgate-size: 3964

From: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Add node_avail_pages[], updated under heap_lock in sync with
avail[node][zone] to cache the per-node sum of free pages.

Use it in avail_node_heap_pages() to avoid summing all zones on each
call. Guard it with nodeid < MAX_NUMNODES and node_online(nodeid).

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
This patch was originally sent by Alejandro Vallejo:
https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg01130.html

I use node_avail_pages[] in avail_node_heap_pages() as an optimisation.

Verification of the changes:

1. node_avail_pages[node] is updated whenever avail[node][zone] changes,
   so the two remain in sync.

2. avail_node_heap_pages() previously summed all zones of a node and now
   returns node_avail_pages[node], so the same free buddy pages are
   counted.

3. avail_node_heap_pages() returns 0 for offline nodes and for nodes
   >= MAX_NUMNODES as before.

4. avail_node_heap_pages(-1) returned the sum from all nodes, equal
   to total_avail_pages, but this is not used by current callers.
   avail_heap_pages(z, z, -1) is used by other callers for that instead.
   To avoid dead code, a check for -1 to implement this is not added.

Update locations:

- free_heap_pages() increments node_avail_pages[node] alongside
  avail[node][zone] when pages are freed, including during heap
  initialisation.

- alloc_heap_pages() decrements node_avail_pages[node] alongside
  avail[node][zone] when pages are allocated.

- reserve_offlined_page() decrements node_avail_pages[node] alongside
  avail[node][zone] when pages are offlined.

Colored pages do not go through the buddy allocator.
Since they do not update avail[node][zone], they are
not reflected in node_avail_pages[node] either.

N.B. Current callers already iterate over online nodes only.

Changes since v6:
- Preserved the 0 return for offline nodes and nodes >= MAX_NUMNODES.
---
 xen/common/page_alloc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2c4ff2c34c70..7e17bafa1e45 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -485,6 +485,7 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
 
 static unsigned long *avail[MAX_NUMNODES];
 static unsigned long total_avail_pages;
+static unsigned long node_avail_pages[MAX_NUMNODES];
 
 static DEFINE_SPINLOCK(heap_lock);
 /* Total outstanding claims by all domains */
@@ -1050,6 +1051,8 @@ static struct page_info *alloc_heap_pages(
     avail[node][zone] -= request;
     ASSERT(total_avail_pages >= request);
     total_avail_pages -= request;
+    ASSERT(node_avail_pages[node] >= request);
+    node_avail_pages[node] -= request;
 
     if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
     {
@@ -1243,6 +1246,8 @@ static int reserve_offlined_page(struct page_info *head)
         avail[node][zone]--;
         ASSERT(total_avail_pages > 0);
         total_avail_pages--;
+        ASSERT(node_avail_pages[node] > 0);
+        node_avail_pages[node]--;
 
         page_list_add_tail(cur_head,
                            test_bit(_PGC_broken, &cur_head->count_info) ?
@@ -1566,6 +1571,7 @@ static void free_heap_pages(
 
     avail[node][zone] += 1 << order;
     total_avail_pages += 1 << order;
+    node_avail_pages[node] += 1 << order;
     if ( need_scrub )
     {
         node_need_scrub[node] += 1 << order;
@@ -2831,7 +2837,9 @@ unsigned long avail_domheap_pages_region(
 
 unsigned long avail_node_heap_pages(unsigned int nodeid)
 {
-    return avail_heap_pages(MEMZONE_XEN, NR_ZONES -1, nodeid);
+    if ( nodeid < MAX_NUMNODES && node_online(nodeid) )
+        return node_avail_pages[nodeid];
+    return 0;
 }
 
 
-- 
2.39.5


