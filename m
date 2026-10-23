Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A905606A31F
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFTbwa1U
Received: from list by lists.xenproject.org with outflank-mailman.1458825.1670898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GD-0002zr-Lj; Fri, 23 Oct 2026 04:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458825.1670898; Fri, 23 Oct 2026 04:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GD-0002zg-H4; Fri, 23 Oct 2026 04:52:09 +0000
Received: by outflank-mailman (input) for mailman id 1458825;
 Fri, 23 Oct 2026 04:52:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xK7GB-0002ok-U8
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7GB-008liq-Ar
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7df-8faa-0a2a0a5109dd-0a2a4509e050-26
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:07 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7f5-be1a-0a2a45090019-aceafc1fd5e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:07 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 74513436D5;
 Fri, 23 Oct 2026 04:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A37D1F031E0;
 Fri, 23 Oct 2026 04:52:04 +0000 (UTC)
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
	s=k20260515; t=1792731125;
	bh=Qv0jgGSSzQcSOMwhms6D75hZ9LTOezwa31oORyt9eG8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nFTbwa1UCVR6+1/TZhGahifx1EcAxAH7crNt6EWCgyjm/P4MwnTSAF1vJJEjYTY7c
	 /qEU/aZte7oJ7YXIdQHKeEPzdN31vzLP6tckm1Aj3qZ+CcUuhDEiyH12H4smFGnl+W
	 JNcpDCV2FCm4/0Qdy/YkjoZvwRue39W5lqTDUC+oFhCC4EScDxzvox5UD0qB65os6H
	 TOGdqljus19TsLQQrz/TbVAswKSX3BtUkGS1pwqeOVYUZ6rTS+S6JVuO8LDAhkBrUL
	 pKC5tDq19fXaSnxFVhq5Dj3aKjDqgscVrxve8w5aoPn7NcdYbxruoNlGYxyJp4r/TL
	 DA2YJwSkr40DA==
Subject: Re: [PATCH net-next 06/15] net: skbuff: add skb_crc32c_full() that
 reports failure
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, jgross@suse.com,
 sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, fmancera@suse.de,
 almasrymina@google.com, david.laight.linux@gmail.com, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Oct 2026 04:52:04 +0000
Message-ID: <179273112422.3134.14612188940817308301@kernel.org>
In-Reply-To:
 <20261019-b4-skbuff-bug-on-followups-v1-6-41dbef50b9f7@toxicpanda.com>
References:
 <20261019-b4-skbuff-bug-on-followups-v1-6-41dbef50b9f7@toxicpanda.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-bad1c0/1792731127-3B6D2034-FB0D8599/0/0
X-purgate-type: clean
X-purgate-size: 5113
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

- [Low] The new kernel-doc for skb_crc32c_full() (net/core/skbuff.c,
  above line 3810) says it returns -EFAULT when "@skb has unreadable…
- [Low] The commit message says skb_crc32c() 'becomes a wrapper that
  behaves as before', but its unreadable-frags WARN now covers less.

--

net: skbuff: add skb_crc32c_full() that reports failure

This commit adds skb_crc32c_full(). When the walk runs into unreadable
frags or past the end of the skb, it returns an error instead of a CRC
of 0. skb_crc32c() becomes a wrapper around it, and
skb_crc32c_csum_help() is converted, so SCTP packets that can't be
checksummed are dropped instead of being sent with a bogus CRC.

> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index de433d452939..3b2a3747f009 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -3788,23 +3788,41 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
>  EXPORT_SYMBOL(skb_copy_and_csum_bits);
>  
>  #ifdef CONFIG_NET_CRC32C
> -u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
> +/**
> + *	skb_crc32c_full - CRC32C a range of an skb
> + *	@skb: buffer to read
> + *	@offset: offset in @skb to start at
> + *	@len: number of bytes to include
> + *	@crcp: the CRC to continue from; on success, updated with the range
> + *
> + *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
> + *	has unreadable frags in the range or runs out before @len does.  On
> + *	failure *@crcp is not changed.
> + */
> +int skb_crc32c_full(const struct sk_buff *skb, int offset, int len, u32 *crcp)
>  {

[ ... ]

>  	if (copy > 0) {
>  		copy = min(copy, len);
>  		crc = crc32c(crc, skb->data + offset, copy);
>  		len -= copy;
>  		if (len == 0)
> -			return crc;
> +			goto out;
>  		offset += copy;
>  	}
>  
> -	if (WARN_ON_ONCE(!skb_frags_readable(skb)))
> -		return 0;
> +	if (!skb_frags_readable(skb))
> +		return -EFAULT;

[Severity: Low]
The kernel-doc above says -EFAULT means "@skb has unreadable frags in
the range". Does this check actually look at the range?

skb_frags_readable() only tests the flag for the whole skb:

include/linux/skbuff.h:skb_frags_readable() {
	return !skb->unreadable;
}

Take len == 0 with offset >= skb_headlen(skb). A readable skb walks
zero bytes and returns 0, but an unreadable skb returns -EFAULT here.

Now take a range that lies entirely in readable frag_list children of
an skb whose own frags are unreadable. That also fails here, before the
frag_list loop runs.

No current caller seems to hit this. skb_crc32c_csum_help() always
starts inside the linear head and passes a positive len.

Could the kernel-doc be reworded? Alternatively, this check could apply
only when the remaining range reaches frags[]. skb_checksum_full(),
added earlier in the series, has the same mismatch.

[ ... ]

> @@ -3844,19 +3862,36 @@ u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
>  		copy = end - offset;
>  		if (copy > 0) {
>  			copy = min(copy, len);
> -			crc = skb_crc32c(frag_iter, offset - start, copy, crc);
> +			err = skb_crc32c_full(frag_iter, offset - start, copy,
> +					      &crc);
> +			if (err)
> +				return err;

[ ... ]

> +/* skb_crc32c() has no way to report failure, so it returns 0, which is a
> + * valid CRC.  Use skb_crc32c_full() in new code.
> + */
> +u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
> +{
> +	if (unlikely(skb_crc32c_full(skb, offset, len, &crc))) {
> +		WARN_ON_ONCE(!skb_frags_readable(skb));

[Severity: Low]
The commit message says skb_crc32c() "becomes a wrapper that behaves as
before". Does the unreadable-frags warning still fire for frag_list
children?

Before this patch, the frag_list loop recursed through
skb_crc32c(frag_iter, ...). An unreadable child therefore hit
WARN_ON_ONCE(!skb_frags_readable(skb)) at the child level.

Now the recursion goes through skb_crc32c_full(frag_iter, ...). The
child returns -EFAULT without a warning, and this WARN_ON_ONCE() only
tests the outer skb.

So a readable parent with an unreadable frag_list child now returns 0
to sctp_compute_cksum(), siw_crc_skb() or batadv_bla_check_duplist()
without warning. Before the patch it warned once.

The return value is 0 either way, so only the diagnostic changes.
skb_gro_receive() doesn't seem to check readability when it merges into
frag_list, so this layout looks possible, but that hasn't been confirmed
end to end.

The skb_checksum() wrapper from earlier in the series has the same
pattern.

> +		return 0;
> +	}
>  	return crc;
>  }
>  EXPORT_SYMBOL(skb_crc32c);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7%40toxicpanda.com

