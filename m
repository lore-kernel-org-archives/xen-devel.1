Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB8CCA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:59:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437321.1656177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBupr-0002Fw-87; Wed, 30 Sep 2026 13:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437321.1656177; Wed, 30 Sep 2026 13:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBupr-0002Fp-34; Wed, 30 Sep 2026 13:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1437321;
 Wed, 30 Sep 2026 13:59:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBupq-0002Fj-EG
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:59:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBupp-006gEo-QU
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:59:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd1590-2eae-0a2a0a5409dd-0a2a4504980a-42
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:59:01 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd15a5-b57f-0a2a45040019-4a7de18cde87-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:59:01 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ff9621c5dso31320015e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 06:59:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01e673d4asm1490755e9.11.2026.09.30.06.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 06:59:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1790776741; x=1791381541; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AVoby2Pk5ebO+BZZaGXziPTKUz6FI6vnFKWzX/1MG8=;
        b=CBRMA3UUY+2x2VyrN5Hp8zu80eDA1gqyCpPjNdSjFVHrd9Soc+JD6ig2oImZfPCvfV
         wMmt0j2CCEh+N1qXSLmtyw6IU2YI7MQf2bVgFfQ+g4JjSf9faCOmrhuxucj/nfeOcApO
         s1d41OMS8y0Na0DA7py9IAHC3tQJLVZmorAHkSxFW9myKtNaeX5DwEV6ta1MLV4yaZgw
         EaVi+7Qdjo1RTslf7hD3XgfecI6zkFX1yblRjkcs38hwz6K0mgTZ9sWm54QJwI6GOMcM
         Cgba3GqRJmrx+ct4F95L6uS0M+KVZycyUweboC9MzWDVNkmlHwq/2nx2++l1IwxPAZIV
         5YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776741; x=1791381541;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AVoby2Pk5ebO+BZZaGXziPTKUz6FI6vnFKWzX/1MG8=;
        b=jqqOqDOobDVmwBozyXMcZu/VfoqwgdYAyUYplLrjb++t0CoW3VEodl4N1xssDzqcTC
         1RWXgCh5Cwgbx2Y8mGM56cXEyulXhndILEWa/wZV4q96z6qjrUYWBlFvM3eZFLYUaIK7
         8ES0cbZ/wGVsQQKNPHCimB2WS2o+Ls3UHwDLjOfnxZ6kw+LUjrbu9MEITT3tbvzMp1Mq
         OtNXmJkc5cp1vbDUc8aFE8PtZj9LFgczd2jBThABrZpVFy0bkaa67XGXVbaxVFiltT/K
         knroBw1g7CyIrf9MgBAbFxriD/l3M3+T2+i9L5rrWme0v2Nb0YqL0VzHwAUIOLo+WNjN
         kpXw==
X-Forwarded-Encrypted: i=1; AKwUvBxXsIGYU4Fk0tqNT35epNi+tg72f3mOvguZFmI7fLdrBAPZbFgCVrqwlpT8h4uAOJjPXJiTLnI5pZs=@lists.xenproject.org
X-Gm-Message-State: AFuF++n6YhFO31sEXtNhw7uWvV/Uil3YKS8Nvh4EfLdR3NpBHDDqE+kY
	pbIrm6g9/s8ZYTxppsIS2CseBAmYWgKdUr30/4x2MHPzC+LqwbQux51BFPZC9AFVBg==
X-Gm-Gg: AYBFou2E2kkF0/3c+HVQA4spzPGo+f3YMBK0GzNxPyKIW9ZY6o4T8OWeqhDnXnmYPgV
	omT6pL2vS3hHHyM/MPT1N7m28k1lQiopCneOCHMgdK+S2IRktl4cMRF+geIh9vVwFE3Bc9dVkf/
	8bLdcFa4tBfHLfgysffxIqGSpMYARlab0yPFnSj9540GHNYrCFSVJHK1fhKbm4HBmKdCwrDv2ii
	lWP80m/7vAUG0Wzz2DbcIsb4cqAOnN8IJNzXVRfLqOrH0cZRu6OXOlN6BDkibKStys7//TdCX1j
	WLC7iarChymRqCOwiKBk9JYxb4HkLDA/IGTPFTZXcxjPmmELmhlHLGVU/TQ2FUF7cyRi+m22E1c
	5y2IMw/dVc5MG0lZNAHklObkGrRdMbGseZeEF4JgsHExWaSd/bNUBa14QMQ75/ldvCe10cxVhsP
	I4v9CfaSOVZaYPcYSXow5PDmlXHc3JtDnSqxP4+YS5tlJtLNnKwpfdAi4kLJMfalQtD2l0vqNPM
	d/dFkLcD6P+OpHBxhJwhE21lskOzzzAo5a6zHpY+TLpPBcVh33mrClPvhywOQ==
