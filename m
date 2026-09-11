Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACADC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417102.1646088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NT-0000Pe-12; Fri, 11 Sep 2026 14:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417102.1646088; Fri, 11 Sep 2026 14:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NS-0000PP-Sq; Fri, 11 Sep 2026 14:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1417102;
 Fri, 11 Sep 2026 14:37:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52NR-0000BQ-Dk
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52NQ-009Xr7-QL
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:37:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41216-e002-0a2a0a5209dd-0a2a450cc2ca-18
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:16 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4121b-f479-0a2a450c0019-aa0a817cb957-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:16 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-tMRy4ymCPxWhrf_UlInavg-1; Fri,
 11 Sep 2026 10:37:10 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B572E1953964; Fri, 11 Sep 2026 14:37:08 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EABCD300022B; Fri, 11 Sep 2026 14:37:06 +0000 (UTC)
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
	s=mimecast20190719; t=1789137435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/QFXhbR7+trrsi9yjvMVLU5gLecR5pn7XwbzwTQyqg=;
	b=CiyIvP+DqEmCajiY6Bd2uF5Bh/aVhIhKt0g9bG5JXrlDQRYH9ZqphwrCN19bpdncKx+xP8
	y4wxHn7aKF83fOEMgKA0zKd9lbAr1OJhkEAMBCns0xbSb1nKQ2teVSOx6Q7h7WnWdLaTzE
	EKxU1D5nreTKb5CXV3FN6oMNuczxPu0=
X-MC-Unique: tMRy4ymCPxWhrf_UlInavg-1
X-Mimecast-MFC-AGG-ID: tMRy4ymCPxWhrf_UlInavg_1789137428
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 17/28] hw/display: mark bochs, cirrus, qxl, VGA, ramfb as secure
Date: Fri, 11 Sep 2026 15:36:16 +0100
Message-ID: <20260911143627.2743803-18-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: ZyfBBUWJgFTV9ftP-_LEPotxwmNiXpQANGviS3BzCxI_1789137428
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1789137436-50F3BA5B-5CBAF9B9/0/0
X-purgate-type: clean
X-purgate-size: 4776

Most of the display adapters are emulating old hardware which is not
relevant to virtualization use cases.

The exceptions that should be considered secure are Cirrus (PCI, not
ISA), Bochs, QXL, RAMFB, VGA (PCI, MMIO, not ISA) and VMWare VGA.

The Cirrus PCI decision is borderline. It has been heavily used with
virtualization in the past, but these days VGA / RAMFB are strongly
recommended instead. Due to its historical usage though, we should
likely retain it in the set we aim to class as secure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/display/bochs-display.c    | 1 +
 hw/display/cirrus_vga.c       | 1 +
 hw/display/qxl.c              | 3 +++
 hw/display/ramfb-standalone.c | 1 +
 hw/display/vga-mmio.c         | 1 +
 hw/display/vga-pci.c          | 3 +++
 6 files changed, 10 insertions(+)

diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 64e669429c..5f3ba80f99 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -374,6 +374,7 @@ static const TypeInfo bochs_display_type_info = {
     .instance_size  = sizeof(BochsDisplayState),
     .instance_init  = bochs_display_init,
     .class_init     = bochs_display_class_init,
+    .secure         = true,
     .interfaces     = (const InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 0a8c74e137..8232c5c468 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -3013,6 +3013,7 @@ static const TypeInfo cirrus_vga_info = {
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCICirrusVGAState),
     .class_init    = cirrus_vga_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 384b8767b8..d673663b3a 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2566,6 +2566,7 @@ static const TypeInfo qxl_pci_type_info = {
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIQXLDevice),
     .abstract = true,
+    .secure = true,
     .class_init = qxl_pci_class_init,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -2589,6 +2590,7 @@ static const TypeInfo qxl_primary_info = {
     .name          = "qxl-vga",
     .parent        = TYPE_PCI_QXL,
     .class_init    = qxl_primary_class_init,
+    .secure        = true,
 };
 module_obj("qxl-vga");
 module_kconfig(QXL);
@@ -2607,6 +2609,7 @@ static const TypeInfo qxl_secondary_info = {
     .name          = "qxl",
     .parent        = TYPE_PCI_QXL,
     .class_init    = qxl_secondary_class_init,
+    .secure        = true,
 };
 module_obj("qxl");
 
diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index 8e8ba37514..9427009acc 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -85,6 +85,7 @@ static const TypeInfo ramfb_info = {
     .parent        = TYPE_DYNAMIC_SYS_BUS_DEVICE,
     .instance_size = sizeof(RAMFBStandaloneState),
     .class_init    = ramfb_class_initfn,
+    .secure        = true,
 };
 
 static void ramfb_register_types(void)
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 3cd64951c0..65dbbed12d 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -132,6 +132,7 @@ static const TypeInfo vga_mmio_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(VGAMmioState),
     .class_init    = vga_mmio_class_initfn,
+    .secure        = true,
 };
 
 static void vga_mmio_register_types(void)
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index d089847bda..bb13eee8a2 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -367,6 +367,7 @@ static const TypeInfo vga_pci_type_info = {
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIVGAState),
     .abstract = true,
+    .secure = true,
     .class_init = vga_pci_class_init,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -407,6 +408,7 @@ static const TypeInfo vga_info = {
     .name          = "VGA",
     .parent        = TYPE_PCI_VGA,
     .class_init    = vga_class_init,
+    .secure        = true,
 };
 
 static const TypeInfo secondary_info = {
@@ -414,6 +416,7 @@ static const TypeInfo secondary_info = {
     .parent        = TYPE_PCI_VGA,
     .instance_init = pci_secondary_vga_init,
     .class_init    = secondary_class_init,
+    .secure        = true,
 };
 
 static void vga_register_types(void)
-- 
2.55.0


