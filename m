Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFAEC388F9
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 16:27:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE7B2192A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 16:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="jpkOw9P+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAE7B2192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11214.29837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzu2-0001nl-0v; Fri, 23 Oct 2020 16:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11214.29837; Fri, 23 Oct 2020 16:26:53 +0000
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
	id 1kVzu1-0001nX-Pw; Fri, 23 Oct 2020 16:26:53 +0000
Received: by outflank-mailman (input) for mailman id 11214;
 Fri, 23 Oct 2020 16:26:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVzu0-0000v2-Gx
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:52 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f5ada0d-630a-4352-a9a4-a759950906c0;
 Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztU-0008Nk-Tw; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqw-000376-Cy; Fri, 23 Oct 2020 16:23:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVzu0-0000v2-Gx
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:52 +0000
X-Inumbo-ID: 1f5ada0d-630a-4352-a9a4-a759950906c0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1f5ada0d-630a-4352-a9a4-a759950906c0;
	Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=xc8Rt4FNyf81W81G3gNl5AS6+YoOb+nL0S+vPdlRodM=; b=jpkOw9P+gXjavbrsUKHlCAFP8
	RWwQDAW5Af6QjdsjUWpRZ5pyHuTHZPSbO2dYpetDWaHddBykEDl06tpDFXYMM/YqYGm1IO6Pxp7Sx
	fnLTMK21Sla90Bv9zkpn2SuDmq6IccqRrzdKxidRr82l/OCUVdhXDNO4JmsgULxHCozjk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztU-0008Nk-Tw; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqw-000376-Cy; Fri, 23 Oct 2020 16:23:42 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 25/25] xl / libxl: support 'xl pci-attach/detach' by name
Date: Fri, 23 Oct 2020 16:23:14 +0000
Message-Id: <20201023162314.2235-26-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch adds a 'name' field into the idl for 'libxl_device_pci' and
libxlu_pci_parse_spec_string() is modified to parse the new 'name'
parameter of PCI_SPEC_STRING detailed in the updated documention in
xl-pci-configuration(5).

If the 'name' field is non-NULL then both libxl_device_pci_add() and
libxl_device_pci_remove() will use it to look up the device BDF in
the list of assignable devices.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h            |  6 ++++
 tools/libs/light/libxl_pci.c     | 67 +++++++++++++++++++++++++++++++++++++---
 tools/libs/light/libxl_types.idl |  1 +
 tools/libs/util/libxlu_pci.c     |  7 ++++-
 tools/xl/xl_pci.c                |  1 +
 5 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 4025d3a3d4..5b55a20155 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -485,6 +485,12 @@
 #define LIBXL_HAVE_PCI_ASSIGNABLE_NAME 1
 
 /*
+ * LIBXL_HAVE_DEVICE_PCI_NAME indicates that the 'name' field of
+ * libxl_device_pci is defined.
+ */
+#define LIBXL_HAVE_DEVICE_PCI_NAME 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 0f7d655aff..e5d54732c3 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -60,6 +60,10 @@ static void libxl_create_pci_backend_device(libxl__gc *gc,
                                             int num,
                                             const libxl_device_pci *pci)
 {
+    if (pci->name) {
+        flexarray_append(back, GCSPRINTF("name-%d", num));
+        flexarray_append(back, GCSPRINTF("%s", pci->name));
+    }
     flexarray_append(back, GCSPRINTF("key-%d", num));
     flexarray_append(back, GCSPRINTF(PCI_BDF, pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func));
     flexarray_append(back, GCSPRINTF("dev-%d", num));
@@ -252,6 +256,7 @@ retry_transaction:
 
 retry_transaction2:
     t = xs_transaction_start(ctx->xsh);
+    xs_rm(ctx->xsh, t, GCSPRINTF("%s/name-%d", be_path, i));
     xs_rm(ctx->xsh, t, GCSPRINTF("%s/state-%d", be_path, i));
     xs_rm(ctx->xsh, t, GCSPRINTF("%s/key-%d", be_path, i));
     xs_rm(ctx->xsh, t, GCSPRINTF("%s/dev-%d", be_path, i));
@@ -290,6 +295,12 @@ retry_transaction2:
             xs_write(ctx->xsh, t, GCSPRINTF("%s/vdevfn-%d", be_path, j - 1), tmp, strlen(tmp));
             xs_rm(ctx->xsh, t, tmppath);
         }
+        tmppath = GCSPRINTF("%s/name-%d", be_path, j);
+        tmp = libxl__xs_read(gc, t, tmppath);
+        if (tmp) {
+            xs_write(ctx->xsh, t, GCSPRINTF("%s/name-%d", be_path, j - 1), tmp, strlen(tmp));
+            xs_rm(ctx->xsh, t, tmppath);
+        }
     }
     if (!xs_transaction_end(ctx->xsh, t, 0))
         if (errno == EAGAIN)
