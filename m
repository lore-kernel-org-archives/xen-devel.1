Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B84606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBiOMtrD
Received: from list by lists.xenproject.org with outflank-mailman.1458830.1670924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GH-0003lj-N6; Fri, 23 Oct 2026 04:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458830.1670924; Fri, 23 Oct 2026 04:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GH-0003lQ-I6; Fri, 23 Oct 2026 04:52:13 +0000
Received: by outflank-mailman (input) for mailman id 1458830;
 Fri, 23 Oct 2026 04:52:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xK7GG-0003Uy-3A
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7GF-006sSq-Ey
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7b7-bab6-0a2a0a5309dd-0a2a45019376-34
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:11 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7fa-5984-0a2a45010019-ac6904fea64a-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:11 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D5F536022C;
 Fri, 23 Oct 2026 04:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8131F01825;
 Fri, 23 Oct 2026 04:52:08 +0000 (UTC)
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
	s=k20260515; t=1792731129;
	bh=ALJG1SS2iy0WNzGYJ2ykwPhdXMhJmbb3CoA1YF8ffNc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LBiOMtrDWCpmJO/ji86Cm00kxg5nINn6Ygjd5c3AQDkNrnU1kFrfmscNk06E3Pllm
	 OOf4zfyBdEEeDqjVeUn8Q+eUF71szWkujD/7zYvOuUSd+DzyyeTym8udRVjUdDBmFn
	 hkja5jzp7viOvPROAMFnWXTePG3v+VngBOu3XUHJSy6M7/nm3pxc5J0/sNgSM9wdhf
	 i/qQl8vhcojaX76gM2RTVgRT/lL/bDsHtetipEb+ognTO7kEWTZxhxaYVyKZ+jmfJd
	 K+wurkGehCZVpXLsNjKas5F7UkTKzAqORqvEBQEBKPNpOVLIDLwroUbGm+ZFiaVXHD
	 FZpL/xAHtvnZg==
Subject: Re: [PATCH net-next 09/15] net: skbuff: check csum_start against len
 in skb_copy_and_csum_dev()
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, jgross@suse.com,
 sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, fmancera@suse.de,
 almasrymina@google.com, david.laight.linux@gmail.com, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Oct 2026 04:52:08 +0000
Message-ID: <179273112823.3134.12241973533522574538@kernel.org>
In-Reply-To:
 <20261019-b4-skbuff-bug-on-followups-v1-9-41dbef50b9f7@toxicpanda.com>
References:
 <20261019-b4-skbuff-bug-on-followups-v1-9-41dbef50b9f7@toxicpanda.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-d62444/1792731131-C5341757-FE05F783/0/0
X-purgate-type: clean
X-purgate-size: 2732
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] net: skbuff: incomplete headlen underflow check in
  skb_copy_and_csum_dev()

--

> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -4103,7 +4103,11 @@ void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to)
>  	else
>  		csstart = skb_headlen(skb);
>  
> +	/* skb_headlen() underflows if data_len is bigger than len, so check
> +	 * csstart against len as well.
> +	 */
>  	if (unlikely(csstart < 0 || csstart > skb_headlen(skb) ||
> +		     csstart > skb->len ||
>  		     (skb->ip_summed == CHECKSUM_PARTIAL &&
>  		      csstart + skb->csum_offset + sizeof(__sum16) >
>  		      skb->len))) {
>

[Severity: Medium]
This only closes the hole for the non-CHECKSUM_PARTIAL case. If
skb->data_len > skb->len and ip_summed is CHECKSUM_PARTIAL, csstart
comes from skb_checksum_start_offset() instead of skb_headlen(), so it
can be anywhere up to skb->len while skb_headlen() has wrapped to
about 4GB. Both the headlen comparison and the new skb->len comparison
then pass, the csum_offset check passes too, and we go straight on to
skb_copy_from_linear_data(skb, to, csstart) with nothing bounding
csstart by the real linear area.

skb_copy_and_csum_bits() then starts from int start =
skb_headlen(skb), which is either negative, so the linear part is
skipped and the frag reads are shifted by data_len - len bytes, or,
once the difference exceeds INT_MAX, a bogus positive value that lets
it copy from skb->data past the end of the linear data.

The fallback isn't safe either. skb_copy_bits() also begins with
int start = skb_headlen(skb), so sending such an skb down the existing
fallback, as the changelog describes, bounds the writes to @to by
skb->len but not the reads from the skb.

Since the condition you really want to catch is data_len > len,
would it be simpler to test that directly before computing csstart,
and memset() @to rather than calling skb_copy_bits() in that case? Or
should skb_copy_bits() and skb_copy_and_csum_bits() reject
data_len > len themselves?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7%40toxicpanda.com

