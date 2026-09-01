Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928A8C61DE4
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 06:27:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404430.1638104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1HxF-0007SF-Vc; Tue, 01 Sep 2026 06:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404430.1638104; Tue, 01 Sep 2026 06:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1HxF-0007S7-Qt; Tue, 01 Sep 2026 06:26:45 +0000
Received: by outflank-mailman (input) for mailman id 1404430;
 Tue, 01 Sep 2026 06:26:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1HxF-0007S1-3m
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 06:26:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1HxD-002aUM-Qk
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:26:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967012-2eae-0a2a0a5409dd-0a2a450ce872-34
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:26:43 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967023-f479-0a2a450c0019-d155802dbc47-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:26:43 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so42108875e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 23:26:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d6eafesm2465684f8f.24.2026.08.31.23.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 23:26:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1788244003; x=1788848803; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mj6oJVsCPqNU+EK40dWQmbASDv4ZqpwZD7NjEyaNDUY=;
        b=IOd3pNOklDu934WC1hk7X7w3DfediJIOExD8Sgn57SOSlfsvNtxlZgoEBAhioQI0WZ
         ckilFlI2ap5Y4Kpuc3YCJgfNn//ZKMY8+m+SMib21BmW33nZGC2/ZX51DWTcp2cRJ/vO
         KKOr7wKqmifv9hqAowO0L2DCTGssCKDXMtTbbmDaW0yJXALhxyw3h/M7sfrFCDzR6upx
         H3uBlkeAf+OosVYP/X0yTsTB1HqjMil1BL1MNn/rd1pfOHzifI85vsg4nQcbvlNn4lm0
         qSEI+94TVVnCZZTCOEZzluXocJJEyE1eJmz88XDwAD9a/gUaiT4H+yn7uM8MV+uNCXFx
         7Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244003; x=1788848803;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mj6oJVsCPqNU+EK40dWQmbASDv4ZqpwZD7NjEyaNDUY=;
        b=Z/UFv44qHBbUKhyQSVLINjjaELS8S1Y8xW/YULBPNj3Hoo2T9GBTwGtCnZiUMoxD2g
         BZ3GKEX3JSsd1emWwNaC5uqyAbwLfk2gugEW2Yls/TDX6fp5LF3jQ3UoFDz3qHBTNTmb
         rIlYDtGe0kDydP6r1icqImHNmieDr/PHyoBtQQUwBDvB7xxYMpPax84uEdoG8z3XsJu0
         febzHo5yYmmwWzunRZgL+oN6rqqJL53M8AfNfqTqXKQA5mUlLZD8ccXPI2xkL3Fe89ck
         P9+LlgkKIQh2hO49UJsvxNHVrS9C7ucqxEfc9PcgHinBTczFIlTc46OJFDihYoq5b7UA
         IsOg==
X-Forwarded-Encrypted: i=1; AHgh+RoRVhwEdRIQRjkS3ARi80qyL3eCNFr8wqKYYubtAc6/tPlekJuEyx+5/Q52sOsRuxtMy1B5xpVat9o=@lists.xenproject.org
X-Gm-Message-State: AFuF++k5KWmolplep0+Kz73DMLUfYg6zixXEKXp73oSHBlPQTA2ln5Zw
	ASbsrrL7365u5SSfiB98YPXfwU7DrfBpM5e5CzhngUQcSqYp0RnJgfPlPCp4atrtyg==
X-Gm-Gg: AR+sD11/SPfq3pMAcopOgdZ/0ZCCwCldKdn2HC/y3MZ8Ts/HKqHZkT6Zsr5h6I7PulR
	RRjYix6GuhRuYjBg6ZWWuvQNR0PuQkAcXz4N49zposswzIWTL+R+064y89ZzSVZe7KCisAhPSYj
	IRnvcfFKVcowLYTyVvA+PAy0Wlew969KUK8v9YIaBnRnUlgjep00C9T1FqB2n3Fbt3dAMUBBlhd
	/JsWpYg3O9WBOJ3Xyiflj34hrUMb52Ng3h2nlWRx9k+54ZTov3VVpQZH3cvptq2wVhpxs+ALN8u
	8muw3iHG+dirabLU5N+98LQSWVrCpP2P8ONR0oy8ScVyHmXoOtFFEUeAhSNsSITRbGeHNlSJ7dG
	bTN9q8hxQmejSmyj8l+Fh6H2DpJdJ+f/RiY6d4b7ShNOCr01bTd9EkeiSdmOiamGX7KT/o3qLeP
	TwQd+a3dsPfHIyHAEXBsDLMUvIU3PAVV+KYOhw7aIpoZ/Xym329rL87DoxYnr8332nyIcVDI1z8
	8mKV3cQeTixHSjvV9uZZ0TBsdET4Ud35X3PudAhTO7QdB8OgCEJ
X-Received: by 2002:a05:600c:c113:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cdc435d58mr97286375e9.9.1788244003021;
        Mon, 31 Aug 2026 23:26:43 -0700 (PDT)
Message-ID: <d08b2d8a-d363-49d5-965f-f954c79fe04c@suse.com>
Date: Tue, 1 Sep 2026 08:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86: add noreturn in a few more places
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
 <66fc1415-df9e-41c2-b3ae-78305814cbfc@citrix.com>
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
In-Reply-To: <66fc1415-df9e-41c2-b3ae-78305814cbfc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788244003-022C0A5B-B4BFB9E6/0/0
X-purgate-type: clean
X-purgate-size: 2120

On 31.08.2026 21:13, Andrew Cooper wrote:
> On 28/08/2026 8:01 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -2304,7 +2304,7 @@ void asmlinkage entry_from_pv(struct cpu
>>      case X86_ET_HW_EXC:
>>          switch ( vec )
>>          {
>> -        case X86_EXC_DF: return do_double_fault(regs);
>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>          case X86_EXC_MC: return do_machine_check(regs);
>>          }
>>          break;
>> @@ -2615,7 +2615,7 @@ void asmlinkage entry_from_xen(struct cp
>>      case X86_ET_HW_EXC:
>>          switch ( regs->fred_ss.vector )
>>          {
>> -        case X86_EXC_DF: return do_double_fault(regs);
>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>          case X86_EXC_MC: return do_machine_check(regs);
>>          }
>>          break;
>>
> 
> For starters you're missing a break, and the only reason this isn't a
> compile error is the trailing comment.

"break" there would again be unreachable, though.

>  Second, it's a tailcall anyway. 
> There really is nothing unreachable anywhere in this construct.

Just that the concept of "tailcall" is an optimization, not something
inherent to the language.

> But by far the most important, it the singular noreturn attribute on
> do_double_fault() (elsewhere, and not visible when reading these two
> functions) which is preventing #DF falling into #MC.   This introduces
> fragility which did not exist previously.

I realized that when making the patch, yet what do you do when the rule
is as it is? Hence why I added the comment, really.

> do_double_fault() would conditionally return if we ever got around to
> fixing espfix64.

And hence would have to lose its "noreturn". At which point call sites
would need inspecting. (As said - yes, I do realize the fragility.)

> So no - I'm going to insist that Eclair is taught to accept "return
> some_noreturn_fn();" as intentional.  It is objectively less fragile
> than the MISRA-preferred option.

Nicola, thoughts?

Jan

