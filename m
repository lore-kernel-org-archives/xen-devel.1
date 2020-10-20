Return-Path: <SRS0=M+rI=D3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F341AC4363A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 16:46:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A87F206CA
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 16:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kdw5wA9B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A87F206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9730.25639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUulu-00010g-TS; Tue, 20 Oct 2020 16:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9730.25639; Tue, 20 Oct 2020 16:46:02 +0000
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
	id 1kUulu-00010Z-PZ; Tue, 20 Oct 2020 16:46:02 +0000
Received: by outflank-mailman (input) for mailman id 9730;
 Tue, 20 Oct 2020 16:46:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0Jl=D3=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kUult-00010U-7m
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 16:46:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78497dd5-d72f-44df-8ae6-6193ebe13954;
 Tue, 20 Oct 2020 16:46:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C0Jl=D3=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
	id 1kUult-00010U-7m
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 16:46:01 +0000
X-Inumbo-ID: 78497dd5-d72f-44df-8ae6-6193ebe13954
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 78497dd5-d72f-44df-8ae6-6193ebe13954;
	Tue, 20 Oct 2020 16:46:00 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.10-rc1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603212359;
	bh=0uoEpXADZJVCdJfgfoNUy1KQNOLib6qZkZ6gL0UTJug=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=Kdw5wA9Blt4AX6Kc2sijE5AWBlZsMrLIoyB2x2qWPqIZgiumNhIKctaOPMn5/WSAq
	 UMKLBS4qoVnPfV1EQ6XXq6o/Xc5hCrZijXA4OLaxsCO2W0cKqjt9kESt4HWtIXbQcQ
	 kies03Bh2QTUPO5FGGuFuCnfFhsMrsIzELIdq5nE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201020120956.29708-1-jgross@suse.com>
References: <20201020120956.29708-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20201020120956.29708-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc1b-tag
X-PR-Tracked-Commit-Id: 5f7f77400ab5b357b5fdb7122c3442239672186c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a5bb973fa0353d25dbe854694c71bb58eb4cf78
Message-Id: <160321235968.11581.17952625512231850079.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2020 16:45:59 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Tue, 20 Oct 2020 14:09:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc1b-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a5bb973fa0353d25dbe854694c71bb58eb4cf78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

