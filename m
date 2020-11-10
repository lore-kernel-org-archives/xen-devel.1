Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCE3C55ABD
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 18:01:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7DB920797
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 18:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="bACpfY/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7DB920797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23658.50631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXx5-0005n1-W7; Tue, 10 Nov 2020 18:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23658.50631; Tue, 10 Nov 2020 18:01:07 +0000
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
	id 1kcXx5-0005mn-Ql; Tue, 10 Nov 2020 18:01:07 +0000
Received: by outflank-mailman (input) for mailman id 23658;
 Tue, 10 Nov 2020 18:01:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXx3-00059T-If
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:01:05 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 847e99e8-5812-424b-891d-c75b46627675;
 Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXwh-0006r6-Nf; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoJ-0007RC-Df; Tue, 10 Nov 2020 17:52:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXx3-00059T-If
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:01:05 +0000
X-Inumbo-ID: 847e99e8-5812-424b-891d-c75b46627675
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 847e99e8-5812-424b-891d-c75b46627675;
	Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=aZN6k9Rot7P+r2V0A51Rm8r3Sa0jlfLO7FycFTaQjfw=; b=bACpfY/tsdE8HZM4KVctTnyLDU
	vVkhYHDa10mzhXlA/tSMzMEMz27X2U9WuusJVKu7ZjIlM3/HXJ1wm5RDpC4lDmOXCGfboRwCb7BTO
	Q4wdIqq/G8sdFVOV0iVL9sq+GxH3j1U59ej5/hD6hKRSpPVcZTXGibYB7grIcVwKNA9c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXwh-0006r6-Nf; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoJ-0007RC-Df; Tue, 10 Nov 2020 17:52:03 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 14/24] libxl: Make sure devices added by pci-attach are reflected in the config
Date: Tue, 10 Nov 2020 17:51:37 +0000
Message-Id: <20201110175147.7067-15-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Currently libxl__device_pci_add_xenstore() is broken in that does not
update the domain's configuration for the first device added (which causes
creation of the overall backend area in xenstore). This can be easily observed
by running 'xl list -l' after adding a single device: the device will be
missing.

This patch fixes the problem and adds a DEBUG log line to allow easy
verification that the domain configuration is being modified.

NOTE: This patch includes a whitespace in add_pcis_done().

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>

v2:
 - Avoid having two completely different ways of adding devices into xenstore
---
 tools/libs/light/libxl_pci.c | 71 +++++++++++-------------------------
 1 file changed, 21 insertions(+), 50 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 06fdc50ce10c..29a450f7e649 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -79,39 +79,18 @@ static void libxl__device_from_pci(libxl__gc *gc, uint32_t domid,
     device->kind = LIBXL__DEVICE_KIND_PCI;
 }
 
-static int libxl__create_pci_backend(libxl__gc *gc, uint32_t domid,
-                                     const libxl_device_pci *pci,
-                                     int num)
+static void libxl__create_pci_backend(libxl__gc *gc, uint32_t domid,
+                                      flexarray_t *front, flexarray_t *back)
 {
-    flexarray_t *front = NULL;
-    flexarray_t *back = NULL;
-    libxl__device device;
-    int i;
-
-    front = flexarray_make(gc, 16, 1);
-    back = flexarray_make(gc, 16, 1);
-
     LOGD(DEBUG, domid, "Creating pci backend");
 
-    /* add pci device */
-    libxl__device_from_pci(gc, domid, pci, &device);
-
     flexarray_append_pair(back, "frontend-id", GCSPRINTF("%d", domid));
-    flexarray_append_pair(back, "online", "1");
+    flexarray_append_pair(back, "online", GCSPRINTF("%d", 1));
     flexarray_append_pair(back, "state", GCSPRINTF("%d", XenbusStateInitialising));
     flexarray_append_pair(back, "domain", libxl__domid_to_name(gc, domid));
 
-    for (i = 0; i < num; i++, pci++)
-        libxl_create_pci_backend_device(gc, back, i, pci);
-
-    flexarray_append_pair(back, "num_devs", GCSPRINTF("%d", num));
     flexarray_append_pair(front, "backend-id", GCSPRINTF("%d", 0));
     flexarray_append_pair(front, "state", GCSPRINTF("%d", XenbusStateInitialising));
-
-    return libxl__device_generic_add(gc, XBT_NULL, &device,
-                                     libxl__xs_kvs_of_flexarray(gc, back),
-                                     libxl__xs_kvs_of_flexarray(gc, front),
-                                     NULL);
 }
 
 static int libxl__device_pci_add_xenstore(libxl__gc *gc,
@@ -119,7 +98,7 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
                                           const libxl_device_pci *pci,
                                           bool starting)
 {
-    flexarray_t *back;
+    flexarray_t *front, *back;
     char *num_devs, *be_path;
     int num = 0;
     xs_transaction_t t = XBT_NULL;
@@ -127,16 +106,22 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
     libxl_domain_config d_config;
     libxl__flock *lock = NULL;
     bool is_stubdomain = libxl_is_stubdom(CTX, domid, NULL);
+    libxl__device device;
+
+    libxl__device_from_pci(gc, domid, pci, &device);
 
     /* Stubdomain doesn't have own config. */
     if (!is_stubdomain)
         libxl_domain_config_init(&d_config);
 
+    front = flexarray_make(gc, 16, 1);
+    back = flexarray_make(gc, 16, 1);
+
     be_path = libxl__domain_device_backend_path(gc, 0, domid, 0,
                                                 LIBXL__DEVICE_KIND_PCI);
     num_devs = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/num_devs", be_path));
     if (!num_devs)
-        return libxl__create_pci_backend(gc, domid, pci, 1);
+        libxl__create_pci_backend(gc, domid, front, back);
 
     libxl_domain_type domtype = libxl__domain_type(gc, domid);
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
@@ -147,20 +132,18 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
             return ERROR_FAIL;
     }
 
