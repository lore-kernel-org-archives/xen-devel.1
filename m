Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E008C5DF85
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 15:49:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396724.1634449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx50f-0000jm-VS; Thu, 20 Aug 2026 15:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396724.1634449; Thu, 20 Aug 2026 15:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx50f-0000jf-Ry; Thu, 20 Aug 2026 15:48:53 +0000
Received: by outflank-mailman (input) for mailman id 1396724;
 Thu, 20 Aug 2026 15:48:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wx50f-0000jZ-BZ
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 15:48:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx50e-002Zcu-7P
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:48:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8721e0-bab6-0a2a0a5309dd-0a2a450194bc-4
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:48:52 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8721e3-5984-0a2a45010019-d1558034c0b7-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:48:52 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4996f1ee4a4so21341325e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 08:48:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b20a14c6sm56786445e9.0.2026.08.20.08.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 08:48:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1787240931; x=1787845731; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iinPbohH6fqNl4HDjuYqaLgTG5kg0eT66Sa++6k7gCc=;
        b=Z8TskbFF+Nbtk+APFE9wA2V9GYQjbYMI5cKG5790q/vJlBJkrJFxJSnMUig84XSNEr
         oN+TrOEDo5PnMXNlELKLiNgvb9fE+tqaYYxsqOWuyZYRd4Dq9f03IRFuEoPYpNKpVMN4
         5NNXkJECZVzTQ2gBMTroVuRotrBtCAjmXEv4Ty2+kwMjv4G4eIeTn5PoWM1GYxgoOgO0
         5IhaIm0Ww4mXqvsglbAC+cfVuaGbAMOuU4cP7+vz8JrUvZIXrwF3YJJiZqb1I2IGeZRh
         MCu6RGl1dUutXtUHcNJ3xAk0RPuHjSI8zNGDdeGlKarRztB22jbaRLH8QMRQZ612GIh0
         eWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787240931; x=1787845731;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iinPbohH6fqNl4HDjuYqaLgTG5kg0eT66Sa++6k7gCc=;
        b=aW6ggWOefo+HdEDPmpdKa/FTEhxdd8UtoxFgWoKZ00n5QH5q1itf+suoVEuMhswnvt
         DW9Olk1w5CzmEB4qWkszRCQPyUeTQ6EtwU5NjbSC7wiMoHnScywveivZ5zVrU8UvjQpk
         N70ZHM0XeoTIxzeNEq+1T2UsFMSeW30VKbDWgnM8uiMzf4/onacqKacMNt81VyZTyueZ
         czZp5jMvMx0a0DMaI+LWoTEBNtHnJyGG5PvB49RI86Ev+1YfMHBXn8pkV+YLdS8WB9MX
         2hXdgBnjabox+JX3OwYO/BaKwSEts5pwjheDORXyQ4CBaxFT42JTCO6oA1Km9JzwR6Qs
         tO8g==
X-Forwarded-Encrypted: i=1; AHgh+RrCwmjtEK4ivBb0fsqjCxCJDJ5/6rGv73ePhzjP2KsYlk165rnWCyxrd+r84XLjAuBM0kp32gOACJg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzM5GB/vyDWCkWhZ7GTsOEag/5nSFvcNH6T+7IBq8jbGJh6C5WL
	0JaPooZ8orRgI0kVOoguajIRToPzlc1JU9EllW9yw1SCVl/iY9xJq+GLNjxNutcYrA==
X-Gm-Gg: AR+sD12f6ts1SwpiHILqgxmlF2W5JRlcm8yb4cq/IJd0egQEkdANKBY1NH703ZnAz28
	/mxnEa+8MtRNeqf4ps/8dOouhGEDW7yIFS446N1hQCXFoYD6Ycj6r1uVf4Z9QA43Qq0HrjPCQix
	NhkwmryNwH8zqsxs1UYaBUtjsFpKuIjuL1PsqZixIaA4d0yJZE6th8ENcNmdSviMOBMorktKkji
	pb/S4t4VbR6/c8XqN8Q2/riWhFo83mSOIvvw4Az2FvTrvFkxAtiAyYIZ2xU2CUIgwjqLMB/jnDL
	TmDSqs2mWve2pifiTqVVG7F7ZEubrN86xtpTDUNhEvslcC4DqAXfu0IAIgjsl6Ug9neJuwIY/pp
	yg76+ZJFYtLh7kFV6uDLL3anFQjJ6GOtvJmwzgiHpHGGSDIzOVH48c2F9pHhlQTMO+CIrBL586j
	H4nr/eM8EzkkP5HQSdoq+stFusgBLfZ35ybTaHg/EiRD4Yz+FDq6zsvGYdgGmxvUjYVo0ufcMgf
	qnDgpPZQnvz0MysMQoaVWI+vAk1Vu8MQlxI2Qal8Kd/oHJF2OaY
X-Received: by 2002:a05:600c:3f12:b0:499:7a4f:d13d with SMTP id 5b1f17b1804b1-499aa199777mr251546475e9.4.1787240931584;
        Thu, 20 Aug 2026 08:48:51 -0700 (PDT)
