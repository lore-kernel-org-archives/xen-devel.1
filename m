Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA77C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:48:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416191.1645360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xrM-0001sg-7I; Fri, 11 Sep 2026 09:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416191.1645360; Fri, 11 Sep 2026 09:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xrM-0001sX-4h; Fri, 11 Sep 2026 09:47:52 +0000
Received: by outflank-mailman (input) for mailman id 1416191;
 Fri, 11 Sep 2026 09:47:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4xrL-0001sN-K0
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:47:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xrL-005Fc0-02
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:47:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3ce46-bab6-0a2a0a5309dd-0a2a4506a55a-0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:47:50 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3ce46-195a-0a2a45060019-d155da30c5a5-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:47:50 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c259e5c22ffso139203266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 02:47:50 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29660219ecsm61286666b.16.2026.09.11.02.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 02:47:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789120070; x=1789724870; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MM4SOAWcCqCHxjusqPiPkwSXJUjWUPEQXgA0Xm21+lE=;
        b=DKIABiuTmAiE861kvmunqKXn0s9eME2zI2qBXrNmoZaCVZ8+LEiLrU67koiqgnpF8r
         WnOouM8rcRO0EASPr6+wsR+pUUAcjZHJ3Vft3auumyLBrCT1QSfjTW/jjfxAHZvGpbRf
         dfzEobnlku4aGoFA7urA+8xsZ0LIWdJoCGGe7ZLPoky049On6gP4vMi5su7qv5dqcK7S
         1W+kLUrIzFGOQTwjkpbSizbtvWrOtK3dQsPe0/IlQdHgySaWY6WzZeVfOz6XQLFkgpgj
         FUc3f9UiH2w/QmSe/aSwHyyFC7ncfe2Ni8fnGIfDAkZl+Umv3kmwJ2yEISE8SLw/XEHQ
         bF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120070; x=1789724870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MM4SOAWcCqCHxjusqPiPkwSXJUjWUPEQXgA0Xm21+lE=;
        b=L1jFznEqz1Zn+2X5F5OjJYYYyEbYV577rvlIt/lYkqXzrs4SxyiHUIcN1UAsG366qF
         DXKCuYwCJi4HImM38JoUCWVTFY5qYwWIJaAW3RMZot9Br0UEM1C+dkUl0V6fvZ2Ryus4
         LgsuqeRHpnGdjqehPscLXVyNV9tRJmeYRVNgEUV17K6Em+yWqlmEC4z/iOC1IK0B3Ytb
         uKQOYRbHE7G91p/iYtENP3Lly2FlycI8Lt2i54vzMDP+eCcsv5oevWCyhMRQip+9NBqw
         h69YFdMSKp1Lc2flwJ1nLo8zMqlUsBaiokQMNYYaeud3yc9849KUBT58mRyAfWRyb0QK
         RIfg==
X-Forwarded-Encrypted: i=1; AKwUvBzNnD9QsP3ivbjdcQpS1Ibt7e170SWyxZNO72/+Z7oUF2Yq+J3OAkiIx+62qKFmbULH4oFD5/g2QfQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++lIv8h9DJzPuob2ySouPYrcJu+xSnlGb95MtKOiO0j8wL9yGGjP
	tkA17uEJ/ea5gZRJY+Qj/HagOVFNAXLPXGapiyWO19rT3nXTycrDQVdz
X-Gm-Gg: AYBFou3/cSm1aHgskKssViNNGsMdW8uBHhShzr9LPlRr+bwOOfvgcMCSF66c9KI5aZq
	h/Mz1ZE0mhf3LI+3xNGK4Bx/lnuoOBgpMIQ5uN1GuKG62Xqw3v5djjsA9XZwAymgiAzibJ4EeJb
	fi/5iOcwaMpjVXaRA6XzUCZXwO5qS42uuYXvvm84NufAnkXXpxu868hF4dW6+wY+HsIwaNqeVm5
	WS9GyRhjYZQt6aQMyn4RMdZG61iCprNoVk7jgfJ+SQ5VzJqev8PFzd/NeTcoDnEU/Qn7frtxYtI
	WpVxAuinpQKhwHJv+JL623id3ElUTEsRzjyF1QEOzcNOb9Steww3KyaAp1z6HRnHMbQCD9SVWay
	oDyZgFjZvavsUxIiS25QBT1DMOHj4CL0/3JN73LwsMDr35dSxqDsx90AFuLfihmOqNLtl/6DRd0
	XCfGNIq/PJ3bVy4f+/rh7hXoxoRowCwIsp+XQglvjhSCBQqpynXUkBTHohBVrHiDTu9iWNYhuzq
	lFy6WwKUKXvL/i/O3FHg+ThJXFRT0vK
X-Received: by 2002:a17:907:6d1e:b0:c25:68c2:7b94 with SMTP id a640c23a62f3a-c29667f018cmr132118966b.8.1789120070304;
        Fri, 11 Sep 2026 02:47:50 -0700 (PDT)
Message-ID: <aaaa38a3-26ec-4558-8911-387aa88a3dcf@gmail.com>
Date: Fri, 11 Sep 2026 11:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/39] xen/riscv: build the target hart index via
 aplic_hart_field()
