Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4F8C55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 15:09:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381578.1625127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wquII-0005mS-Db; Mon, 03 Aug 2026 15:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381578.1625127; Mon, 03 Aug 2026 15:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wquII-0005mL-AP; Mon, 03 Aug 2026 15:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1381578;
 Mon, 03 Aug 2026 15:09:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wquIG-0005mF-Rz
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 15:09:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wquIG-00FGFk-8j
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 17:09:32 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70af1d-2eae-0a2a0a5409dd-0a2a450ab052-46
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:09:32 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70af2b-f2d2-0a2a450a0019-d155802dc807-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:09:32 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4956869750eso14065385e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 08:09:31 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49808199a5csm338284985e9.4.2026.08.03.08.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 08:09:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785769771; x=1786374571; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+c+qq8EM5bi4ZLYwjWJgiPT8GJ9IUzuXDiF/Sbo//g=;
        b=Yj8X+y/hJOoaEuHg6yKICKLzdp67EgMAbtwYvddARVOoG44yPx1r0W+H72rKZo9E4W
         IcwPO2wxeUKfx/MM+FaA+aDPeMeyamvWu64A9nrMwYBNjI7E3A0eOPsY5nJi1vorG2A1
         7Ib7Nu3FJ1Hj6UTMWN/rFZvRPU7nKcf0ZUhwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785769771; x=1786374571;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+c+qq8EM5bi4ZLYwjWJgiPT8GJ9IUzuXDiF/Sbo//g=;
        b=YaILgg3WJlQRFC97R3g/BZMqnVNt1uUFqVHvP4D+4L93X+pNQUdBSKsiucKcvjHypl
         IV+li88wvDKqWlqFhMr1zOjSqYIBpd2tSQGoS5K34CYz6ftUI8bXu+lw8c2A/oFaxLZ0
         PbQexOREDH9Swiqc8Si7RTXBHmhaDMa/r+GyRewW3seMfK2Pjxf0RLkEKaaNx4ycB3Kp
         k5gljyJ+xkfBw41YkyBJsvHMvpUS7OInoniLe/tH91Zy2aR6IbFi1cUW0pphVngh1mow
         Tvbuof9qZbSYS0dkeijfoZpyYnb9oqqXdaGme/M7fQy+U/JBlnHrwHIXA5/IG5n4TXG6
         CyPA==
X-Gm-Message-State: AOJu0YyE/4KmoynY3o695fCtfj+pmu/558trPWAG/c4VVAeGrxhxtOUF
	zOr6tVd+hIqaMqVscIJ/gkFizMkhVxSX4TYfUq9CY6TnjqaDj4sUWVsE/azJRacSuJ3tH6BMnk+
	3aVBOvls=
X-Gm-Gg: AR+sD10LsyvWXxGM/IdzgaMY6y580pCyc1GO9uiX1FyYdAzpJwwo7bkHnqdFjJsNMB5
	OtAUNQeWD8eZ374zx0SDAa6YHvIInMOQJKJajcKnZSCUHz6iVrnY01cuC5yV8zr3Oh15eWUQhM1
	+HCt7Mcj6pWtfhWKTgVjjvjn9K9pDdUygPSWhh/iarAQwqiZCJl5P+M3qKjfvvkfzWAHzFOOosY
	q6jqbNAsIZb4htP21xcKKRS865YZOqG6USr4q8ZwkYQDjkq8cDN0v3LYk+3YLGtG6AJK4Uyihig
	HWTqtNRCHuteB8VsOzeXs31Wr3iKB8rnI0afyHt9gIaqViXDZX6BBtA679+ISkMNWEc7DDhPUDG
	bq2gOdYuAEPeYZZNDznQ5prtI3M3lDLbOyQLNh0xNTehHUo33Dihw89WO6Hd94WjOBIWI9v4o5E
	mAkj773q3CbCkvIqzBtwxROmnctVVaF1M9pgqV15i1K96VR5IXMDaZH3s//2wIZk8je3Da52ytb
	WavgYvwNGf34kemFKkdCNIDw0HU9Yu5ZYqui3GMyxQa/ooZcg==
X-Received: by 2002:a05:600c:628d:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4980c64e4c8mr248831955e9.13.1785769771272;
        Mon, 03 Aug 2026 08:09:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/livepatch: Move init_or_livepatch_* into xen/init.h
Date: Mon,  3 Aug 2026 16:09:25 +0100
Message-Id: <20260803150925.408857-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785769772-532D8CFC-79776C13/10/73395122804
X-purgate-type: spam
X-purgate-size: 5701

xen/livepatch.h is a fairly heavyweight header pulling in public/sysctl.h, and
a reasonable number of users care only for the init_or_livepatch_* tags only.

