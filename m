Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA47F55104
	for <xen-devel@archiver.kernel.org>; Sat,  7 Mar 2026 20:01:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1248727.1546502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyxpO-0002aD-Ls; Sat, 07 Mar 2026 20:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1248727.1546502; Sat, 07 Mar 2026 20:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyxpO-0002a5-H8; Sat, 07 Mar 2026 20:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1248727;
 Sat, 07 Mar 2026 20:00:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvel=BH=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1vyxpN-0002Zz-0R
 for xen-devel@lists.xenproject.org; Sat, 07 Mar 2026 20:00:45 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51e9a76d-1a60-11f1-9ccf-f158ae23cfc8;
 Sat, 07 Mar 2026 21:00:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D651600CB;
 Sat,  7 Mar 2026 20:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E848C19422;
 Sat,  7 Mar 2026 20:00:40 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 429923808200; Sat,  7 Mar 2026 20:00:40 +0000 (UTC)
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
X-Inumbo-ID: 51e9a76d-1a60-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772913640;
	bh=3/whIQliEvBwqRoCU0LWrFeX/CEFqPM6G0VHiZFN/JM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UERpAbPFGb+G9G3LcClN/bxhKdbnqdAHFgh4gHufD7jDsEorUV8iuVdnKqPpDzEej
	 Alw8qlC24zJ4Da75Y4bN2r005NE0jHWSu+dkGGI5NaSO8C94pxtMMBkKiusE4kyUoL
	 MUX/ukENeSMNjp7kmVwY+hYBVn1iDx3zAjkOvttFAWJFf6qjLjwhoguG7kjPfxJ2Ku
	 u5838wDs7XsH6+g2RJPzvAyvwChe42d4rdmDeZ5VUfQnXoBkxWoBqBGsV//4c3yDFq
	 HARPWovwAmeR86akLIdPsuYuxjkgmcIaSqKJGPg4FzIq4h2QhF2pAa3ylHrZdpiOJL
	 5yt8sQzMO01vg==
Subject: Re: [GIT PULL] xen: branch for v7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260307100642.2365128-1-jgross@suse.com>
References: <20260307100642.2365128-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260307100642.2365128-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0-rc3-tag
X-PR-Tracked-Commit-Id: e2dcf9065536ab4a1b00828ff0d19f7d282dfecc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f912c8917e810a4aa81d122a8e7d0a918505ab9
Message-Id: <177291363909.308260.5169901742133218857.pr-tracker-bot@kernel.org>
Date: Sat, 07 Mar 2026 20:00:39 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat,  7 Mar 2026 11:06:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f912c8917e810a4aa81d122a8e7d0a918505ab9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

