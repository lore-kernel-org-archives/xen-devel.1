Return-Path: <SRS0=Z/2m=B3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBD2C433E1
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 09:49:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391D1206C0
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 09:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391D1206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7blv-0004EI-S3; Mon, 17 Aug 2020 09:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7blu-00046j-0K
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:42 +0000
X-Inumbo-ID: 0e5f0fea-52e3-43c4-8ee5-14a64c775b06
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e5f0fea-52e3-43c4-8ee5-14a64c775b06;
 Mon, 17 Aug 2020 09:49:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31A2FAEF8;
 Mon, 17 Aug 2020 09:49:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 07/17] tools/misc: don't use libxenctrl internals from
 xen-hptool
Date: Mon, 17 Aug 2020 11:49:12 +0200
Message-Id: <20200817094922.15768-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

xen-hptool is including private headers from tools/libxc without any
need. Switch it to use official headers only.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/misc/Makefile     | 2 --
 tools/misc/xen-hptool.c | 8 +++++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index e7e74db85f..2a7f2ec42d 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -94,8 +94,6 @@ xenhypfs: xenhypfs.o
 xenlockprof: xenlockprof.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
-# xen-hptool incorrectly uses libxc internals
-xen-hptool.o: CFLAGS += -I$(XEN_ROOT)/tools/libxc $(CFLAGS_libxencall)
 xen-hptool: xen-hptool.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
index 6e27d9cf43..7f17f24942 100644
--- a/tools/misc/xen-hptool.c
+++ b/tools/misc/xen-hptool.c
@@ -1,9 +1,11 @@
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 #include <xenevtchn.h>
 #include <xenctrl.h>
-#include <xc_private.h>
-#include <xc_core.h>
+#include <xenguest.h>
 #include <xenstore.h>
-#include <unistd.h>
+#include <xen-tools/libs.h>
 
 static xc_interface *xch;
 
-- 
2.26.2


