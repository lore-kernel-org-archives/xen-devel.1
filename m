Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EC8CC6B3D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:06:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445724.1665819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEH-0006lF-6F; Thu, 15 Oct 2026 12:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445724.1665819; Thu, 15 Oct 2026 12:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEH-0006l5-0v; Thu, 15 Oct 2026 12:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1445724;
 Sun, 11 Oct 2026 19:04:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xFyq6-00044t-7B
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 19:04:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFyq5-0075vT-KQ
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 21:04:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6acbdd72-bab6-0a2a0a5309dd-0a2a4503b008-32
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 21:04:05 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6acbdda4-fae8-0a2a45030019-ac6904fecf58-3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 21:04:05 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F03DE60232;
 Sun, 11 Oct 2026 19:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435F91F0089C;
 Sun, 11 Oct 2026 19:04:02 +0000 (UTC)
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
	s=k20260515; t=1791745443;
	bh=xwkEhVzbUvjpITITmAO4h3R+R7/UDQRQJB9aMn4M6nw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T6j22e7NaJcS2fr8bxi+2fkNg3yrrBUkW62t0KEMPQPEPq6c0g63GVfOejKgcDELZ
	 nmYI+TGJ0tsychweaRGXM07GIaFEB966dLGXJyiPj6MPWOn/DFHhGqWRvNFsXTA1ra
	 87Xeej/L81UcUVZorzjZeW51kYQGMzJcfsJTcZoB4zTKj0JyWidBNaJOJ6Ktoxn5FJ
	 GSPMJY8QX27VBcLnNvtiLgJLQ18xB1oxYB/arUS4CmN/96Q3lt5LR2+ABSHrV4KunZ
	 WzUvdS5XWPMRzPg/0rwoxHPa8HFmiuoRrT0YDo5ToOt5LgXojsjM/Jcx4KN/A2GZD8
	 uXYz9dXc4NUqA==
Subject: Re: [PATCH net-next 4/9] xen/netfront: check for failure when pulling
 in xennet_fill_frags()
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
Date: Sun, 11 Oct 2026 19:04:01 +0000
Message-ID: <179174544182.434549.6411289628191595001@kernel.org>
In-Reply-To:
 <20261007-b4-pskb-pull-tail-drivers-v1-4-9512b0fb977b@toxicpanda.com>
References:
 <20261007-b4-pskb-pull-tail-drivers-v1-4-9512b0fb977b@toxicpanda.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-purgate-ID: tlsNG-33051d/1791745445-6DCD34E9-8F591169/0/0
X-purgate-type: clean
X-purgate-size: 9080

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 2 (2) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch now sends pull failures explicitly to an error path
  that leaks the head skb.
- [High] net: xen-netfront: memory leak of head SKB on
  xennet_fill_frags() error path
- [Medium] In xennet_fill_frags() (drivers/net/xen-netfront.c), replacing
  __pskb_pull_tail(skb, pull_to - skb_headlen(skb)) with…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  xennet_fill_frags() (drivers/net/xen-netfront.c) reads each follow-on…
- [High] This problem wasn't introduced by this patch, but in
  xennet_poll() (drivers/net/xen-netfront.c)…

--

xen/netfront: check for failure when pulling in xennet_fill_frags()

When the skb already has MAX_SKB_FRAGS frags, this patch makes
xennet_fill_frags() call pskb_may_pull() instead of __pskb_pull_tail(), and
it now checks the return value. The BUG_ON() on pull_to is removed. Both
failure exits now share a common err label.

> diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
> index 2ed673649c488..6e01a883cc64a 100644
> --- a/drivers/net/xen-netfront.c
> +++ b/drivers/net/xen-netfront.c
> @@ -1174,18 +1174,11 @@ static int xennet_fill_frags(struct netfront_queue *queue,
>  
>  		RING_COPY_RESPONSE(&queue->rx, ++cons, &rx);
>  
> -		if (skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS) {
> -			unsigned int pull_to = NETFRONT_SKB_CB(skb)->pull_to;
> -
> -			BUG_ON(pull_to < skb_headlen(skb));
> -			__pskb_pull_tail(skb, pull_to - skb_headlen(skb));
> -		}
> -		if (unlikely(skb_shinfo(skb)->nr_frags >= MAX_SKB_FRAGS)) {
> -			xennet_set_rx_rsp_cons(queue,
> -					       ++cons + skb_queue_len(list));
> -			kfree_skb(nskb);
> -			return -ENOENT;
> -		}
> +		if (skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS &&
> +		    unlikely(!pskb_may_pull(skb, NETFRONT_SKB_CB(skb)->pull_to)))
> +			goto err;
> +		if (unlikely(skb_shinfo(skb)->nr_frags >= MAX_SKB_FRAGS))
> +			goto err;

[Severity: Medium]
Is pskb_may_pull() really equivalent to the old call when pull_to equals
skb_headlen(skb)?

pskb_may_pull_reason() returns before it reaches __pskb_pull_tail():

    if (likely(len <= skb_headlen(skb)))
        return SKB_NOT_DROPPED_YET;

The old code still called __pskb_pull_tail(skb, 0) in that case. Its
pull_pages loop removes every zero-length frag, even with eat == 0:

    if (size <= eat) {
        skb_frag_unref(skb, i);
        eat -= size;
    }

That lowered nr_frags and freed a slot.

xennet_get_responses() accepts zero-length responses, since it only rejects
status < 0 and offset + status > XEN_PAGE_SIZE. It also allows
XEN_NETIF_NR_SLOTS_MIN + 1 (19) slots when the first response is at most
RX_COPY_THRESHOLD bytes.

Take the default MAX_SKB_FRAGS of 17, no XDP, a 64-byte first slot,
non-empty slots 2-17, a zero-length slot 18 and a non-empty slot 19:

    slot 18: nr_frags == 17, pull 64 bytes, frags[0] consumed -> 16
             zero-length slot 18 added -> 17
    slot 19: nr_frags == 17, pull_to == headlen, pskb_may_pull() no-op
             nr_frags >= MAX_SKB_FRAGS -> goto err

The old code would have dropped the zero-length frag at slot 19 and
accepted the packet. A zero-length first slot gives the same result,
because frags[0] is then zero-length.

Are these packets now dropped and counted in rx_errors, when the old code
assembled them? The commit message says "pskb_may_pull() does nothing if the
head already holds pull_to bytes", but that does not match the old
behaviour in this case. These drops also go through the xennet_poll() err
path discussed below.

[Severity: High]
This is a pre-existing issue, but in xennet_poll() pull_to comes from the
first slot's status. It has an upper cap but no lower bound:

    NETFRONT_SKB_CB(skb)->pull_to = rx->status;
    if (NETFRONT_SKB_CB(skb)->pull_to > RX_COPY_THRESHOLD)
        NETFRONT_SKB_CB(skb)->pull_to = RX_COPY_THRESHOLD;

Suppose the backend sends a first slot with status below ETH_HLEN and
XEN_NETRXF_more_data set, followed by non-empty slots.
handle_incoming_queue() pulls only pull_to bytes and then calls
eth_type_trans():

    handle_incoming_queue()
      __pskb_pull_tail(skb, pull_to - skb_headlen(skb))
      eth_type_trans()
        eth_skb_pull_mac()
          skb_pull_inline(skb, ETH_HLEN)
            __skb_pull()
              skb->len < skb->data_len -> BUG()

For example, a 5-byte first slot followed by a 1000-byte slot gives len =
1005, data_len = 1000 and headlen = 5. Pulling ETH_HLEN leaves len = 991,
which is less than data_len.

Can a backend crash the guest this way? Should pull_to be clamped to at
least ETH_HLEN? With a single short slot, skb_pull_inline() returns NULL,
so this only applies when frags follow.

>  
>  		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
>  				skb_frag_page(nfrag),

[Severity: High]
This isn't a bug introduced by this patch, but xennet_fill_frags() reads
each follow-on response from the shared ring a second time. It then uses
offset and status without checking them again:

    RING_COPY_RESPONSE(&queue->rx, ++cons, &rx);
    ...
    skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
                    skb_frag_page(nfrag),
                    rx.offset, rx.status, PAGE_SIZE);

The only bounds check runs in xennet_get_responses(), on a separate local
copy that is then thrown away:

    if (unlikely(rx->status < 0 ||
                 rx->offset + rx->status > XEN_PAGE_SIZE)) {

RING_COPY_() does a volatile load, so this is a fresh read of memory that
the backend can still write.

Could a backend rewrite the slot between the check and this read? A
negative status would lower skb->len and skb->data_len and store a huge
frag size. An offset plus status past the page would create a frag that
runs past the RX page.

Commit 8446066bf8c1 was meant to make netfront read each response only
once. Could the copy already validated in xennet_get_responses() be reused
here?

[ ... ]

> @@ -1198,6 +1191,11 @@ static int xennet_fill_frags(struct netfront_queue *queue,
>  	xennet_set_rx_rsp_cons(queue, cons);
>  
>  	return 0;
> +
> +err:
> +	xennet_set_rx_rsp_cons(queue, ++cons + skb_queue_len(list));
> +	kfree_skb(nskb);
> +	return -ENOENT;
>  }

[Severity: High]
net: xen-netfront: memory leak of head SKB on xennet_fill_frags() error path

1. Consequence: Memory leak of the main/head SKB and its data on the RX error path. Over time, an attacker triggering this error could exhaust system memory (DoS).
2. Triggering path: In xennet_poll(), a head SKB is dequeued from tmpq. It is passed to xennet_fill_frags(), which attempts to merge additional fragments. If pskb_may_pull() fails (e.g., due to memory allocation failure) or if nr_frags still exceeds MAX_SKB_FRAGS, xennet_fill_frags() returns -ENOENT without freeing the head SKB. Back in xennet_poll(), this triggers goto err, which loops over the remaining fragments in tmpq using while ((skb = __skb_dequeue(&tmpq))). This loop overwrites the skb local variable, causing the head SKB pointer to be permanently lost and leaked.
3. Reachability: High. A remote attacker could potentially send highly fragmented packets designed to exceed MAX_SKB_FRAGS to intentionally trigger this error path and exhaust memory.

[Severity: High]
Does this error path leak the head skb?

This exit frees only nskb and leaves the partly built head skb with the
caller. In xennet_poll(), the head skb has already been taken off tmpq:

    skb = __skb_dequeue(&tmpq);
    ...
    if (unlikely(xennet_fill_frags(queue, skb, &tmpq)))
        goto err;

The err label there only drains tmpq, and it overwrites the local skb
pointer:

err:
    while ((skb = __skb_dequeue(&tmpq)))
        __skb_queue_tail(&errq, skb);

The GSO failure path just above calls __skb_queue_head(&tmpq, skb) before
goto err, but this path does not. The head skb is never freed or requeued.

That would leak the linear buffer and the page_pool frag pages attached to
the skb. These include pages moved over from earlier nskbs whose nr_frags
was set to 0.

The leak has existed since commit ad4f15dc2c70 (2018). However, the commit
message assumes this path drops the packet ("take the error path
explicitly"), and the change above sends more packets into it.

Should the head skb be put back on tmpq, or freed, before goto err in
xennet_poll()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b%40toxicpanda.com

