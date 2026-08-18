Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B17FC5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 14:16:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394225.1633054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKbu-0006f7-CR; Tue, 18 Aug 2026 14:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394225.1633054; Tue, 18 Aug 2026 14:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKbu-0006f0-9e; Tue, 18 Aug 2026 14:16:14 +0000
Received: by outflank-mailman (input) for mailman id 1394225;
 Tue, 18 Aug 2026 14:16:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwKbt-0006eu-He
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:16:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwKbs-00Da6f-7B
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 16:16:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84691a-bab6-0a2a0a5309dd-0a2a4503d1c0-30
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:16:08 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a846928-fae8-0a2a45030019-d1558034e43a-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:16:08 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso37714655e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 07:16:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a31572sm12796383f8f.5.2026.08.18.07.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 07:16:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1787062568; x=1787667368; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBF9nUt5CrcYIqX2i8K8X50NNea0WojETI06s9K0YQ0=;
        b=F5jE1fhM8wrGi6i+uwg+1lx3lW3iXQNTll4GwByNG7eZvUEAnKgVwp8MyrLhc7QzvI
         QxfiLAzgt+C1suQacz9HfDDAaRx0mpr2aHz2lhcffgzJJdEKHM0BgKwVWgrO5XWkvzGF
         MIZ79qFQyCcEVHiB0zo5mUWrUEPnLWSf55B0SHMaIIZynVVgLJyD38Hi+Nb1Eb0Divg3
         ByeZr6cMAuTJZAWRROfh0rnAvCVppFdF32ii/bm9OOR+4U+V+KbF1DuT4VvfQcQoppOH
         zuThglmxabdXYHlQhKaZUSI5n/IL1ZQ1dZ9pruL4F6I9MBFkjYt/FNU6TWVRD5mvc0Uh
         hsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787062568; x=1787667368;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBF9nUt5CrcYIqX2i8K8X50NNea0WojETI06s9K0YQ0=;
        b=DNSio/DUy+D1yz130M7FGcpi733bPoIdzUzINNiaVAal4EHtscALB3bzu4EhzIAY0G
         6K0u0UJtcPZwHP+I+W9JLNRRSJyKYwOYCvDnRBX+94Ye0LfXebF5icHP3SXuF3Df5DkG
         MyHDZM05sEZwQzBd8TUgnovl4qQN6fMxyfV7zZNiLwj+blLZ7UVvaPs4PHLbXVuXSg3O
         uoFn4bmcRiQ7piPI093ItX08h3cooPDUvF4awn2vAVA47gOASUUVWpb/7hZgiimyTrv5
         iHkN0RWQJI/sicUN2TH+2hrRwOR8eX2GvZ6Zu8CtAR8mHGIi1bki7+EvBENUUa6nlzwC
         /Nzw==
X-Forwarded-Encrypted: i=1; AHgh+Rq30f6TVdlA152RMR57rc0gfWPgzIAA34TlKlkTQ5xXV4Xy7/Xktufe/5qc4R+cHdGOJM+tHK6wPq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsC1A1lsaD2AGrb0knp9JbNxiRA6P4JPL0ICIUHHK5WxczXjiB
	DHCYm0oxgXNtO56qmVrcLtTeMpqYGOFZgYN+VkrvASTsejLpcf6fc6tLTqVB30Mr0A==
X-Gm-Gg: AR+sD10T30CZRYolZywhXr4YFBrMSfRvuwEhiknDUVk3Dm1v3qGtkeqzXnfLGpWzTDQ
	GYJL9vhAIGoc3fG1coQjYu8cUWfPr0q+/tmAqVFOeskx8A7F5P9uC3wj7G1wQw0wRo3lPhx2WQY
	SuYhwoVPJn+6tTsCT0KJK8KghIOq2XUUaxlAHsumAXzJ3ghDWpFeXyuelRgZRT/BxW6a/Nemcqm
	8n1XJWc4csYtmx+h69zjRoVxtTgQOD/3DPtO7RtlrWPaRmQm6SRHNpuWjCUB2KelzS08ekDPYYD
	kzb1lSagvSpwN5Un4uWe2arkxg6appEBLzkTgIu1XyT/aLSNaUvQVuLz0wYTNx/pIqQKjtumfOd
	uJyeKW6MP02qafgaGhaixjhDId6kLQRvNDJ1bE2g2zOjMtFN0J8/hKfG/jLTQ8YHWog3xK6t4LL
	tYZbV0wRX0ygFwaxonip7rNBxyiXVFWkq3h6TblWaOfB9fuvhnLQFeqscJ2Vk3Y4YjQkLlfHWIm
	fG7znh7lF+fIYogsqWUP5RGGNsCtCvUXpud1UZge72LgFhGy45K
X-Received: by 2002:a05:600c:8509:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-499879337acmr611677535e9.5.1787062567283;
        Tue, 18 Aug 2026 07:16:07 -0700 (PDT)
Message-ID: <35b8afb4-dec6-4110-892f-c2202c9066b8@suse.com>
Date: Tue, 18 Aug 2026 16:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/17] xen/riscv: add unprivileged guest memory read
 helper
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <79cfa875e9dfc14bbcad948c20f4008b03d11f72.1784560663.git.oleksii.kurochko@gmail.com>
 <71a226b9-dc03-4a69-beb2-5c4c03b8d09b@suse.com>
 <3c0d33bd-ebab-48df-9ddf-a508e5bed5fe@gmail.com>
 <2ca3f802-bf93-4714-8a9b-e33ab0c89300@suse.com>
 <d94bd15a-bf99-4df5-9dac-1fe0fcb77cfc@gmail.com>
 <5ee55d9c-d0f8-41cc-8d4e-3ba6c08d7506@suse.com>
 <6959b0e1-3059-4d3b-baa1-28dc0d761f9e@gmail.com>
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
In-Reply-To: <6959b0e1-3059-4d3b-baa1-28dc0d761f9e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787062568-6D4D74E9-EB8E14E3/0/0
X-purgate-type: clean
X-purgate-size: 5223

