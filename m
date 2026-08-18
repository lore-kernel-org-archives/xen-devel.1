Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D138AC5DF74
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 13:38:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394192.1633027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwK1D-0008S6-7D; Tue, 18 Aug 2026 13:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394192.1633027; Tue, 18 Aug 2026 13:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwK1D-0008Rx-40; Tue, 18 Aug 2026 13:38:19 +0000
Received: by outflank-mailman (input) for mailman id 1394192;
 Tue, 18 Aug 2026 13:38:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwK1B-0008Rr-L3
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:38:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwK1B-002cb0-1d
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:38:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a846040-8faa-0a2a0a5109dd-0a2a45048e0e-36
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:38:17 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a846048-b57f-0a2a45040019-d1558036b431-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:38:16 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4998590d392so48394415e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 06:38:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a7c568sm12198942f8f.18.2026.08.18.06.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 06:38:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787060296; x=1787665096; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhlxW4qiePznAo5gSWosjOTmBT5D8uBehTWpiIJV8lY=;
        b=QmMM9ri0vxatAeFkgKC7fIJw/7DdFWAQLIphrjY9YeAdXG6jFlGxXMgi0bVdgxwL9S
         wWYPuX2TMNP/WzbbzI3p3c5fXVsS/tX6P2om4Eg3Ept7SzcSsBFM4jO0t6comdJcCQbm
         vP/YdgTHIKhfAkuJD8Ncx8TZFQqUtngO7fdSG8YKv1taBCVIb1mANIWWIyvxe55EOV1k
         5DRiKUQMeG7VdW1xwUjss0Uz0yjlfWUE1QFFyz4dB+rrNuWxXvWc/Wv2fh24lcaKOTix
         Uw3yya7F6QPVilm+uAPK6CIhp8tKprw6Hcj1XhAYF4134h/xozK2UgMqibrAlw1+M4vh
         nG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060296; x=1787665096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhlxW4qiePznAo5gSWosjOTmBT5D8uBehTWpiIJV8lY=;
        b=pZiXYjRrmlnCpjzCBEuygTLPGIvXfoHGAz+Fz05qCMHI/7DYHAGuaOCtZoOYW3Qmpw
         bwztZlCMORM9ygcN7tg5QA4kWPXIIEa4nA3Xhh6ek2VdKvtxNUw/RjVzmAP6FN4aSuVN
         8bzDBkYiLyb/mDMAkRYTHU7owckLAGcGtm3JCI5T6GRVz8l7ZpBb1JBTplRVutE9lhRt
         ih+3z2K3Dm4aALeuFRASlQAB3o+HeeBumBBuDdn1Pl+JWjKb0bSfk9BJYcQhy+lW+2DG
         ZjJHMB1NZt2LzHsJxfVlTnF6XquxrJmQ+U4mqQzMX1ranmHN8N8XzZhJ5YSU+QJ96fBM
         tPPA==
X-Forwarded-Encrypted: i=1; AHgh+RqiFnFMFQ+kwywVPZlb1gpckFZj3TqsV2KMpLgHfH+OrF4YA3ya2TMkEybPN9M0W6qlHnoG8CTNUPg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpyXemqRmCUS46aVpk4MAotOhwmDvTPvqiFOR0oP+icqAN9K97
	FQJ6QicghSRqa/QN9gnwlPjv2JSOvWE/2wTTedzR/H6z5utUosRn4kVL
X-Gm-Gg: AR+sD12/8GJSmpsgpVUyjBR5lKbeuHXYFeMT3NxXVgSLp+1+L8KYFL+f5YJOQH5jGPz
	KCk0HmD6l3D/UoGLlXL+ndZgdPeKDO8SngznfIk1UNRuZTeadm/gePAi4YjtS06FTHgOSROf+1f
	hDJTGjFpA8mxD09gyv/ZPfPCIUYJLM60g5iBlmzOVi/nze9ji/J5B5WfUJz0u1+VqWuZZZLU+Sj
	W94Qdu5UZhp8VwZl+XSFhNshe7VeTP84s7oVSImLymvWvn73V0/9U79/yifNxXIottyckXIaOXx
	MtA9vB0iMeRdiEijbfy80I3BcnFXDlVYqZIWXODAQ/PM89hptDAYCfsyn8QxbLfcwdwQkhUsdCU
	GoCFwB3Lzp12lK6hXxdWKCtzMW9e1TMCHyXRftxAY6oqAxIw+9CKGN1QsjII8paUhXPY4SOlCnX
	l3YA0ybO6WKXOSkP5JyzOfPDuFea1ZpNPdrmi3fitzv2OgmtJFIdTLG6pN85YUNZszPoKPDYxJ8
	9IDshuTh70JV8HnWEBI3qwPpZVzlrEUpR0jvnFfOWA=
X-Received: by 2002:a05:600c:848e:b0:499:8156:cd3f with SMTP id 5b1f17b1804b1-4999fb3f78bmr153120185e9.8.1787060296169;
        Tue, 18 Aug 2026 06:38:16 -0700 (PDT)
Message-ID: <6959b0e1-3059-4d3b-baa1-28dc0d761f9e@gmail.com>
Date: Tue, 18 Aug 2026 15:38:14 +0200
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
 <d94bd15a-bf99-4df5-9dac-1fe0fcb77cfc@gmail.com>
 <5ee55d9c-d0f8-41cc-8d4e-3ba6c08d7506@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5ee55d9c-d0f8-41cc-8d4e-3ba6c08d7506@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787060296-528C9B50-16DCEEF0/10/73395122804
X-purgate-type: spam
X-purgate-size: 5639



