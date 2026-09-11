Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB22C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:40:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417246.1646188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Q9-0001ON-VM; Fri, 11 Sep 2026 14:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417246.1646188; Fri, 11 Sep 2026 14:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52Q9-0001Nn-SV; Fri, 11 Sep 2026 14:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1417246;
 Fri, 11 Sep 2026 14:40:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52Q7-0000zA-S2
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:40:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52Q7-008k9B-8f
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:40:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa412a5-2eae-0a2a0a5409dd-0a2a45089b94-24
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:40:03 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41249-f659-0a2a45080019-aa0a817c6933-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:38:02 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-Woi66CdzNE63mR1L80XvTw-1; Fri,
 11 Sep 2026 10:37:58 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2F99F195395E; Fri, 11 Sep 2026 14:37:33 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 42B0C3000229; Fri, 11 Sep 2026 14:37:31 +0000 (UTC)
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
	s=mimecast20190719; t=1789137481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4kE0kwvfDbuBRKymnLbUvEO8flRNgMjBGhpmSiGsh0=;
	b=GViE6yxWodZovarT0BzVz6itJh2R/zcnj5T+BQeKifIkI4NKDuMoLocTsBG+Sq01zfPc29
	pMiymDxvP5oNHnVUaPiT+B+N0cnTo5uJCv1bHDtZlfzp0GwbEEI7rvmZqr4Lj1/hDS6RIu
	u4EKz1GkkJXdflLKDmPaUXW4FnXpltw=
X-MC-Unique: Woi66CdzNE63mR1L80XvTw-1
X-Mimecast-MFC-AGG-ID: Woi66CdzNE63mR1L80XvTw_1789137476
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 28/28] hw/i386: mark vmmouse / vmport as secure
Date: Fri, 11 Sep 2026 15:36:27 +0100
Message-ID: <20260911143627.2743803-29-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: SSL7pQjdq08bxl8bdh_0qnjlOTOuy0vouEW6JJ0MLew_1789137476
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1789137483-CCB7187B-038AACDC/0/0
X-purgate-type: clean
X-purgate-size: 1053

These paravirtualized devices are relevant to virtualization
use cases.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/vmmouse.c | 1 +
 hw/i386/vmport.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index e289bce8e2..612e7f7d3b 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -390,6 +390,7 @@ static const TypeInfo vmmouse_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(VMMouseState),
     .class_init    = vmmouse_class_initfn,
+    .secure        = true,
 };
 
 static void vmmouse_register_types(void)
diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 865e0e70db..24c4fb27a3 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -301,6 +301,7 @@ static const TypeInfo vmport_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(VMPortState),
     .class_init    = vmport_class_initfn,
+    .secure        = true,
 };
 
 static void vmport_register_types(void)
-- 
2.55.0


