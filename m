Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C14606A332
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FYAplkPh
Received: from list by lists.xenproject.org with outflank-mailman.1480092.1684034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPHO-0006GG-Jp; Mon, 09 Nov 2026 13:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480092.1684034; Mon, 09 Nov 2026 13:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPHO-0006G9-Gi; Mon, 09 Nov 2026 13:19:22 +0000
Received: by outflank-mailman (input) for mailman id 1480092;
 Mon, 09 Nov 2026 13:19:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQPHM-0006G2-MY
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:19:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQPHL-002tJC-OE
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:19:19 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c853-2eae-0a2a0a5409dd-0a2a4502c308-24
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:19:19 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c857-6ca4-0a2a45020019-d155dd34d8ff-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:19:19 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-490c1d337d8so606612f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:19:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7efb272f5sm241662115e9.15.2026.11.09.05.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:19:18 -0800 (PST)
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
        d=suse.com; s=google; t=1794230359; x=1794835159; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Zx8UACefTraWTRj47RXGAOfPy/dMTVuymF/oIiT1sQ=;
        b=FYAplkPhwmgTKdCyGFKgGbo/mPz/bOOB+s6QfGdTUZhAcqbzitxYTUtKXrSXWgHqu5
         UxrB+oaaxtIeoaA3fVqawEIOJMlClc8IFCA8Pd7p8xywnpvMtJtfV1Lh+i9SywZz1mes
         B5tJlHTjr9T/fkxx4My/2NoGIEomfSu7ZNnXMh+n/3W6sBTmEc+Ah2UOh7jj8bEVntui
         yrRbGlfGEPF/kvS0cnY94fVesFKSVmDF8y3eEgQi8oBdXEBk7M0rrFysX+XMvJ7IZkmg
         Wys/BcnLIDNSuKqkA11KERHYTPmrh5JBmJncQuP8cl07Vfauh/9OVcVTMJOZRZ33Jlei
         OUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230359; x=1794835159;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Zx8UACefTraWTRj47RXGAOfPy/dMTVuymF/oIiT1sQ=;
        b=ntzSiGXJMoUZ2Ebq1OeSc8+n4a2UZvlSfRGpzcwd+tXNq11M44nrN7k7VDoFI33GLv
         DIERQuOGrJUbfFVnGRosEVWvlrYbeYORgzhDu0AsbG8VvDDxcDrNB1NeizLvjNnxflOD
         jYgMrj7nyYu6+i+g7Fg7qCy6N+m1LnWKIyuJf+vgehS9z5JG7n+NVjcr4FYtLwTaDUVr
         RLIMamy+HaIPO0Kk7KrbD2AEN9rCUK03AyRAS0S0xIVW58bzLpKmCiEr65zD6E3SpUZa
         VeufoaSYrDSkqeVyPsGUSPBH/3mlxd398cGasUkHZ92CdnApaq5mi8oWUIRj/sPDjw0o
         qnrw==
X-Gm-Message-State: APuU4Z8gG7J9cODaKwFcXG7pe6qL2mMIFmRjQ+YWDHwRFsO2+H68cIfF
	3Bhxfl0rpRYquUiJqUCJo1/NbzNCyqiKmljpbfbmrwH1zdPlsXDQUdPgm3KswfzG5w==
X-Gm-Gg: AYBFou1SCX3jmCWbL/Pxn8srEO5S0+z+PqwrhXiMbc/CwZL/LdSjQdmYZ2hF+5tquCU
	SDvKqk/w/MulBc1XERqRyAEABjKWXwmtf+XtaZlWVVcldN/rg++LHygB0fNuxQ4HxkRPiHjym3g
	YdXMa5o94AGFZchW3fdmc3p4VzM0THxpBtuyr40cdpkS2XUPJ6ic/X/WiCwXH9oS1Zkd4GW+k67
	QTjctKUpG6wQur6B8X0fNFPQZpuNF8hUiW3M8sdEjMShfLSY7KfKX4g5snRLcCrY3za6CNUXKnG
	IM+90LKeIlMPU74m/G/PsQNj54+joIydHK4xgjxHsJfA9sHZRfRDre26ym+GHqb3SFzzttu8Ntk
	zs285lqM5rl5+7Tv9hTewWRGq54nbm3w6iJOi/FSHhJFouX5N/mtMRm1Kmk0zenXUl1d64h8XwM
	z+hNSOt8XBwdYVauYdgEZ9OjCr4Tkjgn0NDgLeXlQrjFJwDZSjcu/gCJM2gntT8YFv5aLi+b0iA
	yZ0wQGdX61R9DZki4paPziLAvw/F0uTRcFNj95taVRL1tgoXSTtn23QskV/Ogy17VtCSNtf+7t9
	I+Xkx5eplPvGJ7mzsa/s0nsotrsV057dWXoWWZ8eNUmTFiNwK6+sb8bOcdqz55uTxfOgl90c87+
	CznNi25dxzZbd7C0=
X-Received: by 2002:a05:600c:4e87:b0:4b8:fdd8:f2c9 with SMTP id 5b1f17b1804b1-4b963c8b968mr70699065e9.35.1794230359015;
        Mon, 09 Nov 2026 05:19:19 -0800 (PST)
