Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B0EC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 22:52:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADDE02072E
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 22:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADDE02072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61556.108432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYhx-0001C2-2h; Mon, 04 Jan 2021 22:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61556.108432; Mon, 04 Jan 2021 22:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYhw-0001Bu-Vz; Mon, 04 Jan 2021 22:52:12 +0000
Received: by outflank-mailman (input) for mailman id 61556;
 Mon, 04 Jan 2021 22:52:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYhu-0000oY-Ss
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:52:10 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f1e43c2-3fb8-4ee3-909c-927d361f92ea;
 Mon, 04 Jan 2021 22:51:59 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MpnaN071442
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:51:55 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104Mpnsm071441;
 Mon, 4 Jan 2021 14:51:49 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 9f1e43c2-3fb8-4ee3-909c-927d361f92ea
Message-Id: <80f80b6bf5da09ceb332773b96f1dd554782b030.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Wed, 9 Dec 2020 14:34:37 -0800
Subject: [WIP PATCH 07/16] tools/xl: Sort list command options

Simply a minor housekeeping task.  Unfortunately no single order really
dominates.  Some spots use the option name, some the option letter.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_cmdtable.c |  4 ++--
 tools/xl/xl_list.c     | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 6ab5e47da3..6a05bf7ce2 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -53,11 +53,11 @@ struct cmd_spec cmd_table[] = {
       &main_list, 0, 0,
       "List information about all/some domains",
       "[options] [Domain]\n",
-      "-l, --long              Output all VM details\n"
-      "-v, --verbose           Prints out UUIDs and security context\n"
       "-Z, --context           Prints out security context\n"
       "-c, --cpupool           Prints the cpupool the domain is in\n"
+      "-l, --long              Output all VM details\n"
       "-n, --numa              Prints out NUMA node affinity"
+      "-v, --verbose           Prints out UUIDs and security context\n"
     },
     { "destroy",
       &main_destroy, 0, 1,
diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index ac6a9e5eac..8b391a9056 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -129,17 +129,17 @@ static void list_domains(bool verbose, bool context, bool claim, bool numa,
 int main_list(int argc, char **argv)
 {
     int opt;
-    bool verbose = false;
     bool context = false;
-    bool details = false;
     bool cpupool = false;
+    bool details = false;
     bool numa = false;
+    bool verbose = false;
     static struct option opts[] = {
-        {"long", 0, 0, 'l'},
-        {"verbose", 0, 0, 'v'},
         {"context", 0, 0, 'Z'},
         {"cpupool", 0, 0, 'c'},
+        {"long", 0, 0, 'l'},
         {"numa", 0, 0, 'n'},
+        {"verbose", 0, 0, 'v'},
         COMMON_LONG_OPTS
     };
 
@@ -147,22 +147,22 @@ int main_list(int argc, char **argv)
     libxl_dominfo *info, *info_free=0;
     int nb_domain, rc;
 
-    SWITCH_FOREACH_OPT(opt, "lvhZcn", opts, "list", 0) {
-    case 'l':
-        details = true;
-        break;
-    case 'v':
-        verbose = true;
-        break;
+    SWITCH_FOREACH_OPT(opt, "Zchlnv", opts, "list", 0) {
     case 'Z':
         context = true;
         break;
     case 'c':
         cpupool = true;
         break;
+    case 'l':
+        details = true;
+        break;
     case 'n':
         numa = true;
         break;
+    case 'v':
+        verbose = true;
+        break;
     }
 
     libxl_dominfo_init(&info_buf);
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




