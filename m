Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3EBC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 12:57:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414644.1644396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4eLb-0001nF-Ms; Thu, 10 Sep 2026 12:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414644.1644396; Thu, 10 Sep 2026 12:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4eLb-0001n8-Jb; Thu, 10 Sep 2026 12:57:47 +0000
Received: by outflank-mailman (input) for mailman id 1414644;
 Thu, 10 Sep 2026 12:57:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4eLa-0001n2-Lk
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 12:57:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4eLa-002i4Q-2O
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 14:57:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2a939-8faa-0a2a0a5109dd-0a2a4506d836-38
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 14:57:46 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2a949-195a-0a2a45060019-d155dd31e8b6-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 14:57:46 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-486e70f2457so158273f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 05:57:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485aa2c9acasm15171542f8f.36.2026.09.10.05.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 05:57:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1789045065; x=1789649865; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnB6m+As0X/AvYGSKFo+NvntiLQqCpYe6s61xqPX97M=;
        b=THXnBbtF5TfqBNag2jsW/8uCxBb33ylDuhKJm4p2tyjGnfLUkhEhKw2niG/SMO3CPa
         MqGP5tjDRuHdNHWEM9h3VA1KMcfKwKBgGgwsDNDJPiYo0bLTCiyizSm+m+o/RwvRGyxr
         bNUvK6JPa7zFGzdlnoX//1AXrQGqAIclBkB256enkm/jEnGrUcXMRE/EjD+5VWjnqmXC
         xHhdp5RAVB6p1GFS1NPGEVa72VxMQoflmPpFtoymQ2WEUiUoazESM75Snt+HhkgGhgqt
         TQ+/jPtC11TsR5qO7vh8Y5+6/acLbhNm+AY1dcnQT6htv09GILOK49iJ6Amk6JL42YTo
         JiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045065; x=1789649865;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnB6m+As0X/AvYGSKFo+NvntiLQqCpYe6s61xqPX97M=;
        b=oEXeVOW5V6sc2KJ+yH+1lEDeC4cTke6P2KzyL14dB2KDDh9J1bscYoVnngK3IK3qzl
         lDpOZlT6oAQfqWocj09DE8yuaStln10sndIHGYoVSl15TX1SnaEIFrysQ55cgnqEJyom
         EfDPPvhmdrW2JOxmYC6irVrMZZmI97FKuqpDlie1CcDfTnmxbgmtyPPoJeeA3xHMFysH
         pOqKbErtZvFHf+RuQSKYTqF6+cFshMsGdK8LvZY9FKh8w8REwM5pw41e62d9eSZs7zyR
         HdcNUDaJFUe67cR25GKjznWlo6Kf0ZVmnMVaUPX5LcST0SFM7N1LLP3Q7O7UVPy6COjG
         g8ZQ==
X-Forwarded-Encrypted: i=1; AKwUvByvNuENVkVCsDGZkTJxMdOHHJ1QKLlDeNVvLNQ5PKVqrSStERORMDTY4vEujqVjGdTdtFv+GbR3f8U=@lists.xenproject.org
X-Gm-Message-State: AFuF++kBgRhusk4I4u7VpqISd9D6wYg51cQwW0k3meiOXyqtBeWR8zSh
	+wXDk0RFk5q1UWJ0zds42+J18aKzha+UBJHmGFdFUkR3LFsQjIIQnCzT5QJLODDFkgtRfNeNUg6
	rYY257g==
X-Gm-Gg: AYBFou198VKQKkStpRe137sc2Gewyuu9SKjBp2YFIionydicnmgka8CiW6uN21Z9ZIH
	ThxSBtRXIzVFHRHPOU3tSeRzo5t0CDmsAcXUMVREShJ9gKAqJ7oEMRPp3OhFo4dvp7dXVn8dqA/
	m5ldhfgWsFVAaeeVhP9edpL27xmXJwq5I05cFpeK5qTdRIuImrME1o6xMPPP1kEAZ+WkF/hF2Jy
	GAHBPYGMNOU+VbsbYWWiVvgV5TtWra7bRlsJjDs5kSNcQVc5PIJvWSnU9q15H2s0PqCQrjJlwC7
	hMRtF3I5RyNRKgC8lfzw03fVcSwHGCDy0iHTy14BoeIH7hxOyyZjcTQGagl/69LQ1R86yTbGX7w
	pV5LAa5cHMD9LL71rMulSecQN02lv+Lb3zI6h/zrcgiNMJuL6ea8ag3IxYYFG8XVY98HNzrIG+l
	4qPHWqnm9YU3mDRsA00N7K1/iG+I1afoX5EG72EfWBvCw26etXdN+0oxFFS7oLHKmpQsEkzc9Pm
	P/4j882m68e1P7AoGE2z9ASGMo60huKNPIfhtPmz2cnZKpMaK7ndRDUXr1XGkw=
