Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18203F419B9
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2026 17:46:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282694.1565216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4JG-0000pD-7o; Wed, 15 Apr 2026 17:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282694.1565216; Wed, 15 Apr 2026 17:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4JG-0000p6-4M; Wed, 15 Apr 2026 17:45:54 +0000
Received: by outflank-mailman (input) for mailman id 1282694;
 Wed, 15 Apr 2026 17:45:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wD4JF-0000oy-CK
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:45:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD4JE-00Dvab-Ly
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 19:45:52 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfceaf-2eae-0a2a0a5409dd-0a2a4505d5e0-30
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:45:52 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfcecf-3760-0a2a45050019-a06583098b08-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:45:52 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 7B8CB81C0CF2;
 Wed, 15 Apr 2026 13:44:57 -0400 (EDT)
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
Subject: [PATCH 0/4] xen/mm: Host-side unit/integration test framework for page_alloc.c
Date: Wed, 15 Apr 2026 18:34:55 +0100
Message-Id: <cover.1776273656.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1776275152-21B3896F-8A0D6962/0/0
X-purgate-type: clean
X-purgate-size: 4597

Hi all,

This patch series adds a host-side unit and integration test framework
for the Xen page allocator in xen/common/page_alloc.c.

Using this framework, it also adds a host-side integration test suite
for memory claims, including NUMA-aware claim sets.

This test suite complements the functional system tests submitted as
part of the NUMA-aware claims v6 series yesterday.

The purpose is to verify the behaviour of the page allocator when
multi-node claim sets are present in situations that are easier to
create and validate in isolation, with full control over a synthetic
Xen heap state and visibility into the claim state of domains as
claims are made and redeemed through heap allocation.

This series depends on the NUMA claims v6 series, which introduced
NUMA-aware claim sets which I submitted yesterday:

[PATCH v6 0/7] xen/mm: Introduce NUMA-aware claim sets for domains
https://lists.xen.org/archives/html/xen-devel/2026-04/msg00587.html
https://patchwork.kernel.org/project/xen-devel/list/?series=1081139

Its design is described in this design document submitted yesterday:

[PATCH v2] docs: Draft Design Document for NUMA-aware claim sets
https://lists.xen.org/archives/html/xen-devel/2026-04/msg00569.html
https://patchwork.kernel.org/project/xen-devel/list/?series=1081047

Patch summary:

1. tools/tests/alloc: Add test framework for xen/common/page_alloc.c
2. tools/tests/alloc: Add integration tests for claims and claim sets
3. tools/tests/alloc: Add tests for offlining with claims present
4. xen/mm: Fix recalling claims when offlining pages if needed

Thanks,

  Bernhard Kaindl

---
PS: The bug fixed in the last commit of this series affects global
outstanding claims as implemented in current Xen master as well.

However, this only arises when Xen offlines pages. Page offlining
code in current Xen still has known limitations, particularly when
offlining pages from larger buddies, and should be avoided in the
interest of heap integrity.

That said, this test framework makes it possible to run targeted
test cases on a synthetic Xen heap and observe logged changes
to the heap during page offlining.

That should make further offlining fixes easier to validate, both by
checking the test results and by inspecting the resulting heap state.

If you are interested in that, the next series will add a test suite
for offlining pages using this test framework. That should make it
possible to observe the effects of the bugs and the corresponding
fixes on any machine able to compile Xen source code.

Bernhard Kaindl (4):
  tools/tests/alloc: Unit and Integration Test Framework for
    page_alloc.c
  tools/tests/alloc: Add integration test suite for memory claims
  tools/tests/alloc: Add tests for offlining with claims present
  xen/mm: Recall claims when offlining pages if needed

 tools/tests/Makefile                        |   1 +
 tools/tests/alloc/.gitignore                |   6 +
 tools/tests/alloc/Makefile                  | 141 ++++++
 tools/tests/alloc/README.rst                |  31 ++
 tools/tests/alloc/check-asserts.h           | 347 +++++++++++++++
 tools/tests/alloc/harness.h                 |  69 +++
 tools/tests/alloc/hypervisor-macros.h       | 101 +++++
 tools/tests/alloc/libtest-page_alloc.h      | 356 +++++++++++++++
 tools/tests/alloc/mock-page_list.h          | 307 +++++++++++++
 tools/tests/alloc/page_alloc-wrapper.h      | 465 ++++++++++++++++++++
 tools/tests/alloc/page_alloc_shim.h         | 433 ++++++++++++++++++
 tools/tests/alloc/test-claims_basic.c       | 230 ++++++++++
 tools/tests/alloc/test-claims_numa_redeem.c | 201 +++++++++
 tools/tests/alloc/test-offlining-claims.c   | 102 +++++
 xen/common/page_alloc.c                     |  42 ++
 15 files changed, 2832 insertions(+)
 create mode 100644 tools/tests/alloc/.gitignore
 create mode 100644 tools/tests/alloc/Makefile
 create mode 100644 tools/tests/alloc/README.rst
 create mode 100644 tools/tests/alloc/check-asserts.h
 create mode 100644 tools/tests/alloc/harness.h
 create mode 100644 tools/tests/alloc/hypervisor-macros.h
 create mode 100644 tools/tests/alloc/libtest-page_alloc.h
 create mode 100644 tools/tests/alloc/mock-page_list.h
 create mode 100644 tools/tests/alloc/page_alloc-wrapper.h
 create mode 100644 tools/tests/alloc/page_alloc_shim.h
 create mode 100644 tools/tests/alloc/test-claims_basic.c
 create mode 100644 tools/tests/alloc/test-claims_numa_redeem.c
 create mode 100644 tools/tests/alloc/test-offlining-claims.c

-- 
2.39.5


