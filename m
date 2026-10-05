Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E9ECA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 09:53:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440677.1658093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfNS-0008E5-Ds; Mon, 05 Oct 2026 09:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440677.1658093; Mon, 05 Oct 2026 09:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfNS-0008Dy-At; Mon, 05 Oct 2026 09:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1440677;
 Mon, 05 Oct 2026 09:52:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDfNR-0008Ds-QF
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 09:52:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfNQ-00CqqS-8G
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:52:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac37369-8faa-0a2a0a5109dd-0a2a4505c14e-46
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:52:56 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac37377-4cb1-0a2a45050019-d1558031ddf0-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:52:56 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a1728d8dfcso6324225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 02:52:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62270751sm2495205f8f.13.2026.10.05.02.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 02:52:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1791193975; x=1791798775; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLSxE39zfGWs2/80XvybgFNsxV7lAuWIpT6PZOwBWwQ=;
        b=Q/cn+izEE/IH5TjBNVy60gN69vSouHnYViRjcZ7NlOC0p3+oZAa8j7R1vuKeyC14LM
         t5HEuUYyKGEN5q7u7U/n8SIcO+TqoYzKMFyGVkpR74oiNoTfVcWKdsrNiJDd1C2NWbzr
         RNYLtbK72K9tv4RXjFJAhPyaaFLyld19gOfUz9OWWl6m9Ez1Br1XtypnuCrtbBqVCijq
         YIOOr1UWFTGVbOBgr3zmBB7Mw5CA54L3oE1QFUktV2CnpQgT9EtKKZC4hJSUy/R5f+mj
         QHBzvRPCRgMDNonFXaAaoeJojG0ZjWQbrZZEsXO0ouK9xRE9x1YIwI+uNdsZdmSvBmW+
         dmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193975; x=1791798775;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLSxE39zfGWs2/80XvybgFNsxV7lAuWIpT6PZOwBWwQ=;
        b=ldEG1UC8ghtHwQh3LjrLJXkrqDa/cZiz0DWO81nHaxhcBZnItWc7YHfrcttFwGtKSw
         nzYTGi1kEwo85yHfd7wARi5kTMDBWNvAiVAjgZ7MFLPVjVIJDtCSRpvB0RVbbg8JZiNF
         R8RmJ7W5UMlj3NOR8J3ZbXGY1Vv754kXePRwrMjYYX/S9CJ0N3HM2gpi5hpbDyM5JPZ/
         sSTcnNLV2ylOm8BtmMQXWFVtEhpT7FwWHjygxO7BWOejakiwHsn9nCI6JX6HKsj5AC9D
         q68px7QG8yZct6fycMCJYTgXfsyjj68T/yVuhqA3v9AV6/ggP5BZLNeSYVTZY6k4AWaI
         VyMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT8PDfrQ52DPQ669/UcLiMsLI/h+pDC8XqEkbqRE3pqygVZNY4k+tg1wFXevji3bXFby/1cgZTxI8=@lists.xenproject.org
X-Gm-Message-State: AFuF++meIFnXXJ4oiohn7f/+aInn0ym+34uNWV8F5Ilhb4DqgxUFGMx+
	ujHL4+oaBCC4r6Efh/PfPKHWO/Ft/NghcNYZiMboU6CKNlO51lIefKQhUio5jVaqeg==
X-Gm-Gg: AYBFou2CHIBcOx6Ji6UhbBoNEu7NAf62UCybQdYmgYpS1YcIuaZ/q+efxtkm42fPNwS
	37n+CqRitEg5wP1qH+0zuC0PtcyESLYHco9J+NSJy4KqYwX+63+uhihugE/JD2YzZKedFw9kCnc
	uydlFdrJFpqHGDX8N2xsBmqrGCNHVCJ7a/iBblLLM7lv7F7yNKw57j71MXu10edB/PE+0+klldP
	aXK7xTFZka9TwJGDVw8cKx9Q0bJtJq1PIdzN2wXymfoeITPAreLKc1rAflYZeChlf5uP2mptrdk
	AkqgoIQCK50pbIhVe9Xbh2IRyWEXRHII/TP/y/BjjFvcw4sHaemlaj2V/szKecJzztf539/P9AG
	OREIbpxbXAQU+PtoHYFTUIdXfC8PNwwf4bunsIK7oZ43nTNk1JP+pk9bVpe+/LxmsL7jG9IBFry
	+c42ghLCk4v3Ggzj6vAU8DahqYU82lCzFzcElM108wL83GT8dlddJCGaZVXXfkIx3yGA4FH7bfS
	sd3l8LavmyBH6pi3GNNrai8pud/rLMhIr3ugWwY2iTaZqRrExSUK1Z1hF/pWA==
X-Received: by 2002:a05:600c:c091:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a1680dd2c0mr75955775e9.10.1791193975538;
        Mon, 05 Oct 2026 02:52:55 -0700 (PDT)
Message-ID: <95274f9b-985e-4f3e-801c-971558e5d8f1@suse.com>
Date: Mon, 5 Oct 2026 11:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pdx: fix merging of a range contained in the previous
 one
To: Weiqi Wang <coolhaoyt@gmail.com>
Cc: roger@xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
 sstabellini@kernel.org, lucas.cordeiro@manchester.ac.uk,
 Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>,
 xen-devel@lists.xenproject.org
References: <20261004190357.29254-1-coolhaoyt@gmail.com>
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
In-Reply-To: <20261004190357.29254-1-coolhaoyt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791193976-251182A1-A693845F/10/78276251493
X-purgate-type: spam
X-purgate-size: 1207

On 04.10.2026 21:03, Weiqi Wang wrote:
> From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
> 
> When sorting and merging overlapping ranges in
> pfn_pdx_compression_setup(),

As we have two distinct instances of this function, at least one of title
or description want to clarify that it's the offset-compression one.

> --- a/tools/tests/pdx/test-pdx.c
> +++ b/tools/tests/pdx/test-pdx.c
> @@ -87,6 +87,18 @@ int main(int argc, char **argv)
>              },
>              .compress = true,
>          },
> +        /* Range contained in a previous one. */
> +        {
> +            .ranges = {
> +                { .start =                                                 0,
> +                  .end   =                            (1UL << MAX_ORDER) * 1 },
> +                { .start = (1UL << (MAX_ORDER * 2)) |                      0,
> +                  .end   = (1UL << (MAX_ORDER * 2)) | (1UL << MAX_ORDER) * 4 },
> +                { .start = (1UL << (MAX_ORDER * 2)) | (1UL << MAX_ORDER) * 1,
> +                  .end   = (1UL << (MAX_ORDER * 2)) | (1UL << MAX_ORDER) * 2 },

Nit: The multiplications also want parenthesizing against the binary ORs.

Jan

