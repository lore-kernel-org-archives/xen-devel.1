Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF3AC88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417071.1646035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NF-0006G3-Ku; Fri, 11 Sep 2026 14:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417071.1646035; Fri, 11 Sep 2026 14:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NF-0006FY-ED; Fri, 11 Sep 2026 14:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1417071;
 Fri, 11 Sep 2026 14:37:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52ND-00067i-R9
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:37:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52ND-00EPyQ-7N
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:37:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa411f1-8faa-0a2a0a5109dd-0a2a45049838-46
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:03 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4120d-b57f-0a2a45040019-aa0a817c6de1-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:03 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-531-wrbZ1KXtOUmB-87brWnyCw-1; Fri,
 11 Sep 2026 10:36:56 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2FA881955BF8; Fri, 11 Sep 2026 14:36:55 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5989F3000229; Fri, 11 Sep 2026 14:36:53 +0000 (UTC)
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
	s=mimecast20190719; t=1789137421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkE3LclKvU9GiqQKtRj7Fj+wyH19sYMsxkpF53QZWX4=;
	b=C9ab3bM5maw/uL9vXD2PLK/umYyGIwwgduEKF8GRmR4JOdhF9UBL4OUiPaiWpXViqXwMur
	Z6QbdixJ7beZ/sVQxDoDJBRhqnpfh613zIAKUmgSAXaTsEaXNnVLAYJTcoJVAEolO+9wc6
	OyNCJKHjmDmCcNH14UVHnUeaaiyK2Eo=
X-MC-Unique: wrbZ1KXtOUmB-87brWnyCw-1
X-Mimecast-MFC-AGG-ID: wrbZ1KXtOUmB-87brWnyCw_1789137415
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 11/28] hw/watchdog: mark some watchdog devices as secure
Date: Fri, 11 Sep 2026 15:36:10 +0100
Message-ID: <20260911143627.2743803-12-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: dYANc0Ge3XFlqyIult2wRomxZKZRO5Q5r2jN6ooQbqM_1789137415
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1789137423-526CAB50-F2472737/0/0
X-purgate-type: clean
X-purgate-size: 2833

The ib700, i6300esb, gwdt, spapr and diag288 watchdog devices are marked
as secure since they have traditionally been, or are intended to be,
used in virtualization use cases on x86, arm, ppc and s390x architectures
respectively. Other watchdogs are primarily for emulation.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/watchdog/sbsa_gwdt.c      | 1 +
 hw/watchdog/spapr_watchdog.c | 1 +
 hw/watchdog/wdt_diag288.c    | 1 +
 hw/watchdog/wdt_i6300esb.c   | 1 +
 hw/watchdog/wdt_ib700.c      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
index 330a74798a..8a05b02c4f 100644
--- a/hw/watchdog/sbsa_gwdt.c
+++ b/hw/watchdog/sbsa_gwdt.c
@@ -307,6 +307,7 @@ static const TypeInfo wdt_sbsa_gwdt_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .name  = TYPE_WDT_SBSA,
     .instance_size  = sizeof(SBSA_GWDTState),
+    .secure = true,
 };
 
 static void wdt_sbsa_gwdt_register_types(void)
diff --git a/hw/watchdog/spapr_watchdog.c b/hw/watchdog/spapr_watchdog.c
index 5a72896066..0e45e9b4a6 100644
--- a/hw/watchdog/spapr_watchdog.c
+++ b/hw/watchdog/spapr_watchdog.c
@@ -269,6 +269,7 @@ static const TypeInfo spapr_wdt_info = {
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(SpaprWatchdog),
     .class_init    = spapr_wdt_class_init,
+    .secure        = true,
 };
 
 static void spapr_watchdog_register_types(void)
diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
index 1275353e8e..85e4f56e1d 100644
--- a/hw/watchdog/wdt_diag288.c
+++ b/hw/watchdog/wdt_diag288.c
@@ -129,6 +129,7 @@ static const TypeInfo wdt_diag288_info = {
     .name  = TYPE_WDT_DIAG288,
     .instance_size  = sizeof(DIAG288State),
     .class_size = sizeof(DIAG288Class),
+    .secure = true,
 };
 
 static void wdt_diag288_register_types(void)
diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 3aa01b8d68..05aa20fab1 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -480,6 +480,7 @@ static const TypeInfo i6300esb_info = {
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(I6300State),
     .class_init    = i6300esb_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index 51a26a4cbb..8bf2b2fbf9 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -144,6 +144,7 @@ static const TypeInfo wdt_ib700_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(IB700State),
     .class_init    = wdt_ib700_class_init,
+    .secure        = true,
 };
 
 static void wdt_ib700_register_types(void)
-- 
2.55.0


