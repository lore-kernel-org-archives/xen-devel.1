Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5A4C6379F
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 17:45:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D253A20756
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 17:45:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="alnstYDp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D253A20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34933.66287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFtr-0006WF-3H; Mon, 23 Nov 2020 17:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34933.66287; Mon, 23 Nov 2020 17:45:14 +0000
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
	id 1khFtq-0006VA-Dy; Mon, 23 Nov 2020 17:45:14 +0000
Received: by outflank-mailman (input) for mailman id 34933;
 Mon, 23 Nov 2020 17:45:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khFtl-0006JB-5T
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtk-0006Yv-Ds; Mon, 23 Nov 2020 17:45:08 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtk-0000at-Ae; Mon, 23 Nov 2020 17:45:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtl-0006JB-5T
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=EIPA9+ZEASvzq7mL3kgJN1+orOrgFwgTrTG56YTc2Qo=; b=alnstYDprqGWpWE7pKIzZXfj0
	a+q0hUmEGTc6ymdmazlluf9If1BM60o3YI55GRS9S/jUjRaVEAeTl3+ReQSuoen80B7tpnlyAly7x
	ti71fu4o1xYo75OmjEV14tZ3OywhdCUSKqL1Mw9jazkJRjiLPxiNqGub/uZXL53A+n+Vc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0006Yv-Ds; Mon, 23 Nov 2020 17:45:08 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0000at-Ae; Mon, 23 Nov 2020 17:45:08 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 08/23] libxl: generalise 'driver_path' xenstore access functions in libxl_pci.c
Date: Mon, 23 Nov 2020 17:44:48 +0000
Message-Id: <20201123174503.6800-9-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

For the purposes of re-binding a device to its previous driver
libxl__device_pci_assignable_add() writes the driver path into xenstore.
This path is then read back in libxl__device_pci_assignable_remove().

The functions that support this writing to and reading from xenstore are
currently dedicated for this purpose and hence the node name 'driver_path'
is hard-coded. This patch generalizes these utility functions and passes
'driver_path' as an argument. Subsequent patches will invoke them to
access other nodes.

NOTE: Because functions will have a broader use (other than storing a
      driver path in lieu of pciback) the base xenstore path is also
      changed from '/libxl/pciback' to '/libxl/pci'.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 66 +++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 77edd27345..a5d5d2e78b 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -737,48 +737,46 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
     return 0;
 }
 
-#define PCIBACK_INFO_PATH "/libxl/pciback"
+#define PCI_INFO_PATH "/libxl/pci"
 
-static void pci_assignable_driver_path_write(libxl__gc *gc,
-                                            libxl_device_pci *pci,
-                                            char *driver_path)
+static char *pci_info_xs_path(libxl__gc *gc, libxl_device_pci *pci,
+                              const char *node)
 {
-    char *path;
+    return node ?
+        GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH"/%s",
+                  pci->domain, pci->bus, pci->dev, pci->func,
+                  node) :
+        GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH,
+                  pci->domain, pci->bus, pci->dev, pci->func);
+}
+
+
+static void pci_info_xs_write(libxl__gc *gc, libxl_device_pci *pci,
+                              const char *node, const char *val)
+{
+    char *path = pci_info_xs_path(gc, pci, node);
 
-    path = GCSPRINTF(PCIBACK_INFO_PATH"/"PCI_BDF_XSPATH"/driver_path",
-                     pci->domain,
-                     pci->bus,
-                     pci->dev,
-                     pci->func);
-    if ( libxl__xs_printf(gc, XBT_NULL, path, "%s", driver_path) < 0 ) {
-        LOGE(WARN, "Write of %s to node %s failed.", driver_path, path);
+    if ( libxl__xs_printf(gc, XBT_NULL, path, "%s", val) < 0 ) {
+        LOGE(WARN, "Write of %s to node %s failed.", val, path);
     }
 }
 
-static char * pci_assignable_driver_path_read(libxl__gc *gc,
-                                              libxl_device_pci *pci)
+static char *pci_info_xs_read(libxl__gc *gc, libxl_device_pci *pci,
+                              const char *node)
 {
-    return libxl__xs_read(gc, XBT_NULL,
-                          GCSPRINTF(
-                           PCIBACK_INFO_PATH "/" PCI_BDF_XSPATH "/driver_path",
-                           pci->domain,
-                           pci->bus,
-                           pci->dev,
-                           pci->func));
+    char *path = pci_info_xs_path(gc, pci, node);
+
+    return libxl__xs_read(gc, XBT_NULL, path);
 }
 
-static void pci_assignable_driver_path_remove(libxl__gc *gc,
-                                              libxl_device_pci *pci)
+static void pci_info_xs_remove(libxl__gc *gc, libxl_device_pci *pci,
+                               const char *node)
 {
+    char *path = pci_info_xs_path(gc, pci, node);
     libxl_ctx *ctx = libxl__gc_owner(gc);
 
     /* Remove the xenstore entry */
-    xs_rm(ctx->xsh, XBT_NULL,
-          GCSPRINTF(PCIBACK_INFO_PATH "/" PCI_BDF_XSPATH,
-                    pci->domain,
-                    pci->bus,
-                    pci->dev,
-                    pci->func) );
+    xs_rm(ctx->xsh, XBT_NULL, path);
 }
 
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
@@ -824,9 +822,9 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     /* Store driver_path for rebinding to dom0 */
     if ( rebind ) {
         if ( driver_path ) {
-            pci_assignable_driver_path_write(gc, pci, driver_path);
+            pci_info_xs_write(gc, pci, "driver_path", driver_path);
         } else if ( (driver_path =
-                     pci_assignable_driver_path_read(gc, pci)) != NULL ) {
+                     pci_info_xs_read(gc, pci, "driver_path")) != NULL ) {
             LOG(INFO, PCI_BDF" not bound to a driver, will be rebound to %s",
                 dom, bus, dev, func, driver_path);
         } else {
@@ -834,7 +832,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
                 dom, bus, dev, func);
         }
     } else {
-        pci_assignable_driver_path_remove(gc, pci);
+        pci_info_xs_remove(gc, pci, "driver_path");
     }
 
     if ( pciback_dev_assign(gc, pci) ) {
@@ -884,7 +882,7 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     }
 
     /* Rebind if necessary */
-    driver_path = pci_assignable_driver_path_read(gc, pci);
+    driver_path = pci_info_xs_read(gc, pci, "driver_path");
 
     if ( driver_path ) {
         if ( rebind ) {
@@ -897,7 +895,7 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
                 return -1;
             }
 
-            pci_assignable_driver_path_remove(gc, pci);
+            pci_info_xs_remove(gc, pci, "driver_path");
         }
     } else {
         if ( rebind ) {
-- 
2.11.0


