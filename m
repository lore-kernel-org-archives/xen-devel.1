Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF115606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Af1i9WZH
Received: from list by lists.xenproject.org with outflank-mailman.1461295.1672283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKDl-0003in-B5; Mon, 26 Oct 2026 12:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461295.1672283; Mon, 26 Oct 2026 12:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKDl-0003ig-7y; Mon, 26 Oct 2026 12:54:37 +0000
Received: by outflank-mailman (input) for mailman id 1461295;
 Mon, 26 Oct 2026 12:54:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLKDk-0003ia-Kz
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:54:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLKDk-00DGVw-1U
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:54:36 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf4d8b-bab6-0a2a0a5309dd-0a2a450781a8-0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:54:35 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf4d8b-b4ea-0a2a45070019-d155dd32a4eb-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:54:35 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48df0fa43c5so1883681f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 05:54:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e542ed998sm1467706f8f.13.2026.10.26.05.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:54:35 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793019275; x=1793624075; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBiyLP//XSZ4+Wyu2aKcsffqK+m6lmydk2jU1KnCmPE=;
        b=Af1i9WZHM9laXYnGqpqbb6FWY0M1RQ+Jpb0Ooh8+E4jX5AF27NheeC1A42aR/diAcp
         DcoGIAW7DKdkmF8H+zO0gnqzajsuyT0we3QXQGguo/eApwFKrXi4uDyXo97ayCxyEduG
         Ml3jBm2TMyfhKTnc62bUtbySf/OvmKsrIHXC4Wpw7uPaL+1oryvh0AQsYkHzIfxBvmKw
         Exa0n8KrPnp/7JdzycE/Vj84aqaFrph8cfeb1fo57RZ5QknbLHMaPFXuycug2SJLhtAF
         Mf8dwYoryv5qfZ7j0XUySIPgpME1DdyjVLebp/wzhN8D1KDOaxesHKqRGgWQg2q2RW+i
         W0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019275; x=1793624075;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBiyLP//XSZ4+Wyu2aKcsffqK+m6lmydk2jU1KnCmPE=;
        b=Ya0ZPbEv+qbwWzPAjPkdUuiruCSeKgssu3uALqOERwef+Q8PuHfn7YP1y/gVdWhvx9
         QybLLaTiOQ9LTUFjrg3XrJsdYiRDKg48LUkqHpFVneNouJBEfR5F9ktc2OaDyEpBK/6j
         /3LTNfwuha3DPaMdKLWyZDmI1PZrJbZAejLCn78sIxVMqoqKb2BWD33qv4h12MAUhQGf
         MFuAYdJKN3CgTytMeB2jQHSbxDda2Cc38dVpU/KLDSvg727x0rsbodtpGyGr8sCSo8Ax
         yWv2yC5lumFHGo419v39TRZ22z/0heGQwz/u9uf8jdjb9XpC3OM0nvXRat4kNHvB+4xK
         Wb7A==
X-Forwarded-Encrypted: i=1; AKwUvBxB9UzlvMh9UIZiwzm9XKXjh2cFTe3QtbhxM/EdGHYbrlJ9ye8a1oqpGSiPXW8q+Ld/ZumNUMwcjAc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKXVviEPKN6NDZTrhttSDbfeGPr64ym/CWPRC0+srz42KgUJiB4
	wxV9BC+W5eG0Gik6kp4H4x9bdqRxBihpnZvZ5k0O/gK720l94ykxP8CfQgOqX9/21A==
X-Gm-Gg: AYBFou234PbxvUvRStGA9HdnGhsgh1+w6AJBC1CWj138JONGezr1KfrwP7CjatilQXe
	lV2RjUhLVLnCYtPY4irdCaoyXECpAKHdUA4V64vtwwBoCHbXant7Gap8LNg4qhP0t46foMmtDLd
	lnQQHITbpFDQDCVSxzxNrJvJurj4Bopz15wOWZ99kVEsd4qeW4li4RYS5MgKLjvbfWhDdAMrj2B
	gFCKR6c6Eq71ihshlwKQ29muCv+SMAdUkqBa9Z6SNZkMpOLI2+HaLqsEorlA+SOqOKsSyujMk9h
	uQujuErb3ssoKU5ci+bVUA6uOM99v3GAnSq0qH5vaFNSxT4ue91gNxO+1ETxJA7YIV1N4UloF0z
	yGVjWzOaY8vNj6w8BJeINdDOyM4qhZjhMkJvg0itOMt+weRPTc1EKVAd1dMhKP70moJk2XlnRLT
	NlsQTtJh9tZ3HWyd6wXkcYATV1RGTHQY0tma/d71WX8gpw0nPDsTcqV7+aaOsjeUxUUttazcA7P
	fOD7pLTF+WQSZMReDof118wC6hSog8PLtCiSwz3f2CQP1veXMjlPYXHPicJaCWSpsdMfBwgFgHC
	FKC6VWIAPAAadyz4xnp6u0ivn+kDgL+O7qfjEoi9B+hkRikE43TXBRtNcfxeum7e
X-Received: by 2002:a05:6000:240e:b0:48d:f4ef:62e7 with SMTP id ffacd0b85a97d-48e3eab73b1mr14981130f8f.0.1793019275267;
        Mon, 26 Oct 2026 05:54:35 -0700 (PDT)
