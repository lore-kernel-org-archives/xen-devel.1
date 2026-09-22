Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EBDC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:17:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428129.1650825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8toR-0006Qs-C6; Tue, 22 Sep 2026 06:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428129.1650825; Tue, 22 Sep 2026 06:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8toR-0006Ql-8t; Tue, 22 Sep 2026 06:17:07 +0000
Received: by outflank-mailman (input) for mailman id 1428129;
 Tue, 22 Sep 2026 06:17:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8toQ-0006Qf-M8
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:17:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8toP-008e8k-OC
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:17:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab21d50-bab6-0a2a0a5309dd-0a2a4503887c-40
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:17:05 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab21d61-fae8-0a2a45030019-4a7de18cfa5f-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:17:05 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso53037235e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 23:17:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862773ee0sm2354674f8f.6.2026.09.21.23.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 23:17:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1790057825; x=1790662625; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDy25AsiPQQ0/kOXjGObCG5owFOtemmkgGYA1xSR6mY=;
        b=NM3aVv0q0QphDegy/LRnuRSTSxAxFqDw4q/8dz4E9AIUCfcQanPfw2jVcL6tiqQh9G
         uFAITOOuj76BhR2HnjeCOOIBfCP6nMcefjLEOeL/kn1hhEIhzSR9F6j7pnO8aeKf886q
         BZYfGAjKNQPunISHENzSNXhzjBnTA+WZS6Tn+r2AuFi0++ecnLpammUIIkPAkuXha1TF
         KvhslKjW+Ac4qp4LOmNOy5dhENm9kYHhXV0dm2/iyergPZZzl8xK32VYxDTR82h0NujO
         LPP80oq6C0p1Q+3KdiixYugmjj/0WzIlKWPHTniEup0S0h9xZJ/d90sU5iQiP1apTsaU
         h/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057825; x=1790662625;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDy25AsiPQQ0/kOXjGObCG5owFOtemmkgGYA1xSR6mY=;
        b=CoTv5ZFFJb7qzSvoR1AMQiJmaAAuAoghSLQ7FkPbCGznk05tX+mACc1lyiRHmu4vFc
         lTBvEDVya13eWVprcaQDo/56ECvPO8QBqU3I9033eUSIfK40HGPDj411AmqvnoOyw/wQ
         eFpeoC4lw+jd40QhXKPl2IAJCyJyyu1V1uDSPXtyKdJ3j/BnFEODf+LLxahs49mBlCee
         X+NnBAhdb3ZmyB3owGIYAiUU+K3BvtOCy7n2xz7amoT6K3CbfZkIyvzeU5E2CWO7HBUR
         rdZSzkleTIHse0YNA741bCo2oOToKk54lCqSfmIQaZQ6x4YfeIKs+fAIMTLCatz4YJfr
         zz/A==
X-Forwarded-Encrypted: i=1; AKwUvBwxzaq8wPwzHCg60FigcOvCkgE+UZevyWoYS01vxlYkjweYlNb49ft/nFW8YcD5FeepZMOtQoVozl8=@lists.xenproject.org
X-Gm-Message-State: AFuF++lkUDpASSBoMkCwDz6RBtDShkIWf4rBDVkBW4NQBMXR38Pcq3uu
	WZFNv6ZRE5z1rNxIBIIDE5b+FsIHdOOymp2DLJo9//Tb9xxODLgdk+zIn6nucdT2/A==
X-Gm-Gg: AYBFou0/WpZuhmG7A8nCtm5NnBorXxOH1es8ZAEvcl45zxS0pa+fblm0API82BGGQa5
	x4ltYIc6+p4jW9KhrFtWelYhTBfMbD+zcquZZdRCP5akBd8QAm15qhPAKjRgmLXu7iB2ZGh9OT6
	TcwvqCITOjz/WV3nTDEQTPNgl04EdvvCrUV5X2r7QbynRKAsaqOFAnCWdVxWT7gq8IzYpm+64gI
	0dAsU19xgqRr2tkBgjD6I18uOoLnlUq3J/H2iqHpvaxABcVqI5SxK5Hw+1ipwL1G8c60d8H1h0b
	EKcLBRlRprCcC38m8l2FBihNRM2zz26vp/qgqd+/B43xHtawOICOtQOyeHexy2oJhW2M5msaLZ3
	FzPO7VL5UySGqmwB9M9/RDbrOQAsd4KDj/qRT9p4XVrcxLd9VRPhnNEmGj+PXcrF8KCpkk2jEQp
	39DUSlwTPce6dFcy8eqYZ0SDIyiAoFhou+vOCWZzDO1DZrZxEq18Ao6vfVjJDjqzc2VOhJsuSNQ
	ZyhXw96K6LYNaYX/+lVQ5c1bIjtZXAs7fKgNNx7Ja9Vj4+yEtUkXl3/sBSpGen97DYo6p76
