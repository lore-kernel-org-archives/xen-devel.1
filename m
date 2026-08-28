Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBC0C61DD7
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 20:44:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402465.1637574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x03RQ-0004KF-Ic; Fri, 28 Aug 2026 20:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402465.1637574; Fri, 28 Aug 2026 20:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x03RQ-0004K8-Fm; Fri, 28 Aug 2026 20:44:48 +0000
Received: by outflank-mailman (input) for mailman id 1402465;
 Fri, 28 Aug 2026 20:44:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1x03RO-0004HR-NP
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 20:44:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x03RO-00DUlk-4V
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 22:44:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a91f30e-bab6-0a2a0a5309dd-0a2a4504afd6-48
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 22:44:46 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a91f33c-b57f-0a2a45040019-aa0a857c5eed-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 22:44:45 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-670-TeuMH2ZtO3ew8EvnX0HPYw-1; Fri,
 28 Aug 2026 16:44:41 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B60611944F2C; Fri, 28 Aug 2026 20:44:39 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E99AA1803A40; Fri, 28 Aug 2026 20:44:38 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787949884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0gilCMcTw5GY6oy+YVwRqReRSTX/SrtxwLMRYrDZVs=;
	b=MCqZVWxZ1sHR0oXJkM+7A/0AzB8ivXw+qBqO9IJe8puQVf3KDLcXWodwsPCDUDO6sN7/NP
	JyqgFUWhg2+iOdTX0Snv+sYv++Kti8kPlMJiEu59KpwAB+O1fVXmIvJ0NnwaUUKJJ9lS3H
	1AGycCoHZjKZ4Q4113tMgu+5Ul2busg=
X-MC-Unique: TeuMH2ZtO3ew8EvnX0HPYw-1
X-Mimecast-MFC-AGG-ID: TeuMH2ZtO3ew8EvnX0HPYw_1787949879
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Sat, 29 Aug 2026 00:42:22 +0400
Subject: [GIT PULL 43/50] hw: guard BusClass::print_dev with CONFIG_HMP
MIME-Version: 1.0
Message-Id: <20260829-nohmp-v1-43-4dcc2b4b0055@redhat.com>
References: <20260829-nohmp-v1-0-4dcc2b4b0055@redhat.com>
In-Reply-To: <20260829-nohmp-v1-0-4dcc2b4b0055@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Laurent Vivier <lvivier@redhat.com>, 
 Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=9570;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=L3Loi/onUFTsM2fjxBfrKJdXskJwqRvtiYRcMlKMo2w=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqkfKVd+m32mJrZbVhGLpXFwMRIXrxLaCIEMZQD
 Zj5VnNgz7CJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCapHylQAKCRDa6OEJdZac
 5Z2UD/4lT/YcsQpKiBSeaW34Rt6KLiZToHdewe53DXktQz/zLhMbXg0ro/ciVu3giu55hxebadE
 ZUadjNPI6eyfqmjNFIrvT4yC4B31liBIV0uXJvfV9g61SROBkq0uuCs/zdzbQEBJL0RtpQWJCCk
 IJUAf3ISbhmEYdm5sQAODfhQo4504YCsYMGR3ztVgSwmxTziDojBp6asRhq+ti9xRnQ3GHrHLkk
 iMycfc1cbtRG32JK8Lz0BhEiRiDTBnMhuBptseXC8vEItQG3/Mc6YioQqlRCqhvNfLN0TTSRvoj
 XJUB9BL41FrXym+uAAc7Lv5MWW8WIoJ1vUBYaaMHRmxzAIvG4grZ0mcnX3pUN24rdPMn8oSAwWC
 yl/FsCK+ktURtE1ZbeXVn0pj/9srsv+2tds8IAKUoyqRyK+bqhM0XuVPV2ic/kZ1GOF1GCdZJbF
 bElR3nAqEMOR5tEx1UBhdnDjVhglfp6OgO6z8y1T07Xq+sWWmqg3x8OGCmjsYrQhqyl8HW0l+Yr
 oQ6G0zugSfElA60YbY2EFkEtG+IbkRlE11WUcHri8GJOXJyBRY32m01a1cvRqxTI2yF1nZVPJMe
 Ey2nt/p1rD6i9pgAcwmJUIOpKJOyK9Sq1So6n8BZ/CIOsyp+B5/Qnfgv8D90PoeEWQvi1qMbcxM
 smThkRrXYJZPxOQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: GfSW3ag1GCYT3_AYK_iNdIyFLR0yKwC01UsE-F2UI8w_1787949879
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787949886-512DCB50-30E7627E/0/0
X-purgate-type: clean
X-purgate-size: 9572

