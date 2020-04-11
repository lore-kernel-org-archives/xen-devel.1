Return-Path: <SRS0=o7FD=53=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA377C2D0EC
	for <xen-devel@archiver.kernel.org>; Sat, 11 Apr 2020 01:20:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 865E220769
	for <xen-devel@archiver.kernel.org>; Sat, 11 Apr 2020 01:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="na8C7w3e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 865E220769
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jN4ov-0001cj-VD; Sat, 11 Apr 2020 01:20:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Nm9=53=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1jN4ou-0001ce-9O
 for xen-devel@lists.xenproject.org; Sat, 11 Apr 2020 01:20:28 +0000
X-Inumbo-ID: a01e3c6a-7b92-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a01e3c6a-7b92-11ea-b4f4-bc764e2007e4;
 Sat, 11 Apr 2020 01:20:27 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586568026;
 bh=iqJZVbs51UGDnqdGVU5/jtBGKszBWnavKyMrnA8OuoI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=na8C7w3eu94yAlZRV/XZDZ4vkGtwQTzLcgHTuiJpmuCdK015QDUFgXNp1IAOsNJO9
 YX9rgxTmvjl7kiPx2sS6nOYrmBKmuzzDCkJwm/P5G5bHU8/dEPN6TCFYNTinWpQxjr
 SBwR8ZgDKErH4YZfQHutm7Paf4oX0ZrV23/Q3jSA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200410062430.20949-1-jgross@suse.com>
References: <20200410062430.20949-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200410062430.20949-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.7-rc1b-tag
X-PR-Tracked-Commit-Id: d6f34f4c6b4a962eb7a86c923fea206f866a40be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6383b185a998861cadb2f95d97cfe29945b9c32
Message-Id: <158656802668.16442.9324878577683276685.pr-tracker-bot@kernel.org>
Date: Sat, 11 Apr 2020 01:20:26 +0000
To: Juergen Gross <jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

The pull request you sent on Fri, 10 Apr 2020 08:24:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.7-rc1b-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6383b185a998861cadb2f95d97cfe29945b9c32

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

