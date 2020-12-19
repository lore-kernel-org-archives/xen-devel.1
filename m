Return-Path: <SRS0=C7vg=FX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40066C4361B
	for <xen-devel@archiver.kernel.org>; Sat, 19 Dec 2020 21:07:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E198323D3C
	for <xen-devel@archiver.kernel.org>; Sat, 19 Dec 2020 21:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E198323D3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.56984.99664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqjR6-0002qO-7g; Sat, 19 Dec 2020 21:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56984.99664; Sat, 19 Dec 2020 21:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqjR6-0002qH-4a; Sat, 19 Dec 2020 21:06:44 +0000
Received: by outflank-mailman (input) for mailman id 56984;
 Sat, 19 Dec 2020 21:06:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NQRv=FX=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kqjR5-0002qC-A9
 for xen-devel@lists.xenproject.org; Sat, 19 Dec 2020 21:06:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5df17a51-13b5-443b-96df-25a4400f6199;
 Sat, 19 Dec 2020 21:06:42 +0000 (UTC)
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
X-Inumbo-ID: 5df17a51-13b5-443b-96df-25a4400f6199
Subject: Re: [GIT PULL] xen: branch for v5.11-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608412001;
	bh=f5biQxtgpOle2K8edxfWw3ThimfyDmYI41acGeS0PZE=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=joPvXhHC0NDC8iOfyqRBKoyqp76EpSOJ3VbLoTBEL/J/UKgnMTI94v7bdrw4vpwJR
	 rjRtKvtbjGHcZZxAAwv/1mKzNV4J4+Bm7/5/zIfOCgO0g2HBdKV1+kYaspNrJ8m4pZ
	 HTfNjZle+5/P9p5VyDAxUlr18p1Ikg4P53QgygxDrCq4vYbfOSkesyUDHa9EVuaynS
	 irS2323/EMxJOHhgqydtVkRjkFW0PfcrFbtPoc4j2mm1rJgIXbGPMX0weU17/Wahnd
	 bcfldX1GVDT9wSJRVykcSp/52i9W6V0G5SxLQ3y0ik5S/Mxjcibucfq9MvFbjbxX1C
	 VJY/HMXlQ35fg==
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201219063136.5828-1-jgross@suse.com>
References: <20201219063136.5828-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201219063136.5828-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc1b-tag
X-PR-Tracked-Commit-Id: 6190c0ccaf5dfee845df9c9cd8ad9fdc5856bb41
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3872f516aab34e3adeb7eda43b29c1ecd852cee1
Message-Id: <160841200137.20285.209923367667109463.pr-tracker-bot@kernel.org>
Date: Sat, 19 Dec 2020 21:06:41 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sat, 19 Dec 2020 07:31:36 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc1b-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3872f516aab34e3adeb7eda43b29c1ecd852cee1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

