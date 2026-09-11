Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0270FC88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417079.1646060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NK-0007Cy-K5; Fri, 11 Sep 2026 14:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417079.1646060; Fri, 11 Sep 2026 14:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NK-0007B5-B9; Fri, 11 Sep 2026 14:37:10 +0000
Received: by outflank-mailman (input) for mailman id 1417079;
 Fri, 11 Sep 2026 14:37:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52NI-0006lj-VP
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:37:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52NI-008jaJ-Bq
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:37:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41214-bab6-0a2a0a5309dd-0a2a4507c7d6-2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:08 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41213-b4ea-0a2a45070019-aa0a857ca4b3-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:08 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-tWO8hnOQMNmj-gNz7OkuIg-1; Fri,
 11 Sep 2026 10:37:03 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 34FB81955BC6; Fri, 11 Sep 2026 14:37:02 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 624253000229; Fri, 11 Sep 2026 14:37:00 +0000 (UTC)
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
	s=mimecast20190719; t=1789137427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNUd+bMGXY0z0prDdK4igFxO8NCpyH4B4dmoUC/5P5c=;
	b=iBAJW5qZ9Vv+vmcSJ2lE9dRF8FCSvzZ0KYEpo8Tom+FpvR5KogrqnJ89XwXtav/mdcFfzs
	u0cUBAiua19GYsqA8Foou5t57v/Ot2B1wxyH0rmeS55BGu14z2XyzAZnI2MUngjFVTjfNO
	z4Wp92r9/H8oVKyCduji5m6D8/wPpuM=
X-MC-Unique: tWO8hnOQMNmj-gNz7OkuIg-1
X-Mimecast-MFC-AGG-ID: tWO8hnOQMNmj-gNz7OkuIg_1789137422
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 14/28] hw/ide: mark ICH9 and ide-hd/ide-cd as secure
Date: Fri, 11 Sep 2026 15:36:13 +0100
Message-ID: <20260911143627.2743803-15-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: B3T0DayFuFrIe5C19k0zF2GYT6ybX1CTjmTTAT64RuQ_1789137422
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1789137428-370DDAE4-709B6F7B/0/0
X-purgate-type: clean
X-purgate-size: 2493

These have a long history of usage in virtualization scenarios on
x86, for OS which lack modern virtio drivers for storage, and thus
must be considered secure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/ide/ich.c     | 1 +
 hw/ide/ide-dev.c | 3 +++
 hw/ide/piix.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index b00987f08d..c7d50a15c1 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -198,6 +198,7 @@ static const TypeInfo ich_ahci_info = {
     .instance_size = sizeof(AHCIPCIState),
     .instance_init = pci_ich9_ahci_init,
     .class_init    = ich_ahci_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/ide/ide-dev.c b/hw/ide/ide-dev.c
index 5d478588c6..f555d0fb04 100644
--- a/hw/ide/ide-dev.c
+++ b/hw/ide/ide-dev.c
@@ -214,6 +214,7 @@ static const TypeInfo ide_hd_info = {
     .parent        = TYPE_IDE_DEVICE,
     .instance_size = sizeof(IDEDrive),
     .class_init    = ide_hd_class_init,
+    .secure        = true,
 };
 
 static const Property ide_cd_properties[] = {
@@ -236,6 +237,7 @@ static const TypeInfo ide_cd_info = {
     .parent        = TYPE_IDE_DEVICE,
     .instance_size = sizeof(IDEDrive),
     .class_init    = ide_cd_class_init,
+    .secure        = true,
 };
 
 static void ide_device_class_init(ObjectClass *klass, const void *data)
@@ -252,6 +254,7 @@ static const TypeInfo ide_device_type_info = {
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(IDEDevice),
     .abstract = true,
+    .secure = true,
     .class_size = sizeof(IDEDeviceClass),
     .class_init = ide_device_class_init,
     .instance_init = ide_dev_instance_init,
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index a8472f3e58..9b7b5e98c8 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -198,6 +198,7 @@ static const TypeInfo piix3_ide_info = {
     .name          = TYPE_PIIX3_IDE,
     .parent        = TYPE_PCI_IDE,
     .class_init    = piix3_ide_class_init,
+    .secure        = true,
 };
 
 /* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
@@ -221,6 +222,7 @@ static const TypeInfo piix4_ide_info = {
     .name          = TYPE_PIIX4_IDE,
     .parent        = TYPE_PCI_IDE,
     .class_init    = piix4_ide_class_init,
+    .secure        = true,
 };
 
 static void piix_ide_register_types(void)
-- 
2.55.0


