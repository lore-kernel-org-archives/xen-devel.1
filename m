Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18F3C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 01:23:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F44D64F0A
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 01:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F44D64F0A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89569.168790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF5Mi-0002IB-8H; Thu, 25 Feb 2021 01:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89569.168790; Thu, 25 Feb 2021 01:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF5Mi-0002I4-4X; Thu, 25 Feb 2021 01:22:52 +0000
Received: by outflank-mailman (input) for mailman id 89569;
 Thu, 25 Feb 2021 01:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjlP=H3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lF5Mf-0002Hw-VW
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 01:22:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03c6920c-95bd-4d31-bfbc-eb946e01c793;
 Thu, 25 Feb 2021 01:22:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3062264EF1;
 Thu, 25 Feb 2021 01:22:48 +0000 (UTC)
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
X-Inumbo-ID: 03c6920c-95bd-4d31-bfbc-eb946e01c793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614216168;
	bh=KxKbDRzEO0RDzP5UuGlUriPzcgRyS5OFHJrlkUAw18U=;
	h=From:To:Cc:Subject:Date:From;
	b=Zy2EICcfE1/inUdayOX2DGd692xkZhmL8iztQ3/ovYDB+2GuMNWQOLiV4xrgVi7hl
	 k6uXCjkoqaw+jgr/0hqkXs281mM2VWMFF0jAIw6TD1WhQjAsYjXGdc6rrnjZOzyTpu
	 v8XdHcjMRR+IFz6giRHoPvovUWcKGPSWXLjtHze9WwtOfxSqoAF55BD8Q+8c21KhRs
	 LKgI93JeiK9ukDbbsE8An22h0JY0f9HYYdJ+m1HLSzw86ymDfgH3pkq/2zQo79CR5Z
	 InXVK/P/Q3+3KinqY/DYjqPd++uHAZ1Ca2siLpJAzQuCRJ6Fu22bTQ6gV2zujQ6gDv
	 MOyFlILUScppA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	julien@xen.org
Subject: [PATCH] xen: introduce XENFEAT_direct_mapped and XENFEAT_not_direct_mapped
Date: Wed, 24 Feb 2021 17:22:43 -0800
Message-Id: <20210225012243.28530-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Introduce two feature flags to tell the domain whether it is
direct-mapped or not. It allows the guest kernel to make informed
decisions on things such as swiotlb-xen enablement.

Currently, only Dom0 on ARM is direct-mapped, see:
xen/include/asm-arm/domain.h:is_domain_direct_mapped
xen/include/asm-x86/domain.h:is_domain_direct_mapped

However, given that it is theoretically possible to have direct-mapped
domains on x86 too, the two new feature flags are arch-neutral.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: jbeulich@suse.com
CC: andrew.cooper3@citrix.com
CC: julien@xen.org
---
 xen/common/kernel.c           | 4 ++++
 xen/include/public/features.h | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 7a345ae45e..6ca1377dec 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -560,6 +560,10 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
                              (1U << XENFEAT_hvm_callback_vector) |
                              (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0);
 #endif
+            if ( is_domain_direct_mapped(d) )
+                fi.submap |= (1U << XENFEAT_direct_mapped);
+            else
+                fi.submap |= (1U << XENFEAT_not_direct_mapped);
             break;
         default:
             return -EINVAL;
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 1613b2aab8..18e3e61df0 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -114,6 +114,13 @@
  */
 #define XENFEAT_linux_rsdp_unrestricted   15
 
+/*
+ * A direct-mapped (or 1:1 mapped) domain is a domain for which its
+ * local pages have gfn == mfn.
+ */
+#define XENFEAT_not_direct_mapped       16
+#define XENFEAT_direct_mapped           17
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.17.1


