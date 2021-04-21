Return-Path: <SRS0=soTB=JS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91168C433ED
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 14:26:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BFDE6144D
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 14:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BFDE6144D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.114709.218659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDoG-0003fh-Ti; Wed, 21 Apr 2021 14:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114709.218659; Wed, 21 Apr 2021 14:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDoG-0003fY-Q4; Wed, 21 Apr 2021 14:26:32 +0000
Received: by outflank-mailman (input) for mailman id 114709;
 Wed, 21 Apr 2021 14:26:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDoE-0003f8-Su
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:26:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9862c2ce-2e0d-49d5-98b6-64d5735995e4;
 Wed, 21 Apr 2021 14:26:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DA1DB4D6;
 Wed, 21 Apr 2021 14:26:29 +0000 (UTC)
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
X-Inumbo-ID: 9862c2ce-2e0d-49d5-98b6-64d5735995e4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VRhAA1umJE95thm+BkRB0Qw/wbJzne0Yyf6yVGgrwEI=;
	b=A9mqYbg1+HuQbbSNgqolaVaq8+sTSP9mtGA92eWE12ebNllVyAlvbyd6JqskUWy0OlnzGu
	BE5OPXWo6guzO8kqiH3HR+DCR55GphwwC4sBJbPsRtlhgBAMsDBqphUiO4GtIsLoww1dbJ
	En/MtgON5csJszRQYVQlFLELudHMISc=
Subject: [PATCH v2 19/20] lib: move strpbrk()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <a54f3d95-7dc1-56e5-7367-9322474d3952@suse.com>
Date: Wed, 21 Apr 2021 16:26:29 +0200
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
@@ -8,26 +8,6 @@
 #include <xen/string.h>
 #include <xen/ctype.h>
 
-#ifndef __HAVE_ARCH_STRPBRK
-/**
- * strpbrk - Find the first occurrence of a set of characters
- * @cs: The string to be searched
- * @ct: The characters to search for
- */
-char * strpbrk(const char * cs,const char * ct)
-{
-	const char *sc1,*sc2;
-
-	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
-		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
-			if (*sc1 == *sc2)
-				return (char *) sc1;
-		}
-	}
-	return NULL;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRSEP
 /**
  * strsep - Split a string into tokens
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -23,6 +23,7 @@ lib-y += strlen.o
 lib-y += strncasecmp.o
 lib-y += strncmp.o
 lib-y += strnlen.o
+lib-y += strpbrk.o
 lib-y += strrchr.o
 lib-y += strspn.o
 lib-y += strstr.o
--- /dev/null
+++ b/xen/lib/strpbrk.c
@@ -0,0 +1,33 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strpbrk - Find the first occurrence of a set of characters
+ * @cs: The string to be searched
+ * @ct: The characters to search for
+ */
+char *strpbrk(const char * cs,const char * ct)
+{
+	const char *sc1,*sc2;
+
+	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
+		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
+			if (*sc1 == *sc2)
+				return (char *) sc1;
+		}
+	}
+	return NULL;
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


