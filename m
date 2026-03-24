Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB8CF532C6
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 01:26:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1259887.1553277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXQ-000118-VJ; Tue, 24 Mar 2026 01:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259887.1553277; Tue, 24 Mar 2026 01:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXQ-0000yr-Ey; Tue, 24 Mar 2026 01:26:32 +0000
Received: by outflank-mailman (input) for mailman id 1259887;
 Tue, 24 Mar 2026 01:04:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w4qCT-00059A-0M
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 01:04:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4qCS-00Gi8O-4k
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 02:04:52 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69c1e32e-bab6-0a2a0a5309dd-0a2a45089b8c-14
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:04:52 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69c1e242-1950-0a2a45080019-aceafc1fbff0-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:00:51 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8BF1402D2;
 Tue, 24 Mar 2026 01:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600FAC2BCB3;
 Tue, 24 Mar 2026 01:00:40 +0000 (UTC)
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
	s=k20201202; t=1774314049;
	bh=2lHhdrgE9qzH1ZdWMWGXkZLiIUExSh17kxoWzoBpEYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=urbkSyPC//Mc+7xDMT60BWD1PM5iJno/Pv3C12Ww9BFBlm+Txslon6hgVop799Zux
	 g+Sv+q81mxYoKpArwgNlL1ZLxKeJEZHi/lM3U9lsj91wt+dVuwPQVluFb1QQ+HQlCj
	 sv5wTpgn5xlflwnnmanQE9E5F/Pn2wr+wAILRhGodQgtrhj4oxFDHJG9NtY75ERcHC
	 m7A8DB8J2Ne77LkVgV0/eIo9dU9uCfUYKNhjjLT4Tt3E8Clc0+8oqnyAcHS/Bg4R5L
	 D1zJWmU8m174lSqL3A0Ubvc3fqLrq3bwEdahRa42TfG/CVeZDK4Hwt1j/T6kr4aNVX
	 9oiBCcvJ5IK1g==
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
Subject: [PATCH 08/12] vdpa: use generic driver_override infrastructure
Date: Tue, 24 Mar 2026 01:59:12 +0100
Message-ID: <20260324005919.2408620-9-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1774314051-E8E85726-F86AC08E/0/0
X-purgate-type: clean
X-purgate-size: 3902

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
Fixes: 539fec78edb4 ("vdpa: add driver_override support")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/vdpa/vdpa.c  | 48 +++++---------------------------------------
 include/linux/vdpa.h |  4 ----
 2 files changed, 5 insertions(+), 47 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 34874beb0152..caf0ee5d6856 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -67,57 +67,20 @@ static void vdpa_dev_remove(struct device *d)
 
 static int vdpa_dev_match(struct device *dev, const struct device_driver *drv)
 {
-	struct vdpa_device *vdev = dev_to_vdpa(dev);
+	int ret;
 
 	/* Check override first, and if set, only use the named driver */
-	if (vdev->driver_override)
-		return strcmp(vdev->driver_override, drv->name) == 0;
+	ret = device_match_driver_override(dev, drv);
+	if (ret >= 0)
+		return ret;
 
 	/* Currently devices must be supported by all vDPA bus drivers */
 	return 1;
 }
 
-static ssize_t driver_override_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct vdpa_device *vdev = dev_to_vdpa(dev);
-	int ret;
-
-	ret = driver_set_override(dev, &vdev->driver_override, buf, count);
-	if (ret)
-		return ret;
-
-	return count;
-}
-
-static ssize_t driver_override_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct vdpa_device *vdev = dev_to_vdpa(dev);
-	ssize_t len;
-
-	device_lock(dev);
-	len = sysfs_emit(buf, "%s\n", vdev->driver_override);
-	device_unlock(dev);
-
-	return len;
-}
-static DEVICE_ATTR_RW(driver_override);
-
-static struct attribute *vdpa_dev_attrs[] = {
-	&dev_attr_driver_override.attr,
-	NULL,
-};
-
-static const struct attribute_group vdpa_dev_group = {
-	.attrs  = vdpa_dev_attrs,
-};
-__ATTRIBUTE_GROUPS(vdpa_dev);
-
 static const struct bus_type vdpa_bus = {
 	.name  = "vdpa",
-	.dev_groups = vdpa_dev_groups,
+	.driver_override = true,
 	.match = vdpa_dev_match,
 	.probe = vdpa_dev_probe,
 	.remove = vdpa_dev_remove,
@@ -132,7 +95,6 @@ static void vdpa_release_dev(struct device *d)
 		ops->free(vdev);
 
 	ida_free(&vdpa_index_ida, vdev->index);
-	kfree(vdev->driver_override);
 	kfree(vdev);
 }
 
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 2bfe3baa63f4..782c42d25db1 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -72,9 +72,6 @@ struct vdpa_mgmt_dev;
  * struct vdpa_device - representation of a vDPA device
  * @dev: underlying device
  * @vmap: the metadata passed to upper layer to be used for mapping
- * @driver_override: driver name to force a match; do not set directly,
- *                   because core frees it; use driver_set_override() to
- *                   set or clear it.
  * @config: the configuration ops for this device.
  * @map: the map ops for this device
  * @cf_lock: Protects get and set access to configuration layout.
@@ -90,7 +87,6 @@ struct vdpa_mgmt_dev;
 struct vdpa_device {
 	struct device dev;
 	union virtio_map vmap;
-	const char *driver_override;
 	const struct vdpa_config_ops *config;
 	const struct virtio_map_ops *map;
 	struct rw_semaphore cf_lock; /* Protects get/set config */
-- 
2.53.0


