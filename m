Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168E2C433F5
	for <xen-devel@archiver.kernel.org>; Thu, 14 Apr 2022 09:59:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.304592.519254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1newFe-0004O7-T9; Thu, 14 Apr 2022 09:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304592.519254; Thu, 14 Apr 2022 09:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1newFe-0004O0-QA; Thu, 14 Apr 2022 09:58:58 +0000
Received: by outflank-mailman (input) for mailman id 304592;
 Thu, 14 Apr 2022 09:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iU0v=UY=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1newFd-0004Ns-8s
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 09:58:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7e9ec656-bbd9-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 11:58:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94956139F;
 Thu, 14 Apr 2022 02:58:54 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.9.215])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81E763F5A1;
 Thu, 14 Apr 2022 02:58:52 -0700 (PDT)
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
X-Inumbo-ID: 7e9ec656-bbd9-11ec-8fbd-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Make use of DT_MATCH_TIMER in make_timer_node
Date: Thu, 14 Apr 2022 11:58:43 +0200
Message-Id: <20220414095843.102305-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DT_MATCH_TIMER stores the compatible timer ids and as such should be
used in all the places where we need to refer to them. make_timer_node
explicitly lists the same ids as the ones defined in DT_MATCH_TIMER so
make use of this macro instead.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/domain_build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8be01678de..1472ca4972 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1672,8 +1672,7 @@ static int __init make_timer_node(const struct kernel_info *kinfo)
     void *fdt = kinfo->fdt;
     static const struct dt_device_match timer_ids[] __initconst =
     {
-        DT_MATCH_COMPATIBLE("arm,armv7-timer"),
-        DT_MATCH_COMPATIBLE("arm,armv8-timer"),
+        DT_MATCH_TIMER,
         { /* sentinel */ },
     };
     struct dt_device_node *dev;
-- 
2.25.1


