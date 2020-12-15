Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CBEC4361B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:36:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2E792255F
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2E792255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.54528.94821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJ6-000672-7z; Tue, 15 Dec 2020 16:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54528.94821; Tue, 15 Dec 2020 16:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJ6-00066u-3f; Tue, 15 Dec 2020 16:36:12 +0000
Received: by outflank-mailman (input) for mailman id 54528;
 Tue, 15 Dec 2020 16:36:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJ5-00066M-Ii
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:36:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a7ee2d4-cc73-4aa5-912e-16bad8b626cb;
 Tue, 15 Dec 2020 16:36:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6D18AD5C;
 Tue, 15 Dec 2020 16:36:07 +0000 (UTC)
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
X-Inumbo-ID: 4a7ee2d4-cc73-4aa5-912e-16bad8b626cb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHjrhGiUQFsdbZDZFHw3I8KGLBEONfoM4zSWmLMKK4w=;
	b=l7F07gFpB7BMP5/TheYwzFqpGp5jK/IX4hsEdhP8iQQopOTp+ucfkpYkppi2THAj2Thh15
	Z8OwUlfeI8jweNPgbOzRlH+vu7N5acksoEF+/oNBoEnYsiSIrj9ZgYTIRZmc3RomkfHbuU
	aXTfDV3AR4WJP9wBKDpxDulZJ3xdqHY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v10 01/25] tools/xenstore: switch barf[_perror]() to use syslog()
Date: Tue, 15 Dec 2020 17:35:39 +0100
Message-Id: <20201215163603.21700-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When xenstored crashes due to an unrecoverable condition it is calling
either barf() or barf_perror() to issue a message and then exit().

Make sure the message is visible somewhere by using syslog()
additionally to xprintf(), as the latter will be visible only with
tracing active.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V4:
- new patch
---
 tools/xenstore/utils.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/xenstore/utils.c b/tools/xenstore/utils.c
index a1ac12584a..633ce3b4fc 100644
--- a/tools/xenstore/utils.c
+++ b/tools/xenstore/utils.c
@@ -3,6 +3,7 @@
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
+#include <syslog.h>
 #include <errno.h>
 #include <unistd.h>
 #include <fcntl.h>
@@ -35,6 +36,7 @@ void barf(const char *fmt, ...)
 	va_end(arglist);
 
  	if (bytes >= 0) {
+		syslog(LOG_CRIT, "%s\n", str);
 		xprintf("%s\n", str);
 		free(str);
 	}
@@ -54,6 +56,7 @@ void barf_perror(const char *fmt, ...)
 	va_end(arglist);
 
  	if (bytes >= 0) {
+		syslog(LOG_CRIT, "%s: %s\n", str, strerror(err));
 		xprintf("%s: %s\n", str, strerror(err));
 		free(str);
 	}
-- 
2.26.2


