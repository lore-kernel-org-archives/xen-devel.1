Return-Path: <SRS0=MtyD=NY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38377C433EF
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 20:55:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E7C61054
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 20:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02E7C61054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.177639.323199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLtkD-0000WU-C7; Thu, 02 Sep 2021 20:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177639.323199; Thu, 02 Sep 2021 20:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLtkD-0000WN-9G; Thu, 02 Sep 2021 20:55:33 +0000
Received: by outflank-mailman (input) for mailman id 177639;
 Thu, 02 Sep 2021 20:55:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQpA=NY=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1mLtkB-0000WH-Kt
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 20:55:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e829113-e956-4e45-a777-b310a79e131e;
 Thu, 02 Sep 2021 20:55:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EE4D661054;
 Thu,  2 Sep 2021 20:55:29 +0000 (UTC)
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
X-Inumbo-ID: 7e829113-e956-4e45-a777-b310a79e131e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630616130;
	bh=FL6WX8B1Oxj9domd5qdIRAc3dG4IkXovTWt6/QvWHg4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EeI2FcfmIISJKB3YsGYEiGzci0TVG6yeokjQ6hY2PlF7ONujfcPBgPd4rxc2Xnx3v
	 SAzZI+mOgkvzHltRagDkX2J3ESex3rI99S600hqBlOYwxNvvag1AvoHa9rOuJu/pmo
	 zlYT7dfJi6l6kGaIddacWaLS3u1yRjQAyc+ZPmf1DfE9GVnriV3vPnU54Yq/y91M98
	 6qx/SQRuGg39uC5hGvSAgNzguYBbKTRhcOhsMoMcVQKHKwt01yK3Tfl5002W2Hm3Jn
	 gyy0+eq6L0w0GTPWBWEBjeXPVMJNURAiGORdCsY0WsXmVwwa1mFcAELOJWqS1ozADB
	 87Y/D0m2pSgDQ==
Subject: Re: [GIT PULL] xen: branch for v5.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210902072921.27763-1-jgross@suse.com>
References: <20210902072921.27763-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210902072921.27763-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15-rc1-tag
X-PR-Tracked-Commit-Id: 58e636039b512697554b579c2bb23774061877f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9ae5fceb9a20154d74586fe17d1096b981b23e34
Message-Id: <163061612994.4397.10660862212967182115.pr-tracker-bot@kernel.org>
Date: Thu, 02 Sep 2021 20:55:29 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Thu,  2 Sep 2021 09:29:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9ae5fceb9a20154d74586fe17d1096b981b23e34

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

