Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C51CC433EF
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 00:23:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3156D60FC0
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 00:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3156D60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.183788.332120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUKM-0000oI-1i; Fri, 10 Sep 2021 00:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183788.332120; Fri, 10 Sep 2021 00:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUKL-0000oB-Ui; Fri, 10 Sep 2021 00:23:33 +0000
Received: by outflank-mailman (input) for mailman id 183788;
 Fri, 10 Sep 2021 00:23:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1So/=OA=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1mOUKL-0000ng-99
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 00:23:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ef35839-5a5a-4b13-b38b-7a900243c4d6;
 Fri, 10 Sep 2021 00:23:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60CB7611BF;
 Fri, 10 Sep 2021 00:23:31 +0000 (UTC)
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
X-Inumbo-ID: 6ef35839-5a5a-4b13-b38b-7a900243c4d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631233412;
	bh=2MjKKLz7JzePmBVcQDgPEuCsbqkT4iHdNk9yelbTGWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CCsx7xpCr6g88miLZiMbIAMqW/KeFbGynaKDu/fWPrm9nB4OTJM5+18BO73W6XUAM
	 N6B3hGIBLx8tT39U6qO2SJwAEJUpwPmw2nJzZxUh5Tq4FabdXG9MV6yu5GJo7goXnh
	 3kwR9u9TFP88/S34OmmWGrs3eRnMyBjoHkakS0mN9JB+p+A1oB/0WnfAd6ZzKJw+mo
	 OR/WXihDPMlVjqNlN2VmLX4bELQeD8K4X9YoBAO6UXyFDESmiZsaV1g+xGL19VW6ig
	 dj+3VdHVzJPFgJlLXnmUiNI0JHN0YD2xNwAzA+ZPx2VuIPEt+JPzJHkG7jWUieO9vG
	 ZJAN/noPlfI7A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 4.14 16/19] xen: remove stray preempt_disable() from PV AP startup code
Date: Thu,  9 Sep 2021 20:23:06 -0400
Message-Id: <20210910002309.176412-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002309.176412-1-sashal@kernel.org>
References: <20210910002309.176412-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 58e636039b512697554b579c2bb23774061877f5 ]

In cpu_bringup() there is a call of preempt_disable() without a paired
preempt_enable(). This is not needed as interrupts are off initially.
Additionally this will result in early boot messages like:

BUG: scheduling while atomic: swapper/1/0/0x00000002

Signed-off-by: Juergen Gross <jgross@suse.com>
Link: https://lore.kernel.org/r/20210825113158.11716-1-jgross@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/xen/smp_pv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index f779d2a5b04c..44468d6fa188 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -59,7 +59,6 @@ static void cpu_bringup(void)
 
 	cpu_init();
 	touch_softlockup_watchdog();
-	preempt_disable();
 
 	/* PVH runs in ring 0 and allows us to do native syscalls. Yay! */
 	if (!xen_feature(XENFEAT_supervisor_mode_kernel)) {
-- 
2.30.2


