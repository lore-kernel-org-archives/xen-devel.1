Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D03FB5180
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2026 02:25:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1274421.1560532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9w7d-0000iU-Ow; Tue, 07 Apr 2026 02:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274421.1560532; Tue, 07 Apr 2026 02:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9w7d-0000iM-K8; Tue, 07 Apr 2026 02:24:57 +0000
Received: by outflank-mailman (input) for mailman id 1274421;
 Tue, 07 Apr 2026 02:24:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhaoguohan@kylinos.cn>) id 1w9w7c-0000iG-JR
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 02:24:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9w7b-000YU8-HP
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 04:24:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhaoguohan@kylinos.cn>)
 id 69d46a93-bab6-0a2a0a5309dd-0a2a450cabae-32
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 04:24:55 +0200
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <zhaoguohan@kylinos.cn>)
 id 69d46af4-f40c-0a2a450c0019-7c7e67e8e51a-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 04:24:54 +0200
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <zhaoguohan@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 730094213; Tue, 07 Apr 2026 10:24:46 +0800
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
X-UUID: f224c9a4322811f1aa26b74ffac11d73-20260407
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7e94b4d7-7953-4c7f-a6e2-6f9af9de78fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:7435d5df1d566edbeea2e54162a75b2b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f224c9a4322811f1aa26b74ffac11d73-20260407
X-User: zhaoguohan@kylinos.cn
From: zhaoguohan@kylinos.cn
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	GuoHan Zhao <zhaoguohan@kylinos.cn>
Subject: [PATCH] xen/manage: unwind partial shutdown watcher setup on error
Date: Tue,  7 Apr 2026 10:24:43 +0800
Message-ID: <20260407022443.12971-1-zhaoguohan@kylinos.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775528695-FE74EA3D-5C680B20/0/0
X-purgate-type: clean
X-purgate-size: 2011

From: GuoHan Zhao <zhaoguohan@kylinos.cn>

setup_shutdown_watcher() registers shutdown_watch first, then the sysrq
watch, and finally publishes the supported feature-* nodes in xenstore.
If sysrq watch registration fails, or xenbus_printf() fails after one or
more feature nodes were created, the function returns immediately without
undoing the earlier setup.

This leaves the system in a partially initialized state, with registered
watches and/or stale xenstore entries despite the function reporting
failure.

Unwind the partial setup before returning an error by unregistering any
watches that were already registered and removing feature nodes that were
already published.

Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
---
 drivers/xen/manage.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index e20c40a62e64..18bf09e0192a 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -343,12 +343,11 @@ static int setup_shutdown_watcher(void)
 		return err;
 	}
 
-
 #ifdef CONFIG_MAGIC_SYSRQ
 	err = register_xenbus_watch(&sysrq_watch);
 	if (err) {
 		pr_err("Failed to set sysrq watcher\n");
-		return err;
+		goto err_unregister_shutdown;
 	}
 #endif
 
@@ -361,11 +360,26 @@ static int setup_shutdown_watcher(void)
 		if (err) {
 			pr_err("%s: Error %d writing %s\n", __func__,
 				err, node);
-			return err;
+			goto err_remove_features;
 		}
 	}
 
 	return 0;
+
+err_remove_features:
+	while (--idx >= 0) {
+		if (!shutdown_handlers[idx].flag)
+			continue;
+		snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
+			 shutdown_handlers[idx].command);
+		xenbus_rm(XBT_NIL, "control", node);
+	}
+#ifdef CONFIG_MAGIC_SYSRQ
+	unregister_xenbus_watch(&sysrq_watch);
+#endif
+err_unregister_shutdown:
+	unregister_xenbus_watch(&shutdown_watch);
+	return err;
 }
 
 static int shutdown_event(struct notifier_block *notifier,
-- 
2.43.0


