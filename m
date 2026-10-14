Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB24FCC6B30
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:55:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449695.1665337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9kg-0005IN-Bo; Thu, 15 Oct 2026 00:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449695.1665337; Thu, 15 Oct 2026 00:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9kg-0005IG-8L; Thu, 15 Oct 2026 00:55:22 +0000
Received: by outflank-mailman (input) for mailman id 1449695;
 Thu, 15 Oct 2026 00:55:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9ke-0005H5-Ls
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:55:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9kd-0072aV-Vv
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:55:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad02470-bab6-0a2a0a5309dd-0a2a450399e6-6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:55:19 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023fe-fae8-0a2a45030019-4a68bc04c2dc-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:53:19 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0rCts092135
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:53:17 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0rC1i092134;
 Wed, 14 Oct 2026 17:53:12 -0700 (PDT) (envelope-from ehem)
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
Message-ID: <b93192aa21e21c3cb65ff09a269cfe560c4dead3.1792017144.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017144.git.ehem+xen@m5p.com>
References: <cover.1792017144.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Tue, 13 Oct 2026 19:16:41 -0700
Subject: [PATCH 2/3] tools/xl: free loaded configuration data earlier in
 create_domain()
X-purgate-ID: tlsNG-33051d/1792025599-756834E9-5B50BEB9/0/0
X-purgate-type: clean
X-purgate-size: 940

Rather than waiting for just before return, release the memory sooner.
This potentially reduces process size due to be reused sooner.  Also
ensures it never gets into the daemon process.
---
 tools/xl/xl_vmcontrol.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 93766f631b..76c2a07ee8 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -853,6 +853,8 @@ int create_domain(struct domain_create *dom_info)
         parse_config_data(config_source, config_data, config_len, &d_config);
     }
 
+    free(config_data);
+
     if (!dom_info->ignore_global_affinity_masks) {
         libxl_domain_build_info *b_info = &d_config.b_info;
 
@@ -1200,8 +1202,6 @@ out:
 
     libxl_domain_config_dispose(&d_config);
 
-    free(config_data);
-
     console_child_report(child_console);
 
     if (deathw)
-- 
2.47.3


