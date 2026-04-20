Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1DEF588C5
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 13:26:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1285909.1567088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEodo-0007MZ-3L; Mon, 20 Apr 2026 13:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285909.1567088; Mon, 20 Apr 2026 13:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEodn-0007MS-Ux; Mon, 20 Apr 2026 13:26:19 +0000
Received: by outflank-mailman (input) for mailman id 1285909;
 Mon, 20 Apr 2026 13:26:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wEodm-0007M4-LO
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:26:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEodm-00B2Mn-29
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:26:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e62968-e002-0a2a0a5209dd-0a2a4506b792-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:26:18 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e62977-7371-0a2a45060019-a0658308d85c-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:26:16 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id DFFED420DE01;
 Mon, 20 Apr 2026 09:25:29 -0400 (EDT)
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
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/4] xen/mm: Recall claims when offlining pages if needed
Date: Mon, 20 Apr 2026 14:19:44 +0100
Message-Id: <ebc02ab7b6fe81946ccf5833a44d57fb4a3239a4.1776690702.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776690702.git.bernhard.kaindl@citrix.com>
References: <cover.1776690702.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776691576-51361D75-B170C3DC/0/0
X-purgate-type: clean
X-purgate-size: 3980

Fix a bug where offlining pages could cause an unsigned underflow
in total_avail_pages - outstanding_claims, leading to incorrect
claim behavior.

This issue arises when outstanding claims are close to the total
available pages. It occurse when domain_set_outstanding_claims()
and domain_install_claim_set effectively do this:

 unsigned long avail_pages = total_avail_pages - outstanding_claims;

When this unsigned subtraction underflows, staking claims can succeed
even when there is insufficient unclaimed memory for the new claim.
This leads to a state where claims always succeed, regardless of
actual memory availability.

To prevent this, recall claims when offlining pages if needed to maintain
equilibrium between `total_avail_pages` and outstanding claims for global
and for per-NUMA-node claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/alloc/test-offlining-claims.c |  4 ---
 xen/common/page_alloc.c                   | 42 +++++++++++++++++++++++
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/tools/tests/alloc/test-offlining-claims.c b/tools/tests/alloc/test-offlining-claims.c
index a0580af82ef5..69a3e8f82e6b 100644
--- a/tools/tests/alloc/test-offlining-claims.c
+++ b/tools/tests/alloc/test-offlining-claims.c
@@ -23,9 +23,7 @@ static void test_offlining_with_global_claims(int mfn)
     ASSERT(status & PG_OFFLINE_OFFLINED);
 
     CHECK(FREE_PAGES == 2, "Expect 2 free pages after offlining two pages");
-    EXPECTED_TO_FAIL_BEGIN();
     CHECK(TOTAL_CLAIMS == 2, "Expect 2 claims after offlining two pages");
-    EXPECTED_TO_FAIL_END(1);
 }
 
 
@@ -53,9 +51,7 @@ static void test_offlining_with_node_claims(int mfn)
     ASSERT(status & PG_OFFLINE_OFFLINED);
 
     CHECK(FREE_PAGES == 2, "Expect 2 free pages after offlining two pages");
-    EXPECTED_TO_FAIL_BEGIN();
     CHECK(TOTAL_CLAIMS == 2, "Expect 2 claims after offlining two pages");
-    EXPECTED_TO_FAIL_END(1);
 }
 
 int main(int argc, char *argv[])
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 6101bd6be9a9..adedf6fae590 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1575,6 +1575,48 @@ static int reserve_offlined_page(struct page_info *head)
         count++;
     }
 
+    if ( count )
+    {
+        long recall_pages;
+        struct domain *d;
+
+        /* Ensure that claims on the node are in line with its free memory. */
+        recall_pages = node_outstanding_claims[node] - node_avail_pages[node];
+        if ( recall_pages > 0 )
+            /*
+             * node_avail_pages slipped below node_outstanding_claims.
+             * We need to recall claimed pages until the amount of claimed
+             * memory is in line with the amount of available memory again.
+             */
+            for_each_domain ( d )
+            {
+                if ( d->claims[node] )
+                {
+                    recall_pages -= deduct_node_claims(d, node, recall_pages);
+                    if ( recall_pages <= 0 )
+                        break;
+                }
+            }
+
+        /* Ensure that outstanding claims are in line with available memory. */
+        recall_pages = outstanding_claims - total_avail_pages;
+        if ( recall_pages > 0 )
+            /*
+             * total_avail_pages slipped below outstanding_claims.
+             * We need to recall claimed pages until the amount of claimed
+             * memory is in line with the amount of available memory again.
+             */
+            for_each_domain ( d )
+            {
+                if ( d->global_claims )
+                {
+                    recall_pages -= deduct_global_claims(d, recall_pages);
+                    if ( recall_pages <= 0 )
+                        break;
+                }
+            }
+    }
+
     return count;
 }
 
-- 
2.39.5


