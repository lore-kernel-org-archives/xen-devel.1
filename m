Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26DACD6E55
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 14:20:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326488.1591937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmSF-0001Yo-RO; Wed, 03 Jun 2026 14:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326488.1591937; Wed, 03 Jun 2026 14:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmSF-0001Yh-Ni; Wed, 03 Jun 2026 14:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1326488;
 Wed, 03 Jun 2026 14:20:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUmSE-0001YZ-JL
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:20:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmSD-007Yyr-Qh
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:20:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203820-e002-0a2a0a5209dd-0a2a4502e258-18
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:20:21 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203824-af86-0a2a45020019-a0658309950c-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:20:21 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 0A6228244E4C;
 Wed,  3 Jun 2026 10:19:02 -0400 (EDT)
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
Subject: [PATCH v2 0/2] xen/mm: Ensure page offlining only creates properly aligned buddies
Date: Wed,  3 Jun 2026 15:17:25 +0100
Message-Id: <cover.1780495548.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780496421-AA175161-32080734/0/0
X-purgate-type: clean
X-purgate-size: 3794

This series fixes a bug in reserve_offlined_page() where growing
buddies around offlined pages may create misaligned buddies and
return them to the free lists.

For example, pages may be offlined following an MCE caused by faulty RAM.
Once a misaligned buddy has been placed on a free list, a particular
sequence of allocations and frees may cause the same page to be allocated
more than once, eventually triggering a Xen BUG() in alloc_heap_pages().

As requested for backporting the fix, the first patch adds the alignment
check while the second patch now adds the regression test for this issue.

As minimal example, consider an order-2 buddy (4 pages) with this layout:

   +---------------+-----------------+-----------------+----------------+
   | head page     | tail page 1     | tail page 2     | tail page 3    |
   +---------------+-----------------+-----------------+----------------+

reserve_offline_page() then merges unaligned tail pages:

   +---------------+-----------------+-----------------+----------------+
   | offlined page |     head page with a tail page    | single page    |
   +---------------+-----------------+-----------------+----------------+

When a single page is allocated from this buddy, MFN 7 is allocated:

        MFN 4             MFN 5             MFN 6             MFN 7
  +---------------+-----------------+-----------------+----------------+
  | offlined page |    head page        tail page     | allocated page |
  +---------------+-----------------+-----------------+----------------+

If MFN 7 is freed, the predecessor merge in free_heap_pages() kicks in,
merging MFN 7 with its naturally aligned predecessor page at MFN 6:

        MFN 4             MFN 5             MFN 6            MFN 7
  +---------------+-----------------+-----------------+
  | offlined page |    head page         tail page    |
  +---------------+-----------------+-----------------+----------------+
                                    |    head page        tail page    |
                                    +-----------------+----------------+

The next allocations would allocate MFN 7 again and MFN 6 as well:

        MFN 4             MFN 5             MFN 6            MFN 7
  +---------------+-----------------+-----------------+
  | offlined page |    head page         tail page    | <- BUG() on alloc
  +---------------+-----------------+-----------------+----------------+
                                    |   in-use page   |   in-use page  |
                                    +-----------------+----------------+

When the next page from this buddy is allocated, get_free_page() returns
the buddy head MFN 5. An order-0 allocation splits page 6, or an order-1
allocation allocates the whole unaligned buddy. alloc_heap_page()
catches the attempt to allocate MFN 6 for a second time as a bug:

   pg[0] MFN 842adc c=0x4000000000000000 o=0 v=0 t=0
   Xen BUG at common/page_alloc.c:1324

You can pull this series with the regression test environment to run it:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg01163.html
git pull git@gitlab.com:bernhardkaindl/xen.git offline-unaligned-buddies-v2
make -C tools/tests/native TARGETS=offline-unaligned test

Fixes: e4865c2315 ('Page offline support in Xen side')
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Bernhard Kaindl (2):
  xen/page_alloc: verify buddy alignment in reserve_offlined_page()
  tools/tests: Regression test checking unaligned pages after offlining

 tools/tests/native/offline-unaligned.c | 60 ++++++++++++++++++++++++++
 xen/common/page_alloc.c                |  5 +++
 2 files changed, 65 insertions(+)
 create mode 100644 tools/tests/native/offline-unaligned.c

-- 
2.39.5