Message-ID: <4fcb71df-a0ec-48bb-90e7-a073c06b05f3@suse.com>
Date: Mon, 26 Oct 2026 13:54:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86/svm: Apply the virtual-8086 IOPL check to INT n
 only
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech
References: <20261020224123.3710391-1-stefano.stabellini@amd.com>
 <86d6b7b5-41f2-41b4-8710-7356c78fd15e@citrix.com>
 <192c430b-565b-4b89-957b-01b80ede9049@citrix.com>
 <2f51c577-86b9-2d20-2032-f9d56b344f47@kernel.org>
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
In-Reply-To: <2f51c577-86b9-2d20-2032-f9d56b344f47@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793019275-A4CCFAE4-576B6596/10/78276251493
X-purgate-type: spam
X-purgate-size: 4338
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22.10.2026 22:29, Stefano Stabellini wrote:
> On Thu, 22 Oct 2026, Andrew Cooper wrote:
>> On 22/10/2026 2:55 pm, Ross Lagerwall wrote:
>>> On 10/20/26 11:41 PM, Stefano Stabellini wrote:
>>>> In virtual-8086 mode with IOPL < 3, INT n raises #GP(0).  INT1, INT3
>>>> and INTO are not affected. They are delivered normally.
>>>>
>>>> svm_emul_swint_injection() applies the check to all of them, so an ICEBP
>>>> raises #GP instead of #DB.  It also reports the IDT entry in the #GP
>>>> error code instead of 0.
>>>>
>>>> Limit the check to INT n and use error code 0.
>>>>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>> ---
>>>>   xen/arch/x86/hvm/svm/svm.c | 5 ++++-
>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>>>> index 71e48351f2..df74531d1a 100644
>>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>>> @@ -1153,9 +1153,12 @@ static void svm_emul_swint_injection(struct
>>>> x86_event *event)
>>>>        * 32bit OS.  Someone with many TUITs can see about reading the
>>>> TSS
>>>>        * Software Interrupt Redirection bitmap.
>>>>        */
>>>> -    if ( (regs->eflags & X86_EFLAGS_VM) &&
>>>> +    if ( type == X86_ET_SW_INT && (regs->eflags & X86_EFLAGS_VM) &&
>>>>            MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
>>>> +    {
>>>> +        ec = 0;
>>>>           goto raise_exception;
>>>> +    }
>>>>         /*
>>>>        * Read all 8/16 bytes so the idtr limit check is applied
>>>> properly to
>>>
>>> I think this is correct. The check could perhaps move earlier to avoid
>>> needing
>>> to reset ec to 0.
>>>
>>> I do wonder though if there are other cases in the function where ec
>>> needs to
>>> be reset to 0? The pseudocode in the APM seems to have at least one
>>> other case.
>>
>> I confirmed, and indeed it is #GP[0] not #GP[sel].  Also that
>> ICEBP/INT3/INTO are not subject IOPL like this.
>>
>> I agree with Ross that this wants moving earlier; between the CR0.PE
>> check and deciding idte_size.  The comment also wants adjusting, so I
>> think it wants to look like this:
>>
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index 71e48351f22c..c83b28d29727 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -1140,6 +1140,17 @@ static void svm_emul_swint_injection(struct
>> x86_event *event)
>>      if ( !(vmcb_get_cr0(vmcb) & X86_CR0_PE) )
>>          goto raise_exception; /* TODO: support real-mode injection? */
>>  
>> +    /*
>> +     * In vm86 mode, INT $N is subject to IOPL.
>> +     *
>> +     * TODO: It is also subject to CR4.VME=1, which would require
>> reading the
>> +     * TSS Software Interrupt Redirection bitmap.
>> +     */
>> +    if ( type == X86_ET_SW_INT &&
>> +         regs->eflags & X86_EFLAGS_VM &&
>> +         MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
>> +        goto raise_exception;
>> +
>>      idte_size   = lm ? 16 : 8;
>>      idte_offset = trap * idte_size;
>>  
>> @@ -1147,16 +1158,6 @@ static void svm_emul_swint_injection(struct
>> x86_event *event)
>>      ec = (trap << 3) | X86_XEC_IDT |
>>           (type == X86_ET_PRIV_SW_EXC ? X86_XEC_EXT : 0);
>>  
>> -    /*
>> -     * TODO: This does not cover the v8086 mode with CR4.VME case
>> -     * correctly, but falls on the safe side from the point of view of a
>> -     * 32bit OS.  Someone with many TUITs can see about reading the TSS
>> -     * Software Interrupt Redirection bitmap.
>> -     */
>> -    if ( (regs->eflags & X86_EFLAGS_VM) &&
>> -         MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
>> -        goto raise_exception;
>> -
>>      /*
>>       * Read all 8/16 bytes so the idtr limit check is applied properly to
>>       * this entry, even though we don't look at all the words read.
>>
>>
>> I'm happy to adjust this on commit if you're happy?
> 
> Yes please, thank you!

Can we also have
Fixes: 897d59a426f1 ("x86/svm: Introduce svm_emul_swint_injection()")
then, please?

Jan

