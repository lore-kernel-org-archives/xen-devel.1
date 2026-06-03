Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F09CD6E55
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 14:21:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326526.1591955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmSr-0002Vn-J8; Wed, 03 Jun 2026 14:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326526.1591955; Wed, 03 Jun 2026 14:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmSr-0002Vg-EV; Wed, 03 Jun 2026 14:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1326526;
 Wed, 03 Jun 2026 14:21:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUmSr-0002VM-3Y
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:21:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmSq-007ZEB-G3
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:21:00 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a20384c-5cb7-0a2a0a5109dd-0a2a4507de02-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:21:00 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a20384b-229c-0a2a45070019-a0658308ab14-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:21:00 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id CEB3A4345DCB;
 Wed,  3 Jun 2026 10:19:52 -0400 (EDT)
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
Subject: [PATCH v2 2/2] tools/tests: Regression test checking unaligned pages after offlining
Date: Wed,  3 Jun 2026 15:17:27 +0100
Message-Id: <65cdc02f719eb9a3c72c9d5905d8387479c25e51.1780495548.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780495548.git.bernhard.kaindl@citrix.com>
References: <cover.1780495548.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780496460-21165C48-1A858566/0/0
X-purgate-type: clean
X-purgate-size: 3766

Add a regression test to check that offlining pages does not return
a misaligned buddy like to the free lists after reseving the first
offlined sub-page from a buddy and returning the healthy  to the free list:

   +---------------+-----------------+-----------------+----------------+
   | offlined page |     head page with a tail page    | single page    |
   +---------------+-----------------+-----------------+----------------+

After a seres of allocations and frees, such an unaligned buddy would
trigger a Xen BUG if this state is reached when the tail is allocated:

  +---------------+-----------------+-----------------+
  | offlined page |    head page         tail page    |
  +---------------+-----------------+-----------------+----------------+
                                    |   in-use page   |   in-use page  |
                                    +-----------------+----------------+

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/offline-unaligned.c | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 tools/tests/native/offline-unaligned.c

diff --git a/tools/tests/native/offline-unaligned.c b/tools/tests/native/offline-unaligned.c
new file mode 100644
index 000000000000..198bf952ba7d
--- /dev/null
+++ b/tools/tests/native/offline-unaligned.c
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Regression test offlining to not return misaligned buddies to free lists.
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#include "harness/native.h"
+
+/*
+ * Verify that offlining the head page of an order-2 buddy does not return
+ * a misaligned buddy to the free list, and the pages returned to the free
+ * list are usable for allocations.
+ */
+static void test_unaligned_buddy_merge(int start_mfn)
+{
+    struct page_info *pg = frame_table + start_mfn;
+    uint32_t status = 0;
+
+    /*
+     * Prepare a valid order-2 buddy (4 pages) with this layout:
+     * +---------------+-----------------+-----------------+----------------+
+     * | head page     | tail page 1     | tail page 2     | tail page 3    |
+     * +---------------+-----------------+-----------------+----------------+
+     */
+    test_page_list_add_buddy(pg, order2);
+
+    /* Act */
+    offline_page(page_to_mfn(pg), 0, &status);
+    CHECK(status & PG_OFFLINE_OFFLINED, "Page should be offlined");
+
+    /*
+     * The expected free list state after offlining the buddy head is:
+     * +---------------+---------------+----------------+---------------+
+     * | offlined page |  single page  |    head page with a tail page  |
+     * +---------------+---------------+----------------+---------------+
+     */
+    CHECK(page_aligned(pg + 1), "The buddy #%lu is not aligned to order-%d",
+          mfn_x(page_to_mfn(pg + 1)), PFN_ORDER(pg + 1));
+
+    /* Allocate and free a page to trigger buddy merging on free. */
+    free_domheap_pages(alloc_domheap_pages(dom1, order0, 0), order0);
+    CHECK((pg = alloc_domheap_pages(dom1, order1, 0)), "Alloc the order-1 pg");
+
+    /* Inspect the predecessor (pg is the tail of the unaligned buddy) */
+    CHECK(page_aligned(pg - 1), "The buddy #%lu is not aligned to order-%d!",
+          mfn_x(page_to_mfn(pg - 1)), PFN_ORDER(pg - 1));
+
+    /* Test allocating the remaining page */
+    alloc_domheap_pages(dom1, order0, 0);
+}
+
+int main(int argc, char *argv[])
+{
+    if ( !parse_args(argc, argv, "Test offlining to return aligned buddies") )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+    RUN_TESTCASE("TUBM", test_unaligned_buddy_merge, 4);
+
+    return test_complete();
+}
-- 
2.39.5