X-Received: by 2002:a05:600c:348f:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a01adb2ae3mr28428165e9.1.1790776741148;
        Wed, 30 Sep 2026 06:59:01 -0700 (PDT)
Message-ID: <2e6f8a8e-7b02-41b4-812a-fa71c48ac48c@suse.com>
Date: Wed, 30 Sep 2026 15:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/riscv: fix A/D bit handling in G-stage
 mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504@vates.tech>
 <c2d30da2-6844-4df2-9029-238f5ce25838@suse.com>
 <3419a5a5-fcb9-4222-9045-1acdd9609021@gmail.com>
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
In-Reply-To: <3419a5a5-fcb9-4222-9045-1acdd9609021@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790776741-C18D1B50-943A890F/10/78276251493
X-purgate-type: spam
X-purgate-size: 4416

On 30.09.2026 15:53, Oleksii Kurochko wrote:
> On 9/30/26 2:20 PM, Jan Beulich wrote:
>> On 29.09.2026 18:32, Baptiste Le Duc wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -586,42 +586,24 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
>>>   
>>>   static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
>>>   {
>>> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
>>> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
>>> +
>>>       e->pte &= ~PTE_ACCESS_MASK;
>>>   
>>>       e->pte |= PTE_USER;
>>>   
>>>       /*
>>> -     * Two schemes to manage the A and D bits are defined:
>>> -     *   • The Svade extension: when a virtual page is accessed and the A bit
>>> -     *     is clear, or is written and the D bit is clear, a page-fault
>>> -     *     exception is raised.
>>> -     *   • When the Svade extension is not implemented, the following scheme
>>> -     *     applies.
>>> -     *     When a virtual page is accessed and the A bit is clear, the PTE is
>>> -     *     updated to set the A bit. When the virtual page is written and the
>>> -     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
>>> -     *     address translation is in use and is not Bare, the G-stage virtual
>>> -     *     pages may be accessed or written by implicit accesses to VS-level
>>> -     *     memory management data structures, such as page tables.
>>> -     * Thereby to avoid a page-fault in case of Svade is available, it is
>>> -     * necessary to set A and D bits.
>>> -     *
>>> -     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
>>> -     *       delegates page faults to a lower privilege mode and so OpenSBI
>>> -     *       isn't expect to handle page-faults occured in lower modes.
>>> -     *       By setting the A/D bits here, page faults that would otherwise
>>> -     *       be generated due to unset A/D bits will not occur in Xen.
>>> -     *
>>> -     *       Currently, Xen on RISC-V does not make use of the information
>>> -     *       that could be obtained from handling such page faults, which
>>> -     *       could otherwise be useful for several use cases such as demand
>>> -     *       paging, cache-flushing optimizations, memory access tracking,etc.
>>> +     * A RISC-V implementation can choose to either:
>>> +     * 1) Update 'A' and 'D' PTE bits in hardware.
>>> +     * 2) Generate page fault when 'A' and/or 'D' PTE bits are not set so that
>>> +     *    software can update these bits.
>>>        *
>>> -     *       To support the more general case and the optimizations mentioned
>>> -     *       above, it would be better to stop setting the A/D bits here and
>>> -     *       instead handle page faults that occur due to unset A/D bits.
>>> +     * Xen supports both options mentioned above: unless the platform guarantees
>>> +     * (1), i.e. only Svadu is present, set 'A' and 'D' so that (2) never
>>> +     * faults.
>>>        */
>>> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>> +    if ( !svadu || svade )
>>>           e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>
>> I may have asked this already when the original conditional was introduced:
>> What use is it to leave A and D clear, when we don't otherwise consume the
>> bits? This way hardware has to issue more (atomic) writes, i.e. performance
>> suffers for no gain.
> 
> It will be done only once, won't it? After that, if the A/D bits aren't 
> cleared, there shouldn't be any performance impact, so it will basically 
> behave the same as setting the A/D bits in software.
> 
> The idea was that, if Svadu is available, it should be the hardware's 
> job to set the A/D bits. That way, when the A/D bits eventually start 
> being used for some purpose in Xen, we won't miss an unconditional write 
> of the A/D bits when Svadu is available.
> 
> If you think it's enough to just have the A/D bits set unconditionally, 
> I'm okay with that, and we can go that way.

I think starting simple (i.e. unconditional) here is the way to go. Making
the setting of one or both flags conditional can be left to whenever that
would become a necessity. Note that on x86 we haven't seen a need in all
the time (for Xen's own page tables that is).

Jan

