Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41936C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 22:51:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3E512072E
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 22:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3E512072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61537.108397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYhV-0000rK-5R; Mon, 04 Jan 2021 22:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61537.108397; Mon, 04 Jan 2021 22:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYhV-0000rD-1g; Mon, 04 Jan 2021 22:51:45 +0000
Received: by outflank-mailman (input) for mailman id 61537;
 Mon, 04 Jan 2021 22:51:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYhT-0000qT-MZ
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:51:43 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95d3c12e-e471-4cf5-a1bf-a9b373d21a4a;
 Mon, 04 Jan 2021 22:51:42 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MpXOt071423
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:51:38 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MpXLe071422;
 Mon, 4 Jan 2021 14:51:33 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 95d3c12e-e471-4cf5-a1bf-a9b373d21a4a
Message-Id: <727689d0c61e4309753fbb398b6cfd80be07942a.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 17 Dec 2020 17:42:42 -0800
Subject: [WIP PATCH 05/16] tools/xl: Merge down debug/dry-run section of
 create_domain()

create_domain()'s use of printf_info_sexp() could be merged down to a
single dump_by_config(), do so.  This results in an extra JSON dictionary
in output, but I doubt that is an issue for dry-run or debugging output.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_vmcontrol.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 435155a033..4b95e7e463 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -856,19 +856,7 @@ int create_domain(struct domain_create *dom_info)
 
     if (debug || dom_info->dryrun) {
         FILE *cfg_print_fh = (debug && !dom_info->dryrun) ? stderr : stdout;
-        if (default_output_format == OUTPUT_FORMAT_SXP) {
-            printf_info_sexp(-1, &d_config, cfg_print_fh);
-        } else {
-            char *json = libxl_domain_config_to_json(ctx, &d_config);
-            if (!json) {
-                fprintf(stderr,
-                        "Failed to convert domain configuration to JSON\n");
-                exit(1);
-            }
-            fputs(json, cfg_print_fh);
-            free(json);
-            flush_stream(cfg_print_fh);
-        }
+        dump_by_config(default_output_format, cfg_print_fh, &d_config, -1);
     }
 
 
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




