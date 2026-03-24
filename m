Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC49F532C8
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 01:26:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1259889.1553284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXR-0001Is-Pe; Tue, 24 Mar 2026 01:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259889.1553284; Tue, 24 Mar 2026 01:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXR-0001C5-4l; Tue, 24 Mar 2026 01:26:33 +0000
Received: by outflank-mailman (input) for mailman id 1259889;
 Tue, 24 Mar 2026 01:05:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w4qCv-0005BA-CQ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 01:05:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4qCu-00774E-OC
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 02:05:20 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69c1e34f-5cb7-0a2a0a5109dd-0a2a4509d162-2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:05:20 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69c1e25e-e484-0a2a45090019-aceafc1fd662-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:01:19 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 506F040596;
 Tue, 24 Mar 2026 01:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08877C4CEF7;
 Tue, 24 Mar 2026 01:01:08 +0000 (UTC)
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
	s=k20201202; t=1774314078;
	bh=TSvMQrmWsjFbNL0IRf0H97QbCggIeEqWbPsKuLbLU4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nt7EnChiw/TSy7uxZL1NGCwc80dLd1NcsHa2f5yOYAsRoEuKZz3R4Zc2Jky7pI1PP
	 fX38CD0xPqsoAlbl8ygm7B7pQvUt21fJRqnuUoJzuGo/w1SwTYIkOuYMzYD6++PKyO
	 GlReyOV0V5oiuGn3d19d+P/0YVof0JWBUjpR7gvA94kKmmZrfsVK4M+LbO6J+BIjBR
	 GNNZS00+k7bbnjV9HfcGI/slE84pV5D8Pfilwv3HA2XN5pcxtA4pjQBZ0SSOkup/06
	 D6VUmZOVMXZtjDLE4b4uCWJCE0Qw6XcyAZU2CAHH+xAz/p1g0p71QYF5eQjsqdnxat
	 5+zw/NsuVO7yw==
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
Subject: [PATCH 11/12] spi: use generic driver_override infrastructure
Date: Tue, 24 Mar 2026 01:59:15 +0100
Message-ID: <20260324005919.2408620-12-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1774314080-622B0A73-AAC03874/13/0
X-purgate-type: clean
X-purgate-size: 4107

When a driver is probed through __driver_attach(), the bus' match()
callback is called without the device lock held, thus accessing the
driver_override field without a lock, which can cause a UAF.

Fix this by using the driver-core driver_override infrastructure taking
care of proper locking internally.

Note that calling match() from __driver_attach() without the device lock
held is intentional. [1]

Also note that we do not enable the driver_override feature of struct
bus_type, as SPI - in contrast to most other buses - passes "" to
sysfs_emit() when the driver_override pointer is NULL. Thus, printing
"\n" instead of "(null)\n".

Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220789
Fixes: 5039563e7c25 ("spi: Add driver_override SPI device attribute")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/spi/spi.c       | 19 +++++++------------
 include/linux/spi/spi.h |  5 -----
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 53dee314d76a..4101c2803eb3 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -50,7 +50,6 @@ static void spidev_release(struct device *dev)
 	struct spi_device	*spi = to_spi_device(dev);
 
 	spi_controller_put(spi->controller);
-	kfree(spi->driver_override);
 	free_percpu(spi->pcpu_statistics);
 	kfree(spi);
 }
@@ -73,10 +72,9 @@ static ssize_t driver_override_store(struct device *dev,
 				     struct device_attribute *a,
 				     const char *buf, size_t count)
 {
-	struct spi_device *spi = to_spi_device(dev);
 	int ret;
 
-	ret = driver_set_override(dev, &spi->driver_override, buf, count);
+	ret = __device_set_driver_override(dev, buf, count);
 	if (ret)
 		return ret;
 
@@ -86,13 +84,8 @@ static ssize_t driver_override_store(struct device *dev,
 static ssize_t driver_override_show(struct device *dev,
 				    struct device_attribute *a, char *buf)
 {
-	const struct spi_device *spi = to_spi_device(dev);
-	ssize_t len;
-
-	device_lock(dev);
-	len = sysfs_emit(buf, "%s\n", spi->driver_override ? : "");
-	device_unlock(dev);
-	return len;
+	guard(spinlock)(&dev->driver_override.lock);
+	return sysfs_emit(buf, "%s\n", dev->driver_override.name ?: "");
 }
 static DEVICE_ATTR_RW(driver_override);
 
@@ -376,10 +369,12 @@ static int spi_match_device(struct device *dev, const struct device_driver *drv)
 {
 	const struct spi_device	*spi = to_spi_device(dev);
 	const struct spi_driver	*sdrv = to_spi_driver(drv);
+	int ret;
 
 	/* Check override first, and if set, only use the named driver */
-	if (spi->driver_override)
-		return strcmp(spi->driver_override, drv->name) == 0;
+	ret = device_match_driver_override(dev, drv);
+	if (ret >= 0)
+		return ret;
 
 	/* Attempt an OF style match */
 	if (of_driver_match_device(dev, drv))
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index af7cfee7b8f6..0dc671c07d3a 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -159,10 +159,6 @@ extern void spi_transfer_cs_change_delay_exec(struct spi_message *msg,
  * @modalias: Name of the driver to use with this device, or an alias
  *	for that name.  This appears in the sysfs "modalias" attribute
  *	for driver coldplugging, and in uevents used for hotplugging
- * @driver_override: If the name of a driver is written to this attribute, then
- *	the device will bind to the named driver and only the named driver.
- *	Do not set directly, because core frees it; use driver_set_override() to
- *	set or clear it.
  * @pcpu_statistics: statistics for the spi_device
  * @word_delay: delay to be inserted between consecutive
  *	words of a transfer
@@ -224,7 +220,6 @@ struct spi_device {
 	void			*controller_state;
 	void			*controller_data;
 	char			modalias[SPI_NAME_SIZE];
-	const char		*driver_override;
 
 	/* The statistics */
 	struct spi_statistics __percpu	*pcpu_statistics;
-- 
2.53.0