On 18.08.2026 15:38, Oleksii Kurochko wrote:
> 
> 
> On 8/18/26 12:43 PM, Jan Beulich wrote:
>> On 18.08.2026 12:27, Oleksii Kurochko wrote:
>>> On 8/18/26 10:17 AM, Jan Beulich wrote:
>>>> On 17.08.2026 17:36, Oleksii Kurochko wrote:
>>>>> On 8/12/26 5:30 PM, Jan Beulich wrote:
>>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>>> +    if ( read_insn )
>>>>>>> +    {
>>>>>>> +        asm volatile ( "\n"
>>>>>>> +            "1:\n"
>>>>>>> +            "   hlvx.hu %[val], (%[addr])\n"
>>>>>>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
>>>>>>> +            "   andi %[tmp], %[val], 3\n"
>>>>>>> +            "   addi %[tmp], %[tmp], -3\n"
>>>>>>> +            "   bne %[tmp], zero, 3f\n"
>>>>>>> +            "   addi %[addr], %[addr], 2\n"
>>>>>>> +            "\n"
>>>>>>> +            "2:\n"
>>>>>>> +            "   hlvx.hu %[tmp], (%[addr])\n"
>>>>>>> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
>>>>>>> +            "   sll %[tmp], %[tmp], 16\n"
>>>>>>> +            "   add %[val], %[val], %[tmp]\n"
>>>>>>> +            "3:\n"
>>>>>>> +        : [val] "=&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr)
>>>>>>> +        : [ti] "r" (trap) : "memory" );
>>>>>>
>>>>>> You want to tell the compiler that *trap is written. Instead I don't see
>>>>>> why a memory clobber would be needed: You access a different address space,
>>>>>> i.e. nothing the compiler can make any assumptions about.
>>>>>
>>>>> memory clobber tells the compiler that the assembly code performs memory
>>>>> reads or writes to items other than those listed in the input and output
>>>>> operands and so I don't tell here that *trap will be changed.
>>>>>
>>>>> Why this understanding is wrong?
>>>>
>>>> You can (ab)use "memory" for that purpose, but why would you when you can
>>>> properly express the operand? All that achieves is the compiler possibly
>>>> having to emit less efficient code.
>>>
>>> Then I will use the option mentioned ...
>>>
>>>>
>>>>> Alternative, I think, could be:
>>>>>            : [val] "+r" (val), "+m" (*trap)
>>>>>            : [addr] "r" (guest_addr), [ti] "r" (trap) );
>>>>> And then memory clobber could be dropped.
>>>
>>> ... here.
>>>
>>> Probably I have to return '[addr] "r" (guest_addr)' to output and use
>>> +&r constraint.
>>>
>>>>>> You also need to take precautions for not returning an uninitialized "val".
>>>>>> I think the variable wants initializing (perhaps to ~0) and "+r" wants
>>>>>> using as constraint. (Afaik & isn't necessary to use together with +.)
>>>>>
>>>>> I agree with '+' if we will initialize val with some value.
>>>>>
>>>>> Regarding, '&' my understanding is that I have to use it always when
>>>>
>>>> When what exactly? If an operand is both input and output, how could the
>>>> compiler re-use the (generally) register for any further purpose? '&'
>>>> indicates to the compiler that it may not use the register used for an
>>>> output to hold some input's value, as that value may be lost by the time
>>>> the input is actually consumed.
>>>
>>> But what is written in the gcc doc:
>>>
>>> & - Means (in a particular alternative) that this operand is an
>>> earlyclobber operand, which is written before the instruction is
>>> finished using the input operands.
>>>
>>> What sounds like if an operand (val) in our case is written before the
>>> instruction which using the input operands (and after the write
>>> instuction which writes val there are instructions which are using input
>>> operands) it is needed to have &.
>>
>> And that's indeed relevant, just not here. My crucial earlier question was:
>> "If an operand is both input and output, how could the compiler re-use the
>> (generally) register for any further purpose?" There is a case where the
>> answer to this is not "it can't". In your case all inputs are distinct; in
>> e.g. (using x86 assembly, sorry):
>>
>> int test(int i, int j) {
>> 	asm("nop %0; nop %1" : "+r" (i) : "r" (i));
>> 	asm("cmc; nop %0; nop %1" : "+&r" (j) : "r" (j));
>>
>> 	return i + j;
>> }
>>
>> using "+&r" indeed makes a difference.
> 
> I think it is clear when operands are equal. but what about the case 
> when they are different in  first  case:
> ...
>    asm("nop %0; nop %1" : "+r" (i) : "r" (j));
> ...
> 
> What guarantees that i and j will be in different registers?

They can both be in the same register only if the compiler sees respective
call sites, and can determine that the same value is passed for i and j.
This ...

> We have the similar situation in RISC-V code of riscv_vcpu_unpriv_read():
> 
>          : [val] "+r" (val), [tmp] "=&r" (tmp), [addr] "+r" (guest_addr),
>            "+m" (*trap)
>          : [ti] "r" (trap) );
> 
> With having & for val and guest_addr & guarantees that the same 
> registers won't be re-used for ti (and so ti won't be corrupted) but 
> without it?

... pretty clearly is impossible in your case: val and guest_addr can't
possibly have the same origin as trap.

Yet to repeat what I said before, and to not needlessly continue this
discussion, just go and use "+&r", despite that being unnecessary here.

Jan

