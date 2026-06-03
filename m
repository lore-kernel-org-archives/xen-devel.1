Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA88CD6E57
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 15:14:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326793.1592126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnIJ-0000CF-Mz; Wed, 03 Jun 2026 15:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326793.1592126; Wed, 03 Jun 2026 15:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnIJ-0000C8-Ir; Wed, 03 Jun 2026 15:14:11 +0000
Received: by outflank-mailman (input) for mailman id 1326793;
 Wed, 03 Jun 2026 15:14:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUnII-0000C2-46
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:14:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnIH-007eE2-DG
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:14:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2044be-bab6-0a2a0a5309dd-0a2a4506d0d8-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:14:09 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2044c0-7371-0a2a45060019-a0658308a554-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:14:09 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 03B2B43469ED;
 Wed,  3 Jun 2026 11:13:00 -0400 (EDT)
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
Subject: [PATCH v2 0/2] xen/mm: Reset PFN_ORDER for offlined buddy heads
Date: Wed,  3 Jun 2026 16:11:42 +0100
Message-Id: <cover.1780499500.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780499649-7FB7DD75-BF5CEB94/0/0
X-purgate-type: clean
X-purgate-size: 1065

This series fixes an inconsistency in the PFN_ORDER annotation for
pages that are offlined when they are the head of a free buddy.

When reserve_offlined_page() splits a buddy and moves offlined
sub-pages to the offlined lists, the former buddy head would be
left annotated with its original order even though it is now a
single page. While this does not cause functional regressions,
it is misleading.

You can pull this series with the regression test environment to run it:
$ git pull git@gitlab.com:bernhardkaindl/xen.git offline-head-order-v2
$ make -C tools/tests/native TARGETS=offline-head-order test

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Bernhard Kaindl (2):
  xen/mm: reset PFN_ORDER for offlined buddy heads
  tools/tests/native: Add test for offlined buddy head PFN_ORDER

 tools/tests/native/offline-head-order.c | 74 +++++++++++++++++++++++++
 xen/common/page_alloc.c                 |  6 ++
 2 files changed, 80 insertions(+)
 create mode 100644 tools/tests/native/offline-head-order.c

-- 
2.39.5


