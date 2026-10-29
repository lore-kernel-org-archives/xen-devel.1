Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE7A606A332
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ikpslf4Y
Received: from list by lists.xenproject.org with outflank-mailman.1465064.1675924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMUfm-00010w-Fz; Thu, 29 Oct 2026 18:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465064.1675924; Thu, 29 Oct 2026 18:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMUfm-00010p-Cr; Thu, 29 Oct 2026 18:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1465064;
 Thu, 29 Oct 2026 18:16:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xMUfl-00010j-7L
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 18:16:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMUfk-00FEGc-Kb
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 19:16:20 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6ae38d57-8faa-0a2a0a5109dd-0a2a4503e5d6-38
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 19:16:20 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6ae38d72-fae8-0a2a45030019-aceafc1f9c80-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 19:16:20 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 35D53429FB;
 Thu, 29 Oct 2026 18:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2D61F01824;
 Thu, 29 Oct 2026 18:16:17 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:To:Cc:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793297778;
	bh=/4gAgQ/v/3Bqijm1D2LCxgkMVVLMB4tDzBQLcSYjwMI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ikpslf4YPUkOg5LrHDzFgpYpKlX9FjGI+vmKTVrkbTykNdR7VwZu7cuqgx8Yyyf5u
	 VxZ2apLVqTOJZmkvDA6luWYsH7hWhs45Ws60v8fHW8UN+rdMJn/VBdRw0kDXaw3Jc2
	 qd1jSc34CrKjp7nDXowZxk3Vp5ciTuDwiLLOQYUPlbiChTCMtKCqVtOkxwHT6ZuaqQ
	 IGOfQ2Tl1TYNJfzIm56KyHVSrp4E5A/OL9DqlVLuHSQe9r8Al3F4EioOnW4avwZm61
	 CtL3L3vpbIMk0jI66u/nTOSXxcL/J+3W9yuuoa5JIKprYgm+2NMd4uw61yfTnI8rNf
	 z683LYB2t5TLA==
Subject:
 Re: [PATCH] xen-netback: wait for RCU readers before freeing queues on error
From: netdev-bot+sashiko@kernel.org
To: yhlee@isslab.korea.ac.kr
Cc: wei.liu@kernel.org, paul@xen.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 29 Oct 2026 18:16:16 +0000
Message-ID: <179329777698.3134.1942941250754899235@kernel.org>
In-Reply-To: <20261027121438.1266207-1-yhlee@isslab.korea.ac.kr>
References: <20261027121438.1266207-1-yhlee@isslab.korea.ac.kr>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-33051d/1793297780-772F54E9-12FC1EAD/0/0
X-purgate-type: clean
X-purgate-size: 4611
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix leaves the use-after-free open when the very first queue
  fails, which is every failure for a single-queue frontend.
- [Low] The commit message names xenvif_get_stats64() as one of the RCU
  readers, but xen-netback has no such function.

--

xen-netback: wait for RCU readers before freeing queues on error

This patch changes the connect() error path in xen-netback. It now
publishes num_queues = 0 and calls synchronize_net() before it deinits
and frees vif->queues, which is what backend_disconnect() already does.
The goal is to stop RCU stats readers from dereferencing the freed
vmalloc array.

> The net device is registered in xenvif_alloc() during probe, so it is
> already live when connect() runs. xenvif_get_stats64() and
> xenvif_get_ethtool_stats() read it through the usual stats paths, taking

[Severity: Low]
This isn't a bug, but xen-netback has no xenvif_get_stats64(). The driver
only implements the legacy callback:

drivers/net/xen-netback/interface.c:
	.ndo_get_stats	= xenvif_get_stats,

The KASAN trace also shows that function (xenvif_get_stats+0x28f). Should
the commit message say xenvif_get_stats() instead?

> diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
> index e020f44ac2c71..d1c9e38cfb8ef 100644
> --- a/drivers/net/xen-netback/xenbus.c
> +++ b/drivers/net/xen-netback/xenbus.c
> @@ -835,10 +835,21 @@ static void connect(struct backend_info *be)
>  	return;
>  
>  err:
> -	if (be->vif->num_queues > 0)
> +	if (be->vif->num_queues > 0) {
> +		unsigned int num_queues = be->vif->num_queues;
> +
>  		xenvif_disconnect_data(be->vif); /* Clean up existing queues */
> -	for (queue_index = 0; queue_index < be->vif->num_queues; ++queue_index)
> -		xenvif_deinit_queue(&be->vif->queues[queue_index]);
> +
> +		/*
> +		 * Mirror backend_disconnect(): publish num_queues == 0 and
> +		 * synchronize_net() so RCU stats readers finish before the free.
> +		 */
> +		be->vif->num_queues = 0;
> +		synchronize_net();
> +
> +		for (queue_index = 0; queue_index < num_queues; ++queue_index)
> +			xenvif_deinit_queue(&be->vif->queues[queue_index]);
> +	}
>  	vfree(be->vif->queues);

[Severity: High]
Is the use-after-free still open when the very first queue fails?

Earlier in connect(), num_queues is published before any queue is set up:

	be->vif->num_queues = requested_num_queues;
	be->vif->stalled_queues = requested_num_queues;

If xenvif_init_queue() or connect_data_rings() then fails for
queue_index 0, the failure branch resets the count. For example, when
connect_data_rings() fails:

	xenvif_deinit_queue(queue);
	be->vif->num_queues = queue_index;
	goto err;

This sets num_queues to 0, so the new if (be->vif->num_queues > 0) block
is skipped. synchronize_net() never runs, and vfree(be->vif->queues)
happens with no grace period.

A reader that sampled a non-zero num_queues during the
connect_data_rings() window could still be inside rcu_read_lock():

xenvif_get_stats() {
	rcu_read_lock();
	num_queues = READ_ONCE(vif->num_queues);
	for (index = 0; index < num_queues; ++index) {
		queue = &vif->queues[index];
	...
}

xenvif_get_ethtool_stats() follows the same pattern.

multi-queue-num-queues defaults to 1, and with one queue every failure
happens at queue_index 0. So for a default single-queue frontend, a guest
that supplies a bad ring reference or event channel would still reach
this vfree() without a grace period.

The new comment says this mirrors backend_disconnect(). However,
backend_disconnect() calls synchronize_net() before vfree(vif->queues)
whatever the queue count is.

The commit message says connect() jumps to err: "with num_queues still
counting the queues already set up". That doesn't hold in the queue 0
case.

Should the grace period run whenever vif->queues was allocated and
num_queues was published, and not only when num_queues > 0 at the err
label?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261027121438.1266207-1-yhlee%40isslab.korea.ac.kr

