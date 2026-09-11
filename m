Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78582C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:39:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417201.1646125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52PX-00063b-HY; Fri, 11 Sep 2026 14:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417201.1646125; Fri, 11 Sep 2026 14:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52PX-00063Q-EW; Fri, 11 Sep 2026 14:39:27 +0000
Received: by outflank-mailman (input) for mailman id 1417201;
 Fri, 11 Sep 2026 14:39:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52PV-0005nQ-Fs
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:39:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52PU-008k5A-I2
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:39:24 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41275-2eae-0a2a0a5409dd-0a2a4505e0b0-40
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:39:24 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41222-4cb1-0a2a45050019-aa0a817cdb89-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:23 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-W42a8qfsNH2p7bdSc5eAqg-1; Fri,
 11 Sep 2026 10:37:19 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9690319541AA; Fri, 11 Sep 2026 14:37:17 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C76CA3000229; Fri, 11 Sep 2026 14:37:15 +0000 (UTC)
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
	s=mimecast20190719; t=1789137442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEyJiloIxtptu0W9QtcTvVPDda5vfdApyxEeJL8U5FU=;
	b=WUUgZSvVfdA5XUWUE3nyUAuBSv/tS7e8UxxPbJOb/3deIMCtkoJWRGD5AbM5yUsn8Co7Jy
	vdQWHUH6jKjUq4yIZWnn0BwkGH+uGtHoMS9Yv0NVdHqdbcQBLNue8MIwVSpy2CT3389WWZ
	GZCXG5UQ8sRNOsJaOHvqCNLId5L+Lbc=
X-MC-Unique: W42a8qfsNH2p7bdSc5eAqg-1
X-Mimecast-MFC-AGG-ID: W42a8qfsNH2p7bdSc5eAqg_1789137437
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 21/28] hw/char: mark common serial / console devicess a secure
Date: Fri, 11 Sep 2026 15:36:20 +0100
Message-ID: <20260911143627.2743803-22-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: egqsuJbCNv6NvGCHPcrj9xmModWFebiQUSDHOyWFhAA_1789137437
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1789137443-F7CB82A1-49007513/0/0
X-purgate-type: clean
X-purgate-size: 3524

These are needed as a baseline feature for many virtualization use
cases on x86, PPC64 and s390x.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/char/debugcon.c       | 1 +
 hw/char/sclpconsole-lm.c | 1 +
 hw/char/sclpconsole.c    | 1 +
 hw/char/serial-isa.c     | 1 +
 hw/char/serial-pci.c     | 1 +
 hw/char/serial.c         | 1 +
 hw/char/spapr_vty.c      | 1 +
 7 files changed, 7 insertions(+)

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index a1b370b90b..f38ce7b765 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -134,6 +134,7 @@ static const TypeInfo debugcon_isa_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(ISADebugconState),
     .class_init    = debugcon_isa_class_initfn,
+    .secure        = true,
 };
 
 static void debugcon_register_types(void)
diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
index f6ed282f1b..4261652735 100644
--- a/hw/char/sclpconsole-lm.c
+++ b/hw/char/sclpconsole-lm.c
@@ -363,6 +363,7 @@ static const TypeInfo sclp_console_info = {
     .instance_size = sizeof(SCLPConsoleLM),
     .class_init    = console_class_init,
     .class_size    = sizeof(SCLPEventClass),
+    .secure        = true,
 };
 
 static void register_types(void)
diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
index 179d12745c..04a951089a 100644
--- a/hw/char/sclpconsole.c
+++ b/hw/char/sclpconsole.c
@@ -278,6 +278,7 @@ static const TypeInfo sclp_console_info = {
     .instance_size = sizeof(SCLPConsole),
     .class_init    = console_class_init,
     .class_size    = sizeof(SCLPEventClass),
+    .secure        = true,
 };
 
 static void register_types(void)
diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index eaa4e843c0..5df87590b7 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -147,6 +147,7 @@ static const TypeInfo serial_isa_info = {
     .instance_size = sizeof(ISASerialState),
     .instance_init = serial_isa_initfn,
     .class_init    = serial_isa_class_initfn,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_ACPI_DEV_AML_IF },
         { },
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index d8cacc9085..183091ea41 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -109,6 +109,7 @@ static const TypeInfo serial_pci_info = {
     .instance_size = sizeof(PCISerialState),
     .instance_init = serial_pci_init,
     .class_init    = serial_pci_class_initfn,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 4339562ab0..fefd2cf9fc 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -984,6 +984,7 @@ static const TypeInfo serial_info = {
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(SerialState),
     .class_init = serial_class_init,
+    .secure = true,
 };
 
 static void serial_register_types(void)
diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
index 1dd9fb155c..96a4e58ad9 100644
--- a/hw/char/spapr_vty.c
+++ b/hw/char/spapr_vty.c
@@ -201,6 +201,7 @@ static const TypeInfo spapr_vty_info = {
     .parent        = TYPE_VIO_SPAPR_DEVICE,
     .instance_size = sizeof(SpaprVioVty),
     .class_init    = spapr_vty_class_init,
+    .secure        = true,
 };
 
 SpaprVioDevice *spapr_vty_get_default(SpaprVioBus *bus)
-- 
2.55.0


