Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2168AC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:38:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A5023B40
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A5023B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67202.119739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hT-0002Yr-IM; Thu, 14 Jan 2021 15:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67202.119739; Thu, 14 Jan 2021 15:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hT-0002YX-Be; Thu, 14 Jan 2021 15:38:15 +0000
Received: by outflank-mailman (input) for mailman id 67202;
 Thu, 14 Jan 2021 15:38:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hS-0002Sh-Ia
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1aa6f7cd-99a5-4252-9bf1-90d952da74c6;
 Thu, 14 Jan 2021 15:38:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5787AAEAB;
 Thu, 14 Jan 2021 15:38:07 +0000 (UTC)
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
X-Inumbo-ID: 1aa6f7cd-99a5-4252-9bf1-90d952da74c6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A0J82Ys9Qyk715LyltNZnDho3IlZIUnsfrvvT22T2EU=;
	b=Ul6i69skyqTUnXhDvPWxgbL/uWQ6HH/C81rU/cey4SFXZgcQ/ii4qlpk/3DwIHf4zEDdkk
	mLLWFQxy09afQTCnGFxUvLvq1ElfdKg6cvOjXp8jlwucxBAuSEvZJcFJSYGOCp8Uo3aSZV
	TgAYtQaObzZXNC5/cTcOt7OShKBzZOs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v11 03/27] tools/libxenevtchn: check xenevtchn_open() flags for not supported bits
Date: Thu, 14 Jan 2021 16:37:39 +0100
Message-Id: <20210114153803.2591-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refuse a call of xenevtchn_open() with unsupported bits in flags being
set.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V11:
- new patch (Andrew Cooper)
---
 tools/libs/evtchn/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
index 50bae8ec0d..581a14e3df 100644
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


