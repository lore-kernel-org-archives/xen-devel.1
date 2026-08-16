Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05424C5DF79
	for <xen-devel@archiver.kernel.org>; Sun, 16 Aug 2026 19:15:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392351.1631357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvgKb-0002lZ-Td; Sun, 16 Aug 2026 19:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392351.1631357; Sun, 16 Aug 2026 19:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvgKb-0002lS-Qe; Sun, 16 Aug 2026 19:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1392351;
 Sun, 16 Aug 2026 19:15:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wvgKa-0002kn-38
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2026 19:15:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvgKZ-000W25-GT
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2026 21:15:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a820c12-8faa-0a2a0a5109dd-0a2a450cc58a-16
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2026 21:15:39 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a820c5a-f479-0a2a450c0019-aa0a857cbbb1-3
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2026 21:15:39 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-318-7f96DjF8Pgm4b6YL4EVX9A-1; Sun,
 16 Aug 2026 15:15:29 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F308118009B9; Sun, 16 Aug 2026 19:15:27 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AB84B195608A; Sun, 16 Aug 2026 19:15:26 +0000 (UTC)
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
	s=mimecast20190719; t=1786907738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g46sAmq3ha3DYCK2UfYcBYOEhlaJmE0VJpMuNI3hBc0=;
	b=Vw3Z6FAf3eVfYKpXnnE3ry9w0YTXPiFb+W7ArswLWqoXh0jxmk8pQog7hRoCrl8nvPFa5M
	Gmoc8+B94ixGC25HkdVuMeQgg9wWyHHbq8UB8HZuRbXOdI6RS6pWVzb/vGLtF1ATJY9dhN
	M3nCxdDEgDWGrG9MbSoV0789aHbqjHQ=
X-MC-Unique: 7f96DjF8Pgm4b6YL4EVX9A-1
X-Mimecast-MFC-AGG-ID: 7f96DjF8Pgm4b6YL4EVX9A_1786907728
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Sun, 16 Aug 2026 23:13:06 +0400
Subject: [PATCH v3 39/49] qdev-monitor: make print_dev() callback take
 MonitorHMP
MIME-Version: 1.0
Message-Id: <20260816-qemu-no-hmp-v3-39-e53fc35bc550@redhat.com>
References: <20260816-qemu-no-hmp-v3-0-e53fc35bc550@redhat.com>
In-Reply-To: <20260816-qemu-no-hmp-v3-0-e53fc35bc550@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Amit Shah <amit@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=8734;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=cx2OSLe23AC3qAPOuez5hwYS/HxH2LycawW7o4xWb/s=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqggu0colGAL5Urj3/4h6eSdW96XE2/1InxU1CL
 lbwnRPnuiKJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCaoILtAAKCRDa6OEJdZac
 5YsCD/9d6LecLqyFpUAiOjySTCaIn4pgwvHvAM5YCSI7WTFHDMhzfyNfks15weyh5Q2vcwxXdBe
 ApjrTS4/4pAayYDBCw37akCTxBfLuu8hH7gPzsM/miXzSxmITm3z51cd8IGDwNKX2WP1xXWYgRr
 uW3+prn7q7hA/f6+fiVSjUS8btJgFfzKzQ5DnB7xtSxMHvI6JZI7gkcSzqtJ4wWWz9Oz733x9VS
 upQplMPXLnncEnxxiTgyzY6iQWicVnr8gLJ9hq5tAjVw+0FRYTL4K75OjssHbREjjPqhA6cCQfG
 puHlPZ+p4HDk5BOb9/DKbiQG2gRvjvv/ZMJLK130EPMPaK4wZpEuNdmYYXzoxWr8ogUbhuR3tyt
 v1qj7Al73J7oi0mXTJTTV4r4JWwtwbiOFmVpYZkPACHEjQ2cwwEqzfCgNjoCQ9LlEQuFDO9MyLF
 y5EF3lYu1yINwa72YD6Jc39Az7QNelcnOehkOVLNNgN590FuvP8diG/9FH97fJonwp/8dPbkyog
 zV0evM9ui0n1lFFvPOnNtBz4mnH7DeXpMtt/SjYUpzSgOBnDZigqBzGBoWE8vbPeGJvWIGiaMmS
 A4XaQ8Zt+1/tSbZeEkTMx4/oRrPz3RSQsDnRDG3uSlZIo0VRRwWL4LxI46Zfdwdv5nlenC9N9Wg
 FrEHvaJmEMecCyA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: UPaWkOcRGBCD-CdOiAYDmozhIUVnst6SrkkDj9QKZH4_1786907728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1786907739-024DFA5B-CE964D28/0/0
