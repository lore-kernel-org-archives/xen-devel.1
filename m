Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66974F532CE
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 01:26:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1259871.1553213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXN-00083X-FK; Tue, 24 Mar 2026 01:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259871.1553213; Tue, 24 Mar 2026 01:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXN-00081b-8V; Tue, 24 Mar 2026 01:26:29 +0000
Received: by outflank-mailman (input) for mailman id 1259871;
 Tue, 24 Mar 2026 01:00:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w4q7n-0005Q9-ER
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 01:00:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4q7m-00CO7D-Qf
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 02:00:02 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69c1e20c-bab6-0a2a0a5309dd-0a2a450cb7fc-2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:00:02 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69c1e211-f93d-0a2a450c0019-ac6904fe8806-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:00:02 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 74FC6600AC;
 Tue, 24 Mar 2026 01:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8531C2BCB3;
 Tue, 24 Mar 2026 00:59:51 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774314001;
	bh=ZtCCSi+uF2o4qnuVascTL67uA5Os6ojvzLmO/D5h2Mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nl46bkNw7Fjecz/RMBLSWyx70dmK5O28lDsQW1GskyDDaiScC60RT6k4U32whSdqG
	 vvTqf2D5QJuwkZfMIHhePdCU3vg54I+asysdiy/HM6VLVikFmJCB5Rg5z3VC4yK/OU
	 tiset58fZbTtl2ttAsLp2cIrn8qWITtMGEZoCLr2TNkcCKmmEyAhCl7fs1cLqq3NtF
	 4mix3uDvddCgkLlNrSUBtMqBA8rF7s9Io0nEBzEdxR7hO0qdfUKsjfrKBksqiZ2aw1
	 v8gaiSPh0Qq/Pna5QKorppQaSfrb9lZ12oswLvR4sVUrPpIna0omN319f9Veo9VvTv
	 453J11YKXvWrw==
From: Danilo Krummrich <dakr@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alex Williamson <alex@shazbot.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-spi@vger.kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	Danilo Krummrich <dakr@kernel.org>,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 03/12] cdx: use generic driver_override infrastructure
Date: Tue, 24 Mar 2026 01:59:07 +0100
Message-ID: <20260324005919.2408620-4-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774314002-F72A9734-E1904B81/0/0
X-purgate-type: clean
X-purgate-size: 4627

When a driver is probed through __driver_attach(), the bus' match()
callback is called without the device lock held, thus accessing the
driver_override field without a lock, which can cause a UAF.

Fix this by using the driver-core driver_override infrastructure taking
care of proper locking internally.

Note that calling match() from __driver_attach() without the device lock
held is intentional. [1]

Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220789
Fixes: 2959ab247061 ("cdx: add the cdx bus driver")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/cdx/cdx.c           | 40 +++++--------------------------------
 include/linux/cdx/cdx_bus.h |  4 ----
 2 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index 9196dc50a48d..d3d230247262 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -156,8 +156,6 @@ static int cdx_unregister_device(struct device *dev,
 	} else {
 		cdx_destroy_res_attr(cdx_dev, MAX_CDX_DEV_RESOURCES);
 		debugfs_remove_recursive(cdx_dev->debugfs_dir);
-		kfree(cdx_dev->driver_override);
-		cdx_dev->driver_override = NULL;
 	}
 
 	/*
@@ -268,6 +266,7 @@ static int cdx_bus_match(struct device *dev, const struct device_driver *drv)
 	const struct cdx_driver *cdx_drv = to_cdx_driver(drv);
 	const struct cdx_device_id *found_id = NULL;
 	const struct cdx_device_id *ids;
+	int ret;
 
 	if (cdx_dev->is_bus)
 		return false;
@@ -275,7 +274,8 @@ static int cdx_bus_match(struct device *dev, const struct device_driver *drv)
 	ids = cdx_drv->match_id_table;
 
 	/* When driver_override is set, only bind to the matching driver */
-	if (cdx_dev->driver_override && strcmp(cdx_dev->driver_override, drv->name))
+	ret = device_match_driver_override(dev, drv);
+	if (ret == 0)
 		return false;
 
 	found_id = cdx_match_id(ids, cdx_dev);
@@ -289,7 +289,7 @@ static int cdx_bus_match(struct device *dev, const struct device_driver *drv)
 		 */
 		if (!found_id->override_only)
 			return true;
-		if (cdx_dev->driver_override)
+		if (ret > 0)
 			return true;
 
 		ids = found_id + 1;
@@ -453,36 +453,6 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(modalias);
 
-static ssize_t driver_override_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct cdx_device *cdx_dev = to_cdx_device(dev);
-	int ret;
-
-	if (WARN_ON(dev->bus != &cdx_bus_type))
-		return -EINVAL;
-
-	ret = driver_set_override(dev, &cdx_dev->driver_override, buf, count);
-	if (ret)
-		return ret;
-
-	return count;
-}
-
-static ssize_t driver_override_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct cdx_device *cdx_dev = to_cdx_device(dev);
-	ssize_t len;
-
-	device_lock(dev);
-	len = sysfs_emit(buf, "%s\n", cdx_dev->driver_override);
-	device_unlock(dev);
-	return len;
-}
-static DEVICE_ATTR_RW(driver_override);
-
 static ssize_t enable_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
@@ -552,7 +522,6 @@ static struct attribute *cdx_dev_attrs[] = {
 	&dev_attr_class.attr,
 	&dev_attr_revision.attr,
 	&dev_attr_modalias.attr,
-	&dev_attr_driver_override.attr,
 	NULL,
 };
 
@@ -646,6 +615,7 @@ ATTRIBUTE_GROUPS(cdx_bus);
 
 const struct bus_type cdx_bus_type = {
 	.name		= "cdx",
+	.driver_override = true,
 	.match		= cdx_bus_match,
 	.probe		= cdx_probe,
 	.remove		= cdx_remove,
diff --git a/include/linux/cdx/cdx_bus.h b/include/linux/cdx/cdx_bus.h
index b1ba97f6c9ad..f54770f110bc 100644
--- a/include/linux/cdx/cdx_bus.h
+++ b/include/linux/cdx/cdx_bus.h
@@ -137,9 +137,6 @@ struct cdx_controller {
  * @enabled: is this bus enabled
  * @msi_dev_id: MSI Device ID associated with CDX device
  * @num_msi: Number of MSI's supported by the device
- * @driver_override: driver name to force a match; do not set directly,
- *                   because core frees it; use driver_set_override() to
- *                   set or clear it.
  * @irqchip_lock: lock to synchronize irq/msi configuration
  * @msi_write_pending: MSI write pending for this device
  */
@@ -165,7 +162,6 @@ struct cdx_device {
 	bool enabled;
 	u32 msi_dev_id;
 	u32 num_msi;
-	const char *driver_override;
 	struct mutex irqchip_lock;
 	bool msi_write_pending;
 };
-- 
2.53.0


