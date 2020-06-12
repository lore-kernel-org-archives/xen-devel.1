Return-Path: <SRS0=NwDn=7Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0EFC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 19:25:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D86206D7
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 19:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OT/zUEBt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0D86206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjpIw-0000Ji-1L; Fri, 12 Jun 2020 19:25:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3NgZ=7Z=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1jjpIv-0000Jd-00
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 19:25:29 +0000
X-Inumbo-ID: 7910b5ea-ace2-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7910b5ea-ace2-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 19:25:28 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.8-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591989927;
 bh=9q/une9GhfDWGBwqN44FN6ZXiUpeqgY8P7Aw4ywlCLk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=OT/zUEBtmlewIZxiIRqXsIJKlJcbjk1ofiB89Q0qTMR/T9oyWu5Ia200ifvU+E3yb
 mRvRVeW4IZV0jqIYlYWx+fwMpj/tWgUCYVNyJDm+Vji5nyWRCobywtenz7SFhso86a
 R3OSF35VvmWMcuud3GNK2Nxt9qm8o0w+0uF+dSoA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200612053747.13750-1-jgross@suse.com>
References: <20200612053747.13750-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200612053747.13750-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.8b-rc1-tag
X-PR-Tracked-Commit-Id: a952f64d14e5f8461f04cd9d729037db9099ddb0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d2d5439df22f3c2a07c5db582d4ef1b2b587ca27
Message-Id: <159198992784.4050.12743890623621670472.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jun 2020 19:25:27 +0000
To: Juergen Gross <jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pull request you sent on Fri, 12 Jun 2020 07:37:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.8b-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d2d5439df22f3c2a07c5db582d4ef1b2b587ca27

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

