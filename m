Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDA8C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:39:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417208.1646138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Pc-0006Np-VP; Fri, 11 Sep 2026 14:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417208.1646138; Fri, 11 Sep 2026 14:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Pc-0006Nc-SD; Fri, 11 Sep 2026 14:39:32 +0000
Received: by outflank-mailman (input) for mailman id 1417208;
 Fri, 11 Sep 2026 14:39:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52Pc-0006K3-0q
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:39:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Pb-002YOl-Dq
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:39:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41299-e002-0a2a0a5209dd-0a2a450b8d1c-24
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:39:31 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4122a-b7e8-0a2a450b0019-aa0a857c6b7f-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:37:31 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-318-pyBOGgksO1SEGyquYx9xNw-1; Fri,
 11 Sep 2026 10:37:27 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 727321955DCD; Fri, 11 Sep 2026 14:37:26 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 899033000229; Fri, 11 Sep 2026 14:37:24 +0000 (UTC)
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
	bh=Ty7jgU/VRH/YaPH0fwHwHbb1p4FYEmeRhPcsE2aO8tg=;
	b=JeBQ0LbOY3P9jyAlUqmxv8tRJQd9QgpaFuCzqbKEd1GR81IGZPN2IE9GVGD+tXTC4bnor6
	c2TsjPVMjLVjfHEeDkZQ0ENTS8wesfuNyZAE036jBsMLzPZ4xIxI7IXLvazQ8v+y0wPP+e
	in9v8/QxboakODil5FKtR8IqK6BD29s=
X-MC-Unique: pyBOGgksO1SEGyquYx9xNw-1
X-Mimecast-MFC-AGG-ID: pyBOGgksO1SEGyquYx9xNw_1789137446
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 25/28] hw: mark KVM clock and RTC devices as secure
Date: Fri, 11 Sep 2026 15:36:24 +0100
Message-ID: <20260911143627.2743803-26-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: dv-cyybNrhdv8A0D7F7CqbkiwanAc0Ff7Nnb9Hx27lU_1789137446
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789137451-1BED69EA-B712E62D/13/0
X-purgate-type: clean
X-purgate-size: 1176

These are core infrastructure in virtualization cases so must
provide a security boundary.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/kvm/clock.c  | 1 +
 hw/rtc/mc146818rtc.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index e3dad136d3..d3e2301311 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -366,6 +366,7 @@ static const TypeInfo kvmclock_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(KVMClockState),
     .class_init    = kvmclock_class_init,
+    .secure        = true,
 };
 
 /* Note: Must be called after VCPU initialization. */
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index ba396435d1..66f8b177e7 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -1027,6 +1027,7 @@ static const TypeInfo mc146818rtc_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(MC146818RtcState),
     .class_init    = rtc_class_initfn,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_ACPI_DEV_AML_IF },
         { },
-- 
2.55.0