X-purgate-type: clean
X-purgate-size: 8736

The callback is specific to HMP context, avoid unsafe MONITOR_HMP()
cast.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/char/virtio-serial-bus.c | 6 +++---
 hw/core/sysbus.c            | 5 ++---
 hw/misc/auxbus.c            | 7 +++----
 hw/pci/pci-hmp-cmds.c       | 3 +--
 hw/pci/pci-internal.h       | 2 +-
 hw/usb/bus.c                | 5 ++---
 hw/xen/xen-bus.c            | 3 +--
 include/hw/core/qdev.h      | 3 ++-
 system/qdev-monitor.c       | 7 +++----
 9 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 33fdc0846ac3..4dcc4516e45e 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -814,7 +814,7 @@ static int virtio_serial_load_device(VirtIODevice *vdev, QEMUFile *f,
     return 0;
 }
 
-static void virtser_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent);
+static void virtser_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent);
 
 static const Property virtser_props[] = {
     DEFINE_PROP_UINT32("nr", VirtIOSerialPort, id, VIRTIO_CONSOLE_BAD_ID),
@@ -834,11 +834,11 @@ static const TypeInfo virtser_bus_info = {
     .class_init = virtser_bus_class_init,
 };
 
-static void virtser_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
+static void virtser_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent)
 {
     VirtIOSerialPort *port = VIRTIO_SERIAL_PORT(qdev);
 
-    monitor_hmp_printf(MONITOR_HMP(mon), "%*sport %d, guest %s, host %s, throttle %s\n",
+    monitor_hmp_printf(hmp, "%*sport %d, guest %s, host %s, throttle %s\n",
                        indent, "", port->id,
                        port->guest_connected ? "on" : "off",
                        port->host_connected ? "on" : "off",
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 82130ba04698..31c4fdf79d48 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -24,7 +24,7 @@
 #include "monitor/hmp.h"
 #include "system/address-spaces.h"
 
-static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
+static void sysbus_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent);
 static char *sysbus_get_fw_dev_path(DeviceState *dev);
 
 typedef struct SysBusFind {
@@ -249,10 +249,9 @@ bool sysbus_realize_and_unref(SysBusDevice *dev, Error **errp)
     return qdev_realize_and_unref(DEVICE(dev), sysbus_get_default(), errp);
 }
 
-static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent)
+static void sysbus_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
 {
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
-    MonitorHMP *hmp = MONITOR_HMP(mon);
     hwaddr size;
     int i;
 
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index ffa76f83016b..0bb89c5a60ab 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -47,7 +47,7 @@
 } while (0)
 
 
-static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent);
+static void aux_slave_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent);
 static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge);
 
 /* aux-bus implementation (internal not public) */
@@ -288,7 +288,7 @@ static const TypeInfo aux_to_i2c_type_info = {
 };
 
 /* aux-slave implementation */
-static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
+static void aux_slave_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
 {
     AUXBus *bus = AUX_BUS(qdev_get_parent_bus(dev));
     AUXSlave *s;
@@ -300,8 +300,7 @@ static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
 
     s = AUX_SLAVE(dev);
 
-    monitor_hmp_printf(MONITOR_HMP(mon),
-                       "%*smemory " HWADDR_FMT_plx "/" HWADDR_FMT_plx "\n",
+    monitor_hmp_printf(hmp, "%*smemory " HWADDR_FMT_plx "/" HWADDR_FMT_plx "\n",
                        indent, "",
                        object_property_get_uint(OBJECT(s->mmio), "addr", NULL),
                        memory_region_size(s->mmio));
diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index 500f821246a9..bcccfaf07f4d 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -135,9 +135,8 @@ void hmp_info_pci(MonitorHMP *hmp, const QDict *qdict)
     qapi_free_PciInfoList(info_list);
 }
 
-void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
+void pcibus_dev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
 {
-    MonitorHMP *hmp = MONITOR_HMP(mon);
     PCIDevice *d = (PCIDevice *)dev;
     int class = pci_get_word(d->config + PCI_CLASS_DEVICE);
     const pci_class_desc *desc = get_class_desc(class);
diff --git a/hw/pci/pci-internal.h b/hw/pci/pci-internal.h
index a7d6d8a7324e..b7231fab5dc9 100644
--- a/hw/pci/pci-internal.h
+++ b/hw/pci/pci-internal.h
@@ -16,7 +16,7 @@ extern PCIHostStateList pci_host_bridges;
 
 const pci_class_desc *get_class_desc(int class);
 PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
-void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent);
+void pcibus_dev_print(MonitorHMP *mon, DeviceState *dev, int indent);
 
 int pcie_aer_parse_error_string(const char *error_name,
                                 uint32_t *status, bool *correctable);
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index fe3dbfa2227c..8bd25a9d872a 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -13,7 +13,7 @@
 #include "trace.h"
 #include "qemu/cutils.h"
 
-static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent);
+static void usb_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent);
 
 static char *usb_get_dev_path(DeviceState *dev);
 static char *usb_get_fw_dev_path(DeviceState *qdev);
