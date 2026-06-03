Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AB6CD6E57
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 15:14:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326812.1592144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnIn-00010h-Mp; Wed, 03 Jun 2026 15:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326812.1592144; Wed, 03 Jun 2026 15:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnIn-00010V-I0; Wed, 03 Jun 2026 15:14:41 +0000
Received: by outflank-mailman (input) for mailman id 1326812;
 Wed, 03 Jun 2026 15:14:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUnIm-0000ya-1a
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:14:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnIl-007eN6-EX
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:14:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2044dd-bab6-0a2a0a5309dd-0a2a4505e5f2-8
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:14:39 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2044de-aaa8-0a2a45050019-a065830897c8-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:14:39 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id BBE3243469EE;
 Wed,  3 Jun 2026 11:13:31 -0400 (EDT)
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
Subject: [PATCH v2 2/2] tools/tests/native: Add test for offlined buddy head PFN_ORDER
Date: Wed,  3 Jun 2026 16:11:44 +0100
Message-Id: <0e10a54c715e01fd4d2fb54a70668f0cc52d9f8e.1780499500.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780499500.git.bernhard.kaindl@citrix.com>
References: <cover.1780499500.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780499679-E1F9C443-B509243E/0/0
X-purgate-type: clean
X-purgate-size: 3487

Add a regression test to check that the PFN_ORDER(pg) of buddy heads
is reset to 0 when they become offline single pages which have been
moved of the offlined page lists.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/offline-head-order.c | 74 +++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 tools/tests/native/offline-head-order.c

diff --git a/tools/tests/native/offline-head-order.c b/tools/tests/native/offline-head-order.c
new file mode 100644
index 000000000000..20c4f36526c1
--- /dev/null
+++ b/tools/tests/native/offline-head-order.c
@@ -0,0 +1,74 @@
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
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#define CONFIG_SYSCTL
+#include "harness/native.h"
+
+static void test_offline_head_order(int start_mfn)
+{
+    struct page_info *page = frame_table + start_mfn;
+    uint32_t status = 0;
+
+    /* Seed a single order-1 buddy onto the heap. */
+    test_page_list_add_buddy(page, order1);
+    ASSERT(PFN_ORDER(page) == 1);
+    /* Offline the head page. */
+    ASSERT(offline_page(page_to_mfn(page), 0, &status) == 0);
+    ASSERT(status == PG_OFFLINE_OFFLINED);
+
+    /* Check the order of the offlined head page. */
+    ASSERT(PFN_ORDER(page) == 0);
+
+    /*
+     * Allocate the successor page of the offlined page. This prevents
+     * the normal successor page merge when the page is re-onlined below.
+     */
+    struct page_info *pg = alloc_domheap_pages(dom1, order0, 0);
+    ASSERT(pg == page + 1);
+    ASSERT(FREE_PAGES == 0);
+
+    /* Online the offlined former head page. */
+    ASSERT(online_page(page_to_mfn(page), &status) == 0);
+    ASSERT(status & PG_ONLINE_ONLINED);
+    ASSERT(FREE_PAGES == 1);
+
+    /*
+     * Confirm the order of the onlined former head page is 0, independently
+     * of the order returned by PFN_ORDER() for the offlined page. This should
+     * always be successful because page_offlined_list only contains single
+     * pages and online_page() ignores PFN_ORDER(pg) of the page. It calls
+     * free_heap_pages() passing the order hardcoded to 0. This causes it to
+     * pass the given order 0 to page_list_add_scrub(). This causes it to set
+     * the order of the page to 0 before it adds the page to the free list.
+     */
+    ASSERT(PFN_ORDER(page) == 0);
+}
+
+int main(int argc, char *argv[])
+{
+    const char *topic = "Test offlined head page to be updated to PFN_ORDER 0";
+    if ( !parse_args(argc, argv, topic) )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+    RUN_TESTCASE("TOHP", test_offline_head_order, 2);
+    return test_complete();
+}
-- 
2.39.5


