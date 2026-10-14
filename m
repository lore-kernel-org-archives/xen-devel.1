Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89087CC6B2D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:52:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449574.1665256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9hc-0008RW-2K; Thu, 15 Oct 2026 00:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449574.1665256; Thu, 15 Oct 2026 00:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9hb-0008RO-Us; Thu, 15 Oct 2026 00:52:11 +0000
Received: by outflank-mailman (input) for mailman id 1449574;
 Thu, 15 Oct 2026 00:52:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9hb-0008RD-Cs
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:52:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9ha-000UBg-QD
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:52:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad02340-8faa-0a2a0a5109dd-0a2a4506a8a2-42
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:10 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023b9-195a-0a2a45060019-4a68bc044b22-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:10 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0q2DA092040
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:52:08 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0q2Ue092039;
 Wed, 14 Oct 2026 17:52:02 -0700 (PDT) (envelope-from ehem)
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
Message-ID: <faaf6025260684dccc918ea06269ec27b3d7d265.1792017081.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017081.git.ehem+xen@m5p.com>
References: <cover.1792017081.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 14 Oct 2026 15:31:21 -0700
Subject: [PATCH 1/3] tools/utils: cleanup formatting of libxlutil.h
X-purgate-ID: tlsNG-16d1c6/1792025530-F5C0F77B-A8F2EEBB/0/0
X-purgate-type: clean
X-purgate-size: 4301

Date: Mon, 10 Jul 2023 15:55:30 -0700

Some arguments included a name, but not all did.  Now use "cfg" for
all uses of XLU_Config * and "list" for uses of XLU_ConfigList *.

Also fix some spaces missing from xlu_cfg_get_defbool()'s prototype.

Rename the "b" argument of xlu_cfg_get_defbool() to "value_r".  Similar
to other functions this is where the returned value is stored.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/include/libxlutil.h    | 22 +++++++++++-----------
 tools/libs/util/libxlu_cfg.c |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/include/libxlutil.h b/tools/include/libxlutil.h
index 4dd3c5e92b..fcbe41b15a 100644
--- a/tools/include/libxlutil.h
+++ b/tools/include/libxlutil.h
@@ -40,12 +40,12 @@ XLU_Config *xlu_cfg_init(FILE *report, const char *report_filename);
   /* report_filename is copied; report is saved and must remain valid
    *  until the Config is destroyed. */
 
-int xlu_cfg_readfile(XLU_Config*, const char *real_filename);
-int xlu_cfg_readdata(XLU_Config*, const char *data, int length);
+int xlu_cfg_readfile(XLU_Config *cfg, const char *real_filename);
+int xlu_cfg_readdata(XLU_Config *cfg, const char *data, int length);
   /* If these fail, then it is undefined behaviour to call xlu_cfg_get_...
    * functions.  You have to just xlu_cfg_destroy. */
 
-void xlu_cfg_destroy(XLU_Config*);
+void xlu_cfg_destroy(XLU_Config *cfg);
 
 
 /* All of the following print warnings to "report" if there is a problem.
@@ -56,26 +56,26 @@ void xlu_cfg_destroy(XLU_Config*);
  *   ERANGE   value out of range (from strtol)
  */
 
-int xlu_cfg_get_string(const XLU_Config*, const char *n, const char **value_r,
-                       int dont_warn);
+int xlu_cfg_get_string(const XLU_Config *cfg, const char *n,
+                       const char **value_r, int dont_warn);
 /* free/strdup version */
 int xlu_cfg_replace_string(const XLU_Config *cfg, const char *n,
                            char **value_r, int dont_warn);
-int xlu_cfg_get_long(const XLU_Config*, const char *n, long *value_r,
+int xlu_cfg_get_long(const XLU_Config *cfg, const char *n, long *value_r,
                      int dont_warn);
-int xlu_cfg_get_bounded_long(const XLU_Config*, const char *n, long min,
+int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *n, long min,
                              long max, long *value_r, int dont_warn);
-int xlu_cfg_get_defbool(const XLU_Config*, const char *n, libxl_defbool *b,
-                     int dont_warn);
+int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n,
+                        libxl_defbool *value_r, int dont_warn);
 
-int xlu_cfg_get_list(const XLU_Config*, const char *n,
+int xlu_cfg_get_list(const XLU_Config *cfg, const char *n,
                      XLU_ConfigList **list_r /* may be 0 */,
                      int *entries_r /* may be 0 */,
                      int dont_warn);
   /* there is no need to free *list_r; lifetime is that of the XLU_Config */
 int xlu_cfg_get_list_as_string_list(const XLU_Config *cfg, const char *n,
                                     libxl_string_list *sl, int dont_warn);
-const char *xlu_cfg_get_listitem(const XLU_ConfigList*, int entry);
+const char *xlu_cfg_get_listitem(const XLU_ConfigList *list, int entry);
   /* xlu_cfg_get_listitem cannot fail, except that if entry is
    * out of range it returns 0 (not setting errno) */
 
diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 874f5abfb9..87ac8c4b41 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -328,15 +328,15 @@ int xlu_cfg_get_long(const XLU_Config *cfg, const char *n,
                                     dont_warn);
 }
 
-int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n, libxl_defbool *b,
-                     int dont_warn)
+int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n,
+                        libxl_defbool *value_r, int dont_warn)
 {
     int ret;
     long l;
 
     ret = xlu_cfg_get_long(cfg, n, &l, dont_warn);
     if (ret) return ret;
-    libxl_defbool_set(b, !!l);
+    libxl_defbool_set(value_r, !!l);
     return 0;
 }
 
-- 
2.47.3


