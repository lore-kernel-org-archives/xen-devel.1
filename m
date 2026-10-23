Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFA606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egaoWeXY
Received: from list by lists.xenproject.org with outflank-mailman.1458833.1670941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GJ-0004Cm-V8; Fri, 23 Oct 2026 04:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458833.1670941; Fri, 23 Oct 2026 04:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GJ-0004CA-Nb; Fri, 23 Oct 2026 04:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1458833;
 Fri, 23 Oct 2026 04:52:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xK7GI-0003uX-Ok
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7GI-008wg1-58
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7b7-2eae-0a2a0a5409dd-0a2a450ce014-34
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:14 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7fc-f479-0a2a450c0019-ac6904fed766-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:14 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AD1706022C;
 Fri, 23 Oct 2026 04:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959C41F01825;
 Fri, 23 Oct 2026 04:52:11 +0000 (UTC)
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
	s=k20260515; t=1792731132;
	bh=agkvCklKmEd8Wp6mVSMBoVqEMTNMmcycBQEcregNfVo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=egaoWeXYUJlTrjLH3F6bQMXw18UbNdnbpS+dRSabHlQD9C/AeZOtHA9cr0o/UxpQU
	 tmTHIqaypY0rM6WJSD3sGo7DnT1Zkr8pWqM0qo0GLWqTb1vJbqm1LLavuOtc6ORwyI
	 kOLvXSjea4i2T8GXpLijTp9Fsh1/aEDZDShjnmghI9kkbFwOEsVxY0fNKf/0L01bxz
	 +7UJ4e08bNKe/mS9VtdtX26PgFbKT316nG6h4msxi9zsqOnIW14ym2aEp7Sq/yXrcF
	 oo3uzlQddM6jfX0uSqrGMxXJGIFIGpXL6Rdb4be6b/dOGBF+ErgxMYRdS70/6rL6od
	 n8owJ7ZO8cU7A==
Subject:
 Re: [PATCH net-next 11/15] net: skbuff: refuse to segment a nested frag_list
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, jgross@suse.com,
 sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, fmancera@suse.de,
 almasrymina@google.com, david.laight.linux@gmail.com, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Oct 2026 04:52:11 +0000
Message-ID: <179273113115.3134.9365887081510077540@kernel.org>
In-Reply-To:
 <20261019-b4-skbuff-bug-on-followups-v1-11-41dbef50b9f7@toxicpanda.com>
References:
 <20261019-b4-skbuff-bug-on-followups-v1-11-41dbef50b9f7@toxicpanda.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-d25034/1792731134-004CFA5B-EE728E73/0/0
X-purgate-type: clean
X-purgate-size: 2202
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

- [Low] The commit message for "net: skbuff: refuse to segment a nested
  frag_list" says "Nothing in the tree is known to build such an skb;…

--

net: skbuff: refuse to segment a nested frag_list

This adds a check to skb_segment() that rejects an skb whose frag_list
members have frag_lists of their own. It fails with -EINVAL and calls
DEBUG_NET_WARN_ON_ONCE(), since the segmentation walk would otherwise run
out of members and dereference a NULL list_skb.

> Nothing in the tree is known to build such an skb; GRO flushes instead
> of chaining an skb that already has a frag_list.  Check for it up front

[Severity: Low]

Is the first half of this sentence accurate as a general statement?

IP fragment reassembly appears to build exactly this layout. When the
first fragment already has a frag_list, inet_frag_reasm_prepare() moves
that frag_list under a new zero-length skb:

net/ipv4/inet_fragment.c:inet_frag_reasm_prepare() {
    ...
	if (skb_has_frag_list(head)) {
		struct sk_buff *clone;
		...
		clone = alloc_skb(0, GFP_ATOMIC);
		...
		skb_shinfo(clone)->frag_list = skb_shinfo(head)->frag_list;
		skb_frag_list_init(head);
		...
		skb_shinfo(head)->frag_list = clone;
		nextp = &clone->next;
    ...
}

The result is head -> frag_list[clone -> frag_list[...]]. That is the
nested layout the new check in skb_segment() rejects.

The GRO part is correct. dev_gro_receive() sets:

	NAPI_GRO_CB(skb)->flush = skb_has_frag_list(skb);

Reassembled skbs are not GSO, so they don't normally reach skb_segment().
The narrower claim seems to be what's meant: no in-tree path builds a GSO
skb with a nested frag_list.

Could the commit message say that instead, and mention IP defrag as a
known non-GSO source of nested frag_lists?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7%40toxicpanda.com

