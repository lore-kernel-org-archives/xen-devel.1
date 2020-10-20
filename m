Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A9BC388F7
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 00:00:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08E0E223BF
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 00:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="re4LNmev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08E0E223BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9797.25863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YE-00085T-6W; Wed, 21 Oct 2020 00:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9797.25863; Wed, 21 Oct 2020 00:00:22 +0000
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
	id 1kV1YE-00085M-1N; Wed, 21 Oct 2020 00:00:22 +0000
Received: by outflank-mailman (input) for mailman id 9797;
 Wed, 21 Oct 2020 00:00:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1YC-0007xs-48
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 347a1fe3-2152-4264-a255-5bf320b4ff86;
 Wed, 21 Oct 2020 00:00:14 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D3FF223BF;
 Wed, 21 Oct 2020 00:00:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1YC-0007xs-48
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:20 +0000
X-Inumbo-ID: 347a1fe3-2152-4264-a255-5bf320b4ff86
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 347a1fe3-2152-4264-a255-5bf320b4ff86;
	Wed, 21 Oct 2020 00:00:14 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4D3FF223BF;
	Wed, 21 Oct 2020 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238413;
	bh=/OW4xiRAVY2DWXEVmKmaedQ+klcsJQrs8oEIFZrDdxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=re4LNmevAUE/3b7wg3M4t8PkqKguIpGkMTpTjupMaq0wCsOiW5JKsEzuE/jkBcSJp
	 xDhqSlaAVJzcctQ4bu7vPXszvWayt18eeoEZR2qHnn7Dol1BNwyirErPO8fbnIjUMb
	 mjjgsZXjxgyLGokwCw7EU9IQFry2SscHWHIJnq5E=
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
Subject: [PATCH v2 02/14] kernel-doc: public/hvm/hvm_op.h
Date: Tue, 20 Oct 2020 16:59:59 -0700
Message-Id: <20201021000011.15351-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/hvm/hvm_op.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
index 870ec52060..d62d3a96f8 100644
--- a/xen/include/public/hvm/hvm_op.h
+++ b/xen/include/public/hvm/hvm_op.h
@@ -27,14 +27,26 @@
 #include "../trace.h"
 #include "../event_channel.h"
 
-/* Get/set subcommands: extra argument == pointer to xen_hvm_param struct. */
+/**
+ * DOC: HVMOP_set_param and HVMOP_get_param
+ *
+ * Get/set subcommands: extra argument == pointer to xen_hvm_param struct.
+ */
 #define HVMOP_set_param           0
 #define HVMOP_get_param           1
+
+/**
+ * struct xen_hvm_param
+ */
 struct xen_hvm_param {
-    domid_t  domid;    /* IN */
+    /** @domid: IN parameter */
+    domid_t  domid;
+    /** @pad: padding */
     uint16_t pad;
-    uint32_t index;    /* IN */
-    uint64_t value;    /* IN/OUT */
+    /** @index: IN parameter */
+    uint32_t index;
+    /** @value: IN/OUT parameter */
+    uint64_t value;
 };
 typedef struct xen_hvm_param xen_hvm_param_t;
 DEFINE_XEN_GUEST_HANDLE(xen_hvm_param_t);
-- 
2.17.1