On 8/18/26 12:43 PM, Jan Beulich wrote:
> On 18.08.2026 12:27, Oleksii Kurochko wrote:
>> On 8/18/26 10:17 AM, Jan Beulich wrote:
>>> On 17.08.2026 17:36, Oleksii Kurochko wrote:
>>>> On 8/12/26 5:30 PM, Jan Beulich wrote:
>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>> +    if ( read_insn )
>>>>>> +    {
>>>>>> +        asm volatile ( "\n"
>>>>>> +            "1:\n"
>>>>>> +            "   hlvx.hu %[val], (%[addr])\n"
>>>>>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
>>>>>> +            "   andi %[tmp], %[val], 3\n"
>>>>>> +            "   addi %[tmp], %[tmp], -3\n"
>>>>>> +            "   bne %[tmp], zero, 3f\n"
>>>>>> +            "   addi %[addr], %[addr], 2\n"
>>>>>> +            "\n"
>>>>>> +            "2:\n"
>>>>>> +            "   hlvx.hu %[tmp], (%[addr])\n"
>>>>>> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
>>>>>> +            "   sll %[tmp], %[tmp], 16\n"
>>>>>> +            "   add %[val], %[val], %[tmp]\n"
>>>>>> +            "3:\n"
>>>>>> +        : [val] "=&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr)
>>>>>> +        : [ti] "r" (trap) : "memory" );
>>>>>
>>>>> You want to tell the compiler that *trap is written. Instead I don't see
>>>>> why a memory clobber would be needed: You access a different address space,
>>>>> i.e. nothing the compiler can make any assumptions about.
>>>>
>>>> memory clobber tells the compiler that the assembly code performs memory
>>>> reads or writes to items other than those listed in the input and output
>>>> operands and so I don't tell here that *trap will be changed.
>>>>
>>>> Why this understanding is wrong?
>>>
>>> You can (ab)use "memory" for that purpose, but why would you when you can
>>> properly express the operand? All that achieves is the compiler possibly
>>> having to emit less efficient code.
>>
>> Then I will use the option mentioned ...
>>
>>>
>>>> Alternative, I think, could be:
>>>>            : [val] "+r" (val), "+m" (*trap)
>>>>            : [addr] "r" (guest_addr), [ti] "r" (trap) );
>>>> And then memory clobber could be dropped.
>>
>> ... here.
>>
>> Probably I have to return '[addr] "r" (guest_addr)' to output and use
>> +&r constraint.
>>
>>>>> You also need to take precautions for not returning an uninitialized "val".
>>>>> I think the variable wants initializing (perhaps to ~0) and "+r" wants
>>>>> using as constraint. (Afaik & isn't necessary to use together with +.)
>>>>
>>>> I agree with '+' if we will initialize val with some value.
>>>>
>>>> Regarding, '&' my understanding is that I have to use it always when
>>>
>>> When what exactly? If an operand is both input and output, how could the
>>> compiler re-use the (generally) register for any further purpose? '&'
>>> indicates to the compiler that it may not use the register used for an
>>> output to hold some input's value, as that value may be lost by the time
>>> the input is actually consumed.
>>
>> But what is written in the gcc doc:
>>
>> & - Means (in a particular alternative) that this operand is an
>> earlyclobber operand, which is written before the instruction is
>> finished using the input operands.
>>
>> What sounds like if an operand (val) in our case is written before the
>> instruction which using the input operands (and after the write
>> instuction which writes val there are instructions which are using input
>> operands) it is needed to have &.
> 
> And that's indeed relevant, just not here. My crucial earlier question was:
> "If an operand is both input and output, how could the compiler re-use the
> (generally) register for any further purpose?" There is a case where the
> answer to this is not "it can't". In your case all inputs are distinct; in
> e.g. (using x86 assembly, sorry):
> 
> int test(int i, int j) {
> 	asm("nop %0; nop %1" : "+r" (i) : "r" (i));
> 	asm("cmc; nop %0; nop %1" : "+&r" (j) : "r" (j));
> 
> 	return i + j;
> }
> 
> using "+&r" indeed makes a difference.

I think it is clear when operands are equal. but what about the case 
when they are different in  first  case:
...
   asm("nop %0; nop %1" : "+r" (i) : "r" (j));
...

What guarantees that i and j will be in different registers?

We have the similar situation in RISC-V code of riscv_vcpu_unpriv_read():

         : [val] "+r" (val), [tmp] "=&r" (tmp), [addr] "+r" (guest_addr),
           "+m" (*trap)
         : [ti] "r" (trap) );

With having & for val and guest_addr & guarantees that the same 
registers won't be re-used for ti (and so ti won't be corrupted) but 
without it?

~ Oleksii

> 
>> t1:  hlvx.hu %[val], (%[addr])   W:val R:addr + can trap -> read register ti
>>
>> t2:  andi    %[tmp], %[val], 3   W:tmp   R:val
>> t3:  addi    %[tmp], %[tmp], -3
>> t4:  bnez    %[tmp], 3f
>> t5:  addi    %[addr], %[addr], 2 W:addr  R:addr
>> t6:  hlvx.hu %[tmp], (%[addr])   W:tmp   R:addr + can trap -> read
>> register ti
>>
>> t7:  slli    %[tmp], %[tmp], 16
>> t8:  or      %[val], %[val], %[tmp] W:val
>>
>> So val is written on t1 before t6 where addr and ti still alive.
>>
>> The similar is for [addr] "+&r" (guest_addr):
>>
>> addr is written on t5 and input ti is alive till t6. So if allocator
>> will allocate the same register for addr and ti then addi %[addr],
>> %[addr], 2 will break a pointer and handler will get something wrong.
>>
>> Am I missing something?
>>
>> If I am still wrong then in both cases should be just "+r"?
> 
> As per above, if you want to play absolutely by the rules, use "+&r",
> even if that's unnecessary here.
> 
> Jan


