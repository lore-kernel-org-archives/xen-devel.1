Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F323EC5AD5A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 08:04:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388836.1629812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3wt-0004cP-Ch; Wed, 12 Aug 2026 08:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388836.1629812; Wed, 12 Aug 2026 08:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3wt-0004cI-9X; Wed, 12 Aug 2026 08:04:31 +0000
Received: by outflank-mailman (input) for mailman id 1388836;
 Wed, 12 Aug 2026 08:04:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu3ws-0004cA-6n
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:04:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu3wr-006Dex-J5
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 10:04:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c290a-8faa-0a2a0a5109dd-0a2a450884b0-6
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:04:29 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c290d-f659-0a2a45080019-d1558031d0d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:04:29 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so5820405e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:04:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997c98d264sm30733075e9.9.2026.08.12.01.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 01:04:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1786521869; x=1787126669; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPtJR6IQBglLJG1DyZZy4itPX0zMDvXgO3Z2Zp4xWcQ=;
        b=GKQ3FB/5bE5o+mPgIrfjT+BMBkUAYbN+7xiOAlFdQiXcWuLR/FOxv9Ep8RL5STAAFt
         U2G8yIuWz+u2FlqyKqH+xrdM9zWP35v/5YRKdfgDhGXGjcoPu5HDFBIeUnV/TMBsK/qW
         Fiv+fi8lE6tNDMYOwNNoPv+k8TSrYnXjb145qscMX8Vtg2NVi86i/XzT3kNbg+eTEmiE
         7hWHeLm/+UOwMaWPelUFLbZGPdxd+Ij9e7z9Gl8PZF7mpdCx9SZVF+H2gE1lNWQr9dKT
         H7rQjw73GgsAv1kveWQwMuZSpBC9iE+IEZfOo8Cu/0Hs7rR4BK1xYbxiTXmx1E/JXVmp
         uxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786521869; x=1787126669;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPtJR6IQBglLJG1DyZZy4itPX0zMDvXgO3Z2Zp4xWcQ=;
        b=Ij0kyztTtMS1YLsmtZ3jlaicJIgveCkf8IqgLWjdnLgZbGexsACpanx+FgEy0ylESC
         NN+h7jufmQBXtzWDSN9QEfeAngsP+QpSuNJPKNxOfEsj3eqFKUBnEClPHoq4IUhWMYXl
         a5kQ5tXMNmBqPjshostKJWM8Rgl/0ZYOy7HeZySjtiqxGTQhw6LGvLt9ajKr6gA/ZR8p
         2Z5zp3kSJjFSriZY491muEveDMItXynrEiyCtzBQi7JgXPMmPdaznCEJoW78k278OsRn
         FT5gnZDTJZEvvsDMy68SyLZCf5PzvxBo9j42iZF7yVqcAocy1GC7ImOdCXVRq2ntrHsG
         B0+Q==
X-Gm-Message-State: AOJu0YzYn3RGK303NCuLDn/QKhga4XOO+SJ8ctydBcuFZf2pRYYw6Kqn
	ccKDm+748rWw7PXcloyn191Bwu2FuNopZ47isCdmluiYfj7kUFXfm9LWDYXG5F65vhSqt9tJ0DF
	WmQsUHw==
X-Gm-Gg: AR+sD13yZ6VVgHBLs/hAAkVOZQsJBmTVHqhgXn8SuTJ1+q0GTRg4NfJRXzdDUvp0o/s
	tQpsjarPUsvTRgXO8lCEp4hA5KZewTfLcOaRsAvLa1D/+srfftApkGQP2ahZp25D9aw3Op43h0Y
	ey5R92HBWdpyafWO0woPTuje2GSUcbfgMnT+hdUg5F+BdJL8R6UBoFltp6TnXzdJlKGC5z33m+p
	bz2jJOBf0P2PjcwBuO4tLeZZW3QaaYlksCcAWRsMctA2XglBvyXAY89yGZZtobRwOIZeIj4EiO6
	WHzqZyaQimb68Fr3SaBxHra7ieed7qjt9zLmdE/hJov63flJfTMAiCqw4+j9zuGQPnhQrv5BiYs
	c4Zm35QON37f4mphMnUWmo4cP0u6mp5vzPSmPfs8X7fE3ui5mmzxItBw0VJiEq3lDRv1gBpIuW8
	Ta3CrcxWiL0gdipPNrIsyn6iohNTHbPko9QxRu3nl3x3BC1cQEXdrl73bvy64pj7ycAE7QTJRR7
	BKzQI/6+diSmciEOh5CkV8guy7SDRieZsWDp2bWi3aiyPw6qrCLWgWH0A==
