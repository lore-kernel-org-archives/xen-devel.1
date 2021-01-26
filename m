Return-Path: <SRS0=12TN=G5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA87FC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 22:49:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00212065C
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 22:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A00212065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netbsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.75605.136169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X8v-0001nr-Sq; Tue, 26 Jan 2021 22:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75605.136169; Tue, 26 Jan 2021 22:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X8v-0001nh-Np; Tue, 26 Jan 2021 22:49:01 +0000
Received: by outflank-mailman (input) for mailman id 75605;
 Tue, 26 Jan 2021 22:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HxG=G5=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4X8u-0001QY-Nn
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:49:00 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64d0791f-3b5f-4dbe-9f7f-3a7d4690cfe0;
 Tue, 26 Jan 2021 22:48:35 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10QMmY4a020192;
 Tue, 26 Jan 2021 23:48:34 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10QMmYTB024598;
 Tue, 26 Jan 2021 23:48:34 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 42E60AA8C1; Tue, 26 Jan 2021 23:48:34 +0100 (MET)
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
X-Inumbo-ID: 64d0791f-3b5f-4dbe-9f7f-3a7d4690cfe0
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH v2] libs/store: make build without PTHREAD_STACK_MIN
Date: Tue, 26 Jan 2021 23:47:59 +0100
Message-Id: <20210126224800.1246-13-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126224800.1246-1-bouyer@netbsd.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 26 Jan 2021 23:48:34 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On NetBSD, PTHREAD_STACK_MIN is not available.
If PTHREAD_STACK_MIN is not defined, define it to 0 so that we fallback to
DEFAULT_THREAD_STACKSIZE

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/store/xs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 4ac73ec317..b6ecbd787e 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -811,6 +811,11 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 
 #ifdef USE_PTHREAD
 #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
+/* NetBSD doesn't have PTHREAD_STACK_MIN. */
+#ifndef PTHREAD_STACK_MIN
+# define PTHREAD_STACK_MIN 0
+#endif
+
 #define READ_THREAD_STACKSIZE 					\
 	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
 	PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
-- 
2.29.2


