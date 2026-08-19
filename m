Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A83C5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:15:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395549.1633876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwi0p-0008Vb-2i; Wed, 19 Aug 2026 15:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395549.1633876; Wed, 19 Aug 2026 15:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwi0o-0008VU-V8; Wed, 19 Aug 2026 15:15:30 +0000
Received: by outflank-mailman (input) for mailman id 1395549;
 Wed, 19 Aug 2026 15:15:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwi0n-0008VO-KW
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:15:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwi0m-00GzA2-QL
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:15:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85c87d-bab6-0a2a0a5309dd-0a2a4507bbe2-22
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:15:24 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85c88b-b4ea-0a2a45070019-d155802cbc73-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:15:24 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so11039295e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:15:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9aa3204sm48049415e9.0.2026.08.19.08.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:15:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1787152523; x=1787757323; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UT03oe7zJYEP+lA/DptUnOk0xOrLpZuOPliTdRhSV60=;
        b=YBU8ILUyfLgInYNw34hmQsK4W90IJLXK+KEy7qI4D7+e8mn5FCr3YOObGD97PQS5I5
         p1rFXZm+SIkrJvPtuwvSMlnFNA/Yz8IyqT/ruM4Sjvu5kOCIgW/x3aguan7ygQr0w7ic
         pLX4zNajWNLjatWxpuhZ3Q5GNeVmDkGo0/FgJFnLxOhSPDvGe0txwwBS7gLp/0ibhohr
         V35J8bJuBKtorqbtL6q7s3RmoA8oPShSlIg/or1QDxgJZHJZ8ytWaQmOjGEihaK3UtBB
         OHfYkKnuz+bkqqTFj2zvaeJGIQMWOqmuOEdSE2c+zxceu8tZxd4wqrp/M3IfPSf70DwC
         8thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152523; x=1787757323;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UT03oe7zJYEP+lA/DptUnOk0xOrLpZuOPliTdRhSV60=;
        b=jnZlPr2P88aNDofrqbfd9mA3NMy78kJ1Yi8j7sEG80wqifm7TGyJE7UEeY6CriOh3h
         G/sBq6edlp5fKo1Y9iNLEKGjjCUQOnS51tcZRkBegJPUTLmJ08i7HcchTxU7N2pb6j8P
         3Snq1YgXym+LR6FB4VBgIE3gysgP8Qoticzh1vk9tJ23ROwoNa75axglWoqZPXoBadbu
         jpuWhlCriL3zrAaNu0yvI8D+dUvtfu73OQgmMWLpCi2n3ZJvQ1mfJfVRdj/isOXL2s+q
         Mb03BRuvg6N4PR/LrBmjX7Gr1nCh9WnT5ZYLMuaZAvRKSVQki2waaOE0MkDL+tiQlLbM
         eQFw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7KY6TXwmHwyD414hSvgsIA/iiehnZMrEpFgBoYi7io2WNHYWgyZts0p9CRXS+Jnxj0RCohrARsc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGB1rvYTKqlgQ31yUgVSAnCSM3i8k2S1xMvLdt8rHB9QT5IC6y
	SaA1/Ny/M2u1T2LzIpduCaIi9lmk3y2vB/yQfx35owBh+z4aiLmInLtQlRZZP6VQlQ==
X-Gm-Gg: AR+sD12C2UJ0xK6nWEkmeZFBW5cQgyfex+IDuo7oyC1WDiC8dQPTvlkQckpOTYiqzNH
	qX4aFb5XnxnDJwZcyCei/vvUg0Mor6NosWBpm6FLMK6a/AJRiDGbjqgI5duyjh5oKw0m3sydPQ7
	Woifq/jrbDimCH6IbyfIQ9hXmf111ofdKRE7u3fK3kq4icRxlbwwy5kk432yxftSmZB6kT2dOJO
	z5Gy1+cktsrnpbZF46v/TKTU3P/Suo72R3yU/eqtOGM2qY+7WYPjO/aYcZXGKiXavDwI2nD7WwR
	ukgL/WZShDhvOA+NaZquB54W4Qv9qoyCFWLOUuYE5FUzJ3ploEdvOGNpNzA3m9MvWx+73uNz1SL
	lp0eD73HMjhTYMJMCIJEVdUod20Nib1sqWyXa+oRQdvbQbO8fkrvUx896n46dgZSaD03cDyU23m
	MPuY5NrlaVv3gOKO19rAFq3JQprGU6s+68lNpc6RvL7rCfrw9DBRnUxdZiPCxEMcHD9pmZNKpSR
	KYYPy2643H83HmwmC2BK24xVFmBdC18STk1USBWq77KixPTczhIkg==
