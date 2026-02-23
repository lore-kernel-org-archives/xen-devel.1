Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC98E98E0F
	for <xen-devel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1238616.1540244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoO-0007yH-Nw; Mon, 23 Feb 2026 10:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238616.1540244; Mon, 23 Feb 2026 10:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoO-0007yA-Hl; Mon, 23 Feb 2026 10:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1238616;
 Mon, 23 Feb 2026 10:05:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSoM-0007Xe-Li
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:05:06 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ed4dfb6-109f-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 11:05:03 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id E3F9241202D4;
 Mon, 23 Feb 2026 05:04:43 -0500 (EST)
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
X-Inumbo-ID: 1ed4dfb6-109f-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/4] Fix building tools/tests/x86_emulator with clang-21
Date: Mon, 23 Feb 2026 10:04:51 +0000
Message-ID: <cover.1771840208.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While working on another patch series I noticed that `clang-21` cannot
build `tools/tests/x86_emulator`. Once I fixed that `xmm0` related tests
failed, because `clang` doesn't support `-ffixed-xmm0`.

This series fixes building and running the test with `clang`.

There might still be some latent bugs in the tests though, i.e. `xmm0` may not
be the only reason it fails on clang: the `fxsave` tests have
2 overlapping areas of memory at `res + 0x80`, and `res + 0x100` of length `0x200`.
Instead the 2nd area should start at `0x280`, and the memset should
clear an area of `0x480`.
I didn't attempt to fix all those, because attempting to do so caused
the tests to start failing on GCC.

For convenience this patch series is also available at:
https://gitlab.com/xen-project/people/edwintorok/xen/-/compare/staging...private%2Fedvint%2Femulator?from_project_id=2336572
https://gitlab.com/xen-project/people/edwintorok/xen/-/pipelines/2343355874

Edwin Török (4):
  tools/tests/x86_emulator: fix 'shifting a negative signed value is
    undefined'
  tools/tests/x86_emulator: avoid duplicating loop body
  tools/tests/x86_emulator: fix build on clang-21
  tools/tests/x86_emulator: disable xmm* tests on clang

 tools/tests/x86_emulator/Makefile            |  1 +
 tools/tests/x86_emulator/test_x86_emulator.c | 48 +++++++++++++++++++-
 2 files changed, 47 insertions(+), 2 deletions(-)

-- 
2.47.3


