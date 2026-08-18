Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55AFC5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 19:16:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394404.1633198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwPHg-0002LT-6T; Tue, 18 Aug 2026 19:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394404.1633198; Tue, 18 Aug 2026 19:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwPHg-0002LM-3a; Tue, 18 Aug 2026 19:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1394404;
 Tue, 18 Aug 2026 19:15:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1wwPHe-0002LF-1W
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 19:15:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwPHc-00G6o9-Gz
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 21:15:36 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6a84af46-bab6-0a2a0a5309dd-0a2a45038cbc-24
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 21:15:36 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6a84af57-fae8-0a2a45030019-ac6904fe8996-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 21:15:36 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E86360A5D;
 Tue, 18 Aug 2026 19:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554EF1F01563;
 Tue, 18 Aug 2026 19:15:34 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 198D83927051; Tue, 18 Aug 2026 19:14:47 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:In-Reply-To:References:Date:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787080534;
	bh=WQ/hUD8aUQayFuFPezMfBtkN2LU+sg4JGiFoFwMC0j0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=gVyAhbaYoAj6RUAY7f97oNyGgiX+ZGVY0y9YGUbpC/BO8oBrt/olVbHwpZgws9r1l
	 yigkEd5IBU0H4cV7nQYEbnY4Fc8fhbckqSM4mcJPdxpP6JryRO+8MwHNXet0lqguwn
	 Vpj98ZNIg8Tts6afReILs+oowhhGCJmsVkk17xvDgW1isz259E2PTJijcvLk3nD4FB
	 a9ENfnc7GW3u2d6o2CJsFv+ayGFUSLOFoD+WRvdUxLpHs+A4AOJvKb/WGXcHybeIp7
	 zzA5WZBCBs9+VYFor5PIFZFpLRbxMInqzapvLrk9x2Ap/d2ocVHYlsvxyuP5LHKYpT
	 UUWd5hNNL8BQg==
Subject: Re: [GIT PULL] xen: branch for v7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260814112112.4042845-1-jgross@suse.com>
References: <20260814112112.4042845-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260814112112.4042845-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.3-rc1-tag
X-PR-Tracked-Commit-Id: d330fb86a7170f845123ae82d95df440fad9b707
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2df813c9a6b6704b75aec7538d2225292e6b6fe6
Message-Id: <178708048575.2235733.17985325151202501364.pr-tracker-bot@kernel.org>
Date: Tue, 18 Aug 2026 19:14:45 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-purgate-ID: tlsNG-33051d/1787080536-6CEDA4E9-B00B0950/0/0
X-purgate-type: clean
X-purgate-size: 362

The pull request you sent on Fri, 14 Aug 2026 13:21:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.3-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2df813c9a6b6704b75aec7538d2225292e6b6fe6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

