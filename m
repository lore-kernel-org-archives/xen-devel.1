Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF464C88E58
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:36:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417047.1645956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Mu-0003FM-Io; Fri, 11 Sep 2026 14:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417047.1645956; Fri, 11 Sep 2026 14:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Mu-0003ER-AV; Fri, 11 Sep 2026 14:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1417047;
 Fri, 11 Sep 2026 14:36:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52Mt-000396-Dc
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:36:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Ms-00EPw8-QW
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:36:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa411f2-2eae-0a2a0a5409dd-0a2a4507d898-14
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:42 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa411f9-b4ea-0a2a45070019-aa0a817ca483-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:42 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-oGNVjD9aMeyt3IjX5GvwDg-1; Fri,
 11 Sep 2026 10:36:38 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9196619540D3; Fri, 11 Sep 2026 14:36:37 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 95C273000229; Fri, 11 Sep 2026 14:36:35 +0000 (UTC)
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
	s=mimecast20190719; t=1789137401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVwGPfL+WLnUP8giUYwqDBNb4zonggDSk3sHSYr9pFM=;
	b=QLZ3fYdWo4uUcoSpAKIfayVPZQJ8Zr8bFu9mlgB0cdHMlXHi9LtQ9VSnwb6Xf79s/jl576
	R6QqHGxCCClCh+CkG4AFkERoJ7mbexJVCu+FrqIQVWXuZ+sIkY0tR4GYHeAegTUwC4fok6
	R1VwYe+u4WSnTuoY7eaSmctk2QYX7ps=
X-MC-Unique: oGNVjD9aMeyt3IjX5GvwDg-1
X-Mimecast-MFC-AGG-ID: oGNVjD9aMeyt3IjX5GvwDg_1789137397
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 03/28] hw: mark all virtio PCI devices as secure
Date: Fri, 11 Sep 2026 15:36:02 +0100
Message-ID: <20260911143627.2743803-4-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: sKibLlbCUh-YD9421UNZra0ZmkXzFTqHWncGr04mDrE_1789137397
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1789137402-364DBAE4-F17CDF5E/0/0
X-purgate-type: clean
X-purgate-size: 3170

These are all intended for use in a virtualization scenario and must
provide a security boundary. This can be done for almost all virtio
PCI devices by modifying the common type register helper.

The virtio-gpu devices are unusual in not using the common
virtio_pci_types_register() method, so need marking directly.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/display/virtio-gpu-pci-rutabaga.c | 1 +
 hw/display/virtio-gpu-pci.c          | 3 ++-
 hw/virtio/virtio-pci.c               | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-pci-rutabaga.c b/hw/display/virtio-gpu-pci-rutabaga.c
index 4db77cb868..a8e5e1d96c 100644
--- a/hw/display/virtio-gpu-pci-rutabaga.c
+++ b/hw/display/virtio-gpu-pci-rutabaga.c
@@ -34,6 +34,7 @@ static const TypeInfo virtio_gpu_rutabaga_pci_info[] = {
         .parent = TYPE_VIRTIO_GPU_PCI_BASE,
         .instance_size = sizeof(VirtIOGPURutabagaPCI),
         .instance_init = virtio_gpu_rutabaga_initfn,
+        .secure = true,
         .interfaces = (const InterfaceInfo[]) {
             { INTERFACE_CONVENTIONAL_PCI_DEVICE },
             { },
diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index 22659ca196..0b0d926a5b 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -75,7 +75,8 @@ static const TypeInfo virtio_gpu_pci_base_info = {
     .parent = TYPE_VIRTIO_PCI,
     .instance_size = sizeof(VirtIOGPUPCIBase),
     .class_init = virtio_gpu_pci_base_class_init,
-    .abstract = true
+    .abstract = true,
+    .secure = true,
 };
 module_obj(TYPE_VIRTIO_GPU_PCI_BASE);
 module_kconfig(VIRTIO_PCI);
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 6f5db5fc42..cd5fe8f1d8 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -2520,6 +2520,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
         .name = t->generic_name,
         .parent = base_type_info.name,
         .class_init = virtio_pci_generic_class_init,
+        .secure = true,
         .interfaces = (const InterfaceInfo[]) {
             { INTERFACE_PCIE_DEVICE },
             { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -2555,6 +2556,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
             .name          = t->non_transitional_name,
             .parent        = base_type_info.name,
             .instance_init = virtio_pci_non_transitional_instance_init,
+            .secure = true,
             .interfaces = (const InterfaceInfo[]) {
                 { INTERFACE_PCIE_DEVICE },
                 { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -2569,6 +2571,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
             .name          = t->transitional_name,
             .parent        = base_type_info.name,
             .instance_init = virtio_pci_transitional_instance_init,
+            .secure = true,
             .interfaces = (const InterfaceInfo[]) {
                 /*
                  * Transitional virtio devices work only as Conventional PCI
-- 
2.55.0


