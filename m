Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812BACC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:06:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445731.1665833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEI-00071p-1r; Thu, 15 Oct 2026 12:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445731.1665833; Thu, 15 Oct 2026 12:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEH-0006zY-Qq; Thu, 15 Oct 2026 12:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1445731;
 Sun, 11 Oct 2026 19:04:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xFyqB-000469-Od
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 19:04:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFyqB-00CH6J-5d
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 21:04:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6acbdd99-e002-0a2a0a5209dd-0a2a4501cc46-10
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 21:04:11 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6acbdda9-5984-0a2a45010019-ac6904febc18-3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 21:04:10 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9AE8A602C3;
 Sun, 11 Oct 2026 19:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4261F0089B;
 Sun, 11 Oct 2026 19:04:07 +0000 (UTC)
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
	s=k20260515; t=1791745449;
	bh=4vxOlSiy9OgWc0Y0eZ4LnuQ00GAjNw7bsz9uahntp8s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CjY4UeAJxeRG+6zxZ2JMQ37NUAAJU7B0QFD0x9u4mXCWNj3x6vTki4Ex4jmP5nmTr
	 nEldysQH5Y/i+i6Ds1cl7TMCoF4zbdO7g9CiGRvRY0SLb70r/ihN0mDoEIRqtoYn3w
	 2uzBXoO+p4seJUiCIHK2K9XYeWjuiQQAxemBKvKRSUv+qTLZogLvdD8pFDes31UBO/
	 qqqUxMv4TP2EuoPSEBNUPyElJS9DYJKkxV4am0zKNhEx33NSG7p9azBdb6wpDNxnk6
	 PRlz/r8bMcy04afRZ+RkwV6mpYk6jovQOrSnOeAcoCdhP2F5rRABrdly4WqTQ13wd+
	 m9WvDT+KPx5QA==
Subject: Re: [PATCH net-next 8/9] qlcnic: use pskb_may_pull() to pull excess
 TX frags into the head
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
Date: Sun, 11 Oct 2026 19:04:07 +0000
Message-ID: <179174544742.434549.15432453849443944349@kernel.org>
In-Reply-To:
 <20261007-b4-pskb-pull-tail-drivers-v1-8-9512b0fb977b@toxicpanda.com>
References:
 <20261007-b4-pskb-pull-tail-drivers-v1-8-9512b0fb977b@toxicpanda.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-purgate-ID: tlsNG-d62444/1791745451-C475B757-EDAD2C47/0/0
X-purgate-type: clean
X-purgate-size: 3254

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In qlcnic_xmit_frame()
  (drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:681-688), changing…

--

qlcnic: use pskb_may_pull() to pull excess TX frags into the head

This patch changes qlcnic_xmit_frame() so that it no longer calls
__pskb_pull_tail(skb, delta) directly when a non-GSO skb has more frags
than QLCNIC_MAX_FRAGS_PER_TX. It calls pskb_may_pull(skb,
skb_headlen(skb) + delta) instead. The commit message presents this as
an equivalent API swap.

> diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
> index 761ef3bc8193a..4a81d499e51c0 100644
> --- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
> +++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
> @@ -682,7 +682,7 @@ netdev_tx_t qlcnic_xmit_frame(struct sk_buff *skb, struct net_device *netdev)
>  		for (i = 0; i < (frag_count - QLCNIC_MAX_FRAGS_PER_TX); i++)
>  			delta += skb_frag_size(&skb_shinfo(skb)->frags[i]);
>  
> -		if (!__pskb_pull_tail(skb, delta))
> +		if (!pskb_may_pull(skb, skb_headlen(skb) + delta))
>  			goto drop_packet;
>  
>  		frag_count = 1 + skb_shinfo(skb)->nr_frags;

[Severity: Low]
Is this exactly equivalent when delta is 0?

delta is a byte count. It is 0 if all of the leading excess frags of a
non-GSO skb with more than 14 frags are zero-length.

In that case pskb_may_pull_reason() returns early and never calls
__pskb_pull_tail():

include/linux/skbuff.h:pskb_may_pull_reason() {
    ...
	if (likely(len <= skb_headlen(skb)))
		return SKB_NOT_DROPPED_YET;
    ...
}

The old direct call to __pskb_pull_tail(skb, 0) always reached the
pull_pages loop. With eat == 0, every zero-size frag matches
size <= eat, so it is unreferenced and dropped from frags[]:

net/core/skbuff.c:__pskb_pull_tail() {
    ...
pull_pages:
	eat = delta;
	k = 0;
	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
		int size = skb_frag_size(&skb_shinfo(skb)->frags[i]);

		if (size <= eat) {
			skb_frag_unref(skb, i);
			eat -= size;
		} else {
    ...
	}
	skb_shinfo(skb)->nr_frags = k;
    ...
}

With the new call, nr_frags does not change. The recomputed frag_count
stays above QLCNIC_MAX_FRAGS_PER_TX, and nothing checks it again.

After that, qlcnic_map_tx_skb() maps every frag, including the
zero-length ones. qlcnic_set_tx_frags_len() then writes this frag_count
into the first descriptor. The descriptor loop programs more than 14
buffers for a non-TSO packet, which the comment above this block says
the hardware does not support:

	/* 14 frags supported for normal packet and
	 * 32 frags supported for TSO packet
	 */

This needs an unusual skb layout, and no in-tree producer of it is
known. Even so, could the frag_count be rechecked after the pull, or the
commit message mention this difference?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b%40toxicpanda.com

