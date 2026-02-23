Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E662FE98E15
	for <xen-devel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1238617.1540248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoO-00081h-Vy; Mon, 23 Feb 2026 10:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238617.1540248; Mon, 23 Feb 2026 10:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoO-000819-Qy; Mon, 23 Feb 2026 10:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1238617;
 Mon, 23 Feb 2026 10:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSoN-0007XS-2q
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:05:07 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2024b709-109f-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 11:05:05 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 39EB74120406;
 Mon, 23 Feb 2026 05:04:46 -0500 (EST)
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
X-Inumbo-ID: 2024b709-109f-11f1-b164-2bf370ae4941
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/4] tools/tests/x86_emulator: fix build on clang-21
Date: Mon, 23 Feb 2026 10:04:54 +0000
Message-ID: <7147fc3ef5d5bdf5a811e896925d9aa641ed0753.1771840208.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840208.git.edwin.torok@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clang-21's built-in assembler is enabled by default, but it doesn't
support some mnemonics:
```
test_x86_emulator.c:2636:36: error: invalid instruction mnemonic 'fsaves'
 2636 |                        "fidivs %1\n\t"
test_x86_emulator.c:2640:24: error: invalid instruction mnemonic 'frstors'
 2640 |         asm volatile ( "frstors %0" :: "m" (res[25]) : "memory" );
      |                        ^
test_x86_emulator.c:4251:24: error: invalid instruction mnemonic 'vpcmpestriq'
 4251 |                        put_insn(vpcmpestri,
      |                        ^
```

Use the external assembler with Clang for consistency with GCC.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/x86_emulator/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index 376cfe244d..2d8874a1d1 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -297,6 +297,7 @@ x86_emulate:
 
 HOSTCFLAGS-x86_64 := -fno-PIE
 $(call cc-option-add,HOSTCFLAGS-x86_64,HOSTCC,-no-pie)
+$(call cc-option-add,HOSTCFLAGS-x86_64,HOSTCC,-no-integrated-as)
 HOSTCFLAGS += $(CFLAGS_xeninclude) -I. $(HOSTCFLAGS-$(XEN_COMPILE_ARCH))
 
 x86.h := $(addprefix $(XEN_ROOT)/tools/include/xen/asm/,\
-- 
2.47.3


