Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CEDC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:39:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417199.1646117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52PU-0005dp-A4; Fri, 11 Sep 2026 14:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417199.1646117; Fri, 11 Sep 2026 14:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52PU-0005di-6n; Fri, 11 Sep 2026 14:39:24 +0000
Received: by outflank-mailman (input) for mailman id 1417199;
 Fri, 11 Sep 2026 14:39:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52PS-0005dZ-VA
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:39:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52PS-002YOl-C3
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:39:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41279-e002-0a2a0a5209dd-0a2a4502a2b6-34
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:39:21 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41220-6ca4-0a2a45020019-aa0a817ce1a3-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:21 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-i4RerftSO0aK-nu0DOj5Rw-1; Fri,
 11 Sep 2026 10:37:16 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 757F7195396B; Fri, 11 Sep 2026 14:37:15 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 69BE13000229; Fri, 11 Sep 2026 14:37:13 +0000 (UTC)
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
	s=mimecast20190719; t=1789137440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxYKHi5v7tz+GMZ37WJGGk/4FLpJ0TR7q5S8Sx5LFw0=;
	b=a5QGiJmA29zF3+QH9Eyei17CDCrGRKhnf2gIcnjH5RW4m8AmnImlmx9lr2Q0ddndm1Cmsl
	IewKgn4Ex5EKEXWjkGEfxKXxfVGOqsL1M5xf0YVTnaS+qvixmnbSLCDGaXLFVaRsj1TWjq
	yApWawm+g/2iSZRP49Fu84xYuiLgk1k=
X-MC-Unique: i4RerftSO0aK-nu0DOj5Rw-1
X-Mimecast-MFC-AGG-ID: i4RerftSO0aK-nu0DOj5Rw_1789137435
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 20/28] hw/audio: mark Intel HDA devices & codecs as secure
Date: Fri, 11 Sep 2026 15:36:19 +0100
Message-ID: <20260911143627.2743803-21-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: nH0m4iIitaD4-bE8UTXjnySWV85butJqAJYYVz_Ksgc_1789137435
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1789137441-678BC2AC-DED402DC/0/0
X-purgate-type: clean
X-purgate-size: 3233

This is traditionally the primary audio backend for x86 as
virtio-snd is a relatively new invention.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/audio/hda-codec.c | 4 ++++
 hw/audio/intel-hda.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index 173fe56bea..05bd35700f 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -858,6 +858,7 @@ static const TypeInfo hda_audio_info = {
     .instance_size = sizeof(HDAAudioState),
     .class_init    = hda_audio_base_class_init,
     .abstract      = true,
+    .secure        = true,
 };
 
 static void hda_audio_output_class_init(ObjectClass *klass, const void *data)
@@ -873,6 +874,7 @@ static const TypeInfo hda_audio_output_info = {
     .name          = "hda-output",
     .parent        = TYPE_HDA_AUDIO,
     .class_init    = hda_audio_output_class_init,
+    .secure        = true,
 };
 
 static void hda_audio_duplex_class_init(ObjectClass *klass, const void *data)
@@ -888,6 +890,7 @@ static const TypeInfo hda_audio_duplex_info = {
     .name          = "hda-duplex",
     .parent        = TYPE_HDA_AUDIO,
     .class_init    = hda_audio_duplex_class_init,
+    .secure        = true,
 };
 
 static void hda_audio_micro_class_init(ObjectClass *klass, const void *data)
@@ -903,6 +906,7 @@ static const TypeInfo hda_audio_micro_info = {
     .name          = "hda-micro",
     .parent        = TYPE_HDA_AUDIO,
     .class_init    = hda_audio_micro_class_init,
+    .secure        = true,
 };
 
 static void hda_audio_register_types(void)
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 3d361a4976..34ca1e713c 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -45,6 +45,7 @@ static const TypeInfo hda_codec_bus_info = {
     .name = TYPE_HDA_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(HDACodecBus),
+    .secure = true,
 };
 
 void hda_codec_bus_init(DeviceState *dev, HDACodecBus *bus, size_t bus_size,
@@ -1265,6 +1266,7 @@ static const TypeInfo intel_hda_info = {
     .instance_size = sizeof(IntelHDAState),
     .class_init    = intel_hda_class_init,
     .abstract      = true,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
@@ -1275,12 +1277,14 @@ static const TypeInfo intel_hda_info_ich6 = {
     .name          = "intel-hda",
     .parent        = TYPE_INTEL_HDA_GENERIC,
     .class_init    = intel_hda_class_init_ich6,
+    .secure        = true,
 };
 
 static const TypeInfo intel_hda_info_ich9 = {
     .name          = "ich9-intel-hda",
     .parent        = TYPE_INTEL_HDA_GENERIC,
     .class_init    = intel_hda_class_init_ich9,
+    .secure        = true,
 };
 
 static void hda_codec_device_class_init(ObjectClass *klass, const void *data)
@@ -1298,6 +1302,7 @@ static const TypeInfo hda_codec_device_type_info = {
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(HDACodecDevice),
     .abstract = true,
+    .secure = true,
     .class_size = sizeof(HDACodecDeviceClass),
     .class_init = hda_codec_device_class_init,
 };
-- 
2.55.0


