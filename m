Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B65606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7NZQ8FF
Received: from list by lists.xenproject.org with outflank-mailman.1458835.1670952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GM-0004dO-BQ; Fri, 23 Oct 2026 04:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458835.1670952; Fri, 23 Oct 2026 04:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GM-0004d4-68; Fri, 23 Oct 2026 04:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1458835;
 Fri, 23 Oct 2026 04:52:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xK7GK-0004GI-Aq
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7GJ-008wg1-L4
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7b7-2eae-0a2a0a5409dd-0a2a450ce014-36
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:15 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7fe-f479-0a2a450c0019-aceafc1fe3b2-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:15 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E299A436D5;
 Fri, 23 Oct 2026 04:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050741F01829;
 Fri, 23 Oct 2026 04:52:12 +0000 (UTC)
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
	s=k20260515; t=1792731133;
	bh=azFOvOpPS9RZ120HsX52bxdBzg8kjxW7KcH0FOk6vxc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O7NZQ8FF6U3UOuTimWTmvUqmaQtqyLVbAEyVmIZaqkfWBBzHNo/Sue+FKa7kvDag9
	 nGpldSZO1RJeeeO4F/b6JyTA5GuQmwtOwKX2YAnRMGYPqKutIrABrHEG0WyLHhbOPa
	 Kcv1pUAXpm4ncNeD8z3Pk1V28XYa9S70hu7aQYRvmMt7qgz/g45PKhuwHFJk3/nqAQ
	 VA98nDMzOYmNGgDL/T48hpGLBUc4Fdk+jhHa7I5JOXrCF+tquW7nfEyu+ilOBrGK8q
	 PTczCVynq1BGOc3PQKef6MlH8AGHhHHFgfz+ZtkZDeft78f0gAmzpMsD9QViEHZ3af
	 YvoC9799xvoew==
Subject: Re: [PATCH net-next 14/15] net/tls: don't BUG() on leftover length in
 __skb_nsg()
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, jgross@suse.com,
 sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, fmancera@suse.de,
 almasrymina@google.com, david.laight.linux@gmail.com, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Oct 2026 04:52:12 +0000
Message-ID: <179273113257.3134.13391569696975669516@kernel.org>
In-Reply-To:
 <20261019-b4-skbuff-bug-on-followups-v1-14-41dbef50b9f7@toxicpanda.com>
References:
 <20261019-b4-skbuff-bug-on-followups-v1-14-41dbef50b9f7@toxicpanda.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-d25034/1792731135-036D6A5B-C5DB1CF1/0/0
X-purgate-type: clean
X-purgate-size: 2307
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

- [Low] In net/tls/tls_sw.c, the comment above skb_nsg() is now out of
  date.

--

net/tls: don't BUG() on leftover length in __skb_nsg()

This patch replaces the BUG_ON(len) in __skb_nsg() with a
DEBUG_NET_WARN_ON_ONCE() and an -EINVAL return. A range that runs past
the end of the skb now fails the record in tls_decrypt_sg() instead of
crashing the kernel.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 312e51270f29..1c578ea47a1b 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -142,7 +142,10 @@ static int __skb_nsg(struct sk_buff *skb, int offset, int len,
>                          start = end;
>                  }
>          }
> -        BUG_ON(len);
> +	if (unlikely(len)) {
> +		DEBUG_NET_WARN_ON_ONCE(1);
> +		return -EINVAL;
> +	}
>          return elt;
>  }
>  

[Severity: Low]
This isn't a bug, but should the comment above skb_nsg() be updated to
cover the new return value? The comment directly below this hunk still
says:

net/tls/tls_sw.c:
/* Return the number of scatterlist elements required to completely map the
 * skb, or -EMSGSIZE if the recursion depth is exceeded.
 */
static int skb_nsg(struct sk_buff *skb, int offset, int len)
{
        return __skb_nsg(skb, offset, len, 0);
}

skb_nsg() returns whatever __skb_nsg() returns. The recursive frag_list
calls also pass negative values straight up:

    if (unlikely(ret < 0))
            return ret;

So skb_nsg() can now return -EINVAL when the skb runs out before the
requested range does.

The only caller, tls_decrypt_sg(), already handles any negative value:

    if (n_sgin < 1)
            return n_sgin ?: -EBADMSG;

So this doesn't change behavior at runtime.

The comment is also still unchanged at the end of the series, including
after the last patch, "net: update comments that still describe the skb
BUG_ON()s".

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7%40toxicpanda.com

