Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44984C63777
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 17:45:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA66F2076E
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 17:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="19D3PZ71"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA66F2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34934.66302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFts-0006ZU-65; Mon, 23 Nov 2020 17:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34934.66302; Mon, 23 Nov 2020 17:45:16 +0000
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
	id 1khFtr-0006YP-I1; Mon, 23 Nov 2020 17:45:15 +0000
Received: by outflank-mailman (input) for mailman id 34934;
 Mon, 23 Nov 2020 17:45:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khFtl-0006JQ-NJ
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtk-0006Yo-6k; Mon, 23 Nov 2020 17:45:08 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtk-0000at-4G; Mon, 23 Nov 2020 17:45:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtl-0006JQ-NJ
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=gOoYvYBdUT6Nx0tE3SEPd8rpiDKo5xSEp4PAlyL6C2k=; b=19D3PZ71froCvMd0/cWe6upTV
	8yrsNLXtTcsFgdxmsyayoYwCnORvsSAhizZq4SVB6Sfxsh0AvG/VYvbx8apzcJ095obQNdJPsi0/Z
	4Cox3BzkjsppqniWq2t2Yvf8o1zOGzbjtB72FGjzxPmHiL3P9xNQdw6We9WkRJKW+vxRQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0006Yo-6k; Mon, 23 Nov 2020 17:45:08 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0000at-4G; Mon, 23 Nov 2020 17:45:08 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 07/23] libxl: stop using aodev->device_config in libxl__device_pci_add()...
Date: Mon, 23 Nov 2020 17:44:47 +0000
Message-Id: <20201123174503.6800-8-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

... to hold a pointer to the device.

There is already a 'pci' field in 'pci_add_state' so simply use that from
the start. This also allows the 'pci' (#3) argument to be dropped from
do_pci_add().

NOTE: This patch also changes the type of the 'pci_domid' field in
      'pci_add_state' from 'int' to 'libxl_domid' which is more appropriate
      given what the field is used for.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 41e4b2b571..77edd27345 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1074,7 +1074,7 @@ typedef struct pci_add_state {
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
     libxl_device_pci *pci;
-    int pci_domid;
+    libxl_domid pci_domid;
 } pci_add_state;
 
 static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
@@ -1091,7 +1091,6 @@ static void pci_add_dm_done(libxl__egc *,
 
 static void do_pci_add(libxl__egc *egc,
                        libxl_domid domid,
-                       libxl_device_pci *pci,
                        pci_add_state *pas)
 {
     STATE_AO_GC(pas->aodev->ao);
@@ -1101,7 +1100,6 @@ static void do_pci_add(libxl__egc *egc,
     /* init pci_add_state */
     libxl__xswait_init(&pas->xswait);
     libxl__ev_qmp_init(&pas->qmp);
-    pas->pci = pci;
     pas->pci_domid = domid;
     libxl__ev_time_init(&pas->timeout);
 
@@ -1564,13 +1562,10 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     int stubdomid = 0;
     pci_add_state *pas;
 
-    /* Store *pci to be used by callbacks */
-    aodev->device_config = pci;
-    aodev->device_type = &libxl__pci_devtype;
-
     GCNEW(pas);
     pas->aodev = aodev;
     pas->domid = domid;
+    pas->pci = pci;
     pas->starting = starting;
     pas->callback = device_pci_add_stubdom_done;
 
@@ -1624,9 +1619,10 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
         GCNEW(pci_s);
         libxl_device_pci_init(pci_s);
         libxl_device_pci_copy(CTX, pci_s, pci);
+        pas->pci = pci_s;
         pas->callback = device_pci_add_stubdom_wait;
 
-        do_pci_add(egc, stubdomid, pci_s, pas); /* must be last */
+        do_pci_add(egc, stubdomid, pas); /* must be last */
         return;
     }
 
@@ -1681,9 +1677,8 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
     int i;
 
     /* Convenience aliases */
-    libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = aodev->device_config;
+    libxl_device_pci *pci = pas->pci;
 
     if (rc) goto out;
 
@@ -1718,7 +1713,7 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
                 pci->vdevfn = orig_vdev;
             }
             pas->callback = device_pci_add_done;
-            do_pci_add(egc, domid, pci, pas); /* must be last */
+            do_pci_add(egc, domid, pas); /* must be last */
             return;
         }
     }
@@ -1734,7 +1729,7 @@ static void device_pci_add_done(libxl__egc *egc,
     EGC_GC;
     libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = aodev->device_config;
+    libxl_device_pci *pci = pas->pci;
 
     if (rc) {
         LOGD(ERROR, domid,
-- 
2.11.0


