Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6505CD6E44
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2026 14:58:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1321302.1588186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScBO-0003CU-VC; Thu, 28 May 2026 14:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321302.1588186; Thu, 28 May 2026 14:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScBO-0003CN-SP; Thu, 28 May 2026 14:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1321302;
 Thu, 28 May 2026 14:58:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wScBO-0003Aq-1h
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 14:58:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wScBN-002csK-Ez
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 16:58:01 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1857f3-e002-0a2a0a5209dd-0a2a4509ce40-20
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:58:01 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1857f8-2497-0a2a45090019-a0658308cd42-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:58:01 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id B510943317FA;
 Thu, 28 May 2026 10:56:56 -0400 (EDT)
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
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/2] tools/tests/native: Test merging the tail after an offlined page
Date: Thu, 28 May 2026 15:55:54 +0100
Message-Id: <3e4c306673c9c8825d09a7a15360f553d64cb430.1779980089.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1779980089.git.bernhard.kaindl@citrix.com>
References: <cover.1779980089.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779980281-8876DA53-2DB5664B/0/0
X-purgate-type: clean
X-purgate-size: 6321

After offlining pages, reserve_offlined_page() returns healthy
spans of pages from the buddy it isolated the offlined pages
back to the free lists.

Naturally, it attempts to grow larger buddies, but due to an
off-by-one, this fails at the tail end of the span of pages.

The test seeds the heap with an order-2 buddy and offlines tail page 1:
+---------------+---------------+---------------+---------------+
| head page       tail page 1,    tail page 2     tail page 3   |
| PFN_ORDER(pg)   marked as to                                  |
| == 2            be offlined                                   |
+---------------+---------------+---------------+---------------+

After reserve_offlined_page(), the healthy pages should be:

+---------------+               +---------------+---------------+
| single page   | offlined page | head page       tail page     |
| PFN_ORDER(pg) | not returned  | PFN_ORDER(pg)                 |
| == 0          | to the heap   | == 1                          |
+---------------+               +---------------+---------------+

A trivial off-by-one error in the growth loop stops the growth loop
early, before the tail end of the original buddy, and we end up with:

+---------------+               +---------------+---------------+
| single page   | offlined page | single page   | single page   |
| PFN_ORDER(pg) | not returned  | PFN_ORDER(pg) | PFN_ORDER(pg) |
| == 0          | to the heap   | == 0          | == 0          |
+---------------+               +---------------+---------------+

Running the test:
    make -C tools/tests/native TARGETS=offline-merge-tail test

Test result:
| - Test assertion failed as expected at offline-merge-tail.c:63:
|   The pair of tail pages should be merged into an order-1 buddy

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/offline-merge-tail.c | 93 +++++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 tools/tests/native/offline-merge-tail.c

diff --git a/tools/tests/native/offline-merge-tail.c b/tools/tests/native/offline-merge-tail.c
new file mode 100644
index 000000000000..11c79e3ecc1b
--- /dev/null
+++ b/tools/tests/native/offline-merge-tail.c
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Tests using offline_page() to verify reserve_offlined_page()
+ *
+ * The workflow tested here is offlining a free page:
+ *
+ * 1. offline_page() calls mark_page_offlined() to mark the page.
+ * 2. It calls reserve_heap_page() to find the containing buddy.
+ * 3. It calls reserve_offlined_page() to reserve the marked pages within
+ *    that buddy.
+ *
+ * reserve_offlined_page() then:
+ *
+ * 1. Removes the buddy, a 2^order group of pages, from the free list.
+ * 2. Finds size-aligned spans of healthy pages within it.
+ * 3. Rebuilds healthy buddies from those spans and
+ *    adds them back to the free list via page_list_add_scrub().
+ * 4. Moves offlined subpages to the offlined page lists.
+ *
+ * Another workflow marks an in-use page for offlining and then
+ * relies on free_heap_pages() to call reserve_offlined_page()
+ * when that page is eventually freed.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#define TEST_ENABLE_XC_DOMAIN_C
+#include "harness/native.h"
+
+/* Test merging a surviving tail pair into an order-1 buddy. */
+static void test_merge_tail_pair(int start_mfn)
+{
+    struct page_info *pages = frame_table + start_mfn;
+    uint32_t status = 0;
+
+    /*
+     * Prepare a valid order-2 buddy (4 pages) with this layout:
+     * +---------------+-----------------+-----------------+----------------+
+     * | head page     | tail page 1     | tail page 2     | tail page 3    |
+     * +---------------+-----------------+-----------------+----------------+
+     */
+    test_page_list_add_buddy(pages, order2);
+
+    /* Mark the tail page 3 dirty to verify dirty-state preservation. */
+    pages[3].count_info |= PGC_need_scrub;
+    pages[0].u.free.first_dirty = 3;
+
+    /* Act: Offline the second page. */
+    ASSERT(offline_page(page_to_mfn(pages + 1), 0, &status) == 0);
+    ASSERT(status & PG_OFFLINE_OFFLINED);
+    ASSERT(FREE_PAGES == 3);
+
+    /*
+     * Offlining page 1 results in splitting the original order-2 buddy into:
+     * - pages[0] as an order-0 buddy
+     * - pages[1] is the offlined page, removed from the free list
+     * - pages[2] as an order-0 buddy
+     * - pages[3] as an order-0 buddy:
+     * +---------------+               +---------------+---------------+
+     * | single page   | offlined page | single page   | single page   |
+     * +---------------+               +---------------+---------------+
+     *
+     * Tail 2 & 3 are aligned, so they should be merged into an order-1 buddy:
+     * +---------------+               +---------------+---------------+
+     * | single page   | offlined page |   head page with a tail page  |
+     * +---------------+               +---------------+---------------+
+     */
+    CHECK(PFN_ORDER(&pages[0]) == 0, "Former head page, now order-0");
+    CHECK(PFN_ORDER(&pages[1]) == 0, "Offlined page should be order-0");
+    /* pages[0] and pages[1] were prepared as clean pages and still are. */
+    ASSERT(pages[0].u.free.first_dirty == INVALID_DIRTY_IDX);
+    ASSERT(pages[1].u.free.first_dirty == INVALID_DIRTY_IDX);
+
+    /* The tail pair is expected to be merged into one order-1 buddy. */
+    EXPECT_FAIL_BEGIN();
+    CHECK(PFN_ORDER(&pages[2]) == 1,
+          "The pair of tail pages should be merged into an order-1 buddy");
+    CHECK(pages[2].u.free.first_dirty == 1, "In tail buddy, the 2nd is dirty");
+    /* The tail page of the merged buddy does not use first_dirty. */
+    CHECK(pages[3].u.free.first_dirty == INVALID_DIRTY_IDX,
+          "Tail page of the merged buddy should not set first_dirty");
+    EXPECT_FAIL_END(3);
+}
+
+int main(int argc, char *argv[])
+{
+    const char *topic = "Integration test of offline_page()";
+    if ( !parse_args(argc, argv, topic) )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+    RUN_TESTCASE("TMTP", test_merge_tail_pair, 4);
+    return test_complete();
+}
-- 
2.39.5


