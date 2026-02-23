Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61CBE98E16
	for <xen-devel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1238614.1540223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoN-0007Xv-8q; Mon, 23 Feb 2026 10:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238614.1540223; Mon, 23 Feb 2026 10:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSoN-0007Xo-5b; Mon, 23 Feb 2026 10:05:07 +0000
Received: by outflank-mailman (input) for mailman id 1238614;
 Mon, 23 Feb 2026 10:05:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSoL-0007XS-Dm
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:05:05 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f3959e5-109f-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 11:05:04 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id AC20141202E0;
 Mon, 23 Feb 2026 05:04:44 -0500 (EST)
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
X-Inumbo-ID: 1f3959e5-109f-11f1-b164-2bf370ae4941
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/4] tools/tests/x86_emulator: fix 'shifting a negative signed value is undefined'
Date: Mon, 23 Feb 2026 10:04:52 +0000
Message-ID: <c908071f1c5293e6f87c67a982adb377b0912ccb.1771840208.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840208.git.edwin.torok@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clang-21 refuses to compile this:
```
test_x86_emulator.c:1164:24: error: shifting a negative signed value is undefined [-Werror,-Wshift-negative-value]
 1164 |     regs.r8     = (-1L << 40) + 1;
      |                    ~~~ ^
1 error generated.
```

The shift could also exceed the width of the type on some systems.
I confirmed that both the old and the new code would produce the same value
with GCC on x86-64: `0xffffff0000000001`.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/x86_emulator/test_x86_emulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tests/x86_emulator/test_x86_emulator.c b/tools/tests/x86_emulator/test_x86_emulator.c
index 39e8056d77..a25eca1634 100644
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1161,7 +1161,7 @@ int main(int argc, char **argv)
     instr[0] = 0x4d; instr[1] = 0x0f; instr[2] = 0xbb; instr[3] = 0x03;
     regs.eflags = EFLAGS_ALWAYS_SET;
     regs.rip    = (unsigned long)&instr[0];
-    regs.r8     = (-1L << 40) + 1;
+    regs.r8     = (~0ULL << 40) + 1;
     regs.r11    = (unsigned long)(res + (1L << 35));
     rc = x86_emulate(&ctxt, &emulops);
     if ( (rc != X86EMUL_OKAY) ||
-- 
2.47.3


