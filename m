Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9281BC79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 06:50:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410599.1641406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3TBF-000088-Hz; Mon, 07 Sep 2026 06:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410599.1641406; Mon, 07 Sep 2026 06:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3TBF-00007w-FI; Mon, 07 Sep 2026 06:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1410599;
 Mon, 07 Sep 2026 06:50:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3TBE-00007q-IY
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 06:50:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3TBD-005jgi-Ih
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:50:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e5e9d-2eae-0a2a0a5409dd-0a2a450a9f68-26
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 08:50:11 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e5ea2-f2d2-0a2a450a0019-d155dd2fd9d5-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 08:50:10 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-485850cf499so1929152f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 23:50:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485881353e8sm26571417f8f.1.2026.09.06.23.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Sep 2026 23:50:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1788763810; x=1789368610; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jC8PUEm3nmVLXH+bG8ipMslzXTkwRKCB7LVcNscwLPw=;
        b=X5F+8pM5EyMRAEBdKLv6P1oEcnmE4O4LkFpet1Qz/WEnnrWHC3tuOh0RJTw+7UuS1z
         uJMnqGAr9iiHE/6CaDkF7fSWU4K+UMFS2MR1PgbTTjy/KxFdg4IG7WsByrug+HDJQ0RA
         mVuXfleMMYj9XZ9PSoh55/DLQqvxI5U6i+8KtECcP7YlXf0pagFubKhiEkRKOkwtv5kN
         eJYuiO/ta+2mT6MsqZOS7tHVAFRH1FYcmsEu0jD/ktis8wnejdyDscpHRW9gF6JJumvl
         hDD9wbngWRj0MT2Hy2XZAcECAzsa+Eb7OSHcw9o6je7m0N6jZBqFwC0nBRyVfIcXQr6t
         Im/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763810; x=1789368610;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC8PUEm3nmVLXH+bG8ipMslzXTkwRKCB7LVcNscwLPw=;
        b=OUGm9+jdQNRij5sv4ucEJOrjpQXiix4+sVeSUsFSpJ9X267xaFkqkk0ujKCbIYWw5f
         L4O84cSakCcyYAyHHk1e40V0xQDslUfHO2kl24b0qiAZnyHs+9Vz5+xPw1wemPcd5v0P
         XhlSR4vS5KPQboLRMGpWujSHJj9NupGzy30HPIH3W0MDEjvyUSgDag6aGNmQ4hBrnz9I
         zrFT9VmG/XjMY0ma67fiS5HTCrNpUsbD6rFr3MCeTyPuigMG7jhlpOV47zf2ftj/dh0l
         cvYzpBV98g7UrQprDixwZLnZjDj5HKLbnleDm23eDZom2sNpWonlNdEWhrbZlLkxLgGJ
         3DsA==
X-Forwarded-Encrypted: i=1; AKwUvBygryGJXs61Paj5mgCOs5pxXXWDhx0w0tB3suLZXyzW2RAu24h6h29RDwvo+gVh6SqkCWB0mbY1EaU=@lists.xenproject.org
X-Gm-Message-State: AFuF++lqKq5bLIRxlpr1/biw1l1M8dqqQwtK+xmUaOMz5+6JfSFkCFTQ
	37vgzlCcLRtxFAdK2FxYIlCqNryE43CbMcerGr0llfLxKIGtrazv287CoW7Fs7GcOQ==
X-Gm-Gg: AYBFou31G77PD+cDjGHPewatepEh8vYBJkI0ikqt4J7nTFdxpH/b3XXCz/MT+PlCLW+
	d/a9xYBvy6A8rDflYzHxWd1UbnrueoFDLoLEwoO7tdr1C6h96Y8jqOsqlIBlGNHzt/RN/5gKI44
	3s/LcYfoefFs8CCO/ptovBbapJKgilAWTmVXY5t+JAEqhQw9wHNlGc204WliSmd909BZYct+k2k
	yD7p/zKVERpgH+B+CcOhqDiocSSWr/tBZrIz5UecgezERmZpnea9ieUEEx0sJ6Rl6xP1pO5gCdZ
	msKaxhBvL/ymJfotMGexYB/Vn5cIipU9NixEbS+tNpvzQcOe7qxlazRZbAaqKD0/sIYpX7wEZqg
	4bSWttS/rKymfipmDYykUQvM8za+/63csh8n15dosWLazxjaey/lTSQjyraBbmZlKhFA68d8WB/
	wJwGE9XOiz/hD6MwosGA1j0exIWSn+MlgKFpe+sRf/mVDTClzcloIZEJG4L7C6TQ50qyK6rMoDv
	zOEeSNDXQ5Qn+VBlRJ7glL9zmI7x0mo+MoD7RxXGHJOKZRCr4KZXhAeZwJ9MGQ=
