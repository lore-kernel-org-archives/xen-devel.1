Return-Path: <SRS0=bW6+=HB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296F6C433E0
	for <xen-devel@archiver.kernel.org>; Sat, 30 Jan 2021 18:27:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D2564E13
	for <xen-devel@archiver.kernel.org>; Sat, 30 Jan 2021 18:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D2564E13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netbsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78984.143750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5uxw-0007wW-9G; Sat, 30 Jan 2021 18:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78984.143750; Sat, 30 Jan 2021 18:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5uxw-0007wP-66; Sat, 30 Jan 2021 18:27:24 +0000
Received: by outflank-mailman (input) for mailman id 78984;
 Sat, 30 Jan 2021 18:27:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N63w=HB=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l5uxu-0007wK-CB
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 18:27:22 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77e6bb4d-36b9-4bb0-9203-61372c9e1af4;
 Sat, 30 Jan 2021 18:27:20 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10UIRJtt001022;
 Sat, 30 Jan 2021 19:27:19 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10UIRJqj003480;
 Sat, 30 Jan 2021 19:27:19 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id B8F3CA9F9D; Sat, 30 Jan 2021 19:27:19 +0100 (MET)
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
X-Inumbo-ID: 77e6bb4d-36b9-4bb0-9203-61372c9e1af4
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] define GNU_SOURCE for asprintf()
Date: Sat, 30 Jan 2021 19:27:11 +0100
Message-Id: <20210130182711.2473-2-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130182711.2473-1-bouyer@netbsd.org>
References: <20210130182711.2473-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 30 Jan 2021 19:27:20 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

#define _GNU_SOURCE to get for asprintf() prototype on Linux.
Harmless on NetBSD.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/xenpmd/xenpmd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
index e432aad856..8e783181e1 100644
--- a/tools/xenpmd/xenpmd.c
+++ b/tools/xenpmd/xenpmd.c
@@ -32,6 +32,7 @@
  * passed to the guest when appropriate battery ports are read/written to.
  */
 
+#define _GNU_SOURCE         /* for asprintf() */
 #include <stdio.h>
 #include <stdarg.h>
 #include <string.h>
-- 
2.29.2


