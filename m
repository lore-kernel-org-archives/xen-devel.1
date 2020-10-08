Return-Path: <SRS0=UaJJ=DP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE333C433DF
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:21:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B18B2184D
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:21:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="r83oyq+s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B18B2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.4610.12158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbT5-0001uP-Ke; Thu, 08 Oct 2020 19:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4610.12158; Thu, 08 Oct 2020 19:20:47 +0000
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
	id 1kQbT5-0001uI-Gn; Thu, 08 Oct 2020 19:20:47 +0000
Received: by outflank-mailman (input) for mailman id 4610;
 Thu, 08 Oct 2020 19:20:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/F0=DP=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kQbT4-0001uD-62
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:20:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 685cba4c-56c4-458a-aed8-d539b026cfcb;
 Thu, 08 Oct 2020 19:20:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=R/F0=DP=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
	id 1kQbT4-0001uD-62
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:20:46 +0000
X-Inumbo-ID: 685cba4c-56c4-458a-aed8-d539b026cfcb
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 685cba4c-56c4-458a-aed8-d539b026cfcb;
	Thu, 08 Oct 2020 19:20:45 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.9-rc9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602184844;
	bh=QKVreTOtOfv+UqyeLrweLlXPIWls8Uj8qpGVUvUyd6M=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=r83oyq+sD2C9B6GiqlVxUhMtlPEL0uJbZBF6cHRxmtQ6KkwackHEu4wJ5tTsTxjte
	 PeNdnKbY93WfqSfWqOSyGfwFt8dS4iLvvRnSE9wnsLaph8VBREichGxONHUkZMH7Z7
	 KqZuIWrdD6V8J5lj2M58M1NHeEvfj4wJ6Jx88Bhc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201007063804.21597-1-jgross@suse.com>
References: <20201007063804.21597-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20201007063804.21597-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9b-rc9-tag
X-PR-Tracked-Commit-Id: 5a0677110b73dd3e1766f89159701bfe8ac06808
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86f0a5fb1b98e993fd43899d6640c7b9eec5000a
Message-Id: <160218484456.22350.13183729801289360481.pr-tracker-bot@kernel.org>
Date: Thu, 08 Oct 2020 19:20:44 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Wed,  7 Oct 2020 08:38:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9b-rc9-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86f0a5fb1b98e993fd43899d6640c7b9eec5000a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

