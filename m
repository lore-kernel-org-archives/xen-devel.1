Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA3CC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417103.1646095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NT-0000VS-MJ; Fri, 11 Sep 2026 14:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417103.1646095; Fri, 11 Sep 2026 14:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NT-0000U3-98; Fri, 11 Sep 2026 14:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1417103;
 Fri, 11 Sep 2026 14:37:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52NR-0000Eu-M7
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52NR-002Y6Q-34
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:37:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41211-8faa-0a2a0a5109dd-0a2a4508a7b8-20
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:17 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4121b-f659-0a2a45080019-aa0a857c7fe5-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:16 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-4E2YGmFpOKqs7_tv22KEXQ-1; Fri,
 11 Sep 2026 10:37:14 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 183951801352; Fri, 11 Sep 2026 14:37:13 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 31F6E3000229; Fri, 11 Sep 2026 14:37:11 +0000 (UTC)
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
	s=mimecast20190719; t=1789137435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xemsx/xBv0DEBitYLoiJ5cnvCREZhOyx4JVbgw8hygU=;
	b=LdPE0R3FcpJ++zjxQmOQhbh9Qu4vffEPSesGKfLqJiHeN5hiAgziRbxJx3Nl2wLPLdfTVo
	xgGnX2yieKeQi8xL/N/xtIUDEPSLEpRADJuhcag+qd3DMJiYbR7S5PSUKU7CnFKq+YNpd3
	bWk1cxrv5cIVXEO8uOfJTYzQLYYdg8w=
X-MC-Unique: 4E2YGmFpOKqs7_tv22KEXQ-1
X-Mimecast-MFC-AGG-ID: 4E2YGmFpOKqs7_tv22KEXQ_1789137433
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 19/28] hw/misc: mark pvpanic, vmcoreinfo as secure
Date: Fri, 11 Sep 2026 15:36:18 +0100
Message-ID: <20260911143627.2743803-20-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: t3IsF9gWR1tzs7xkqtSHsRHnRX9KeL27IhDv_jqKFvM_1789137433
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1789137437-D534D87B-836A52B1/0/0
X-purgate-type: clean
X-purgate-size: 2171

The first two devices are common debug aids for virtualized
guests so must be marked secure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/misc/pvpanic-isa.c  | 1 +
 hw/misc/pvpanic-mmio.c | 1 +
 hw/misc/pvpanic-pci.c  | 1 +
 hw/misc/vmcoreinfo.c   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
index 85fb7da5e5..bb0a7ff6f8 100644
--- a/hw/misc/pvpanic-isa.c
+++ b/hw/misc/pvpanic-isa.c
@@ -121,6 +121,7 @@ static const TypeInfo pvpanic_isa_info = {
     .instance_size = sizeof(PVPanicISAState),
     .instance_init = pvpanic_isa_initfn,
     .class_init    = pvpanic_isa_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_ACPI_DEV_AML_IF },
         { },
diff --git a/hw/misc/pvpanic-mmio.c b/hw/misc/pvpanic-mmio.c
index a173a1a9a5..161e8fc59b 100644
--- a/hw/misc/pvpanic-mmio.c
+++ b/hw/misc/pvpanic-mmio.c
@@ -50,6 +50,7 @@ static const TypeInfo pvpanic_mmio_info = {
     .instance_size = sizeof(PVPanicMMIOState),
     .instance_init = pvpanic_mmio_initfn,
     .class_init    = pvpanic_mmio_class_init,
+    .secure        = true,
 };
 
 static void pvpanic_register_types(void)
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
index 5509f70a3e..7d1f99d564 100644
--- a/hw/misc/pvpanic-pci.c
+++ b/hw/misc/pvpanic-pci.c
@@ -80,6 +80,7 @@ static const TypeInfo pvpanic_pci_info = {
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PVPanicPCIState),
     .class_init    = pvpanic_pci_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { }
diff --git a/hw/misc/vmcoreinfo.c b/hw/misc/vmcoreinfo.c
index 9c2e9005ad..90f361b05f 100644
--- a/hw/misc/vmcoreinfo.c
+++ b/hw/misc/vmcoreinfo.c
@@ -101,6 +101,7 @@ static const TypeInfo vmcoreinfo_types[] = {
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(VMCoreInfoState),
         .class_init     = vmcoreinfo_device_class_init,
+        .secure         = true,
     }
 };
 
-- 
2.55.0


