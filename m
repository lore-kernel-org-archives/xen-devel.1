Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE30CA600D
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 18:40:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443678.1660848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEt2Q-0004bX-96; Thu, 08 Oct 2026 18:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443678.1660848; Thu, 08 Oct 2026 18:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEt2Q-0004bQ-6A; Thu, 08 Oct 2026 18:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1443678;
 Thu, 08 Oct 2026 18:40:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <patchwork-bot+netdevbpf@kernel.org>)
 id 1xEt2O-0004ar-Sg
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 18:40:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEt2O-005dXG-5u
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 20:40:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <patchwork-bot+netdevbpf@kernel.org>)
 id 6ac7e35a-e002-0a2a0a5209dd-0a2a45098e74-42
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 20:40:16 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <patchwork-bot+netdevbpf@kernel.org>)
 id 6ac7e38e-be1a-0a2a45090019-ac6904fec0f8-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 20:40:15 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 56811602D4;
 Thu,  8 Oct 2026 18:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3471F00898;
 Thu,  8 Oct 2026 18:40:14 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F170C380CEC8; Thu,  8 Oct 2026 18:40:13 +0000 (UTC)
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
	s=k20260515; t=1791484814;
	bh=VkDY4ley1sWol3yb7WWyF4QJs3i/YJjEQTTXobutVZM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PJwc4GiZZYOldv17sp8Wbd5dZHYRxlbCEjXpM7m8KfHhoRfuJhF4nCkeNels1AOWY
	 /c0T4I8kXGt2G7KecUytwwHjpgVOT7YC1e5z1uRqbzQgvUVjLYWza6peUvrIShJ6lk
	 HBs9MRyZLz4WG6hsYhcf6kYCfxj/NZVtXM9I0NfTNGtegslWE2bGcPVUuBFAOXJVeS
	 33ERJzN7z5nuiRBHmB+xGRL7IqzOkfV4gA25LY3CjA5n49uGuxP5+/BfSYpkZpaBjq
	 1hbTGWcuC1T6L0aLRjYTXBTk/AyGuPVi8S4aSiyEFyeCsHCWmRrl8R9xnNxc1wAhvx
	 SK7Mgbn4X/OAQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] xen/netfront: drop RX packets with a short Ethernet
 header
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179148481252.386807.13451642616243196690.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 18:40:12 +0000
References: 
 <20261007-b4-xen-netfront-short-head-v1-1-12d7113a7e4e@toxicpanda.com>
In-Reply-To: 
 <20261007-b4-xen-netfront-short-head-v1-1-12d7113a7e4e@toxicpanda.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, chrisw@sous-sol.org,
 jeremy@xensource.com, jeff@garzik.org, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-purgate-ID: tlsNG-bad1c0/1791484816-BE2C4034-0066B19E/0/0
X-purgate-type: clean
X-purgate-size: 1010

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 07 Oct 2026 17:55:40 +0000 you wrote:
> handle_incoming_queue() pulls pull_to bytes into the head before
> calling eth_type_trans().  pull_to is the length of the first RX slot,
> capped at RX_COPY_THRESHOLD, and that length comes from the backend.
> Nothing checks it against ETH_HLEN.
> 
> If the first slot is shorter than ETH_HLEN and more slots follow, the
> head ends up shorter than an Ethernet header while skb->len is longer,
> and eth_type_trans() BUG()s in __skb_pull().  If the whole packet is
> shorter than ETH_HLEN, eth_type_trans() reads the header past the end
> of the data instead.
> 
> [...]

Here is the summary with links:
  - [net] xen/netfront: drop RX packets with a short Ethernet header
    https://git.kernel.org/netdev/net/c/089e58805c45

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