@@ -1586,6 +1597,23 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     pas->starting = starting;
     pas->callback = device_pci_add_stubdom_done;
 
+    if (pci->name) {
+        libxl_pci_bdf *pcibdf =
+            libxl_device_pci_assignable_name2bdf(CTX, pci->name);
+
+        if (!pcibdf) {
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        LOGD(DETAIL, domid, "'%s' -> %04x:%02x:%02x.%u", pci->name,
+             pcibdf->domain, pcibdf->bus, pcibdf->dev, pcibdf->func);
+
+        libxl_pci_bdf_copy(CTX, &pci->bdf, pcibdf);
+        libxl_pci_bdf_dispose(pcibdf);
+        free(pcibdf);
+    }
+
     if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
         rc = xc_test_assign_device(ctx->xch, domid,
                                    pci_encode_bdf(&pci->bdf));
@@ -1734,11 +1762,19 @@ static void device_pci_add_done(libxl__egc *egc,
     libxl_device_pci *pci = &pas->pci;
 
     if (rc) {
-        LOGD(ERROR, domid,
-             "libxl__device_pci_add  failed for "
-             "PCI device %x:%x:%x.%x (rc %d)",
-             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
-             rc);
+        if (pci->name) {
+            LOGD(ERROR, domid,
+                 "libxl__device_pci_add failed for "
+                 "PCI device '%s' (rc %d)",
+                 pci->name,
+                 rc);
+        } else {
+            LOGD(ERROR, domid,
+                 "libxl__device_pci_add failed for "
+                 "PCI device %x:%x:%x.%x (rc %d)",
+                 pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
+                 rc);
+        }
         pci_info_xs_remove(gc, &pci->bdf, "domid");
     }
     libxl_device_pci_dispose(pci);
@@ -2284,6 +2320,23 @@ static void libxl__device_pci_remove_common(libxl__egc *egc,
     libxl__ev_time_init(&prs->timeout);
     libxl__ev_time_init(&prs->retry_timer);
 
+    if (pci->name) {
+        libxl_pci_bdf *pcibdf =
+            libxl_device_pci_assignable_name2bdf(CTX, pci->name);
+
+        if (!pcibdf) {
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        LOGD(DETAIL, domid, "'%s' -> %04x:%02x:%02x.%u", pci->name,
+             pcibdf->domain, pcibdf->bus, pcibdf->dev, pcibdf->func);
+
+        libxl_pci_bdf_copy(CTX, &prs->pci.bdf, pcibdf);
+        libxl_pci_bdf_dispose(pcibdf);
+        free(pcibdf);
+    }
+
     prs->orig_vdev = pci->vdevfn & ~7U;
 
     if ( pci->vfunc_mask == LIBXL_PCI_FUNC_ALL ) {
@@ -2418,6 +2471,10 @@ static int libxl__device_pci_from_xs_be(libxl__gc *gc,
         } while ((p = strtok_r(NULL, ",=", &saveptr)) != NULL);
     }
 
+    s = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/name-%d", be_path, nr));
+    if (s)
+        pci->name = strdup(s);
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 2c441142fb..44bad36f1c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -778,6 +778,7 @@ libxl_pci_bdf = Struct("pci_bdf", [
 
 libxl_device_pci = Struct("device_pci", [
     ("bdf", libxl_pci_bdf),
+    ("name", string),
     ("vdevfn", uint32),
     ("vfunc_mask", uint32),
     ("msitranslate", bool),
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index a8b6ce5427..543a1f80e9 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -151,6 +151,7 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pcidev,
 {
     const char *ptr = str;
     bool bdf_present = false;
+    bool name_present = false;
     int ret;
 
     /* Attempt to parse 'bdf' as positional parameter */
@@ -193,6 +194,10 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pcidev,
             pcidev->power_mgmt = atoi(val);
         } else if (!strcmp(key, "rdm_policy")) {
             ret = parse_rdm_policy(cfg, &pcidev->rdm_policy, val);
+        } else if (!strcmp(key, "name")) {
+            name_present = true;
+            pcidev->name = strdup(val);
+            if (!pcidev->name) ret = ERROR_NOMEM;
         } else {
             XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key);
             ret = ERROR_INVAL;
@@ -205,7 +210,7 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pcidev,
             return ret;
     }
 
-    if (!bdf_present)
+    if (!(bdf_present ^ name_present))
         return ERROR_INVAL;
 
     return 0;
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index f1b58b3976..1f89fed6db 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -71,6 +71,7 @@ static int pcidetach(uint32_t domid, const char *spec_string, int force)
                 spec_string);
         exit(2);
     }
+
     if (force) {
         if (libxl_device_pci_destroy(ctx, domid, &pci, 0))
             r = 1;
-- 
2.11.0


