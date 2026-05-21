Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1D0CD5BAC
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2026 15:24:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1315382.1585186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Ff-0004VA-Pq; Thu, 21 May 2026 15:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315382.1585186; Thu, 21 May 2026 15:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Ff-0004V3-N6; Thu, 21 May 2026 15:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1315382;
 Thu, 21 May 2026 15:23:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wQ5Fd-0004Uw-N5
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:23:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5Fc-0036G1-Sy
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:23:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 6a0f2386-5cb7-0a2a0a5109dd-0a2a4509e4da-6
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:23:55 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 6a0f238a-2497-0a2a45090019-d98c6eacdb88-1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:23:55 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DC8A3AEC;
 Thu, 21 May 2026 08:23:49 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B1893F7B4;
 Thu, 21 May 2026 08:23:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779377034; bh=ZLS2R0ODszTvUfzv4/d3UVm1fR2E1lJ3y4YDzpaln+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=GGENntoz+mw/BDQBdp0U7LAS3cINuxj5V+T37s7xnymFs/faiVL6+vFy8xp5m0kn3
	 v6MfRNKI3cCiFJHiYOKZ0xD8jON7O22JdCWdSyW3uXg5VVcLJhO1JkgBXPUOic8xmJ
	 xdVTHvOSgOnkrnyCl3RvaQJ7hzu7+5GdeZJwe4L4=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] tools/tests: Fix paging-mempool xen_pfn_t format strings
Date: Thu, 21 May 2026 16:23:44 +0100
Message-Id: <20260521152344.2050899-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779377035-8A18BA53-4B5C5189/0/0
X-purgate-type: clean
X-purgate-size: 1575

xen_pfn_t is not an unsigned long on all architectures. In particular,
Arm32 builds see it as a 64-bit type, so printing it with %lx triggers
a -Werror=format build failure.

Use PRI_xen_pfn for the GFN diagnostics instead.

Fixes: 66c982a5d3614 ("tests/paging-mempool: Extend to test P2M relocation")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/tests/paging-mempool/test-paging-mempool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index 3c87925288f1..9dd605f1ab3e 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -208,7 +208,7 @@ static int check_guest_marks(xen_pfn_t gfn, uint32_t mark_start, size_t count)
         if ( errs[i] )
         {
             rc = -1;
-            fail("    Fail: check mark unable to map gfn %05lx: %d\n",
+            fail("    Fail: check mark unable to map gfn %05"PRI_xen_pfn": %d\n",
                  gfns[i], errs[i]);
             continue;
         }
@@ -216,7 +216,7 @@ static int check_guest_marks(xen_pfn_t gfn, uint32_t mark_start, size_t count)
         if ( *mark == exp )
             continue;
 
-        fail("    Fail: check mark: gfn %05lx expecting %08x (%u), got %08x (%u)\n",
+        fail("    Fail: check mark: gfn %05"PRI_xen_pfn" expecting %08x (%u), got %08x (%u)\n",
                gfns[i], exp, ~exp, *mark, ~*mark);
         rc = -1;
     }
-- 
2.34.1


