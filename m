Return-Path: <SRS0=5QKt=ID=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B2AC4332B
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 12:40:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1597965044
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 12:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1597965044
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93655.176651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9kb-0001WT-HZ; Fri, 05 Mar 2021 12:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93655.176651; Fri, 05 Mar 2021 12:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9kb-0001WI-9S; Fri, 05 Mar 2021 12:40:13 +0000
Received: by outflank-mailman (input) for mailman id 93655;
 Fri, 05 Mar 2021 12:40:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lI9kZ-0001VA-TJ
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 12:40:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lI9kZ-0005oc-33; Fri, 05 Mar 2021 12:40:11 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lI9kY-0007BR-QY; Fri, 05 Mar 2021 12:40:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=wgkPNlXJWVNMPnSNmMg4BKeKpos8YR2z8Sau5csS4go=; b=hZJiT82GJ4XAGywHUbOpzJ8d/
	raRb+SgQxUEVgzL4kYrkDYqdFjzLagB5dm0/0TpOrAjUC2IvHm16U7FjHnKSmH8Y1upkfEyUC1mWP
	apJ0RjMBZBuxUE+jEhyUM+HJPp6LXX4mkhwDaeRS/TttOqPCyS880ZY77t71eHUsmat8Y=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()
Date: Fri,  5 Mar 2021 12:40:03 +0000
Message-Id: <20210305124003.13582-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305124003.13582-1-julien@xen.org>
References: <20210305124003.13582-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Allow GCC to analyze the format printf for xprintf() and
barf{,_perror}().

Take the opportunity to define __noreturn to make the prototype for
barf{,_perror})() easier to read.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/utils.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
index 3dfb96b556dd..ccfb9b8fb699 100644
--- a/tools/xenstore/utils.h
+++ b/tools/xenstore/utils.h
@@ -29,10 +29,12 @@ const char *dump_state_align(FILE *fp);
 
 #define PRINTF_ATTRIBUTE(a1, a2) __attribute__((format (printf, a1, a2)))
 
-void barf(const char *fmt, ...) __attribute__((noreturn));
-void barf_perror(const char *fmt, ...) __attribute__((noreturn));
+#define __noreturn __attribute__((noreturn))
 
-extern void (*xprintf)(const char *fmt, ...);
+void barf(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
+void barf_perror(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
+
+extern void (*xprintf)(const char *fmt, ...) PRINTF_ATTRIBUTE(1, 2);
 
 #define eprintf(_fmt, _args...) xprintf("[ERR] %s" _fmt, __FUNCTION__, ##_args)
 
-- 
2.17.1


