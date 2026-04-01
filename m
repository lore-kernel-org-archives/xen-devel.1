Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB171076374
	for <xen-devel@archiver.kernel.org>; Wed,  1 Apr 2026 06:18:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1269692.1558607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7oth-0004hX-4P; Wed, 01 Apr 2026 06:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269692.1558607; Wed, 01 Apr 2026 06:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7oth-0004hQ-1T; Wed, 01 Apr 2026 06:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1269692;
 Wed, 01 Apr 2026 06:17:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7otf-0004eu-Es
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 06:17:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7otd-001WG4-VI
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:17:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb885-2eae-0a2a0a5409dd-0a2a45018cd6-20
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:17:45 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb889-6fc9-0a2a45010019-d155802edc77-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:17:45 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48557c8ad47so50601515e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 23:17:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e832585sm179541335e9.6.2026.03.31.23.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 23:17:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775024265; x=1775629065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=22jUjMqq4NiDpxwivTqWno8ikW93nvesVvp0rxysWvo=;
        b=FYbjrJCo+05jJL0QRW+YSJxXZcHlRX3wezYwS/XapOBb8c1QQoXhZf3bFeCVVovFBS
         UQdplN1ksm5my1CFWXxHA8felOyCq6oW7UoXDMEk+6nobPDYxHWtf02K5mb7S3gdNl9x
         kWG5kZLQ7MJMjxn5LYOLCF51ETXoskkedW0ctKQlpIRIp8JSOpdOw+Z4OgJLK6YET0jv
         AwCELeNhSbEoXxTbNbeBvDGBpQJBIELXhIX1SdN937QCR5WFW+WjAHgjVMLljjbCcRNv
         dbMlAxahJq0v9HjCEDEntyVDNfdAHgzVeqS1HGlUA0spVYa+fMz+AZbzJSZD8oeemwpC
         /tQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775024265; x=1775629065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22jUjMqq4NiDpxwivTqWno8ikW93nvesVvp0rxysWvo=;
        b=M1ASqXhb9puZlEdfjqbpd71cUNqsqY2WLVivKwAGwX4UPkHGPix9FWCF73miHMzx2F
         4lOgygcAzjn+sL7nIIDQklKG7MlWl7/KKgX4/lufLLqCxFXeX8jwyUlSt0wKs1YbNcPA
         SNadleL7VCFxMZkgyWqVUriGKcHUJR8ZzU5yDNJH4Z0pU68buCXwOotb1bzxJ7jNNDIP
         Bsurt98VMI6udO8YDbG1nRBT7+OPaTkLNe033yfWG7eT3V6yD0QVEI+EKGNYZEmNeEP4
         /qLzYuIlq6DhV9MROYDsETREP+FEmVVpr4GWSoiHyGO7j4i8jbTAW4TROpiSLqznQJg3
         S14A==
X-Forwarded-Encrypted: i=1; AJvYcCWPokRqqO7CQMVCK1jCmPd5z5WBG7JeFMRr3XlgS8Z2XkkXmmNpgtPU2cIXBOYKXLoSdaxxPR8KRlQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywHqV0WmaYQRy4vgHt+/e/2JIUHtpyE/KsvN0Z8K7gUXRnIRSE
	7a4+FgEbBkB1b0H2sIPDuY4Vnsnyi9AooC6ZxzkfK8VHzxKfOi51c+Tv0gfMQ7QYCw==
X-Gm-Gg: ATEYQzxXmbTbRnLQgI2x2FWe7CSguZQ5KXND49gCDpHQcp1PlItcAQPIVWlewZR2hTr
	ZyLL4zqKiD3cogiFbjzw+GHLJKT39LXHZgQyMe5HbLtJtKE/WjYC2Hg73f1cc7Y2FSC3FaAnilf
	BJpU5QXzdAIy5Y+v5WBg0PnSB8vuZ9edO9BA57PfPlhjs51aEN9fR3nHsGZXtIadvV4lcZVDOVx
	Cgp9z8dxctUoej+CucFZ7e+KcodZyHxCT9pCvC1NhWtLvMxa5vDUswtK7/zme1q1Azl2pX4UGlM
	NRHo8wqs3khY+vZgLVZkdDo6fnR/+/RA6eCt6gTwqHo4iea9lJBG/F1j2VuDo6OWphFF6XfjUuh
	4bSQWx1nUVoBy3anOaGIoAyfQBe/z8C32rGmRjMdeLAuw+sxx8LDOY4ekPAcgOuLoJP2odhhIP4
	iYQa6PCfqSOqRZhQ1j9Vvp6NuMt25yF5w82oaaH7RaUho4wd0pZO1htek8/haPE6wmK8Vdf2pOM
	2qPfRlzJY3oet8=
