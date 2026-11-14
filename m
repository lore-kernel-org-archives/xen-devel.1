Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99939606A32E
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntvIk4zq
Received: from list by lists.xenproject.org with outflank-mailman.1489292.1690848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSJ16-0000Pi-RC; Sat, 14 Nov 2026 19:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489292.1690848; Sat, 14 Nov 2026 19:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSJ16-0000Pa-ND; Sat, 14 Nov 2026 19:02:24 +0000
Received: by outflank-mailman (input) for mailman id 1489292;
 Sat, 14 Nov 2026 19:02:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1xSJ16-0000PU-BC
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 19:02:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSJ15-003AYd-OY
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 20:02:23 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6af8b010-8faa-0a2a0a5109dd-0a2a4502b858-8
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 20:02:23 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6af8b03e-6ca4-0a2a45020019-ac6904fedcc6-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 20:02:23 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FF496278C;
 Sat, 14 Nov 2026 19:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455721F000C5;
 Sat, 14 Nov 2026 19:02:21 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3A55E380821F; Sat, 14 Nov 2026 19:02:21 +0000 (UTC)
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
	s=k20260515; t=1794682941;
	bh=rTQls0dGboxwD1qIgMh/h9S9atorSO8WtqfcOKvBL1A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ntvIk4zq2LSQ3UPFUCf0GTUwugijQsuTnZxHY/vaLHJe9xsbbJQEAr8m6EMtAqYQK
	 19FmFmhbSjS8Q7eE82HLKxGZdMdOZ2K8/RioCI3lDHN44hdTYqiJ6nIJbTJ8JOpMFU
	 7ZyJ4tGlJFtDhr4uzjhyFjn3jV0XVilPhoB3VbIMfkrYXC/xTAkn0sY6af8fdOrzHG
	 DSdP4cqz628t8jzbyW6s7DI2jHAoecGyhALPAA2xCR5koy+r7WEAYJO81b8/jRTkmg
	 0Lk49a8kClXI/XIQrScEPzqrqrnWkyktY880vESYWbS9Qqw95NKlNdC7A577Vovw2y
	 FG6NbtzMENwLw==
Subject: Re: [GIT PULL] xen: branch for v7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261114064543.1079564-1-jgross@suse.com>
References: <20261114064543.1079564-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20261114064543.1079564-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4a-rc3-tag
X-PR-Tracked-Commit-Id: 2b66f2cc753243a6adb3e9a5c038b0fc59ba7ec9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23c62304dde29abe92013d85910d03a77dada35d
Message-Id: <179468293974.2342540.13763964076757328991.pr-tracker-bot@kernel.org>
Date: Sat, 14 Nov 2026 19:02:19 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-purgate-ID: tlsNG-720697/1794682943-F10A02AC-303F9D7B/0/0
X-purgate-type: clean
X-purgate-size: 363
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

The pull request you sent on Sat, 14 Nov 2026 07:45:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4a-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23c62304dde29abe92013d85910d03a77dada35d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

