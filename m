Return-Path: <SRS0=/Lw+=GL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977FFC433DB
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 00:47:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE9823447
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 00:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DE9823447
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.63149.112137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxfw1-0003Bz-Eg; Fri, 08 Jan 2021 00:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63149.112137; Fri, 08 Jan 2021 00:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxfw1-0003Bs-Ay; Fri, 08 Jan 2021 00:47:21 +0000
Received: by outflank-mailman (input) for mailman id 63149;
 Fri, 08 Jan 2021 00:47:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BSv=GL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kxfw0-0003Ar-NK
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 00:47:20 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0592e1db-2daf-4fb4-8481-ddf20c38ec64;
 Fri, 08 Jan 2021 00:47:15 +0000 (UTC)
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
X-Inumbo-ID: 0592e1db-2daf-4fb4-8481-ddf20c38ec64
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610066835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=AjOVgnBRHW6mA8jfsxCNVWvF+SDZiBno1KSGGGCBrKU=;
  b=JXXrwAS/COCFLDm/sP69KHauBmwOrV66GiMt64Pl+4oPZM8cGINp8gDG
   17uNWv0wncmPnBjfzB6yRGN+B1wCU5TZe2HK4214jwcBSL9On3jjyMwzF
   RySxUlhwzsHuzNQcIb9ztryu6VUKhTKpjUbp+JHSRCjxbWnzQELhhTWgR
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RsX61pEuroged8+NrQDxKIntpoiZrZT/j9/fr2jqRh1K/HbYS1xQByzvkBYsYTm+GOp6YfYNdm
 VOrOl10qV//W8fLwN0i6L6G4UzqsvqDWRgkC3nLWQLbf8/Eapgtuy6ujdUyA79COa9BNjEZsTf
 liVtfCFemuNqiBze2Gz/NLrmVi3LnFsKaLZf5pcpWSUdmztsApdV6EP4JYwc65FddhIgeI2eAf
 Iy9qHqG+tkPQHRRaVrxcmNASttPl65K/BQHcEll2eZJbDghGKY4678bAtT45stJyXuMQSl6Rz+
 pG8=
X-SBRS: 5.2
X-MesageID: 35912825
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,330,1602561600"; 
   d="scan'208";a="35912825"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <paul@xen.org>, <wl@xen.org>, <iwj@xenproject.org>,
	<anthony.perard@citrix.com>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <roger.pau@citrix.com>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
Subject: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
Date: Fri, 8 Jan 2021 00:46:36 +0000
Message-ID: <1610066796-17266-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

If Viridian extensions are enabled, Windows wouldn't currently allow
a hotplugged vCPU to be brought up dynamically. We need to expose a special
bit to let the guest know we allow it. It appears we can just start exposing
it without worrying too much about compatibility - see relevant QEMU
discussion here:

https://patchwork.kernel.org/project/qemu-devel/patch/1455364815-19586-1-git-send-email-den@openvz.org/

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 xen/arch/x86/hvm/viridian/viridian.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index ae1ea86..76e8291 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -76,6 +76,7 @@ typedef union _HV_CRASH_CTL_REG_CONTENTS
 } HV_CRASH_CTL_REG_CONTENTS;
 
 /* Viridian CPUID leaf 3, Hypervisor Feature Indication */
+#define CPUID3D_CPU_DYNAMIC_PARTITIONING (1 << 3)
 #define CPUID3D_CRASH_MSRS (1 << 10)
 #define CPUID3D_SINT_POLLING (1 << 17)
 
@@ -179,8 +180,11 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
         res->a = u.lo;
         res->b = u.hi;
 
+        /* Expose ability to bring up VPs dynamically - allows vCPU hotplug */
+        res->d = CPUID3D_CPU_DYNAMIC_PARTITIONING;
+
         if ( viridian_feature_mask(d) & HVMPV_crash_ctl )
-            res->d = CPUID3D_CRASH_MSRS;
+            res->d |= CPUID3D_CRASH_MSRS;
         if ( viridian_feature_mask(d) & HVMPV_synic )
             res->d |= CPUID3D_SINT_POLLING;
 
-- 
2.7.4


