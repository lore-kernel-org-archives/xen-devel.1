From: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Subject: [PATCH cargo-cult-version] For linux-4.19.x .
 Xen/PCIback: Implement PCI flr/slot/bus reset with 'reset' SysFS attribute
Date: Wed, 14 Nov 2018 15:24:32 +0100
Message-ID: <bb94b090-bf7a-f944-128e-b08f919b3738@alstadheim.priv.no>
References: <8a3bc517-1255-4547-d244-5c400e44cc77@Oracle.COM>
 <f19dbb09-ef22-2cf4-fb38-2a7c42b5dc48@Oracle.COM>
 <5A377E020200007800197FFA@prv-mh.provo.novell.com>
 <559ffd12-b541-8a69-60bd-fbe10e3dc159@oracle.com>
 <20180916114306.GF18222@reaktio.net>
 <a726840b-8a5c-0890-73c6-3a95a7205153@oracle.com>
 <20180918071519.GG18222@reaktio.net>
 <5E7DDB68-4E68-48A5-AEEC-EE1B21A50E9E@citrix.com>
 <352310b3-ec9b-2ceb-83f0-4550718120c3@oracle.com>
 <20180919090526.s3ahnemrt2ik2tx3@mac.bytemobile.com>
 <20181003155104.GH5318@reaktio.net>
 <f6b8e055-7afc-b4de-af88-425d799dcd28@oracle.com>
 <5d467c35-a524-ab84-e2fd-e0e80211ae7d@alstadheim.priv.no>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------3E918930726E6FF5BCFE508B"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qojw=nz=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
 id 1gMw5v-0005ak-B9
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 14:24:39 +0000
Received: from postfix-relay.alstadheim.priv.no
 (148-252-110.181.3p.ntebredband.no [148.252.110.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: hakon.alstadheim@ntebb.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id DFDFD801A4
 for <xen-devel@lists.xenproject.org>; Wed, 14 Nov 2018 15:24:33 +0100 (CET)
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
 by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id 55337624E8A6
 for <xen-devel@lists.xenproject.org>; Wed, 14 Nov 2018 15:24:33 +0100 (CET)
Received: from [192.168.2.201] (unknown [192.168.2.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hakon)
 by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id F1FCE241067F
 for <xen-devel@lists.xenproject.org>; Wed, 14 Nov 2018 15:24:32 +0100 (CET)
In-Reply-To: <5d467c35-a524-ab84-e2fd-e0e80211ae7d@alstadheim.priv.no>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------3E918930726E6FF5BCFE508B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Den 23.10.2018 20:40, skrev Håkon Alstadheim:
>
> Den 08. okt. 2018 16:32, skrev Boris Ostrovsky:
>> Are these two patches still needed? ISTR they were  written originally
>> to deal with guest trying to use device that was previously assigned to
>> another guest. But pcistub_put_pci_dev() calls
>> __pci_reset_function_locked() which first tries FLR, and it looks like
>> it was added relatively recently.
>>
>>
> Sorry for the late reply, but I just now booted xen staging-4.11
> (94fba9f438a2c36ad9bf3a481a6013ddc7cf8cd9), with gentoo-sources-4.19.0
> as dom0. Shut down and started again a VM that has a secondary GPU
> passed through, and the whole  machine hung. I haven't had time to look
> more closely into this, other than that my old "do_flr" patch no longer
> applies to gentoo-sources (i.e. the linux kernel sources) . "do_flr"
> worked for me on linux-4.18.? , with appropriate patch to the linux kernel.

Without some kind of fix, my whole server (dom0) goes down whenever a 
domu with pci passed through is re-started.

NOTE: I am not a programmer. I have no idea what I am doing.

The patch I have as a starting-point does not compile correctly when 
applied to kernel version 4.19.x. I get implicit declarations of  
pci_try_reset_slot() and pci_try_reset_bus(). Replacing those with  
pci_reset_bus(dev) gives me the attached patch which applies cleanly to 
gentoo-sources-4.19.2, compiles without warnings, and works to let me 
restart a domU with pci-passthrough (modulo changing do_flr to reset in  
xen libxl).

I hope a dev will adopt these and give them proper care :-) .




--------------3E918930726E6FF5BCFE508B
Content-Type: text/x-patch;
 name="pci_brute_reset-home-hack.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pci_brute_reset-home-hack.patch"

--- a/drivers/xen/xen-pciback/pci_stub.c	2018-10-22 08:37:37.000000000 +0200
+++ b/drivers/xen/xen-pciback/pci_stub.c	2018-11-14 12:45:21.926468126 +0100
@@ -244,6 +244,90 @@
 	return found_dev;
 }
 
+struct pcistub_args {
+	struct pci_dev *dev;
+	unsigned int dcount;
+};
+
+static int pcistub_search_dev(struct pci_dev *dev, void *data)
+{
+	struct pcistub_device *psdev;
+	struct pcistub_args *arg = data;
+	bool found_dev = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pcistub_devices_lock, flags);
+
+	list_for_each_entry(psdev, &pcistub_devices, dev_list) {
+		if (psdev->dev == dev) {
+			found_dev = true;
+			arg->dcount++;
+			break;
+		}
+	}
+
+	spin_unlock_irqrestore(&pcistub_devices_lock, flags);
+
+	/* Device not owned by pcistub, someone owns it. Abort the walk */
+	if (!found_dev)
+		arg->dev = dev;
+
+	return found_dev ? 0 : 1;
+}
+
+static int pcistub_reset_dev(struct pci_dev *dev)
+{
+	struct xen_pcibk_dev_data *dev_data;
+	bool slot = false, bus = false;
+	struct pcistub_args arg = {};
+
+	if (!dev)
+		return -EINVAL;
+
+	dev_dbg(&dev->dev, "[%s]\n", __func__);
+
+	if (!pci_probe_reset_slot(dev->slot))
+		slot = true;
+	else if ((!pci_probe_reset_bus(dev->bus)) &&
+		 (!pci_is_root_bus(dev->bus)))
+		bus = true;
+
+	if (!bus && !slot)
+		return -EOPNOTSUPP;
+
+	/*
+	 * Make sure all devices on this bus are owned by the
+	 * PCI backend so that we can safely reset the whole bus.
+	 */
+	pci_walk_bus(dev->bus, pcistub_search_dev, &arg);
+
+	/* All devices under the bus should be part of pcistub! */
+	if (arg.dev) {
+		dev_err(&dev->dev, "%s device on bus 0x%x is not owned by pcistub\n",
+			pci_name(arg.dev), dev->bus->number);
+
+		return -EBUSY;
+	}
+
+	dev_dbg(&dev->dev, "pcistub owns %d devices on bus 0x%x\n",
+		arg.dcount, dev->bus->number);
+
+	dev_data = pci_get_drvdata(dev);
+	if (!pci_load_saved_state(dev, dev_data->pci_saved_state))
+		pci_restore_state(dev);
+
+	/* This disables the device. */
+	xen_pcibk_reset_device(dev);
+
+	/* Cleanup up any emulated fields */
+	xen_pcibk_config_reset_dev(dev);
+
+	dev_dbg(&dev->dev, "resetting %s device using %s reset\n",
+		pci_name(dev), slot ? "slot" : "bus");
+
+	return pci_reset_bus(dev);
+}
+
 /*
  * Called when:
  *  - XenBus state has been reconfigure (pci unplug). See xen_pcibk_remove_device
@@ -1430,6 +1514,33 @@
 }
 static DRIVER_ATTR_RW(permissive);
 
+static ssize_t reset_store(struct device_driver *drv, const char *buf,
+			      size_t count)
+{
+	struct pcistub_device *psdev;
+	int domain, bus, slot, func;
+	int err;
+
+	err = str_to_slot(buf, &domain, &bus, &slot, &func);
+	if (err)
+		return err;
+
+	psdev = pcistub_device_find(domain, bus, slot, func);
+	if (psdev) {
+		err = pcistub_reset_dev(psdev->dev);
+		pcistub_device_put(psdev);
+	} else {
+		err = -ENODEV;
+	}
+
+	if (!err)
+		err = count;
+
+	return err;
+}
+
+static DRIVER_ATTR_WO(reset);
+
 static void pcistub_exit(void)
 {
 	driver_remove_file(&xen_pcibk_pci_driver.driver, &driver_attr_new_slot);
@@ -1443,6 +1554,8 @@
 			   &driver_attr_irq_handlers);
 	driver_remove_file(&xen_pcibk_pci_driver.driver,
 			   &driver_attr_irq_handler_state);
+	driver_remove_file(&xen_pcibk_pci_driver.driver,
+			   &driver_attr_reset);
 	pci_unregister_driver(&xen_pcibk_pci_driver);
 }
 
@@ -1536,6 +1649,11 @@
 	if (!err)
 		err = driver_create_file(&xen_pcibk_pci_driver.driver,
 					&driver_attr_irq_handler_state);
+
+	if (!err)
+		err = driver_create_file(&xen_pcibk_pci_driver.driver,
+					 &driver_attr_reset);
+
 	if (err)
 		pcistub_exit();
 
 
--- a/Documentation/ABI/testing/sysfs-driver-pciback	2017-11-12 19:46:13.000000000 +0100
+++ b/Documentation/ABI/testing/sysfs-driver-pciback	2017-11-25 21:37:35.235738190 +0100
@@ -11,3 +11,15 @@
                 #echo 00:19.0-E0:2:FF > /sys/bus/pci/drivers/pciback/quirks
                 will allow the guest to read and write to the configuration
                 register 0x0E.
+
+What:           /sys/bus/pci/drivers/pciback/reset
+Date:           Nov 2017
+KernelVersion:  4.15
+Contact:        xen-devel@lists.xenproject.org
+Description:
+                An option to perform a slot or bus reset when a PCI device
+		is owned by Xen PCI backend. Writing a string of DDDD:BB:DD.F
+		will cause the pciback driver to perform a slot or bus reset
+		if the device supports it. It also checks to make sure that
+		all of the devices under the bridge are owned by Xen PCI
+		backend.

--------------3E918930726E6FF5BCFE508B
Content-Type: text/x-patch;
 name="do_flr-to-reset.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="do_flr-to-reset.patch"

--- a/tools/libxl/libxl_pci.c	2018-10-24 15:57:14.384810336 +0200
+++ b/tools/libxl/libxl_pci.c	2018-10-24 15:58:32.759342602 +0200
@@ -1119,7 +1119,7 @@
     char *reset;
     int fd, rc;
 
-    reset = GCSPRINTF("%s/do_flr", SYSFS_PCIBACK_DRIVER);
+    reset = GCSPRINTF("%s/reset", SYSFS_PCIBACK_DRIVER);
     fd = open(reset, O_WRONLY);
     if (fd >= 0) {
         char *buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);

--------------3E918930726E6FF5BCFE508B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------3E918930726E6FF5BCFE508B--
