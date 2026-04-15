Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E30F41995
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2026 17:50:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282779.1565251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Nf-00041i-FZ; Wed, 15 Apr 2026 17:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282779.1565251; Wed, 15 Apr 2026 17:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Nf-00041a-Ch; Wed, 15 Apr 2026 17:50:27 +0000
Received: by outflank-mailman (input) for mailman id 1282779;
 Wed, 15 Apr 2026 17:50:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wD4Ne-000419-NP
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:50:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD4Ne-003Aog-49
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 19:50:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfcfdf-bab6-0a2a0a5309dd-0a2a4508c2ca-14
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:50:26 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfcfe1-fab6-0a2a45080019-a06583088420-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:50:25 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id A982A4290110;
 Wed, 15 Apr 2026 13:49:41 -0400 (EDT)
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
Subject: [PATCH 4/4] xen/mm: Recall claims when offlining pages if needed
Date: Wed, 15 Apr 2026 18:34:59 +0100
Message-Id: <c9f2ceb6568223302a0dd92f9681de89953fe00b.1776273656.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776273656.git.bernhard.kaindl@citrix.com>
References: <cover.1776273656.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1776275426-7694D497-AB44D8E1/0/0
X-purgate-type: clean
X-purgate-size: 4038

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
index d22d270ceeb4..0844c792e740 100644
--- a/tools/tests/alloc/test-offlining-claims.c
+++ b/tools/tests/alloc/test-offlining-claims.c
@@ -41,9 +41,7 @@ static void test_offlining_with_global_claims(int mfn)
     /* ASSERT */
     CHECK_BUDDY(page, "After offlining the 2nd page");
     CHECK(FREE_PAGES == 2, "Expect 2 free pages after offlining two pages");
-    EXPECTED_TO_FAIL_BEGIN();
     CHECK(TOTAL_CLAIMS == 2, "Expect 2 claims after offlining two pages");
-    EXPECTED_TO_FAIL_END(1);
 }
 
 
@@ -75,9 +73,7 @@ static void test_offlining_with_node_claims(int mfn)
     /* ASSERT */
     CHECK_BUDDY(page, "After offlining the 2nd page");
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


