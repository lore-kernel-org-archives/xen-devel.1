Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FF4C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 10:44:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393945.1632748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHIY-0005UY-OR; Tue, 18 Aug 2026 10:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393945.1632748; Tue, 18 Aug 2026 10:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHIY-0005UQ-IO; Tue, 18 Aug 2026 10:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1393945;
 Tue, 18 Aug 2026 10:44:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwHIW-0005UK-Tw
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:44:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwHIW-00BLoZ-AW
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:44:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a843761-2eae-0a2a0a5409dd-0a2a4506c166-28
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:44:00 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84376c-195a-0a2a45060019-d1558034e853-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:43:57 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4954f5e8020so23503745e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 03:43:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996109652sm299552755e9.4.2026.08.18.03.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 03:43:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1787049836; x=1787654636; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZA67QQ3LFQeABYIel3pFcNF5s6j7atqy/CSoHYn97Kk=;
        b=XVF8GzC5Nj4YtZGduNSKX4s9LOBxZkcqSOLz/1nYQZfLvJhEGdJ9mm5T/i25zcXEex
         JG9df4u3zSR1XVPkpafEKEr/MCl886iom+ULm8xYxR3MTzQxinYSN383fkZLjWqS47Wf
         Gj6ic4MOEN5tdMW2tOB836VFhjmFOPBe+4GSQ5evdfCnBGSYdBZofnNydcyFBsXxzrbj
         qGu0szCa7TelXAAhjFW311phKYwUoMP2+ER4BjW+HVml7/C3Km+WmkCpFpK7YOS2Dgsf
         Z8826uXBO/PnRqb6ox6+zjaqhJM0m96stph1FJ2R6ROMP4bWTopUpzgemDSmPEe8FOw9
         L1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049836; x=1787654636;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZA67QQ3LFQeABYIel3pFcNF5s6j7atqy/CSoHYn97Kk=;
        b=FDrYUUthRyF770Rjpa14sz2r3XPbF+YmfTjN+E88Q23HxAC5Wx5YFUiC+DCiNYT6Za
         gkNhv94V0CiFDoaMrFYVCW4rOcB0xISxbI/P0igZgmPnFruJ7tRLmu3V+8xjxgk2l0IS
         YXIuJgSWsHK7pX//+nFP9uLrhBY2gwV1VXIRj+s2I7jHPxhDq5zmvZ846D141l3qjF2P
         wE9PULiYjsTLFCpLQ5hi0p4GsnlUYyxDkmxohwR0uVhz9+fUgFjieV+iwTfA/U5ykaET
         9RfsMNlBugDa7nznHuqMKmvwrf44BZBJoNH7B0k4kr9/ir0RmwJT2gCdh4zzTWLFboeG
         4Qzg==
X-Forwarded-Encrypted: i=1; AHgh+RoxTYdBahBXbIlaMx2gwUJb1xbRSau1nH8QpzQ7RgbYcbdE5kz0DJ0yBfLyDIPwwQxScp+5hKb1lSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT600qiMnRrfd8hMiT2AZG0K6OlQpsNZxTZOlVCY4Beay/3xHc
	qB9stfqSdpaVzihs/JWQ9HbWFP/9BUWcuC8jVMxgKdT2lO7Q6KXQ8sv+jp/wR44dJA==
X-Gm-Gg: AR+sD12V4BHjrDCrrTV7r6cu7uA6+pLOOfYUaC4bNQ9N3166ky7burobzhOP3lDwhBH
	FOccYgianV81r+duf6m9WeAoj76+rWylunH/5uHUbgg/MGVv/pJXNYh5UTAvZoNcDpWKNX5VRiC
	Ec1fO+niSooS6UFntq/TonQP3f2zgDD93pdoQ9Xqm8ZTsGWmBcj3nodSRK8858WbZk/Vf7p7miV
	0jnXVVNdBN1P1qg1WdBPTqe8+lcrAfK/2nBgN0zVFAqk9lZcwPrAemnqZklmfJORy9XPfcywatA
	+DhQkV7x8PzNXDIQl/dBki84Wq3yoTrPKRiYHHB4GaPvZh1Rd19qppHBoI3z67ZzTWg07cmK49v
	BS9kJpB3pbAhkuw+1dTSoWnjbHLOxb3PG28imN6mGbrw+PDnucYjnRKtIVSWqg+qWR4fzsv2s/h
	EQTAFXeCVZ1HtXTdyWU7G+Zbg6hPzkkRITm8N7fE9iv1a0Zu5i9vwVMbocRYBDvq+AAiHdwqhM6
	NCPgSNOkHuJkgP3RAxvAr4bj1DbmCWcGvv1sGRE0gapzGZ0Ma2j
X-Received: by 2002:a05:600c:1988:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-4998798dc17mr480155675e9.15.1787049836615;
        Tue, 18 Aug 2026 03:43:56 -0700 (PDT)
Message-ID: <5ee55d9c-d0f8-41cc-8d4e-3ba6c08d7506@suse.com>
Date: Tue, 18 Aug 2026 12:43:55 +0200
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
In-Reply-To: <d94bd15a-bf99-4df5-9dac-1fe0fcb77cfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1787049837-1ECC577B-98B4DCC5/0/0
X-purgate-type: clean
X-purgate-size: 4858

