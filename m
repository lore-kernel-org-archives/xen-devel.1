Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC767C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417053.1645996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52N4-0004ZY-Ty; Fri, 11 Sep 2026 14:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417053.1645996; Fri, 11 Sep 2026 14:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52N4-0004Yk-Md; Fri, 11 Sep 2026 14:36:54 +0000
Received: by outflank-mailman (input) for mailman id 1417053;
 Fri, 11 Sep 2026 14:36:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52N3-0004Qa-67
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:36:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52N2-008jZK-JN
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:36:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41202-2eae-0a2a0a5409dd-0a2a4501e918-6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:52 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41203-5984-0a2a45010019-aa0a817cddaf-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:52 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-501-5ZpW9R8YOlqZCbyG5RZybg-1; Fri,
 11 Sep 2026 10:36:47 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5D34A18011D5; Fri, 11 Sep 2026 14:36:46 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 66E99300022B; Fri, 11 Sep 2026 14:36:44 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789137411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hYxcms/b3tvYKg41L3PAN6QuGuhC66PDVuW5tlA0LrY=;
	b=i4YeUp0q5xRIqjlPq4ucmZ+2Oeb/wJAMLNkhXY6YzLxGD0HX4gxX0d5F/eHfzOSLtCKPwW
	P2S3ujqE1yFaxTmv03SPDuPuTEdZwSAc4ps0OUarKI7gi8qXo6POoYfLe+c3Cz2Taqlu6g
	e/MzJBuDBL4fV/DtEYEqjA3ZamUFSAM=
X-MC-Unique: 5ZpW9R8YOlqZCbyG5RZybg-1
X-Mimecast-MFC-AGG-ID: 5ZpW9R8YOlqZCbyG5RZybg_1789137406
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 07/28] hw/vfio: mark all VFIO object classes as secure
Date: Fri, 11 Sep 2026 15:36:06 +0100
Message-ID: <20260911143627.2743803-8-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: r-QmuhgoO5_1D3e3N2gdtHVobpmIRnaWkLBuxga1At4_1789137406
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1789137412-BE07B757-A0B63C73/0/0
X-purgate-type: clean
X-purgate-size: 4497

The VFIO subsystem is about securely passing host PCI devices
to a guest, so all the classes should be presumed to be offering
a security boundary.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/vfio-user/pci.c  | 1 +
 hw/vfio/ap.c        | 1 +
 hw/vfio/ccw.c       | 1 +
 hw/vfio/container.c | 1 +
 hw/vfio/igd.c       | 1 +
 hw/vfio/iommufd.c   | 2 ++
 hw/vfio/pci.c       | 3 +++
 hw/vfio/spapr.c     | 1 +
 8 files changed, 11 insertions(+)

diff --git a/hw/vfio-user/pci.c b/hw/vfio-user/pci.c
index e7573d4a9f..ae26160f72 100644
--- a/hw/vfio-user/pci.c
+++ b/hw/vfio-user/pci.c
@@ -482,6 +482,7 @@ static const TypeInfo vfio_user_pci_info = {
     .class_init = vfio_user_pci_class_init,
     .instance_init = vfio_user_pci_init,
     .instance_finalize = vfio_user_pci_finalize,
+    .secure = true,
 };
 
 static void register_vfio_user_dev_type(void)
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index 6e2a1223ea..4b9d522f7b 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -352,6 +352,7 @@ static const TypeInfo vfio_ap_info = {
     .instance_size = sizeof(VFIOAPDevice),
     .instance_init = vfio_ap_instance_init,
     .class_init = vfio_ap_class_init,
+    .secure = true,
 };
 
 static void vfio_ap_type_init(void)
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index c3dc7c1962..7a241aa02a 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -721,6 +721,7 @@ static const TypeInfo vfio_ccw_info = {
     .instance_size = sizeof(VFIOCCWDevice),
     .instance_init = vfio_ccw_instance_init,
     .class_init = vfio_ccw_class_init,
+    .secure = true,
 };
 
 static void register_vfio_ccw_type(void)
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index d09a663732..d4f20c6c81 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -336,6 +336,7 @@ static const TypeInfo types[] = {
         .instance_size = sizeof(VFIOContainer),
         .class_size = sizeof(VFIOIOMMUClass),
         .abstract = true,
+        .secure = true,
     },
 };
 
diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
index 413a49aae9..e9cef355f9 100644
--- a/hw/vfio/igd.c
+++ b/hw/vfio/igd.c
@@ -311,6 +311,7 @@ static const TypeInfo vfio_pci_igd_lpc_bridge_info = {
     .name = "vfio-pci-igd-lpc-bridge",
     .parent = TYPE_PCI_DEVICE,
     .class_init = vfio_pci_igd_lpc_bridge_class_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index 242644aa00..64e588fe51 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -1051,10 +1051,12 @@ static const TypeInfo types[] = {
         .parent = TYPE_VFIO_IOMMU,
         .instance_size = sizeof(VFIOIOMMUFDContainer),
         .class_init = vfio_iommu_iommufd_class_init,
+        .secure = true,
     }, {
         .name = TYPE_HOST_IOMMU_DEVICE_IOMMUFD_VFIO,
         .parent = TYPE_HOST_IOMMU_DEVICE_IOMMUFD,
         .class_init = hiod_iommufd_vfio_class_init,
+        .secure = true,
     }
 };
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 428ab2f069..b38877a1a8 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3854,6 +3854,7 @@ static const TypeInfo vfio_pci_device_info = {
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VFIOPCIDevice),
     .abstract = true,
+    .secure = true,
     .class_init = vfio_pci_device_class_init,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
@@ -4110,6 +4111,7 @@ static const TypeInfo vfio_pci_info = {
     .class_init = vfio_pci_class_init,
     .instance_init = vfio_pci_init,
     .instance_finalize = vfio_pci_finalize,
+    .secure = true,
 };
 
 static const Property vfio_pci_nohotplug_properties[] = {
@@ -4146,6 +4148,7 @@ static const TypeInfo vfio_pci_nohotplug_info = {
     .parent = TYPE_VFIO_PCI,
     .instance_size = sizeof(VFIOPCIDevice),
     .class_init = vfio_pci_nohotplug_class_init,
+    .secure = true,
 };
 
 static void register_vfio_pci_dev_type(void)
diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
index 42690e4323..1027c434c0 100644
--- a/hw/vfio/spapr.c
+++ b/hw/vfio/spapr.c
@@ -544,6 +544,7 @@ static const TypeInfo types[] = {
         .parent = TYPE_VFIO_IOMMU_LEGACY,
         .instance_size = sizeof(VFIOSpaprContainer),
         .class_init = vfio_iommu_spapr_class_init,
+        .secure = true,
     },
 };
 
-- 
2.55.0


