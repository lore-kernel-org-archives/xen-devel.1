Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDC1CC6B2D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:57:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449729.1665364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9mK-0006sg-6n; Thu, 15 Oct 2026 00:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449729.1665364; Thu, 15 Oct 2026 00:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9mK-0006sZ-2x; Thu, 15 Oct 2026 00:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1449729;
 Thu, 15 Oct 2026 00:57:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9mI-0006rS-Fg
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:57:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9mH-000f30-T4
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:57:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad024ba-2eae-0a2a0a5409dd-0a2a45069a8a-16
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:57:01 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023ec-195a-0a2a45060019-4a68bc04542d-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:53:01 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0qrGs092119
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:52:59 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0qrJX092118;
 Wed, 14 Oct 2026 17:52:53 -0700 (PDT) (envelope-from ehem)
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
Message-ID: <5907d797c6ba6eda80058d52bfdad9eb7ee4e441.1792017109.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017109.git.ehem+xen@m5p.com>
References: <cover.1792017109.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Wed, 14 Oct 2026 15:31:49 -0700
Subject: [PATCH 5/5] tools/xl: Merge down debug/dry-run section of
 create_domain()
X-purgate-ID: tlsNG-16d1c6/1792025581-FC80577B-95CC9C0A/0/0
X-purgate-type: clean
X-purgate-size: 1387

Date: Thu, 17 Dec 2020 17:42:42 -0800

create_domain()'s use of printf_info_sexp() could be merged down to a
single dump_by_config(), do so.  This results in an extra JSON dictionary
in output, but I doubt that is an issue for dry-run or debugging output.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_vmcontrol.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 93766f631b..bfd87e6aef 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -899,19 +899,7 @@ int create_domain(struct domain_create *dom_info)
 
     if (debug || dryrun_only) {
         FILE *cfg_print_fh = (debug && !dryrun_only) ? stderr : stdout;
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
2.47.3


