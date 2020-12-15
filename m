Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF6AC4361B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 06:33:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1327622258
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 06:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1327622258
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.52901.92348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp3tr-0004Bq-UK; Tue, 15 Dec 2020 06:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52901.92348; Tue, 15 Dec 2020 06:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp3tr-0004Be-Qk; Tue, 15 Dec 2020 06:33:31 +0000
Received: by outflank-mailman (input) for mailman id 52901;
 Tue, 15 Dec 2020 06:33:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kp3tq-00047p-Qi
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 06:33:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaa6d120-d33e-4982-9359-de6796891a5a;
 Tue, 15 Dec 2020 06:33:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28241AFF3;
 Tue, 15 Dec 2020 06:33:22 +0000 (UTC)
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
X-Inumbo-ID: aaa6d120-d33e-4982-9359-de6796891a5a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608014002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yYxq5tlJRRgMbOimOLfmKJHCkbwkZMHcBMXnNxQyCg0=;
	b=qyWdFktIzoKvfdjdsGmaEWftuIPlEL80U4WOcRt0DnPl/KuH1A3TesxazxEhajQugY6V1r
	cFU0kKMbjO4UpB9Cti9JsSEwrZnS47UGTbilubTAiiyWGT5P1sd2PU3mv9eSfo1WWSg0Fe
	8yJPtWMBQkCDe/jobOMupPENVo9/zwg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/3] xen/arm: add support for run_in_exception_handler()
Date: Tue, 15 Dec 2020 07:33:17 +0100
Message-Id: <20201215063319.23290-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215063319.23290-1-jgross@suse.com>
References: <20201215063319.23290-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to run a function in an exception handler for Arm. Do it
the same way as on x86 via a bug_frame.

Use the same BUGFRAME_* #defines as on x86 in order to make a future
common header file more easily achievable.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch

V5:
- adjust BUG_FRAME() macro (Jan Beulich)
- adjust arm linker script (Jan Beulich)
- drop #ifdef x86 in common/virtual_region.c

I have verified the created bugframes are correct by inspecting the
created binary.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/arm/traps.c        | 10 ++++++++-
 xen/arch/arm/xen.lds.S      |  2 ++
 xen/common/virtual_region.c |  2 --
 xen/include/asm-arm/bug.h   | 45 +++++++++++++++++--------------------
 4 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 22bd1bd4c6..912b9a3d77 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1236,8 +1236,16 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
     if ( !bug )
         return -ENOENT;
 
+    if ( id == BUGFRAME_run_fn )
+    {
+        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
+
+        fn(regs);
+        return 0;
+    }
+
     /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
-    filename = bug_file(bug);
+    filename = bug_ptr(bug);
     if ( !is_kernel(filename) )
         return -EINVAL;
     fixup = strlen(filename);
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 6342ac4ead..004b182acb 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -49,6 +49,8 @@ SECTIONS
        __stop_bug_frames_1 = .;
        *(.bug_frames.2)
        __stop_bug_frames_2 = .;
+       *(.bug_frames.3)
+       __stop_bug_frames_3 = .;
        *(.rodata)
        *(.rodata.*)
        *(.data.rel.ro)
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index 4fbc02e35a..30b0b4ab9c 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -123,9 +123,7 @@ void __init setup_virtual_regions(const struct exception_table_entry *start,
         __stop_bug_frames_0,
         __stop_bug_frames_1,
         __stop_bug_frames_2,
-#ifdef CONFIG_X86
         __stop_bug_frames_3,
-#endif
         NULL
     };
 
diff --git a/xen/include/asm-arm/bug.h b/xen/include/asm-arm/bug.h
index 36c803357c..4610835ac3 100644
--- a/xen/include/asm-arm/bug.h
+++ b/xen/include/asm-arm/bug.h
@@ -15,65 +15,62 @@
 
 struct bug_frame {
     signed int loc_disp;    /* Relative address to the bug address */
-    signed int file_disp;   /* Relative address to the filename */
+    signed int ptr_disp;    /* Relative address to the filename or function */
     signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
     uint16_t line;          /* Line number */
     uint32_t pad0:16;       /* Padding for 8-bytes align */
 };
 
 #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
-#define bug_file(b) ((const void *)(b) + (b)->file_disp);
+#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp);
 #define bug_line(b) ((b)->line)
 #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
 
-#define BUGFRAME_warn   0
-#define BUGFRAME_bug    1
-#define BUGFRAME_assert 2
+#define BUGFRAME_run_fn 0
+#define BUGFRAME_warn   1
+#define BUGFRAME_bug    2
+#define BUGFRAME_assert 3
 
-#define BUGFRAME_NR     3
+#define BUGFRAME_NR     4
 
 /* Many versions of GCC doesn't support the asm %c parameter which would
  * be preferable to this unpleasantness. We use mergeable string
  * sections to avoid multiple copies of the string appearing in the
  * Xen image.
  */
-#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
+#define BUG_FRAME(type, line, ptr, msg) do {                                \
     BUILD_BUG_ON((line) >> 16);                                             \
     BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
     asm ("1:"BUG_INSTR"\n"                                                  \
-         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
-         "2:\t.asciz " __stringify(file) "\n"                               \
-         "3:\n"                                                             \
-         ".if " #has_msg "\n"                                               \
-         "\t.asciz " #msg "\n"                                              \
-         ".endif\n"                                                         \
-         ".popsection\n"                                                    \
-         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
-         "4:\n"                                                             \
+         ".pushsection .bug_frames." __stringify(type) ", \"a\", %%progbits\n"\
+         "2:\n"                                                             \
          ".p2align 2\n"                                                     \
-         ".long (1b - 4b)\n"                                                \
-         ".long (2b - 4b)\n"                                                \
-         ".long (3b - 4b)\n"                                                \
+         ".long (1b - 2b)\n"                                                \
+         ".long (%0 - 2b)\n"                                                \
+         ".long (%1 - 2b)\n"                                                \
          ".hword " __stringify(line) ", 0\n"                                \
-         ".popsection");                                                    \
+         ".popsection" :: "i" (ptr), "i" (msg));                            \
 } while (0)
 
-#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
+#define run_in_exception_handler(fn) BUG_FRAME(BUGFRAME_run_fn, 0, fn, "")
+
+#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, "")
 
 #define BUG() do {                                              \
-    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
+    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, "");           \
     unreachable();                                              \
 } while (0)
 
 #define assert_failed(msg) do {                                 \
-    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
+    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, msg);        \
     unreachable();                                              \
 } while (0)
 
 extern const struct bug_frame __start_bug_frames[],
                               __stop_bug_frames_0[],
                               __stop_bug_frames_1[],
-                              __stop_bug_frames_2[];
+                              __stop_bug_frames_2[],
+                              __stop_bug_frames_3[];
 
 #endif /* __ARM_BUG_H__ */
 /*
-- 
2.26.2


