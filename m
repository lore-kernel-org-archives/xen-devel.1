Return-Path: <SRS0=soTB=JS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6151C433B4
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 14:23:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6161D6144B
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 14:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6161D6144B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.114670.218563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDlW-0002aq-HK; Wed, 21 Apr 2021 14:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114670.218563; Wed, 21 Apr 2021 14:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDlW-0002aj-DK; Wed, 21 Apr 2021 14:23:42 +0000
Received: by outflank-mailman (input) for mailman id 114670;
 Wed, 21 Apr 2021 14:23:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDlV-0002ab-U8
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:23:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1db7945-0e4a-453f-9bd9-22c4fe0f026c;
 Wed, 21 Apr 2021 14:23:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E0DCB4CD;
 Wed, 21 Apr 2021 14:23:40 +0000 (UTC)
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
X-Inumbo-ID: e1db7945-0e4a-453f-9bd9-22c4fe0f026c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtUcSlpHHim8EO7pSYWk5WfxwrY5tNdvwHjshpV4nUg=;
	b=IoZRbRJQcDB5xriNzS4AlksbtOJbraURm986uRG2BAYge0bJtNBXCYR8bSnBNgrA+qtzHA
	e3YARfvapfUS6rr8I1QY6Do61fpM/39RE2bFcPuHgzKlHSyBKk+v3Z4CBTDcX032OJPyHe
	0wGb3HHCObmwxSGeJgVkrCucninRZtg=
Subject: [PATCH v2 11/20] lib: move strlcpy()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <0e2d802c-f43a-6028-870b-55ae4234559e@suse.com>
Date: Wed, 21 Apr 2021 16:23:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Allow the function to be individually linkable, discardable, and
overridable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/string.c
+++ b/xen/common/string.c
@@ -56,32 +56,6 @@ int (strcasecmp)(const char *s1, const c
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRLCPY
-/**
- * strlcpy - Copy a %NUL terminated string into a sized buffer
- * @dest: Where to copy the string to
- * @src: Where to copy the string from
- * @size: size of destination buffer
- *
- * Compatible with *BSD: the result is always a valid
- * NUL-terminated string that fits in the buffer (unless,
- * of course, the buffer size is zero). It does not pad
- * out the result like strncpy() does.
- */
-size_t strlcpy(char *dest, const char *src, size_t size)
-{
-	size_t ret = strlen(src);
-
-	if (size) {
-		size_t len = (ret >= size) ? size-1 : ret;
-		memcpy(dest, src, len);
-		dest[len] = '\0';
-	}
-	return ret;
-}
-EXPORT_SYMBOL(strlcpy);
-#endif
-
 #ifndef __HAVE_ARCH_STRLCAT
 /**
  * strlcat - Append a %NUL terminated string into a sized buffer
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -15,6 +15,7 @@ lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
 lib-y += strcmp.o
+lib-y += strlcpy.o
 lib-y += strlen.o
 lib-y += strncmp.o
 lib-y += strnlen.o
--- /dev/null
+++ b/xen/lib/strlcpy.c
@@ -0,0 +1,38 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strlcpy - Copy a %NUL terminated string into a sized buffer
+ * @dest: Where to copy the string to
+ * @src: Where to copy the string from
+ * @size: size of destination buffer
+ *
+ * Compatible with *BSD: the result is always a valid
+ * NUL-terminated string that fits in the buffer (unless,
+ * of course, the buffer size is zero). It does not pad
+ * out the result like strncpy() does.
+ */
+size_t strlcpy(char *dest, const char *src, size_t size)
+{
+	size_t ret = strlen(src);
+
+	if (size) {
+		size_t len = (ret >= size) ? size-1 : ret;
+		memcpy(dest, src, len);
+		dest[len] = '\0';
+	}
+	return ret;
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


