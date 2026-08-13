Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114ADC5DF66
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 10:45:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389765.1630397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSvb-0007qt-9k; Thu, 13 Aug 2026 10:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389765.1630397; Thu, 13 Aug 2026 10:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSvb-0007qm-6j; Thu, 13 Aug 2026 10:44:51 +0000
Received: by outflank-mailman (input) for mailman id 1389765;
 Thu, 13 Aug 2026 10:44:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuSvZ-0007qa-W8
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 10:44:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuSvZ-002pM6-Ch
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:44:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7da00e-e002-0a2a0a5209dd-0a2a4509b3b2-36
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:44:49 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7da020-be1a-0a2a45090019-d1558029b490-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:44:48 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4998590d392so307735e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 03:44:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49982121649sm52334015e9.1.2026.08.13.03.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 03:44:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1786617888; x=1787222688; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UonC9YJvP/LKADLtGvllmu1ErX663GL20fYvqcpJvLQ=;
        b=BUippESn3HD/odUZYNhLTq/4qiqvYE/BewoFLnoHGD1kXXyPmvgURXc5iLp9stnEea
         MxQBYiYm/uHpq8stG9gpl/hQem0/vyZXpGBFcLDdztvxx3shsnPV/EwrYx30BKj0B5ba
         AUj0zzHzVxFvX3U27QRylyIcnFujwmNDRXZWRDUKarb+17W/FaibvZeDefRtDqRYg7Rs
         ek/vxsujIraJdXLalZ/lalq3gy70DQKXdmvvFLARv2qwD71OLlkPAxamAvHp1fxQxyT0
         uh2ddQfrsoB8ppDiYaPbnIQxiVoNqcBTQtZtw+ev5RYZzH3KkqSfBDmTe9gajxUQ8Z/8
         8dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786617888; x=1787222688;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UonC9YJvP/LKADLtGvllmu1ErX663GL20fYvqcpJvLQ=;
        b=CelkqWyjHBladysv1sbF2sRhRx3TnSuVyv5aBsAE7JoRJNSPAPoBCjoX6wflFtNuq4
         T2nHSwR8zesxsjBJqbl1AphN/zPn8henUq+g1+gHD9ryGS97jnxQ7m5nLUzikeiTGt5N
         nDzx+iU83v4RiQgQNIsUS37jzJTKQTItctnFdstYU+2MS/grTpLatNu91YMh0LSFWClE
         s7iQJSUJlNHnNpxpWcl/sFm89hPCfH99hduJWHqRoZJ5Ja6FBAu2RFJQCXc1XvHMHk2q
         0Mf7qVBBWCZd6tZ3iKa99iV3FsiQgUK6+R69285/vXDMBGbSoP/yU4dfC01o/dHpgwlB
         eKoQ==
X-Gm-Message-State: AOJu0Yzr4ta7aoy1m442midb6XO7MRnPLxQKi/8vn+K6ck72/jgwraaE
	PBkNnfpS9LmK5q6OL6l9qOj9srcb1Kg7yRpLmzAwVy9J8CZn5PhPaJDe63QxpkzwHA==
X-Gm-Gg: AR+sD12dpRLgZbQtwjrY4uOooDMX7wd0maO3EM1SkxxFMvjYpuDNSqaicazE55eZoO2
	uYVughDYQ2vwznbnQpMz4FkXU0nRzL+IGX/AzT7Fw3zOhEWharKTw/tU2H9J+zHrEApukaCfq83
	SoRj6KGPV8RSODHdQ7eoDtHUOICRABSMjUZtPKmVz5d7GW40apJSYtGqN7yQPJq/XcGA09uJWQ+
	2bED0yPVB5itgOYTTjy5K7p1JfmZWliI+EWpHoSEKpihNiuKWvbtFtMJ8J8y73g9v/4ep0me+5o
	imfgH5nTo9SvlHRQeHqlHMLPei5fWFGhEvXigNPbgwilcOZCFR9fPowbkjAFgjqqxxpTnTRi9NW
	GbCS6r0GxB411daZdPGN35rMspa6t0UApvX9CKX4WqSRV/Y1ZV9ccVxVO8Z4WFVOe1O1sq3CNEY
	jDALoIvlBdvLQlRHpIg4+8xZXzmVCPQrhhh7lPXepmlifcPtqwsmvx/q/r36crPJAB6J3BtfI2L
	UkLNHzsZHhCbBXYJeaRiuU8qtnqu5F+ybEy/1qF/777lV1rE92A