@@ -544,9 +544,8 @@ static const char *usb_speed(unsigned int speed)
     return txt[speed];
 }
 
-static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
+static void usb_bus_dev_print(MonitorHMP *hmp, DeviceState *qdev, int indent)
 {
-    MonitorHMP *hmp = MONITOR_HMP(mon);
     USBDevice *dev = USB_DEVICE(qdev);
     USBBus *bus = usb_bus_from_device(dev);
 
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 4075b5b001ae..b81a067e7753 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -101,9 +101,8 @@ abort:
     qemu_xen_xs_transaction_end(xenbus->xsh, tid, true);
 }
 
-static void xen_bus_print_dev(Monitor *mon, DeviceState *dev, int indent)
+static void xen_bus_print_dev(MonitorHMP *hmp, DeviceState *dev, int indent)
 {
-    MonitorHMP *hmp = MONITOR_HMP(mon);
     XenDevice *xendev = XEN_DEVICE(dev);
 
     monitor_hmp_printf(hmp, "%*sname = '%s' frontend_id = %u\n",
diff --git a/include/hw/core/qdev.h b/include/hw/core/qdev.h
index 37f7d3355193..1391dc060caf 100644
--- a/include/hw/core/qdev.h
+++ b/include/hw/core/qdev.h
@@ -10,6 +10,7 @@
 #include "qom/object.h"
 #include "hw/core/hotplug.h"
 #include "hw/core/resettable.h"
+#include "monitor/hmp.h"
 
 /**
  * DOC: The QEMU Device API
@@ -323,7 +324,7 @@ struct BusClass {
     ObjectClass parent_class;
 
     /* FIXME first arg should be BusState */
-    void (*print_dev)(Monitor *mon, DeviceState *dev, int indent);
+    void (*print_dev)(MonitorHMP *mon, DeviceState *dev, int indent);
     /*
      * Return a newly allocated string containing the path of the
      * device on this bus.
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 3860ada2a237..13ac9f8f3be1 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -790,18 +790,17 @@ static void qdev_print_props(MonitorHMP *hmp, DeviceState *dev, DeviceClass *dc,
     }
 }
 
-static void bus_print_dev(BusState *bus, Monitor *mon, DeviceState *dev, int indent)
+static void bus_print_dev(BusState *bus, MonitorHMP *hmp, DeviceState *dev, int indent)
 {
     BusClass *bc = BUS_GET_CLASS(bus);
 
     if (bc->print_dev) {
-        bc->print_dev(mon, dev, indent);
+        bc->print_dev(hmp, dev, indent);
     }
 }
 
 static void qdev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
 {
-    Monitor *mon = MONITOR(hmp);
     ObjectClass *class;
     NamedGPIOList *ngl;
     NamedClockList *ncl;
@@ -828,7 +827,7 @@ static void qdev_print(MonitorHMP *hmp, DeviceState *dev, int indent)
         qdev_print_props(hmp, dev, DEVICE_CLASS(class), indent);
         class = object_class_get_parent(class);
     } while (class != object_class_by_name(TYPE_DEVICE));
-    bus_print_dev(dev->parent_bus, mon, dev, indent);
+    bus_print_dev(dev->parent_bus, hmp, dev, indent);
 }
 
 static void qbus_print(MonitorHMP *hmp, BusState *bus, int indent, bool details)

-- 
2.55.0.543.g5ebe2ebe4ea8


