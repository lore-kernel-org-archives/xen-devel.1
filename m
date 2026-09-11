Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71475C88E58
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:37:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417062.1646022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NB-0005Zr-9B; Fri, 11 Sep 2026 14:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417062.1646022; Fri, 11 Sep 2026 14:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52NB-0005XW-2p; Fri, 11 Sep 2026 14:37:01 +0000
Received: by outflank-mailman (input) for mailman id 1417062;
 Fri, 11 Sep 2026 14:36:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x52N9-0005P3-T7
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:36:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52N9-008jaJ-9u
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:36:59 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa411fb-bab6-0a2a0a5309dd-0a2a450295c6-40
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:59 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa41209-6ca4-0a2a45020019-aa0a817c4fd9-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:36:59 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349-qBu9J0pJONqD0PZySyKfFg-1; Fri,
 11 Sep 2026 10:36:52 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C8F771955DD4; Fri, 11 Sep 2026 14:36:50 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DA2B53000229; Fri, 11 Sep 2026 14:36:48 +0000 (UTC)
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
	s=mimecast20190719; t=1789137417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m7+eb5JfGTqk31BVerDj3cabnDcqZzH0Cz7nFGxKH54=;
	b=V173gYvimKrFl352BnzcuE8Ae8XlNmgCu92t/RBBpL7quNYDZ4PW/HsW+id22Ji4uVb43Y
	6mxuMbPUnZttf10XGgQxklQzoesLXwvFKKl41Kc9j00HY570hcywzsf0lDCJPonDG8RrBb
	8RKJenB7NXcHDv993h4iA1RLdeadUUE=
X-MC-Unique: qBu9J0pJONqD0PZySyKfFg-1
X-Mimecast-MFC-AGG-ID: qBu9J0pJONqD0PZySyKfFg_1789137410
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 09/28] hw/net: mark e1000, e1000e, IGB, rtl8139 & sPAPR VLAN as secure
Date: Fri, 11 Sep 2026 15:36:08 +0100
Message-ID: <20260911143627.2743803-10-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: wCgxuSa6BO8o7rX8hyTtWH1NlYavtTT_j47SdGnnTt0_1789137410
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1789137419-303C42AC-7DB0B079/0/0
X-purgate-type: clean
X-purgate-size: 2990

Historically most NICs are only interesting for non-virtualization
use cases and have not been written with malicious guests in mind.

As a general rule either virtio-net or xen-net should be used in
all virtualized guests requiring a security boundary.

There are a handful of exceptions resulting from historical usage
in the x86 world, to support virtualized guests lacking virtio
support.

Thus the rtl8139, e1000, e1000e & IGB NICs are declared to provide
a security boundary.

The PPC sPAPR Virutal LAN device is also marked secure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/net/e1000.c      | 1 +
 hw/net/e1000e.c     | 1 +
 hw/net/igb.c        | 1 +
 hw/net/rtl8139.c    | 1 +
 hw/net/spapr_llan.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 202ad40401..da0667c40e 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1759,6 +1759,7 @@ static void e1000_register_types(void)
         type_info.parent = TYPE_E1000_BASE;
         type_info.class_data = info;
         type_info.class_init = e1000_class_init;
+        type_info.secure = true,
 
         type_register_static(&type_info);
     }
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 9faf0c74c3..96737ddb51 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -721,6 +721,7 @@ static const TypeInfo e1000e_info = {
     .instance_size = sizeof(E1000EState),
     .class_init = e1000e_class_init,
     .instance_init = e1000e_instance_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { }
diff --git a/hw/net/igb.c b/hw/net/igb.c
index c076807e71..0bd03efea0 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -635,6 +635,7 @@ static const TypeInfo igb_info = {
     .instance_size = sizeof(IGBState),
     .class_init = igb_class_init,
     .instance_init = igb_instance_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { }
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 16479284ee..38bc16f312 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -3450,6 +3450,7 @@ static const TypeInfo rtl8139_info = {
     .instance_size = sizeof(RTL8139State),
     .class_init    = rtl8139_class_init,
     .instance_init = rtl8139_instance_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
index 550848307d..c7ac58273c 100644
--- a/hw/net/spapr_llan.c
+++ b/hw/net/spapr_llan.c
@@ -873,6 +873,7 @@ static const TypeInfo spapr_vlan_info = {
     .class_init    = spapr_vlan_class_init,
     .instance_init = spapr_vlan_instance_init,
     .instance_finalize = spapr_vlan_instance_finalize,
+    .secure        = true,
 };
 
 static void spapr_vlan_register_types(void)
-- 
2.55.0


