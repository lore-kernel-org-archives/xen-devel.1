Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B4DCD6E55
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 14:31:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326614.1592027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmcW-0008Q8-6U; Wed, 03 Jun 2026 14:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326614.1592027; Wed, 03 Jun 2026 14:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmcW-0008Q1-3u; Wed, 03 Jun 2026 14:31:00 +0000
Received: by outflank-mailman (input) for mailman id 1326614;
 Wed, 03 Jun 2026 14:30:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUmcU-0008PZ-V8
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:30:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmcU-007Vco-Bw
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:30:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203a97-bab6-0a2a0a5309dd-0a2a4504c2c2-32
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:30:57 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203a9f-1dec-0a2a45040019-a0658308bfce-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:30:56 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id E5E0A4346021;
 Wed,  3 Jun 2026 10:29:47 -0400 (EDT)
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
Subject: [PATCH v2 1/2] xen/mm: Fix off-by-one preventing tail merge in reserve_offlined_page()
Date: Wed,  3 Jun 2026 15:27:21 +0100
Message-Id: <f2ed440fa3d2ca62c77868a60061168630d9fb6d.1780496798.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780496798.git.bernhard.kaindl@citrix.com>
References: <cover.1780496798.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1780497056-2AB633FF-665CB41B/0/0
X-purgate-type: clean
X-purgate-size: 3140

reserve_offlined_page() reserves pages marked for offlining and
returns free buddies from the remaining healthy tail pages back
to the free list.

Consider an order-2 buddy (4 pages) with the following layout:
+---------------+---------------+---------------+---------------+
| head page       tail page 1,    tail page 2     tail page 3   |
| PFN_ORDER(pg)   marked as to                                  |
| == 2            be offlined                                   |
+---------------+---------------+---------------+---------------+

The expected result after removing tail page 1 and returning the
remaining healthy pages to the free list would be:

+---------------+               +---------------+---------------+
| single page   | offlined page | head page       tail page     |
| PFN_ORDER(pg) | not returned  | PFN_ORDER(pg)                 |
| == 0          | to the heap   | == 1                          |
+---------------+               +---------------+---------------+

A trivial off-by-one error in the growth loop stops the growth loop
early before the tail end of the original buddy and we end up with:

+---------------+               +---------------+---------------+
| single page   | offlined page | single page   | single page   |
| PFN_ORDER(pg) | not returned  | PFN_ORDER(pg) | PFN_ORDER(pg) |
| == 0          | to the heap   | == 0          | == 0          |
+---------------+               +---------------+---------------+

If the offlined page was in a much larger buddy, this would lead
to much more memory not available for higher order allocations
requiring the full tail end of the original buddy for allocation.

Fix the growth loop to correctly grow the buddy to the tail end
to make the full allocation unit available for future allocation.

Fixes: e4865c2315 ('Page offline support in Xen side')
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
- Bugfix isolated from the test case for backporting.
- Removed stray blank from the line that I touch.
- Title: Replaced stopping with preventing.
- Title: Added parentheses after reserve_offlined_page().
---
 xen/common/page_alloc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2767376a710b..e01ac3e99c72 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1195,11 +1195,13 @@ static int reserve_offlined_page(struct page_info *head)
 
         next_order = cur_order = 0;
 
+        /* Attempt to grow the order (size) of the buddy as much as possible. */
         while ( cur_order < head_order )
         {
             next_order = cur_order + 1;
 
-            if ( (cur_head + (1 << next_order)) >= (head + ( 1 << head_order)) )
+            /* Do not grow to next_order if it would go beyond the buddy. */
+            if ( (cur_head + (1 << next_order)) > (head + (1 << head_order)) )
                 goto merge;
 
             /* Do not grow to next_order if cur_head is not aligned to it. */
-- 
2.39.5


