Return-Path: <SRS0=4XJi=7W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B51C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 14:49:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 938C32072F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 14:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 938C32072F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jifYf-0007Yi-97; Tue, 09 Jun 2020 14:48:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jifYd-0007YS-B2
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 14:48:55 +0000
X-Inumbo-ID: 56e693a6-aa60-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56e693a6-aa60-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 14:48:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17553ADD3;
 Tue,  9 Jun 2020 14:48:57 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 2/2] tools: fix setting of errno in
 xenhypfs_read_raw()
Date: Tue,  9 Jun 2020 16:48:50 +0200
Message-Id: <20200609144850.28619-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609144850.28619-1-jgross@suse.com>
References: <20200609144850.28619-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Setting of errno is wrong in xenhypfs_read_raw(), fix it.

Reported-by: George Dunlap <george.dunlap@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/hypfs/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
index fc23b02586..f94c5ea1e2 100644
--- a/tools/libs/hypfs/core.c
+++ b/tools/libs/hypfs/core.c
@@ -241,10 +241,8 @@ void *xenhypfs_read_raw(xenhypfs_handle *fshdl, const char *path,
         if (!ret)
             break;
 
-        if (ret != ENOBUFS) {
-            errno = -ret;
+        if (errno != ENOBUFS)
             goto out;
-        }
     }
 
     content = malloc(entry->content_len);
-- 
2.26.2


