Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DA2C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:36:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417046.1645950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Mu-0003C4-AI; Fri, 11 Sep 2026 14:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417046.1645950; Fri, 11 Sep 2026 14:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Mu-0003B9-3E; Fri, 11 Sep 2026 14:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1417046;
 Fri, 11 Sep 2026 14:36:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52Mt-000391-3w
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:36:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Ms-00EPyQ-H0
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:36:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa411f8-8faa-0a2a0a5109dd-0a2a4509ca7a-4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:42 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa411f9-be1a-0a2a45090019-aa0a857cdf59-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:42 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-jsyPwnXzMwa2-qmFeiK4Mg-1; Fri,
 11 Sep 2026 10:36:36 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4400F195399C; Fri, 11 Sep 2026 14:36:35 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 52E2B3000229; Fri, 11 Sep 2026 14:36:33 +0000 (UTC)
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
	bh=mS2d1sWvkJvfrpBNzSThHFJjRCwDwl0JUnHIN1+hoNI=;
	b=B25biY9Qzz994SWK9i9RLFyBkOgvaIlxo4DbdGuGN3nKQTwvkrm6TxDyLJo76IJKVkyF7a
	VHdtj8YKxQuDPWZzEkS8UeTKyj1lvv9zz0ZIF/v5fzrPbymYafc2eFpUBEBqTD+egvoT6V
	Mj5G7eHHaVR2T9xodFAlrfsKvUH0K18=
X-MC-Unique: jsyPwnXzMwa2-qmFeiK4Mg-1
X-Mimecast-MFC-AGG-ID: jsyPwnXzMwa2-qmFeiK4Mg_1789137395
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 02/28] accel: mark kvm and xen accelerators as secure
Date: Fri, 11 Sep 2026 15:36:01 +0100
Message-ID: <20260911143627.2743803-3-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: YHsL0aKHNqEwJd45n2MAn31sdpwudyA6UkGfIyKObn0_1789137395
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1789137402-BFAD0034-EE2B1D8F/0/0
X-purgate-type: clean
X-purgate-size: 3224

TCG is too complex to be considered to provide a security boundary
for malicious guest workloads. QTest is only used for functional
testing and thus is not relevant to mark secure.

KVM and Xen are servicing virtualization use cases which must
provide security and actively maintained.

While HVF would be in scope conceptually, it is not sufficiently
mature or maintained to claim a security boundary at this time.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 accel/accel-common.c      | 2 ++
 accel/accel-system.c      | 1 +
 accel/kvm/kvm-accel-ops.c | 1 +
 accel/kvm/kvm-all.c       | 1 +
 accel/xen/xen-all.c       | 2 ++
 5 files changed, 7 insertions(+)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index 00a400243f..1d993f0ad8 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -125,6 +125,7 @@ static const TypeInfo accel_types[] = {
         .class_size     = sizeof(AccelClass),
         .instance_size  = sizeof(AccelState),
         .abstract       = true,
+        .secure         = true,
     },
 };
 
@@ -137,6 +138,7 @@ static void register_accel_target_type(void)
         .name = name,
         .parent = TYPE_OBJECT,
         .abstract = true,
+        .secure = true,
         .class_size = sizeof(AccelCPUClass),
     };
 
diff --git a/accel/accel-system.c b/accel/accel-system.c
index 1325b23864..f3f31bc666 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -118,6 +118,7 @@ static const TypeInfo accel_ops_type_info = {
     .name = TYPE_ACCEL_OPS,
     .parent = TYPE_OBJECT,
     .abstract = true,
+    .secure = true,
     .class_size = sizeof(AccelOpsClass),
     .class_init = accel_ops_class_init,
 };
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index c8e7aa3870..f05d41a837 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -119,6 +119,7 @@ static const TypeInfo kvm_accel_ops_type = {
     .parent = TYPE_ACCEL_OPS,
     .class_init = kvm_accel_ops_class_init,
     .abstract = true,
+    .secure = true,
 };
 
 static void kvm_accel_ops_register_types(void)
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 83cbd120a8..af886aa28c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -4328,6 +4328,7 @@ static const TypeInfo kvm_accel_type = {
     .instance_finalize = kvm_accel_finalize,
     .class_init = kvm_accel_class_init,
     .instance_size = sizeof(KVMState),
+    .secure = true,
 };
 
 static void kvm_type_init(void)
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index bb2d02cb22..937e0e947d 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -147,6 +147,7 @@ static const TypeInfo xen_accel_type = {
     .name = TYPE_XEN_ACCEL,
     .parent = TYPE_ACCEL,
     .class_init = xen_accel_class_init,
+    .secure = true,
 };
 
 static void xen_accel_ops_class_init(ObjectClass *oc, const void *data)
@@ -163,6 +164,7 @@ static const TypeInfo xen_accel_ops_type = {
     .parent = TYPE_ACCEL_OPS,
     .class_init = xen_accel_ops_class_init,
     .abstract = true,
+    .secure = true,
 };
 
 static void xen_type_init(void)
-- 
2.55.0