X-Received: by 2002:a05:600c:c042:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-4997c138c3emr23902985e9.10.1786521868894;
        Wed, 12 Aug 2026 01:04:28 -0700 (PDT)
Message-ID: <f80bf49e-4ddf-47f5-a7c4-d4d552c811cb@suse.com>
Date: Wed, 12 Aug 2026 10:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] xen/console: switch conring runtime allocation to
 xvmalloc
To: Stefano Stabellini <sstabellini@kernel.org>, dmukhin@ford.com,
 andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org, anthony.perard@vates.tech,
 julien@xen.org, michal.orzel@amd.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20260728065049.1318143-1-dmukhin@ford.com>
 <20260728065049.1318143-4-dmukhin@ford.com>
 <59a85064-35d9-c3f5-c056-6c05677fc27a@kernel.org>
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
In-Reply-To: <59a85064-35d9-c3f5-c056-6c05677fc27a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1786521869-D674387B-FF82CFE1/0/0
X-purgate-type: clean
X-purgate-size: 2486

On 10.08.2026 22:19, Stefano Stabellini wrote:
> On Mon, 27 Jul 2026, dmukhin@ford.com wrote:
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -33,6 +33,7 @@
>>  #include <asm/setup.h>
>>  #include <xen/sections.h>
>>  #include <xen/consoled.h>
>> +#include <xen/xvmalloc.h>
>>  
>>  #ifdef CONFIG_X86
>>  #include <asm/guest.h>
>> @@ -464,20 +465,30 @@ void __init console_init_ring(void)
>>  {
>>      char *ring;
>>      unsigned int done, size, n;
>> -    unsigned int order, memflags;
>>      unsigned long flags;
>>  
>>      if ( !opt_conring_size )
>>          return;
>>  
>> -    order = get_order_from_bytes(max(opt_conring_size, conring_size));
>> -    memflags = MEMF_bits(crashinfo_maxaddr_bits);
> 
> The original code had MEMF_bits(crashinfo_maxaddr_bits).
> crashinfo_maxaddr_bits is 64-bit by default but can be changed via
> command line options. Now, the memflags is going away and there is no
> way to bring it back because xvmalloc_array doesn't take memflags as a
> parameter.
> 
> Andrew, Jan, is that OK?

I don't think it is. While the description of 3355c1a2a60c ("KEXEC: Allocate
crash structures in low memory") only mentions 32-bit, the same split can
occur on 64-bit. The one thing I'm not sure about is why / when dumping
would be limited to parts of memory only (both for the original 32-bit case
and for today's 64-bit only situation) - Andrew?

>> -    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
>> +    if ( opt_conring_size < GB(2) )
>>      {
>> -        BUG_ON(order == 0);
>> -        order--;
>> +        unsigned int order = get_order_from_bytes(max(opt_conring_size,
>> +                                                      conring_size));
>> +
>> +        opt_conring_size = PAGE_SIZE << order;
>> +    }
>> +    else
>> +    {
>> +        printk(XENLOG_WARNING
>> +               "Limiting user-configured console ring size to 2 GiB\n");
>> +        opt_conring_size = GB(2);
>> +    }
>> +
>> +    while ( (ring = xvmalloc_array(char, opt_conring_size)) == NULL )
> 
> It looks like that if opt_conring_size is zero, then xvmalloc_array
> would return ZERO_BLOCK_PTR which is != NULL. We need to have a
> different check here for that condition

But opt_conring_size can't be 0 when making it here, can it? (See the
check early in the function, even visible in context above, plus the
use of max() in the hunk here.)

Jan