Message-ID: <b64ee197-3186-47ed-89b1-5cdeec1c0cff@suse.com>
Date: Thu, 20 Aug 2026 17:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/23] x86/cpu: report SMX, TXT and SKINIT capabilities
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
 <be993e757550b69a6f94f89476ba71131b434741.1785668458.git.sergii.dmytruk@3mdeb.com>
 <7489d730-6e91-4d6f-a355-4eaa62698c4c@suse.com> <aob9xUZF12IJhLRz@MjU3Nj>
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
In-Reply-To: <aob9xUZF12IJhLRz@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787240932-1E27A757-FF3C8412/0/0
X-purgate-type: clean
X-purgate-size: 4394

On 20.08.2026 15:14, Sergii Dmytruk wrote:
> On Tue, Aug 18, 2026 at 02:08:48PM +0200, Jan Beulich wrote:
>> On 02.08.2026 15:09, Sergii Dmytruk wrote:
>>> From: Michał Żygowski <michal.zygowski@3mdeb.com>
>>>
>>> Report TXT capabilities so that dom0 can query the Intel TXT or AMD
>>> SKINIT support information using xl dmesg.
>>
>> Hmm. I first meant to ask: In how far is this extra logging useful,
>> especially as long as we don't use the features just yet? And only then
>> I noticed that I must have paid too little attention here already in v3.
>> Querying through "xl dmesg" is entirely unreliable. Sooner or later the
>> boot messages will scroll off of the ring buffer. Making this a
>> query-able interface also would mean we can't alter any of the messages,
>> should the want/need arise.
>>
>> For AMD the situation is easy: It's part of the featureset / CPU policy
>> exposed via sysctl. The same is true for SMX on Intel, but the further
>> GETSEC output requires some other means to communicate. I wonder whether
>> making this part of the CPU policy would make sense, or whether to
>> introduce a Dom0-only hypervisor-CPUID bit for it, or whether yet
>> something else would be best here. Likely Andrew will have had thoughts
>> on this long before ...
> 
> I'm not aware of anything relying on this output.  It's just for making
> this information more accessible to users that may be wondering if DRTM
> has a chance of working (e.g., if hardware supports it and firmware is
> properly configured).  The wording may be unfortunate (and needs a fix
> anyway), I can change it to
> 
>     Report DRTM-related capabilities to enable checking for them in dom0
>     using `xl dmesg`.  This targets debug and diagnostic use cases.
> 
> if that helps.

Yes, please. Provided we need this separate output at all. Furthermore,
if we need it, wouldn't it better be adjacent with other extended VT-x /
SVM features?

>>> @@ -620,6 +625,49 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
>>>      }
>>>  }
>>>
>>> +/*
>>> + * Print out the SMX and TXT capabilties, so that dom0 can determine if the
>>> + * system is DRTM-capable.
>>> + */
>>> +static void intel_log_smx_txt(void)
>>> +{
>>> +    unsigned long cr4_val, getsec_caps;
>>> +
>>> +    /*
>>> +     * Run only on BSP and not during resume to report the capability only once.
>>> +     */
>>> +    if ( system_state == SYS_STATE_resume || smp_processor_id() )
>>> +        return;
>>> +
>>> +    printk("CPU: SMX capability ");
>>> +    if ( !test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
>>> +    {
>>> +        printk("not supported\n");
>>> +        return;
>>> +    }
>>> +    printk("supported\n");
>>> +
>>> +    /* Can't run GETSEC without VMX and SMX */
>>> +    if ( !test_bit(X86_FEATURE_VMX, &boot_cpu_data.x86_capability) )
>>> +        return;
>>> +
>>> +    cr4_val = read_cr4();
>>> +    if ( !(cr4_val & X86_CR4_SMXE) )
>>> +        write_cr4(cr4_val | X86_CR4_SMXE);
>>> +
>>> +    asm volatile ("getsec\n"
>>> +        : "=a" (getsec_caps)
>>> +        : "a" (GETSEC_CAPABILITIES), "b" (0) :);
>>
>> Nit (style): Bad indentation, missing blanks, unnecessary \n, and stray colon.
>> Overall:
>>
>>     asm volatile ( "getsec"
>>                    : "=a" (getsec_caps)
>>                    : "a" (GETSEC_CAPABILITIES), "b" (0) );
>>
>> I further question the need for volatile here. (Like for we have for CPUID, we
>> anyway may want to gain a getsec() wrapper for GETSEC.)
> 
> I think `volatile` was added just because it doesn't hurt, rather than
> because it's necessary, so it can be dropped.  Can add a wrapper, but
> there is only one use so far and a generic wrapper will have to use
> 64-bit parameters (`GETSEC[EXITAC]` sets RBX).

Well, if it'll remain just one use, maybe indeed too early for having a
wrapper.

>>> +    if ( !(cr4_val & X86_CR4_SMXE) )
>>> +        write_cr4(cr4_val & ~X86_CR4_SMXE);
>>
>> The clearing of SMXE here is pointless, as the if() already guarantees the bit
>> to be clear.
> 
> This statement restores the value stored in `cr4_val` (see above).
> Maybe should name the variable `old_cr4_val` or `orig_cr4_val`.

Naming wasn't my point here. My point was that masking off a bit that's
already off is pretty clearly useless code.

Jan

