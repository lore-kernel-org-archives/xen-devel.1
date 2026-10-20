Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED14606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U6RN83HU
Received: from list by lists.xenproject.org with outflank-mailman.1456458.1669784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJGHJ-0007rH-07; Tue, 20 Oct 2026 20:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456458.1669784; Tue, 20 Oct 2026 20:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJGHI-0007rA-Tf; Tue, 20 Oct 2026 20:17:44 +0000
Received: by outflank-mailman (input) for mailman id 1456458;
 Tue, 20 Oct 2026 20:17:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <willemdebruijn.kernel@gmail.com>) id 1xJGHG-0007qH-MX
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:17:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJGHG-005aWb-3R
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:17:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6ad7cc3a-bab6-0a2a0a5309dd-0a2a4506cf1a-40
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:17:42 +0200
Received: from [209.85.221.169] (helo=mail-vk1-f169.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6ad7cc65-195a-0a2a45060019-d155dda9c895-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:17:41 +0200
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-5eac48af23fso1028024e0c.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 13:17:41 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com.
 [35.245.46.111]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-990d0e116a5sm838405241.2.2026.10.20.13.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 13:17:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792527460; x=1793132260; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=87SiGqQk09gjnLOfFzKbGj+YDTzrcqCWleu/6jAMDYE=;
        b=U6RN83HUiW1WXt2Z/ydka8evlHTcc7iEMD2Y04mQ53/Uqox5hg4rJxc3Ewf4gCoef6
         Qiklm48tr6npHYT6fRneZWp2MC/J/sMBb0hDTfggmrUe7fPnJZbA2x8xy9bm7iRUzoNV
         Y/5YBAAWE1W/yO5JFzGgfiTnpPGgqBNHmVWb14iFWJsWSDob49w6OHQ0dCj9uzqSVmFR
         m4jYz2QDfxdnxTxf3B9IAMyWZGUR1uxuXW+vYH/WWkCImCz7N1ARAf9n868SWfNgfMXC
         hEbc2rEt0D9Qv2V/lP7GNO/nG2jFfAzFbd6OcwWIk1vPsimFpRdEtrOOjINfYXOYF2Ri
         1B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527460; x=1793132260;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87SiGqQk09gjnLOfFzKbGj+YDTzrcqCWleu/6jAMDYE=;
        b=vjoy08o3y0gKL7DIzsQbKgNIvtoiHxcpnjZJJ6ZAAaIPHrjP+O7ncs+4ZuCTsyM49Y
         pGvFbqAnmebSnoNHKQUf0MS50VBZMDdd10Px8LCPlXCrBUpR+MOIcW22hwjwblkJwmDW
         Qrx1Z2fSMSM84ooSv2QXLYZIWM8YrT5ntAwxvXOILeId+N6s40nmRlMb/eD2t8c1eXAW
         uSCkpgJqNXaszS7ae6WJW/jFKkdkJOnwpa4pgdvYSKpmamlWJWg/F4FKrjYIMEiGoteB
         ygb2TSNfoXmm3qcA/tAEu4db8cl4wuB8TAmF/mW0HZz38sJ5GW4UBXaljvATKzexCxbd
         XXaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH9RpFDQftCmXrGwPIWIqTy/BSCtmFqC02X7jT0wH3v/U1gjKMXfUmnZIpetVRq0zmcyz0pB78B9Q=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJIs5pjW/7PH6qFPHI5b7Qegg5vnjvpd2rGZsph/G0eCxuz4CL6
	5TJI4s6hle0AoKUFdRiKQsWPBxATzyBXHFp68Q9a8nRKUO2gWEGvUfBF
X-Gm-Gg: AYBFou2KL33MbR/imd3IADif2h/ZrzypwHQHrzpAD9OgC7QVLekycYbebPMoz8uhOfV
	0xly0uREQ8b6EmmFGNRgHS64cJq71qGvzTSJpW7W1wjvIiosADx6jgP9X71hvfJM0GeyH+qBHMe
	DocxNMFvJcdLNyfy0bg5O2mqgMB4IXX1szNsRwvFiPyv+dz4gWzjWOWHhsslZ8cVUFDMR33d4Pn
	ntBRv6g7uFqFcmr5Nh68wH8GV04tO+ONuXDxc7ALUdh3BWgZyyiESv2JGlFlAo+LENLhSN5ddjU
	RlFw9Ps6MTtTEboDpl+j5IPZ4SAFd+P/0rku73UTUA6KxPkqwFlQiGQdjmieIGCB9TCs1FbRbin
	/TUI14H0fCwPHCANLA+OyKeiZRQC4r2RwpZVYKTCVk0YMyLNny87gwi7OO3/OtQsDKPjPOn0mwq
	gKfrJIXILUDqoBWUxAqQmjC42X/vg/IX/E8OaLbzLKYzqaXELyXB4uZxshj7irokmfn96BOJeex
	cyblVSl7Zt66p0kvWU/PmoaKvb/f96qu9cFanlaRnN6av4LdmUl3T1hD0cAWuePaoga1rnhjGg5
	kUiqApPe99LMpP6Qkv70yw5NWjCtRD41eLbOYQ==
X-Received: by 2002:a05:6102:4485:b0:7b3:4199:2dd7 with SMTP id ada2fe7eead31-7cc92256068mr130816137.0.1792527460493;
        Tue, 20 Oct 2026 13:17:40 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:17:39 -0400
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
Message-ID: <willemdebruijn.kernel.22d6042aad0ba@gmail.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-12-41dbef50b9f7@toxicpanda.com>
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
 <20261019-b4-skbuff-bug-on-followups-v1-12-41dbef50b9f7@toxicpanda.com>
Subject: Re: [PATCH net-next 12/15] net: test the frag_list layouts
 skb_segment() refuses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1792527462-FEA7477B-F305DFDA/0/0
X-purgate-type: clean
X-purgate-size: 3531
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Josef Bacik wrote:
> The GSO KUnit test only checks layouts skb_segment() can segment.  Add
> two it has to refuse with -EINVAL: the non-uniform frag_list with SG
> on, which used to hit the BUG_ON(i >= nfrags) the existing test steps
> around, and a frag_list member that has its own frag_list.
> 
> Both warn on CONFIG_DEBUG_NET kernels, so run them with the warning
> backtrace suppressed.
> 
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

Thanks!

> ---
>  net/core/net_test.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/net/core/net_test.c b/net/core/net_test.c
> index bc2ef7612e7d..12a175268a01 100644
> --- a/net/core/net_test.c
> +++ b/net/core/net_test.c
> @@ -39,6 +39,8 @@ enum gso_test_nr {
>  	GSO_TEST_RESEGMENT_MULTI,
>  	GSO_TEST_RESEGMENT_TAIL,
>  	GSO_TEST_RESEGMENT_ONE_MSS,
> +	GSO_TEST_FRAG_LIST_NON_UNIFORM_SG,
> +	GSO_TEST_FRAG_LIST_NESTED,
>  };
>  
>  struct gso_test_case {
> @@ -57,6 +59,9 @@ struct gso_test_case {
>  	unsigned int nr_segs;
>  	const unsigned int *segs;
>  	const unsigned int *gso_segs;
> +
> +	/* skb_segment() is expected to fail with this error */
> +	int err;
>  };
>  
>  static struct gso_test_case cases[] = {
> @@ -204,6 +209,28 @@ static struct gso_test_case cases[] = {
>  		},
>  		.gso_segs = (const unsigned int[]) { 0, 0, 0, 0 },
>  	},
> +	{
> +		/* frag_list members that don't end on gso_size boundaries
> +		 * can't be segmented with SG
> +		 */
> +		.id = GSO_TEST_FRAG_LIST_NON_UNIFORM_SG,
> +		.name = "frag_list_non_uniform_sg",
> +		.linear_len = GSO_TEST_SIZE,
> +		.nr_frag_skbs = 4,
> +		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, 1, GSO_TEST_SIZE, 2 },
> +		.err = -EINVAL,
> +	},
> +	{
> +		/* the second frag_list member hangs off the first one's
> +		 * frag_list instead of off the head's
> +		 */
> +		.id = GSO_TEST_FRAG_LIST_NESTED,
> +		.name = "frag_list_nested",
> +		.linear_len = GSO_TEST_SIZE,
> +		.nr_frag_skbs = 2,
> +		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE },
> +		.err = -EINVAL,
> +	},
>  };
>  
>  static void gso_test_case_to_desc(struct gso_test_case *t, char *desc)
> @@ -283,6 +310,15 @@ static void gso_test_func(struct kunit *test)
>  
>  		if (tcase->id == GSO_TEST_GSO_BY_FRAGS)
>  			skb_shinfo(skb)->gso_size = GSO_BY_FRAGS;
> +
> +		if (tcase->id == GSO_TEST_FRAG_LIST_NESTED) {
> +			struct sk_buff *first = skb_shinfo(skb)->frag_list;
> +
> +			skb_shinfo(first)->frag_list = first->next;
> +			first->next = NULL;
> +			first->len += tcase->frag_skbs[1];
> +			first->data_len += tcase->frag_skbs[1];
> +		}
>  	}
>  
>  	features = NETIF_F_SG | NETIF_F_HW_CSUM;
> @@ -296,6 +332,18 @@ static void gso_test_func(struct kunit *test)
>  		features &= ~NETIF_F_SG;
>  
>  	SKB_GSO_CB(skb)->max_segs = tcase->max_segs;
> +
> +	if (tcase->err) {
> +		/* the suppression block doesn't run if it can't be set up */
> +		segs = NULL;
> +		kunit_warning_suppress(test)
> +			segs = skb_segment(skb, features);

nit: if respinning, add braces


> +		KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(segs), tcase->err);
> +		if (!IS_ERR_OR_NULL(segs))
> +			kfree_skb_list(segs);
> +		goto free_gso_skb;
> +	}
> +
>  	segs = skb_segment(skb, features);
>  	if (IS_ERR(segs)) {
>  		KUNIT_FAIL(test, "segs error %pe", segs);
> 
> -- 
> 2.55.0
> 