The print_dev callback is only used by HMP 'info qtree'. Guard the field
in BusClass, all implementations, and the caller with CONFIG_HMP.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260828-qemu-no-hmp-v5-43-9227de146347@redhat.com>
---
 hw/char/virtio-serial-bus.c |  6 ++++++
 hw/core/sysbus.c            |  6 ++++++
 hw/misc/auxbus.c            | 16 +++++++++++-----
 hw/pci/pci-hmp-cmds.c       |  2 ++
 hw/pci/pci.c                |  2 ++
 hw/usb/bus.c                |  6 ++++++
 hw/xen/xen-bus.c            |  4 ++++
 include/hw/core/qdev.h      |  2 ++
 8 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 4dcc4516e45e..83a033ce8555 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -814,7 +814,9 @@ static int virtio_serial_load_device(VirtIODevice *vdev, QEMUFile *f,
     return 0;
 }
 
+#ifdef CONFIG_HMP
 static void virtser_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent);
+#endif
 
 static const Property virtser_props[] = {
     DEFINE_PROP_UINT32("nr", VirtIOSerialPort, id, VIRTIO_CONSOLE_BAD_ID),
@@ -823,8 +825,10 @@ static const Property virtser_props[] = {
 
 static void virtser_bus_class_init(ObjectClass *klass, const void *data)
 {
+#ifdef CONFIG_HMP
     BusClass *k = BUS_CLASS(klass);
     k->print_dev = virtser_bus_dev_print;
+#endif
 }
 
 static const TypeInfo virtser_bus_info = {
@@ -834,6 +838,7 @@ static const TypeInfo virtser_bus_info = {
     .class_init = virtser_bus_class_init,
 };
 
+#ifdef CONFIG_HMP
 static void virtser_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent)
 {
     VirtIOSerialPort *port = VIRTIO_SERIAL_PORT(qdev);
@@ -844,6 +849,7 @@ static void virtser_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent
                        port->host_connected ? "on" : "off",
                        port->throttled ? "on" : "off");
 }
+#endif
 
 /* This function is only used if a port id is not provided by the user */
 static uint32_t find_free_port_id(VirtIOSerial *vser)
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 31c4fdf79d48..fe8f867a8d9c 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -24,7 +24,9 @@
 #include "monitor/hmp.h"
 #include "system/address-spaces.h"
 
+#ifdef CONFIG_HMP
 static void sysbus_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent);
+#endif
 static char *sysbus_get_fw_dev_path(DeviceState *dev);
 
 typedef struct SysBusFind {
@@ -76,7 +78,9 @@ static void system_bus_class_init(ObjectClass *klass, const void *data)
 {
     BusClass *k = BUS_CLASS(klass);
 
+#ifdef CONFIG_HMP
     k->print_dev = sysbus_dev_print;
+#endif
     k->get_fw_dev_path = sysbus_get_fw_dev_path;
 }
 
@@ -249,6 +253,7 @@ bool sysbus_realize_and_unref(SysBusDevice *dev, Error **errp)
     return qdev_realize_and_unref(DEVICE(dev), sysbus_get_default(), errp);
 }
 
+#ifdef CONFIG_HMP
 static void sysbus_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
 {
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
@@ -261,6 +266,7 @@ static void sysbus_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
                            indent, "", s->mmio[i].addr, size);
     }
 }
+#endif
 
 static char *sysbus_get_fw_dev_path(DeviceState *dev)
 {
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 0bb89c5a60ab..3f17784d9b8a 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -47,18 +47,22 @@
 } while (0)
 
 
+#ifdef CONFIG_HMP
 static void aux_slave_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent);
+#endif
 static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge);
 
 /* aux-bus implementation (internal not public) */
 static void aux_bus_class_init(ObjectClass *klass, const void *data)
 {
+#ifdef CONFIG_HMP
     BusClass *k = BUS_CLASS(klass);
 
     /* AUXSlave has an MMIO so we need to change the way we print information
      * in monitor.
      */
     k->print_dev = aux_slave_dev_print;
+#endif
 }
 
 AUXBus *aux_bus_init(DeviceState *parent, const char *name)
@@ -91,11 +95,6 @@ void aux_map_slave(AUXSlave *aux_dev, hwaddr addr)
     memory_region_add_subregion(bus->aux_io, addr, aux_dev->mmio);
 }
 
-static bool aux_bus_is_bridge(AUXBus *bus, DeviceState *dev)
-{
-    return (dev == DEVICE(bus->bridge));
-}
-
 I2CBus *aux_get_i2c_bus(AUXBus *bus)
 {
     return aux_bridge_get_i2c_bus(bus->bridge);
@@ -288,6 +287,12 @@ static const TypeInfo aux_to_i2c_type_info = {
 };
 
 /* aux-slave implementation */
+#ifdef CONFIG_HMP
+static bool aux_bus_is_bridge(AUXBus *bus, DeviceState *dev)
+{
+    return (dev == DEVICE(bus->bridge));
+}
+
 static void aux_slave_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
 {
     AUXBus *bus = AUX_BUS(qdev_get_parent_bus(dev));
@@ -305,6 +310,7 @@ static void aux_slave_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
                        object_property_get_uint(OBJECT(s->mmio), "addr", NULL),
                        memory_region_size(s->mmio));
 }
