Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DAEC88E58
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417076.1646049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NJ-0006pN-B1; Fri, 11 Sep 2026 14:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417076.1646049; Fri, 11 Sep 2026 14:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NJ-0006oM-0z; Fri, 11 Sep 2026 14:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1417076;
 Fri, 11 Sep 2026 14:37:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52NH-0006fT-Od
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:37:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52NH-009XnU-5H
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:37:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41210-e002-0a2a0a5209dd-0a2a4502c8a4-6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:07 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41211-6ca4-0a2a45020019-aa0a817cbd89-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:06 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-xHo6mdTZMTKAVWBSvC2yUw-1; Fri,
 11 Sep 2026 10:36:59 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D7F641801352; Fri, 11 Sep 2026 14:36:57 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 82D103000229; Fri, 11 Sep 2026 14:36:55 +0000 (UTC)
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
	s=mimecast20190719; t=1789137425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LU2oz7xA3+OY2WcVfZSc+OLR7VAsrbJYBWSzg698kcA=;
	b=ZtTY1ULFdgpXW3HorKgf0rCy67ZZCi0xyN/ZN4tGTFonVEhG0PTOnS5Co1iRpfPRX3YNPb
	wJeIynTgk7uDJGLnWBHjCWmZM4onN8X74Mj+2UB3YMsbooknvQuMUVBl7nGECzfKiHjnRO
	t+cisMMdbNaf+dxFtWL1YHZN8fYx9sI=
X-MC-Unique: xHo6mdTZMTKAVWBSvC2yUw-1
X-Mimecast-MFC-AGG-ID: xHo6mdTZMTKAVWBSvC2yUw_1789137418
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 12/28] hw/scsi: mark spapr and vmware SCSI controllers as secure
Date: Fri, 11 Sep 2026 15:36:11 +0100
Message-ID: <20260911143627.2743803-13-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 5x3rV3bvcSOi1bhHBcZFKMSjNU1du5Gh3sSHjelpaTY_1789137418
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1789137427-F04A62AC-0C6DD099/0/0
X-purgate-type: clean
X-purgate-size: 1271

The spapr vscsi controller is used by default with spapr machines
in a virtualization use case. The vmware SCSI controller supports
a virtualization use case.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/scsi/spapr_vscsi.c | 1 +
 hw/scsi/vmw_pvscsi.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index b4c8f94d22..f029a7da93 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -1298,6 +1298,7 @@ static const TypeInfo spapr_vscsi_info = {
     .parent        = TYPE_VIO_SPAPR_DEVICE,
     .instance_size = sizeof(VSCSIState),
     .class_init    = spapr_vscsi_class_init,
+    .secure        = true,
 };
 
 static void spapr_vscsi_register_types(void)
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 05f93171cd..9974930634 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -1355,6 +1355,7 @@ static const TypeInfo pvscsi_info = {
     .instance_size = sizeof(PVSCSIState),
     .class_init    = pvscsi_class_init,
     .instance_init = pvscsi_instance_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
         { INTERFACE_PCIE_DEVICE },
-- 
2.55.0


