Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D200C433B4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 10:28:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 282FD60234
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 10:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 282FD60234
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104357.199545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuYu-0003zX-2w; Thu, 01 Apr 2021 10:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104357.199545; Thu, 01 Apr 2021 10:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuYt-0003zP-Vy; Thu, 01 Apr 2021 10:28:27 +0000
Received: by outflank-mailman (input) for mailman id 104357;
 Thu, 01 Apr 2021 10:28:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuYt-0003zD-FY
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:28:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0afee1c-02a0-4d9d-9fb5-3fadceb45989;
 Thu, 01 Apr 2021 10:28:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF251AEAE;
 Thu,  1 Apr 2021 10:28:25 +0000 (UTC)
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
X-Inumbo-ID: d0afee1c-02a0-4d9d-9fb5-3fadceb45989
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvuuIHZDWbgJZbFTLmgAhc0Yr8Pw5QBP9Pn9CAur/LY=;
	b=ibt83e9cmBXcUUMeBS1l43oM1LDzCCnKqbQOTfC44+CqoRMy3pfwOBKX2++V1GWDfjjoSU
	0f/Crb8UOD60/rmt1mdnAl6aai7z3jWlVTyq7sbrbV5q/bTaStnMTION02VMAuVM5zVgww
	RiDOucE/r7K9rehJxWeAjg/Jgg4T7hg=
Subject: [PATCH 23/23] lib: move strsep()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <692a24a5-c7a1-b6cc-b618-a620432a030d@suse.com>
Date: Thu, 1 Apr 2021 12:28:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -40,7 +40,6 @@ obj-y += softirq.o
 obj-y += smp.o
 obj-y += spinlock.o
 obj-y += stop_machine.o
-obj-y += string.o
 obj-y += symbols.o
 obj-y += tasklet.o
 obj-y += time.o
--- a/xen/common/string.c
+++ /dev/null
@@ -1,47 +0,0 @@
-/*
- *  linux/lib/string.c
- *
- *  Copyright (C) 1991, 1992  Linus Torvalds
- */
-
-#include <xen/types.h>
-#include <xen/string.h>
-#include <xen/ctype.h>
-
-#ifndef __HAVE_ARCH_STRSEP
-/**
- * strsep - Split a string into tokens
- * @s: The string to be searched
- * @ct: The characters to search for
- *
- * strsep() updates @s to point after the token, ready for the next call.
- *
- * It returns empty tokens, too, behaving exactly like the libc function
- * of that name. In fact, it was stolen from glibc2 and de-fancy-fied.
- * Same semantics, slimmer shape. ;)
- */
-char * strsep(char **s, const char *ct)
-{
-	char *sbegin = *s, *end;
-
-	if (sbegin == NULL)
-		return NULL;
-
-	end = strpbrk(sbegin, ct);
-	if (end)
-		*end++ = '\0';
-	*s = end;
-
-	return sbegin;
-}
-#endif
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 8
- * tab-width: 8
- * indent-tabs-mode: t
- * End:
- */
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -25,6 +25,7 @@ lib-y += strncmp.o
 lib-y += strnlen.o
 lib-y += strpbrk.o
 lib-y += strrchr.o
+lib-y += strsep.o
 lib-y += strspn.o
 lib-y += strstr.o
 lib-$(CONFIG_X86) += xxhash32.o
--- /dev/null
+++ b/xen/lib/strsep.c
@@ -0,0 +1,41 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strsep - Split a string into tokens
+ * @s: The string to be searched
+ * @ct: The characters to search for
+ *
+ * strsep() updates @s to point after the token, ready for the next call.
+ *
+ * It returns empty tokens, too, behaving exactly like the libc function
+ * of that name. In fact, it was stolen from glibc2 and de-fancy-fied.
+ * Same semantics, slimmer shape. ;)
+ */
+char *strsep(char **s, const char *ct)
+{
+	char *sbegin = *s, *end;
+
+	if (sbegin == NULL)
+		return NULL;
+
+	end = strpbrk(sbegin, ct);
+	if (end)
+		*end++ = '\0';
+	*s = end;
+
+	return sbegin;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */


