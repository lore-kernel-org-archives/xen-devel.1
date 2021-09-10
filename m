Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF1BC433F5
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 00:22:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A4916103E
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 00:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A4916103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.183776.332098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUJL-00084H-Fe; Fri, 10 Sep 2021 00:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183776.332098; Fri, 10 Sep 2021 00:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUJL-00084A-Ca; Fri, 10 Sep 2021 00:22:31 +0000
Received: by outflank-mailman (input) for mailman id 183776;
 Fri, 10 Sep 2021 00:22:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1So/=OA=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1mOUJJ-00083w-FN
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 00:22:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc833408-2555-407d-bfd7-1e5e3ae8a562;
 Fri, 10 Sep 2021 00:22:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0018610A3;
 Fri, 10 Sep 2021 00:22:27 +0000 (UTC)
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
X-Inumbo-ID: fc833408-2555-407d-bfd7-1e5e3ae8a562
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631233348;
	bh=B3+dapiH7ZqT0zNupi/gPeO0vO8/7rY0FDBnebcTA1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ESZg825KvV5tGsZ0dn3orW51NieRVTYim0DUkFfMPslxm/8Q7zPksDkuSpsuaO2UN
	 WMAD3uthyDVN4+1/OrCYmGj7DBflKywPW8bRZD/FaTHYHeXbx3AqawJdQGmmY6uJX/
	 QDC3Bkb0sKH/on9vNNviNaeF75Xw0nKLe8+tXOHgoU24R18YWsEDS6/QIcfMxqB05l
	 hy0F1Jx0wzzKn/dQZ9WBiLsxdR4z7ZBLxPD5EgySjysfQFHb5NH/10nkp7rWkhova2
	 AJmS9/47AZNj8OFC7alwNAyo5otn1j7OGKo6bTP8Va9LqHlb0wuuwXpht5bPZ+w2Ig
	 bvDZhaAQhTyHQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.4 34/37] xen: remove stray preempt_disable() from PV AP startup code
Date: Thu,  9 Sep 2021 20:21:39 -0400
Message-Id: <20210910002143.175731-34-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002143.175731-1-sashal@kernel.org>
References: <20210910002143.175731-1-sashal@kernel.org>
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
index 0cebe5db691d..b87c6403b5bd 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -61,7 +61,6 @@ static void cpu_bringup(void)
 	cr4_init();
 	cpu_init();
 	touch_softlockup_watchdog();
-	preempt_disable();
 
 	/* PVH runs in ring 0 and allows us to do native syscalls. Yay! */
 	if (!xen_feature(XENFEAT_supervisor_mode_kernel)) {
-- 
2.30.2


