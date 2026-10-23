Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA9F606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RsVDi42x
Received: from list by lists.xenproject.org with outflank-mailman.1458832.1670929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GI-0003sX-EK; Fri, 23 Oct 2026 04:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458832.1670929; Fri, 23 Oct 2026 04:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GI-0003rO-8S; Fri, 23 Oct 2026 04:52:14 +0000
Received: by outflank-mailman (input) for mailman id 1458832;
 Fri, 23 Oct 2026 04:52:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xK7GH-0003ko-Hp
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7GG-006sSq-V3
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7f7-bab6-0a2a0a5309dd-0a2a45038fb8-6
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:12 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7fb-fae8-0a2a45030019-aceafc1fe3ae-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:12 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 19B99436D5;
 Fri, 23 Oct 2026 04:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2301F01829;
 Fri, 23 Oct 2026 04:52:10 +0000 (UTC)
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
	s=k20260515; t=1792731131;
	bh=297sVdh7jI9/YZVUTISisNh0xfIn+ptDdAeK7+MG+j4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RsVDi42x5d11Xzqr5TY5CMbXLnmsax0HywsBl/ckkPOsiwTAtg2HKqp1I0Gt0pNe5
	 o562TlDRdFBbd72heCdiENUI2gRkwkQmu4284CHf1aXb58ZwQNdM3kLzrxp+szYioX
	 Xm8klKt3tLKcfAH4v2z2hprDFbJvqndr6XjUHJ6uWq/nqZHFS6/nvS8yHj0XwF2Ay8
	 pGjfemmlrmCJjlLw8g5JbeNJH5uuzLIcQAsA3I7UnSfPR90oeUcWLYsW52hkPI1u0K
	 Vc3k0AafsJCnffpPlgHDfZHENet5iR2IKZSCJ7oV+Vp4IUC9qKYyDNn7y8LStW+QJx
	 5/p2ncCTH6e3Q==
Subject: Re: [PATCH net-next 10/15] net: skbuff: reject a negative length in
 skb_copy_and_csum_bits()
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, jgross@suse.com,
 sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, fmancera@suse.de,
 almasrymina@google.com, david.laight.linux@gmail.com, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Oct 2026 04:52:09 +0000
Message-ID: <179273112973.3134.5343458615205155491@kernel.org>
In-Reply-To:
 <20261019-b4-skbuff-bug-on-followups-v1-10-41dbef50b9f7@toxicpanda.com>
References:
 <20261019-b4-skbuff-bug-on-followups-v1-10-41dbef50b9f7@toxicpanda.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-33051d/1792731132-6CCDB4E9-13F0EBB3/0/0
X-purgate-type: clean
X-purgate-size: 5543
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

- [Low] The commit message's reason for dropping the `if (len > 0)` guard
  on the final zero-fill in skb_copy_and_csum_bits() (net/core/skbuff.c)…
- [Low] The patch narrows the zero-fill promise in
  skb_copy_and_csum_bits()'s kernel-doc: "on -EFAULT the part of @to…

--

net: skbuff: reject a negative length in skb_copy_and_csum_bits()

This commit makes skb_copy_and_csum_bits() return -EINVAL, with a
DEBUG_NET_WARN_ON_ONCE(), when it is given a negative len. It also drops
the len > 0 guard on the final zero-fill. The kernel-doc now promises the
zero-fill only for -EFAULT.

Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/

> Commit 417261779eab ("net: skbuff: don't BUG() on leftover length in
> skb_copy_and_csum_bits()") guards its zero-fill against a negative @len
> from a broken caller, but such a @len never gets that far.  The head,
> frag and frag_list copies all clamp their length to @len, so a negative
> one has already turned into a huge copy, or an endless frag walk, by
> then.

[Severity: Low]
Is this an accurate description of the old code? The head, frag and
frag_list copies clamp to len only when they run. All three are skipped
when offset is at or past the end of the skb's data.

Take a linear skb with no frags, offset == skb->len and len == -1:

    copy = start - offset;                            /* 0, no head copy */
    for (i = 0; i < skb_shinfo(skb)->nr_frags; i++)   /* no frags */
    skb_walk_frags(skb, frag_iter)                    /* empty */

In the parent commit, the negative len then reaches the final block
unchanged:

net/core/skbuff.c:skb_copy_and_csum_bits() {
    ...
	if (unlikely(len)) {
		DEBUG_NET_WARN_ON_ONCE(1);
		/* Don't hand the caller a buffer with stale bytes in it. */
		if (len > 0)
			memset(to, 0, len);
		return -EFAULT;
	}
    ...
}

There, the len > 0 check is what prevents a memset of close to SIZE_MAX
bytes.

The code change itself looks right, because the new check on entry keeps
len non-negative for the rest of the function. The Fixes: tag relies on
this description of what 417261779eab guarded, though. Could the commit
message say that the guard only covered the final zero-fill and not the
clamped copies?

> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 782a6bacd568..56cec58bccb7 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -3678,9 +3678,10 @@ EXPORT_SYMBOL(skb_checksum);
>   *	@len: number of bytes to copy
>   *	@csump: where to store the checksum of the copied bytes
>   *
> - *	Return: 0 on success, or -EFAULT if @skb has unreadable frags or runs
> - *	out before @len does.  On failure *@csump is not set and the part of
> - *	@to that couldn't be filled is zeroed.
> + *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
> + *	has unreadable frags or runs out before @len does.  On failure *@csump
> + *	is not set, and on -EFAULT the part of @to that couldn't be filled is
> + *	zeroed.
>   */
>  int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
>  			   u8 *to, int len, __wsum *csump)
> @@ -3692,6 +3693,14 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
>  	__wsum csum = 0;
>  	int err;
>  
> +	/* Everything below clamps copies to @len, so a negative one would
> +	 * turn into a huge copy.
> +	 */
> +	if (unlikely(len < 0)) {
> +		DEBUG_NET_WARN_ON_ONCE(1);
> +		return -EINVAL;
> +	}

[Severity: Low]
This early return leaves to untouched, and the kernel-doc above now
promises the zero-fill only for -EFAULT. Does skb_copy_and_csum_dev() need
an update as well? Its comment still says that any failure zeroes the
buffer:

net/core/skbuff.c:skb_copy_and_csum_dev() {
    ...
	csum = 0;
	/* On failure the rest of @to is zeroed; leave the checksum alone so
	 * the frame goes out with a bad one.
	 */
	if (csstart != skb->len &&
	    skb_copy_and_csum_bits(skb, csstart, to + csstart,
				   skb->len - csstart, &csum))
		return;
    ...
}

The drivers that call it (8139too, via-rhine, sc92031, ep93xx, ec_bhf,
ksz884x) transmit to after it returns. The csstart checks keep
skb->len - csstart non-negative as an unsigned value, but they don't keep
it within INT_MAX. A corrupt skb with more than INT_MAX bytes past csstart
would get -EINVAL here, and the bytes after csstart would go out stale.

That also goes against the first patch in the series ("net: skbuff: make
skb_copy_and_csum_bits() report unreadable frags"), which says "The
zero-fill stays, so a caller that does send the buffer still doesn't leak
anything."

The drivers' own size limits keep valid skbs from getting here. Before
this patch, the same corrupt input caused a huge copy instead. The comment
in skb_copy_and_csum_dev() is still unchanged at the end of the series,
including after "net: update comments that still describe the skb
BUG_ON()s".

Could that comment be updated? Alternatively, skb_copy_and_csum_dev()
could zero the rest of to itself when the helper fails.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7%40toxicpanda.com

