Return-Path: <SRS0=ysB/=AF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AC2C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 12:19:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9609C2088E
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 12:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="lLt2C+uu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9609C2088E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4Mb-00067y-SG; Wed, 24 Jun 2020 12:18:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b8vz=AF=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jo4MZ-00067X-VR
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:18:48 +0000
X-Inumbo-ID: d9cd1730-b614-11ea-80a5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9cd1730-b614-11ea-80a5-12813bfff9fa;
 Wed, 24 Jun 2020 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N/I4v8ZDmbVyJ5v5uM4VjOF7rLFaxzrV35vC/IJzksA=; b=lLt2C+uuKQnj7hdrvVOUwqTmOc
 6mvivoKpj2mcC21dDbNQfw4TWLRKSULpTUGgzd25DC8kwHlqRizrzV3HUR9DbL5N4J3sjdFzS7+Rl
 cRCyHUZbwb3LjveMQRyODxZQ2B1ueU6ynTq2P9rKxbofMWbp9V8guYfzhYMH+HyZu39s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jo4MX-0000gD-A9; Wed, 24 Jun 2020 12:18:45 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jo4MX-0005fi-17; Wed, 24 Jun 2020 12:18:45 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] xen: fix legacy 'xen-sysdev' and 'xen-backend' bus types
Date: Wed, 24 Jun 2020 13:18:40 +0100
Message-Id: <20200624121841.17971-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200624121841.17971-1-paul@xen.org>
References: <20200624121841.17971-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

'xen-sysdev' plugs into the 'System' bus type, not 'xen-sysbus. That bus type
is what 'xen-backend' plugs into.
'xen-sysdev' is drived form 'sys-bus-device' so the bus type need not be
overridden. 'xen-backend' is derived from 'device', which plugs into the
generic 'bus' type, so its bus type should be overridden to 'xen-sysbus'.

Without this patch, the following assertion will fail:

qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
`dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
failed.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Fixes: 81cb05732efb ("qdev: Assert devices are plugged into a bus that can take them")
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
---
 hw/xen/xen-legacy-backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 2335ee2e65..c5c75c0064 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -789,11 +789,12 @@ static void xendev_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     /* xen-backend devices can be plugged/unplugged dynamically */
     dc->user_creatable = true;
+    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xendev_type_info = {
     .name          = TYPE_XENBACKEND,
-    .parent        = TYPE_XENSYSDEV,
+    .parent        = TYPE_DEVICE,
     .class_init    = xendev_class_init,
     .instance_size = sizeof(struct XenLegacyDevice),
 };
@@ -824,7 +825,6 @@ static void xen_sysdev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, xen_sysdev_properties);
-    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xensysdev_info = {
-- 
2.20.1


