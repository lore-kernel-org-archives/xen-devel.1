Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FDFCC6B30
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:52:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449612.1665302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9i8-0001uE-Bz; Thu, 15 Oct 2026 00:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449612.1665302; Thu, 15 Oct 2026 00:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9i8-0001u4-7I; Thu, 15 Oct 2026 00:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1449612;
 Thu, 15 Oct 2026 00:52:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9i7-0001qU-2P
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:52:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9i6-000U9c-Ft
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:52:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023d8-bab6-0a2a0a5309dd-0a2a4505dea4-6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:42 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023d9-4cb1-0a2a45050019-4a68bc04ca60-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:42 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0qYHR092086
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:52:40 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0qYhQ092085;
 Wed, 14 Oct 2026 17:52:34 -0700 (PDT) (envelope-from ehem)
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
Message-ID: <6bd9ae49a7b834d2d38fbebb48f20615860cc1c4.1792017109.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017109.git.ehem+xen@m5p.com>
References: <cover.1792017109.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Wed, 14 Oct 2026 15:31:49 -0700
Subject: [PATCH 2/5] tools/xl: Mark libxl_domain_config * arg of
 printf_info_*() const
X-purgate-ID: tlsNG-c201ff/1792025562-F52A32A1-25373472/0/0
X-purgate-type: clean
X-purgate-size: 2776

Date: Fri, 18 Dec 2020 13:32:33 -0800

With libxl having gotten a lot more constant, now printf_info_sexp() and
printf_info_one_json() can add consts.  May not be particularly
important, but it is best to mark things constant when they are known to
be so.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl.h      | 2 +-
 tools/xl/xl_info.c | 4 ++--
 tools/xl/xl_sxp.c  | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7b75f9a493..dcd77d1ec4 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -308,7 +308,7 @@ typedef enum {
     DOMAIN_RESTART_SUSPENDED,    /* Domain suspended - keep looping */
 } domain_restart_type;
 
-extern void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh);
+extern void printf_info_sexp(int domid, const libxl_domain_config *d_config, FILE *fh);
 extern void apply_global_affinity_masks(libxl_domain_type type,
                                         libxl_bitmap *vcpu_affinity_array,
                                         unsigned int size);
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 98fc879e63..9540384beb 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -63,7 +63,7 @@ static int maybe_printf(const char *fmt, ...)
 
 #ifdef HAVE_LIBJSONC
 static int printf_info_one_json(json_object **jso_r, int domid,
-                                libxl_domain_config *d_config)
+                                const libxl_domain_config *d_config)
 {
     json_object *jso = NULL;
     json_object *jso_config = NULL;
@@ -108,7 +108,7 @@ out:
 #elif defined(HAVE_LIBYAJL)
 
 static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid,
-                                            libxl_domain_config *d_config)
+                                            const libxl_domain_config *d_config)
 {
     yajl_gen_status s;
 
diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
index 4383ad177a..d2347e401a 100644
--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -26,13 +26,13 @@
 /* In general you should not add new output to this function since it
  * is intended only for legacy use.
  */
-void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
+void printf_info_sexp(int domid, const libxl_domain_config *d_config, FILE *fh)
 {
     int i;
     libxl_dominfo info;
 
-    libxl_domain_create_info *c_info = &d_config->c_info;
-    libxl_domain_build_info *b_info = &d_config->b_info;
+    const libxl_domain_create_info *c_info = &d_config->c_info;
+    const libxl_domain_build_info *b_info = &d_config->b_info;
 
     fprintf(fh, "(domain\n\t(domid %d)\n", domid);
     fprintf(fh, "\t(create_info)\n");
-- 
2.47.3


