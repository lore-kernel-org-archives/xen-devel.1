Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AE0606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtywuCCz
Received: from list by lists.xenproject.org with outflank-mailman.1458824.1670889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GB-0002jM-Da; Fri, 23 Oct 2026 04:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458824.1670889; Fri, 23 Oct 2026 04:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GB-0002jA-AA; Fri, 23 Oct 2026 04:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1458824;
 Fri, 23 Oct 2026 04:52:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xK7GA-0002YC-GA
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7G9-00FSfm-TN
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7e7-2eae-0a2a0a5409dd-0a2a4504ad1c-30
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:05 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7f4-b57f-0a2a45040019-ac6904fecc04-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:05 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5523E60211;
 Fri, 23 Oct 2026 04:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EB01F01825;
 Fri, 23 Oct 2026 04:52:03 +0000 (UTC)
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
	s=k20260515; t=1792731124;
	bh=0Z5cdUqpy3PAiZSjrshYDDPeo62NSWIKJChJ5XHEZtQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gtywuCCzViksVx/fLRMNPaRhC+7Azt4LGhzFIUaIxUHgLmh6qAKYAlQ+dFo6TAnv0
	 CSMr8aTTkOHRXBDrDHPQP8OSHGYrP4NYaRcDoxnsihu2bqlpU5SdOPEvbihGUHvErn
	 FGF47q6lb5ltvXRQWaAf/MUePuUhCEAbIxsGpk1n4YWg5zdqR3V7k4dJWQF/aLBd7f
	 vtTtMFFQZphA4dC7SmgNUvriSY/sRYt7oVNXd43t/3IoJpSbIf/gP2VJ04Tqe8uKeT
	 ToogJwAGheZySucUiE6FOLvKzglv13120NxEjPmcQQnh0uSJx7jet0MrYjUh6ja4sc
	 KowqOxeCzFy2Q==
Subject: Re: [PATCH net-next 05/15] net: skbuff: fail pskb_trim_rcsum() when
 it can't checksum the tail
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, jgross@suse.com,
 sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, fmancera@suse.de,
 almasrymina@google.com, david.laight.linux@gmail.com, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Oct 2026 04:52:02 +0000
Message-ID: <179273112276.3134.5794646357730297826@kernel.org>
In-Reply-To:
 <20261019-b4-skbuff-bug-on-followups-v1-5-41dbef50b9f7@toxicpanda.com>
References:
 <20261019-b4-skbuff-bug-on-followups-v1-5-41dbef50b9f7@toxicpanda.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-ebf023/1792731125-53EC6B50-9586D410/0/0
X-purgate-type: clean
X-purgate-size: 5055
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit fixes a real CHECKSUM_COMPLETE corruption in
  pskb_trim_rcsum_complete() (net/core/skbuff.c) but has no Fixes: tag,…
- [Low] In pskb_trim_rcsum_complete() (net/core/skbuff.c), the readable-
  head branch now returns skb_checksum_full()'s -EFAULT unconditionally.

--

net: skbuff: fail pskb_trim_rcsum() when it can't checksum the tail

This patch changes pskb_trim_rcsum_complete() to use skb_checksum_full()
instead of skb_checksum(). If the checksum of the trimmed tail can't be
computed, the error is now returned and callers drop the packet. Before
this, 0 was subtracted from skb->csum.

> pskb_trim_rcsum() can already fail, and its callers drop the packet
> when it does.  Use skb_checksum_full() and return its error.

[Severity: Low]
This isn't a bug, but should this commit carry a Fixes: tag?

Before this patch, the readable-head branch of pskb_trim_rcsum_complete()
only checked the top-level skb->unreadable bit. If the trimmed tail reached
an unreadable frag_list member, skb->csum was left covering the trimmed
bytes.

That layout looks reachable. inet_frag_reasm_finish() keeps
CHECKSUM_COMPLETE, and it links fragments onto frag_list when
skb_try_coalesce() refuses them:

net/core/skbuff.c:skb_try_coalesce() {
    ...
	if (skb_frags_readable(from) != skb_frags_readable(to))
		return false;
    ...
}

The gap seems to go back to 65249feb6b3d ("net: add support for skbs with
unreadable frags"). 2e357f002c61 ("net: Avoid checksumming unreadable skb
tail on trim") only covered the top-level case.

The commit message also mentions the "past the end of the skb" case. That
case was a BUG() until 20ddd0fd2fcd turned it into a silent 0.

Two sibling patches in this series fix the same consequence of
20ddd0fd2fcd, and both carry Fixes: 20ddd0fd2fcd:

  "net: skbuff: fail checksum validation when the skb can't be checksummed"
  "net: skbuff: add skb_crc32c_full() that reports failure"

The commit message also doesn't say that this patch depends on the earlier
"net: skbuff: add skb_checksum_full() that reports failure" patch. Could
that dependency be noted for anyone backporting this?

> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 88ed2dd99dc0..de433d452939 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -2829,9 +2829,13 @@ static int pskb_trim_rcsum_complete(struct sk_buff *skb, unsigned int len)
>  	int delta = skb->len - len;
>  
>  	if (skb_frags_readable(skb)) {
> -		skb->csum = csum_block_sub(skb->csum,
> -					   skb_checksum(skb, len, delta, 0),
> -					   len);
> +		__wsum csum = 0;
> +		int err;
> +
> +		err = skb_checksum_full(skb, len, delta, &csum);
> +		if (err)
> +			return err;

[Severity: Low]
Should this fall back to CHECKSUM_NONE when only the trimmed bytes are
unreadable?

Take a head with skb->unreadable clear, where the tail [len, skb->len) lies
entirely in an unreadable frag_list member. skb_checksum_full() recurses
into that member and returns -EFAULT, and the packet is dropped.

pskb_trim_rcsum_complete() already handles the case where the trimmed bytes
are unreadable but the rest can be checksummed. It only does so when the
top-level bit is set:

	if (len > skb_headlen(skb))
		return -EFAULT;

	/* The trimmed bytes are unreadable, but the remaining packet can be
	 * checksummed by software after trimming.
	 */
	skb->ip_summed = CHECKSUM_NONE;
	return 0;

So the same data layout is either kept or dropped, depending on whether the
unreadable flag is on the head or on a frag_list member.

One way to get there is IP reassembly on a devmem/zcrx queue. If a readable
first fragment is followed by an unreadable one, inet_frag_reasm_finish()
produces a readable CHECKSUM_COMPLETE head with an unreadable frag_list
member. When the UDP length is shorter than the datagram, the call chain
is:

__udp4_lib_rcv()
  pskb_trim_rcsum(skb, ulen)
    pskb_trim_rcsum_slow()
      pskb_trim_rcsum_complete()
        skb_checksum_full() -> -EFAULT

UDP then drops the packet through short_packet.

___pskb_trim() would have dropped that member and cleared the unreadable
bit:

	if (!skb_shinfo(skb)->nr_frags && !skb_has_frag_list(skb))
		skb->unreadable = 0;

That would leave the trimmed skb fully readable, so software could
checksum it.

Before this patch the packet was accepted. __skb_checksum_complete()
recomputed the checksum over the trimmed skb and reported
netdev_rx_csum_fault().

Would falling back to CHECKSUM_NONE when [0, len) is readable avoid both
the drop and the old splat?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7%40toxicpanda.com