-    back = flexarray_make(gc, 16, 1);
-
     LOGD(DEBUG, domid, "Adding new pci device to xenstore");
-    num = atoi(num_devs);
+    num = num_devs ? atoi(num_devs) : 0;
     libxl_create_pci_backend_device(gc, back, num, pci);
     flexarray_append_pair(back, "num_devs", GCSPRINTF("%d", num + 1));
-    if (!starting)
+    if (num && !starting)
         flexarray_append_pair(back, "state", GCSPRINTF("%d", XenbusStateReconfiguring));
 
     /*
      * Stubdomin config is derived from its target domain, it doesn't have
      * its own file.
      */
-    if (!is_stubdomain) {
+    if (!is_stubdomain && !starting) {
         lock = libxl__lock_domain_userdata(gc, domid);
         if (!lock) {
             rc = ERROR_LOCK_FAIL;
@@ -170,6 +153,7 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
         rc = libxl__get_domain_configuration(gc, domid, &d_config);
         if (rc) goto out;
 
+        LOGD(DEBUG, domid, "Adding new pci device to config");
         device_add_domain_config(gc, &d_config, &libxl__pci_devtype,
                                  pci);
 
@@ -186,7 +170,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
             if (rc) goto out;
         }
 
-        libxl__xs_writev(gc, t, be_path, libxl__xs_kvs_of_flexarray(gc, back));
+        libxl__device_generic_add(gc, t, &device,
+                                  libxl__xs_kvs_of_flexarray(gc, back),
+                                  libxl__xs_kvs_of_flexarray(gc, front),
+                                  NULL);
 
         rc = libxl__xs_transaction_commit(gc, &t);
         if (!rc) break;
@@ -1390,7 +1377,7 @@ out_no_irq:
         }
     }
 
-    if (!starting && !libxl_get_stubdom_id(CTX, domid))
+    if (!libxl_get_stubdom_id(CTX, domid))
         rc = libxl__device_pci_add_xenstore(gc, domid, pci, starting);
     else
         rc = 0;
@@ -1699,28 +1686,12 @@ static void libxl__add_pcis(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
 }
 
 static void add_pcis_done(libxl__egc *egc, libxl__multidev *multidev,
-                             int rc)
+                          int rc)
 {
     EGC_GC;
     add_pcis_state *apds = CONTAINER_OF(multidev, *apds, multidev);
-
-    /* Convenience aliases */
-    libxl_domain_config *d_config = apds->d_config;
-    libxl_domid domid = apds->domid;
     libxl__ao_device *aodev = apds->outer_aodev;
 
-    if (rc) goto out;
-
-    if (d_config->num_pcis > 0 && !libxl_get_stubdom_id(CTX, domid)) {
-        rc = libxl__create_pci_backend(gc, domid, d_config->pcis,
-                                       d_config->num_pcis);
-        if (rc < 0) {
-            LOGD(ERROR, domid, "libxl_create_pci_backend failed: %d", rc);
-            goto out;
-        }
-    }
-
-out:
     aodev->rc = rc;
     aodev->callback(egc, aodev);
 }
-- 
2.20.1


