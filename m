Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F82FFCB61C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Mar 2026 16:26:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1247918.1546291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyXzu-0000u6-Fd; Fri, 06 Mar 2026 16:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247918.1546291; Fri, 06 Mar 2026 16:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyXzu-0000tz-D5; Fri, 06 Mar 2026 16:25:54 +0000
Received: by outflank-mailman (input) for mailman id 1247918;
 Fri, 06 Mar 2026 16:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/aL=BG=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vyXzt-0000to-1k
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:25:53 +0000
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23815a59-1979-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 17:25:51 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 7130681CBF11;
 Fri,  6 Mar 2026 11:25:15 -0500 (EST)
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
X-Inumbo-ID: 23815a59-1979-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 1/1] tools/tests/x86_emulator: avoid duplicate symbol error with clang: use -O0
Date: Fri,  6 Mar 2026 16:25:43 +0000
Message-ID: <a4a29c95b06a0352889bb6c032c19be6e4cf8288.1772813802.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772813802.git.edwin.torok@citrix.com>
References: <cover.1772813802.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clang would duplicate the loop body and end up with a double definition
of the symbol:
```
/tmp/test_x86_emulator-0f3576.s:27823: Error: symbol `vmovsh_to_mem' is already defined
/tmp/test_x86_emulator-0f3576.s:27825: Error: symbol `.Lvmovsh_to_mem_end' is already defined
```

Until a better solution is found: disable all optimizations in the test runner.

Using -Os might also work, but we can't rely on the size optimization
always avoiding the duplication of asm blocks.
This is test code, not performance critical code, and -O0 is more future
proof.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
Changed since v2:
 * use -O0 instead of .ifndef (with ifndef the 2nd iteration would use code identical to first)
Changed since v1:
 * use .ifndef directive instead of volatile workaround
---
 tools/tests/x86_emulator/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index 5003c464f3..ba1d27177f 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -323,4 +323,9 @@ x86-emulate.o x86_emulate/%.o: HOSTCFLAGS += -D__XEN_TOOLS__
 $(call cc-option-add,HOSTCFLAGS-toplevel,HOSTCC,-fno-toplevel-reorder)
 test_x86_emulator.o: HOSTCFLAGS += $(HOSTCFLAGS-toplevel)
 
+# clang duplicates inline assembly when unrolling loops,
+# which causes a duplicate label error.
+# Until a better solution is found: disable all optimizations in the test runner.
+test_x86_emulator.o: HOSTCFLAGS += -O0
+
 test_x86_emulator.o: $(addsuffix .h,$(TESTCASES)) $(addsuffix -opmask.h,$(OPMASK))
-- 
2.47.3


