Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B812606A329
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 02:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NN14gVQ3
Received: from list by lists.xenproject.org with outflank-mailman.1471208.1679768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xORCK-0000eN-0B; Wed, 04 Nov 2026 02:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471208.1679768; Wed, 04 Nov 2026 02:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xORCJ-0000eG-Sx; Wed, 04 Nov 2026 02:57:59 +0000
Received: by outflank-mailman (input) for mailman id 1471208;
 Wed, 04 Nov 2026 02:57:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <willemdebruijn.kernel@gmail.com>) id 1xORCJ-0000e3-6K
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 02:57:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xORCI-005LIU-C1
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 03:57:58 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6aea9f02-bab6-0a2a0a5309dd-0a2a450991f8-18
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:57:58 +0100
Received: from [209.85.222.53] (helo=mail-ua1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6aea9f35-be1a-0a2a45090019-d155de35b5b3-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:57:58 +0100
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-98c78660542so150575241.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:57:57 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com.
 [34.150.230.223]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7d277d13753sm62688137.10.2026.11.03.18.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 18:57:55 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793761077; x=1794365877; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QxPkYmlqBpasJs1WNWIGsKH6gd/q8cxBmo1mIv7+8yI=;
        b=NN14gVQ3Ms31OsBIfOk55Cxw2TE7quL3vk5yxpXJD85HPwCPgGGuelcMUlytSWbbIN
         yTfKYvYI/fCWILtcbJ3Z9VCNT6yFDo1vGUzt/qeL9QmMVoFNugkG8eXwXCVxZK2aX8wJ
         V14tuuZd2H5/TWP60A9yKaYMKlseAYotBGbC+Swo91f3vuuWc7RKkiLRNqJeSapw7sxp
         ODY+KrAaOQUdzybKn309xdXvb1/lVpTM7MgLqgjLUIBI21WZNVsD6wUVatkIlz1/fJEI
         9O7hIG/YjXUgTnD9AEzmTHrwMJHnFWutY2nKGD+4RdENeRyStjYbWUuDeszFMKjWYEW8
         yBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793761077; x=1794365877;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxPkYmlqBpasJs1WNWIGsKH6gd/q8cxBmo1mIv7+8yI=;
        b=2dMk21fxzzIvGYJ11NL5GWNrmo2NYUsvb7KDWL/OuIuYZSeAOn6ne9iY2dCLsOIzbw
         n16NBPuRt8FqVxOAjRmojjbt83IDT9r8llWVEkI6qASuTs7ZQ0/+BcLNojQkjRcng6cX
         MzTTrwYeIkKbK8DNks17REQM/blCwGxE2O/QeZccn6kbsAJppuOyXOScviUAFkwy6IdK
         3jV5JXn6MBlHEosfHmUHWVwXaulScGIvN01cPuZtRv52TgdmQBOSIjC7/XxcrA3gAbph
         7AwGiJ5x4Ff8f7dhYnmipINgpHN0GvGL0V0rPxqM5Cxh0FWmmAV6woiOt/GCWV/G1XLW
         LsVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJRPxHZqD7MKGH57ZPFfGrRPaAl/L77AtsoGQc6k9SfPyvSU/wqXgpANTsRqHsdYp8XCx2VaIkfx4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+oP9B2RRxB5YTbJpr1Yp+z8Ic1jJXEBNaBTdtpkpDNVWI9VVvU
	E7UC7H3H3oWGH9HCVPZbQcp/D9LjofwRkKLT+4V+U4q9NmEKN0dlRSwg
X-Gm-Gg: AYBFou0PBLXqvuHt36l1Gh1Xw+8nlBM/cJxt+eZRGTnYt6R63b3WS8ZxBRdWW5YFSD9
	pjTXQzR5gR1kBlu3/0actRJtIEurkMlGpeO7HE195l1DSJJWZnfKfpLqeMQfgDsgZfra053117X
	7yOKPa1IVxjbJJZw3Q4w6H7mHj4zlxRFNuU8xrM142DMBKnzQm6k9rRS12qKoboNTwFZSKY5Pi6
	NYM/cUk8Sj9UsYDqaS2yxV9kfS8oIZTNvEokntfn02AKFMLJ4IaSwU15jn2a+SaMTOe1vWhYABU
	WTwQiinaz9vFqBeljw2mdVD9V57CqKh1iu77Kw1cb+9rXkTEcOF/v3npTr2+/TWOAkAQWUiM91I
	9KNikpOtFaqPsn9yXeJMmpwS3rbbJMiqkFmODYpyvtemtHcx+ZGyEGedlxtpYcSq3cjYn0BJzGN
	g5qSKnWBHDR1dK+qu/Xk/mRKZaKrK7pBEMzU+/hpETqs/COXeCflvX2K4x4LJCG89cGlAelRgrd
	YBIU5Tb177oG6FQgHkesdjofUHigI7fmn+Jdc3dihSAJUjIPaGITfL0qn2R9Fg59TBP8/0iPwoQ
	bVlhaTLJ+rH4Ewzy+1gxm4rukR/8WHzFwEho3EyWlJAVU414StmOh2RDBlFarcYqXLYlOigEWYX
	VrdzS7uK9/ZsEKXNPg38USw52YqN3bO+8ud7NHFxvnnSJ9ibVB7s+KC32A327gCSa64ncej0=
X-Received: by 2002:a05:6102:3706:b0:7bb:c382:2ff4 with SMTP id ada2fe7eead31-7d0726ca2femr5422927137.20.1793761076663;
        Tue, 03 Nov 2026 18:57:56 -0800 (PST)
Date: Tue, 03 Nov 2026 21:57:54 -0500
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
Message-ID: <willemdebruijn.kernel.2b23680b4ca01@gmail.com>
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-12-54ad0ab57614@toxicpanda.com>
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
 <20261103-b4-skbuff-bug-on-followups-v3-12-54ad0ab57614@toxicpanda.com>
Subject: Re: [PATCH net-next v3 12/15] net: test the skb layouts skb_segment()
 refuses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1793761078-39AC0034-AF4480D7/0/0
X-purgate-type: clean
X-purgate-size: 1641
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Josef Bacik wrote:
> The GSO KUnit test only checks layouts skb_segment() can segment.  Add
> the ones it has to refuse with -EINVAL:
> 
>  - The non-uniform frag_list with SG on, which used to hit the
>    BUG_ON(i >= nfrags) the existing test steps around.
>  - A frag_list member that has its own frag_list.
>  - An skb whose len counts bytes it doesn't hold.  The data runs out on
>    a segment boundary, in the middle of a segment, after the last
>    frag_list member, and with GSO_BY_FRAGS.
> 
> They warn on CONFIG_DEBUG_NET kernels, so run them with the warning
> backtrace suppressed.  Also update the comment on the non-uniform case,
> which still says SG would hit that BUG_ON().
> 
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> -	/* TODO: this should also work with SG,
> -	 * rather than hit BUG_ON(i >= nfrags)
> +	/* TODO: this should also work with SG, rather than fail the
> +	 * i >= nfrags check in skb_segment()
>  	 */
>  	if (tcase->id == GSO_TEST_FRAG_LIST_NON_UNIFORM)
>  		features &= ~NETIF_F_SG;

The previous patch also addresses non-SG.

Do you want to run the new tests in both SG and non-SG mode?
>  
>  	SKB_GSO_CB(skb)->max_segs = tcase->max_segs;
> +
> +	if (tcase->err) {
> +		/* the suppression block doesn't run if it can't be set up */
> +		segs = NULL;
> +		kunit_warning_suppress(test) {
> +			segs = skb_segment(skb, features);
> +		}
> +		KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(segs), tcase->err);
> +		if (!IS_ERR_OR_NULL(segs))
> +			kfree_skb_list(segs);
> +		goto free_gso_skb;
> +	}
> +

