Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBEE606A320
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D1qNKqTA
Received: from list by lists.xenproject.org with outflank-mailman.1464289.1674987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMLyZ-0001zz-BY; Thu, 29 Oct 2026 08:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464289.1674987; Thu, 29 Oct 2026 08:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMLyZ-0001zr-7K; Thu, 29 Oct 2026 08:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1464289;
 Thu, 29 Oct 2026 08:59:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMLyX-0001zl-Vt
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 08:59:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMLyX-009bTZ-5W
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 09:59:09 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae30ace-8faa-0a2a0a5109dd-0a2a450aeb24-44
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 09:59:08 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae30adc-f2d2-0a2a450a0019-d1558031f0b3-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 09:59:08 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so20387815e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 01:59:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3a1csm33608215f8f.16.2026.10.29.01.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 01:59:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1793264348; x=1793869148; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZQtcNrTJaB+om9tfnseHVGXrK//mv/mnohM85AGg0c=;
        b=D1qNKqTA9ghUmjhoO3asXRKUpM3FIqT67fdhyA9z7BHQqvw+zHiH611lHHbSrszed8
         5c/rTMsdLVtpkJMjeR3xn/d2AbrNYOhc+HH8DEmvh8oZNTKZUvccjnaijTq/0YiWJuhR
         kBpWh+Soyx7wyU3w2a6SVsKDIlUdzSjnmyY3T7V+ZkFWb7EsTM4FC+fjcy2o9/B1rKsP
         DVLt2xVSvZy6KZASLxVRMnXaIFZrUYn4kwCIBrIMH2UIg/TqrUhsp3WHKcm9a/IXv5s0
         tXPUX0I0JUetSrLA2mKRyVNXurvAHLtdk0adEriNxjQb9fzX67GpyMRUtQaGxmD9ORGc
         IfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264348; x=1793869148;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZQtcNrTJaB+om9tfnseHVGXrK//mv/mnohM85AGg0c=;
        b=OZD7xczcts+Wd0dI4AFvv6VuacHalScr0X6w2sHPbBU/WxVRc/VOrypXb0EL6LJGKT
         gtDhtthaD7JAPzZUKSabonsipWVSz+br5Q56RNHLi+LtU8xbdcvysW3EvFKcP5JThzNb
         SepmpLXshP1qu+hnXSb9mN/xb0F6BYnbpjGy0Wb4dm0NQlx1ky18gByBry3hwmwCXTnf
         s1o03OKYn56qooYi8yN6K9f25kQkv7YqJOKuEOOvGlFTxIU6/NqNlZtcKYjtTEBI5W4D
         HuHeDfywEhHZjS8eQRT0/FDR60RX9Zwvi5o0H1BuiQoKhNMgKx0kXjEtwDqyNl4+36XT
         zv9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxLSsnJc1tvKUyYBSAPMA8zvThj2LuS4dhmsZQq510Tm2nPyEilp2sPtq0yrc3YwOJSNlk1zziT/WM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIHPM/JL7NKDsqF8uZ4B8IaakeVi6GukHZlFPHsf4SuK5RUkHrT
	v1vHk10tGoRUJpgXzUsizJhd9tsye3QbiekPBmFkhGvTo+IBRpzwe4dH0xjQBd5GEw==
X-Gm-Gg: AYBFou3Sg73vJ9OTBIvWUDBnA/u0y5UCb+AGSHvoUb7VRpkpezXvyVOH+o7Xb+GTzx1
	hpoYJiswgGhEFaAsEpBHV9Ot7j7yd4tsch7NyvWYcUIDmSPxMeu9F/DNUGW+K7Ea7eGW0pqaXN3
	cPRs5oqKGOxdfGn3MocZ8AlygcAukGToEYdYN3EtpCMMj7o68ftYqlBqWqo08Jp9I/1KDKlVyMa
	azLdeo0zTPpkN4f2Wk3WpzTj8hhP3W2Y4mrXBrK/w62PHaPELCX87xkiy1/QL8ZQNPevfT7pHIc
	8lHRhNgVlkAXjTJxJTFFPEcQvU3bAhk5IyB3qubY1UqbP67fi4/Kfz2rBzHPKSb9jTVoBxIO/90
	Y+Pw3PbJ93sgLCD2FSF6MNX1y+AKEdSQvyjmvvwmRgCxEUhZV0WGRN/uMVjdGs1xUbvaHiTP2nM
	1NAblbwcpDEds40JGL0LIipRE3Ch04BD7VnhGdrfZEZunZKyp+PVdFfUYATzOpuyATVBO1twpNR
	iVNsBJqOWhQDntuSK84jz1Q4kO2C+F8OkpGUY4d0rXhKm2AOsLhABJdLT+eJchUTBMFsW/mVXKc
	GZrLYjlvlDzkjQogXxWK9ywKGCbC6v9/Tb7LRGm525J14Qv/t779aCd2B3mj/yAO1NtuHm4cwSg
	fAg3oJ+C46hbEg3KNYQ==
