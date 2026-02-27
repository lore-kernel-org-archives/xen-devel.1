Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B1CFD7F95
	for <xen-devel@archiver.kernel.org>; Fri, 27 Feb 2026 10:58:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1242575.1542965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvYF-0004YU-2B; Fri, 27 Feb 2026 10:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242575.1542965; Fri, 27 Feb 2026 10:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvYE-0004XF-QJ; Fri, 27 Feb 2026 10:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1242575;
 Fri, 27 Feb 2026 10:58:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH+Z=A7=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vvvYD-0004Ur-Nn
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 10:58:29 +0000
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eea9b42-13cb-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 11:58:28 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 8BBEA81CEB9D;
 Fri, 27 Feb 2026 05:57:56 -0500 (EST)
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
X-Inumbo-ID: 3eea9b42-13cb-11f1-b164-2bf370ae4941
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 1/4] tools/tests/x86_emulator: avoid duplicate symbol error with clang
Date: Fri, 27 Feb 2026 10:58:20 +0000
Message-ID: <358a87d89d50475a57f2a5d6ebea01d95a1df6d7.1772189234.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772189234.git.edwin.torok@citrix.com>
References: <cover.1772189234.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clang would duplicate the loop body and end up with a double definition
of the symbol:
```
/tmp/test_x86_emulator-0f3576.s:27823: Error: symbol `vmovsh_to_mem' is already defined
/tmp/test_x86_emulator-0f3576.s:27825: Error: symbol `.Lvmovsh_to_mem_end' is already defined
```

Avoid this by only emitting the symbols surrounding the instructions if
they are not already defined. (We know that the definitions would be
identical, and we only need one of them as input to the emulator)

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
Changed since v1:
 * use .ifndef directive instead of volatile workaround
---
 tools/tests/x86_emulator/test_x86_emulator.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/tests/x86_emulator/test_x86_emulator.c b/tools/tests/x86_emulator/test_x86_emulator.c
index ea507f9c3a..8f93a8bbcd 100644
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1882,8 +1882,13 @@ int main(int argc, char **argv)
 #define decl_insn(which) extern const unsigned char which[], \
                          which##_end[] asm ( ".L" #which "_end" )
 #define put_insn(which, insn) ".pushsection .test\n" \
-                              #which ": " insn "\n"  \
+                              ".ifndef "#which"\n" \
+                              #which ": \n" \
+                              ".endif\n" \
+                              insn "\n"  \
+                              ".ifndef .L"#which"_end\n" \
                               ".L" #which "_end:\n"  \
+                              ".endif\n" \
                               ".popsection"
 #define set_insn(which) (regs.eip = (unsigned long)(which))
 #define valid_eip(which) (regs.eip >= (unsigned long)(which) && \
@@ -5248,7 +5253,7 @@ int main(int argc, char **argv)
         memset(res + 3, ~0, 8);
         regs.eax = (unsigned long)res;
         regs.ecx = ~0;
-        for ( i = 0; i < 2; ++i )
+        for (i = 0; i < 2; ++i )
         {
             decl_insn(vmovsh_to_mem);
 
-- 
2.47.3


