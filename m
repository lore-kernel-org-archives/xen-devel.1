Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F03FE98E13
	for <xen-devel@archiver.kernel.org>; Mon, 23 Feb 2026 10:14:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1238759.1540310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxL-0003bP-Hf; Mon, 23 Feb 2026 10:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238759.1540310; Mon, 23 Feb 2026 10:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxL-0003Zt-8O; Mon, 23 Feb 2026 10:14:23 +0000
Received: by outflank-mailman (input) for mailman id 1238759;
 Mon, 23 Feb 2026 10:14:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSxK-0003AC-7W
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:14:22 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ae8d720-10a0-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 11:14:20 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 5945441202E0;
 Mon, 23 Feb 2026 05:14:01 -0500 (EST)
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
X-Inumbo-ID: 6ae8d720-10a0-11f1-b164-2bf370ae4941
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 5/7] tools/tests/common: ensure error messages have a newline
Date: Mon, 23 Feb 2026 10:14:09 +0000
Message-ID: <b41bf6aed1fb428fd8097c4afb414d88664b2b05.1771840831.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840831.git.edwin.torok@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Otherwise messages from the next test will end up on the same line as an
error message from a previous test.
(calling `fail` is not fatal).

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/common/tests.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/tests/common/tests.h b/tools/tests/common/tests.h
index f0df616e3e..add847a46a 100644
--- a/tools/tests/common/tests.h
+++ b/tools/tests/common/tests.h
@@ -6,12 +6,12 @@ extern unsigned int nr_failures;
 #define fail(fmt, ...)                          \
 ({                                              \
     nr_failures++;                              \
-    (void)printf(fmt, ##__VA_ARGS__);           \
+    (void)printf(fmt"\n", ##__VA_ARGS__);           \
 })
 
 #define verify(exp, fmt, args...) \
 while (!(exp)) { \
-    printf(fmt, ## args); \
+    printf(fmt"\n", ## args); \
     exit(EX_SOFTWARE); \
 }
 
-- 
2.47.3