On 18.08.2026 12:27, Oleksii Kurochko wrote:
> On 8/18/26 10:17 AM, Jan Beulich wrote:
>> On 17.08.2026 17:36, Oleksii Kurochko wrote:
>>> On 8/12/26 5:30 PM, Jan Beulich wrote:
>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>> +    if ( read_insn )
>>>>> +    {
>>>>> +        asm volatile ( "\n"
>>>>> +            "1:\n"
>>>>> +            "   hlvx.hu %[val], (%[addr])\n"
>>>>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
>>>>> +            "   andi %[tmp], %[val], 3\n"
>>>>> +            "   addi %[tmp], %[tmp], -3\n"
>>>>> +            "   bne %[tmp], zero, 3f\n"
>>>>> +            "   addi %[addr], %[addr], 2\n"
>>>>> +            "\n"
>>>>> +            "2:\n"
>>>>> +            "   hlvx.hu %[tmp], (%[addr])\n"
>>>>> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
>>>>> +            "   sll %[tmp], %[tmp], 16\n"
>>>>> +            "   add %[val], %[val], %[tmp]\n"
>>>>> +            "3:\n"
>>>>> +        : [val] "=&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr)
>>>>> +        : [ti] "r" (trap) : "memory" );
>>>>
>>>> You want to tell the compiler that *trap is written. Instead I don't see
>>>> why a memory clobber would be needed: You access a different address space,
>>>> i.e. nothing the compiler can make any assumptions about.
>>>
>>> memory clobber tells the compiler that the assembly code performs memory
>>> reads or writes to items other than those listed in the input and output
>>> operands and so I don't tell here that *trap will be changed.
>>>
>>> Why this understanding is wrong?
>>
>> You can (ab)use "memory" for that purpose, but why would you when you can
>> properly express the operand? All that achieves is the compiler possibly
>> having to emit less efficient code.
> 
> Then I will use the option mentioned ...
> 
>>
>>> Alternative, I think, could be:
>>>           : [val] "+r" (val), "+m" (*trap)
>>>           : [addr] "r" (guest_addr), [ti] "r" (trap) );
>>> And then memory clobber could be dropped.
> 
> ... here.
> 
> Probably I have to return '[addr] "r" (guest_addr)' to output and use 
> +&r constraint.
> 
>>>> You also need to take precautions for not returning an uninitialized "val".
>>>> I think the variable wants initializing (perhaps to ~0) and "+r" wants
>>>> using as constraint. (Afaik & isn't necessary to use together with +.)
>>>
>>> I agree with '+' if we will initialize val with some value.
>>>
>>> Regarding, '&' my understanding is that I have to use it always when
>>
>> When what exactly? If an operand is both input and output, how could the
>> compiler re-use the (generally) register for any further purpose? '&'
>> indicates to the compiler that it may not use the register used for an
>> output to hold some input's value, as that value may be lost by the time
>> the input is actually consumed.
> 
> But what is written in the gcc doc:
> 
> & - Means (in a particular alternative) that this operand is an 
> earlyclobber operand, which is written before the instruction is 
> finished using the input operands.
> 
> What sounds like if an operand (val) in our case is written before the 
> instruction which using the input operands (and after the write 
> instuction which writes val there are instructions which are using input 
> operands) it is needed to have &.

And that's indeed relevant, just not here. My crucial earlier question was:
"If an operand is both input and output, how could the compiler re-use the
(generally) register for any further purpose?" There is a case where the
answer to this is not "it can't". In your case all inputs are distinct; in
e.g. (using x86 assembly, sorry):

int test(int i, int j) {
	asm("nop %0; nop %1" : "+r" (i) : "r" (i));
	asm("cmc; nop %0; nop %1" : "+&r" (j) : "r" (j));

	return i + j;
}

using "+&r" indeed makes a difference.

> t1:  hlvx.hu %[val], (%[addr])   W:val R:addr + can trap -> read register ti
> 
> t2:  andi    %[tmp], %[val], 3   W:tmp   R:val
> t3:  addi    %[tmp], %[tmp], -3
> t4:  bnez    %[tmp], 3f
> t5:  addi    %[addr], %[addr], 2 W:addr  R:addr
> t6:  hlvx.hu %[tmp], (%[addr])   W:tmp   R:addr + can trap -> read 
> register ti
> 
> t7:  slli    %[tmp], %[tmp], 16
> t8:  or      %[val], %[val], %[tmp] W:val
> 
> So val is written on t1 before t6 where addr and ti still alive.
> 
> The similar is for [addr] "+&r" (guest_addr):
> 
> addr is written on t5 and input ti is alive till t6. So if allocator 
> will allocate the same register for addr and ti then addi %[addr], 
> %[addr], 2 will break a pointer and handler will get something wrong.
> 
> Am I missing something?
> 
> If I am still wrong then in both cases should be just "+r"?

As per above, if you want to play absolutely by the rules, use "+&r",
even if that's unnecessary here.

Jan

