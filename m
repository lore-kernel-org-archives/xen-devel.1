Return-Path: <SRS0=9fiq=HS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D51C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 17:43:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1628964E04
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 17:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1628964E04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85985.160997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4Np-0002ZF-Ld; Tue, 16 Feb 2021 17:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85985.160997; Tue, 16 Feb 2021 17:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4Np-0002Z8-IW; Tue, 16 Feb 2021 17:43:33 +0000
Received: by outflank-mailman (input) for mailman id 85985;
 Tue, 16 Feb 2021 17:43:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hb7A=HS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lC4No-0002Yi-4Q
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 17:43:32 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a3334e1-2ac7-4881-9f7d-a66d05dbff6c;
 Tue, 16 Feb 2021 17:43:31 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 11GHhLI7012036
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 16 Feb 2021 12:43:27 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 11GHhL93012035;
 Tue, 16 Feb 2021 09:43:21 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 6a3334e1-2ac7-4881-9f7d-a66d05dbff6c
Message-Id: <7de11de51475d98197ad30124674b9785a731dda.1613496229.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1613496229.git.ehem+xen@m5p.com>
References: <cover.1613496229.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Fri, 18 Dec 2020 13:32:33 -0800
Subject: [RESEND PATCH 2/2] tools/xl: Mark libxl_domain_config * arg of
 printf_info_*() const

With libxl having gotten a lot more constant, now printf_info_sexp() and
printf_info_one_json() can add consts.  May not be particularly
important, but it is best to mark things constant when they are known to
be so.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl.h      | 2 +-
 tools/xl/xl_info.c | 2 +-
 tools/xl/xl_sxp.c  | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 137a29077c..30a6ddb86f 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -300,7 +300,7 @@ typedef enum {
     DOMAIN_RESTART_SOFT_RESET,   /* Soft reset should be performed */
 } domain_restart_type;
 
-extern void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh);
+extern void printf_info_sexp(int domid, const libxl_domain_config *d_config, FILE *fh);
 extern void apply_global_affinity_masks(libxl_domain_type type,
                                         libxl_bitmap *vcpu_affinity_array,
                                         unsigned int size);
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 8383e4a6df..18c88abf34 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -59,7 +59,7 @@ static int maybe_printf(const char *fmt, ...)
 }
 
 static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid,
-                                            libxl_domain_config *d_config)
+                                            const libxl_domain_config *d_config)
 {
     yajl_gen_status s;
 
diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
index 359a001570..d5b9051dfc 100644
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


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




