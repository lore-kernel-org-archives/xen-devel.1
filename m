Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2890FC982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 16:01:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427724.1650524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gSA-0002ES-Jf; Mon, 21 Sep 2026 16:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427724.1650524; Mon, 21 Sep 2026 16:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gSA-0002EL-Gc; Mon, 21 Sep 2026 16:01:14 +0000
Received: by outflank-mailman (input) for mailman id 1427724;
 Mon, 21 Sep 2026 16:01:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8gS9-0002EF-Jh
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:01:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8gS9-0079oW-0V
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 18:01:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab154c8-bab6-0a2a0a5309dd-0a2a450a9bd4-4
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:01:12 +0200
Received: from [74.125.225.103] (helo=mail-wr2-f39.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab154c8-f2d2-0a2a450a0019-4a7de1678076-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:01:12 +0200
Received: by mail-wr2-f39.google.com with SMTP id
 ffacd0b85a97d-482f633ece3so2452228f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 09:01:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724460898sm22720256f8f.9.2026.09.21.09.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 09:01:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1790006472; x=1790611272; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgQz7Jfd9wETL2veMKW7K1+Bq6adGZsDysw0mhmkPAU=;
        b=SU2ebhivthaKqb0jPiVEeOU5tpMJEgMdI7A+VrUJe18dAJQLBzZhqpQNq1P3reSqYP
         bYq+CEqfHH0LiA2NlaUvHS6sfsTRNnJuQPwNIoM0CiX0c+ctZoC1kOqsC5hXt1RwgfJa
         HL3bEZ3ydhneXNivGGkcPufdvpi28iLyuJxlZi1TY20TOjmtyw6imx7SCsOkRrbShwUa
         H4MHMwQ12/4LdqVnDdDqjWXyQIMAe7r6Pn2SvxUjDLZOBX9y4D8VVoQHFd3mlSN1csuC
         g43y/h/0bqn//riau0KFNVCj1puVXF5B7aCJ080CJMDFmddd8153R6sxYXFDlUpHqdkq
         IoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006472; x=1790611272;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgQz7Jfd9wETL2veMKW7K1+Bq6adGZsDysw0mhmkPAU=;
        b=dBA9v1etEPuIF8222i1+yV7osbG/qUZ32p6NzLWQWb5JoaAIHasv4b83sX5mPPKMsP
         OkS5F1hqYzf+Ku9qDvIjFW79bXY2iQiiad8pC1qQlaVRCGsaJnNdoNo6OvDy7EcN7IH3
         4mV8HU9cnQeQwyP/1Eu4SNXb0bcXdHjEqh6L33oKSP5Lma2JmfmOHdcDrta6VGqDb0Y3
         YGshZx9+YXAnfJUJItvUMFtNV1W0AUZfLLCqBWpvHOhWhGmvLThK9VYXxEQ4J0OTsdD5
         diD5OXG05jCniZNEcP32rtBUxEfYXtqX0OxKLMHq/p2/1g+fyBQHMP0r/ub1TaEymELM
         ahZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOVnJmWiZSAhCvH1LhCf1RSxnEiyBV0BkheACrl6HjiK7U3/xSsDAUtBibMvZqw/xpHLRsOmftbkQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++nKo3YoC8VhKH5Iw13FIv9Oev74RHnXfytiyWFdnBqk4hkMR3tw
	u4Tnm1HtS5KDlHruSc8gxtKGo3CuTGaVkJcV80DIBtpQDs5gwAY+FU0c9im8uyW1Cw==
X-Gm-Gg: AYBFou357O42unVCJCAlw8TJbp8W/UoUXP0/HpeOvZo8OiASZNG+RGAbmzLr74wJDqV
	OgEO/9RALZnRdZXJJ51fLcgUgvfVOLB6i/OL8ND1CB81NPOEJC6QhRXU0OiWjs3WDj1/tJPs9lT
	tlPwpY5SuZfHnSY4fbizPu3CZhEhx4KrVJ2ZxReHENZLM3qKRZweWnU+TK/OS1jQzvd0ZUWEJSh
	CA2qzNs4f31WWuK39qAaa2yUorQ7Smnan51LarXkdWzsBIQRd7JOKNdZUhTp2U8mKsyMia+zZf9
	cqQ6S2pmbWkqXLqiHns6kVLGzXQ8uG7QxFYVXQx740qFsOgnYqLYy8L4UGtgjhVK4lDA6K3gRiK
	GsPkUL+neKrncJvyGFdZYDfMD7rDXv1qbcM86E1GwbpT/YQ/EOsEY4XMAx/7/C6NYMZAbNAwGIK
	F6wNtxy+UWQ3s5ZYn7l5jNOrM9QSm/WsuZjurh9yBSbC4zR7IRZdE+Wz/4EDuOs+slzhO6oe9HQ
	JkP2fv49IWqfoCIslr3Ps6wHn0fqUMPsgkc4kjBEGkkWoRrGMSt8kKjGRJgUw==
X-Received: by 2002:a05:600c:3e06:b0:49e:8238:6feb with SMTP id 5b1f17b1804b1-49fc56daf07mr169600375e9.14.1790006472378;
        Mon, 21 Sep 2026 09:01:12 -0700 (PDT)
Message-ID: <f81efd12-4eab-4147-9e83-8d082a8ce163@suse.com>
Date: Mon, 21 Sep 2026 18:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <v4-586da975-bd71-4305-a17e-cd5ba35995a4@suse.com>
 <20260921155103.3243475-1-abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <20260921155103.3243475-1-abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790006472-53ED2CFC-0F5833FC/0/0
X-purgate-type: clean
X-purgate-size: 3207

On 21.09.2026 17:50, Abdelkareem Abdelsaamad wrote:
> On 07.09.2026 08:50, Jan Beulich wrote:
>> On 06.09.2026 15:11, Abdelkareem Abdelsaamad wrote:
>>> On 26.08.2026 15:33, Jan Beulich wrote:
>>>> On 23.08.2026 18:11, Abdelkareem Abdelsaamad wrote:
>>>>> +    case X86_EXC_OF:
>>>>> +    case X86_EXC_BR:
>>>>> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
>>>>> +
>>>>> +    case X86_EXC_VC:
>>>>> +        return vmcb_get_sev_es(vmcb);
>>>>> +
>>>>> +    case X86_EXC_CP:
>>>>> +        return vmcb_get_cr4(vmcb) & X86_CR4_CET;
>>>>
>>>> ... e.g. here. That is, if a CR4 (or other) check is needed here, but not
>>>> for #XM (or #SX), that's surely worth (briefly) commenting upon. The more
>>>> that, afaics, none of this is spelled out in the PM.
>>> In my testing, the hardware behavior differs across the generations support for
>>> the Control-flow Enforcement Technology (CET):
>>>  - Naples (No hardware support): Injecting the event when the feature is
>>>    completely unsupported by the CPU results in VMEXIT_INVALID. The VMCB's CR4
>>>    bit is not set as it is expected.
>>>  - Genoa (Hardware support exists): If the CPU supports the feature but the
>>>    guest has not enabled it in CR4 (not opted-in), injecting the event
>>>    results in a triple fault. I am accordingly checking for the CPU feature and
>>>    report it as invalid.
>>
>> A guest triple fault, I assume?
> Yes, that is correct. I meant a guest triple fault.
>> I'm not entirely convinced this is a sufficient
>> indication of injection being permitted, even though I agree it very much looks
>> so. Then again, like above, I'm also unconvinced this is actually intended
>> behavior. Guests unaware of a feature (and hence not enabling it) should never
>> observe exceptions related to only that feature.
> The testing, I performed shows the following behavior across the CPU
> generations:
>  - On CPUU generations that support the feature (e.g., Genoa supporting 
>    Control-flow Enforcement Technology / CET), the injection results in
>    a guest triple fault. If the the guest did not opt-in for the CET feature.
>    No VMEXIT_INVALID results by the injection.
>  - On older hardware generations that completely lack the feature (e.g., Naples), 
>    the injection immediately results in a VMEXIT_INVALID.
> 
> The current hardware behavior seems to depend on whether the underlying
> physical CPU understands the feature, rather than whether the guest has opted
> into it via CR4. The patch expands this to consider the injection will result
> in VMEXIT_INVALID if the guest did not opt into the feature.
> 
> Are you suggesting to reather explicitly check the CPU model/generation instead
> of checking X86_CR4_CET? For example, allowing the injection on Genoa platforms
> regardless of whether the guest has enabled the CET capability? I am concerned 
> that handling this via CPU model checks might introduce architectural edge
> cases and/or add maintenance complication—what are your thoughts on that
> approach?

No, I'm not suggesting to go by CPU model. That would be wrong in certain
migration scenarios, afaict.

Jan

