Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E13606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HGGvwH+Z
Received: from list by lists.xenproject.org with outflank-mailman.1462016.1673064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLeGC-0003je-Cm; Tue, 27 Oct 2026 10:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462016.1673064; Tue, 27 Oct 2026 10:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLeGC-0003jX-9w; Tue, 27 Oct 2026 10:18:28 +0000
Received: by outflank-mailman (input) for mailman id 1462016;
 Tue, 27 Oct 2026 10:18:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLeGB-0003jR-6b
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:18:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLeGA-0066CK-Ja
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 11:18:26 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae07a72-e002-0a2a0a5209dd-0a2a4508a1f0-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:18:26 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae07a6c-f659-0a2a45080019-d155802de039-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:18:20 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so27461565e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 03:18:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a359fbc718sm216547825e9.2.2026.10.27.03.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 03:18:19 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793096300; x=1793701100; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GJQ7loJXaL1zYoq9547GYZzn7EyCf30kF0nJ+j5ZqX4=;
        b=HGGvwH+Zsd7kPj7+xTAVyqhmW6Av9xaK31/e9twGwXxNbxkeE/M9QlRaZc3eGL4nlH
         kzzgO3/uZhH/N6JdWyFQBJppku6B84i68pkZ6GMd4b7ru+14pvDKx4hkQ/FaFum3NSAy
         Tbvu+hl37b75uD5ZZL5KvOUf+F0RYfcSBb8CITZjJA4uX4+E44oevHxYZGGrDVEqBVmv
         CT6Tl8S3F1z7mhcxG/yGLjnq1piiuGXerC4rLSvzYwt7V9rbf4fe2bHnj3nqFgfN7veN
         RtIgf7Zwmy/2zlso+QkXf/b9EwkEysGEvH1tg8WQvsS6rHMf+QjsbT9DdcqMRUcEeYtz
         tuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096300; x=1793701100;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJQ7loJXaL1zYoq9547GYZzn7EyCf30kF0nJ+j5ZqX4=;
        b=uxfmy/f7rvZ0Q2PaClQ/HYesud6ElLA4qhVumXiFBvf6LjgLy7x8ByZwUCnZZyQsvF
         LIxHv6YjJNvme9wTyE74zglSkljQJ7iY1FSOHGGOXsqLjv/qOWTgwAMrMixipanxOp+H
         at6aFAzZjkQIo/Qwdz8BUhBniwEEriUtxFVGARMwXUQg0lODUu29dOZhIV6DCftJ4RO4
         GCnVMNp0g7g4YIXG/jV+/vPnxBcgLQ4g9g/oIN7xs50iXBH5UzHjGMS2JF+p/Vwp/G/w
         B15+LUe97Hl1ByTUIciGye/yjTh8AFbEaEtdhUCapAGD2uCwFVRZfqkoVaCPBCzMQkY7
         V2XQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWHSdwbB4I2zyQATi4mU7CdYbga8uBHli9Tbxclst/2KnK498+DpWHB8zcxf7uVdi0p9EoN14Qquc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKPE96qiNtj7pAsJLZul0HygBnRRivy7T7dfP9fKQeAyWSSJQjt
	oXkOAHHAq5Iehh6WIy13vSpjw/yywPUFsl6j1QXdn0Tt2uOB6e3WEcWzOwMgVKgTVg==
X-Gm-Gg: AYBFou0Kwf6NYQ22qrLSn8KVHzLBenSnikoDn098JbSqU1W+N4qIU2NFMSI1Gf9Knt8
	hY3yAMYK7b/9c30krn/9lIrCljUDCYVZQ/vyc85W8L7xgQy91STFxnKbYrxMKz7S9J4DdRpUKjp
	UghOciq+0T5Azghj/zF5uum4In4pJOZC24ucmILnAWaLOH7ax4eXrEYTIcaayivwOTRQYRrKm39
	De4Jer8LQTC0fY6Hjs/oaAdP+eHPM+NFDpr+ulhRQtKaR4xFo+rQ14B5jIQeBDptutBuBXV6ceD
	qy3z5rRPYX3+siGmMorfSyPZ8l3AL3y70QWOynatoHb+h+Li0z1odvHQ9HT90/w/GRckVcjfgZX
	5drdv4ao2oHlEKU7F3MrpIQtK8zokHKTqjXE26FCPWHJZKm+ZVTzp/2bql5aVHk1r0vxInF+eBc
	zKbyfamvIh8kCPXZEIdWE24y9sP1bWwUAamnJg4gxdgThtC9bHShVs7XTpcpBA/sUDOMgNYucW5
	/VFvyFHzYNgF1H3ehuyjrclOEt3XT7iEt3USooMVx7temke79GlqMpekBNHDuB19wKt8dVgRfpW
	iQv2x771gbBmwfGfDh15MgbVNlxUtHKnQOOzzZo+cv5RYNKoWlKGqO0IQIOA7th68A==
