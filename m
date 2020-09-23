Return-Path: <SRS0=1HVP=DA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7F0C4727D
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 08:28:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F10D23977
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 08:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="gHhYYSF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F10D23977
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL08n-0002vE-UJ; Wed, 23 Sep 2020 08:28:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL08m-0002v9-8H
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 08:28:40 +0000
X-Inumbo-ID: 39a9d5e1-cd96-4ac0-ae4b-a2d8203a084c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39a9d5e1-cd96-4ac0-ae4b-a2d8203a084c;
 Wed, 23 Sep 2020 08:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
 bh=bf/uNR0OC0kp3cwoWQRnE1xxDLKakcZrkqGAXtkswgc=; b=gHhYYSF7XWz2iWnwQeoG7Y0lZL
 X90nvyqtNUJq9cAIyjXFYrFhq6SHxr23ttQmfdRBQuqJq5b3YRxRqgYHkTjz0RpiFXZyRO9BIAKJ8
 /ViS3vZ6IC6MuhZyY9POplJywFBL0UhHiOXmAdteasscfEXLiSnWlGMXGH4UmbvkHzeY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL08h-0004mL-OX; Wed, 23 Sep 2020 08:28:35 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL08h-0000jq-9r; Wed, 23 Sep 2020 08:28:35 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: [PATCH] SUPPORT.MD: Clarify the support state for the Arm SMMUv{1,
 2} drivers
Date: Wed, 23 Sep 2020 09:28:32 +0100
Message-Id: <20200923082832.20038-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

SMMUv{1, 2} are both marked as security supported, so we would
technically have to issue an XSA for any IOMMU security bug.

However, at the moment, device passthrough is not security supported
on Arm and there is no plan to change that in the next few months.

Therefore, mark Arm SMMUv{1, 2} as supported but not security supported.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
---
 SUPPORT.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 25987ec1dfb6..f35943a432f7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -62,8 +62,8 @@ supported in this document.
 
     Status, AMD IOMMU: Supported
     Status, Intel VT-d: Supported
-    Status, ARM SMMUv1: Supported
-    Status, ARM SMMUv2: Supported
+    Status, ARM SMMUv1: Supported, not security supported
+    Status, ARM SMMUv2: Supported, not security supported
     Status, Renesas IPMMU-VMSA: Supported, not security supported
 
 ### ARM/GICv3 ITS
-- 
2.17.1


