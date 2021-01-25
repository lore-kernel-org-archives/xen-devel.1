Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34743C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 07:24:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A613B224DF
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 07:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A613B224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.73888.132800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3wDo-0006cq-Fm; Mon, 25 Jan 2021 07:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73888.132800; Mon, 25 Jan 2021 07:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3wDo-0006cj-Bp; Mon, 25 Jan 2021 07:23:36 +0000
Received: by outflank-mailman (input) for mailman id 73888;
 Mon, 25 Jan 2021 07:23:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzjc=G4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l3wDn-0006ce-K8
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 07:23:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6459db7-488c-4244-98a9-dc609bcc1605;
 Mon, 25 Jan 2021 07:23:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82B4BAF49;
 Mon, 25 Jan 2021 07:23:33 +0000 (UTC)
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
X-Inumbo-ID: c6459db7-488c-4244-98a9-dc609bcc1605
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611559413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NILakaMyMe3fTR3UEujfMXB8OZbRBtBBIA5NcbBma/Y=;
	b=XpSjAL7RjoaTgBd9cGHH3pmQTZporVuwewvP2JFtPCiNOqSZVKa/5fFCglM+ivn6FyVh5A
	b1X7TYE7gpXBwy1zmqAwxLdYkNx7OtK2vCzk3u9U8bYTYRXLZM1jLxfyaOXERJ3FQ+wldE
	7dfYWPl5HrPrW0NfCVIGIC5Fw/+4SD0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/xenstore: fix use after free bug in xenstore_control
Date: Mon, 25 Jan 2021 08:23:31 +0100
Message-Id: <20210125072331.22093-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a very unlikely use after free bug and a memory leak in
live_update_start() of xenstore_control. Fix those.

Coverity-Id: 1472399
Fixes: 7f97193e6aa858 ("tools/xenstore: add live update command to xenstore-control")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstore_control.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/xenstore/xenstore_control.c b/tools/xenstore/xenstore_control.c
index 0c95cf767c..f6f4626c06 100644
--- a/tools/xenstore/xenstore_control.c
+++ b/tools/xenstore/xenstore_control.c
@@ -43,7 +43,12 @@ static int live_update_start(struct xs_handle *xsh, bool force, unsigned int to)
     if (len < 0)
         return 1;
 
+    ret = strdup("BUSY");
+    if (!ret)
+        return 1;
+
     for (time_start = time(NULL); time(NULL) - time_start < to;) {
+        free(ret);
         ret = xs_control_command(xsh, "live-update", buf, len);
         if (!ret)
             goto err;
-- 
2.26.2