X-Received: by 2002:a05:6000:2287:b0:485:8c17:975c with SMTP id ffacd0b85a97d-4858c179908mr16994029f8f.30.1788763810080;
        Sun, 06 Sep 2026 23:50:10 -0700 (PDT)
Message-ID: <586da975-bd71-4305-a17e-cd5ba35995a4@suse.com>
Date: Mon, 7 Sep 2026 08:50:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 roger@xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <d9512f79-a05c-447b-98c5-7dfb14ef5347@suse.com>
 <20260906131117.3121334-1-abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <20260906131117.3121334-1-abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788763810-589C9CFC-5849B29F/0/0
X-purgate-type: clean
X-purgate-size: 9537

On 06.09.2026 15:11, Abdelkareem Abdelsaamad wrote:
> On 26.08.2026 15:33, Jan Beulich wrote:
>> On 23.08.2026 18:11, Abdelkareem Abdelsaamad wrote:
>>> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
>>> debugging complications, security and performance implications. The APM
>>> volume #2 15.20 (40332-Rev. 4.10-July 2026) states the two possibilities that
>>> result in a VMRUN exit with VMEXIT_INVALID due to the injected event. These are
>>> • Reserved values of TYPE have been specified.
>>> • TYPE = 3 (exception) has been specified with a vector that does not
>>>   correspond to an exception (this includes vector 2, which is an NMI, not
>>>   an exception).
>>>
>>> Extend the VMCB validation to check for such inconsistency.
>>>
>>> The collection of the invalid exception vectors are ported from the upstream
>>> KVM commit
>>> ("7e79f71bca5c" KVM: nSVM: Add missing consistency check for EVENTINJ). Adjust
>>> the checks from the commit to align with the APM Volume #2 and Volume #3
>>> (40332—Rev. 4.10—July 2026) for the X86_EXC_OF and X86_EXC_BR vectors which
>>> should not be valid on the x86 64-bit (long mode) platforms. The adjustment is
>>> posted to the KVM mailing commit patch thread
>>> https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/
>>>
>>> Injecting the vector X86_EXC_HV is also found to trigger VMEXIT_INVALID with
>>> the Xen hypervisor. Drop the X86_EXC_HV vector from the permitted vectors.
>>
>> Is this matched by anything in the PM? There is "#HV is only allowed to be
>> injected into VMSAs that execute with Restricted Injection." Which suggests
>> #HV can be injected, but only under a certain condition. Following what
>> Teddy said towards v3, this may want expressing by a separate case block
>> also returning false, but having a comment.
> I will put it separately with a comment in v5.
> Regarding the APM question: the manual does not appear to fully document
> generation-specific or microarchitecture-dependent constraints for all the
> vectors.

And there was no request to add conditionals going in that direction. Checks
want to be against feature or enable bits, wherever possible.

