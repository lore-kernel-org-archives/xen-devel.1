Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19468FD7F97
	for <xen-devel@archiver.kernel.org>; Fri, 27 Feb 2026 10:58:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1242578.1542998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvYH-0005MV-Qh; Fri, 27 Feb 2026 10:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242578.1542998; Fri, 27 Feb 2026 10:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvYH-0005Lz-Ln; Fri, 27 Feb 2026 10:58:33 +0000
Received: by outflank-mailman (input) for mailman id 1242578;
 Fri, 27 Feb 2026 10:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH+Z=A7=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vvvYG-0004x2-OW
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 10:58:32 +0000
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fccfa9a-13cb-11f1-9ccf-f158ae23cfc8;
 Fri, 27 Feb 2026 11:58:30 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 1CD1B81CEB9E;
 Fri, 27 Feb 2026 05:57:58 -0500 (EST)
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
X-Inumbo-ID: 3fccfa9a-13cb-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 3/4] tools/tests/x86_emulator: fix undefined behaviour in shift
Date: Fri, 27 Feb 2026 10:58:22 +0000
Message-ID: <cdd62288eed6b147e6c3e6d2c402de36cf3ce42a.1772189234.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772189234.git.edwin.torok@citrix.com>
References: <cover.1772189234.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes this `-fsanitize=undefined` error:
```
test_x86_emulator.c:1103:32: runtime error: left shift of 573785183 by 2 places cannot be represented in type 'int'
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior test_x86_emulator.c:1103:32
```

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/x86_emulator/test_x86_emulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tests/x86_emulator/test_x86_emulator.c b/tools/tests/x86_emulator/test_x86_emulator.c
index 8f93a8bbcd..3a03ea0352 100644
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1100,7 +1100,7 @@ int main(int argc, char **argv)
     regs.edi    = (unsigned long)res;
     rc = x86_emulate(&ctxt, &emulops);
     if ( (rc != X86EMUL_OKAY) ||
-         (*res != ((0x2233445F << 2) | 2)) ||
+         (*res != ((0x2233445FUL << 2) | 2)) ||
          ((regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS_OF))
           != EFLAGS_ALWAYS_SET) ||
          (regs.eip != (unsigned long)&instr[3]) )
-- 
2.47.3


