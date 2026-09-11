Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918CDC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:36:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417050.1645981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52N0-000473-20; Fri, 11 Sep 2026 14:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417050.1645981; Fri, 11 Sep 2026 14:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Mz-00046n-UT; Fri, 11 Sep 2026 14:36:49 +0000
Received: by outflank-mailman (input) for mailman id 1417050;
 Fri, 11 Sep 2026 14:36:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52My-0003rT-J2
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:36:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Mx-00EPw8-W7
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:36:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa411ea-2eae-0a2a0a5409dd-0a2a450bc0b0-48
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:47 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa411fe-b7e8-0a2a450b0019-aa0a857cce15-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:47 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-_kA9vgHhO4OI92Jt3oP7vg-1; Fri,
 11 Sep 2026 10:36:43 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D4EE5180074A; Fri, 11 Sep 2026 14:36:41 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 052D53000229; Fri, 11 Sep 2026 14:36:39 +0000 (UTC)
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
	s=mimecast20190719; t=1789137406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITXs1RC82PxSIg8yFFapmKCFNMrOr2p5NsMTwGt6/Sk=;
	b=ZAwcDkJFMqfERK8I2vz0t3zzDmdkQhkIs/aXeAETMbMK3qyv+XYe7s9m54LQ1Rb5C70SfC
	t4Znxq2Ed2m7VYci5r35OS/8ql16Cr+C07Z2VnRT4ASduSoQzNXwW0cidFz9UEWpqMJ4Mq
	l8npFY7agnoc4g4zM1d8a3QwgL/BMoQ=
X-MC-Unique: _kA9vgHhO4OI92Jt3oP7vg-1
X-Mimecast-MFC-AGG-ID: _kA9vgHhO4OI92Jt3oP7vg_1789137401
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 05/28] hw: mark all vhost devices a secure
Date: Fri, 11 Sep 2026 15:36:04 +0100
Message-ID: <20260911143627.2743803-6-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 8u2-9snIgGt0TBZK4ZIS0XhW_U2cSAgsCpFtA9t53sY_1789137401
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789137407-A8ECE9EA-B2B6B37C/0/0
X-purgate-type: clean
X-purgate-size: 9561

These are all intended for use in a virtualization scenario and must
provide a security boundary.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/block/vhost-user-blk.c          | 1 +
 hw/display/vhost-user-gpu.c        | 1 +
 hw/scsi/vhost-scsi-common.c        | 1 +
 hw/scsi/vhost-scsi.c               | 1 +
 hw/scsi/vhost-user-scsi.c          | 1 +
 hw/virtio/vhost-user-base.c        | 3 ++-
 hw/virtio/vhost-user-fs.c          | 1 +
 hw/virtio/vhost-user-gpio.c        | 1 +
 hw/virtio/vhost-user-i2c.c         | 1 +
 hw/virtio/vhost-user-input.c       | 1 +
 hw/virtio/vhost-user-rng.c         | 1 +
 hw/virtio/vhost-user-rtc.c         | 1 +
 hw/virtio/vhost-user-scmi.c        | 1 +
 hw/virtio/vhost-user-snd.c         | 1 +
 hw/virtio/vhost-user-spi.c         | 1 +
 hw/virtio/vhost-user-test-device.c | 1 +
 hw/virtio/vhost-user-vsock.c       | 1 +
 hw/virtio/vhost-vsock-common.c     | 1 +
 hw/virtio/vhost-vsock.c            | 1 +
 19 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 2e5b3ae1b1..105d77e543 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -673,6 +673,7 @@ static const TypeInfo vhost_user_blk_info = {
     .instance_size = sizeof(VHostUserBlk),
     .instance_init = vhost_user_blk_instance_init,
     .class_init = vhost_user_blk_class_init,
+    .secure = true,
 };
 
 static void virtio_register_types(void)
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index cd684d6363..4204cac483 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -727,6 +727,7 @@ static const TypeInfo vhost_user_gpu_info = {
     .instance_init = vhost_user_gpu_instance_init,
     .instance_finalize = vhost_user_gpu_instance_finalize,
     .class_init = vhost_user_gpu_class_init,
+    .secure = true,
 };
 module_obj(TYPE_VHOST_USER_GPU);
 module_kconfig(VHOST_USER_GPU);
