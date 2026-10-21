Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59109606A32E
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 00:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXKMryKR
Received: from list by lists.xenproject.org with outflank-mailman.1456660.1669870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJKOd-0005CK-Ky; Wed, 21 Oct 2026 00:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456660.1669870; Wed, 21 Oct 2026 00:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJKOd-0005CD-Gk; Wed, 21 Oct 2026 00:41:35 +0000
Received: by outflank-mailman (input) for mailman id 1456660;
 Wed, 21 Oct 2026 00:41:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1xJKOc-0005C7-UH
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 00:41:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJKOc-001eaY-3W
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 02:41:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6ad80a24-2eae-0a2a0a5409dd-0a2a45028cd0-10
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 02:41:34 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6ad80a3c-6ca4-0a2a45020019-ac6904fe9c88-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 02:41:33 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 062B8601FE;
 Wed, 21 Oct 2026 00:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23F21F000D0;
 Wed, 21 Oct 2026 00:41:31 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 A9D493809A0D; Wed, 21 Oct 2026 00:41:31 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:In-Reply-To:References:Date:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543291;
	bh=X2Kxv3mJpDKDJB+5pKZCRsssmwhER53b4YfHaRp0jJY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RXKMryKRvHG1QjDbjYmrorK3r8Znn/wabnd7G0UVf9tFJkp4ks84JbpaHKxrlKQyZ
	 VugmYge8S8iZytDdibGpZsMvQhmSzoxrkNn6dLjRr7tKRlgrawNAUZfVxMQkAVgGhU
	 42IvdfQ9ljXrAsqIb1ZZnIUAZT1zTutCqC0GwNzzinBkstVbHh/ykpizLVJx775tab
	 GDUJPVan10kFDgF6OEUMPqq4gKNXyRbX29+693W5kc/F/h+M5ynLyUwtIe+YznlADx
	 lcudBrjD+A07A/OF+pLHSuKkz4UDdjlFQXOXRQu/Ol2jfLPf5wIaBVdpRe+8krrE7b
	 UYXoEm9uH9ftA==
Subject: Re: [GIT PULL] xen: branch for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261015114439.418665-1-jgross@suse.com>
References: <20261015114439.418665-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20261015114439.418665-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4-rc1-tag
X-PR-Tracked-Commit-Id: 61b6d1df1d6234c38a6ea7e4f58e7da035ef6ab4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a0d3d73c112e1ffbb8cc01098b9bd2a3087b40f
Message-Id: <179254329058.289274.8850742191656357692.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 00:41:30 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-purgate-ID: tlsNG-720697/1792543294-321D72AC-BFB912EB/0/0
X-purgate-type: clean
X-purgate-size: 362
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

The pull request you sent on Thu, 15 Oct 2026 13:44:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a0d3d73c112e1ffbb8cc01098b9bd2a3087b40f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