X-Received: by 2002:a05:600c:1d0f:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488835a59a3mr33204645e9.31.1775024265069;
        Tue, 31 Mar 2026 23:17:45 -0700 (PDT)
Message-ID: <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
Date: Wed, 1 Apr 2026 08:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
 <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
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
In-Reply-To: <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1775024265-B78FC185-50929E90/0/0
X-purgate-type: clean
X-purgate-size: 4067

On 31.03.2026 18:14, Oleksii Kurochko wrote:
> On 3/30/26 5:51 PM, Jan Beulich wrote:
>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>> The dom0less solution uses defined RAM banks as compile-time constants,
>>> so introduce macros to describe guest RAM banks.
>>>
>>> The reason for 2 banks is that there is typically always a use case for
>>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>>> there are other things under 4 GB it can conflict with (interrupt
>>> controller, PCI BARs, etc.).
>>
>> Fixed layouts like the one you suggest come with (potentially severe)
>> downsides. For example, what if more than 2Gb of MMIO space are needed
>> for non-64-bit BARs? 
> 
> It looks where usually RAM on RISC-V boards start, so I expect that 2gb 
> before RAM start is enough for MMIO space.

Likely in the common case. Board designers aren't constrained by this,
though (aiui). Whereas you set in stone a single, fixed layout.

Arm maintainers - since a similar fixed layout is used there iirc,
could you chime in here, please?

> Answering your question it will be an issue or it will also use some 
> space before banks, no?

I fear I don't understand what you're trying to tell me.

> Further, assuming that the space 4G...8G is what
>> you expect 64-bit BARs to be put into, what if there's a device with a
>> 4G BAR? It'll eat up that entire space, requiring everything else to
>> fit in the 2G you reserve below 4G.
> 
> I assume that such big devices could use high memory without any issue.

Well, I could go (almost) arbitrarily low with individual BAR size,
merely increasing the number of BARs accordingly. Assuming 2G BARs are
64-bit capable is likely fine. Maybe the same is true for 1G and 512M
ones as well. Yet a some size the assumption will break.

IMO RAM layout wants establishing dynamically based on the MMIO needs
of a guest.

>>> --- a/xen/include/public/arch-riscv.h
>>> +++ b/xen/include/public/arch-riscv.h
>>> @@ -50,6 +50,22 @@ typedef uint64_t xen_ulong_t;
>>>   
>>>   #if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>   
>>> +#define GUEST_RAM_BANKS   2
>>> +
>>> +/*
>>> + * The way to find the extended regions (to be exposed to the guest as unused
>>> + * address space) relies on the fact that the regions reserved for the RAM
>>> + * below are big enough to also accommodate such regions.
>>> + */
>>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>>
>> Connecting this with my comment on the earlier patch regarding kernel, initrd,
>> and DTB fitting in bank 0: How's that going to work with a huge kernel and/or
>> initrd (I expect DTBs can't grow very large)?
> 
> The short answer it won't, but does initrd usually so big?

Not usually, but nothing keeps it from being arbitrary size.

> DTB is limited to 2MB, IIRC. So it isn't expect to grow to much...
> 
> As I mentioned in the reply to earlier patch, I agree that we could 
> leave bank0 for kernel and all other put to bank1.

Kernels can also be arbitrarily large.

> Even more I can try to put kernel in ban1 as I don't see any place at 
> the moment where it will be a problem for RISC-V Linux kernel to be in 
> high memory.

Yes, the less restrictions from the beginning, the less worries later.

>>> +#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016 GB of RAM @ 8GB */
>>> +#define GUEST_RAM1_SIZE   xen_mk_ullong(0xFE00000000)
>>> +
>>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>>
>> Why's this needed in the public header?
> 
> xl toolstack could use them so I expected what toolstack will use to 
> live in this header.

But these last two #define-s are merely convenience definitions. They
even prescribe a certain data layout in order to be usable. I don't
think anything like this should be put in the public headers.

Jan

