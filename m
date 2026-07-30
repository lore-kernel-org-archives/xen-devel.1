Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C1C54FD2
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 08:43:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377319.1623429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpMMm-0006M9-D1; Thu, 30 Jul 2026 08:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377319.1623429; Thu, 30 Jul 2026 08:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpMMm-0006M2-A0; Thu, 30 Jul 2026 08:43:48 +0000
Received: by outflank-mailman (input) for mailman id 1377319;
 Thu, 30 Jul 2026 08:43:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpMMk-0006Lu-LP
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 08:43:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpMMk-002SDZ-1x
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 10:43:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b0eb4-bab6-0a2a0a5309dd-0a2a450284b2-42
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 10:43:45 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b0ec1-6ca4-0a2a45020019-d1558035ad1a-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 10:43:45 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso12366745e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 01:43:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d6d0f8sm114474435e9.2.2026.07.30.01.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 01:43:45 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785401025; x=1786005825; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2aUYlvSnFQyHqLqh6TDTs9lMuK0bX5eXRwDs/M2T8c=;
        b=S7uF8HYVd2SoG5rTs+ehBBVVSvRc2WP04sbeRBeSpyxMXjfYSI5DL7qa8nQ42oinKO
         /88Ur66D/8wAZUk1GIX9gnLDDG1SXRlQ/ahru7bOeYBm5hRl0sSj9ah1RAXTpsgO/ZfL
         eDLT6RcG7O1Iv3CbKX8/l4x+EsQARp7503cCnnXM/JuCGSCqbM2H5cbRSnIg/N7h1ERG
         ZPbeLtPY2ZUJCiYib35daqoagNqSMkHC68tXLMw8BNE6rIV8M15U5G3TuJFUW0TDcnXZ
         gVl6PN9SUrXWBFkrKlEykREyKqrBNkd+3Jmj1ocxGE+U2zx3ijoYJoiMSt+wFZaaSkRY
         lMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401025; x=1786005825;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2aUYlvSnFQyHqLqh6TDTs9lMuK0bX5eXRwDs/M2T8c=;
        b=NiKqkOpP9GMtIAwEa2tDdYYoRqvLgIAedGTrmcoQWby/Id611j3QMSN46C9sNGlZx3
         +Lnz80qvea0IS6xnX8ccSU9vCUtuCQF1syAzkh6LhKjjKPTh8tW6yOqoiz3MulzZju/a
         mc0d11HR01820XHbhzaTOg0f7X9vwRVp8Wc8NupSlENOxwR8PZk9UB5mYCeH2MqSm8Pz
         dbzWSSBLmeGbzOjrpkfod0UhsQdtPlYWkAD3PW3kpLmhr9ueqLysYDlOPopaslmf/68S
         +9JVotGihL9kzzavlwEqiWXorb+hARylqxzd6yDDI2f5sRdipwh4LXtLbkadLLhDUmQM
         jFcw==
X-Forwarded-Encrypted: i=1; AHgh+Rqjk09FM8Dm09mTcJ8Kux8LBgQRRsHT4X4iTSRkd3IyjZXyy3qGjUgHQUYKL1vnUy6adt3/0uGwxys=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0yo5KWO8Nk7EjwOY8gd7/WBEQdME+Mm4JD/r3bgLjjgJzJvEh
	9U8ctFIgwe7sb3sycAgIIeZI02oVdLzVUGlLweaZ3KD613NwQYJwcKkbSDCH0YabVg==
X-Gm-Gg: AR+sD12Kh5rn8yBCLOBe0dlyI01k6FTxrBKiOcH0T6PlmZbyzQ1Ws0Rkd+7s3x1lHhK
	Bn7FHTRQcFH4Aikh1IVNVrZvGrT9l1iKfS0r50qHHa+a1q2Y0hZs4z18AGqVtvON/5OxfwPFGTq
	atf23hyDitS/MqDMh8UoGm5MI86ASHMmuQYtOSMeXtVl2JQPBivtcRRHiM5JsERDzHSt91O4ul1
	HsQtK2RYntnjd8+H9ky/0oGfjfCyUkKmrgSQDE77PFVh/2EkggJqGM2aSR/sGDK+JoI2qITegrx
	yLtY4sgCwhR4G8Oc+f3GIHGSyrJfkb9TpJatASB/UmB61C63eUAqoaX+sApOH6tdeq7mTG6BXQw
	prRYGQ4UScu/P2oXY11nyTgUGYIX8FUsNRK+eQCYkJZCrSCZNWwZPQUWjyM8ld7ezjFZprsiFy3
	UidRFJQJs2WgIAN29XRsRwHPCXcFvwHRRzM6WxmBPAcxeBJ9IFw9Xs9BUtotkwGnZ2RBGThkX3s
	GfhsKzkcI76pNdbEFSe5wrQycapFa5FbSq8w3qg9dlrBEc6P/yOLA==
X-Received: by 2002:a05:600c:b95:b0:495:3b8a:bf11 with SMTP id 5b1f17b1804b1-49800ebb830mr23188915e9.26.1785401025320;
        Thu, 30 Jul 2026 01:43:45 -0700 (PDT)
Message-ID: <66fc571d-4e6e-4d2e-973c-2de4789df432@suse.com>
Date: Thu, 30 Jul 2026 10:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/blkback: Prevent missed completion when draining I/O
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, konrad.wilk@oracle.com,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, roger@xenproject.org,
 xen-devel@lists.xenproject.org
References: <20260730084000.3305702-1-hanguidong02@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260730084000.3305702-1-hanguidong02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785401025-30DC12AC-199C709E/0/0
X-purgate-type: clean
X-purgate-size: 805

On 30.07.2026 10:40, Gui-Dong Han wrote:
> --- a/drivers/block/xen-blkback/blkback.c
> +++ b/drivers/block/xen-blkback/blkback.c
> @@ -1021,6 +1021,13 @@ static void xen_blk_drain_io(struct xen_blkif_ring *ring)
>  	struct xen_blkif *blkif = ring->blkif;
>  
>  	atomic_set(&blkif->drain, 1);
> +	/*
> +	 * Publish drain before checking inflight. Otherwise,
> +	 * xen_blkbk_unmap_and_respond_callback() can decrement inflight with
> +	 * atomic_dec_and_test() and still see drain == 0 after this path saw
> +	 * inflight > 0, missing the completion.
> +	 */
> +	smp_mb();
>  	do {
>  		if (atomic_read(&ring->inflight) == 0)
>  			break;

Yet then don't we also need a barrier in xen_blkbk_unmap_and_respond_callback()'s
check? Barriers almost always come in pairs, after all.

Jan

