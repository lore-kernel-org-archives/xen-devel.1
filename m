Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB84EC4363A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 16:23:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EB22192A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 16:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="v3MNx6rA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35EB22192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11166.29657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzqx-0008WM-R6; Fri, 23 Oct 2020 16:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11166.29657; Fri, 23 Oct 2020 16:23:43 +0000
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
	id 1kVzqx-0008WB-M7; Fri, 23 Oct 2020 16:23:43 +0000
Received: by outflank-mailman (input) for mailman id 11166;
 Fri, 23 Oct 2020 16:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVzqw-00081e-Ci
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:42 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67bb7164-12ad-405d-bbf8-688efe3dd4bd;
 Fri, 23 Oct 2020 16:23:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqg-0008Jg-Q9; Fri, 23 Oct 2020 16:23:26 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqg-000376-In; Fri, 23 Oct 2020 16:23:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVzqw-00081e-Ci
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:42 +0000
X-Inumbo-ID: 67bb7164-12ad-405d-bbf8-688efe3dd4bd
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 67bb7164-12ad-405d-bbf8-688efe3dd4bd;
	Fri, 23 Oct 2020 16:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=QJzbQ3Np4pSqJz9X+hJwu3xWTD3Y5IwSiZezmKwHDvM=; b=v3MNx6rAv6sCfXHLzOAXuI4BS
	jVqc+IqLPnZDvdlkmuUlIOFVQu5CSYKu2H0CqZ4m45XCv9FdsAv92CSoCMjz4zu5b92AzZIxMK6ZU
	LsFNkG9q+u1nM1sTsyoec5xoYz885bfhcz265Mr3Np7oaEeZY+DX/ny5g55DyuYGsLKxs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqg-0008Jg-Q9; Fri, 23 Oct 2020 16:23:26 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqg-000376-In; Fri, 23 Oct 2020 16:23:26 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 08/25] libxl: generalise 'driver_path' xenstore access functions in libxl_pci.c
Date: Fri, 23 Oct 2020 16:22:57 +0000
Message-Id: <20201023162314.2235-9-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

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
index b8d8cc6a69..f74203100d 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -718,48 +718,46 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
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
@@ -805,9 +803,9 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
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
@@ -815,7 +813,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
                 dom, bus, dev, func);
         }
     } else {
-        pci_assignable_driver_path_remove(gc, pci);
+        pci_info_xs_remove(gc, pci, "driver_path");
     }
 
     if ( pciback_dev_assign(gc, pci) ) {
@@ -865,7 +863,7 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     }
 
     /* Rebind if necessary */
-    driver_path = pci_assignable_driver_path_read(gc, pci);
+    driver_path = pci_info_xs_read(gc, pci, "driver_path");
 
     if ( driver_path ) {
         if ( rebind ) {
@@ -878,7 +876,7 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
                 return -1;
             }
 
-            pci_assignable_driver_path_remove(gc, pci);
+            pci_info_xs_remove(gc, pci, "driver_path");
         }
     } else {
         if ( rebind ) {
-- 
2.11.0


