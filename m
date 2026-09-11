Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94976C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417090.1646074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NO-0007vG-TK; Fri, 11 Sep 2026 14:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417090.1646074; Fri, 11 Sep 2026 14:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NO-0007tk-HR; Fri, 11 Sep 2026 14:37:14 +0000
Received: by outflank-mailman (input) for mailman id 1417090;
 Fri, 11 Sep 2026 14:37:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52NN-0007jz-8J
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:37:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52NM-002Y6Q-LD
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:37:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41200-8faa-0a2a0a5109dd-0a2a450b810e-22
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:12 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41217-b7e8-0a2a450b0019-aa0a857cadbd-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:12 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-0bhJcL1lO_-yIUmxVdMGXg-1; Fri,
 11 Sep 2026 10:37:05 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6B5F1180074A; Fri, 11 Sep 2026 14:37:04 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 92C633000229; Fri, 11 Sep 2026 14:37:02 +0000 (UTC)
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
	s=mimecast20190719; t=1789137431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CeroplWVCuzcovqwMRjGvrfeMx7FqmzTXbbtHaWN5tE=;
	b=be/fpOjGx4Fe4wVeQSa7akSTnRJCzw6CJMuFqT4/ZVxWPLgso+GqhAa420VtpAz9DXN2N9
	J9jxtfhza6AmHkxz+eKAr4WH/76YU+AjS85ynOknvBWe2KL/GhREhk1IW9hpjmD52ITqqt
	rjxyjj2r0cbkMob5OQd+dn+k3Y/Uddg=
X-MC-Unique: 0bhJcL1lO_-yIUmxVdMGXg-1
X-Mimecast-MFC-AGG-ID: 0bhJcL1lO_-yIUmxVdMGXg_1789137424
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 15/28] hw: define most common PCI types as secure
Date: Fri, 11 Sep 2026 15:36:14 +0100
Message-ID: <20260911143627.2743803-16-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: FDSG_Uz8yp_lk_qzqt7n_6M81EZU2T6Uf40kiBq36PM_1789137424
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789137432-A8CCF9EA-71321C78/0/0
X-purgate-type: clean
X-purgate-size: 11444

Essentially all PCI infrastructure is in scope for the virtualization
use case, aside from the niche simba bridge.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/pci-bridge/gen_pcie_root_port.c  | 1 +
 hw/pci-bridge/i82801b11.c           | 1 +
 hw/pci-bridge/ioh3420.c             | 1 +
 hw/pci-bridge/pci_bridge_dev.c      | 2 ++
 hw/pci-bridge/pci_expander_bridge.c | 8 ++++++++
 hw/pci-bridge/pcie_pci_bridge.c     | 1 +
 hw/pci-bridge/pcie_root_port.c      | 1 +
 hw/pci-bridge/xio3130_downstream.c  | 1 +
 hw/pci-bridge/xio3130_upstream.c    | 1 +
 hw/pci/pci.c                        | 7 +++++++
 hw/pci/pci_bridge.c                 | 1 +
 hw/pci/pci_host.c                   | 1 +
 hw/pci/pcie_host.c                  | 1 +
 hw/pci/pcie_port.c                  | 1 +
 14 files changed, 28 insertions(+)

diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index 5434d693d9..65d29eab38 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -161,6 +161,7 @@ static const TypeInfo gen_rp_dev_info = {
     .parent        = TYPE_PCIE_ROOT_PORT,
     .instance_size = sizeof(GenPCIERootPort),
     .class_init    = gen_rp_dev_class_init,
+    .secure        = true,
 };
 
  static void gen_rp_register_types(void)
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index 1d73c14c1f..f702b20bcd 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -107,6 +107,7 @@ static const TypeInfo i82801b11_bridge_info = {
     .parent        = TYPE_PCI_BRIDGE,
     .instance_size = sizeof(I82801b11Bridge),
     .class_init    = i82801b11_bridge_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/pci-bridge/ioh3420.c b/hw/pci-bridge/ioh3420.c
index bba640f495..2c4882c4cf 100644
--- a/hw/pci-bridge/ioh3420.c
+++ b/hw/pci-bridge/ioh3420.c
@@ -120,6 +120,7 @@ static const TypeInfo ioh3420_info = {
     .name          = "ioh3420",
     .parent        = TYPE_PCIE_ROOT_PORT,
     .class_init    = ioh3420_class_init,
+    .secure        = true,
 };
 
 static void ioh3420_register_types(void)
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 0c1383562d..319e6f199a 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -268,6 +268,7 @@ static const TypeInfo pci_bridge_dev_info = {
     .instance_size     = sizeof(PCIBridgeDev),
     .class_init        = pci_bridge_dev_class_init,
     .instance_finalize = pci_bridge_dev_instance_finalize,
+    .secure            = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -294,6 +295,7 @@ static const TypeInfo pci_bridge_dev_seat_info = {
     .parent            = TYPE_PCI_BRIDGE_DEV,
     .instance_size     = sizeof(PCIBridgeDev),
     .class_init        = pci_bridge_dev_seat_class_init,
+    .secure            = true,
 };
 
 static void pci_bridge_dev_register(void)
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 40ffbc4e08..bd5598b639 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -114,6 +114,7 @@ static const TypeInfo pxb_bus_info = {
     .parent        = TYPE_PCI_BUS,
     .instance_size = sizeof(PXBBus),
     .class_init    = pxb_bus_class_init,
+    .secure        = true,
 };
 
 static const TypeInfo pxb_pcie_bus_info = {
@@ -121,6 +122,7 @@ static const TypeInfo pxb_pcie_bus_info = {
     .parent        = TYPE_PCIE_BUS,
     .instance_size = sizeof(PXBBus),
     .class_init    = pxb_bus_class_init,
+    .secure        = true,
 };
 
 static const TypeInfo pxb_cxl_bus_info = {
@@ -128,6 +130,7 @@ static const TypeInfo pxb_cxl_bus_info = {
     .parent        = TYPE_CXL_BUS,
     .instance_size = sizeof(PXBBus),
     .class_init    = pxb_bus_class_init,
+    .secure        = true,
 };
 
 static const char *pxb_host_root_bus_path(PCIHostState *host_bridge,
@@ -190,6 +193,7 @@ static const TypeInfo pxb_host_info = {
     .name          = TYPE_PXB_HOST,
     .parent        = TYPE_PCI_HOST_BRIDGE,
     .class_init    = pxb_host_class_init,
+    .secure        = true,
 };
 
 static void pxb_cxl_realize(DeviceState *dev, Error **errp)
@@ -249,6 +253,7 @@ static const TypeInfo cxl_host_info = {
     .parent        = TYPE_PCI_HOST_BRIDGE,
     .instance_size = sizeof(CXLHost),
     .class_init    = pxb_cxl_host_class_init,
+    .secure        = true,
 };
 
 /*
@@ -453,6 +458,7 @@ static const TypeInfo pxb_dev_info = {
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PXBDev),
     .class_init    = pxb_dev_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
@@ -490,6 +496,7 @@ static const TypeInfo pxb_pcie_dev_info = {
     .parent        = TYPE_PXB_DEV,
     .instance_size = sizeof(PXBPCIEDev),
     .class_init    = pxb_pcie_dev_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
@@ -540,6 +547,7 @@ static const TypeInfo pxb_cxl_dev_info = {
     .parent        = TYPE_PXB_PCIE_DEV,
     .instance_size = sizeof(PXBCXLDev),
     .class_init    = pxb_cxl_dev_class_init,
+    .secure        = true,
     .interfaces =
         (const InterfaceInfo[]){
             { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index e826fb2829..03b6b1c0f5 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -162,6 +162,7 @@ static const TypeInfo pcie_pci_bridge_info = {
         .parent = TYPE_PCI_BRIDGE,
         .instance_size = sizeof(PCIEPCIBridge),
         .class_init = pcie_pci_bridge_class_init,
+        .secure = true,
         .interfaces = (const InterfaceInfo[]) {
             { TYPE_HOTPLUG_HANDLER },
             { INTERFACE_PCIE_DEVICE },
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index 7c3e78010b..d829c4b61a 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -186,6 +186,7 @@ static const TypeInfo rp_info = {
     .instance_post_init = rp_instance_post_init,
     .class_init    = rp_class_init,
     .abstract      = true,
+    .secure        = true,
     .class_size = sizeof(PCIERootPortClass),
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 0c3fed3053..ded948ebd0 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -175,6 +175,7 @@ static const TypeInfo xio3130_downstream_info = {
     .name          = TYPE_XIO3130_DOWNSTREAM,
     .parent        = TYPE_PCIE_SLOT,
     .class_init    = xio3130_downstream_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { }
diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c
index 40057b749b..9d58105f8b 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -144,6 +144,7 @@ static const TypeInfo xio3130_upstream_info = {
     .name          = "x3130-upstream",
     .parent        = TYPE_PCIE_PORT,
     .class_init    = xio3130_upstream_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { }
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c15f2b9f08..20d4942df2 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -319,6 +319,7 @@ static const TypeInfo pci_bus_info = {
     .instance_size = sizeof(PCIBus),
     .class_size = sizeof(PCIBusClass),
     .class_init = pci_bus_class_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_FW_CFG_DATA_GENERATOR_INTERFACE },
         { }
@@ -328,16 +329,19 @@ static const TypeInfo pci_bus_info = {
 static const TypeInfo cxl_interface_info = {
     .name          = INTERFACE_CXL_DEVICE,
     .parent        = TYPE_INTERFACE,
+    .secure        = true,
 };
 
 static const TypeInfo pcie_interface_info = {
     .name          = INTERFACE_PCIE_DEVICE,
     .parent        = TYPE_INTERFACE,
+    .secure        = true,
 };
 
 static const TypeInfo conventional_pci_interface_info = {
     .name          = INTERFACE_CONVENTIONAL_PCI_DEVICE,
     .parent        = TYPE_INTERFACE,
+    .secure        = true,
 };
 
 static void pcie_bus_class_init(ObjectClass *klass, const void *data)
@@ -351,12 +355,14 @@ static const TypeInfo pcie_bus_info = {
     .name = TYPE_PCIE_BUS,
     .parent = TYPE_PCI_BUS,
     .class_init = pcie_bus_class_init,
+    .secure = true,
 };
 
 static const TypeInfo cxl_bus_info = {
     .name       = TYPE_CXL_BUS,
     .parent     = TYPE_PCIE_BUS,
     .class_init = pcie_bus_class_init,
+    .secure     = true,
 };
 
 static void pci_update_mappings(PCIDevice *d);
@@ -3468,6 +3474,7 @@ static const TypeInfo pci_device_type_info = {
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(PCIDevice),
     .abstract = true,
+    .secure = true,
     .class_size = sizeof(PCIDeviceClass),
     .class_init = pci_device_class_init,
     .class_base_init = pci_device_class_base_init,
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index e85932e41a..3eb0917fc2 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -497,6 +497,7 @@ static const TypeInfo pci_bridge_type_info = {
     .instance_size = sizeof(PCIBridge),
     .class_init = pci_bridge_class_init,
     .abstract = true,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_ACPI_DEV_AML_IF },
         { },
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 2a7fdfa563..5dc9d8493f 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -262,6 +262,7 @@ static const TypeInfo pci_host_type_info = {
     .name = TYPE_PCI_HOST_BRIDGE,
     .parent = TYPE_SYS_BUS_DEVICE,
     .abstract = true,
+    .secure = true,
     .class_size = sizeof(PCIHostBridgeClass),
     .instance_size = sizeof(PCIHostState),
     .class_init = pci_host_class_init,
diff --git a/hw/pci/pcie_host.c b/hw/pci/pcie_host.c
index 3717e1a086..3cf0769d2a 100644
--- a/hw/pci/pcie_host.c
+++ b/hw/pci/pcie_host.c
@@ -124,6 +124,7 @@ static const TypeInfo pcie_host_type_info = {
     .name = TYPE_PCIE_HOST_BRIDGE,
     .parent = TYPE_PCI_HOST_BRIDGE,
     .abstract = true,
+    .secure = true,
     .instance_size = sizeof(PCIExpressHost),
     .instance_init = pcie_host_init,
 };
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index dbb6032160..8fce77bcb8 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -200,6 +200,7 @@ static const TypeInfo pcie_port_type_info = {
     .parent = TYPE_PCI_BRIDGE,
     .instance_size = sizeof(PCIEPort),
     .abstract = true,
+    .secure = true,
     .class_init = pcie_port_class_init,
 };
 
-- 
2.55.0


