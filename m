Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083C1C61DD9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 12:08:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401966.1637422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzvNu-0007bX-SU; Fri, 28 Aug 2026 12:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401966.1637422; Fri, 28 Aug 2026 12:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzvNu-0007bN-Mp; Fri, 28 Aug 2026 12:08:38 +0000
Received: by outflank-mailman (input) for mailman id 1401966;
 Fri, 28 Aug 2026 12:08:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wzvNt-0007Xy-29
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 12:08:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzvNr-00EXIr-Or
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 14:08:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a917a32-bab6-0a2a0a5309dd-0a2a45018ebc-44
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 14:08:35 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a917a42-5984-0a2a45010019-aa0a857cc3f9-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 14:08:35 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-FjPGu21KPEGueILqlWBtQw-1; Fri,
 28 Aug 2026 08:08:30 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 69B50195C271; Fri, 28 Aug 2026 12:08:28 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5B8671955F70; Fri, 28 Aug 2026 12:08:26 +0000 (UTC)
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
	s=mimecast20190719; t=1787918914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=25R6K0h4VasC6c0/fb56834UAhmdGWxK3yF98UwXa74=;
	b=X+KJQP6pxlhTkY0qp7WozASj1yBppivhf7jiMcsMrnz75xegMGF9XYYmA8NrWIRgNAeMhX
	tBZLjv/MzUO/h0Vb0EJDtLeGaMwibDLHEvf4+BMseMQYbQYAvbawkiM6ETduAWx5wDx9dL
	ueZtyhpaqTPiku3JEPl0aafyKqrebkY=
X-MC-Unique: FjPGu21KPEGueILqlWBtQw-1
X-Mimecast-MFC-AGG-ID: FjPGu21KPEGueILqlWBtQw_1787918908
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Fri, 28 Aug 2026 16:04:40 +0400
Subject: [PATCH v5 43/50] hw: guard BusClass::print_dev with CONFIG_HMP
MIME-Version: 1.0
Message-Id: <20260828-qemu-no-hmp-v5-43-9227de146347@redhat.com>
References: <20260828-qemu-no-hmp-v5-0-9227de146347@redhat.com>
In-Reply-To: <20260828-qemu-no-hmp-v5-0-9227de146347@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 dave@treblig.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Amit Shah <amit@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=9504;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=XnF4d30mGYZ8u8fB9M/5LPD7J1YmexQm02x6u9jiDrs=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqkXk5gZiAAiEhj3djzZX7HxGWpWFaKCob/DEbb
 zcqXW2xm/CJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCapF5OQAKCRDa6OEJdZac
 5W5qD/0dC3Ql0bbtl5G9EqXtaBbdksLOB6k5kDr15oE3N59BmFfZx2IuRbJJeenppsanCtXTGuB
 nINLutbXOlqIpKSjanyMMAgPMHGYqVvdIDXLTURUgAoHZ/QYRnrBFsxR6XUwwViXHgoM9R8DGNF
 cKnsFWMPl6b+Of5Mz+udx6E3Jowk83aWwdJGWk+iSCRE3Asjf4j0MFc9tZQ2YMfyJbd7zhFy8lN
 17SMPNaGa8W3RU+fzSDYiwhHg5Z8Py/7m20LWisTFZS3UUyHMQ0OgKMSfhQNsoP1F+ldn/KxQ40
 3Q2JjUCCjgPWvF9jgyiI7x4M63DZ0OM7QCBwOT35UjrZhSSFbQT9ysUzkA/BrhBMp/EIdENnm4Q
 cICGKOc9Z2yD2FPBS9oXZe6tyhtDsPrFqhpZwNgL3ZkVWiW0Qv/8RpJngJC4k39nzwfEX2SyfcY
 tTiIzm4vH2nDf7/BCLjtPQUoisl5rV7fUYHpcCHO5xoxq3WDThNxp+T4y9HwKscZ/VtpSdSPiEj
 K4k+dx/ZFmP+TNE24XiC1zNaXKE+zvkwax0fyCBgjhoWzMnLsDaxJPhZjZJlRe8X+pGE4/Fezxc
 2QP52G6Cx/QNuTm3sJrNJuhtkrTIfew7H3yjqr/JumUIcTs3ggTHcy/N2V1npwCsVQlWV80K9EA
 MXzpzvViz6L318A==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: fPKhoIC7ZXtOkUg70V-ypT6SgO6ZjScqjlUUI2ZJdxM_1787918908
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787918915-C5146757-30353459/0/0
X-purgate-type: clean
X-purgate-size: 9506

The print_dev callback is only used by HMP 'info qtree'. Guard the field
in BusClass, all implementations, and the caller with CONFIG_HMP.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


