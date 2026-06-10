Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FD3CD98C6
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 15:57:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1334533.1597533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXLIK-00078Y-12; Wed, 10 Jun 2026 15:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334533.1597533; Wed, 10 Jun 2026 15:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXLIJ-00078R-UV; Wed, 10 Jun 2026 15:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1334533;
 Wed, 10 Jun 2026 15:56:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wXLII-00078J-JL
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 15:56:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXLIH-00CQ7M-P2
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 17:56:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a298939-bab6-0a2a0a5309dd-0a2a4509bcd2-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:56:41 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a298938-2497-0a2a45090019-ac6904fec6d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:56:41 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D362760172;
 Wed, 10 Jun 2026 15:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255081F00893;
 Wed, 10 Jun 2026 15:56:39 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781106999;
	bh=OVYQFfLKJF4iLeCO+8a3Ef3RTz9KqGXiHZuRczNGxoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=fJnygjQTi+R1+420KQ85+gT3RmXsZZaz4WjIV6ynVzFnnbZ6fratXkbDZtnJ5Ngjj
	 OFH7C5kNaTbl49hPSXrN4ufO91HyKY/PWYMzALL1rte5ha1+BhXGH8CLeUyKoj7uZX
	 RrldQPpOAugUc7k2w/49TaZ3EtfMyL5lHnTnHEaY43SIpFT1S0O0C/tr1tvwY9VUUo
	 Xc1TOsCB1T8o51QdCanXk80hljIh+tSMYR5RKtEY3OaXXF8XLHLO6c306Xxz5V5G1e
	 uCzEQL6ZqGQ2UFamfEAHwDPhpx6uMwfOgTuwCMPjq/TEGXGzqDuFMgWMFaT7N1DNKd
	 RPYOOpl3f9Rrg==
Date: Wed, 10 Jun 2026 08:56:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Subject: Re: [PATCH] MAINTAINERS: remove RTDS specific entry
In-Reply-To: <20260610072308.597383-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2606100856250.368315@ubuntu-linux-20-04-desktop>
References: <20260610072308.597383-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-bad1c0/1781107001-89D85A53-1214120C/0/0
X-purgate-type: clean
X-purgate-size: 1222

On Wed, 10 Jun 2026, Juergen Gross wrote:
> Remove the RTDS scheduler specific entry in MAINTAINERS.
> 
> The effective changes will be:
> 
> - Meng will no longer be a maintainer. His last Ack on a RTDS patch
>   was given in 2019, since then I can't remember having seen any
>   reaction on a RTDS patch.
> 
> - I'll be made a maintainer of this scheduler. Dario has indicated
>   that he doesn't have lots of cycles for doing reviews, so he would
>   be grateful for not being effectively the only maintainer of the
>   RTDS scheduler.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccb01b8e39..195d6cb0e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -515,12 +515,6 @@ S:	Supported
>  F:	config/riscv64.mk
>  F:	xen/arch/riscv/
>  
> -RTDS SCHEDULER
> -M:	Dario Faggioli <dfaggioli@suse.com>
> -M:	Meng Xu <mengxu@cis.upenn.edu>
> -S:	Supported
> -F:	xen/common/sched/rt.c
> -
>  SCHEDULING
>  M:	Dario Faggioli <dfaggioli@suse.com>
>  M:	Juergen Gross <jgross@suse.com>
> -- 
> 2.54.0
> 

