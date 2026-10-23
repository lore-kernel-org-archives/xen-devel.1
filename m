Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BA3606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FTvdEGT0
Received: from list by lists.xenproject.org with outflank-mailman.1458828.1670913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GF-0003Iv-E3; Fri, 23 Oct 2026 04:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458828.1670913; Fri, 23 Oct 2026 04:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GF-0003I1-5V; Fri, 23 Oct 2026 04:52:11 +0000
Received: by outflank-mailman (input) for mailman id 1458828;
 Fri, 23 Oct 2026 04:52:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xK7GE-00037i-CW
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7GD-00FSfm-Pi
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:09 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7e1-2eae-0a2a0a5409dd-0a2a4508cb7e-26
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:09 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7f8-f659-0a2a45080019-ac6904feabf6-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:09 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3CF3860233;
 Fri, 23 Oct 2026 04:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533F41F031E1;
 Fri, 23 Oct 2026 04:52:07 +0000 (UTC)
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
	s=k20260515; t=1792731128;
	bh=m4eUhHLp14jEKzi8uHnH2gScUY1iDl3d/EjgImmk3go=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FTvdEGT0Wxsyij7WdwX3FaVHnPOWCyIiEujPXH8IHq8o2B9pQfwgTdK/NqLRVSwGy
	 6xl9sgCPeh3sDT42Jd5Cye+yN3RquBnykOVo4418+K2jHCYfLz48/p+OI7ElNdMYem
	 9F2nmCE9xUALydd23c5SeQXqyDkc5RL6ndhQFp6c2KPTJtFO2sDorBRB9Z+CwHAWC2
	 60XKTi0L8s4jcjD+jfnj8CeUVsy8S58WWc1hWxNNH+w1hsTzV77vM5qKxDQ31wA830
	 TmUg45gOWhwyMRxHJVJwKpvZf6kzS1J7GUdszwqdRcAFMSTtvn//dxwAV8UClBBQFR
	 Vl0dNkv3k/v8w==
Subject: Re: [PATCH net-next 08/15] net: skbuff: make skb_try_coalesce()'s len
 unsigned
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, jgross@suse.com,
 sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, fmancera@suse.de,
 almasrymina@google.com, david.laight.linux@gmail.com, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Oct 2026 04:52:06 +0000
Message-ID: <179273112692.3134.1759491419702666549@kernel.org>
In-Reply-To:
 <20261019-b4-skbuff-bug-on-followups-v1-8-41dbef50b9f7@toxicpanda.com>
References:
 <20261019-b4-skbuff-bug-on-followups-v1-8-41dbef50b9f7@toxicpanda.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c1860d/1792731129-D775B87B-70DC75C0/0/0
X-purgate-type: clean
X-purgate-size: 2645
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message gets the bug's history wrong, so the single
  Fixes: tag (279877d86c82) is incomplete.

--

net: skbuff: make skb_try_coalesce()'s len unsigned

This changes the local len in skb_try_coalesce() from int to unsigned int,
so a from->len above INT_MAX can no longer pass the skb_tailroom() check.
It also adds an explicit delta < 0 test to the truesize WARN_ON_ONCE(),
since that comparison is now unsigned.

Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/

> Before that commit skb_put() ran first,
> and its overflow check caught such a length before anything was
> copied.

[Severity: Low]

Is this accurate on all configurations? Before 279877d86c82,
skb_try_coalesce() looked like this:

	if (len <= skb_tailroom(to) && skb_frags_readable(from)) {
		if (len)
			BUG_ON(skb_copy_bits(from, 0, skb_put(to, len), len));

len was already a signed int at that point. A from->len above INT_MAX
passed the tailroom check then, the same way it does now.

skb_put() then does:

	skb->tail += len;
	skb->len  += len;
	if (unlikely(skb->tail > skb->end))
		skb_over_panic(skb, len, __builtin_return_address(0));

On 32-bit, sk_buff_data_t is unsigned char *. A lowmem tail at or above
0x80000000 plus a len at or above 0x80000000 wraps below end, so
skb_over_panic() is never called. skb_put() returns the old tail, and
skb_copy_bits() runs with the negative len. That is the same large write
past @to that the commit message attributes to 279877d86c82.

On 64-bit, tail and end are u32 offsets. A from->len in the range
[2^32 - tail, 2^32) also wraps tail below end and gets past the check.
279877d86c82 seems to have widened this window on 64-bit, but it did not
open it.

git blame shows that the signed len goes back to the introduction of the
function:

  bad43ca8325f4 ("net: introduce skb_try_coalesce()")

Could the commit message be corrected? Should a Fixes: tag for
bad43ca8325f4 also be added? Without it, stable trees that don't contain
279877d86c82, including their 32-bit builds, may not get this fix.

> Fixes: 279877d86c82 ("net: skbuff: don't BUG() when skb_copy_bits() fails in copy helpers")

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7%40toxicpanda.com

