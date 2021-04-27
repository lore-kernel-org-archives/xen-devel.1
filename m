Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A74C43460
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 18:00:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B09613B2
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 18:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13B09613B2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118795.225106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0v-0002GN-8a; Tue, 27 Apr 2021 18:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118795.225106; Tue, 27 Apr 2021 18:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0u-0002Fo-Kb; Tue, 27 Apr 2021 18:00:48 +0000
Received: by outflank-mailman (input) for mailman id 118795;
 Tue, 27 Apr 2021 18:00:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0s-0002A9-DN
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0s-0004qA-Bx
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0s-0001nm-B6
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:46 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lbS0q-0003ln-Gs; Tue, 27 Apr 2021 19:00:44 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=vRaPgoPnoLJb6QLe4U8c/AoTASF6SMKUVJYPeAdSMmI=; b=CXN2fELc3Awpay2InSBACFEa0k
	0DpafSGB/pWIf5xuzQuO+dezyKIfuaNsYI9xl8DSf+59rFSOPBRrYXaW1tp54MVGCwWCbWgVXNm0M
	t7o7l++cBBkJsz5D//51urWw72cA5OCv7+LxLYMD7xF7YXT/lMCwG2mHGKh91AWChJOk=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 7/7] mg-schema-test-database: posgtres compat: tidy messages
Date: Tue, 27 Apr 2021 19:00:33 +0100
Message-Id: <20210427180033.9439-8-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427180033.9439-1-iwj@xenproject.org>
References: <20210427180033.9439-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now (postgresql 11) this prints a bunch of COPY notices.  Suppress
them with a -q.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-test-database | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mg-schema-test-database b/mg-schema-test-database
index df83b65a..357646bb 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -515,7 +515,7 @@ END
 	printf "Copy..."
 
 	printf "export..."
-	$(psql_do_cmd) -f $t.export
+	$(psql_do_cmd) -q -f $t.export
 
 	printf "import..."
 	$(withtest psql_do_cmd) -f $t.import
-- 
2.20.1


