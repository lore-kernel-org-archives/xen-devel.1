Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87D3CD6E57
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 14:30:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326594.1592010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmbx-0007TH-Mj; Wed, 03 Jun 2026 14:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326594.1592010; Wed, 03 Jun 2026 14:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmbx-0007TA-Ie; Wed, 03 Jun 2026 14:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1326594;
 Wed, 03 Jun 2026 14:30:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUmbw-0007T0-Ts
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:30:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmbw-007VNB-60
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:30:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203a7a-bab6-0a2a0a5309dd-0a2a4507e73c-18
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:30:23 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203a7e-229c-0a2a45070019-a0658309e722-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:30:23 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id BC50E8181B0B;
 Wed,  3 Jun 2026 10:29:04 -0400 (EDT)
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
Subject: [PATCH v2 0/2] xen/mm: Fix off-by-one for tail merge in reserve_offlined_page()
Date: Wed,  3 Jun 2026 15:27:20 +0100
Message-Id: <cover.1780496798.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780497023-23175C48-2253BD39/0/0
X-purgate-type: clean
X-purgate-size: 2419

After offlining pages, reserve_offlined_page() attempts to grow larger
buddies between the offlined pages, but due to an off-by-one, this
fails at the tail end of the span of pages of the containing buddy.

As requested for backporting the fix, the first patch fixes the
issue while the second patch adds the regression test for it.

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

You can pull this series with the regression test environment to run it:
$ git pull git@gitlab.com:bernhardkaindl/xen.git offline-merge-tail-v2
$ make -C tools/tests/native TARGETS=offline-merge-tail test

Fixes: e4865c2315 ('Page offline support in Xen side')
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Bernhard Kaindl (2):
  xen/mm: Fix off-by-one preventing tail merge in
    reserve_offlined_page()
  tools/tests: Add regression test for tail buddy growth

 tools/tests/native/offline-merge-tail.c | 81 +++++++++++++++++++++++++
 xen/common/page_alloc.c                 |  4 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 tools/tests/native/offline-merge-tail.c

-- 
2.39.5


