Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3162CC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 08:30:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2FAD22597
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 08:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2FAD22597
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67724.121106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KVC-0000V7-09; Fri, 15 Jan 2021 08:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67724.121106; Fri, 15 Jan 2021 08:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KVB-0000Uu-Q3; Fri, 15 Jan 2021 08:30:37 +0000
Received: by outflank-mailman (input) for mailman id 67724;
 Fri, 15 Jan 2021 08:30:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KVA-0008HA-Nf
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aedc45ed-65b0-445f-9921-eee7d386927b;
 Fri, 15 Jan 2021 08:30:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA962B987;
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
X-Inumbo-ID: aedc45ed-65b0-445f-9921-eee7d386927b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zcn+xkOoEdyR1SXn418KZH0aSy9L0cWXxWWj75I5evc=;
	b=qjG4F0py+5eHs8pbkghAZh01SrH7McaLgg/mhPT1bCI8JQVvIWtVuSUCBHnvD8dkGE4F/D
	IVg3cWCgPYUGjFarypEu+a6oUsVtcOIW4gnFdHEG81McVmOm0ogXLz4xwqR85L9LlAeJnT
	TkbVeMRHzGOhjL0eTeckJSdysR2zxeE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v12 02/27] tools/libxenevtchn: rename open_flags to flags
Date: Fri, 15 Jan 2021 09:29:35 +0100
Message-Id: <20210115083000.14186-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the xenevtchn_open() parameter open_flags to flags as it might
be used for things not passed on to open().

No functional change.
No API/ABI changes.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
V11:
- new patch (Andrew Cooper)

V12:
- added "No API/ABI changes" to commit message (Andrew Cooper)
---
 tools/include/xenevtchn.h | 2 +-
 tools/libs/evtchn/core.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
index 91821ee56d..3e9b6e7323 100644
--- a/tools/include/xenevtchn.h
+++ b/tools/include/xenevtchn.h
@@ -67,7 +67,7 @@ struct xentoollog_logger;
  */
 /* Currently no flags are defined */
 xenevtchn_handle *xenevtchn_open(struct xentoollog_logger *logger,
-                                 unsigned open_flags);
+                                 unsigned int flags);
 
 /*
  * Close a handle previously allocated with xenevtchn_open().
diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
index 8090d0ce87..72d92e28bf 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -29,7 +29,7 @@ static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid)
     return xenevtchn_restrict(xce, domid);
 }
 
-xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned open_flags)
+xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned int flags)
 {
     xenevtchn_handle *xce = malloc(sizeof(*xce));
     int rc;
-- 
2.26.2