X-Received: by 2002:a05:600c:83c5:b0:4a8:c6a0:c08f with SMTP id 5b1f17b1804b1-4a967e8c05emr121912425e9.35.1793264348353;
        Thu, 29 Oct 2026 01:59:08 -0700 (PDT)
Message-ID: <bd8c0480-ebd2-4259-8691-c6792917f62a@suse.com>
Date: Thu, 29 Oct 2026 09:59:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] misra: merge the two R14.3 invariant-condition
 deviations
To: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20261026030309.2507461-1-shuaidong.chen@amd.com>
 <67e298cd-3b84-4476-9dd3-607e505effe6@suse.com>
 <321e7082-5cd2-4a41-9c49-ff091d9ceade@amd.com>
 <DMFI88UUOAJ7.19ST79GRB5D7H@amd.com>
 <67f91d71-5692-4c07-a834-f282daaebd5a@amd.com>
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
In-Reply-To: <67f91d71-5692-4c07-a834-f282daaebd5a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793264348-595C3CFC-1EAFE6A8/10/78276251493
X-purgate-type: spam
X-purgate-size: 6950
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29.10.2026 06:30, Chen, Shuaidong wrote:
> 
> On 10/27/2026 5:14 PM, Alejandro Vallejo wrote:
>> On Tue Oct 27, 2026 at 9:18 AM CET, Chen, Shuaidong wrote:
>>> On 10/26/2026 9:14 PM, Jan Beulich wrote:
>>>> On 26.10.2026 04:03, Shuaidong Chen wrote:
>>>>> MC3A2.R14.3 ("Controlling expressions shall not be invariant") is
>>>>> deviated by two separate entries.  One covers 'if' statements and
>>>>> conditional operators and places no restriction on where the invariant
>>>>> condition comes from.  The other covers 'switch' statements, but only
>>>>> when the controlling expression is a 'sizeof' operator.
>>>>>
>>>>> The rationale recorded for the two is the same: the condition is
>>>>> deliberate.  Nothing about a 'switch' makes an invariant condition less
>>>>> deliberate than the same condition in an 'if', so the 'sizeof'
>>>>> restriction reads as an artefact of that entry having been added for
>>>>> read_atomic() and friends in arch/x86/include/asm/atomic.h rather than
>>>>> as a considered limit.
>>>> Well,
>>>>
>>>>       if ( 1 )
>>>>
>>>> can make sense, especially when 1 is the expansion of e.g. IS_ENABLED().
>>>> Otoh
>>>>
>>>>       switch ( 1 )
>>>>
>>>> doesn't make a lot of sense, even when it's as a result of the expanding
>>>> IS_ENABLED(). I agree that limiting to just sizeof() is unnecessarily
>>>> strict; alignof(), for example, should about always be usable where
>>>> sizeof() is. Yet making if() and switch() equal is imo going too far. I
>>>> realize though that it may be difficult to find a suitable boundary.
>>>> Stefano - do you possibly still have notes from the discussions long ago?
>>>>
>>>>> Fold switch_stmt into the general entry and drop the 'sizeof'-restricted
>>>>> one, which the general predicate now subsumes.  Invariant 'switch'
>>>>> conditions that are not a 'sizeof' become deliberate as a result; that
>>>>> is the intent.
>>>>>
>>>>> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
>>>> What you don't say at all: Does this help with any remaining violations?
>>>>
>>>> Jan
>>> Yes, and let me give the full context, since the motivation comes from
>>> downstream safety work rather than from the upstream analysis.
>>>
>>> On safety branch one of the techniques we rely on there is to pin build-time
>>> configuration to compile-time constants, so that the code which the
>>> intended configuration can never reach is removed by the compiler
>>> rather than merely left untested.  That matters for us in two ways:
>>> code eliminated at compile time does not enter the coverage
>>> denominator, and - more importantly - it is not in the binary at all,
>>> so it does not have to be carried through the whole qualification
>>> chain.
>>>
>>> Two examples:
>>>
>>> https://gitlab.com/amd-xen-safety/xen/-/commit/160dac43f554733a68d83c38cc1d0e73b3b7bff0
>>> https://gitlab.com/amd-xen-safety/xen/-/commit/e0eccfa7184b7acee23916cd5cb2a3b5afa101f2
>>>
>>> A side effect of this is that some of those constants end up as the
>>> controlling expression of an switch statement, which then
>>> trips R14.3.
>>>
>>>   > Otoh switch ( 1 ) doesn't make a lot of sense
>>>
>>> Agreed in the abstract, and I would push back on anyone writing that
>>> by hand.  But that is not what happens here.  The sources still read
>>>
>>>     switch ( gt->gt_version )
>>>     switch ( opt_bootscrub )
>>>
>>> exactly as upstream wrote them, against what upstream intends as a
>>> runtime-variable value.  The constant only appears after a build
>>> configuration specialises that value.  So the construct is not a
>>> pointless switch on a literal; it is ordinary upstream code that a
>>> particular configuration has made invariant - which is precisely the
>>> situation the existing 'deliberate' deviation for if statements and
>>>
>>> conditional operators already covers.
>>>
>>> Of course the other alternative: rewrite those switches as
>>> if/else chains, which the existing deviation would already cover it, and
>>> the violations gone. Technically that works.
>>>
>>> The reason I would rather not is that it is churn in common code for no
>>> functional
>>> reason, carried indefinitely as a delta against upstream, and it makes
>>> every subsequent rebase of the safety branch more expensive.
>>>
>>> Having seen that a deviation for switch already exists - restricted to
>>> sizeof - extending it to switch in general seemed the smaller and more
>>> honest change: it states that an invariant switch condition is
>>> deliberate, just as the project already states for if and for the
>>> conditional operators.
>>>
>>> -Shuaidong
>> To build further on this. add_sized() is one such case (already covered
>> by the disappearing exception. There are existing cases in the upstream
>> tree where this is or will be the case, but due to their being inside
>> macros become invisible to Eclair.
>>
>> Or my (still not resent) cpu_vendor() series, I rely on placing
>> X86_VENDOR_X constants as invariant expressions in switch statements.
>> Even if nothing does it today, MISRA would be prohibiting constification
>> of any global that happens to go in a switch for no particular benefit.
>>
>> IOW: This isn't about hardcoded values, it's about IS_ENABLED() gating
>> and DCE.
>>
>> On the specifics of the patch, it's not exclusive to switches. I'd much
>> rather see it extended to for loops as well.
>>
>>      for ( unsigned int i = 0; i < NR_MAX_FOOS; i++ )
>>          ...
>>
>> Where having NR_MAX_FOOS be zero is effectively a guard on the whole
>> loop. Today we need explicit early IS_ENABLED()-gated exits to keep
>> Eclair happy on some such statements, and that's just strictly worse.
>>
>> Shuaidong had to recently fix these violations in our tree because the
>> spirit of the existing exception is needlessly exclusive to "if"
>> statements.
>>
>> Cheers,
>> Alejandro
> 
> Yes, as Alejandro described, some DCE techniques have been adopted in 
> safety to meet the coverage requirements for safety certification. 
> However, this inevitably introduces code or macro patterns that can 
> trigger violations of this rule in some cases.
> 
> The current deviation for this rule is unnecessarily narrow. If 
> extending it too broadly would have an excessive impact, we could also 
> expand it incrementally to cover specific cases as they arise.
> 
> For example, this patch could initially extend the deviation to switch 
> statements only. That would already be a reasonable improvement over the 
> current situation, where only if statements are covered.

That is what the proposed patch does, isn't it? Personally I keep thinking
that this is what is going too far. Extending to while() and maybe for(),
otoh, would be okay with me, I think. Albeit infinite loops and do/while
already have "built-in" exceptions.

Jan

