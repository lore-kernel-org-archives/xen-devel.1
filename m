Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F882D7308D
	for <xen-devel@archiver.kernel.org>; Sat,  4 Apr 2026 15:02:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1273752.1560274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w92Vw-0001DZ-B3; Sat, 04 Apr 2026 15:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1273752.1560274; Sat, 04 Apr 2026 15:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w92Vw-0001DR-7h; Sat, 04 Apr 2026 15:02:20 +0000
Received: by outflank-mailman (input) for mailman id 1273752;
 Sat, 04 Apr 2026 15:02:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w92Vv-0001DL-1d
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 15:02:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w92Vu-007yaP-AA
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 17:02:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69d127e8-e002-0a2a0a5209dd-0a2a450b9104-24
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 17:02:18 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <dakr@kernel.org>)
 id 69d127f9-bca8-0a2a450b0019-ac6904fe9486-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 17:02:17 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 32414600CB;
 Sat,  4 Apr 2026 15:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BB2C19421;
 Sat,  4 Apr 2026 15:02:06 +0000 (UTC)
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
	s=k20201202; t=1775314935;
	bh=yS1a8GmMxhd+gaXjsrUMOyEcZUcN2vLf71oRyrhAVkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fcd1WH1uMPDFcW95A5bP6twrmSlGywxDbhV9K4GUdxmnw9OhLho72J9OlIZREDDfv
	 Evf5eg+FhGKnEBZMEi0xrGzL0W0wBBPFC5ZbOalQpNWyhGwDm3HuLGvy/jgjYAq60X
	 Jsa257f9xIzRC/LnmHpxdh9mv/JRHNm7utYMn96WoZP6ZRATrlwe1+3BmjlR9bxRPR
	 tiA87cPHB5ojtZQJ2zSKPbtecnXGON24oyWbrZcP9XuN+XivvmLrVCQGu5orrMZe/a
	 +xDtWMIwREbTcGNYdTKbgyxE7aDCuXqmHaashK055GEOETa+XQlaspyrGVn7GrwOhI
	 UHZOaAkc+kiUA==
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
	Michael Kelley <mhklinux@outlook.com>,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH v2] Drivers: hv: vmbus: use generic driver_override infrastructure
Date: Sat,  4 Apr 2026 17:01:49 +0200
Message-ID: <20260404150155.3473682-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <BN7PR02MB414825D0532A1DFE16F3B671D449A@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <BN7PR02MB414825D0532A1DFE16F3B671D449A@BN7PR02MB4148.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775314938-EC3642A1-FAE8CD37/0/0
X-purgate-type: clean
X-purgate-size: 4285

When a driver is probed through __driver_attach(), the bus' match()
callback is called without the device lock held, thus accessing the
driver_override field without a lock, which can cause a UAF.

Fix this by using the driver-core driver_override infrastructure taking
care of proper locking internally.

Note that calling match() from __driver_attach() without the device lock
held is intentional. [1]

Tested-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220789
Fixes: d765edbb301c ("vmbus: add driver_override support")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Changes in v2:
  - Change patch subject and comments according to Michael's suggestion.
---
 drivers/hv/vmbus_drv.c | 43 ++++++++++--------------------------------
 include/linux/hyperv.h |  5 -----
 2 files changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index bc4fc1951ae1..ba7326ec6add 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -541,34 +541,6 @@ static ssize_t device_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(device);
 
-static ssize_t driver_override_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct hv_device *hv_dev = device_to_hv_device(dev);
-	int ret;
-
-	ret = driver_set_override(dev, &hv_dev->driver_override, buf, count);
-	if (ret)
-		return ret;
-
-	return count;
-}
-
-static ssize_t driver_override_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct hv_device *hv_dev = device_to_hv_device(dev);
-	ssize_t len;
-
-	device_lock(dev);
-	len = sysfs_emit(buf, "%s\n", hv_dev->driver_override);
-	device_unlock(dev);
-
-	return len;
-}
-static DEVICE_ATTR_RW(driver_override);
-
 /* Set up per device attributes in /sys/bus/vmbus/devices/<bus device> */
 static struct attribute *vmbus_dev_attrs[] = {
 	&dev_attr_id.attr,
@@ -599,7 +571,6 @@ static struct attribute *vmbus_dev_attrs[] = {
 	&dev_attr_channel_vp_mapping.attr,
 	&dev_attr_vendor.attr,
 	&dev_attr_device.attr,
-	&dev_attr_driver_override.attr,
 	NULL,
 };
 
@@ -711,9 +682,11 @@ static const struct hv_vmbus_device_id *hv_vmbus_get_id(const struct hv_driver *
 {
 	const guid_t *guid = &dev->dev_type;
 	const struct hv_vmbus_device_id *id;
+	int ret;
 
-	/* When driver_override is set, only bind to the matching driver */
-	if (dev->driver_override && strcmp(dev->driver_override, drv->name))
+	/* If a driver override is set, only bind to the matching driver */
+	ret = device_match_driver_override(&dev->device, &drv->driver);
+	if (ret == 0)
 		return NULL;
 
 	/* Look at the dynamic ids first, before the static ones */
@@ -721,8 +694,11 @@ static const struct hv_vmbus_device_id *hv_vmbus_get_id(const struct hv_driver *
 	if (!id)
 		id = hv_vmbus_dev_match(drv->id_table, guid);
 
-	/* driver_override will always match, send a dummy id */
-	if (!id && dev->driver_override)
+	/*
+	 * If there's a matching driver override, this function should succeed,
+	 * thus return a dummy device ID if no matching ID is found.
+	 */
+	if (!id && ret > 0)
 		id = &vmbus_device_null;
 
 	return id;
@@ -1024,6 +1000,7 @@ static const struct dev_pm_ops vmbus_pm = {
 /* The one and only one */
 static const struct bus_type  hv_bus = {
 	.name =		"vmbus",
+	.driver_override =	true,
 	.match =		vmbus_match,
 	.shutdown =		vmbus_shutdown,
 	.remove =		vmbus_remove,
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index dfc516c1c719..bf689d07d750 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1272,11 +1272,6 @@ struct hv_device {
 	u16 device_id;
 
 	struct device device;
-	/*
-	 * Driver name to force a match.  Do not set directly, because core
-	 * frees it.  Use driver_set_override() to set or clear it.
-	 */
-	const char *driver_override;
 
 	struct vmbus_channel *channel;
 	struct kset	     *channels_kset;
-- 
2.53.0