X-Received: by 2002:a05:600c:3e0c:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-499aa1a3e87mr112516105e9.6.1787152523539;
        Wed, 19 Aug 2026 08:15:23 -0700 (PDT)
Message-ID: <f7d5cd81-ecf3-4075-9355-34c03cdbc644@suse.com>
Date: Wed, 19 Aug 2026 17:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 04/14] iommu: Move IOMMU domain related structures
 to (arch_)iommu_context
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1763569135.git.teddy.astie@vates.tech>
 <af6217ef3ce355cc873fd7aca128fb12feea3e55.1763569135.git.teddy.astie@vates.tech>
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
In-Reply-To: <af6217ef3ce355cc873fd7aca128fb12feea3e55.1763569135.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787152524-374D3AE4-E5E90F1C/0/0
X-purgate-type: clean
X-purgate-size: 3005

On 20.11.2025 12:09, Teddy Astie wrote:
> Preparatory work for IOMMU redesign.
> 
> Introduce a new structure (arch_)iommu_context that will hold all
> per-IOMMU context related informations for the IOMMU drivers.
> 
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>

It's hard to see what feedback you're expecting here. For an RFC, I'm not
going to point out all the style issues. One remark, perhaps:

> --- a/xen/arch/arm/include/asm/iommu.h
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -31,22 +31,21 @@ typedef uint64_t daddr_t;
>  #define dfn_to_daddr(dfn) __dfn_to_daddr(dfn_x(dfn))
>  #define daddr_to_dfn(daddr) _dfn(__daddr_to_dfn(daddr))
>  
> -struct arch_iommu
> -{
> -    spinlock_t mapping_lock; /* io page table lock */
> -    struct {
> -        struct page_list_head list;
> -        spinlock_t lock;
> -    } pgtables;
> +struct iommu_context;
>  
> +struct arch_iommu_context
> +{
> +    struct page_list_head pgtables;
>      struct list_head identity_maps;
>  
> +
> +    spinlock_t mapping_lock; /* io page table lock */
> +
>      union {
>          /* Intel VT-d */
>          struct {
>              uint64_t pgd_maddr; /* io page directory machine address */
> -            unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
> -            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
> +            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the context uses */
>          } vtd;
>          /* AMD IOMMU */
>          struct {
> @@ -56,6 +55,24 @@ struct arch_iommu
>      };
>  };
>  
> +struct arch_iommu
> +{
> +    /* Queue for freeing pages */
> +    struct page_list_head free_queue;
> +
> +    union {
> +        /* Intel VT-d */
> +        struct {
> +            unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
> +        } vtd;
> +        /* AMD IOMMU */
> +        struct {
> +            unsigned int paging_mode;
> +            struct guest_iommu *g_iommu;
> +        };
> +    };
> +};
> +
>  extern struct iommu_ops iommu_ops;
>  
>  # include <asm/alternative.h>
> @@ -109,10 +126,10 @@ static inline void iommu_disable_x2apic(void)
>          iommu_vcall(&iommu_ops, disable_x2apic);
>  }
>  
> -int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
> -                           paddr_t base, paddr_t end,
> +int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
> +                           p2m_access_t p2ma, paddr_t base, paddr_t end,
>                             unsigned int flag);
> -void iommu_identity_map_teardown(struct domain *d);
> +void iommu_identity_map_teardown(struct domain *d, struct iommu_context *ctx);

At the example of these: I think it shouldn't be necessary to pass both a
context and a domain into a function. The context likely should have a
back-pointer to the domain.

Jan

