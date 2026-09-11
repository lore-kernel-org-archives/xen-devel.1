Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4E4C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417075.1646044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NI-0006lq-SC; Fri, 11 Sep 2026 14:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417075.1646044; Fri, 11 Sep 2026 14:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NI-0006lU-Nf; Fri, 11 Sep 2026 14:37:08 +0000
Received: by outflank-mailman (input) for mailman id 1417075;
 Fri, 11 Sep 2026 14:37:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52NG-0006aK-U2
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:37:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52NG-00EPyQ-Ad
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:37:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41211-8faa-0a2a0a5109dd-0a2a4508a7b8-2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:06 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41210-f659-0a2a45080019-aa0a817ccb6f-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:06 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-teOpK41IPpaV3nA4a5Tv8Q-1; Fri,
 11 Sep 2026 10:37:01 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1159919560BC; Fri, 11 Sep 2026 14:37:00 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3599A300022B; Fri, 11 Sep 2026 14:36:58 +0000 (UTC)
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
	s=mimecast20190719; t=1789137424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cj/OwkAk1e+UKX4NrQR8oViEsggR98ARpU/Hmyqd04o=;
	b=gFfVWYijJM0cTK04yUurARQ3xl9pYr2AkD72ENCWu/6htU3y2ypzfZdMW6epL62WrNb1L8
	iSoZ1npSKPHKDzQ5IY8IhLDjkeAJrFbOuMjEyTL6MUzPWiOAJAQnXCPevX87dkrjQs37a0
	hzuxwCriGzoLAu8UENVY5E2GCNzobL4=
X-MC-Unique: teOpK41IPpaV3nA4a5Tv8Q-1
X-Mimecast-MFC-AGG-ID: teOpK41IPpaV3nA4a5Tv8Q_1789137420
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 13/28] hw/scsi: mark SCSI disk endpoint devices as secure
Date: Fri, 11 Sep 2026 15:36:12 +0100
Message-ID: <20260911143627.2743803-14-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Vea2dxjTXApmPnUJrIoqRfK5Uniu085zyb0Dl__IYHs_1789137420
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1789137426-DFCD387B-A99B15C4/0/0
X-purgate-type: clean
X-purgate-size: 1962

All these devices can be used together with supported SCSI controllers
in a virtualization use case, so must be treated as secure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/scsi/scsi-disk.c    | 4 ++++
 hw/scsi/scsi-generic.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index a42f7d8e77..4474400a38 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -3218,6 +3218,7 @@ static const TypeInfo scsi_disk_base_info = {
     .instance_size = sizeof(SCSIDiskState),
     .class_size    = sizeof(SCSIDiskClass),
     .abstract      = true,
+    .secure        = true,
 };
 
 #define DEFINE_SCSI_DISK_PROPERTIES()                                   \
@@ -3338,6 +3339,7 @@ static const TypeInfo scsi_hd_info = {
     .name          = "scsi-hd",
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_hd_class_initfn,
+    .secure        = true,
 };
 
 static const Property scsi_cd_properties[] = {
@@ -3381,6 +3383,7 @@ static const TypeInfo scsi_cd_info = {
     .name          = "scsi-cd",
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_cd_class_initfn,
+    .secure        = true,
 };
 
 #ifdef __linux__
@@ -3423,6 +3426,7 @@ static const TypeInfo scsi_block_info = {
     .name          = "scsi-block",
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_block_class_initfn,
+    .secure        = true,
 };
 #endif
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 8999f3b720..5588400b60 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -1225,6 +1225,7 @@ static const TypeInfo scsi_generic_info = {
     .parent        = TYPE_SCSI_DEVICE,
     .instance_size = sizeof(SCSIDevice),
     .class_init    = scsi_generic_class_initfn,
+    .secure        = true,
 };
 
 static void scsi_generic_register_types(void)
-- 
2.55.0


