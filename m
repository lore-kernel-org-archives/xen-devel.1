Return-Path: <SRS0=r6CN=HX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C17C433DB
	for <xen-devel@archiver.kernel.org>; Sun, 21 Feb 2021 22:02:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83DE664FD5
	for <xen-devel@archiver.kernel.org>; Sun, 21 Feb 2021 22:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83DE664FD5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.87695.164844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDwni-0003Kq-3y; Sun, 21 Feb 2021 22:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87695.164844; Sun, 21 Feb 2021 22:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDwni-0003Kj-16; Sun, 21 Feb 2021 22:02:02 +0000
Received: by outflank-mailman (input) for mailman id 87695;
 Sun, 21 Feb 2021 22:02:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4AH=HX=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lDwng-0003Ke-VS
 for xen-devel@lists.xenproject.org; Sun, 21 Feb 2021 22:02:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d68e9947-57e3-45b7-aea5-19a6dbbe5def;
 Sun, 21 Feb 2021 22:01:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AE06364ED7;
 Sun, 21 Feb 2021 22:01:57 +0000 (UTC)
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
X-Inumbo-ID: d68e9947-57e3-45b7-aea5-19a6dbbe5def
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613944917;
	bh=mK3C99UKZixS/nnfE5aagPIFw7iVd/1vCpSt8FauGUc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VXG4inXsdwoOIuUytoDO6GsuKxYBT2e20sD4yHWdXpya6idATdol9dAqJ4oLIvn4R
	 arezUGuQ86km5mHbF6sWtmM5jT4EnJdRm4o2OppoFUyt/Fx1ILenikNVEWOVn/xj+R
	 Q351H+xwReoQZEArvwmof2fcBDs6aTcL1+CirYJ+J0DXZqc5rZvj4N/+O2vZvXG3Bp
	 YJSPUkXxvL1AbsMWuZEzX1mgAFLtgK1ZgigLEDgE18nA2ce6aUpADIu5pQ+WI26uE0
	 pyQhzO73bajhD3fLP1+lEfXLMz33trXw9wihp8G7Ruv+bWC4owYc0FVYC2XvIC0ijZ
	 mNKOHPX+DfpeQ==
Subject: Re: [GIT PULL] xen: branch for v5.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210216124015.28923-1-jgross@suse.com>
References: <20210216124015.28923-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20210216124015.28923-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12-rc1-tag
X-PR-Tracked-Commit-Id: 871997bc9e423f05c7da7c9178e62dde5df2a7f8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a037ad5d115b2cc79a5071a7854475f365476fa
Message-Id: <161394491769.8676.1427666132870005356.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 22:01:57 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Tue, 16 Feb 2021 13:40:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a037ad5d115b2cc79a5071a7854475f365476fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

