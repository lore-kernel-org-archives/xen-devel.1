Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48C6606A335
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9IF7uFF
Received: from list by lists.xenproject.org with outflank-mailman.1458820.1670853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7G7-0001rb-EZ; Fri, 23 Oct 2026 04:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458820.1670853; Fri, 23 Oct 2026 04:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7G7-0001rU-Bz; Fri, 23 Oct 2026 04:52:03 +0000
Received: by outflank-mailman (input) for mailman id 1458820;
 Fri, 23 Oct 2026 04:52:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xK7G5-0001r3-Ht
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7G4-00FSb5-Ij
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7e7-e002-0a2a0a5209dd-0a2a4506e104-10
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:00 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7ee-195a-0a2a45060019-aceafc1fa0c6-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:00 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2411840A17;
 Fri, 23 Oct 2026 04:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EF11F01825;
 Fri, 23 Oct 2026 04:51:57 +0000 (UTC)
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
	s=k20260515; t=1792731118;
	bh=l5UCn3s3YyxcyE6vweegr4A1rPRcjt6h9F7KPsMd5KY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g9IF7uFF9+WPeewAagqf7C9jK+UL4Yc9xwbzrV2wTgTEZHIsI3StVz8RYNbRqLD1y
	 ZT/z/gtLR8fmAUx8n1LLfM+C9U2C0s0iAoOqTE2eIrLCwS710pc4j+WCR7k6JpEXBi
	 jybOBH0KSK6ReliEUHAaEcrL7hDF2YXHjUI3b52ci6q/qjWqiykJtkMTiqDnBskIDo
	 tq1A+WGsMnhTQ3RmAr3ikdjzDWGycUSMt0zu3QzuiWBdQVfcurM1AuhUjja3xFQAFw
	 abrc4XwH6LfzBGCKAbUY92A1FlhoYh3+SzUJX5SgFL6HeeykSWmDYZpB25LXRyy0ae
	 vW8LVJ3g00YTg==
Subject: Re: [PATCH net-next 01/15] net: skbuff: make skb_copy_and_csum_bits()
 report unreadable frags
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, jgross@suse.com,
 sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, fmancera@suse.de,
 almasrymina@google.com, david.laight.linux@gmail.com, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Oct 2026 04:51:56 +0000
Message-ID: <179273111683.3134.7255247218847744918@kernel.org>
In-Reply-To:
 <20261019-b4-skbuff-bug-on-followups-v1-1-41dbef50b9f7@toxicpanda.com>
References:
 <20261019-b4-skbuff-bug-on-followups-v1-1-41dbef50b9f7@toxicpanda.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-16d1c6/1792731120-F7ACA77B-1AF79BD9/0/0
X-purgate-type: clean
X-purgate-size: 5299
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Missing Fixes: and Cc: stable tags on a data-integrity fix.
- [Low] The new comment in skb_copy_and_csum_dev() reads: "On failure the
  rest of @to is zeroed; leave the checksum alone so the frame goes out…

--

net: skbuff: make skb_copy_and_csum_bits() report unreadable frags

skb_copy_and_csum_bits() now returns 0 or -EFAULT, hands the checksum
back through a pointer, and is marked __must_check. On error, the callers
in skb_segment(), the ICMP code, the IP append paths, sunvnet and sunrpc
take the failure paths they already have. skb_copy_and_csum_dev() returns
early without storing a checksum. With this change, software GSO of a
devmem TCP skb fails instead of silently replacing the payload with
zeroes.

Link: https://lore.kernel.org/all/179148235783.434549.14322374227477832817@kernel.org/

> Link: https://lore.kernel.org/all/179148235783.434549.14322374227477832817@kernel.org/
> Suggested-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

[Severity: Medium]
This fixes the silent payload replacement in the !sg && !csum branch of
skb_segment(), but there is no Fixes: or Cc: stable tag.

The commit message says commit ab9414ed70bd ("net: skbuff: don't leave
stale bytes in skb_copy_and_csum_bits()") is what made the replacement
silent. That commit carries:

    Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
    Cc: stable@vger.kernel.org

Could stable trees take ab9414ed70bd without this patch? Devmem TX would
then send a zeroed payload under a valid TCP checksum, and the peer would
accept it.

Other patches in this series carry Fixes: tags, for example "net: skbuff:
reject a negative length in skb_copy_and_csum_bits()" and "net: skbuff:
check csum_start against len in skb_copy_and_csum_dev()".

Should this one also name ab9414ed70bd (or 65249feb6b3d) in a Fixes: tag
and Cc stable, so that both changes are backported together?

> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 93c2f440b9ec..a2b52a5a61a9 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c

[ ... ]

> @@ -4006,9 +4025,13 @@ void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to)
>  	skb_copy_from_linear_data(skb, to, csstart);
>  
>  	csum = 0;
> -	if (csstart != skb->len)
> -		csum = skb_copy_and_csum_bits(skb, csstart, to + csstart,
> -					      skb->len - csstart);
> +	/* On failure the rest of @to is zeroed; leave the checksum alone so
> +	 * the frame goes out with a bad one.
> +	 */
> +	if (csstart != skb->len &&
> +	    skb_copy_and_csum_bits(skb, csstart, to + csstart,
> +				   skb->len - csstart, &csum))
> +		return;

[Severity: Low]
Does this early return actually make the frame go out with a bad
checksum?

It skips the csum_fold() store, but nothing marks the checksum as invalid.
The sanity check earlier in skb_copy_and_csum_dev() only bounds csstart
by skb_headlen():

	if (unlikely(csstart < 0 || csstart > skb_headlen(skb) ||
		     (skb->ip_summed == CHECKSUM_PARTIAL &&
		      csstart + skb->csum_offset + sizeof(__sum16) >
		      skb->len))) {

For CHECKSUM_PARTIAL, the field at csstart + csum_offset can therefore sit
past the linear area. That puts it inside the region that
skb_copy_and_csum_bits() zero-fills on failure:

	if (!skb_frags_readable(skb)) {
		/* Don't hand the caller a buffer with stale bytes in it. */
		if (len > 0)
			memset(to, 0, len);
		return -EFAULT;
	}

For UDP over IPv4, a checksum of 0x0000 means "no checksum". Wouldn't the
receiver then accept the zeroed payload?

The same applies to a CHECKSUM_NONE UDP skb sent without a checksum. The
headers are copied intact, only the payload is zeroed, and nothing marks
the frame as bad.

The commit message makes the same claim:

    skb_copy_and_csum_dev() can't return an error, so it leaves the
    checksum alone and the frame goes out with a bad one.

None of the current callers (ep93xx_eth, ec_bhf, ksz884x, 8139too,
sc92031, via-rhine) sets netmem_tx. validate_xmit_unreadable_skb()
therefore drops unreadable skbs before they reach these drivers, and the
remaining failure case needs an skb whose lengths are inconsistent.

Should the comment and the commit message be narrowed? Alternatively,
this path could store a non-zero value at csstuff that is known not to
match, for CHECKSUM_PARTIAL. The code is unchanged at the end of the
series.

>  
>  	if (skb->ip_summed == CHECKSUM_PARTIAL) {
>  		long csstuff = csstart + skb->csum_offset;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7%40toxicpanda.com