diff --git a/hw/scsi/vhost-scsi-common.c b/hw/scsi/vhost-scsi-common.c
index e19800a0bc..7b0007a30e 100644
--- a/hw/scsi/vhost-scsi-common.c
+++ b/hw/scsi/vhost-scsi-common.c
@@ -164,6 +164,7 @@ static const TypeInfo vhost_scsi_common_info = {
     .parent = TYPE_VIRTIO_SCSI_COMMON,
     .instance_size = sizeof(VHostSCSICommon),
     .abstract = true,
+    .secure = true,
 };
 
 static void virtio_register_types(void)
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 657403cad0..e1f209fabb 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -400,6 +400,7 @@ static const TypeInfo vhost_scsi_info = {
     .instance_size = sizeof(VHostSCSI),
     .class_init = vhost_scsi_class_init,
     .instance_init = vhost_scsi_instance_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_FW_PATH_PROVIDER },
         { }
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 5070178dc2..8906997051 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -425,6 +425,7 @@ static const TypeInfo vhost_user_scsi_info = {
     .instance_size = sizeof(VHostUserSCSI),
     .class_init = vhost_user_scsi_class_init,
     .instance_init = vhost_user_scsi_instance_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_FW_PATH_PROVIDER },
         { }
diff --git a/hw/virtio/vhost-user-base.c b/hw/virtio/vhost-user-base.c
index 478ec68f09..682c06f26b 100644
--- a/hw/virtio/vhost-user-base.c
+++ b/hw/virtio/vhost-user-base.c
@@ -426,7 +426,8 @@ static const TypeInfo vub_types[] = {
         .instance_size = sizeof(VHostUserBase),
         .class_init = vub_class_init,
         .class_size = sizeof(VHostUserBaseClass),
-        .abstract = true
+        .abstract = true,
+        .secure = true,
     }
 };
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 209993918a..9901f84bfb 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -448,6 +448,7 @@ static const TypeInfo vuf_info = {
     .instance_size = sizeof(VHostUserFS),
     .instance_init = vuf_instance_init,
     .class_init = vuf_class_init,
+    .secure = true,
 };
 
 static void vuf_register_types(void)
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index d473f87077..cec21106e0 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -53,6 +53,7 @@ static const TypeInfo vu_gpio_info = {
     .parent = TYPE_VHOST_USER_BASE,
     .instance_size = sizeof(VHostUserGPIO),
     .class_init = vu_gpio_class_init,
+    .secure = true,
 };
 
 static void vu_gpio_register_types(void)
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 152b1f6740..17b0b44413 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -53,6 +53,7 @@ static const TypeInfo vu_i2c_info = {
     .parent = TYPE_VHOST_USER_BASE,
     .instance_size = sizeof(VHostUserI2C),
     .class_init = vu_i2c_class_init,
+    .secure = true,
 };
 
 static void vu_i2c_register_types(void)
diff --git a/hw/virtio/vhost-user-input.c b/hw/virtio/vhost-user-input.c
index 5cfc5bbb56..a850e3770e 100644
--- a/hw/virtio/vhost-user-input.c
+++ b/hw/virtio/vhost-user-input.c
@@ -47,6 +47,7 @@ static const TypeInfo vhost_input_info = {
     .parent        = TYPE_VHOST_USER_BASE,
     .instance_size = sizeof(VHostUserInput),
     .class_init    = vhost_input_class_init,
+    .secure        = true,
 };
 
 static void vhost_input_register_types(void)
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 106c8f211a..dc1286559c 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -55,6 +55,7 @@ static const TypeInfo vu_rng_info = {
     .parent = TYPE_VHOST_USER_BASE,
     .instance_size = sizeof(VHostUserRNG),
     .class_init = vu_rng_class_init,
+    .secure = true,
 };
 
 static void vu_rng_register_types(void)
