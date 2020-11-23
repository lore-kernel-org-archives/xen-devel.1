Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29750C63697
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 17:45:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E65F2078E
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 17:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="bm1X1qIm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E65F2078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34928.66239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFtn-0006Mg-H5; Mon, 23 Nov 2020 17:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34928.66239; Mon, 23 Nov 2020 17:45:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFtn-0006MJ-4t; Mon, 23 Nov 2020 17:45:11 +0000
Received: by outflank-mailman (input) for mailman id 34928;
 Mon, 23 Nov 2020 17:45:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khFtk-0006Im-ML
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtj-0006Yd-QW; Mon, 23 Nov 2020 17:45:07 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtj-0000at-Nl; Mon, 23 Nov 2020 17:45:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0006Im-ML
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=woMUqgZMx7At7jFsiX2KySgK2cVzSMaxkSnE1C583H4=; b=bm1X1qImy3nH5EeAFveIsjQaJ
	sZ8qwmFTdaYPnRnACqa10woviAAgF5m9V4hh3s/A1Mh+b32idFR6hJaZaTCoultxoVwmf+3SMeJIX
	Rl98+UfPR0EnOgQPJVNkRYF6BXamkPBvSAqGMl3uFNObvHXbNeDq0/MID764CzeSASloI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtj-0006Yd-QW; Mon, 23 Nov 2020 17:45:07 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtj-0000at-Nl; Mon, 23 Nov 2020 17:45:07 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 05/23] libxl: s/detatched/detached in libxl_pci.c
Date: Mon, 23 Nov 2020 17:44:45 +0000
Message-Id: <20201123174503.6800-6-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

Simply spelling correction. Purely cosmetic fix.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 50c96cbfa6..de617e95eb 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1864,7 +1864,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
 static void pci_remove_timeout(libxl__egc *egc,
     libxl__ev_time *ev, const struct timeval *requested_abs, int rc);
-static void pci_remove_detatched(libxl__egc *egc,
+static void pci_remove_detached(libxl__egc *egc,
     pci_remove_state *prs, int rc);
 static void pci_remove_stubdom_done(libxl__egc *egc,
     libxl__ao_device *aodev);
@@ -1978,7 +1978,7 @@ skip1:
 skip_irq:
     rc = 0;
 out_fail:
-    pci_remove_detatched(egc, prs, rc); /* must be last */
+    pci_remove_detached(egc, prs, rc); /* must be last */
 }
 
 static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
@@ -2002,7 +2002,7 @@ static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
     rc = qemu_pci_remove_xenstore(gc, domid, pci, prs->force);
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_device_del(libxl__egc *egc,
@@ -2028,7 +2028,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
     return;
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_device_del_cb(libxl__egc *egc,
@@ -2051,7 +2051,7 @@ static void pci_remove_qmp_device_del_cb(libxl__egc *egc,
     return;
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_retry_timer_cb(libxl__egc *egc, libxl__ev_time *ev,
@@ -2067,7 +2067,7 @@ static void pci_remove_qmp_retry_timer_cb(libxl__egc *egc, libxl__ev_time *ev,
     return;
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_query_cb(libxl__egc *egc,
@@ -2127,7 +2127,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
     }
 
 out:
-    pci_remove_detatched(egc, prs, rc); /* must be last */
+    pci_remove_detached(egc, prs, rc); /* must be last */
 }
 
 static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
@@ -2146,12 +2146,12 @@ static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
     /* If we timed out, we might still want to keep destroying the device
      * (when force==true), so let the next function decide what to do on
      * error */
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
-static void pci_remove_detatched(libxl__egc *egc,
-                                 pci_remove_state *prs,
-                                 int rc)
+static void pci_remove_detached(libxl__egc *egc,
+                                pci_remove_state *prs,
+                                int rc)
 {
     STATE_AO_GC(prs->aodev->ao);
     int stubdomid = 0;
-- 
2.11.0


