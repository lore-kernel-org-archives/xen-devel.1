Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252AFC88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417104.1646099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NU-0000gQ-CQ; Fri, 11 Sep 2026 14:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417104.1646099; Fri, 11 Sep 2026 14:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NT-0000dy-Tt; Fri, 11 Sep 2026 14:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1417104;
 Fri, 11 Sep 2026 14:37:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52NR-0000Ec-Ls
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52NR-009Xr7-23
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:37:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa411ff-e002-0a2a0a5209dd-0a2a450a88f0-32
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:17 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4121b-f2d2-0a2a450a0019-aa0a817ca307-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:16 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-tL51sFxgNQuw0u-1lM6utQ-1; Fri,
 11 Sep 2026 10:37:12 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D46641800671; Fri, 11 Sep 2026 14:37:10 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1256F3000229; Fri, 11 Sep 2026 14:37:08 +0000 (UTC)
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
	bh=aPFHkXJSs0u/ISQJq2BRt28+2MaWYtAQufJCPx92BiY=;
	b=TPdd98mKrxNXL2+EIhIh10ltl/JLWBaLFfl54cozI6oTQbLaim9cIT2Q3avrt0lKHjEkbr
	SUEuQPExkrOvu8I4k5d0xCDjadi9P7Zv879tUUGwJ3y81pswFsWoqTH58BQtQdWa4WArOa
	tt7KhIqU38LYLhD7fdjfC8T6crjMpxQ=
X-MC-Unique: tL51sFxgNQuw0u-1lM6utQ-1
X-Mimecast-MFC-AGG-ID: tL51sFxgNQuw0u-1lM6utQ_1789137431
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 18/28] hw/tpm: mark all TPM implementations as secure
Date: Fri, 11 Sep 2026 15:36:17 +0100
Message-ID: <20260911143627.2743803-19-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: QzxV_2AUwi2OIMLVgJDOui59ym3Lxo759aLa6HiEk10_1789137431
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1789137437-593C4CFC-250E63C6/0/0
X-purgate-type: clean
X-purgate-size: 3198

All of the TPM implementations are in scope of virtualization
usage, so mark them all as secure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/ppc/spapr_tpm_proxy.c | 1 +
 hw/tpm/tpm_crb.c         | 1 +
 hw/tpm/tpm_spapr.c       | 1 +
 hw/tpm/tpm_tis_i2c.c     | 1 +
 hw/tpm/tpm_tis_isa.c     | 1 +
 hw/tpm/tpm_tis_sysbus.c  | 1 +
 6 files changed, 6 insertions(+)

diff --git a/hw/ppc/spapr_tpm_proxy.c b/hw/ppc/spapr_tpm_proxy.c
index 19889e80bc..bb6efec20c 100644
--- a/hw/ppc/spapr_tpm_proxy.c
+++ b/hw/ppc/spapr_tpm_proxy.c
@@ -166,6 +166,7 @@ static const TypeInfo spapr_tpm_proxy_info = {
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(SpaprTpmProxy),
     .class_init    = spapr_tpm_proxy_class_init,
+    .secure        = true,
 };
 
 static void spapr_tpm_proxy_register_types(void)
diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 54fa2042b5..2e9445ad79 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -547,6 +547,7 @@ static const TypeInfo tpm_crb_info = {
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(CRBState),
     .class_init  = tpm_crb_class_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_TPM_IF },
         { }
diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index 19075d1f01..3957c5268b 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -414,6 +414,7 @@ static const TypeInfo tpm_spapr_info = {
     .parent        = TYPE_VIO_SPAPR_DEVICE,
     .instance_size = sizeof(SpaprTpmState),
     .class_init    = tpm_spapr_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_TPM_IF },
         { }
diff --git a/hw/tpm/tpm_tis_i2c.c b/hw/tpm/tpm_tis_i2c.c
index b4f258c7bc..302296affb 100644
--- a/hw/tpm/tpm_tis_i2c.c
+++ b/hw/tpm/tpm_tis_i2c.c
@@ -551,6 +551,7 @@ static const TypeInfo tpm_tis_i2c_info = {
     .name          = TYPE_TPM_TIS_I2C,
     .parent        = TYPE_I2C_SLAVE,
     .instance_size = sizeof(TPMStateI2C),
+    .secure        = true,
     .class_init    = tpm_tis_i2c_class_init,
         .interfaces = (const InterfaceInfo[]) {
         { TYPE_TPM_IF },
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 2b1267133a..da3a932b03 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -187,6 +187,7 @@ static const TypeInfo tpm_tis_isa_info = {
     .instance_size = sizeof(TPMStateISA),
     .instance_init = tpm_tis_isa_initfn,
     .class_init  = tpm_tis_isa_class_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_TPM_IF },
         { TYPE_ACPI_DEV_AML_IF },
diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index a7b0002d82..0afb52c3be 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -167,6 +167,7 @@ static const TypeInfo tpm_tis_sysbus_info = {
     .instance_init = tpm_tis_sysbus_initfn,
     .instance_finalize = tpm_tis_sysbus_finalize,
     .class_init  = tpm_tis_sysbus_class_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_TPM_IF },
         { }
-- 
2.55.0


