Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0414AF8A172
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2026 12:57:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1283415.1565651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMHS-0005Oe-1q; Thu, 16 Apr 2026 12:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283415.1565651; Thu, 16 Apr 2026 12:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMHR-0005OW-To; Thu, 16 Apr 2026 12:57:13 +0000
Received: by outflank-mailman (input) for mailman id 1283415;
 Thu, 16 Apr 2026 12:57:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDMHQ-0005OQ-IX
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:57:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMHP-00629T-VT
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:57:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0dc9e-2eae-0a2a0a5409dd-0a2a4501d44e-34
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:57:11 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0dca7-c1f2-0a2a45010019-d1558034d58b-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:57:11 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488ba840146so78836505e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:57:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3d5eb4sm13802027f8f.20.2026.04.16.05.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 05:57:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776344231; x=1776949031; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TDo7cuQygxrsMfzbryWP7R/0NuH1eJzyHF47V5ZWVwo=;
        b=Su7p7JnbLM9c6LIawrrHoGKLqlzjVEgiktOBMClvjdzzHehcyNbk2zTM4jSE+cSfke
         anQZJ3rwhiLSs2k98TbV3PQOrsLUvgAg6lhRAmBRNAVPIe44eLv8ipZ4lbXafQ0lEh+J
         UL+8K4Vf3xPbfS1WMpZ8XlHi6cw25S2oGcLmhMx5Q1Vs+S9oLQ7bpkDsHo9lnVaW26XA
         bOF9ssyStX5Y7VvYerDT+JvZmhvzT73BIeP7CE73mMJnTZzCDhRr00qKT1GatD5HGw6q
         7x1UzZFm5OgpzlW3DabXAa0y9dMF1LptyRkmWZAMiIlOoPiN67MytBkx5qi43WLzoDtd
         m4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344231; x=1776949031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDo7cuQygxrsMfzbryWP7R/0NuH1eJzyHF47V5ZWVwo=;
        b=eOA1Akj59LTSuA2yodoWOkqfNr9mSszdFJBO2NKqTskvMI/MKUhDGvnWBt5gdSRrg4
         Z1/7DRNT80x9hoAUjTywLqfzUlFY20fX5aTxHhcbYDcApWFLo5KfFSqMuQZJsRnd57MT
         kuSR+931UFr5Lifius3/2xoUf3VZ8Dcne+efX3Aadjj4N2upTLSchQ4WBCktJMkmZiWU
         XBuzENDhUMFf9IlGdyNp6Pt744gpK+SWBn5fJyT7+3kZwd5uIFu4q2ik+rV/ojVo8nEe
         i4cavAgsaXB4qC/lJ61kptC2r6Hb68Idwnhz/FqA8uco1ouYiIebnfZPosU7wWXOHxGN
         k8iw==
X-Forwarded-Encrypted: i=1; AFNElJ9REXZlOk7EIaw6rOMG2rBf/eyKJy9aUt3G6Py8nDcgnyyCUNXS5uX6CHCPzhH31MAq617LHhzLtho=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvpfyfoeweHdO8NaPPl9j5dJcBKd7w8ZX0QygUrm9Wgui+lMmP
	ERFgI5ZAr1Dql5+HOmbTj9tQRFMSGG4s+FtsH6oqF7i/SnvC32uMtZgigPzxUD3M7w==
X-Gm-Gg: AeBDies8l8Qa+Qi6GhkXkQm50PieJK+2JafhXk9pjHTkbsVrKA8fTY/YpHpmpCQd4gH
	n4UejvO92QwtJfR1lh9EoHAvowmwA4236sJdKV+tmi4UnqOSESeKF70lJVJVNoOLga9PPA81P4D
	kAk9zK4jf9YT3wfKfL9XMAiichoIqAlPj7qGrVsT4kYWdo23alc5aY38jRlRHJR/mAei7RiqI7b
	l9qGuWoe6kethUDDIVkhnu9gwOhx09MwC/mja7Jik6Rn0zwez4Yn5u8Pra0BhEHgWfAlvn7f+1d
	OL1ZzvLPXM4ZeQ3QFpBmoAU1bOKHdx6yXUdorb17LUnju7vkjtwCsCFPMgMgVqcFkXFsiWMC5RE
	ASYGr86WF+jLBE4jStfLrwBleeOI0baQsgBu7JhRHRuragsItcvWtSKvw0d5ILNQB3tHyn55o1H
	fZTY+MJViezyqWq0Qh/0foYw2OjTGC4zhTPeFEcWIPt9S3m5oLIbOqsjwmT4mR6yvAgNYfkMtcj
	BKeM1kK7U+yk1cpjRfNIYUWOQ==