X-Received: by 2002:a05:600c:3493:b0:49f:bd3c:bc21 with SMTP id 5b1f17b1804b1-49fc573b55emr175518145e9.28.1790057824830;
        Mon, 21 Sep 2026 23:17:04 -0700 (PDT)
Message-ID: <2be442bd-6f1c-4790-ba57-a98c481ab07f@suse.com>
Date: Tue, 22 Sep 2026 08:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <da4f1b40-b9a8-43d4-9b6e-bd666cfe7c0e@suse.com>
 <20260921170757.3244601-1-abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <20260921170757.3244601-1-abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790057825-6E8CD4E9-5213A339/0/0
X-purgate-type: clean
X-purgate-size: 2426

On 21.09.2026 19:07, Abdelkareem Abdelsaamad wrote:
> On 07.09.2026 08:36, Jan Beulich wrote:
>> On 06.09.2026 15:22, Abdelkareem Abdelsaamad wrote:
>>>>>> @@ -320,6 +320,44 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>>>>>      svm_dump_sel("  TR", &vmcb->tr);
>>>>>>  }
>>>>>>  
>>>>>> +static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
>>>>>> +    uint8_t vmcb_injected_vector)
>>>>>> +{
>>>>>> +    switch ( vmcb_injected_vector )
>>>>>> +    {
>>>>>> +    case X86_EXC_DE:
>>>>>> +    case X86_EXC_DB:
>>>>>> +    case X86_EXC_BP:
>>>>>> +    case X86_EXC_UD:
>>>>>> +    case X86_EXC_NM:
>>>>>> +    case X86_EXC_DF:
>>>>>> +    case X86_EXC_TS:
>>>>>> +    case X86_EXC_NP:
>>>>>> +    case X86_EXC_SS:
>>>>>> +    case X86_EXC_GP:
>>>>>> +    case X86_EXC_PF:
>>>>>> +    case X86_EXC_MF:
>>>>>> +    case X86_EXC_AC:
>>>>>> +    case X86_EXC_MC:
>>>>>
>>>>> Is #MC valid to inject without CR4.MCE set?
>>>> The testing I performed (see previous comment) does not show that set CR4.MCE
>>>> is required for the valid injection.
>>>>>> +    case X86_EXC_XM:
>>>>>
>>>>> As before: Doesn't #XM (AMD: #XF) require CR4.OSXMMEXCPT to be set?
>>>> The testing I performed (see previous comment) does not show that set CR4.MCE
>>>> is required for the valid injection.
>>> I meant ..does not show that set CR4.OSXMMEXCPT is required.
>>>>>
>>>>> Again as before: Is #SX really permitted without any constraints? You did
>>>>> reply to both comments on v3, but that outcome isn't reflected here. The
>>>>> more that what you said there could equally apply ...
>>>> The testing I performed (see the first comment) does not show that set CR4.MCE
>>>> is required for the valid injection.
>>> I meant ..does not show that any CR4 bit is required.
>>
>> And I didn't mention CR4. I intentionally said "without any constraints".
> I believe the Security Exception (Vector 30) is architecturally valid on AMD
> Naples (EPYC 7001) and Rome (EPYC 7002) platforms. Event injection of vector 30
> then does not require specific guest enablement I am aware of.
IOW another one of those cases where an unaware guest can be sent an exception
which may end up killing that guest? Hmm... Not your fault of course, yet still
problematic. May want making explicit in the description (maybe even a code
comment) then, I think.

Jan

