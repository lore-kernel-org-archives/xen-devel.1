Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11795C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:40:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417228.1646171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Q1-00089y-3L; Fri, 11 Sep 2026 14:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417228.1646171; Fri, 11 Sep 2026 14:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Q0-00089o-Uv; Fri, 11 Sep 2026 14:39:56 +0000
Received: by outflank-mailman (input) for mailman id 1417228;
 Fri, 11 Sep 2026 14:39:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52Q0-00088q-6d
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:39:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Pz-008k9i-Jt
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:39:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa412aa-bab6-0a2a0a5309dd-0a2a4509a44a-24
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:39:55 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41242-be1a-0a2a45090019-aa0a817c9f27-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:55 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-yBd4u00wMKm-TAHlAmivtQ-1; Fri,
 11 Sep 2026 10:37:49 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 07F5B1944F0D; Fri, 11 Sep 2026 14:37:31 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0D1A6300022B; Fri, 11 Sep 2026 14:37:28 +0000 (UTC)
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
	s=mimecast20190719; t=1789137474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ntaO5zXCqDIHHnqqZoaRC9y/DkKQ0xZ5Zjqm3Fkdzdk=;
	b=jIH2ObkjtaCrlTY+03reZcp750ki0cwT+c4c6umPQ6vGwKoIEaR/UFgalvoh/FZG8vJ904
	6wdLE4QbGwFxJeGjDMzdwxmjbvia+ZYJPmE4eyA83Se2NucqrE6fgVu/J1g0qxqC9qrCVk
	dvXHsIx4TV3/ITXqeESbNRFia3pSSeg=
X-MC-Unique: yBd4u00wMKm-TAHlAmivtQ-1
X-Mimecast-MFC-AGG-ID: yBd4u00wMKm-TAHlAmivtQ_1789137468
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 27/28] hw/input: mark PS/2 and PC Keyboard devices as secure
Date: Fri, 11 Sep 2026 15:36:26 +0100
Message-ID: <20260911143627.2743803-28-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 8zb5lcpadP9NJ7uyTKxB8Vt3yEpNmKKtAXMyMP7YCu8_1789137468
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1789137475-3B2DC034-43FFF7B4/0/0
X-purgate-type: clean
X-purgate-size: 1978

These are part of the baseline x86 featureset so required for
virtualization use cases.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/input/pckbd.c | 3 ++-
 hw/input/ps2.c   | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index b09c3bce93..0250252cd6 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -766,7 +766,8 @@ static const TypeInfo i8042_mmio_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_init = i8042_mmio_init,
     .instance_size = sizeof(MMIOKBDState),
-    .class_init    = i8042_mmio_class_init
+    .class_init    = i8042_mmio_class_init,
+    .secure        = true,
 };
 
 void i8042_isa_mouse_fake_event(ISAKBDState *isa)
diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 01af4350b3..8588f39f99 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1293,7 +1293,8 @@ static const TypeInfo ps2_kbd_info = {
     .name          = TYPE_PS2_KBD_DEVICE,
     .parent        = TYPE_PS2_DEVICE,
     .instance_size = sizeof(PS2KbdState),
-    .class_init    = ps2_kbd_class_init
+    .class_init    = ps2_kbd_class_init,
+    .secure        = true,
 };
 
 static void ps2_mouse_class_init(ObjectClass *klass, const void *data)
@@ -1313,7 +1314,8 @@ static const TypeInfo ps2_mouse_info = {
     .name          = TYPE_PS2_MOUSE_DEVICE,
     .parent        = TYPE_PS2_DEVICE,
     .instance_size = sizeof(PS2MouseState),
-    .class_init    = ps2_mouse_class_init
+    .class_init    = ps2_mouse_class_init,
+    .secure        = true,
 };
 
 static void ps2_init(Object *obj)
@@ -1340,7 +1342,8 @@ static const TypeInfo ps2_info = {
     .instance_size = sizeof(PS2State),
     .class_init    = ps2_class_init,
     .class_size    = sizeof(PS2DeviceClass),
-    .abstract      = true
+    .abstract      = true,
+    .secure        = true,
 };
 
 static void ps2_register_types(void)
-- 
2.55.0


