Return-Path: <SRS0=o2nd=EL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BFEC388F7
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 22:31:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB4E20719
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 22:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="i+mTOueq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB4E20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20234.45956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kanmj-0002Do-2a; Thu, 05 Nov 2020 22:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20234.45956; Thu, 05 Nov 2020 22:31:13 +0000
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
	id 1kanmi-0002Dh-Vp; Thu, 05 Nov 2020 22:31:12 +0000
Received: by outflank-mailman (input) for mailman id 20234;
 Thu, 05 Nov 2020 22:31:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tWnR=EL=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kanmh-0002Dc-Po
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 22:31:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bd6ba21-4fba-4c15-8991-c4b56f25c927;
 Thu, 05 Nov 2020 22:31:10 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kanmf-0003pG-Lf; Thu, 05 Nov 2020 22:31:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kanmf-0007sR-Bj; Thu, 05 Nov 2020 22:31:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tWnR=EL=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kanmh-0002Dc-Po
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 22:31:11 +0000
X-Inumbo-ID: 7bd6ba21-4fba-4c15-8991-c4b56f25c927
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7bd6ba21-4fba-4c15-8991-c4b56f25c927;
	Thu, 05 Nov 2020 22:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=5WKeOj4EPBmk5WJNSqPI8bfFxGxj/vofaT5jIuYIsMM=; b=i+mTOueq+E/1ZAeibRxJpWdIm6
	C5ybmV12D11q+q6uGAg7Je6FeeSxPQeIdlTNjZGpCMFbYb9NAecoxjs7do2gdtL83t346io6xEsLn
	MHBjxVVHmnks66ebI24P3jHwR6Cf3QUPMyhUIECq9VV2wCklBfbNY5/gvHRF7VgHzE9c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kanmf-0003pG-Lf; Thu, 05 Nov 2020 22:31:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kanmf-0007sR-Bj; Thu, 05 Nov 2020 22:31:09 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: traps: Don't panic when receiving an unknown debug trap
Date: Thu,  5 Nov 2020 22:31:06 +0000
Message-Id: <20201105223106.22517-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Even if debug trap are only meant for debugging purpose, it is quite
harsh to crash Xen if one of the trap sent by the guest is not handled.

So switch from a panic() to a printk().

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 8f40d0e0b6b1..a36f145e6739 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1410,7 +1410,7 @@ static void do_debug_trap(struct cpu_user_regs *regs, unsigned int code)
         show_execution_state(regs);
         break;
     default:
-        panic("DOM%d: Unhandled debug trap %#x\n", domid, code);
+        printk("DOM%d: Unhandled debug trap %#x\n", domid, code);
         break;
     }
 }
-- 
2.17.1


