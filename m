Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D015C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417058.1646009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52N7-00052r-9S; Fri, 11 Sep 2026 14:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417058.1646009; Fri, 11 Sep 2026 14:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52N7-00052X-4V; Fri, 11 Sep 2026 14:36:57 +0000
Received: by outflank-mailman (input) for mailman id 1417058;
 Fri, 11 Sep 2026 14:36:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52N5-0004ic-Kq
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:36:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52N5-008jZK-1L
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:36:55 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41202-2eae-0a2a0a5409dd-0a2a4501e918-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:54 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41205-5984-0a2a45010019-aa0a817ce18d-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:54 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-RjoLMoGTNgqEVSmrTvbZWw-1; Fri,
 11 Sep 2026 10:36:50 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 888A219539B0; Fri, 11 Sep 2026 14:36:48 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B23C63000229; Fri, 11 Sep 2026 14:36:46 +0000 (UTC)
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
	s=mimecast20190719; t=1789137413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcQmW3FrWiONRvVo20iIDURaSW8/Kg4toOjkYAWSQ3E=;
	b=i4qh9euHANItTbnaqhWCAM4HuHrWfSy0uXD21oLpi3VzniLI3hsLmW44CkdnVyf7Qgp+LK
	l13aVc/h1zEKYbWl1T0mGDWHEFRY5SFh9vZ1Q5rMs+JK2R7VbPiEKY+SA+Xixx0fAp+U9k
	dHuRu64QB2enjFUiLk9hAx1Dkzwf4nw=
X-MC-Unique: RjoLMoGTNgqEVSmrTvbZWw-1
X-Mimecast-MFC-AGG-ID: RjoLMoGTNgqEVSmrTvbZWw_1789137408
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 08/28] hw/xen: mark all Xen related object types as being secure
Date: Fri, 11 Sep 2026 15:36:07 +0100
Message-ID: <20260911143627.2743803-9-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: b99NS5PvbIuiEzMRq8r1ZzSP_E6qXnefuOEc50IDb9E_1789137408
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1789137414-C4B45757-E36DEFD3/0/0
X-purgate-type: clean
X-purgate-size: 5925

All Xen paravirtualized devices are intended to provide a host /
guest security barrier, so mark all Xen object types as scure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/block/xen-block.c        | 3 +++
 hw/char/xen_console.c       | 1 +
 hw/i386/xen/xen_platform.c  | 1 +
 hw/i386/xen/xen_pvdevice.c  | 1 +
 hw/net/xen_nic.c            | 1 +
 hw/xen/xen-bus.c            | 3 +++
 hw/xen/xen-legacy-backend.c | 3 +++
 hw/xen/xen_pt.c             | 1 +
 8 files changed, 14 insertions(+)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 474c12fe4a..3296e591d4 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -699,6 +699,7 @@ static const TypeInfo xen_block_type_info = {
     .parent = TYPE_XEN_DEVICE,
     .instance_size = sizeof(XenBlockDevice),
     .abstract = true,
+    .secure = true,
     .class_size = sizeof(XenBlockDeviceClass),
     .class_init = xen_block_class_init,
 };
@@ -740,6 +741,7 @@ static const TypeInfo xen_disk_type_info = {
     .parent = TYPE_XEN_BLOCK_DEVICE,
     .instance_size = sizeof(XenDiskDevice),
     .class_init = xen_disk_class_init,
+    .secure = true,
 };
 
 static void xen_cdrom_unrealize(XenBlockDevice *blockdev)
@@ -787,6 +789,7 @@ static const TypeInfo xen_cdrom_type_info = {
     .parent = TYPE_XEN_BLOCK_DEVICE,
     .instance_size = sizeof(XenCDRomDevice),
     .class_init = xen_cdrom_class_init,
+    .secure = true,
 };
 
 static void xen_block_register_types(void)
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index bdeb76dc87..df6a708494 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -513,6 +513,7 @@ static const TypeInfo xen_console_type_info = {
     .parent = TYPE_XEN_DEVICE,
     .instance_size = sizeof(XenConsole),
     .class_init = xen_console_class_init,
+    .secure = true,
 };
 
 static void xen_console_register_types(void)
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index c8b852be0c..ec0084d6fb 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -604,6 +604,7 @@ static const TypeInfo xen_platform_info = {
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIXenPlatformState),
     .class_init    = xen_platform_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index fab26a06af..74636046d0 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -139,6 +139,7 @@ static const TypeInfo xen_pv_type_info = {
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(XenPVDevice),
     .class_init    = xen_pv_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index f4d0b06013..e615303da6 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -579,6 +579,7 @@ static const TypeInfo xen_net_type_info = {
     .parent = TYPE_XEN_DEVICE,
     .instance_size = sizeof(XenNetDev),
     .class_init = xen_netdev_class_init,
+    .secure = true,
 };
 
 static void xen_net_register_types(void)
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 1762816bf4..4623995e2c 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -404,6 +404,7 @@ static const TypeInfo xen_bus_type_info = {
     .instance_size = sizeof(XenBus),
     .class_size = sizeof(XenBusClass),
     .class_init = xen_bus_class_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
         { }
@@ -1127,6 +1128,7 @@ static const TypeInfo xen_device_type_info = {
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(XenDevice),
     .abstract = true,
+    .secure = true,
     .class_size = sizeof(XenDeviceClass),
     .class_init = xen_device_class_init,
 };
@@ -1141,6 +1143,7 @@ static const TypeInfo xen_bridge_type_info = {
     .name = TYPE_XEN_BRIDGE,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(XenBridge),
+    .secure = true,
 };
 
 static void xen_register_types(void)
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 7977b52712..75f8ac7efd 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -648,6 +648,7 @@ static const TypeInfo xendev_type_info = {
     .parent        = TYPE_DYNAMIC_SYS_BUS_DEVICE,
     .class_init    = xendev_class_init,
     .instance_size = sizeof(XenLegacyDevice),
+    .secure        = true,
 };
 
 static void xen_sysbus_class_init(ObjectClass *klass, const void *data)
@@ -661,6 +662,7 @@ static const TypeInfo xensysbus_info = {
     .name       = TYPE_XENSYSBUS,
     .parent     = TYPE_BUS,
     .class_init = xen_sysbus_class_init,
+    .secure     = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
         { }
@@ -670,6 +672,7 @@ static const TypeInfo xensysbus_info = {
 static const TypeInfo xensysdev_info = {
     .name          = TYPE_XENSYSDEV,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .secure        = true,
 };
 
 static void xenbe_register_types(void)
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0fe9c0aada..504c559318 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -1079,6 +1079,7 @@ static const TypeInfo xen_pci_passthrough_info = {
     .instance_finalize = xen_pci_passthrough_finalize,
     .class_init = xen_pci_passthrough_class_init,
     .class_size = sizeof(XenPTDeviceClass),
+    .secure = true,
     .instance_init = xen_pci_passthrough_instance_init,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.55.0


