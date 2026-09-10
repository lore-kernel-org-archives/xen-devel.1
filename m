Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8BDC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 11:23:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414467.1644269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4csV-0001j9-1q; Thu, 10 Sep 2026 11:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414467.1644269; Thu, 10 Sep 2026 11:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4csU-0001j2-U4; Thu, 10 Sep 2026 11:23:38 +0000
Received: by outflank-mailman (input) for mailman id 1414467;
 Thu, 10 Sep 2026 11:23:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4csT-0001WZ-Q5
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:23:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4csT-00AgT7-71
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 13:23:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa29325-bab6-0a2a0a5309dd-0a2a450bc3f8-48
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:23:37 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa29338-b7e8-0a2a450b0019-d155802ec939-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:23:37 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso68894135e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 04:23:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20db6e76sm139757835e9.3.2026.09.10.04.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 04:23:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1789039416; x=1789644216; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24+juqDvlaemBTdDhWERMpb87Bbadn66B3z4bW688S8=;
        b=GQDDIvddstpcwbDQY+zzbuWmpFiLC8ySqIV+A56bTXMS/o/SnxB4/YXqF0lhNbBTLO
         d5BXsdgh5Bt2p24gI8AdE9jmhouBs4Mrj8FNipIJsbTWXnF16Hd7LdbuXZH8fbM5HueN
         2UgIPBop3z2kyepPACzvSZthuPIV+Jd5iO0BRKIh2JC7FyZtP5jbOfJ7P+UhmB6a9THk
         Hu5wNUbt+X69xVsmz4UWEl3KASYy+4N8ChKOSbdXPgbLJ5FJmfAKB6pBdJqVr+buGE1T
         m+SYtRKOJgqshUv4j82zi1osKxb5HHAV/w/f7s+jqDYzXlLYFBCIp1Qr3mfTXUYYKNPq
         M3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039416; x=1789644216;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24+juqDvlaemBTdDhWERMpb87Bbadn66B3z4bW688S8=;
        b=PspC+zJqRkHzV1Qsh2rXe1y32/e7U30U2c9qRMCMj+2fZR8+AyNZgXrCYzxWhzvN18
         M84C4XLOWlaDQNvwTHpkrGUJ4cCo7OxJxZdugtOAAM9Eiugvwc76Frb1Wl8pnR49/V7b
         VJzG3rra0az4kVU5tYwCN0CPsnBNyz3D6QXiGMhaVHXgcVsS8s7o4KGGiQsyFwYZhLek
         f0u8f+7QVWBfMnH0dhaw2Pj9i3tLxmqzejE1GASShQnLUBzfcQRzfBFIGzNgzBv0Dbfd
         eocJwigI2kwURxWUrNOIb78KHavcwJtUBzaa66MlondlbkBO5igpqZvzymV6wAMG58Un
         pT3w==
X-Forwarded-Encrypted: i=1; AKwUvBwkLbX0E5aR5ngj9Q1QvsZ+e8TrD9KabvOR7niZUN3ZdeIYB9Vx/ZPFTEBSrn0E5MTov5nwCqpmQvw=@lists.xenproject.org
X-Gm-Message-State: AFuF++mDO5/lpe5MG2hTx7LQHRfXEH5YdUm/UAvc06TIhoCXCCJLaBhx
	3tlqOEdzHEIGiu0h4zaFDdWMW4ZPwM9z1PPc1HmMxlcDB6n4divuDEBpnfJGYwlGwA==
