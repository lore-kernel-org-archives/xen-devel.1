Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A76DCA600D
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 18:40:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443677.1660839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEt2K-0004OD-3e; Thu, 08 Oct 2026 18:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443677.1660839; Thu, 08 Oct 2026 18:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEt2K-0004O6-07; Thu, 08 Oct 2026 18:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1443677;
 Thu, 08 Oct 2026 18:40:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <patchwork-bot+netdevbpf@kernel.org>)
 id 1xEt2I-0004O0-Tg
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 18:40:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEt2I-004ZRm-Af
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 20:40:10 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <patchwork-bot+netdevbpf@kernel.org>)
 id 6ac7e37b-2eae-0a2a0a5409dd-0a2a4505e2a2-14
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 20:40:10 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <patchwork-bot+netdevbpf@kernel.org>)
 id 6ac7e388-4cb1-0a2a45050019-aceafc1f8b44-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 20:40:10 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 29FED43FF2;
 Thu,  8 Oct 2026 18:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A23C1F00893;
 Thu,  8 Oct 2026 18:40:08 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F1CFB380CEC8; Thu,  8 Oct 2026 18:40:07 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:Date:References:In-Reply-To:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791484808;
	bh=XOy9VCsw6wr5foJLfeAQGfzThCHf/MXSMumL1DRZnYw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZFnYGdAPg+aN8Gw6kFG2XdkqJEbC76kf//c4JAVpB/2G6RScHAir/8V9QeXXk58K0
	 RjT0DWozxc7Q1AEIULPkH9EbZ6PLRB/JQmLsbtPbZdU8x5gr6vmvljpQNGav+VYmcj
	 0UCsFLleKbCc9sSVpBxEctTVuc/Z3UOS7nfTPGAjgzXtbPoxBG8m87bH7M0KBimKq3
	 4IK+V6jWTtj9AJEEJc6oC+B0AMhz/fmj6CiehZP/dta3THNsLQiT85lRVD5JI2dLeB
	 QRSUU2FF2org9dRKGS/TCqmMphP0Ok8eIw3MzOqJCSgyG9SBL7CRZUW76SVhIPNvUI
	 WIc/JYfKvQlYQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] xen/netfront: don't leak the skb when
 xennet_fill_frags() fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179148480652.386807.10828311641077520646.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 18:40:06 +0000
References: 
 <20261007-b4-xen-netfront-fill-frags-leak-v1-1-a8a01ff9cd52@toxicpanda.com>
In-Reply-To: 
 <20261007-b4-xen-netfront-fill-frags-leak-v1-1-a8a01ff9cd52@toxicpanda.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-purgate-ID: tlsNG-c201ff/1791484810-72EB12A1-12B114C5/0/0
X-purgate-type: clean
X-purgate-size: 871

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 07 Oct 2026 17:57:32 +0000 you wrote:
> When a response chain has more slots than fit in the skb's frags,
> xennet_fill_frags() returns an error and xennet_poll() jumps to its
> error path.  That path moves what's left on tmpq to errq to be freed,
> but the skb being filled was already dequeued from tmpq, so it's never
> freed.  Each chain that overflows leaks the skb and the pages attached
> to it as frags, and the backend decides how many slots it sends.
> 
> [...]

Here is the summary with links:
  - [net] xen/netfront: don't leak the skb when xennet_fill_frags() fails
    https://git.kernel.org/netdev/net/c/93ccaf1c26e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