+#endif
 
 void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio)
 {
diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index bcccfaf07f4d..879011da1384 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -135,6 +135,7 @@ void hmp_info_pci(MonitorHMP *hmp, const QDict *qdict)
     qapi_free_PciInfoList(info_list);
 }
 
+#ifdef CONFIG_HMP
 void pcibus_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
 {
     PCIDevice *d = (PCIDevice *)dev;
@@ -170,6 +171,7 @@ void pcibus_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
                            r->addr, r->addr + r->size - 1);
     }
 }
+#endif
 
 void hmp_pcie_aer_inject_error(MonitorHMP *hmp, const QDict *qdict)
 {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e8e8a3b76714..c15f2b9f084a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -293,7 +293,9 @@ static void pci_bus_class_init(ObjectClass *klass, const void *data)
     ResettableClass *rc = RESETTABLE_CLASS(klass);
     FWCfgDataGeneratorClass *fwgc = FW_CFG_DATA_GENERATOR_CLASS(klass);
 
+#ifdef CONFIG_HMP
     k->print_dev = pcibus_dev_print;
+#endif
     k->get_dev_path = pcibus_get_dev_path;
     k->get_fw_dev_path = pcibus_get_fw_dev_path;
     k->realize = pci_bus_realize;
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 8bd25a9d872a..5cc5ffec33a1 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -13,7 +13,9 @@
 #include "trace.h"
 #include "qemu/cutils.h"
 
+#ifdef CONFIG_HMP
 static void usb_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent);
+#endif
 
 static char *usb_get_dev_path(DeviceState *dev);
 static char *usb_get_fw_dev_path(DeviceState *qdev);
@@ -32,7 +34,9 @@ static void usb_bus_class_init(ObjectClass *klass, const void *data)
     BusClass *k = BUS_CLASS(klass);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(klass);
 
+#ifdef CONFIG_HMP
     k->print_dev = usb_bus_dev_print;
+#endif
     k->get_dev_path = usb_get_dev_path;
     k->get_fw_dev_path = usb_get_fw_dev_path;
     hc->unplug = qdev_simple_device_unplug_cb;
@@ -544,6 +548,7 @@ static const char *usb_speed(unsigned int speed)
     return txt[speed];
 }
 
+#ifdef CONFIG_HMP
 static void usb_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent)
 {
     USBDevice *dev = USB_DEVICE(qdev);
@@ -555,6 +560,7 @@ static void usb_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent)
                        usb_speed(dev->speed), dev->product_desc,
                        dev->attached ? ", attached" : "");
 }
+#endif
 
 static char *usb_get_dev_path(DeviceState *qdev)
 {
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index b81a067e7753..1762816bf469 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -101,6 +101,7 @@ abort:
     qemu_xen_xs_transaction_end(xenbus->xsh, tid, true);
 }
 
+#ifdef CONFIG_HMP
 static void xen_bus_print_dev(MonitorHMP *hmp, DeviceState *dev, int indent)
 {
     XenDevice *xendev = XEN_DEVICE(dev);
@@ -108,6 +109,7 @@ static void xen_bus_print_dev(MonitorHMP *hmp, DeviceState *dev, int indent)
     monitor_hmp_printf(hmp, "%*sname = '%s' frontend_id = %u\n",
                        indent, "", xendev->name, xendev->frontend_id);
 }
+#endif
 
 static char *xen_bus_get_dev_path(DeviceState *dev)
 {
@@ -386,7 +388,9 @@ static void xen_bus_class_init(ObjectClass *class, const void *data)
     BusClass *bus_class = BUS_CLASS(class);
     HotplugHandlerClass *hotplug_class = HOTPLUG_HANDLER_CLASS(class);
 
+#ifdef CONFIG_HMP
     bus_class->print_dev = xen_bus_print_dev;
+#endif
     bus_class->get_dev_path = xen_bus_get_dev_path;
     bus_class->realize = xen_bus_realize;
     bus_class->unrealize = xen_bus_unrealize;
diff --git a/include/hw/core/qdev.h b/include/hw/core/qdev.h
index 1391dc060caf..f054a214fc6a 100644
--- a/include/hw/core/qdev.h
+++ b/include/hw/core/qdev.h
@@ -323,8 +323,10 @@ DECLARE_OBJ_CHECKERS(BusState, BusClass,
 struct BusClass {
     ObjectClass parent_class;
 
+#ifdef CONFIG_HMP
     /* FIXME first arg should be BusState */
     void (*print_dev)(MonitorHMP *mon, DeviceState *dev, int indent);
+#endif
     /*
      * Return a newly allocated string containing the path of the
      * device on this bus.

-- 
2.55.0.543.g5ebe2ebe4ea8


