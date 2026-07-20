Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAC0C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:58:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366693.1616639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlpRE-0006tb-Sv; Mon, 20 Jul 2026 14:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366693.1616639; Mon, 20 Jul 2026 14:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlpRE-0006tU-Pb; Mon, 20 Jul 2026 14:57:48 +0000
Received: by outflank-mailman (input) for mailman id 1366693;
 Mon, 20 Jul 2026 14:57:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wlpRD-0006sG-7w
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:57:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlpRC-00719u-HS
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:57:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5e3766-bab6-0a2a0a5309dd-0a2a4503e61a-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:57:46 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5e376a-fae8-0a2a45030019-d155dd32c155-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:57:46 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47f752b3423so1048665f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 07:57:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f6fa848fcsm20675064f8f.0.2026.07.20.07.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 07:57:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1784559466; x=1785164266; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWaBeMNDr+Npz16fsL5v+nUe3108yEO7NWb8C6McDBw=;
        b=FzM7y2ezIjMsLDq3ejdT+zZrbSVsUCE54QJ8q9qg6fZpYTAV/Blb7CvfulyxJ+KBb4
         3Jsr9PSmuzpSDOANxPorEPecgY0BfODND9bUM+7I0FI4SLTclnxKTNWz0kjqHKl9x7Oz
         g8Dm3h3vx9E442UHS3Ya1GJ8moK8vQEh5c08hGH7JMWL/68kr1CVD+h5nZCdprxRXHTa
         UAvmFOTsVfhZZbLOkjMcff2CgWEEyWVAnzgg1hNDRWdp43iq559ahteNo0+ycWjSVGto
         P7bftwZ+gxYkU1B1W+OVLxQlDxmAAFlsvHF7fei1oYmQiXZWPdsL0FZiyT/MJ9QTu4JN
         JKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559466; x=1785164266;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWaBeMNDr+Npz16fsL5v+nUe3108yEO7NWb8C6McDBw=;
        b=KTPfXv7tgUNj8zzT/MWpUAHW5mfcFwKnftQdSQ3m//xmPdX/VLTCkvIIoAFjofYhWz
         f/wqT1pk21mtoFirEP8TKTsBwx1H6WiNC4ctCZEn8HDvDMmpfLfT7JKFQvO6GtZx/Wj1
         FzEVTW5w54EiTMD1+5tAZZgt3hy7wnXiJD9EELebx894IGWZ+iEWkfxpRWIS6JQ51dJi
         /yGYpBNUKpjIb9EIJwdS7Ymzxvgu1hoO+/ZlBJVC+fX4TfZORGhNGckcAGojPoumR6RE
         baYvfUe39zOBplDhrsI1yLhAqmZe3F/FrrvZA4NAUgbL+6uwgQl2yddbMEN/WuUbEQmB
         vYAA==
X-Forwarded-Encrypted: i=1; AHgh+RpKd6iwRq/bMdWqGf62mTTeQ7LU+wMu0fNYoiCKMJwse5O7AV6N/k1aO1G9+OV/xDgRlxSngsGHuEg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxErDoKNKpm2XKV6cBogvxBmYNaMyfjI2L+i06ad+/JhuQhySiO
	br1gEQApKbulXFogmXtrb/xXJW2MbygKv952AHX5Qy1wI8NyOGV8YfPjiuwYVYU/lQ==
X-Gm-Gg: AR+sD13bJzSoRFpuiJJoGkU02E6GA+6/m9DROLo0gB9NEK680fhXfpx3S9JQrz6mbwD
	2E+xPpTjyd8R7GtanZD5HMGw1BGCgjoB2Tsp+b0nUPdqYPFzzrbt0x1sb26A75mSbKGXI+tEmHU
	TvN3HJ39Kie2ZmlPgygiW4hn/pDdt6RrMf61TxT61dj5RIxhfBIMIfR5LWSlCkcobnz3hrW6X52
	JvSjepdNheacCsGB1JuP/EKU1GcaokdMR5aryU0FG6SylVq1bO9G4fxB/r7asW3z4UeV+BHhaYM
	5kEL6WWvjVtAXQv0TqiEXps/3CvuaHUkZKRxj6P+J/VvZGinlYbm40g5qQh1oZtOyyN6tuQJeOK
	Mra0En+GnraQVTa1gK/BL+J5KEYW4tnvKfLHFqclqcgXa3L+BlHlYkJrngz55aIwFSqQfi6k9Up
	J+2kOwPntoPJ8gcrr0UkrSk93qrcDEPkKhkHNVww8CGQWn4aiS8Ytmz+cczGaBVkVjcQ==
X-Received: by 2002:a5d:5f0a:0:b0:477:6874:542c with SMTP id ffacd0b85a97d-47f6230c34dmr18338510f8f.22.1784559465958;
        Mon, 20 Jul 2026 07:57:45 -0700 (PDT)
Message-ID: <0fefa50c-46aa-4ede-a8e2-8c2c619bc2ab@suse.com>
Date: Mon, 20 Jul 2026 16:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] xen/console: switch conring runtime allocation to
 xvmalloc
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-5-dmukhin@ford.com>
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
In-Reply-To: <20260713181619.672176-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1784559466-6F0C94E9-F65332C1/0/0
X-purgate-type: clean
X-purgate-size: 1743

On 13.07.2026 20:16, dmukhin@ford.com wrote:
> @@ -474,20 +475,26 @@ void __init console_init_ring(void)
>  {
>      char *ring;
>      XENCONS_RING_IDX done, size, n;
> -    unsigned int order, memflags;
>      unsigned long flags;
>  
>      if ( !opt_conring_size )
>          return;
> -

Please can we keep this blank line and ...

> -    order = get_order_from_bytes(max(opt_conring_size, conring_size));
> -    memflags = MEMF_bits(crashinfo_maxaddr_bits);
> -    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
> +    else if ( opt_conring_size > GB(2) )

... have this be just "if ()"? (I'd also suggest to make the "positive" case
the "if()" part and have the out-of-range one in the "else" body.)

>      {
> -        BUG_ON(order == 0);
> -        order--;
> +        printk(XENLOG_WARNING "Limiting user-configured console ring size to 2 GiB\n");

Nit: Too long line. Yes, format strings shouldn't be split, but XENLOG_* can
every well live on a separate line.

> +        opt_conring_size = GB(2);
>      }
> -    opt_conring_size = PAGE_SIZE << order;
> +    else
> +    {
> +        unsigned int order = get_order_from_bytes(max(opt_conring_size,
> +                                                      conring_size));
> +        opt_conring_size = PAGE_SIZE << order;

Nit: Blank line please between declaration(s) and statement(s).

> +    }
> +
> +    ring = xvmalloc_array(char, opt_conring_size);
> +    if ( !ring )
> +        panic("Unable to allocate console ring of %u KiB\n",
> +              opt_conring_size >> 10);

Why do you lose the prior behavior of halving the size until allocation
succeeds (or we can't even allocate a single page)?

Jan

