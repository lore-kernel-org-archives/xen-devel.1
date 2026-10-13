Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E365FCC6B2D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:53:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449665.1665328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9iq-0003uE-1U; Thu, 15 Oct 2026 00:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449665.1665328; Thu, 15 Oct 2026 00:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9ip-0003u5-Uh; Thu, 15 Oct 2026 00:53:27 +0000
Received: by outflank-mailman (input) for mailman id 1449665;
 Thu, 15 Oct 2026 00:53:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9io-0003pi-Bz
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:53:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9in-000UBg-Ns
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:53:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad0239e-8faa-0a2a0a5109dd-0a2a4502d336-42
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:53:25 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad02404-6ca4-0a2a45020019-4a68bc04ec6b-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:53:25 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0rI90092143
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:53:23 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0rIQu092142;
 Wed, 14 Oct 2026 17:53:18 -0700 (PDT) (envelope-from ehem)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <92156ced183670bbbcb2d3f9e2dca4d12f37ee7c.1792017144.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017144.git.ehem+xen@m5p.com>
References: <cover.1792017144.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Mon, 12 Oct 2026 18:03:49 -0700
Subject: [PATCH 3/3] tools/xl: move some logic needed only once earlier in
 create_domain()
X-purgate-ID: tlsNG-720697/1792025605-317CA2AC-8EA945BF/0/0
X-purgate-type: clean
X-purgate-size: 2519

The value of dom_info->console_autoconnect isn't going to change if a
domain is rebooted.  Nor does this logic need the lock to be held.  As
such moving this earlier makes sense.

The policy domain is set once and then never changed.  Similar to above
simply move before the reboot start point.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_vmcontrol.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 76c2a07ee8..ae7985122f 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -717,7 +717,8 @@ int create_domain(struct domain_create *dom_info)
     int restore_fd = -1;
     int restore_fd_to_close = -1;
     int send_back_fd = -1;
-    const libxl_asyncprogress_how *autoconnect_console_how;
+    const libxl_asyncprogress_how *autoconnect_console_how = NULL;
+    libxl_asyncprogress_how autoconnect_console_how_buf;
     int notify_pipe[2] = { -1, -1 };
     struct save_file_header hdr;
     uint32_t domid_soft_reset = INVALID_DOMID;
@@ -921,6 +922,19 @@ int create_domain(struct domain_create *dom_info)
     if (dryrun_only)
         goto out;
 
+    if (dom_info->console_autoconnect) {
+        if (libxl_pipe(ctx, notify_pipe)) {
+            ret = ERROR_FAIL;
+            goto error_out;
+        }
+        autoconnect_console_how_buf.callback = autoconnect_console;
+        autoconnect_console_how_buf.for_callback = &notify_pipe[1];
+        autoconnect_console_how = &autoconnect_console_how_buf;
+    }
+
+    if (!libxl_domid_valid_guest(d_config.c_info.domid))
+        d_config.c_info.domid = domid_policy;
+
 start:
     assert(domid == INVALID_DOMID);
 
@@ -938,22 +952,6 @@ start:
         }
     }
 
-    libxl_asyncprogress_how autoconnect_console_how_buf;
-    if ( dom_info->console_autoconnect ) {
-        if (libxl_pipe(ctx, notify_pipe)) {
-            ret = ERROR_FAIL;
-            goto error_out;
-        }
-        autoconnect_console_how_buf.callback = autoconnect_console;
-        autoconnect_console_how_buf.for_callback = &notify_pipe[1];
-        autoconnect_console_how = &autoconnect_console_how_buf;
-    }else{
-        autoconnect_console_how = 0;
-    }
-
-    if (!libxl_domid_valid_guest(d_config.c_info.domid))
-        d_config.c_info.domid = domid_policy;
-
     if ( restoring ) {
         libxl_domain_restore_params params;
 
-- 
2.47.3


