Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C081E10706CF
	for <xen-devel@archiver.kernel.org>; Sat, 14 Mar 2026 11:58:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1254742.1550339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1Nca-0000lb-1U; Sat, 14 Mar 2026 11:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254742.1550339; Sat, 14 Mar 2026 11:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1NcZ-0000lO-SE; Sat, 14 Mar 2026 11:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1254742;
 Sat, 14 Mar 2026 11:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TBtM=BO=kernel.org=rafael@srs-se1.protection.inumbo.net>)
 id 1w1NcY-0000lI-Nv
 for xen-devel@lists.xenproject.org; Sat, 14 Mar 2026 11:57:30 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9012a89-1f9c-11f1-b164-2bf370ae4941;
 Sat, 14 Mar 2026 12:57:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2171340A8B;
 Sat, 14 Mar 2026 11:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6D2C116C6;
 Sat, 14 Mar 2026 11:57:25 +0000 (UTC)
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
X-Inumbo-ID: f9012a89-1f9c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773489447;
	bh=EsHwFVcOQ4Wxdsc84ge5jVHkcdmVeRF8NmEV5Gg+6aM=;
	h=From:To:Cc:Subject:Date:From;
	b=aW7ABgskz2oAgNzm8fnf8LB55FmzAiNcm0elrONcrIDR65uTXre2ggvfMmsoYUXfh
	 WrGrLkeMycyXDSf9ueVWkC8h6OXcx4Czntq/O4k2TbobKR8YZPCRdtPFkLBNomGyv4
	 C79II8XwT/wG3jjNmwuOrjy1ziw7LfSkffV8Qx4lG/BOcy3FEPwjs7HenWS3BEzCiA
	 th1ddIjewuvG8P8Q4em6kv1XMb+L0MzSHFOaQNrCF5yOeHNXYDFwNFX5tMmosXzPFB
	 MPUjFexIuRqT7WlzAtH2lxSHxWOioGIDhOfpe3uofJr/zVc01uHyS0tRhG5y/Th42N
	 aVBHbjGd5XN2w==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>, xen-devel@lists.xenproject.org
Cc: LKML <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v1] ACPI: PAD: xen: Convert to a platform driver
Date: Sat, 14 Mar 2026 12:57:23 +0100
Message-ID: <8683270.T7Z3S40VBb@rafael.j.wysocki>
Organization: Linux Kernel Development
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

In all cases in which a struct acpi_driver is used for binding a driver
to an ACPI device object, a corresponding platform device is created by
the ACPI core and that device is regarded as a proper representation of
underlying hardware.  Accordingly, a struct platform_driver should be
used by driver code to bind to that device.  There are multiple reasons
why drivers should not bind directly to ACPI device objects [1].

Overall, it is better to bind drivers to platform devices than to their
ACPI companions, so convert the Xen ACPI processor aggregator device
(PAD) driver to a platform one.

While this is not expected to alter functionality, it changes sysfs
layout and so it will be visible to user space.

Link: https://lore.kernel.org/all/2396510.ElGaqSPkdT@rafael.j.wysocki/ [1]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---

Note that the original ACPI PAD driver has been a platform driver for
quite some time already.

---
 drivers/xen/xen-acpi-pad.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/xen-acpi-pad.c b/drivers/xen/xen-acpi-pad.c
index ede69a5278d3..75a39862c1df 100644
--- a/drivers/xen/xen-acpi-pad.c
+++ b/drivers/xen/xen-acpi-pad.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/acpi.h>
+#include <linux/platform_device.h>
 #include <xen/xen.h>
 #include <xen/interface/version.h>
 #include <xen/xen-ops.h>
@@ -107,8 +108,9 @@ static void acpi_pad_notify(acpi_handle handle, u32 event,
 	}
 }
 
-static int acpi_pad_add(struct acpi_device *device)
+static int acpi_pad_probe(struct platform_device *pdev)
 {
+	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 	acpi_status status;
 
 	strcpy(acpi_device_name(device), ACPI_PROCESSOR_AGGREGATOR_DEVICE_NAME);
@@ -122,13 +124,13 @@ static int acpi_pad_add(struct acpi_device *device)
 	return 0;
 }
 
-static void acpi_pad_remove(struct acpi_device *device)
+static void acpi_pad_remove(struct platform_device *pdev)
 {
 	mutex_lock(&xen_cpu_lock);
 	xen_acpi_pad_idle_cpus(0);
 	mutex_unlock(&xen_cpu_lock);
 
-	acpi_remove_notify_handler(device->handle,
+	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev),
 		ACPI_DEVICE_NOTIFY, acpi_pad_notify);
 }
 
@@ -137,13 +139,12 @@ static const struct acpi_device_id pad_device_ids[] = {
 	{"", 0},
 };
 
-static struct acpi_driver acpi_pad_driver = {
-	.name = "processor_aggregator",
-	.class = ACPI_PROCESSOR_AGGREGATOR_CLASS,
-	.ids = pad_device_ids,
-	.ops = {
-		.add = acpi_pad_add,
-		.remove = acpi_pad_remove,
+static struct platform_driver acpi_pad_driver = {
+	.probe = acpi_pad_probe,
+	.remove = acpi_pad_remove,
+	.driver = {
+		.name = "acpi_processor_aggregator",
+		.acpi_match_table = pad_device_ids,
 	},
 };
 
@@ -157,6 +158,6 @@ static int __init xen_acpi_pad_init(void)
 	if (!xen_running_on_version_or_later(4, 2))
 		return -ENODEV;
 
-	return acpi_bus_register_driver(&acpi_pad_driver);
+	return platform_driver_register(&acpi_pad_driver);
 }
 subsys_initcall(xen_acpi_pad_init);
-- 
2.51.0





