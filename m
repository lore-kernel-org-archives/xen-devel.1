Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E960C4363D
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 00:00:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B789A2076A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 00:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVg45YDp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B789A2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9795.25839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1Y9-0007zl-IP; Wed, 21 Oct 2020 00:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9795.25839; Wed, 21 Oct 2020 00:00:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1Y9-0007ze-EA; Wed, 21 Oct 2020 00:00:17 +0000
Received: by outflank-mailman (input) for mailman id 9795;
 Wed, 21 Oct 2020 00:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1Y7-0007y0-P1
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a62aa01-00f0-4ef2-95e2-76fc75ec8221;
 Wed, 21 Oct 2020 00:00:15 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7A6B223FB;
 Wed, 21 Oct 2020 00:00:13 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1Y7-0007y0-P1
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:15 +0000
X-Inumbo-ID: 1a62aa01-00f0-4ef2-95e2-76fc75ec8221
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1a62aa01-00f0-4ef2-95e2-76fc75ec8221;
	Wed, 21 Oct 2020 00:00:15 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E7A6B223FB;
	Wed, 21 Oct 2020 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238414;
	bh=hxjQ0V81U0Cnve4cVEcBwbe968vdnzkI0O3rCTq2odE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rVg45YDpRhtSNG1QUlggs79es90EERqFSSu8R6zYkDvRKMa6yawv4MKaR4adGm4s7
	 zG7tffwDzdOuBMUxcO2FMRBNZbRE7rOwagEqjWU3ztrI5FceNX0vn/D7CAyXBpeha/
	 r1GzGqN6+/vGozkfG4oUrvVXZ8HNOcLfxQNBF+gg=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	ian.jackson@eu.citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org,
	Bertrand.Marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 03/14] kernel-doc: public/device_tree_defs.h
Date: Tue, 20 Oct 2020 17:00:00 -0700
Message-Id: <20201021000011.15351-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/device_tree_defs.h | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
index 209d43de3f..be35598b53 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -2,7 +2,9 @@
 #define __XEN_DEVICE_TREE_DEFS_H__
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
-/*
+/**
+ * DOC: GUEST_PHANDLE_GIC
+ *
  * The device tree compiler (DTC) is allocating the phandle from 1 to
  * onwards. Reserve a high value for the GIC phandle.
  */
@@ -12,17 +14,17 @@
 #define GUEST_ROOT_SIZE_CELLS 2
 
 /**
- * IRQ line type.
+ * DOC: IRQ line type.
  *
- * DT_IRQ_TYPE_NONE            - default, unspecified type
- * DT_IRQ_TYPE_EDGE_RISING     - rising edge triggered
- * DT_IRQ_TYPE_EDGE_FALLING    - falling edge triggered
- * DT_IRQ_TYPE_EDGE_BOTH       - rising and falling edge triggered
- * DT_IRQ_TYPE_LEVEL_HIGH      - high level triggered
- * DT_IRQ_TYPE_LEVEL_LOW       - low level triggered
- * DT_IRQ_TYPE_LEVEL_MASK      - Mask to filter out the level bits
- * DT_IRQ_TYPE_SENSE_MASK      - Mask for all the above bits
- * DT_IRQ_TYPE_INVALID         - Use to initialize the type
+ * - DT_IRQ_TYPE_NONE            - default, unspecified type
+ * - DT_IRQ_TYPE_EDGE_RISING     - rising edge triggered
+ * - DT_IRQ_TYPE_EDGE_FALLING    - falling edge triggered
+ * - DT_IRQ_TYPE_EDGE_BOTH       - rising and falling edge triggered
+ * - DT_IRQ_TYPE_LEVEL_HIGH      - high level triggered
+ * - DT_IRQ_TYPE_LEVEL_LOW       - low level triggered
+ * - DT_IRQ_TYPE_LEVEL_MASK      - Mask to filter out the level bits
+ * - DT_IRQ_TYPE_SENSE_MASK      - Mask for all the above bits
+ * - DT_IRQ_TYPE_INVALID         - Use to initialize the type
  */
 #define DT_IRQ_TYPE_NONE           0x00000000
 #define DT_IRQ_TYPE_EDGE_RISING    0x00000001
-- 
2.17.1


