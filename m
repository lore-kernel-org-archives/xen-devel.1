Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE856C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:40:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417229.1646174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Q1-0008ES-Cf; Fri, 11 Sep 2026 14:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417229.1646174; Fri, 11 Sep 2026 14:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Q1-0008DA-81; Fri, 11 Sep 2026 14:39:57 +0000
Received: by outflank-mailman (input) for mailman id 1417229;
 Fri, 11 Sep 2026 14:39:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52Q0-00088v-9x
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:39:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Pz-008k9B-NA
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:39:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4129d-2eae-0a2a0a5409dd-0a2a450caa0c-40
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:39:55 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41242-f479-0a2a450c0019-aa0a817c7e07-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:55 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-GrM6ooB6MO2NkU78jUtD2w-1; Fri,
 11 Sep 2026 10:37:49 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B06671964CF6; Fri, 11 Sep 2026 14:37:28 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CE51C3000229; Fri, 11 Sep 2026 14:37:26 +0000 (UTC)
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
	bh=SO3n0XnxHzcPurmZyEeQNszEXfuag/bmU5uMUoRgi50=;
	b=CFGAVvtWQ9OZwknxW4CvfR8Y8WjDdZSIBTb67ETn1z3I5MMs40uzTbTTga64asB40IKanE
	YlwYCmil6+AFbXWny6a+79O1ivJ+2TdCmqk9wUnLNR856WoQu1l3nv3TiGKoO+a0uzkSdJ
	ZXteivq2lVkykkCl7y14vxVQcYRRfoE=
X-MC-Unique: GrM6ooB6MO2NkU78jUtD2w-1
X-Mimecast-MFC-AGG-ID: GrM6ooB6MO2NkU78jUtD2w_1789137468
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 26/28] hw: device AMD, Intel and ARM IOMMUs as secure
Date: Fri, 11 Sep 2026 15:36:25 +0100
Message-ID: <20260911143627.2743803-27-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 8yJ4KcJvqjEf0wAftGKlHyimbOHnv3vi5TToXDEvQUQ_1789137468
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1789137475-51538A5B-8481F200/0/0
X-purgate-type: clean
X-purgate-size: 2741

These are needed in virtualization use cases to support PCI device
assignment use cases so must provide a security boundary.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/arm/smmu-common.c  | 1 +
 hw/arm/smmuv3.c       | 2 ++
 hw/i386/amd_iommu.c   | 4 +++-
 hw/i386/intel_iommu.c | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 8e40ba603d..bca9a32e9f 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -1040,6 +1040,7 @@ static const TypeInfo smmu_base_info = {
     .class_size    = sizeof(SMMUBaseClass),
     .class_init    = smmu_base_class_init,
     .abstract      = true,
+    .secure        = true,
 };
 
 static void smmu_base_register_types(void)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ed19536a4d..2a9721b87e 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -2272,12 +2272,14 @@ static const TypeInfo smmuv3_type_info = {
     .instance_init = smmuv3_instance_init,
     .class_size    = sizeof(SMMUv3Class),
     .class_init    = smmuv3_class_init,
+    .secure        = true,
 };
 
 static const TypeInfo smmuv3_iommu_memory_region_info = {
     .parent = TYPE_IOMMU_MEMORY_REGION,
     .name = TYPE_SMMUV3_IOMMU_MEMORY_REGION,
     .class_init = smmuv3_iommu_memory_region_class_init,
+    .secure = true,
 };
 
 static void smmuv3_register_types(void)
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 578c27ccbe..3192609ba0 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -2783,7 +2783,8 @@ static const TypeInfo amdvi_sysbus = {
     .name = TYPE_AMD_IOMMU_DEVICE,
     .parent = TYPE_X86_IOMMU_DEVICE,
     .instance_size = sizeof(AMDVIState),
-    .class_init = amdvi_sysbus_class_init
+    .class_init = amdvi_sysbus_class_init,
+    .secure = true,
 };
 
 static void amdvi_pci_class_init(ObjectClass *klass, const void *data)
@@ -2805,6 +2806,7 @@ static const TypeInfo amdvi_pci = {
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(AMDVIPCIState),
     .class_init = amdvi_pci_class_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 82c3c3b2c3..20e44590ca 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -5687,6 +5687,7 @@ static const TypeInfo vtd_info = {
     .parent        = TYPE_X86_IOMMU_DEVICE,
     .instance_size = sizeof(IntelIOMMUState),
     .class_init    = vtd_class_init,
+    .secure        = true,
 };
 
 static int vtd_attrs_to_index(IOMMUMemoryRegion *iommu_mr, MemTxAttrs attrs)
-- 
2.55.0


