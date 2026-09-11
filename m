Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9F8C88E59
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:39:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417209.1646145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Pd-0006VN-DH; Fri, 11 Sep 2026 14:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417209.1646145; Fri, 11 Sep 2026 14:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Pd-0006U5-7d; Fri, 11 Sep 2026 14:39:33 +0000
Received: by outflank-mailman (input) for mailman id 1417209;
 Fri, 11 Sep 2026 14:39:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52Pc-0006KL-C7
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:39:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Pb-0065ri-NA
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:39:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4128c-8faa-0a2a0a5109dd-0a2a4506e9d8-36
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:39:31 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4122a-195a-0a2a45060019-aa0a857c6711-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:31 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-232-8svhV57tPAqXhzJY7uftTA-1; Fri,
 11 Sep 2026 10:37:23 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 18A691955BFC; Fri, 11 Sep 2026 14:37:22 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2E31F300022B; Fri, 11 Sep 2026 14:37:20 +0000 (UTC)
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
	s=mimecast20190719; t=1789137450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMFoXRSqJagVBm5GVPbfKFycLqDC+N9k5/iDYiZvJ88=;
	b=cpZwh6/zt5ZenNBlGS/OxqpsSY3ZPa/Mp3ho/XNs+3k5My2D6UKpyjjoCiuUOstP3yyDoQ
	mKA0b9TPMXPoIaH2LSXn1rQGSveZVDksaOMuSGgKzy6ZLvB9brYN5643cm2YoUIplQTpgg
	F1eVj0Nd52/Ll8QsoqM0YYgPYrjQiYI=
X-MC-Unique: 8svhV57tPAqXhzJY7uftTA-1
X-Mimecast-MFC-AGG-ID: 8svhV57tPAqXhzJY7uftTA_1789137442
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 23/28] hw/uefi: mark the EFI vars service as secure
Date: Fri, 11 Sep 2026 15:36:22 +0100
Message-ID: <20260911143627.2743803-24-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: UxreJGr_N71FBDcD-qylAaRQauCduqUFmhv_jJSMVv8_1789137442
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1789137451-1F6C877B-C1D8025D/13/0
X-purgate-type: clean
X-purgate-size: 990

This is used to persist EFI variables when NVRAM is not available
or undesirable.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/uefi/var-service-sysbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/uefi/var-service-sysbus.c b/hw/uefi/var-service-sysbus.c
index 97a96cae6a..6bec14733b 100644
--- a/hw/uefi/var-service-sysbus.c
+++ b/hw/uefi/var-service-sysbus.c
@@ -84,6 +84,7 @@ static const TypeInfo uefi_vars_sysbus_info = {
     .instance_size = sizeof(uefi_vars_sysbus_state),
     .instance_init = uefi_vars_sysbus_init,
     .class_init    = uefi_vars_sysbus_class_init,
+    .secure        = true,
 };
 module_obj(TYPE_UEFI_VARS_SYSBUS);
 
@@ -113,6 +114,7 @@ static const TypeInfo uefi_vars_x64_info = {
     .name          = TYPE_UEFI_VARS_X64,
     .parent        = TYPE_UEFI_VARS_SYSBUS,
     .class_init    = uefi_vars_x64_class_init,
+    .secure        = true,
 };
 module_obj(TYPE_UEFI_VARS_X64);
 
-- 
2.55.0


