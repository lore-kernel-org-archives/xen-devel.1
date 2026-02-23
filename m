Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A3BE98E19
	for <xen-devel@archiver.kernel.org>; Mon, 23 Feb 2026 10:14:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1238761.1540336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxN-0004Fl-Ii; Mon, 23 Feb 2026 10:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238761.1540336; Mon, 23 Feb 2026 10:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxN-0004Du-6a; Mon, 23 Feb 2026 10:14:25 +0000
Received: by outflank-mailman (input) for mailman id 1238761;
 Mon, 23 Feb 2026 10:14:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSxL-0002wR-QC
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:14:23 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b97a997-10a0-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 11:14:21 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 6CF15412248F;
 Mon, 23 Feb 2026 05:14:02 -0500 (EST)
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
X-Inumbo-ID: 6b97a997-10a0-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 7/7] tools/tests: print more debug info
Date: Mon, 23 Feb 2026 10:14:11 +0000
Message-ID: <927bbe915b3e5af56e5fafeede47c090eb55236f.1771840831.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840831.git.edwin.torok@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable xentoollog at XTL_DEBUG level.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/common/guests.c | 4 +++-
 tools/tests/tsx/Makefile    | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/tests/common/guests.c b/tools/tests/common/guests.c
index bb33bfd8c0..a46ff2f68d 100644
--- a/tools/tests/common/guests.c
+++ b/tools/tests/common/guests.c
@@ -9,11 +9,13 @@
 xc_interface *xch;
 xc_physinfo_t physinfo;
 bool xen_has_pv = true, xen_has_hvm = true;
+xentoollog_logger *logger;
 
 void test_guest_init(void)
 {
     int rc;
-    xch = xc_interface_open(NULL, NULL, 0);
+    logger = (xentoollog_logger*)xtl_createlogger_stdiostream(stderr, XTL_DEBUG, 0);
+    xch = xc_interface_open(logger, NULL, 0);
 
     if ( !xch )
         err(1, "xc_interface_open");
diff --git a/tools/tests/tsx/Makefile b/tools/tests/tsx/Makefile
index 3ccb6dcb9f..cbcae6d090 100644
--- a/tools/tests/tsx/Makefile
+++ b/tools/tests/tsx/Makefile
@@ -10,6 +10,7 @@ CFLAGS += $(CFLAGS_libxenguest)
 
 LDFLAGS += $(LDLIBS_libxenctrl)
 LDFLAGS += $(LDLIBS_libxenguest)
+LDFLAGS += $(LDLIBS_libxentoollog)
 
 $(TARGET): ../common/guests.o
 
-- 
2.47.3