diff --git a/hw/virtio/vhost-user-rtc.c b/hw/virtio/vhost-user-rtc.c
index 88b0c70b90..2cb949590e 100644
--- a/hw/virtio/vhost-user-rtc.c
+++ b/hw/virtio/vhost-user-rtc.c
@@ -54,6 +54,7 @@ static const TypeInfo vu_rtc_info = {
     .parent = TYPE_VHOST_USER_BASE,
     .instance_size = sizeof(VHostUserRTC),
     .class_init = vu_rtc_class_init,
+    .secure = true,
 };
 
 static void vu_rtc_register_types(void)
diff --git a/hw/virtio/vhost-user-scmi.c b/hw/virtio/vhost-user-scmi.c
index 02dc088ea9..c5f7f0afb0 100644
--- a/hw/virtio/vhost-user-scmi.c
+++ b/hw/virtio/vhost-user-scmi.c
@@ -310,6 +310,7 @@ static const TypeInfo vu_scmi_info = {
     .parent = TYPE_VIRTIO_DEVICE,
     .instance_size = sizeof(VHostUserSCMI),
     .class_init = vu_scmi_class_init,
+    .secure = true,
 };
 
 static void vu_scmi_register_types(void)
diff --git a/hw/virtio/vhost-user-snd.c b/hw/virtio/vhost-user-snd.c
index 7129b77d9c..3695534aa2 100644
--- a/hw/virtio/vhost-user-snd.c
+++ b/hw/virtio/vhost-user-snd.c
@@ -72,6 +72,7 @@ static const TypeInfo vu_snd_info = {
     .parent = TYPE_VHOST_USER_BASE,
     .instance_size = sizeof(VHostUserSound),
     .class_init = vu_snd_class_init,
+    .secure = true,
 };
 
 static void vu_snd_register_types(void)
diff --git a/hw/virtio/vhost-user-spi.c b/hw/virtio/vhost-user-spi.c
index 707f96c250..58d5fd7b46 100644
--- a/hw/virtio/vhost-user-spi.c
+++ b/hw/virtio/vhost-user-spi.c
@@ -55,6 +55,7 @@ static const TypeInfo vu_spi_info = {
     .parent = TYPE_VHOST_USER_BASE,
     .instance_size = sizeof(VHostUserSPI),
     .class_init = vu_spi_class_init,
+    .secure = true,
 };
 
 static void vu_spi_register_types(void)
diff --git a/hw/virtio/vhost-user-test-device.c b/hw/virtio/vhost-user-test-device.c
index a2f963fdf6..73da8af48a 100644
--- a/hw/virtio/vhost-user-test-device.c
+++ b/hw/virtio/vhost-user-test-device.c
@@ -50,6 +50,7 @@ static const TypeInfo vud_info = {
     .name = TYPE_VHOST_USER_TEST_DEVICE,
     .parent = TYPE_VHOST_USER_BASE,
     .class_init = vud_class_init,
+    .secure = true,
 };
 
 static void vu_register_types(void)
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index c2cd376e73..e10ceb95cb 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -175,6 +175,7 @@ static const TypeInfo vuv_info = {
     .parent = TYPE_VHOST_VSOCK_COMMON,
     .instance_size = sizeof(VHostUserVSock),
     .class_init = vuv_class_init,
+    .secure = true,
 };
 
 static void vuv_register_types(void)
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index b79f4c9ce6..01f7dea6f5 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -309,6 +309,7 @@ static const TypeInfo vhost_vsock_common_info = {
     .instance_size = sizeof(VHostVSockCommon),
     .class_init = vhost_vsock_common_class_init,
     .abstract = true,
+    .secure = true,
 };
 
 static void vhost_vsock_common_register_types(void)
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index da244eb165..66a17ee15f 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -225,6 +225,7 @@ static const TypeInfo vhost_vsock_info = {
     .parent = TYPE_VHOST_VSOCK_COMMON,
     .instance_size = sizeof(VHostVSock),
     .class_init = vhost_vsock_class_init,
+    .secure = true,
 };
 
 static void vhost_vsock_register_types(void)
-- 
2.55.0


