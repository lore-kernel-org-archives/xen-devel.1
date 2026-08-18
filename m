Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E96EC5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 10:27:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393915.1632721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwH2N-00018I-Qg; Tue, 18 Aug 2026 10:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393915.1632721; Tue, 18 Aug 2026 10:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwH2N-00018B-MS; Tue, 18 Aug 2026 10:27:19 +0000
Received: by outflank-mailman (input) for mailman id 1393915;
 Tue, 18 Aug 2026 10:27:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwH2N-000185-0I
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:27:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwH2L-00EnYk-Vx
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:27:18 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a843370-bab6-0a2a0a5309dd-0a2a4508c646-46
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:27:17 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a843385-f659-0a2a45080019-d1558036f1c4-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:27:17 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so52098035e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 03:27:17 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482aa084a64sm5690380f8f.17.2026.08.18.03.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 03:27:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787048837; x=1787653637; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T126TCGs+nAGgigu/iaRPhT8aiEINrKVZhmxMW+LbXY=;
        b=BoEMpok5qaicrMQ3S36JPD2rDrY3a8V3DdTWh2NPLRSgPrj7kxwFVpLjP8mQa53dKO
         wFyy0tYr9oAEbSYm0NZ1l2KlRo3w3Vl5JJeqrnmI5v2UB3mqfKk+vPgvonyM/cX0gr6m
         ncWlLaOPnR6TLh3SaS4twq3bunrJYHRbRTq0uCMsTmk87rgw8YVCZgwk2lR5XNxrhBpR
         SAy6JKJDd5/IQZaqH9P4mLs28n6q7BmJLstG8Hj5a5M1gO4vSSZudK3VaSPwaQzfjvWV
         iLeS+PfROVqsnxeEeHnQsu7+TE9ASr2sWcBKErsmIESMwS37LKafzg4Lhcnwp25W8UJ5
         YWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048837; x=1787653637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T126TCGs+nAGgigu/iaRPhT8aiEINrKVZhmxMW+LbXY=;
        b=MdmVr8K2GfTRRwclPewETNAX0m3DSe0y1vnnMwX5lTLlsjuq7Rb1Vw5YtMfcLN9FqX
         nXSVY/I54j7hyI0dh8BYWoBWfVBYOD6raN8TIBr44Xd37bUsKD/b5MhKa6Np+ADdhqQn
         2F7TQe97VG3MQGu6s5slGtzIFEgZl4M9YyOATjE7rAmekG3hcI+0LkvownVr0CVlLrz7
         5AhFDUlv9TI8rI64vGSZhs3g05J6tC/VH/t7+WA3YgUSYIgOlpxJ83JL7Lxl5kkihiMZ
         nwox/ZWH9wxDA/E44lJ+F8RWKnx/iMbDrbNGnyo7gt/WQbMe+q/Z9kAMhT11mtyMZeRA
         g55w==
X-Forwarded-Encrypted: i=1; AHgh+RqNkUL748DsRqGd9n6KZWOMpjjaIfLe1lQ3crfWKDLfDetJgOvfxmJiJLlX4YC7proWvAszPsO+v1I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRe+8QzzNpS8FUrpUru7o9CiluI5jOkXRca8vU3QP/OP+LPNzV
	+RGT47mhZRSc35KvFOiHwilcEm7oZMl3L39UWImiUwQs77W7OpTzmbZV
X-Gm-Gg: AR+sD13JYhQrf0SF6G7Le5HdD24qgNFgclPIm3BUZX2zjKpeCBPJq14NrJMU7tnE+WW
	UZZ4tUYmftZ60isfcT2Mc3cRjhWpvHto/ExmJx2cybqH40hpoVZoFYxapC+lmcMkkrnHgKCo7uW
	gZtV5R++exQFOzMizS4KYyc4qhaxXzJ8I4D2VLMgh8dZ33/445CrUCzsC4Z3vOV4WwIjZzPqWqI
	KAIXXg82p8pQv8Kg55kMypjPUwGlgUlsxu9KwzHo6RoXI4q2Y6/LP3hC7cuDa2ieFgNgL7nxU3X
	Rcx/lRi4GF+/2E79PKOO0ttdn6AFPhezkXilDlcrYxvMWE8SkHQnGxB6R3mTQNOMktoLn+tO0R2
	G8EKg8Qjn+K1rlcv+IdM9g82m8kslcl/8lqApwnJ3sBPt07t3SWUQO5Ryi4bfn5TSUIQC3sc0Hs
	7PRy2i24qH125We+nc2rSqJYcnLRLbEB8uP7JxJ1eKxayp7nB0Tkxt8sDAJnrAL4qsafRcr+U/r
	hV9fi67k+FnxQLT1+EBiiqxgUVLFT0VLnYz5J7xvYU=
X-Received: by 2002:a05:600c:3b8e:b0:499:a0f3:9d5c with SMTP id 5b1f17b1804b1-499a0f3a47bmr92169705e9.3.1787048837302;
        Tue, 18 Aug 2026 03:27:17 -0700 (PDT)
Message-ID: <d94bd15a-bf99-4df5-9dac-1fe0fcb77cfc@gmail.com>
Date: Tue, 18 Aug 2026 12:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/17] xen/riscv: add unprivileged guest memory read
 helper
To: Jan Beulich <jbeulich@suse.com>
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2ca3f802-bf93-4714-8a9b-e33ab0c89300@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787048837-CEB4187B-442F742F/10/73395122804
X-purgate-type: spam
X-purgate-size: 5579



