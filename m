Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0AACD4F54
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2026 15:08:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1321444.1588222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScLL-00075x-Mc; Thu, 28 May 2026 15:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321444.1588222; Thu, 28 May 2026 15:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScLL-00075q-J1; Thu, 28 May 2026 15:08:19 +0000
Received: by outflank-mailman (input) for mailman id 1321444;
 Thu, 28 May 2026 15:08:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wScLJ-00075k-Ov
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 15:08:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wScLJ-0017c2-5j
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 17:08:17 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a185a60-e002-0a2a0a5209dd-0a2a450c91b0-4
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 17:08:17 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a18587f-62f1-0a2a450c0019-a0658308e5b6-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 17:00:16 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 3BA744347080;
 Thu, 28 May 2026 10:59:11 -0400 (EDT)
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
Subject: [PATCH 0/2] xen/mm: Reset PFN_ORDER for offlined buddy heads
Date: Thu, 28 May 2026 15:58:19 +0100
Message-Id: <cover.1779980244.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779980416-D996DCF5-70E04886/0/0
X-purgate-type: clean
X-purgate-size: 2422

This series fixes an inconsistency in the PFN_ORDER annotation for
pages that are offlined when they are the head of a free buddy.

When reserve_offlined_page() splits a buddy and moves offlined
sub-pages to the offlined lists, the former buddy head would be
left annotated with its original order even though it is now a
single page. While this does not cause functional regressions,
it is misleading.

Patch 1 adds a native regression test that reproduces and documents
the problem. The test seeds an order-1 buddy, offlines the head page,
verifies the tail becomes order-0, and checks the offlined head's order.

Patch 2 resets PFN_ORDER to 0 for offlined buddy heads inside
reserve_offlined_page() when moving the page to the offlined list
and updates the regression test to assert the corrected behaviour.

This series is based on the native test environment v3 for NUMA claims
https://lists.xen.org/archives/html/xen-devel/2026-05/msg01163.html

which in turn is based on the NUMA claim sets v7 series:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg00363.html
Please help to review and ack it (It should be eligible for Xen 4.22)

Pull this series with all dependencies for review/test:

$ git pull git@gitlab.com:bernhardkaindl/xen.git offline-head-order

$ make -C tools/tests/native TARGETS=offline-head-order test |
      grep -C3 PG_OFFLINE_STATUS_OFFLINED

Log of checking the PFN_ORDER() of the offlined page before the fix is applied:

| offline-head-order.c:32: ASSERT(PFN_ORDER(page) == 1)
| offline-head-order.c:34: ASSERT(offline_page(page_to_mfn(page), 0, &status) == 0)
| offline-head-order.c:35: ASSERT(status == PG_OFFLINE_OFFLINED)
| offline-head-order.c:39: ASSERT(query_page_offline(page_to_mfn(page), &status) == 0)
| offline-head-order.c:40: ASSERT(status == PG_OFFLINE_STATUS_OFFLINED)
|
| - Test assertion failed as expected at offline-head-order.c:44:
|   Assertion failed: PFN_ORDER(page) == 0

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Bernhard Kaindl (2):
  tools/tests/native: Add test for offlined buddy head PFN_ORDER
  xen/mm: reset PFN_ORDER for offlined buddy heads

 tools/tests/native/offline-head-order.c | 79 +++++++++++++++++++++++++
 xen/common/page_alloc.c                 |  7 +++
 2 files changed, 86 insertions(+)
 create mode 100644 tools/tests/native/offline-head-order.c

-- 
2.39.5


