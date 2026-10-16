Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AD0CCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 08:52:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451393.1666455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdff-0002b8-9X; Fri, 16 Oct 2026 08:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451393.1666455; Fri, 16 Oct 2026 08:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdff-0002b0-6W; Fri, 16 Oct 2026 08:52:11 +0000
Received: by outflank-mailman (input) for mailman id 1451393;
 Fri, 16 Oct 2026 08:52:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHdfe-0002au-Hh
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 08:52:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHdfd-00AYAA-QH
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 10:52:09 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e5ae-8faa-0a2a0a5109dd-0a2a4502bfdc-30
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:52:09 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e5b9-6ca4-0a2a45020019-d1558035c930-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:52:09 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so49167985e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 01:52:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8a56233sm35334595e9.0.2026.10.16.01.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 01:52:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1792140729; x=1792745529; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=he930oV89eZdh/K36YmmBzdGZKz7JS6dlw7SdepoDME=;
        b=aRe/ts87hewfrk3YI7q06olR8VPOllZj7vAW2gzcf5eEOjwYGD/7v/9Lp4Y9ZEmBPo
         wj8yxg2iOWyWNYpWvWKPfzvsFiYzXqBfD7B47TyoqzhI9eLqsXLpmiIQdSWCsuE3ZWfX
         cDLS+IriWr5eARqGYPDdnYOEt9uLJG20II63e8hjWz1jE4U7XZWtshqdbdBWJSE39dHA
         1pgjlrQxifljDwxROEQJs4f8YNB0Cu761VRj+W/uW7JDuQhTZvVCuduhs5SQbGz+ynlD
         hdVwmr13Hkq4frQUs3XjQqFC4vqDpqhzh2K6zsq9DhtggZsC6YaD3EN8ECKSMVrxHbJE
         2uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140729; x=1792745529;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=he930oV89eZdh/K36YmmBzdGZKz7JS6dlw7SdepoDME=;
        b=1Rmg3fv9KAEuNgHnCendSwpZ9UEpyQB5Z6DqRa+JVxZvic1xsggQ/W/t7QCdPtbVfD
         H/zKM/PyUEWqydRReuWoL9o1oylySo65OfHoli6+o/F3Sr9GlAEXsIGCNWNW12Avqi8/
         osY18y4emLCNNMVCyVGh9e9zIeOb/4hTzqOalSBHFIEaxEbt4LcOxkSurZUlPB7/85re
         Q9/8cpVhOP8jFjfK2OT+D24wGfI2wHOcyj+9SqIBVia7ONNE0Tv21lR9KZB1Tm6QUJ4N
         g75S8sfA1AlbbONpyrnkJd1jE/+RMJktdWrtq9lE9GjcX4P3xGi4tzOIJ3cp9zH99oqb
         0czg==
X-Gm-Message-State: AFq9FYJaQd+YAU4AFN4Kr1OWActGQa0lP0Az8KiCh6gKLWP9Lp/sFYQz
	mW4/IHV86RN1gHJ/FygtUUuIFLHsZu3UXdBA56b3khJrLPmG73/P1tKs8BpgfUKCpRgofFLFJyM
	oW28+AQ==
X-Gm-Gg: AYBFou3rTz9k1ocXWP69yhbjGn36F6UMLfqzqeKmgW2QehQRMLgoiaKthZoEAlPqPsH
	Q/Iw+qbiOGrj0gFOkcjFLmAYVfr5kpCk3WpWbQUhAEt3YnIE5sXCXc3GNByv4lg3NL7ZfKyn2bl
	D4LO063g8x9Wixw/Mz2EOpoAZATMy11wv+mgEU9/uacPwO6xVhonZP07Hmn9VxiPLpYV8hR2u5R
	TFR37u4sOx6yOhS+JeMW82CW51FAG5uc2FS2rud+GdjmrD94ZV60nvVfP2hlUUMtpqkogHOJhDs
	qmDcyxZhQuzy0bSAi9JDrODyT0rGFtmfoLNFMiF/XJ5LK/8EyNTN8irPSQP91BUN9LPR3ajraK4
	ftRT7sZJ/XL94OmN4TdBFy35FWyoU5ObAiaOjVKvhhCEZx9YIdAha8Q8eCY2P48Rsmq24AfOxwn
	KVXKUy935FjBjFpv2LrCwXx3kIXXHbbqLskuv5OfgHwpu97XvWoYhuKqJaYE4AslBUXPCaq4p5h
	IulM8crFEPyj6TbsN+aJBZb03KUn5iAjW9jxE6t/rkotG83UERds6vJ3hLziQ==
X-Received: by 2002:a05:600c:1908:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a18e4dd018mr424209225e9.34.1792140729149;
        Fri, 16 Oct 2026 01:52:09 -0700 (PDT)
Message-ID: <508b601b-0b95-4edf-a433-8fef03420c9e@suse.com>
Date: Fri, 16 Oct 2026 10:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com> <atEADbxD4mL_bXy6@Mac.lan>
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
In-Reply-To: <atEADbxD4mL_bXy6@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1792140729-307C22AC-5DA2DC97/10/78276251493
X-purgate-type: spam
X-purgate-size: 2692

On 15.10.2026 18:32, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
>> Our present handling of initrd is problematic in particular when the
>> initrd is huge, and when at the same time "dom0_mem=" isn't in use to
>> significantly shrink Dom0's memory (from the default). In that case,
>> insufficient memory may exist for pvh_populate_p2m() to succeed (because
>> initrd memory can be freed only after copying).
>>
>> Make an attempt to map the blob (including headroom) into Dom0 instead,
> 
> I would use "dom0 p2m" instead of plain p2m, it's clearer IMO.

Can do, sure.

>> thus also saving the copying operation. With __start_xen() having arranged
>> for a larger than necessary blob, that mapping can typically be done with
>> superpage mappings.
>>
>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Is there a need to prune (scrub) the headroom space?
> 
> We already populate the p2m with memory allocated with MEMF_no_scrub,
> so there's no reason to scrub the headroom unless we also remove the
> MEMF_no_scrub for p2m population.

Oh, I hadn't noticed that. Away goes the remark.

>> Why does find_memory() go upwards, while find_kernel_memory() goes
>> downwards? And why do we use the lowest part of the region found by
>> find_memory() rather than the highest part?
> 
> find_memory() should probably start downwards from 4G.

I've added a todo item; maybe I can get this done in another patch in v2.

(Further remarks will be addressed separately.)

>> +    /*
>> +     * As we promise to place below 4G whatever fits there, make a first pass
>> +     * limiting permitted addresses.  If we can't fit it there, fall back to
>> +     * placing above 4G.
>> +     */
>> +    for ( paddr_t limit = GB(4); ; )
>> +    {
>> +        paddr_t start;
>> +
>> +        *blob_start = find_initrd_memory(d, elf, &try, align, limit);
>> +        if ( *blob_start != INVALID_PADDR )
>> +            break;
>> +
>> +        if ( align == PAGE_SIZE )
>> +        {
>> +            if ( !(limit + 1) )
>> +                return;
>> +
>> +            limit = -1;
>> +            align = 1UL << L3_PAGETABLE_SHIFT;
> 
> Aren't you possibly asking for an alignment better than what's
> required by the actual initrd memory?  Maybe it's using 2M pages yet
> you request 1G alignment here.

Yes and no: I may request too much here, but the very first condition in
find_initrd_memory() deals with that. When trying different variants of
coding this up, doing it this way seemed like the best way.

Jan

