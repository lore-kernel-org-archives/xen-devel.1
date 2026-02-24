Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EC6F55429
	for <xen-devel@archiver.kernel.org>; Tue, 24 Feb 2026 23:12:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1240322.1541754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv1aF-0001Jr-B5; Tue, 24 Feb 2026 23:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240322.1541754; Tue, 24 Feb 2026 23:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv1aF-0001Jk-85; Tue, 24 Feb 2026 23:12:51 +0000
Received: by outflank-mailman (input) for mailman id 1240322;
 Tue, 24 Feb 2026 23:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TZAD=A4=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1vv1aE-0001JI-3m
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 23:12:50 +0000
Received: from hermes.ariadne.space (hermes.ariadne.space
 [2001:19f0:8001:704:5400:5ff:fe8c:fac5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51f353ab-11d6-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 00:12:44 +0100 (CET)
Received: from helios (unknown [100.74.42.12])
 by hermes.ariadne.space (Postfix) with ESMTP id 41A442685B4;
 Tue, 24 Feb 2026 23:12:41 +0000 (UTC)
Received: from phoebe.taild41b8.ts.net (unknown [172.19.0.1])
 by helios (Postfix) with ESMTPSA id 3D4F116000D707;
 Tue, 24 Feb 2026 23:12:41 +0000 (UTC)
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
X-Inumbo-ID: 51f353ab-11d6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=dkim; t=1771974761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=skLgyrDg/ANIiJAiIyTNJyl/Z6YLJFfAYHOFK7Inel8=;
	b=rLGo077WQtI4v1gc+7PK0iUE0xR4SoMmr59njr6IUbZK5srVtJAdGgB6qsY8DnJOUV9UBk
	uxvNuf1KUEoeF3wVWfOtYKxX/FVQwHJ059vHUA5ufQvCIwD30EC3+Wju9SJIaJhy8pRs1E
	LNna8VSvPp/WS0XaeRBhzswhNuNTNSQ=
From: Ariadne Conill <ariadne@ariadne.space>
To: xen-devel@lists.xenproject.org
Cc: Ariadne Conill <ariadne@ariadne.space>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Steven Noonan <steven@edera.dev>
Subject: [PATCH] xen/vpci: do not use pci_sanitize_bar_memory for domU
Date: Tue, 24 Feb 2026 15:12:33 -0800
Message-ID: <20260224231235.6277-1-ariadne@ariadne.space>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steven Noonan <steven@edera.dev>

This function should only be used for the hardware domain, because it
compares addresses against the host e820 map.

Signed-off-by: Steven Noonan <steven@edera.dev>
Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
---
 xen/drivers/vpci/header.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 852dfd8ae3..1f930b2a1f 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -394,13 +394,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             }
         }
 
-        rc = pci_sanitize_bar_memory(bar->mem);
-        if ( rc )
-        {
-            gprintk(XENLOG_WARNING,
-                    "%pp: failed to sanitize BAR#%u memory: %d\n",
-                    &pdev->sbdf, i, rc);
-            return rc;
+        if (is_hardware_domain(pdev->domain)) {
+            rc = pci_sanitize_bar_memory(mem);
+            if ( rc )
+            {
+                gprintk(XENLOG_WARNING,
+                        "%pp: failed to sanitize BAR#%u memory: %d\n",
+                        &pdev->sbdf, i, rc);
+                return rc;
+            }
         }
     }
 
-- 
2.53.0


