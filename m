Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349C0CA6017
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:11:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443858.1661011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvOs-00036M-0C; Thu, 08 Oct 2026 21:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443858.1661011; Thu, 08 Oct 2026 21:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvOr-00036F-Sm; Thu, 08 Oct 2026 21:11:37 +0000
Received: by outflank-mailman (input) for mailman id 1443858;
 Thu, 08 Oct 2026 21:11:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kuba@kernel.org>) id 1xEvOq-000368-9E
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:11:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvOp-005uKM-1W
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:11:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kuba@kernel.org>)
 id 6ac806e8-2eae-0a2a0a5409dd-0a2a4506cdc8-28
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:11:34 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kuba@kernel.org>)
 id 6ac80705-195a-0a2a45060019-aceafc1fc0e8-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:11:34 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C9CAC42D5E;
 Thu,  8 Oct 2026 21:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0CF1F000FF;
 Thu,  8 Oct 2026 21:11:32 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791493892;
	bh=lO9Q2e8Y8FPOsNAN94Y+ZK3KJEQqlWXugM2M+fiTfDI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=S706qOQl1KAdCZOgdDVMYgOE4hYOCFoLj0OyQ4qoN9BspPLdeodADinWXSjmhRHPm
	 YK6++L4AqfMMStuF3wzAtgh6ofzYLZyTuNkxuyHRftbWxys9dfl71hAL2ADlumB2j4
	 Tlf+AacXZTvAllcV36WUE+Y/a0IFDRwSp+VV1bOhp608vbuhGe4I50uG/6bjXTuRbU
	 MgtwPQ9PON+9mJdWcdYRCA/L+ckiTY+6L5j/raZg/L3j8/d3+Hj0xoxEow7kB5Iox5
	 crTPl9+UhAUBLNXTGVR130JjQDVJHP9OplaEfsJcnRyehfe3Di3kCPBvhOprydKfRb
	 IRpNlHZe0yUqQ==
Date: Thu, 8 Oct 2026 14:11:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan
 <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Manish Chopra
 <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v2 00/10] net: stop calling __pskb_pull_tail()
 from drivers
Message-ID: <20261008141131.0ac356dd@kernel.org>
In-Reply-To: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1791493894-1F6C877B-FE15340C/0/0
X-purgate-type: clean
X-purgate-size: 685

On Thu, 08 Oct 2026 21:02:47 +0000 Josef Bacik wrote:
> v1->v2:
> - New 1/10: skb_drop_empty_frags(). xen-netfront, netxen and qlcnic
>   relied on __pskb_pull_tail() releasing zero-length frags even when
>   there's nothing to pull, which pskb_may_pull() doesn't do (Sashiko).
> - xen-netfront, netxen, qlcnic: call skb_drop_empty_frags() after
>   pskb_may_pull().
> - skb_drop_empty_frags() checked with a boot-time test under KASAN and
>   kmemleak, on cloned and uncloned skbs.

Please keep in mind that we ask people to limit themselves to 15
outstanding patches per tree. You have 18 right now.
(200 active netdev contributors + an LLM) x 20 patches == insanity :/