To: Jan Beulich <jbeulich@suse.com>
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
 <7731e7b5-d5cb-4ba2-a53c-06b5ca019ccf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7731e7b5-d5cb-4ba2-a53c-06b5ca019ccf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789120070-F4C0777B-D2B2DAB1/10/73395122804
X-purgate-type: spam
X-purgate-size: 4593



On 9/10/26 2:57 PM, Jan Beulich wrote:
> On 10.09.2026 14:44, Oleksii Kurochko wrote:
>>
>> On 9/10/26 1:23 PM, Jan Beulich wrote:
>>> On 10.09.2026 12:59, Oleksii Kurochko wrote:
>>>> On 9/9/26 4:52 PM, Jan Beulich wrote:
>>>>> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>>>>>> @@ -340,27 +338,11 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>>>>>>     
>>>>>>         ASSERT(spin_is_locked(&desc->lock));
>>>>>>     
>>>>>> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>>>>>> -    hhxw = imsic->group_index_bits;
>>>>>> -    lhxw = imsic->hart_index_bits;
>>>>>> -    /*
>>>>>> -     * Although this variable is used only once in the calculation of
>>>>>> -     * group_index, and it might seem that hhxs could be defined as:
>>>>>> -     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
>>>>>> -     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
>>>>>> -     * when calculating the group index.
>>>>>> -     * It was done intentionally this way to follow the formula from
>>>>>> -     * the AIA specification for calculating the MSI address.
>>>>>> -     */
>>>>>> -    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>>>>>> -    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>>>>>> -
>>>>>> -    /* Update hart and EEID in the target register */
>>>>>> -    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
>>>>>> -                  (BIT(hhxw, UL) - 1);
>>>>>> -    value = desc->irq;
>>>>> Hmm, only after sending the ack I noticed that there's no masking here, ...
>>>>>
>>>>>> -    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
>>>>>> -    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
>>>>>> +    cpu = aplic_get_cpu_from_mask(mask);
>>>>>> +
>>>>>> +    /* Update hart index and EIID in the target register */
>>>>>> +    value = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
>>>>>> +            (desc->irq & APLIC_TARGET_EIID);
>>>>> ... but there is masking here. Chopping off bits doesn't look as if it can
>>>>> lead to anything good. What's the deal here?
>>>> The mask is a no-op: desc->irq < NR_IRQS (1024) always fits the 11-bit
>>>> EIID field, so I'll drop it and add a BUILD_BUG_ON() instead.
>>>>
>>>> Would it be better to:
>>>>
>>>> +    /* desc->irq < NR_IRQS, so it always fits the EIID field */
>>>> +    BUILD_BUG_ON(NR_IRQS - 1 > APLIC_TARGET_EIID);
>>> If the question is whether to prefer BUILD_BUG_ON() over BUG_ON(), then:
>>> Yes please. However, APLIC_TARGET_EIID is a mask (despite its name not
>>> indicating that), which only happens to start at bit 0. This kind of
>>> assumption would better be avoided.
>> Then BUILD_BUG_on should be updated to:
>>
>>    /* desc->irq < NR_IRQS, so it always fits the EIID field */
>>       BUILD_BUG_ON(NR_IRQS - 1 > MASK_EXTR(~0U, APLIC_TARGET_EIID));
>>
>>
>>> This raises another question though: No matter how big a RISC-V system
>>> is, it can only ever have 1k IRQs? How does that work with a single
>>> MSI-X device having up to 2k MSIs?
>> Device MSIs never pass through the APLIC. They are written straight into
>> an IMSIC interrupt file. The ID space belongs to each file, so each hart
>> has up to 2047 IDs (IMSIC_MAX_ID).
>>
>> 1k it is limitation for wired interrupts (which could be delivered in
>> MSI mode where APLIC + IMSIC is needed) which are going through APLIC.
> But desc->irq and NR_IRQS have to represent both. Which then puts the
> BUILD_BUG_ON() above under question.

Agreed. Right now desc->irq, the APLIC source number and the IMSIC EIID
are all the same number: aplic_set_irq_affinity() writes desc->irq into
EIID, and aplic_handle_interrupt() hands the IMSIC identity from stopei
straight to do_IRQ(). That only works because there's no MSI support on
RISC-V yet, so NR_IRQS covers wired interrupts only.

Once device MSIs are supported, that identity mapping can't stay anyway.
IMSIC IDs are per interrupt file and shared between wired and MSI
interrupts, so we'll need to allocate EIIDs and map desc->irq to
(hart, EIID). target[] will then get the allocated EIID rather than
desc->irq, and NR_IRQS will grow beyond 1024.

So for this patch I'll tie the check to the APLIC source range instead 
of NR_IRQS:

BUILD_BUG_ON(ARRAY_SIZE(aplic.regs->target) >
              MASK_EXTR(~0U, APLIC_TARGET_EIID));
ASSERT(desc->irq && desc->irq <= aplic_info.num_irqs);

The ASSERT also covers the target[desc->irq - 1] indexing.

~ Oleksii


