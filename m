Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3A8CD6E44
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2026 14:58:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1321301.1588178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScBH-0002vc-PG; Thu, 28 May 2026 14:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321301.1588178; Thu, 28 May 2026 14:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScBH-0002vU-LM; Thu, 28 May 2026 14:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1321301;
 Thu, 28 May 2026 14:57:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wScBG-0002uJ-AI
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 14:57:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wScBF-00FGK8-NJ
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 16:57:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1857dc-5cb7-0a2a0a5109dd-0a2a4509abf2-48
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:57:53 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1857f0-2497-0a2a45090019-a0658308bf8c-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:57:53 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 53F2A4346BF6;
 Thu, 28 May 2026 10:56:48 -0400 (EDT)
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
Subject: [PATCH 0/2] xen/mm: Fix off-by-one for tail merge in reserve_offlined_page()
Date: Thu, 28 May 2026 15:55:53 +0100
Message-Id: <cover.1779980089.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779980273-40762A53-1E00BD44/0/0
X-purgate-type: clean
X-purgate-size: 2762

After offlining pages, reserve_offlined_page() returns healthy
spans of pages from the buddy it isolated the offlined pages
back to the free lists.

Naturally, it attempts to grow larger buddies, but due to an
off-by-one, this fails at the tail end of the span of pages.

Patch 1 adds a native regression test that reproduces the problem.
Patch 2 fixes the off-by-one error and updates the regression test.

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

This series is based on the native test environment v3 for NUMA claims
https://lists.xen.org/archives/html/xen-devel/2026-05/msg01163.html

In turn, it is based on the NUMA claim sets v7 series:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg00363.html

You can pull this series with all dependencies for review and test:
$ git pull git@gitlab.com:bernhardkaindl/xen.git offline-merge-tail-v1
$ make -C tools/tests/native TARGETS=offline-merge-tail test

Fixes: e4865c2315 ('Page offline support in Xen side')
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Bernhard Kaindl (2):
  tools/tests/native: Test merging the tail after an offlined page
  xen/mm: Fix off-by-one stopping tail merge in reserve_offlined_page

 tools/tests/native/offline-merge-tail.c | 87 +++++++++++++++++++++++++
 xen/common/page_alloc.c                 |  4 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 tools/tests/native/offline-merge-tail.c

-- 
2.39.5


