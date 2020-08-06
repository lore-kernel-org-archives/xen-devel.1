Return-Path: <SRS0=cbMO=BQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505A1C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 23:49:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB7921744
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 23:49:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbWqXG4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BB7921744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3pdp-0004Id-5j; Thu, 06 Aug 2020 23:49:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pdn-0004FC-KI
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:49:43 +0000
X-Inumbo-ID: 29a9c849-bce0-46c7-947d-d1f4f0fd0f11
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29a9c849-bce0-46c7-947d-d1f4f0fd0f11;
 Thu, 06 Aug 2020 23:49:38 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F111222CBB;
 Thu,  6 Aug 2020 23:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757778;
 bh=kQJOWQmiev2GmAsfEYKexaRWR3uthIyBp6QIEIE2jMM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GbWqXG4ZBOtym3xLogVvTTc16LfMczACHj42CNSN9hiB7Q0xwaUktOn2ocbpdmud8
 sP6CMrMJVlhP1tKliZzMutB3ardys81p12byqv4EtlEu8xedMN+RMaVpsYkOYBfYBm
 ZA7utGr39Bm04LZsY8AogBhOeq3UmE2Vf/5t2C/w=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 03/14] kernel-doc: public/device_tree_defs.h
Date: Thu,  6 Aug 2020 16:49:22 -0700
Message-Id: <20200806234933.16448-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

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


