Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8244C433E6
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 18:16:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EB6964E1D
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 18:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EB6964E1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77384.140132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Bqe-0000us-Oe; Thu, 28 Jan 2021 18:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77384.140132; Thu, 28 Jan 2021 18:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Bqe-0000ul-LR; Thu, 28 Jan 2021 18:16:52 +0000
Received: by outflank-mailman (input) for mailman id 77384;
 Thu, 28 Jan 2021 18:16:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQK/=G7=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1l5Bqd-0000uc-4v
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 18:16:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c26ea908-f2f9-4650-a7ff-71864c9d690f;
 Thu, 28 Jan 2021 18:16:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8607F64DD6;
 Thu, 28 Jan 2021 18:16:49 +0000 (UTC)
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
X-Inumbo-ID: c26ea908-f2f9-4650-a7ff-71864c9d690f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611857809;
	bh=Vsx1Ju0nrtc77La+1/b7FukHFhWwN97G6/D+OMcqSlA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qyw6OHV2AkZOzukNoZ9cBCwcs5lBk2RV5HLXWb3ojSLG8BGnQvX8bl6lTKf6R7O35
	 hnGZMNIboj1n+K3yhqbVc0M5X17qa67AbQKIF3Aky+gDzM9Ps7a/l/zRcBQ/e/IK0c
	 A3k6xiIOsyQgzWqW8jGq6ZFJ08DnErmvYekLskGULFS2yMFwzrvLRuAwoU1h5Oceh1
	 l7qHxM0yoqGRm2jlc41yHaZQQIfXlwRna1LrmRU+C9II0/MWqWlBPSKvg1x457+0qa
	 DvQbsBNlfEO7eNy8dhAo8hVJ+t1nvT0PRCT/Mf6yQW5GFR8ivMmHsED1bq44X9DdKU
	 WQ0GSx6qtWwPQ==
Subject: Re: [GIT PULL] xen: branch for v5.11-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210128153356.13823-1-jgross@suse.com>
References: <20210128153356.13823-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20210128153356.13823-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc6-tag
X-PR-Tracked-Commit-Id: 2e92493637a09547734f92c62a2471f6f0cb9a2c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e5ff2cb9cf67a542f2ec7fb87e24934c88b32678
Message-Id: <161185780937.19532.16214043316764551663.pr-tracker-bot@kernel.org>
Date: Thu, 28 Jan 2021 18:16:49 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Thu, 28 Jan 2021 16:33:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc6-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e5ff2cb9cf67a542f2ec7fb87e24934c88b32678

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