X-Received: by 2002:a05:600c:5494:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49983f10706mr25110665e9.9.1786617887020;
        Thu, 13 Aug 2026 03:44:47 -0700 (PDT)
Message-ID: <a88930bc-e11a-4da1-b545-9474b5295d84@suse.com>
Date: Thu, 13 Aug 2026 12:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786613430.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@vates.tech>
 <9724c838-6713-4f29-89ab-54f50ec4fe8e@gmail.com>
 <82011389-489e-4076-9d3a-8c393e4a8e76@suse.com>
 <bf2c9455-dd88-444a-8a94-a3a519d951e2@gmail.com>
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
In-Reply-To: <bf2c9455-dd88-444a-8a94-a3a519d951e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1786617888-BD2CC034-B93389E2/0/0
X-purgate-type: clean
X-purgate-size: 3499

On 13.08.2026 12:22, Oleksii Kurochko wrote:
> On 8/13/26 11:51 AM, Jan Beulich wrote:
>> On 13.08.2026 11:34, Oleksii Kurochko wrote:
>>> On 8/13/26 11:30 AM, Baptiste Le Duc wrote:
>>>>> --- a/xen/arch/riscv/imsic.c
>>>>> +++ b/xen/arch/riscv/imsic.c
>>>>> @@ -20,6 +20,7 @@
>>>>>    #include <xen/init.h>
>>>>>    #include <xen/libfdt/libfdt.h>
>>>>>    #include <xen/macros.h>
>>>>> +#include <xen/rwlock.h>
>>>>>    #include <xen/sched.h>
>>>>>    #include <xen/smp.h>
>>>>>    #include <xen/spinlock.h>
>>>>> @@ -418,6 +419,28 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>>>>>        return res;
>>>>>    }
>>>>>    
>>>>> +void imsic_state_save(struct vcpu *v)
>>>>> +{
>>>>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>>>>> +    unsigned long flags;
>>>>> +
>>>>> +    /*
>>>>> +     * SW interrupt file always has ->vsfile_pcpu = NR_CPUS so nothing specific
>>>>> +     * should be done in this case.
>>>>> +     */
>>>>> +    if ( !vcpu_guest_file_id(v) )
>>>>> +        return;
>>>>
>>>>
>>>>> +
>>>>> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>>>> +    imsic_state->vsfile_pcpu = cpuid_to_hartid(v->processor);
>>>>
>>>> How will you detect a migration is needed? Don't you need to first know
>>>> if ->vsfile_pcpu is different to cpuid_to_hartid(v->processor)? (I
>>>> didn't take a look to other patchs for the moment, so the
>>>> explanations might be later.)
>>>
>>> Migration (if you are speaking about migration of vCPU from one pCPU to
>>> another) is completely different path. Look at sched_move_irqs().
>>
>> See how terminology is important. As said elsewhere, "save state" and
>> "restore state" don't make clear at all in which situation they're to be
>> used.
> 
> I totally agree that it is important.
> 
> Just to clarify it now (before I started to re-shuffle and/or adding 
> extra patches to have better context how this functions will be called) 
> I will add some information here. So imsic_state_save() and 
> imsic_state_restore() is going to be called from context_switch() 
> function when one vCPU is de-scheduled and new vCPU is scheduled (so no 
> migration here at all, yes it could happen but it is still a separate 
> path and so separate question). Considering that my understanding that 
> during context_switch() I have to save state of IMSIC which corresponds 
> to vCPU which is going to be de-scheduled and restore a state of IMSIC 
> of vCPU which is going to be scheduled.
> 
> With the current context is imsic_state_save() and imsic_state_restore() 
> are correct names?

No. "save" and "restore" would best be limited to migration paths (migration
of guests between hosts, that is). I can only once again suggest that you
look at existing naming in the code base. You'll find e.g.
svm_ctxt_switch_from() or vmx_ctxt_switch_to() under x86/hvm/.

>> Also, can both of you please adjust Roger's email address when replying?
> 
> Could you please clarify what is wrong with it? For example, in this 
> patch series:
>    [PATCH v2 0/2] vpci: allow unaligned accesses by the hardware domain
> 
> This one is used: Roger Pau Monne <roger@xenproject.org>

Whereas in your mail it was still Roger Pau Monné <roger.pau@citrix.com>.
When you originally posted the series, that was still correct. But in the
meantime it has changed (and I expect sending mail to the old address
wouldn't reach him anymore).

Jan