On 8/18/26 10:17 AM, Jan Beulich wrote:
> On 17.08.2026 17:36, Oleksii Kurochko wrote:
>> On 8/12/26 5:30 PM, Jan Beulich wrote:
>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>> Introduce riscv_vcpu_unpriv_read() to allow Xen to safely read guest memory
>>>> using HLV/HLVX instructions while reliably capturing trap context.
>>>
>>> Both for the title and the function name: How does "unprivileged" matter here?
>>
>> Unprivileged because HLV/HLVX reads guest memory as if it were accessed
>> from a less-privileged (guest) context, rather than by the hypervisor in
>> HS mode.
>>
>> I think I am okay generally to drop "unpriv..." from the function name.
>>
>>> The same functions would be use for reading Dom0's memory, wouldn't they?
>>
>> Yes, I don't see any issue to let this function to read DomO's memory
>> too. But Dom0 could be counted as "unprivileged" too as it is executed
>> in VS-mode which is less-privileged then HS-mode.
> 
> Well, you need to properly distinguish the different cases of "unprivileged"
> when writing titles / descriptions. The way you put it in your reply above
> ("less-privileged (guest)") is sufficiently unambiguous, but what you have
> in the title ("unprivileged guest") clearly is a synonym for "DomU".
> 
> In the end, as you confirm, "guest" alone is all that's needed here to know
> what is being talked about. (That said: We often distinguish "guest" and
> "domain", with the former meaning DomU but the latter meaning all domains,
> including Dom0 and service domains. Yet for the purpose here I think "guest"
> is good to use, not matter that all kinds of domains are meant.)

I will use then guest.

> 
>>>> +    if ( read_insn )
>>>> +    {
>>>> +        asm volatile ( "\n"
>>>> +            "1:\n"
>>>> +            "   hlvx.hu %[val], (%[addr])\n"
>>>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
>>>> +            "   andi %[tmp], %[val], 3\n"
>>>> +            "   addi %[tmp], %[tmp], -3\n"
>>>> +            "   bne %[tmp], zero, 3f\n"
>>>> +            "   addi %[addr], %[addr], 2\n"
>>>> +            "\n"
>>>> +            "2:\n"
>>>> +            "   hlvx.hu %[tmp], (%[addr])\n"
>>>> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
>>>> +            "   sll %[tmp], %[tmp], 16\n"
>>>> +            "   add %[val], %[val], %[tmp]\n"
>>>> +            "3:\n"
>>>> +        : [val] "=&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr)
>>>> +        : [ti] "r" (trap) : "memory" );
>>>
>>> You want to tell the compiler that *trap is written. Instead I don't see
>>> why a memory clobber would be needed: You access a different address space,
>>> i.e. nothing the compiler can make any assumptions about.
>>
>> memory clobber tells the compiler that the assembly code performs memory
>> reads or writes to items other than those listed in the input and output
>> operands and so I don't tell here that *trap will be changed.
>>
>> Why this understanding is wrong?
> 
> You can (ab)use "memory" for that purpose, but why would you when you can
> properly express the operand? All that achieves is the compiler possibly
> having to emit less efficient code.

Then I will use the option mentioned ...

> 
>> Alternative, I think, could be:
>>           : [val] "+r" (val), "+m" (*trap)
>>           : [addr] "r" (guest_addr), [ti] "r" (trap) );
>> And then memory clobber could be dropped.

... here.

Probably I have to return '[addr] "r" (guest_addr)' to output and use 
+&r constraint.

>>
>>
>>
>>>
>>> You also need to take precautions for not returning an uninitialized "val".
>>> I think the variable wants initializing (perhaps to ~0) and "+r" wants
>>> using as constraint. (Afaik & isn't necessary to use together with +.)
>>
>> I agree with '+' if we will initialize val with some value.
>>
>> Regarding, '&' my understanding is that I have to use it always when
> 
> When what exactly? If an operand is both input and output, how could the
> compiler re-use the (generally) register for any further purpose? '&'
> indicates to the compiler that it may not use the register used for an
> output to hold some input's value, as that value may be lost by the time
> the input is actually consumed.

But what is written in the gcc doc:

& - Means (in a particular alternative) that this operand is an 
earlyclobber operand, which is written before the instruction is 
finished using the input operands.

What sounds like if an operand (val) in our case is written before the 
instruction which using the input operands (and after the write 
instuction which writes val there are instructions which are using input 
operands) it is needed to have &.

t1:  hlvx.hu %[val], (%[addr])   W:val R:addr + can trap -> read register ti

t2:  andi    %[tmp], %[val], 3   W:tmp   R:val
t3:  addi    %[tmp], %[tmp], -3
t4:  bnez    %[tmp], 3f
t5:  addi    %[addr], %[addr], 2 W:addr  R:addr
t6:  hlvx.hu %[tmp], (%[addr])   W:tmp   R:addr + can trap -> read 
register ti

t7:  slli    %[tmp], %[tmp], 16
t8:  or      %[val], %[val], %[tmp] W:val

So val is written on t1 before t6 where addr and ti still alive.

The similar is for [addr] "+&r" (guest_addr):

addr is written on t5 and input ti is alive till t6. So if allocator 
will allocate the same register for addr and ti then addi %[addr], 
%[addr], 2 will break a pointer and handler will get something wrong.

Am I missing something?

If I am still wrong then in both cases should be just "+r"?

~ Oleksii


