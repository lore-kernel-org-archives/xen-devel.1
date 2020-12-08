Return-Path: <SRS0=Dhy5=FM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E15C433FE
	for <xen-devel@archiver.kernel.org>; Tue,  8 Dec 2020 20:01:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0D623C40
	for <xen-devel@archiver.kernel.org>; Tue,  8 Dec 2020 20:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0D623C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.47775.84686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAY-0005gw-AD; Tue, 08 Dec 2020 20:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47775.84686; Tue, 08 Dec 2020 20:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAW-0005eB-7S; Tue, 08 Dec 2020 20:01:04 +0000
Received: by outflank-mailman (input) for mailman id 47775;
 Tue, 08 Dec 2020 20:00:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAE-0004q3-Dy
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAD-00086u-Cf; Tue, 08 Dec 2020 20:00:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihI-0001p0-OB; Tue, 08 Dec 2020 19:30:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=PZJi1U8a34pSfhTO2q4+cuqPY9geRRKGfVIRW15UroI=; b=gRN6xCPXtJ2xw8uXlgs41t8/qA
	OGyie0rMQo/kmVJNkvWVylob56XwJbii0GH7t2xx1Oa1KIo8VNNU+mRxiVzbHg8cqRuWgEmLuEMpD
	yfT7rlkW1vsdFl5cdIwblPjHnesoVFUtPsK2T1dm/s+kLfqu2DgGSeaCzYCCYTh0+rBY=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v6 13/25] libxl: add libxl_device_pci_assignable_list_free()...
Date: Tue,  8 Dec 2020 19:30:21 +0000
Message-Id: <20201208193033.11306-14-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... to be used by callers of libxl_device_pci_assignable_list().

Currently there is no API for callers of libxl_device_pci_assignable_list()
to free the list. The xl function pciassignable_list() calls
libxl_device_pci_dispose() on each element of the returned list, but
libxl_pci_assignable() in libxl_pci.c does not. Neither does the implementation
of libxl_device_pci_assignable_list() call libxl_device_pci_init().

This patch adds the new API function, makes sure it is used everywhere and
also modifies libxl_device_pci_assignable_list() to initialize list
entries rather than just zeroing them.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: David Scott <dave@recoil.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_pci.c         | 14 ++++++++++++--
 tools/ocaml/libs/xl/xenlight_stubs.c |  3 +--
 tools/xl/xl_pci.c                    |  3 +--
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index bb7fc893fc13..3433c950f9aa 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -457,6 +457,12 @@
  */
 #define LIBXL_HAVE_DEVICE_PCI_LIST_FREE 1
 
+/*
+ * LIBXL_HAVE_DEVICE_PCI_ASSIGNABLE_LIST_FREE indicates that the
+ * libxl_device_pci_assignable_list_free() function is defined.
+ */
+#define LIBXL_HAVE_DEVICE_PCI_ASSIGNABLE_LIST_FREE 1
+
 /*
  * libxl ABI compatibility
  *
@@ -2369,6 +2375,7 @@ int libxl_device_events_handler(libxl_ctx *ctx,
 int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
 int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
+void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num);
 
 /* CPUID handling */
 int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str);
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index c555f3ed29c4..2a594e432855 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -457,7 +457,7 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         pcis = new;
         new = pcis + *num;
 
-        memset(new, 0, sizeof(*new));
+        libxl_device_pci_init(new);
         pci_struct_fill(new, dom, bus, dev, func, 0);
 
         if (pci_info_xs_read(gc, new, "domid")) /* already assigned */
@@ -472,6 +472,16 @@ out:
     return pcis;
 }
 
+void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
+{
+    int i;
+
+    for (i = 0; i < num; i++)
+        libxl_device_pci_dispose(&list[i]);
+
+    free(list);
+}
+
 /* Unbind device from its current driver, if any.  If driver_path is non-NULL,
  * store the path to the original driver in it. */
 static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
@@ -1490,7 +1500,7 @@ static int libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
             pcis[i].func == pci->func)
             break;
     }
-    free(pcis);
+    libxl_device_pci_assignable_list_free(pcis, num);
     return i != num;
 }
 
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 1181971da4e7..352a00134d70 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -894,9 +894,8 @@ value stub_xl_device_pci_assignable_list(value ctx)
 		Field(list, 1) = temp;
 		temp = list;
 		Store_field(list, 0, Val_device_pci(&c_list[i]));
-		libxl_device_pci_dispose(&c_list[i]);
 	}
-	free(c_list);
+	libxl_device_pci_assignable_list_free(c_list, nb);
 
 	CAMLreturn(list);
 }
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index 7c0f102ac7b7..f71498cbb570 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -164,9 +164,8 @@ static void pciassignable_list(void)
     for (i = 0; i < num; i++) {
         printf("%04x:%02x:%02x.%01x\n",
                pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
-        libxl_device_pci_dispose(&pcis[i]);
     }
-    free(pcis);
+    libxl_device_pci_assignable_list_free(pcis, num);
 }
 
 int main_pciassignable_list(int argc, char **argv)
-- 
2.20.1


