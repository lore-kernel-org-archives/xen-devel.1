Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46091C433E6
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 08:30:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9F722597
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 08:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9F722597
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67717.121035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KUx-0008Sp-8v; Fri, 15 Jan 2021 08:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67717.121035; Fri, 15 Jan 2021 08:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KUx-0008SY-5J; Fri, 15 Jan 2021 08:30:23 +0000
Received: by outflank-mailman (input) for mailman id 67717;
 Fri, 15 Jan 2021 08:30:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KUv-0008HA-N0
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b4562b5-5eb4-442e-a23b-3cea9cb99d49;
 Fri, 15 Jan 2021 08:30:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D73D9B96F;
 Fri, 15 Jan 2021 08:30:06 +0000 (UTC)
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
X-Inumbo-ID: 6b4562b5-5eb4-442e-a23b-3cea9cb99d49
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ty1vNslOkhiniDqlzVqywbvjS91QpdBVLX1o3V8OmA=;
	b=It/kK8ZrfF8B6FYlDn45C5KHGRSqnhkURlJoc/X362NuwuzhgqeqsGVmat6L3CN9DY0GrV
	mYTUQGAnYqsY3zM6qjxgg9ZE0CE0wI5u+O41saHa4r1LGiGyMPMnSrflZngTp2B+8QU8Lr
	6dSe1668SAu2BRJpFFRhRuYbAubbZa8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v12 03/27] tools/libxenevtchn: check xenevtchn_open() flags for not supported bits
Date: Fri, 15 Jan 2021 09:29:36 +0100
Message-Id: <20210115083000.14186-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refuse a call of xenevtchn_open() with unsupported bits in flags being
set.

This will change behavior for callers passing junk in flags today,
but those would otherwise get probably unwanted side effects when the
flags they specify today get any meaning. So checking flags is the
right thing to do.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
V11:
- new patch (Andrew Cooper)

V12:
- expanded commit message (Andrew Cooper)
---
 tools/libs/evtchn/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
index 72d92e28bf..79990d0027 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -13,6 +13,7 @@
  * License along with this library; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <errno.h>
 #include <unistd.h>
 #include <stdlib.h>
 
@@ -31,9 +32,16 @@ static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid)
 
 xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned int flags)
 {
-    xenevtchn_handle *xce = malloc(sizeof(*xce));
+    xenevtchn_handle *xce;
     int rc;
 
+    if ( flags )
+    {
+        errno = EINVAL;
+        return NULL;
+    }
+
+    xce = malloc(sizeof(*xce));
     if ( !xce )
         return NULL;
 
-- 
2.26.2