X-Gm-Gg: AYBFou0f8b9YIh/Mi5mqMyaLz4mr/40MqzqZFuYLgM2JsA9S5G47Lq7XVczrg24O5FW
	rM043ZKZ43E1D+GqT+S24I277kihN+D21sswDZSQKPoLuq+Jv7aqzAQz7D9GHwwV1EB2SEyn47D
	WyalM+uLarvSoEhaynm+0u45MMC/1pbCO0fqZi9tv9PZ52wRzVFRyi7WM5XgbdXlo/s4gPLDw1g
	H8bPNpxFxxz76USHoS6WoFLvrTKaV4OMVfWxuyuYBwm3Bx64yttWoaCZQo2d4cSz4Lovq9StMd+
	2zWpN/pgmJ0FmZkIzW2SFwRxhsqXr0mz01uL2DQtkT2Kajh/jMS/uPDxX5GvHoAGjESTGVIMKzP
	hrlI4yqDw2RA2/QWmwBrB2NeIYx8tq9/wsZCvxF1YaTjvMsq+PLq+kG9Ee3dCBvsAbK4I0mkbVR
	+2Gi55xNH1gNcjlxRwZCvRM56YMV8qYXJGETmBp5O9zMUUdSNdSVspjEfzI5undOwOdBgiLjqTE
	ddFqFPFiGd0Fkc0Ihn0rQHViojQjJ1OexaQEL5IWKlhzh5xhnvi6uPIKFV4W98=
X-Received: by 2002:a05:600c:4e8f:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49cfa20cd1fmr371007435e9.19.1789039416561;
        Thu, 10 Sep 2026 04:23:36 -0700 (PDT)
Message-ID: <8a133a0d-09ff-4908-b0b1-7396045b5e67@suse.com>
Date: Thu, 10 Sep 2026 13:23:34 +0200
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
In-Reply-To: <487a7efa-e83d-4ae2-8f39-33483161a64d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789039417-AB6D29EA-5BB76DA8/0/0
X-purgate-type: clean
X-purgate-size: 2671

On 10.09.2026 12:59, Oleksii Kurochko wrote:
> On 9/9/26 4:52 PM, Jan Beulich wrote:
>> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>>> @@ -340,27 +338,11 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>>>   
>>>       ASSERT(spin_is_locked(&desc->lock));
>>>   
>>> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>>> -    hhxw = imsic->group_index_bits;
>>> -    lhxw = imsic->hart_index_bits;
>>> -    /*
>>> -     * Although this variable is used only once in the calculation of
>>> -     * group_index, and it might seem that hhxs could be defined as:
>>> -     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
>>> -     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
>>> -     * when calculating the group index.
>>> -     * It was done intentionally this way to follow the formula from
>>> -     * the AIA specification for calculating the MSI address.
>>> -     */
>>> -    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>>> -    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>>> -
>>> -    /* Update hart and EEID in the target register */
>>> -    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
>>> -                  (BIT(hhxw, UL) - 1);
>>> -    value = desc->irq;
>>
>> Hmm, only after sending the ack I noticed that there's no masking here, ...
>>
>>> -    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
>>> -    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
>>> +    cpu = aplic_get_cpu_from_mask(mask);
>>> +
>>> +    /* Update hart index and EIID in the target register */
>>> +    value = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
>>> +            (desc->irq & APLIC_TARGET_EIID);
>>
>> ... but there is masking here. Chopping off bits doesn't look as if it can
>> lead to anything good. What's the deal here?
> 
> The mask is a no-op: desc->irq < NR_IRQS (1024) always fits the 11-bit 
> EIID field, so I'll drop it and add a BUILD_BUG_ON() instead.
> 
> Would it be better to:
> 
> +    /* desc->irq < NR_IRQS, so it always fits the EIID field */
> +    BUILD_BUG_ON(NR_IRQS - 1 > APLIC_TARGET_EIID);

If the question is whether to prefer BUILD_BUG_ON() over BUG_ON(), then:
Yes please. However, APLIC_TARGET_EIID is a mask (despite its name not
indicating that), which only happens to start at bit 0. This kind of
assumption would better be avoided.

This raises another question though: No matter how big a RISC-V system
is, it can only ever have 1k IRQs? How does that work with a single
MSI-X device having up to 2k MSIs?

Jan

Jan

