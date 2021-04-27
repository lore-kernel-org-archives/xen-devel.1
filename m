Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD61C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 12:05:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDF161003
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 12:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDF161003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cs.pub.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118361.224434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMT9-00066Y-Ow; Tue, 27 Apr 2021 12:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118361.224434; Tue, 27 Apr 2021 12:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMT9-00066Q-Lm; Tue, 27 Apr 2021 12:05:35 +0000
Received: by outflank-mailman (input) for mailman id 118361;
 Tue, 27 Apr 2021 12:05:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HmyD=JY=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lbMT8-00062s-RD
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 12:05:34 +0000
Received: from mx.upb.ro (unknown [141.85.13.220])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 995564d1-63ae-4e44-bc03-4d4a0bde0b66;
 Tue, 27 Apr 2021 12:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 478AFB5600B9;
 Tue, 27 Apr 2021 15:05:28 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XMZxpq2MkaK4; Tue, 27 Apr 2021 15:05:26 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 71715B5600BA;
 Tue, 27 Apr 2021 15:05:26 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6IiaJN9JLXvb; Tue, 27 Apr 2021 15:05:26 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 1CB92B560057;
 Tue, 27 Apr 2021 15:05:26 +0300 (EEST)
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
X-Inumbo-ID: 995564d1-63ae-4e44-bc03-4d4a0bde0b66
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/5] tools/libs/gnttab: Fix PAGE_SIZE redefinition error
Date: Tue, 27 Apr 2021 15:05:19 +0300
Message-Id: <bd1e79d7dade6dc6a8d89b1d0e96d47be6b2d315.1619524463.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619524463.git.costin.lupu@cs.pub.ro>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PAGE_SIZE is already defined in the system (e.g. in
/usr/include/limits.h header) then gcc will trigger a redefinition error
because of -Werror. This commit also protects PAGE_SHIFT and PAGE_MASK
definitions for keeping consistency.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/libs/gnttab/linux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libs/gnttab/linux.c b/tools/libs/gnttab/linux.c
index 74331a4c7b..e12f2697a5 100644
--- a/tools/libs/gnttab/linux.c
+++ b/tools/libs/gnttab/linux.c
@@ -36,9 +36,15 @@
=20
 #include "private.h"
=20
+#ifndef PAGE_SHIFT
 #define PAGE_SHIFT           12
+#endif
+#ifndef PAGE_SIZE
 #define PAGE_SIZE            (1UL << PAGE_SHIFT)
+#endif
+#ifndef PAGE_MASK
 #define PAGE_MASK            (~(PAGE_SIZE-1))
+#endif
=20
 #define DEVXEN "/dev/xen/"
=20
--=20
2.20.1


