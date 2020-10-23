Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E23CC55178
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 10:18:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A094720936
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 10:18:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="d7JRslfZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A094720936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10838.28943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVu8z-0000zA-Mz; Fri, 23 Oct 2020 10:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10838.28943; Fri, 23 Oct 2020 10:17:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVu8z-0000z3-Je; Fri, 23 Oct 2020 10:17:57 +0000
Received: by outflank-mailman (input) for mailman id 10838;
 Fri, 23 Oct 2020 10:17:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVu8y-0000y9-LC
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:17:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1efb48a-f6e2-4908-9f61-dd4124a1059b;
 Fri, 23 Oct 2020 10:17:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CADF1ACE5;
 Fri, 23 Oct 2020 10:17:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVu8y-0000y9-LC
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:17:56 +0000
X-Inumbo-ID: d1efb48a-f6e2-4908-9f61-dd4124a1059b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d1efb48a-f6e2-4908-9f61-dd4124a1059b;
	Fri, 23 Oct 2020 10:17:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603448274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lboJsbVVVivJxZqzJYi7juIk44SP83bI03BaDd0lLh0=;
	b=d7JRslfZpV10EQNMgStARo6DYp3Erxmt5QyZ7NOhx+0RYrveX2Dv0rybI26yPk6kSDz1EZ
	C5WOfuh/oH0vgxyaSslaMGJmWWOzqmqO4P0PelTqMt2m0litpYy3wei1DjCc7bzRRDFzX9
	6786r+dMtVfrKAVAd8ucuW17fQ857vA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CADF1ACE5;
	Fri, 23 Oct 2020 10:17:54 +0000 (UTC)
Subject: [PATCH v2 4/8] lib: move parse_size_and_unit()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Message-ID: <eaffac30-8bd0-6018-5186-ca53d1becfe5@suse.com>
Date: Fri, 23 Oct 2020 12:17:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... into its own CU, to build it into an archive.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

... into its own CU, to build it into an archive.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/lib.c     | 39 ----------------------------------
 xen/lib/Makefile     |  1 +
 xen/lib/parse-size.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 39 deletions(-)
 create mode 100644 xen/lib/parse-size.c

diff --git a/xen/common/lib.c b/xen/common/lib.c
index a224efa8f6e8..6cfa332142a5 100644
--- a/xen/common/lib.c
+++ b/xen/common/lib.c
@@ -423,45 +423,6 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 #endif
 }
 
-unsigned long long parse_size_and_unit(const char *s, const char **ps)
-{
-    unsigned long long ret;
-    const char *s1;
-
-    ret = simple_strtoull(s, &s1, 0);
-
-    switch ( *s1 )
-    {
-    case 'T': case 't':
-        ret <<= 10;
-        /* fallthrough */
-    case 'G': case 'g':
-        ret <<= 10;
-        /* fallthrough */
-    case 'M': case 'm':
-        ret <<= 10;
-        /* fallthrough */
-    case 'K': case 'k':
-        ret <<= 10;
-        /* fallthrough */
-    case 'B': case 'b':
-        s1++;
-        break;
-    case '%':
-        if ( ps )
-            break;
-        /* fallthrough */
-    default:
-        ret <<= 10; /* default to kB */
-        break;
-    }
-
-    if ( ps != NULL )
-        *ps = s1;
-
-    return ret;
-}
-
 typedef void (*ctor_func_t)(void);
 extern const ctor_func_t __ctors_start[], __ctors_end[];
 
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 764f3624b5f9..99f857540c99 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_X86) += x86/
 
 lib-y += ctype.o
 lib-y += list-sort.o
+lib-y += parse-size.o
diff --git a/xen/lib/parse-size.c b/xen/lib/parse-size.c
new file mode 100644
index 000000000000..ec980cadfff3
--- /dev/null
+++ b/xen/lib/parse-size.c
@@ -0,0 +1,50 @@
+#include <xen/lib.h>
+
+unsigned long long parse_size_and_unit(const char *s, const char **ps)
+{
+    unsigned long long ret;
+    const char *s1;
+
+    ret = simple_strtoull(s, &s1, 0);
+
+    switch ( *s1 )
+    {
+    case 'T': case 't':
+        ret <<= 10;
+        /* fallthrough */
+    case 'G': case 'g':
+        ret <<= 10;
+        /* fallthrough */
+    case 'M': case 'm':
+        ret <<= 10;
+        /* fallthrough */
+    case 'K': case 'k':
+        ret <<= 10;
+        /* fallthrough */
+    case 'B': case 'b':
+        s1++;
+        break;
+    case '%':
+        if ( ps )
+            break;
+        /* fallthrough */
+    default:
+        ret <<= 10; /* default to kB */
+        break;
+    }
+
+    if ( ps != NULL )
+        *ps = s1;
+
+    return ret;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.22.0