> Some vectors are only valid starting with the specific CPU generation
> that introduced the corresponding feature. To verify the hardware behavior, I
> am performing case-by-case testing on 64-bit Windows guests. I inject the
> various events at the end of svm_vmexit_handler and see the result:
>  - If it triggers VMEXIT_INVALID, the injection is invalid.
>  - If it triggers a triple fault, the event passed the hardware checks and 
>  completed the event delivery. It is valid.
> I am testing this across a Naples (older) and a Genoa (modern) platform. For
> the X86_EXC_HV, I am consistently getting VMEXIT_INVALID. I will update the
> code comments in v5 with the testing matrix used and the findings.
>>
>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>> @@ -320,6 +320,44 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>>      svm_dump_sel("  TR", &vmcb->tr);
>>>  }
>>>  
>>> +static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
>>> +    uint8_t vmcb_injected_vector)
>>> +{
>>> +    switch ( vmcb_injected_vector )
>>> +    {
>>> +    case X86_EXC_DE:
>>> +    case X86_EXC_DB:
>>> +    case X86_EXC_BP:
>>> +    case X86_EXC_UD:
>>> +    case X86_EXC_NM:
>>> +    case X86_EXC_DF:
>>> +    case X86_EXC_TS:
>>> +    case X86_EXC_NP:
>>> +    case X86_EXC_SS:
>>> +    case X86_EXC_GP:
>>> +    case X86_EXC_PF:
>>> +    case X86_EXC_MF:
>>> +    case X86_EXC_AC:
>>> +    case X86_EXC_MC:
>>
>> Is #MC valid to inject without CR4.MCE set?
> The testing I performed (see previous comment) does not show that set CR4.MCE
> is required for the valid injection.

I find this worrying. Roger, any chance you could try to find out whether
that's perhaps more an erratum than intended behavior?

>>> +        return true;
>>> +
>>> +    case X86_EXC_OF:
>>> +    case X86_EXC_BR:
>>> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
>>> +
>>> +    case X86_EXC_VC:
>>> +        return vmcb_get_sev_es(vmcb);
>>> +
>>> +    case X86_EXC_CP:
>>> +        return vmcb_get_cr4(vmcb) & X86_CR4_CET;
>>
>> ... e.g. here. That is, if a CR4 (or other) check is needed here, but not
>> for #XM (or #SX), that's surely worth (briefly) commenting upon. The more
>> that, afaics, none of this is spelled out in the PM.
> In my testing, the hardware behavior differs across the generations support for
> the Control-flow Enforcement Technology (CET):
>  - Naples (No hardware support): Injecting the event when the feature is
>    completely unsupported by the CPU results in VMEXIT_INVALID. The VMCB's CR4
>    bit is not set as it is expected.
>  - Genoa (Hardware support exists): If the CPU supports the feature but the
>    guest has not enabled it in CR4 (not opted-in), injecting the event
>    results in a triple fault. I am accordingly checking for the CPU feature and
>    report it as invalid.

A guest triple fault, I assume? I'm not entirely convinced this is a sufficient
indication of injection being permitted, even though I agree it very much looks
so. Then again, like above, I'm also unconvinced this is actually intended
behavior. Guests unaware of a feature (and hence not enabling it) should never
observe exceptions related to only that feature.

>>> @@ -330,6 +368,12 @@ bool svm_vmcb_isvalid(
>>>      unsigned long cr4 = vmcb_get_cr4(vmcb);
>>>      unsigned long valid;
>>>      uint64_t efer = vmcb_get_efer(vmcb);
>>> +    uint8_t vmcb_injected_type = vmcb->event_inj.type;
>>> +    uint8_t vmcb_injected_vector = vmcb->event_inj.vector;
>>> +    uint8_t vmcb_valid_event_inj_types_mask = (1 << X86_ET_EXT_INTR) |
>>> +                                              (1 << X86_ET_NMI) |
>>> +                                              (1 << X86_ET_HW_EXC) |
>>> +                                              (1 << X86_ET_SW_INT);
>>
>> The absence of X86_ET{_PRIV,}_SW_EXC likely wants a brief comment, as that's
>> a peculiarity of SVM. Alternatively how about introducing X86_ET_SVM_ALL (or
>> some such) as a #define somewhere?
> I thought the mask varibale name is sufficient? I am also fine with the #define
> but it will be a one time usage. What is your suggestion?

I gave my suggestion. The variable name I, personally, consider too long
anyway.

>>> @@ -392,6 +436,20 @@ bool svm_vmcb_isvalid(
>>>          PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
>>>                 vmcb->event_inj.raw);
>>>  
>>> +    if ( !vmcb->event_inj.v )
>>> +        PRINTF("eventinj: valid bit is not set (%#"PRIx64")\n",
>>> +               vmcb->event_inj.raw);
>>
>> I understand the parentheses in the log message here. Yet ...
>>
>>> +    if ( !((1 << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )
>>
>> If vmcb_injected_type really could take all possible uint8_t values (see
>> below), this shift would be at risk of becoming UB. And uint8_t is a
>> stronger hint that all possible values may appear than unsigned int is.
> I am OK to change to unsigned int for safety with future possible extensions.
>>
>>> +        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
>>> +               vmcb_injected_type);
>>
>> ... what purpose do they serve here (and below)?
> I did it just to go with the previous format but I am OK to drop in v5.

You did notice the difference in message type, though? Where parentheses
are used in existing messages, the values put there serve as auxiliary
information to the wording used. Whereas here you plainly dump a value,
without saying what exactly is wrong (that's actually said by the value
dumped).

>> +    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
>> +         !is_valid_injected_exception_vector(vmcb, vmcb_injected_vector) )
>> +        PRINTF("eventinj: Invalid exception type: (%#"PRIx8") vector: "
>> +               "(%#"PRIx8") for the platform\n",
>>
>> Does "for the platform" really add any value? With it dropped, the
>> whole format string could also go on a single line (which we generally
>> prefer).
> My point was to give an expressive hint as the injection combination can be
> invalid on one platform/mode but valid on another (for example, #BR injection
> triggers VMEXIT_INVALID in 64-bit long mode but is allowed in 32-bit mode). The
> CPU generation also matter as outlined before.

I fear I don't see how this explains the extra words used.

>> Finally a more general comment: svm_vmcb_isvalid() is used solely out of
>> nestedsvm.c. I hence think it would better move there, and such moving
>> would better come ahead of adding more code (which would then also need
>> moving).
> This is a point that needs to reach a consensus between you and Teddy. In the
> v3 review, Teddy commented to expand the use of svm_vmcb_isvalid() by calling
> it within svm_vmexit_handler() when exit_reason == VMEXIT_INVALID. If I follow
> Teddy's suggestion, the function needs to stay in a shared location. Otherwise,
> the function will be kept, as is, strictly for nested SVM usage and moving it

Well, my comment was based on present code. If you follow Teddy's suggestion,
my comment would simply become inapplicable.

Jan