X-Received: by 2002:a05:6000:2311:b0:485:8bc6:3caa with SMTP id ffacd0b85a97d-4858bc63de5mr36335441f8f.16.1789045065484;
        Thu, 10 Sep 2026 05:57:45 -0700 (PDT)
Message-ID: <7731e7b5-d5cb-4ba2-a53c-06b5ca019ccf@suse.com>
Date: Thu, 10 Sep 2026 14:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/39] xen/riscv: build the target hart index via
 aplic_hart_field()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <3c7418d64a730ec5e4b2cfd0ecfbbbc6fe0bf7d8.1787838835.git.oleksii.kurochko@gmail.com>
 <a7935767-97f3-46b6-a737-b11fa6dcfd33@suse.com>
 <487a7efa-e83d-4ae2-8f39-33483161a64d@gmail.com>
 <9f2245d8-faef-4608-a179-b8e942fdfc1d@suse.com>
 <744f17cb-de7b-499a-83cb-9f0a122a4605@gmail.com>
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
In-Reply-To: <744f17cb-de7b-499a-83cb-9f0a122a4605@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789045066-1FACA77B-36F7352B/0/0
X-purgate-type: clean
X-purgate-size: 3533

On 10.09.2026 14:44, Oleksii Kurochko wrote:
> 
> 
> On 9/10/26 1:23 PM, Jan Beulich wrote:
>> On 10.09.2026 12:59, Oleksii Kurochko wrote:
>>> On 9/9/26 4:52 PM, Jan Beulich wrote:
>>>> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>>>>> @@ -340,27 +338,11 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>>>>>    
>>>>>        ASSERT(spin_is_locked(&desc->lock));
>>>>>    
>>>>> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>>>>> -    hhxw = imsic->group_index_bits;
>>>>> -    lhxw = imsic->hart_index_bits;
>>>>> -    /*
>>>>> -     * Although this variable is used only once in the calculation of
>>>>> -     * group_index, and it might seem that hhxs could be defined as:
>>>>> -     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
>>>>> -     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
>>>>> -     * when calculating the group index.
>>>>> -     * It was done intentionally this way to follow the formula from
>>>>> -     * the AIA specification for calculating the MSI address.
>>>>> -     */
>>>>> -    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>>>>> -    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>>>>> -
>>>>> -    /* Update hart and EEID in the target register */
>>>>> -    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
>>>>> -                  (BIT(hhxw, UL) - 1);
>>>>> -    value = desc->irq;
>>>>
>>>> Hmm, only after sending the ack I noticed that there's no masking here, ...
>>>>
>>>>> -    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
>>>>> -    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
>>>>> +    cpu = aplic_get_cpu_from_mask(mask);
>>>>> +
>>>>> +    /* Update hart index and EIID in the target register */
>>>>> +    value = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
>>>>> +            (desc->irq & APLIC_TARGET_EIID);
>>>>
>>>> ... but there is masking here. Chopping off bits doesn't look as if it can
>>>> lead to anything good. What's the deal here?
>>>
>>> The mask is a no-op: desc->irq < NR_IRQS (1024) always fits the 11-bit
>>> EIID field, so I'll drop it and add a BUILD_BUG_ON() instead.
>>>
>>> Would it be better to:
>>>
>>> +    /* desc->irq < NR_IRQS, so it always fits the EIID field */
>>> +    BUILD_BUG_ON(NR_IRQS - 1 > APLIC_TARGET_EIID);
>>
>> If the question is whether to prefer BUILD_BUG_ON() over BUG_ON(), then:
>> Yes please. However, APLIC_TARGET_EIID is a mask (despite its name not
>> indicating that), which only happens to start at bit 0. This kind of
>> assumption would better be avoided.
> 
> Then BUILD_BUG_on should be updated to:
> 
>   /* desc->irq < NR_IRQS, so it always fits the EIID field */
>      BUILD_BUG_ON(NR_IRQS - 1 > MASK_EXTR(~0U, APLIC_TARGET_EIID));
> 
> 
>>
>> This raises another question though: No matter how big a RISC-V system
>> is, it can only ever have 1k IRQs? How does that work with a single
>> MSI-X device having up to 2k MSIs?
> 
> Device MSIs never pass through the APLIC. They are written straight into 
> an IMSIC interrupt file. The ID space belongs to each file, so each hart 
> has up to 2047 IDs (IMSIC_MAX_ID).
> 
> 1k it is limitation for wired interrupts (which could be delivered in 
> MSI mode where APLIC + IMSIC is needed) which are going through APLIC.

But desc->irq and NR_IRQS have to represent both. Which then puts the
BUILD_BUG_ON() above under question.

Jan

