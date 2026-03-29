Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C47FC97E8
	for <xen-devel@archiver.kernel.org>; Sun, 29 Mar 2026 19:28:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1267216.1556777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6vnw-0003tx-UR; Sun, 29 Mar 2026 19:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267216.1556777; Sun, 29 Mar 2026 19:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6vnw-0003tq-Qx; Sun, 29 Mar 2026 19:28:12 +0000
Received: by outflank-mailman (input) for mailman id 1267216;
 Sun, 29 Mar 2026 19:28:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1w6vnu-0003tk-OF
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2026 19:28:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6vns-008gKM-IY
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2026 21:28:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 69c97cca-5cb7-0a2a0a5109dd-0a2a4508a33c-46
 for <xen-devel@lists.xenproject.org>; Sun, 29 Mar 2026 21:28:10 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 69c97d49-1950-0a2a45080019-ac6904fed8aa-3
 for <xen-devel@lists.xenproject.org>; Sun, 29 Mar 2026 21:28:09 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C0FE60054;
 Sun, 29 Mar 2026 19:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42B9C116C6;
 Sun, 29 Mar 2026 19:28:07 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B9F403930012; Sun, 29 Mar 2026 19:27:53 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:In-Reply-To:References:Date:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774812487;
	bh=2IU6bv32d3BC9Bv3872/Z5iryshhu/ycxEmy/JZ0e60=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ufbVpb0m+YhxLsrGBzxXpo1+cblRe5iSHuPd8tasqWWeOB+a+bS2344XONUECWHKV
	 njraIXRLf8byEIUrFAXRIFjtWBADIwJNVTOd8mGTULUZOYWIhCMXUYep6d1QDjUCLg
	 nQVx+E0y5UnQc3RGG1HiS/lpngRJCnTGmmtnnpGH838GURYjgzljomeVWvfbgxY3a/
	 hjZpQXsZSZPwsGyrmu5ONt8fTkZJI9VeUegVxQNdBl7XzxB/PoylEC2FfGagEqIh4E
	 n4qE+smkjAv8pRX8N4Win7DQIRYwWpoesLe3ZOq7ZejW0mvZwGgCxlVy6EvqF2en1o
	 zcf5j9JMPtlzw==
Subject: Re: [GIT PULL] xen: branch for v7.0-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260329141354.575385-1-jgross@suse.com>
References: <20260329141354.575385-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20260329141354.575385-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0a-rc6-tag
X-PR-Tracked-Commit-Id: cd7e1fef5a1ca1c4fcd232211962ac2395601636
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b8a3bc856735a53269270bc4c7ccd04ad2355069
Message-Id: <177481247244.444538.14299549126964600323.pr-tracker-bot@kernel.org>
Date: Sun, 29 Mar 2026 19:27:52 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-purgate-ID: tlsNG-c1860d/1774812490-E2892726-D6FDCD43/0/0
X-purgate-type: clean
X-purgate-size: 363

The pull request you sent on Sun, 29 Mar 2026 16:13:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0a-rc6-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b8a3bc856735a53269270bc4c7ccd04ad2355069

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