They're arguably more init than livepatch anyway, and by moving them to
init.h, we can remove a number of includes.

The include in vsprintf was leftover from early versions of the work.  In the
version committed, d5ccf4482e4f ("x86, xsplice: Print payload's symbol name
and payload name in backtraces"), symbol_lookup() had been adjusted to handle
the livepatch symbol names properly.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/riscv/extable.c    |  1 -
 xen/arch/x86/alternative.c  |  1 -
 xen/arch/x86/extable.c      |  1 -
 xen/arch/x86/mm.c           |  1 -
 xen/common/vsprintf.c       |  1 -
 xen/include/xen/init.h      | 19 +++++++++++++++++++
 xen/include/xen/livepatch.h | 21 ---------------------
 7 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/xen/arch/riscv/extable.c b/xen/arch/riscv/extable.c
index 77e5e9e89439..5b89c4278c65 100644
--- a/xen/arch/riscv/extable.c
+++ b/xen/arch/riscv/extable.c
@@ -3,7 +3,6 @@
 #include <xen/init.h>
 #include <xen/bsearch.h>
 #include <xen/lib.h>
-#include <xen/livepatch.h>
 #include <xen/sort.h>
 #include <xen/virtual_region.h>
 
diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 5ed0c2672589..4c09dc55c684 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -16,7 +16,6 @@
 #include <asm/traps.h>
 #include <asm/nmi.h>
 #include <asm/nops.h>
-#include <xen/livepatch.h>
 
 #define MAX_PATCH_LEN (255-1)
 
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index e1c8c9fab811..1425ea176570 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -2,7 +2,6 @@
 #include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/list.h>
-#include <xen/livepatch.h>
 #include <xen/perfc.h>
 #include <xen/rcupdate.h>
 #include <xen/sort.h>
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 511de4cc38a8..b158742408f9 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -101,7 +101,6 @@
 #include <xen/irq.h>
 #include <xen/kernel.h>
 #include <xen/lib.h>
-#include <xen/livepatch.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/perfc.h>
diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
index 612751c90f43..90192fd9e8b9 100644
--- a/xen/common/vsprintf.c
+++ b/xen/common/vsprintf.c
@@ -20,7 +20,6 @@
 #include <xen/symbols.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
-#include <xen/livepatch.h>
 #include <asm/div64.h>
 #include <asm/page.h>
 
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 0c921672c196..2e5bea2bff93 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -19,6 +19,25 @@
 #define __initdata_cf_clobber  __section(".init.data.cf_clobber")
 #define __initconst_cf_clobber __section(".init.rodata.cf_clobber")
 
+/*
+ * Various pieces of functionality are needed at runtime only if livepatching
+ * is enabled.  Provide tags which resolve to the appropriate section
+ * annotation in either configuration.
+ */
+#ifdef CONFIG_LIVEPATCH
+# define init_or_livepatch_const
+# define init_or_livepatch_constrel
+# define init_or_livepatch_data
+# define init_or_livepatch_read_mostly __read_mostly
+# define init_or_livepatch
+#else /* !CONFIG_LIVEPATCH */
+# define init_or_livepatch_const       __initconst
+# define init_or_livepatch_constrel    __initconstrel
+# define init_or_livepatch_data        __initdata
+# define init_or_livepatch_read_mostly __initdata
+# define init_or_livepatch             __init
+#endif /* !CONFIG_LIVEPATCH */
+
 /* These macros are used to mark some functions or 
  * initialized data (doesn't apply to uninitialized data)
  * as `initialization' functions. The kernel can take this
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 45c8924f3412..416eecb70045 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -20,17 +20,6 @@ struct xen_sysctl_livepatch_op;
 
 #include <xen/lib.h>
 
-/*
- * We use alternative and exception table code - which by default are __init
- * only, however we need them during runtime. These macros allows us to build
- * the image with these functions built-in. (See the #else below).
- */
-#define init_or_livepatch_const
-#define init_or_livepatch_constrel
-#define init_or_livepatch_data
-#define init_or_livepatch_read_mostly __read_mostly
-#define init_or_livepatch
-
 /* Convenience define for printk. */
 #define LIVEPATCH             "livepatch: "
 /* ELF payload special section names. */
@@ -145,16 +134,6 @@ void revert_payload_tail(struct payload *data);
 
 #else
 
-/*
- * If not compiling with Live Patch certain functionality should stay as
- * __init.
- */
-#define init_or_livepatch_const       __initconst
-#define init_or_livepatch_constrel    __initconstrel
-#define init_or_livepatch_data        __initdata
-#define init_or_livepatch_read_mostly __initdata
-#define init_or_livepatch             __init
-
 static inline int livepatch_op(struct xen_sysctl_livepatch_op *op)
 {
     return -ENOSYS;
-- 
2.39.5