Message-ID: <abc874bc-a74b-434f-a741-be17bcf87da6@suse.com>
Date: Mon, 9 Nov 2026 14:19:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: compile out __set_fixmap_x() when not needed
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <575ae8b4-4541-4537-90af-b5bfea2ae68b@suse.com>
 <72b9f0c1-94d0-4e87-bcc3-d1c49baead0d@suse.com>
 <629945f7492fbb65d1378ea05d1cf43d@bugseng.com>
 <26698add-7103-4d64-84ff-af40ac9c4fe8@suse.com>
 <866c42195d447dcf1e7ad1192645020c@bugseng.com>
 <70b2744a-a75b-4375-91ef-0d1c8a4ec807@suse.com>
 <4e4da00684a134616cbb697ea71c62cc@bugseng.com>
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
In-Reply-To: <4e4da00684a134616cbb697ea71c62cc@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794230359-662A92AC-662B4CA6/10/78276251493
X-purgate-type: spam
X-purgate-size: 4137
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 13:51, Nicola Vetrini wrote:
> On 2026-11-09 13:35, Jan Beulich wrote:
>> On 09.11.2026 11:50, Nicola Vetrini wrote:
>>> On 2026-11-09 10:04, Jan Beulich wrote:
>>>> On 07.11.2026 08:23, Nicola Vetrini wrote:
>>>>> On 2026-11-03 12:28, Jan Beulich wrote:
>>>>>> On 03.11.2026 10:42, Jan Beulich wrote:
>>>>>>> Only HYPERV_GUEST has a need for an executable fixmap, so with 
>>>>>>> that
>>>>>>> option
>>>>>>> unset __set_fixmap_x() (and l1_fixmap_x[] in turn) is unreachable.
>>>>>>> Address
>>>>>>> this Misra rule 2.1 violation by introduction ofa new FIXMAP_X
>>>>>>> Kconfig
>>>>>>> setting.
>>>>>>>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>> ---
>>>>>>> Why is __set_fixmap_x() not found by Eclair as a rule 2.1 
>>>>>>> violation
>>>>>>> in
>>>>>>> the
>>>>>>> x86_64-amd job?
>>>>>>
>>>>>> Same question actually for both functions converted to static by 
>>>>>> [1].
>>>>>> This
>>>>>> apparently being a wider problem, are we (again / still) having an
>>>>>> issue
>>>>>> with the scanning of the linking steps?
>>>>>>
>>>>>> Jan
>>>>>>
>>>>>> [1]
>>>>>> https://lists.xen.org/archives/html/xen-devel/2026-10/msg01537.html
>>>>>
>>>>> It was a Xen project decision not to consider for R2.1 functions 
>>>>> that
>>>>> are never referenced: you can see in
>>>>> "automation/eclair_analysis/ECLAIR/deviations.ecl". Of course that 
>>>>> is
>>>>> reversible and I am in favour of not hiding those violations, but 
>>>>> the
>>>>> rationale for the justification that was given is that the compiler
>>>>> will
>>>>> indeed DCE those:
>>>>>
>>>>>     * - R2.1
>>>>>       - The compiler implementation guarantees that the unreachable
>>>>> code
>>>>> is
>>>>>         removed. Constant expressions and unreachable branches of if
>>>>> and
>>>>> switch
>>>>>         statements are expected.
>>>>>       - Tagged as `safe` for ECLAIR.
>>>>
>>>> For the cases at hand (and then likely many more) the compiler 
>>>> doesn't
>>>> DCE
>>>> anything. Imo the wording here is completely bogus. It may say "If 
>>>> the
>>>> compiler implementation guarantees ..." Which it might do for static
>>>> functions, but aiui without LTO it never will for non-static ones.
>>>>
>>>
>>> I'm not saying the configuration is good as is. Ideally that should be
>>> removed or restricted to static functions and the likely newly present
>>> violations triaged.
>>>
>>>> Then I'm also puzzled by the deviations.ecl entry:
>>>>
>>>> -doc_begin="The compiler implementation guarantees that the 
>>>> unreachable
>>>> code is removed.
>>>> Constant expressions and unreachable branches of if and switch
>>>> statements are expected."
>>>> -config=MC3A2.R2.1,+reports={safe,"first_area(^.*has an
>>>> invariantly.*$)"}
>>>> -config=MC3A2.R2.1,+reports={safe,"first_area(^.*incompatible with
>>>> labeled statement$)"}
>>>> -doc_end
>>>>
>>>> First - these are two different deviations, and hence imo should be 
>>>> two
>>>> separate entries. More important here though is that I can't connect
>>>> the
>>>> two config= lines to the deviation of unreferenced non-static
>>>> functions.
>>>> There's nothing "... has an invariantly ..."  or "... incompatible 
>>>> with
>>>> labeled statement ..." there? How would the full diagnostic for an
>>>> unreferenced global function (or data item) look like?
>>>
>>> These two have nothing do do with functions never referenced indeed: 
>>> the
>>> rule is about unreachable code in general, of which functions that are
>>> never called is just a subcase.
>>
>> Yet then in your earlier mail which part of deviations.ecl did you 
>> refer
>> to?
>>
> 
> Sorry, I assumed I had pasted it [1], but forgot:
> 
> -doc_begin="Some functions are intended to be not referenced."
> -config=MC3A2.R2.1,+reports={deliberate,"first_area(^.*is never 
> referenced$)"}
> -doc_end
> 
> this bit specifically is about both static and non-static functions

Oh, I see. Since this deviation is unspecific as to static / non-static,
I didn't think it was the one relevant here.

Jan

