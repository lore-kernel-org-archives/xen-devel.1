Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47AFCC6B3C
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:06:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445723.1665813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEG-0006iq-UO; Thu, 15 Oct 2026 12:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445723.1665813; Thu, 15 Oct 2026 12:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEG-0006ij-Qj; Thu, 15 Oct 2026 12:06:36 +0000
Received: by outflank-mailman (input) for mailman id 1445723;
 Sun, 11 Oct 2026 19:04:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xFyq5-00044n-CW
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 19:04:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFyq4-0075vT-3a
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 21:04:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6acbdd86-bab6-0a2a0a5309dd-0a2a450b960c-20
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 21:04:03 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6acbdda2-b7e8-0a2a450b0019-ac6904fe9d92-3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 21:04:03 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E9B66600E2;
 Sun, 11 Oct 2026 19:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A731F0089B;
 Sun, 11 Oct 2026 19:03:59 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:To:Cc:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791745441;
	bh=LdxMvCC8JxkBtq+BNVpskgNv+Iemqb0CitObZkcZf3A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UzzUYkcxQOL0XlmelgcWjoUE8uZ5mu43l+m4m3WaR9oNIw62zCnUniB7tzEWo2BrB
	 m/LtSCL5ygDk1oFfZBldkSOb9zcjhLNCiL0ryQ8J7LHAIrimuDA02HRyFG7gcNaeDp
	 hJlAHlApw9NQgtB6uGiS1SdyWdNJPYYCIcokj6uBek3AWSfrNQrfwQN9yFCi/AjY1r
	 L/H7nT8TTDqifm4cjorAwd2/DDPlx6Ti2F5nrdw4ff/R7AD535cW+u7s/elWHg0P39
	 JDkxuf933VY9tJJkaAlHfRXEPptQgd6XeC196sPAtXgJjdRykcwDhXBIS4gDvJqmwz
	 RH2OwqBWE9Ddw==
Subject: Re: [PATCH net-next 2/9] net/mlx5e: check for failure when pulling
 the Ethernet header after XDP
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: kuba@kernel.org, pabeni@redhat.com, edumazet@kernel.org,
 davem@davemloft.net, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, manishc@marvell.com,
 rahulv@marvell.com, GR-Linux-NIC-Dev@marvell.com, shshaikh@marvell.com,
 horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, xen-devel@lists.xenproject.org,
 intel-wired-lan@lists.osuosl.org
Date: Sun, 11 Oct 2026 19:03:59 +0000
Message-ID: <179174543945.434549.12308757559903944189@kernel.org>
In-Reply-To:
 <20261007-b4-pskb-pull-tail-drivers-v1-2-9512b0fb977b@toxicpanda.com>
References:
 <20261007-b4-pskb-pull-tail-drivers-v1-2-9512b0fb977b@toxicpanda.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-purgate-ID: tlsNG-42698a/1791745443-A92CC9EA-E74BF8EF/0/0
X-purgate-type: clean
X-purgate-size: 4310

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In mlx5e_skb_from_cqe_mpwrq_nonlinear()
  (drivers/net/ethernet/mellanox/mlx5/core/en_rx.c), the new drop path…

--

net/mlx5e: check for failure when pulling the Ethernet header after XDP

This patch replaces the unchecked __pskb_pull_tail() call in
mlx5e_skb_from_cqe_mpwrq_nonlinear() with pskb_may_pull(). If the pull
fails, the packet is dropped. The goal is to stop eth_type_trans() from
hitting BUG() in __skb_pull() when the linear part holds less than
ETH_HLEN.

> When an XDP program leaves less than ETH_HLEN in the linear part of a
> multi-buffer packet, mlx5e_skb_from_cqe_mpwrq_nonlinear() pulls the rest
> of the Ethernet header in from the frags with __pskb_pull_tail() and
> ignores the return value.  If that pull fails, eth_type_trans() later
> finds less than ETH_HLEN in the head and BUG()s in __skb_pull().

> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
> index e3f915beebe1b..b1e1e30a77e22 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
> @@ -2060,9 +2060,12 @@ mlx5e_skb_from_cqe_mpwrq_nonlinear(struct mlx5e_rq *rq, struct mlx5e_mpw_info *w
>  				pagep->frags++;
>  			while (++pagep < frag_page);
>  
> -			if (len < ETH_HLEN)
> -				__pskb_pull_tail(skb, min(ETH_HLEN - len,
> -							  skb->data_len));
> +			if (len < ETH_HLEN &&
> +			    !pskb_may_pull(skb, min(ETH_HLEN, skb->len))) {
> +				rq->stats->buff_alloc_err++;
> +				dev_kfree_skb_any(skb);
> +				return NULL;
> +			}

[Severity: Low]
Can this new drop path actually be reached? Given how the skb is built
on the XDP path, it doesn't look like the pull can fail.

For an skb with frags and no frag_list, these are the only failure
returns in __pskb_pull_tail():

net/core/skbuff.c:__pskb_pull_tail() {
    ...
	if (!skb_frags_readable(skb))
		return NULL;

	if (eat > 0 || skb_cloned(skb)) {
		if (pskb_expand_head(skb, 0, eat > 0 ? eat + 128 : 0,
				     GFP_ATOMIC))
			return NULL;
	}
    ...
}

The frags are always readable here because XDP and memory providers
can't be used together:

- dev_xdp_attach() returns -EBUSY when dev_get_min_mp_channel_count()
  is non-zero.
- The memory provider binding code in netdev_rx_queue.c refuses when
  dev_xdp_prog_count() is non-zero.

The skb isn't cloned either, since mlx5e_build_linear_skb() has just
built it with napi_build_skb().

There is also always enough tailroom, so eat stays negative. The XDP
setup earlier in this function is:

	linear_hr = XDP_PACKET_HEADROOM;
	linear_data_len = 0;
	linear_frame_sz = MLX5_SKB_FRAG_SZ(linear_hr + MLX5E_RX_MAX_HEAD);

That leaves about 256 bytes past the linear tail, and the pull is never
more than ETH_HLEN bytes.

On the commit message's claim that this happens "When an XDP program
leaves less than ETH_HLEN in the linear part of a multi-buffer packet",
is that accurate?

The driver always gives XDP an empty linear area. So the pull runs for
every multi-buffer XDP_PASS packet whose program doesn't adjust the
head.

An XDP program also can't leave 1 to 13 bytes in the linear part,
because bpf_xdp_adjust_head() rejects it:

	if (unlikely(data < data_start ||
		     data > xdp->data_end - ETH_HLEN))
		return -EINVAL;

When frags are present, bpf_xdp_adjust_tail() only changes the frags,
so the linear data_end stays where it is. That means len is either 0 or
at least ETH_HLEN at this point.

If this change is meant as hardening, for example against later changes
to linear_frame_sz, could the commit message say so?

If there is a real way to make the pull fail, could the message describe
it and add a Fixes: tag for the commit that added the unchecked
__pskb_pull_tail()?

>  		}
>  	} else {
>  		if (xdp_buff_has_frags(&mxbuf->xdp)) {

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b%40toxicpanda.com

