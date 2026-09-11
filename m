Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F578C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:39:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417224.1646160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Pu-0007k2-QZ; Fri, 11 Sep 2026 14:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417224.1646160; Fri, 11 Sep 2026 14:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Pu-0007jJ-Nm; Fri, 11 Sep 2026 14:39:50 +0000
Received: by outflank-mailman (input) for mailman id 1417224;
 Fri, 11 Sep 2026 14:39:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52Ps-0007eB-Lt
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:39:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Ps-008k9i-2k
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:39:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa412aa-bab6-0a2a0a5309dd-0a2a4509a44a-14
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:39:47 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4123a-be1a-0a2a45090019-aa0a817cd06b-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:47 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-509-K8Q0iPxAPu2Rsbr4sUyPuQ-1; Fri,
 11 Sep 2026 10:37:43 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C452D180123E; Fri, 11 Sep 2026 14:37:19 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E727B300022B; Fri, 11 Sep 2026 14:37:17 +0000 (UTC)
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
	s=mimecast20190719; t=1789137466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kxcCgP5PTMsq/qRVeHwqOnLQiiXhy3S28nEGioaumU=;
	b=c2tmHbHmoN6B9wrBze6VobS1WFF5+/qpYqSUFp2ZpgsZy/8dlQmnc4SbTXN3JCupMQfubr
	nRE8dhGlWGqrOcCXaERcxpjnoVjeXdkrAsKDaccuTToJeTJyeKYVisz1604xAJ2QF17oJ0
	KF4iKaAEOkGWnfZ5vm0HBzDhV+BOj2A=
X-MC-Unique: K8Q0iPxAPu2Rsbr4sUyPuQ-1
X-Mimecast-MFC-AGG-ID: K8Q0iPxAPu2Rsbr4sUyPuQ_1789137461
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 22/28] hw/mem: mark nvdimm, pc-dimm & spapr-nvdimm devices as secure
Date: Fri, 11 Sep 2026 15:36:21 +0100
Message-ID: <20260911143627.2743803-23-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: L9eBzhMOFLTgbNKmsAnDW2ZxREGcQk6bb27nofWQXj0_1789137461
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1789137467-FC212034-8097E210/13/0
X-purgate-type: clean
X-purgate-size: 1590

These devices are used in virutalization scenarios to support memory
hotplug and other uses cases.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/mem/nvdimm.c       | 1 +
 hw/mem/pc-dimm.c      | 1 +
 hw/ppc/spapr_nvdimm.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index cf8a4d8c5f..9a57579845 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -275,6 +275,7 @@ static const TypeInfo nvdimm_info = {
     .instance_size = sizeof(NVDIMMDevice),
     .instance_init = nvdimm_init,
     .instance_finalize = nvdimm_finalize,
+    .secure        = true,
 };
 
 static void nvdimm_register_types(void)
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 68862926ee..89fd06724c 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -301,6 +301,7 @@ static const TypeInfo pc_dimm_info = {
     .instance_init = pc_dimm_init,
     .class_init    = pc_dimm_class_init,
     .class_size    = sizeof(PCDIMMDeviceClass),
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_MEMORY_DEVICE },
         { }
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 6647428391..b927cf21b8 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -916,6 +916,7 @@ static TypeInfo spapr_nvdimm_info = {
     .class_size    = sizeof(SPAPRNVDIMMClass),
     .instance_size = sizeof(SpaprNVDIMMDevice),
     .instance_init = spapr_nvdimm_init,
+    .secure        = true,
 };
 
 static void spapr_nvdimm_register_types(void)
-- 
2.55.0


