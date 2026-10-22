Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6C606A322
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 01:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C8mcvl31
Received: from list by lists.xenproject.org with outflank-mailman.1457752.1670266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJhtp-00055A-9Y; Thu, 22 Oct 2026 01:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457752.1670266; Thu, 22 Oct 2026 01:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJhtp-000552-50; Thu, 22 Oct 2026 01:47:21 +0000
Received: by outflank-mailman (input) for mailman id 1457752;
 Thu, 22 Oct 2026 01:47:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <willemdebruijn.kernel@gmail.com>) id 1xJhtm-00054w-RG
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 01:47:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJhtl-000Ynv-Sz
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 03:47:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6ad96b25-8faa-0a2a0a5109dd-0a2a450b80a8-0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 03:47:17 +0200
Received: from [209.85.221.169] (helo=mail-vk1-f169.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6ad96b24-b7e8-0a2a450b0019-d155dda9dcbc-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 03:47:17 +0200
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-5eaefe5b523so845886e0c.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 18:47:17 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com.
 [35.245.46.111]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5eae980f64esm5275613e0c.13.2026.10.21.18.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 18:47:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792633636; x=1793238436; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jCKRYOUlKmoPJSnDi6pvpqUte660v3ToEOh1Wa/1TdM=;
        b=C8mcvl316tLOTrxfqr1lFp5qnwJCIaHKuoV9Lr82c58gZORiGIdXAKez5zKdA5/XNa
         zjZlO3bSikRPXoxij9ti4bBaKKGW9ksxVcHuZcbf99rKKYShJzRb1e0INqZYJo/Hw9ck
         tESiw2qnkHYSeB/gDlOHSysxgsT6YEUvgSj1+0USpIs8UErA9RUk5YxGuI0N1LJGBbAu
         NFvEnn2bDvgsTav31O9OEC1bNP9ATSvnPL2BrlAubhQGjJn759EvHH6T9BxtCzEldTTr
         dLxgHLe0CyPWfO8jH9fGncOYfrCqUmsJ0yrGgBIfHz0yVAZzQEhWrxhdCtnnnuPFOqki
         rZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792633636; x=1793238436;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCKRYOUlKmoPJSnDi6pvpqUte660v3ToEOh1Wa/1TdM=;
        b=t5LvVIQX2HlAh44S9ftPL7O3lpc5c14AT26Yiezt9LJXn4tLElUYV5VLlvmSM4pQ9O
         5+C6WTjMxwDXhW9GMQ9qXXZg69q3AUl/9eyDvp9LKvgItITmRHP810wFxEifOMrWwCbS
         wh6xwIV0rltK+jxvQ10+FEpULHp+8RzyDIvjmBqn5Jb11Dez4xkQ4P3UYD7bXmpS5qxE
         S9N207ZTHUzfpH6WEabD9dJc+dFgYleOAHnQhy9poPfJcaQdmblqhKLnPlvKnmXO8KJt
         ZpwWPEIuUGCn8Oe5jH5uiO3i5ChB+oDVvB7rSTx9a0Ks75XayR3sVVkLRlXi00SCDBuu
         oAJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyK42H6GgrU8ICSejRzX/w56vt6hTzAXXLUGOBMUucoXZ0OmgKeTM9kqjQ4NOMQoY8h+aqZ2BlN/A=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKTQBjBSrZFYC3cmaRPijACr3jFePunTKrU7cCXtrvZHeyXjs+i
	6INgbanhWW535GOtZEXxRdph9L2HDlPoJCaIFBgPy4/VPrH8E0+AJL8U
X-Gm-Gg: AYBFou19sftBrhHrKHm9v0LXEoUWpZ7srQrHmo7EBY+zN0EsejMF2Cs9pPl2h5aAGTE
	NNKMotkPDBT218bUQ9hVxKRl+K/0aWJZ3pR2Epvb1Nu0QU3MrwqQgzeqlbh1xDbRmx3BmbW8voO
	R5cON358Ugxyb2R9jFhaO7xXTG7dK/qAKpxgfF3N+4fMxRnp3bQwd45vFrJYsyqx2nZTfjsmQMw
	WGAyoLMNgoUXyc2Lc9JGQPiNvNLogzKtZVUwGUnwXB8DVrdtTlvg6Tf31q1umrhLAux90/srdr2
	YPtVpxPU8297Yk1uC7Fz4cL3ZqL4e5mBxH2oORsXscLGLYneVdn3wcwq/+GAABimYuWz/jxiAqO
	DPsKzT13JmekKJmPEcncrV8R3MegmAJw08G3DZYF6OHLa5wb8el2fgZsfkpkgCbKIOmkAGuUOB6
	H8nMeXXvbsdEYo2yXXKuYBJgq23HgehqIUbtuddIw1o8CbjFgkMU6vPQQE96yxX/x0zNGwOBLvW
	F1fHrzLcTpX4uJipval8Lc6/44tlSEtKGdnMRPCNuq6MG7WYxIilOOk58NlCjmfF6ypKXTR2ZmJ
	GfsnyNn9zCxn0uSENQWjwmDGKf832Ba131aU0jFpcK5i+Wy78nqRwEQHVX3XtjD2N2VswXobrnQ
	+vaiEkwHuGWK7q9i3D6U=
X-Received: by 2002:a05:6122:1d9f:b0:5e6:82ca:c551 with SMTP id 71dfb90a1353d-5eaebef16acmr1695454e0c.22.1792633636272;
        Wed, 21 Oct 2026 18:47:16 -0700 (PDT)
Date: Wed, 21 Oct 2026 21:47:15 -0400
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
 Willem de Bruijn <willemb@google.com>, 
 Josef Bacik <josef@toxicpanda.com>
Message-ID: <willemdebruijn.kernel.11bad1f39601b@gmail.com>
In-Reply-To: <20261021-b4-skbuff-bug-on-followups-v2-11-2aa780a03524@toxicpanda.com>
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
 <20261021-b4-skbuff-bug-on-followups-v2-11-2aa780a03524@toxicpanda.com>
Subject: Re: [PATCH net-next v2 11/15] net: skbuff: refuse to segment a nested
 frag_list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1792633637-2C59A9EA-756025D2/0/0
X-purgate-type: clean
X-purgate-size: 3373
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
> list_skb to NULL, and dereferences it on a later pass, before any of
> the layout checks get a chance to catch it.  When the member is taken
> whole with skb_clone(), the pskb_trim() that follows also drops its
> nested data.
> 
> Nothing in the tree is known to build such an skb; GRO flushes instead
> of chaining an skb that already has a frag_list.  Check each member as
> the walk takes it, in the GSO_BY_FRAGS, clone and frag paths, and fail
> the segmentation with -EINVAL if there's no member left or it has its
> own frag_list, with a DEBUG_NET_WARN_ON_ONCE() for debug kernels, like
> the other frag_list layout checks.  Without SG the payload is copied
> with helpers that do recurse into nested frag_lists, so that path is
> left alone.
> 
> Suggested-by: Willem de Bruijn <willemb@google.com>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  net/core/skbuff.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 56cec58bccb7..c5e28a52114b 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -5087,6 +5087,15 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
>  		int size;
>  
>  		if (unlikely(gso_by_frags)) {
> +			/* The walk only goes one level deep: running out of
> +			 * members, or finding one with its own frag_list, means
> +			 * a nested frag_list that head_skb->len counts.
> +			 */
> +			if (unlikely(!list_skb || skb_has_frag_list(list_skb))) {
> +				DEBUG_NET_WARN_ON_ONCE(1);
> +				err = -EINVAL;
> +				goto err;
> +			}

This patch became quite a bit more complex because of my request.
More than I anticipated.

Are you sure this first block is needed?


>  			len = list_skb->len;
>  		} else {
>  			len = head_skb->len - offset;
> @@ -5096,9 +5105,11 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
>  
>  		hsize = skb_headlen(head_skb) - offset;
>  
> -		if (hsize <= 0 && i >= nfrags && skb_headlen(list_skb) &&
> +		if (hsize <= 0 && i >= nfrags && list_skb &&

this test for list_skb != NULL is new. Previously this code already
tested skb_headlen(list_skb) without it. Likely not needed for
anything new in this patch?

> +		    skb_headlen(list_skb) &&
>  		    (skb_headlen(list_skb) == len || sg)) {
> -			if (unlikely(skb_headlen(list_skb) > len)) {
> +			if (unlikely(skb_headlen(list_skb) > len ||
> +				     skb_has_frag_list(list_skb))) {
>  				DEBUG_NET_WARN_ON_ONCE(1);
>  				err = -EINVAL;
>  				goto err;
> @@ -5216,6 +5227,13 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
>  
>  		while (pos < offset + len) {
>  			if (i >= nfrags) {
> +				if (unlikely(!list_skb ||
> +					     skb_has_frag_list(list_skb))) {
> +					DEBUG_NET_WARN_ON_ONCE(1);
> +					err = -EINVAL;
> +					goto err;
> +				}
> +
>  				if (skb_orphan_frags(list_skb, GFP_ATOMIC) ||
>  				    skb_zerocopy_clone(nskb, list_skb,
>  						       GFP_ATOMIC))
> 
> -- 
> 2.55.0
> 



