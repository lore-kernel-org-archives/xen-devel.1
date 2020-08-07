Return-Path: <SRS0=XA5Y=BR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06130C433DF
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2020 18:01:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BACE92075D
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2020 18:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6BaZgiT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BACE92075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k46g7-0001yB-Oz; Fri, 07 Aug 2020 18:01:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3k7=BR=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1k46g6-0001y5-2G
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 18:01:14 +0000
X-Inumbo-ID: 3a68d5d5-f24f-4d6b-8d32-54046412860b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a68d5d5-f24f-4d6b-8d32-54046412860b;
 Fri, 07 Aug 2020 18:01:13 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.9-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596823272;
 bh=0ehE2VzF4nqUoT893BcZnKAU1i5Tq0u904T1d7kqRSU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=P6BaZgiTal2HNlPXJYTR/I4aNG23E6QrY1C3ZtZGtEpbXnGTFbDeMkxruyaWUx1sR
 O3eMd0E099Q9ila7AS8vihT8eyJronZoUpSYxz6vKEBKIwqF4B0w514j5BHV3nLTDF
 tf9t4fFY8IoGQpThjruhJxRdprODIUCv4sRbQfmg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200807050450.7517-1-jgross@suse.com>
References: <20200807050450.7517-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20200807050450.7517-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.9-rc1-tag
X-PR-Tracked-Commit-Id: d7b461caa6cc64dd190577b46b0ec892a8d5e7c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e51418191f5a741b5f94764798c81bf69dec4806
Message-Id: <159682327228.30890.17036828138503121566.pr-tracker-bot@kernel.org>
Date: Fri, 07 Aug 2020 18:01:12 +0000
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

The pull request you sent on Fri,  7 Aug 2020 07:04:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e51418191f5a741b5f94764798c81bf69dec4806

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

