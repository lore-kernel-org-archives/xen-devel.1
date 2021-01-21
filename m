Return-Path: <SRS0=QJUc=GY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CC8C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 09:31:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74E22395A
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 09:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74E22395A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71940.129204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WIn-0000W9-6b; Thu, 21 Jan 2021 09:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71940.129204; Thu, 21 Jan 2021 09:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WIn-0000W2-2k; Thu, 21 Jan 2021 09:30:53 +0000
Received: by outflank-mailman (input) for mailman id 71940;
 Thu, 21 Jan 2021 09:30:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5uv=GY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1l2WIl-0000Vx-R2
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 09:30:51 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d802f8ef-9419-4c72-8e13-0cfc1321a908;
 Thu, 21 Jan 2021 09:30:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 636DD14FF;
 Thu, 21 Jan 2021 01:30:49 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.6.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 777893F68F;
 Thu, 21 Jan 2021 01:30:47 -0800 (PST)
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
X-Inumbo-ID: d802f8ef-9419-4c72-8e13-0cfc1321a908
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH] xen/arm: Fix compilation error when early printk is enabled
Date: Thu, 21 Jan 2021 10:30:41 +0100
Message-Id: <20210121093041.21537-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix compilation error when enabling early printk, introduced
by commit aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063:
```
debug.S: Assembler messages:
debug.S:31: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
debug.S:38: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
```

The fix is to include header <xen/page-size.h> which now contains
definitions for page/size/mask etc.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/include/asm-arm/early_printk.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/asm-arm/early_printk.h b/xen/include/asm-arm/early_printk.h
index d5485decfa..8dc911cf48 100644
--- a/xen/include/asm-arm/early_printk.h
+++ b/xen/include/asm-arm/early_printk.h
@@ -10,6 +10,7 @@
 #ifndef __ARM_EARLY_PRINTK_H__
 #define __ARM_EARLY_PRINTK_H__
 
+#include <xen/page-size.h>
 
 #ifdef CONFIG_EARLY_PRINTK
 
-- 
2.29.0


