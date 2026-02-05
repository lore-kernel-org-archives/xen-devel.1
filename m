Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43E8EA7951
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 01:36:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1221356.1529658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI9-0002ng-NS; Thu, 05 Feb 2026 01:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221356.1529658; Thu, 05 Feb 2026 01:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI9-0002mM-Hu; Thu, 05 Feb 2026 01:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1221356;
 Thu, 05 Feb 2026 01:36:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnoI8-0002cG-0K
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 01:36:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI7-003wRJ-33;
 Thu, 05 Feb 2026 01:36:19 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI7-00HVXb-1R;
 Thu, 05 Feb 2026 01:36:19 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=bNWaJuUXW1hcVfeutPblFaJxcDIyBZhI3ZQ6lYZGoTo=; b=SVkMCn+PN2IcPts2W9aqfA74Q/
	3LhLaJthRaMLGDt5IMwKF9TsHjQWxQA7RlLRpqGUdCnP2GOxwcTbPJLIrxLIc2VA31I/9bsnqXfwA
	UDaUW6Ov1D2RETN8r6ef+r+kBXyRGddOfvmkexjwjkzLLeuL5XAIz5uOpY/KdZMYKOn8=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v5 6/6] xen/console: add conring buffer size alignment setting
Date: Wed,  4 Feb 2026 17:36:06 -0800
Message-ID: <20260205013606.3384798-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205013606.3384798-1-dmukhin@ford.com>
References: <20260205013606.3384798-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Introduce CONFIG_CONRING_ALIGN_PAGE_SIZE to control rounding down of the
user-defined conring buffer size.

Also, update the logline reporting the final conring buffer size to report
bytes instead of kilobytes, since the user-defined size may not necessarily
be kilobyte-alined.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/drivers/char/Kconfig   |  7 +++++++
 xen/drivers/char/console.c | 15 +++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index d083ba4c9cdf..1b96fbc3ed7c 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -95,6 +95,13 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
+config CONRING_ALIGN_PAGE_SIZE
+	bool
+	default y
+	help
+	  This selects the console ring buffer size alignment (rounding down)
+	  to a multiple of PAGE_SIZE.
+
 config CONRING_SHIFT
 	int "Console ring buffer size (power of 2)"
 	range 14 27
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 9394ab2a89eb..c13818715a52 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -470,12 +470,15 @@ void __init console_init_ring(void)
         return;
 
     opt_conring_size = max(opt_conring_size, conring_size);
-    size = ROUNDDOWN(opt_conring_size, PAGE_SIZE);
-    if ( size != opt_conring_size )
+    if ( IS_ENABLED(CONFIG_CONRING_ALIGN_PAGE_SIZE) )
     {
-        opt_conring_size = size;
-        printk(XENLOG_WARNING "Rounding down console ring size to multiple of %lu KiB.\n",
-               PAGE_SIZE >> 10);
+        size = ROUNDDOWN(opt_conring_size, PAGE_SIZE);
+        if ( size != opt_conring_size )
+        {
+            opt_conring_size = size;
+            printk(XENLOG_WARNING "Rounding down console ring size to multiple of %lu KiB.\n",
+                   PAGE_SIZE >> 10);
+        }
     }
     if ( opt_conring_size >= GB(2) )
     {
@@ -512,7 +515,7 @@ void __init console_init_ring(void)
 
     nrspin_unlock_irqrestore(&console_lock, flags);
 
-    printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
+    printk("Allocated console ring of %u bytes.\n", opt_conring_size);
 }
 
 /*
-- 
2.52.0