X-Received: by 2002:a05:600c:350c:b0:488:9661:2570 with SMTP id 5b1f17b1804b1-488d67ce8c2mr354093825e9.8.1776344231125;
        Thu, 16 Apr 2026 05:57:11 -0700 (PDT)
Message-ID: <9efe1ae9-8064-4793-90c9-2e16c64f75bd@suse.com>
Date: Thu, 16 Apr 2026 14:57:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/time: use native TSC scaling factors when TSC is
 not scaled
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260414103327.7420-1-roger.pau@citrix.com>
 <20260414103327.7420-2-roger.pau@citrix.com>
 <f424bf3a-0113-4c66-b165-8dae82817f24@suse.com>
 <aeDbZZA-asNJ3Gci@macbook.local>
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
In-Reply-To: <aeDbZZA-asNJ3Gci@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1776344231-BD66FFF4-307BC43C/0/0
X-purgate-type: clean
X-purgate-size: 3685

On 16.04.2026 14:51, Roger Pau Monné wrote:
> On Thu, Apr 16, 2026 at 01:28:11PM +0200, Jan Beulich wrote:
>> On 14.04.2026 12:33, Roger Pau Monne wrote:
>>> When running HVM guest in native TSC mode avoid using the recalculated vTSC
>>> scaling factors based on the cpu_khz value.  Using the kHz based frequency
>>> leads to the TSC scaling values possibly not being the same as the ones
>>> used by the per CPU cpu_time->tsc_scale field, which introduces skew
>>> between the guest and Xen's calculations of the system time.
>>>
>>> On a 2gHz system, where the frequency is possibly detected as 1999999999Hz
>>> (note this is a worse-case scenario), the cpu_khz variable will be set to
>>> 1999999kHz, and hence 999Hz cycles will be not accounted for per second.
>>> Over a second (the time synchronization period), this leads to a skew of:
>>>
>>> cycles * 1 / (Hz freq) = 999 / 1999999999 = 499,5ns
>>>
>>> So far this has gone unnoticed because the time synchronization rendezvous
>>> forces the update of the tsc_timestamp and system_time fields in the vCPU
>>> time info area, and hence the skew only accumulates up to the rendezvous
>>> period.  Attempting to remove the rendezvous causes the skew to grow
>>> unbounded.
>>>
>>> Fix by using the native TSC scaling values (as used by Xen) when the guest
>>> TSC is not scaled.
>>>
>>> Fixes: eab8a90be723 ("x86/time: scale host TSC in pvclock properly")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> I'm worried about the usage of cpu_khz beyond simple printing it for
>>> informational purposes.  Overall I think it would be safer to store the
>>> frequency in Hz, as to avoid losing the least significant digits.
>>>
>>> In any case, that's a different change.
>>
>> I'm not quite sure - improving accuracy is of course a good thing, but will
>> we ever be able to do any such calculations error free, when already the
>> detected frequency isn't exactly precise?
>>
>>> --- a/xen/arch/x86/time.c
>>> +++ b/xen/arch/x86/time.c
>>> @@ -1710,17 +1710,25 @@ static void collect_time_info(const struct vcpu *v,
>>>      else
>>>      {
>>>          if ( is_hvm_domain(d) && hvm_tsc_scaling_supported )
>>> -        {
>>>              tsc_stamp            = hvm_scale_tsc(d, t->stamp.local_tsc);
>>
>> This is a potentially imprecise calculation. How likely is it that its result
>> will indeed ...
>>
>>> -            u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
>>> -            u->tsc_shift         = d->arch.vtsc_to_ns.shift;
>>> -        }
>>>          else
>>> -        {
>>>              tsc_stamp            = t->stamp.local_tsc;
>>> +
>>> +        /*
>>> +         * HVM guests using the native TSC ratio should use the same per-CPU
>>> +         * scaling factors as Xen.  This ensures time keeping is always in sync
>>> +         * between Xen and the guest.
>>> +         */
>>> +        if ( tsc_stamp == t->stamp.local_tsc )
>>
>> ... exactly match t->stamp.local_tsc? Don't we possibly need a (small) error
>> margin? (In which case of course the next question would be: How to establish
>> such a margin?)
> 
> hvm_scale_tsc() has:
> 
>     if ( ratio == hvm_default_tsc_scaling_ratio )
>         return tsc;
> 
> So when using no scaling the input value is the output value, and
> hence tsc_stamp will match exactly t->stamp.local_tsc.

Ouch. I did look at the function, but managed to have all my attention drawn
to the asm() there. I'm sorry for the noise. As it's strictly an improvement:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

The other, earlier remark remains applicable, though.

Jan

