Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9158606A322
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ld63QP+w
Received: from list by lists.xenproject.org with outflank-mailman.1456423.1669776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG9X-00067W-8y; Tue, 20 Oct 2026 20:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456423.1669776; Tue, 20 Oct 2026 20:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG9X-00067K-5s; Tue, 20 Oct 2026 20:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1456423;
 Tue, 20 Oct 2026 20:09:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <willemdebruijn.kernel@gmail.com>) id 1xJG9V-00066k-Rq
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:09:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG9U-005ZVS-9r
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:09:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6ad7ca66-2eae-0a2a0a5409dd-0a2a450781d8-40
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:09:40 +0200
Received: from [209.85.221.177] (helo=mail-vk1-f177.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6ad7ca83-b4ea-0a2a45070019-d155ddb1bd29-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:09:40 +0200
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-5eadf48fb2dso342404e0c.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 13:09:39 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com.
 [35.245.46.111]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5eae981d239sm558143e0c.14.2026.10.20.13.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 13:09:38 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792526979; x=1793131779; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a/FHpmQozRyX6PRPz0UuyxMFmwgJ5gMZhHW6lZCR6ao=;
        b=Ld63QP+wpVX3p6wu7jJgh6l5DU8PF/HGrKdVjwBsMIjMk/IEHRkFEL1RwJ2H9xtIdh
         hdrHYWyZBRCcCcwoIuSOpiALmlMNnNbTM/nOug78c642ckA1uRKz2+fpUIhsqna9/aq4
         9+/4ZPNeQ4d4yNsDCpkP8y3Ex/gtdmYT5PmQyQXIMXRHX4jq91UBzJpp9hQphM7YI03c
         mNPARTu9yhSjzK5ut2i/W2DNDpxJSSQ53/2Ng0fsYbNWHSS99GUd/g314VUcSb2o/xBj
         HvG2IjVIelMx4VFx3uGlVzB4Rmb2V+k6Y6W/CnmLCccaKyziDi6FViItY+TftP9Eb44C
         wpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526979; x=1793131779;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/FHpmQozRyX6PRPz0UuyxMFmwgJ5gMZhHW6lZCR6ao=;
        b=Ps/SD5I1koKC+7kcNwBJK1jK+QmfwvUqlEHJw1Lzm5IVjbz+kxJeyiNtOOwxnIQmB7
         7XNI0w24LUwUOKgHzYBUGuWbbVCPk11P6+TmOXcYxyDqOr3Wz1k/gK7y+bVomCrsIwm1
         cJKtPWpEW4wwkrIAUqqhftURf5K+EyMpq+EtZ1il73h5dCOwRN6atJ4qNF+zU5Veft5J
         JbgkCYfwrX5YASxvmVb8Lg1/ynVeNQbXMZqCi0te+7+6F41HjLnzJ9bNc01nqT0djoCi
         vclvfotVrZGMTHZed5+Cg/1iT3IXHWMBcjRPzW+NSmrR5cZYzxqhqtX4qa1KPcTaLT64
         xhvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCefBG+he103LYwLQtg+BG5SLNeolZfGSjwIJOc18CQF71y9NVuqKnwEMybeykRF60P/uSfg1fES4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIKn1uAnqmzrlsEIK+m07NYJekD7Rw3P0cqgENyGbNxfWqycg9i
	VDeMDluhPFVf9SRt1OkKJlhGVLtDFKgMt5s8kT1tA/zngGaaKocXrrEg
X-Gm-Gg: AYBFou1kFkAbGUF4hNOIXuI1EobOIhEDXTbHk6Lu8i2t0uPNLaswXScIKMD2YySWKHw
	CE/9TqBjit7m8cQz+xD0Ov9/fRGjb1DDeBO4fQwnGwdFC/StmZJ4djlOmGhx5CEE5YiVJr31HYd
	OuIrMm1GWKCEVPsTh/0wI7hj90NaHm/flKctfLZc6sr5azM9D2Xb8SBRQk6TqWsvrJeSmLOvbD2
	DQ8cItBqaRjEczvfk59Ce7mHVcGc33tSddAnjXW5zVaHhjQlj8TRs4ZbrQYkfEFqYU8VV7Jtbb/
	tMelvEa+P/S0nb+0c5+mpl+slihr9niCg3N4L7IzIuBcDYCUjKNoxx7vt/WfJRvE1oXS5vOSeK1
	WSWGeY0YL40JxQ4aY6acKlM+uVlghNTFAjqQPtK5pxv5kn/fiv61XsCrnPvmmAfgYvvMvfAC4Ll
	gdPOVdCGLJvMmj4roMWUUdETCtjauRwYw6hGkfgHgD/VnGAkgVFOObxIXOKmG0nHbF6bczMYvm3
	n2K3ixTVsykyYSpGhp6Uq/8yAG8Pv1AnubjyM30IxHFUBbzPao7tTwxb1cLI/zAqrWpcZrkJBCu
	1hejPTpqJBnvWj6QzWtsBIkY3vqZ80SbYwD+1w==
X-Received: by 2002:a05:6122:8616:b0:5c9:a60b:e5c8 with SMTP id 71dfb90a1353d-5eaaa414a8bmr4189894e0c.11.1792526978625;
        Tue, 20 Oct 2026 13:09:38 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:09:37 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Josef Bacik <josef@toxicpanda.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, 
 Mina Almasry <almasrymina@google.com>, 
 David Laight <david.laight.linux@gmail.com>, 
 netdev@vger.kernel.org, 
 xen-devel@lists.xenproject.org, 
 Josef Bacik <josef@toxicpanda.com>
Message-ID: <willemdebruijn.kernel.29f6b224b2d77@gmail.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-11-41dbef50b9f7@toxicpanda.com>
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
 <20261019-b4-skbuff-bug-on-followups-v1-11-41dbef50b9f7@toxicpanda.com>
Subject: Re: [PATCH net-next 11/15] net: skbuff: refuse to segment a nested
 frag_list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1792526980-37AD0AE4-C1C76924/0/0
X-purgate-type: clean
X-purgate-size: 2825
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Josef Bacik wrote:
> skb_segment() walks head_skb's frag_list, but for each member it only
> looks at the linear part and frags[], never at the member's own
> frag_list.  head_skb->len still counts those bytes, so with a nested
> frag_list the walk runs out of members while it still owes data, sets
> list_skb to NULL, and dereferences it on the next pass, before any of
> the layout checks get a chance to catch it.
> 
> Nothing in the tree is known to build such an skb; GRO flushes instead
> of chaining an skb that already has a frag_list.  Check for it up front
> and fail the segmentation with -EINVAL, with a DEBUG_NET_WARN_ON_ONCE()
> for debug kernels, like the other frag_list layout checks.
> 
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  net/core/skbuff.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 56cec58bccb7..b6ada54ecc57 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -4962,6 +4962,17 @@ struct sk_buff *skb_segment_list(struct sk_buff *skb,
>  }
>  EXPORT_SYMBOL_GPL(skb_segment_list);
>  
> +/* skb_segment() only walks one level of frag_list. */
> +static bool skb_segment_nested_frag_list(const struct sk_buff *head_skb)
> +{
> +	const struct sk_buff *iter;
> +
> +	skb_walk_frags(head_skb, iter)
> +		if (skb_has_frag_list(iter))
> +			return true;

We can probably check the same without adding an extra skb_walk_frags.

Perhaps

@@ -5025,6 +5025,12 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
                while (pos < offset + len) {
                        if (i >= nfrags) {
+                               if (unlikely(!list_skb || skb_has_frag_list(list_skb))) {
+                                       DEBUG_NET_WARN_ON_ONCE(1);
+                                       err = -EINVAL;
+                                       goto err;
+                               }
+

> +	return false;
> +}
> +
>  /**
>   *	skb_segment - Perform protocol segmentation on skb.
>   *	@head_skb: buffer to segment
> @@ -5023,6 +5034,16 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
>  	sg = !!(features & NETIF_F_SG);
>  	csum = !!can_checksum_protocol(features, proto);
>  
> +	/* The walk below never looks inside a member's own frag_list, but
> +	 * head_skb->len counts those bytes, so it would run out of members
> +	 * and dereference a NULL list_skb.
> +	 */
> +	if (unlikely(list_skb && skb_segment_nested_frag_list(head_skb))) {
> +		DEBUG_NET_WARN_ON_ONCE(1);
> +		err = -EINVAL;
> +		goto err;
> +	}
> +
>  	if (sg && csum && !gso_by_frags)  {
>  		if (!max_segs && !(features & NETIF_F_GSO_PARTIAL)) {
>  			struct sk_buff *iter;
> 
> -- 
> 2.55.0
> 



