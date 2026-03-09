Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6662EFCD95
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 10:42:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249224.1546716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzY3S-00084l-BD; Mon, 09 Mar 2026 10:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249224.1546716; Mon, 09 Mar 2026 10:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzY3S-00084e-8U; Mon, 09 Mar 2026 10:41:42 +0000
Received: by outflank-mailman (input) for mailman id 1249224;
 Mon, 09 Mar 2026 10:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lNRQ=BJ=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vzY3Q-00084Y-Im
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 10:41:40 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d6bf574-1ba4-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 11:41:39 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 229C84153174;
 Mon,  9 Mar 2026 06:41:13 -0400 (EDT)
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
X-Inumbo-ID: 8d6bf574-1ba4-11f1-b164-2bf370ae4941
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4] tools/tests/x86_emulator: avoid duplicate symbol error with clang: use -O0
Date: Mon,  9 Mar 2026 10:41:35 +0000
Message-ID: <d0178858e5f3ff7a8b64e822b55c6179adc92ea6.1773052835.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clang would duplicate the loop body and end up with a double definition
of the symbol:
```
/tmp/test_x86_emulator-0f3576.s:27823: Error: symbol `vmovsh_to_mem' is already defined
/tmp/test_x86_emulator-0f3576.s:27825: Error: symbol `.Lvmovsh_to_mem_end' is already defined
```

Until a better solution is found: reduce optimizations in the test runner.

Using -Os might also work, but we can't rely on the size optimization
always avoiding the duplication of asm blocks.
This is test code, not performance critical code, and -O0 is more future
proof.
However for debugging -Og is recommended over -O0, and this still
avoids the duplicate label problem.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
Changed since v3:
 * use -Og instead of -O0, adjust comment
Changed since v2:
 * use -O0 instead of .ifndef (with ifndef the 2nd iteration would use code identical to first)
Changed since v1:
 * use .ifndef directive instead of volatile workaround
---
 tools/tests/x86_emulator/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index 5003c464f3..8210e83345 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -323,4 +323,11 @@ x86-emulate.o x86_emulate/%.o: HOSTCFLAGS += -D__XEN_TOOLS__
 $(call cc-option-add,HOSTCFLAGS-toplevel,HOSTCC,-fno-toplevel-reorder)
 test_x86_emulator.o: HOSTCFLAGS += $(HOSTCFLAGS-toplevel)
 
+# When unrolling loops, compilers may duplicate inline assembly. put_insn()
+# emits labels, which may not be emitted multiple times.
+# The default HOSTCFLAGS from $(XEN_ROOT)/Config.mk would set a non-zero
+# optimisation level.
+# Until a better solution is found: reduce optimizations in the test runner.
+test_x86_emulator.o: HOSTCFLAGS += -Og
+
 test_x86_emulator.o: $(addsuffix .h,$(TESTCASES)) $(addsuffix -opmask.h,$(OPMASK))
-- 
2.47.3


