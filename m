Return-Path: <SRS0=E0OE=L7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7011BC07E95
	for <xen-devel@archiver.kernel.org>; Wed,  7 Jul 2021 18:45:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D37161CD1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Jul 2021 18:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D37161CD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.152672.282027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1CY4-0002Al-Qd; Wed, 07 Jul 2021 18:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152672.282027; Wed, 07 Jul 2021 18:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1CY4-0002Ae-NS; Wed, 07 Jul 2021 18:45:28 +0000
Received: by outflank-mailman (input) for mailman id 152672;
 Wed, 07 Jul 2021 18:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozWG=L7=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1m1CY2-0002AS-Ve
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 18:45:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e0444e6-df53-11eb-8520-12813bfff9fa;
 Wed, 07 Jul 2021 18:45:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1F74761CCC;
 Wed,  7 Jul 2021 18:45:25 +0000 (UTC)
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
X-Inumbo-ID: 7e0444e6-df53-11eb-8520-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625683525;
	bh=kdfpLu1SsHBuIdOzsEkc8SEq6yaCdkgmUWedy83UZdI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tacU79ggiYoCmccnpL7d5ZnPbXlKbuqXdL/LE2YfFfvk5zjIbzM1wkTChNmUfkWAA
	 JtsPKxPckrARc7w1mt/kHjjMB64lSu60OCiCIXrZleXLwUr2C/QdXaHHSbba10Ba/r
	 lyHpAm7rdbMQ3Blp+YxI0aR0Wje1rGuGMvCjk9JzXTtz49NDtvKapDz3pj1xJ2a5gT
	 GrvLXGjRlFuwvTDqqVaWd6MDOD+aPe0PGA7AHM+AA1yen4gxOIN5d25M8TnMpbvj2X
	 nJN0DhVupvd7Mm70s8Ini2XFUvb8aAZM7qgQbX+0n2V2UiXb/CqsmT53uF9XBswbw5
	 dOoHwq18JJ8Aw==
Subject: Re: [GIT PULL] xen: branch for v5.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210707070139.27901-1-jgross@suse.com>
References: <20210707070139.27901-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20210707070139.27901-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.14-rc1-tag
X-PR-Tracked-Commit-Id: 629a5d87e26fe96bcaab44cbb81f5866af6f7008
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ea90317956718e0648e1f87e56530db809a5a04
Message-Id: <162568352509.3837.16922329777846284070.pr-tracker-bot@kernel.org>
Date: Wed, 07 Jul 2021 18:45:25 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Wed,  7 Jul 2021 09:01:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.14-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ea90317956718e0648e1f87e56530db809a5a04

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

