Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB97C88E58
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:39:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417207.1646134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Pc-0006Kv-Nq; Fri, 11 Sep 2026 14:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417207.1646134; Fri, 11 Sep 2026 14:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Pc-0006Kk-KM; Fri, 11 Sep 2026 14:39:32 +0000
Received: by outflank-mailman (input) for mailman id 1417207;
 Fri, 11 Sep 2026 14:39:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52Pb-0006Jp-Ob
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:39:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Pb-008k5A-54
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:39:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41280-2eae-0a2a0a5409dd-0a2a45039fec-34
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:39:31 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41229-fae8-0a2a45030019-aa0a817cb83d-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:30 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-snL57JxmM_i6WZC-vCI9tQ-1; Fri,
 11 Sep 2026 10:37:26 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 398031955DD1; Fri, 11 Sep 2026 14:37:24 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 69BE23000229; Fri, 11 Sep 2026 14:37:22 +0000 (UTC)
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
	s=mimecast20190719; t=1789137449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNbkkFHCYKpbxfWO4D+I7H8XxjKgGoTqJimeW8ycrfY=;
	b=WXyBeFZ9AySlJ1F+vco5uWIpC5zz/McJmXRjSosN4O0quXa3vtqF56Jbn6/b4Bi0l/38Qw
	G1IRAODGVZ2A8eckarPKjqVn/WlmC+TnFrfpKkvB/q8JGo243h/MjrmEcGYil4CdD5/716
	IjJdZX00fKKgNAey/zQNQHs+5d9/lEY=
X-MC-Unique: snL57JxmM_i6WZC-vCI9tQ-1
X-Mimecast-MFC-AGG-ID: snL57JxmM_i6WZC-vCI9tQ_1789137444
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 24/28] hw/acpi: mark erst, vmclock and vmgenid devices as secure
Date: Fri, 11 Sep 2026 15:36:23 +0100
Message-ID: <20260911143627.2743803-25-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Hl9n_7seTJtGRNdjwWJHf7YIsI3TepTT0LKda-XYXZ8_1789137444
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1789137451-74A894E9-10EC1B5B/13/0
X-purgate-type: clean
X-purgate-size: 1585

These are all used in virtualization scenarios so must be
declare to provide a security boundary

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/acpi/erst.c    | 1 +
 hw/acpi/vmclock.c | 1 +
 hw/acpi/vmgenid.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index b6c1942e30..44560004a5 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -1044,6 +1044,7 @@ static const TypeInfo erst_type_info = {
     .parent        = TYPE_PCI_DEVICE,
     .class_init    = erst_class_init,
     .instance_size = sizeof(ERSTDeviceState),
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { }
diff --git a/hw/acpi/vmclock.c b/hw/acpi/vmclock.c
index d51cab2e20..b545354600 100644
--- a/hw/acpi/vmclock.c
+++ b/hw/acpi/vmclock.c
@@ -169,6 +169,7 @@ static const TypeInfo vmclock_device_info = {
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(VmclockState),
     .class_init    = vmclock_device_class_init,
+    .secure        = true,
 };
 
 static void vmclock_register_types(void)
diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 27cc0128d1..67f815d8a1 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -236,6 +236,7 @@ static const TypeInfo vmgenid_device_info = {
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(VmGenIdState),
     .class_init    = vmgenid_device_class_init,
+    .secure        = true,
 };
 
 static void vmgenid_register_types(void)
-- 
2.55.0