X-Received: by 2002:a05:600c:530f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a35ac8b2a7mr198614425e9.10.1793096300231;
        Tue, 27 Oct 2026 03:18:20 -0700 (PDT)
Message-ID: <e6b831b7-81b8-40ef-a0c6-4fa4d0db93d8@suse.com>
Date: Tue, 27 Oct 2026 11:18:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86: record SSP at non-guest entry points
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6dd91c2-f43a-4c9a-89f3-a42c8b954959@suse.com>
 <26f23087-e864-47de-84b9-0e3dc10dc941@suse.com>
 <78ead290-fbf6-4aa8-b918-1f53abe2dfca@citrix.com>
 <d7e5c9d2-cfea-4e63-a6d4-21ea0810a223@suse.com>
Content-Language: en-US
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
In-Reply-To: <d7e5c9d2-cfea-4e63-a6d4-21ea0810a223@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793096300-CE74387B-F70C115A/10/78276251493
X-purgate-type: spam
X-purgate-size: 2415
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 11:13, Jan Beulich wrote:
> On 16.10.2026 19:12, Andrew Cooper wrote:
>> On 27/07/2026 11:26 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/include/asm/asm_defns.h
>>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>>> @@ -220,9 +220,11 @@ static always_inline void stac(void)
>>>  
>>>  #ifdef __ASSEMBLER__
>>>  /*
>>> - * Push and clear GPRs
>>> + * Push and clear GPRs.
>>> + *
>>> + * Use sites may override ssp to 0. It should never be overridden to 1.
>>>   */
>>> -.macro PUSH_AND_CLEAR_GPRS
>>> +.macro PUSH_AND_CLEAR_GPRS ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
>>>          push  %rdi
>>>          xor   %edi, %edi
>>>          push  %rsi
>>> @@ -233,6 +235,9 @@ static always_inline void stac(void)
>>>          xor   %ecx, %ecx
>>>          push  %rax
>>>          xor   %eax, %eax
>>> + .if \ssp
>>> +        rdsspq %rcx
>>> + .endif
>>>          push  %r8
>>>          xor   %r8d, %r8d
>>>          push  %r9
>>> @@ -259,12 +264,18 @@ static always_inline void stac(void)
>>>          xor   %r14d, %r14d
>>>          push  %r15
>>>          xor   %r15d, %r15d
>>> +#ifdef CONFIG_XEN_SHSTK
>>> +        push  %rcx
>>> +#endif
>>>  .endm
>>
>> I don't like the ssp= parameter here.  It's invasive at may callsites,
>> doesn't 0 the value in all Ring3 frames anyway, and the asymmetry makes
>> the construct fragile.  Furthermore, the manual register scheduling
>> really isn't necessary on CPUs where it's not a NOP.
>>
>> I suggest having this:
>>
>> +#ifdef CONFIG_XEN_SHSTK
>> +        rdsspq %rcx
>> +        push  %rcx
>> +#endif
>>
>> always filling in the value.  rdsspq is pretty close to free (frankly, I
>> would be surprised if it wasn't subject to mov elimination in the
>> pipeline, given how tightly coupled SSP needs to be to RSP for CALL/RET
>> uops to work).
> 
> I can make that change, but I didn't code it that way from the start as
> there continues to be no evidence of what you say (no matter how
> plausible it reads): None of the latency / throughput documents I can
> find lists RDSSP.

Oh, also: You implicitly indicate then that the code size increase for those
entry sequences then isn't a problem either, in your opinion. I can accept
that, sure, yet my personal view is that it isn't helpful to have unnecessary
insns anywhere, no matter how cheap they may be. They're never zero cost.

Jan

