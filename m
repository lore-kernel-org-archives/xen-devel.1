Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE143606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ot+pmeSO
Received: from list by lists.xenproject.org with outflank-mailman.1481658.1685561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlPx-0002rI-95; Tue, 10 Nov 2026 12:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481658.1685561; Tue, 10 Nov 2026 12:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlPx-0002rB-4G; Tue, 10 Nov 2026 12:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1481658;
 Tue, 10 Nov 2026 12:57:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQlPv-0002qz-QK
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:57:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlPv-00HX81-7D
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:57:39 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af314ad-8faa-0a2a0a5109dd-0a2a4505aaba-34
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:57:38 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af314c2-4cb1-0a2a45050019-d155dd34cd52-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:57:38 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so1686135f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 04:57:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c43f4sm6078709f8f.47.2026.11.10.04.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 04:57:37 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794315458; x=1794920258; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PuC9Km98IanQZN7cTr6FGABpEMwQ1AFwRq+pRmPoLZc=;
        b=Ot+pmeSOYo/mLzb88UfjyPbR2qYVRxHvFQAXqGZ/c91iq2AT9VTL/c2jWFd6W6AH0c
         AkR7vqpSramUIdbi0KDbgVU+HpafZvC5kJqyu3bHUMGz8uBqIzXal0lSinDF68A/kR9g
         PM5/jOOPdtg85TxdzUknTdpsvf/Pmq7JECOWU9ogN2FB145AndKkeerurz0R7eRpppoL
         A1feSgI+kLb7i02w0jDLJaqDKgw/H0tj/jCHLIY7ZoN9eMfc3tNwkA7iNHCsWkZPhnT9
         yt/XnIY9a0WEubnRkCzH93mL5THZbFB1uCdL/XiUKJaEz7b0bgBtMnu7RQipc0L/s+zJ
         +SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315458; x=1794920258;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PuC9Km98IanQZN7cTr6FGABpEMwQ1AFwRq+pRmPoLZc=;
        b=p4PRyBkyMPx+jh5Y2PQ39LrCMiCQnJYtPhwBrScze33XJuyHndrvmjm36t5I97VXAz
         LDt3692hv0bm9Q7mYcC0uEn8M+AJWI5ieWLKlhjpSF4QfADT18nt6MCQbmVX470Z39pp
         GxrUgRlay4lbijU7LyavNUM+AFLgdH/u0jUNHTIw9auZpN4GLucp7urp5OXuBeCpb0oa
         SDdmrB6iI6hMb1ohi1WUuwb8grbsjTw6yiB9TV0TgcwtlwJCCnM4sdmls74x9G6bzT/V
         yoxpIAe5hHf21/n/WfANj1URhwD8HzMrpF0SkJRmCnkf4GolVq/RuMSyid8Nxa/z2b3q
         15fw==
X-Gm-Message-State: APuU4Z+bFWWVNIDC6PdaG1VDjUXREKedGZFKCisBnhBZGPFM2w2/Z4ee
	nfpYwG/OV+q7pV60qSNnq1t2yQAbiilIW3MdFEXm7t5nrOl5zpajh7/+DMUMIRYI6g==
X-Gm-Gg: AYBFou0d270YOrEy4XSQFu92QM95bhsR0k8v/WswqynYf1JLcQuqQA4QIAcCRewXazj
	DXeVmL1Mqkhpe8iv+SY3l+NN4viZ2QVgMcn4+usTy/FwxQLidblg7UN5fzHi0ClQwX+skEggxtx
	RA0HF+IFaGdOSRQbIvbUIy31/9CJGDekcb4eeYMndrXKeUIrgVk1K7FV9EUCMmfXy2HcB7PpUCo
	Wn7k0XZArTbnPR3hbtxA6Xrdg3aHwvWLdW7V8gjFUK2Y+iiIaKkCbZTlCnK/ALgJ+r6ixtPG/Ok
	FtoTXQkANvagR08HHRGonOSXedY5zkGpwf3TeG0TNL470BZaXWM97VpMcu9fVNd7F+nBbwcwo1z
	McpgqKXC6aIM4zrMyrFWhgWLnwPgeruDo5LzNOyyywyn6I0SEQcIWdGHLYCpRGkjZVgThqIrzcl
	D+4zVJJNme46jHlQTu2lx+dUfqFAHtN8EYFGEkFeFhK4WxNTrgGQqzJjJygaWAeD7EIXh3vJZyg
	Rk3IR2bua7PEvQvN6c/73QWBZWhpkjdgyXsM0E29wj2TnlSFIjIttQlrWpr2V293GFR/7uMd59q
	YxGat06rwOKtY0XomPLlWzISZo7vRq0Fla+8G6OoufoUvsyfNobPPIpMnB+vmNjGO19jmYvWxFB
	IW3ed1SVMwMPnApdg
X-Received: by 2002:a05:6000:4b0b:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-4982fa5d32bmr4795225f8f.28.1794315458189;
        Tue, 10 Nov 2026 04:57:38 -0800 (PST)
Message-ID: <07e68d78-850d-42d8-af8d-bb2ea87b9d78@suse.com>
Date: Tue, 10 Nov 2026 13:57:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: compile out __set_fixmap_x() when not needed
From: Jan Beulich <jbeulich@suse.com>
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
 <abc874bc-a74b-434f-a741-be17bcf87da6@suse.com>
Content-Language: en-US
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
In-Reply-To: <abc874bc-a74b-434f-a741-be17bcf87da6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794315458-71CA82A1-6BFB2875/10/78276251493
X-purgate-type: spam
X-purgate-size: 4581
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 14:19, Jan Beulich wrote:
> On 09.11.2026 13:51, Nicola Vetrini wrote:
>> On 2026-11-09 13:35, Jan Beulich wrote:
>>> On 09.11.2026 11:50, Nicola Vetrini wrote:
>>>> On 2026-11-09 10:04, Jan Beulich wrote:
>>>>> On 07.11.2026 08:23, Nicola Vetrini wrote:
>>>>>> On 2026-11-03 12:28, Jan Beulich wrote:
>>>>>>> On 03.11.2026 10:42, Jan Beulich wrote:
>>>>>>>> Only HYPERV_GUEST has a need for an executable fixmap, so with 
>>>>>>>> that
>>>>>>>> option
>>>>>>>> unset __set_fixmap_x() (and l1_fixmap_x[] in turn) is unreachable.
>>>>>>>> Address
>>>>>>>> this Misra rule 2.1 violation by introduction ofa new FIXMAP_X
>>>>>>>> Kconfig
>>>>>>>> setting.
>>>>>>>>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>> ---
>>>>>>>> Why is __set_fixmap_x() not found by Eclair as a rule 2.1 
>>>>>>>> violation
>>>>>>>> in
>>>>>>>> the
>>>>>>>> x86_64-amd job?
>>>>>>>
>>>>>>> Same question actually for both functions converted to static by 
>>>>>>> [1].
>>>>>>> This
>>>>>>> apparently being a wider problem, are we (again / still) having an
>>>>>>> issue
>>>>>>> with the scanning of the linking steps?
>>>>>>>
>>>>>>> Jan
>>>>>>>
>>>>>>> [1]
>>>>>>> https://lists.xen.org/archives/html/xen-devel/2026-10/msg01537.html
>>>>>>
>>>>>> It was a Xen project decision not to consider for R2.1 functions 
>>>>>> that
>>>>>> are never referenced: you can see in
>>>>>> "automation/eclair_analysis/ECLAIR/deviations.ecl". Of course that 
>>>>>> is
>>>>>> reversible and I am in favour of not hiding those violations, but 
>>>>>> the
>>>>>> rationale for the justification that was given is that the compiler
>>>>>> will
>>>>>> indeed DCE those:
>>>>>>
>>>>>>     * - R2.1
>>>>>>       - The compiler implementation guarantees that the unreachable
>>>>>> code
>>>>>> is
>>>>>>         removed. Constant expressions and unreachable branches of if
>>>>>> and
>>>>>> switch
>>>>>>         statements are expected.
>>>>>>       - Tagged as `safe` for ECLAIR.
>>>>>
>>>>> For the cases at hand (and then likely many more) the compiler 
>>>>> doesn't
>>>>> DCE
>>>>> anything. Imo the wording here is completely bogus. It may say "If 
>>>>> the
>>>>> compiler implementation guarantees ..." Which it might do for static
>>>>> functions, but aiui without LTO it never will for non-static ones.
>>>>>
>>>>
>>>> I'm not saying the configuration is good as is. Ideally that should be
>>>> removed or restricted to static functions and the likely newly present
>>>> violations triaged.
>>>>
>>>>> Then I'm also puzzled by the deviations.ecl entry:
>>>>>
>>>>> -doc_begin="The compiler implementation guarantees that the 
>>>>> unreachable
>>>>> code is removed.
>>>>> Constant expressions and unreachable branches of if and switch
>>>>> statements are expected."
>>>>> -config=MC3A2.R2.1,+reports={safe,"first_area(^.*has an
>>>>> invariantly.*$)"}
>>>>> -config=MC3A2.R2.1,+reports={safe,"first_area(^.*incompatible with
>>>>> labeled statement$)"}
>>>>> -doc_end
>>>>>
>>>>> First - these are two different deviations, and hence imo should be 
>>>>> two
>>>>> separate entries. More important here though is that I can't connect
>>>>> the
>>>>> two config= lines to the deviation of unreferenced non-static
>>>>> functions.
>>>>> There's nothing "... has an invariantly ..."  or "... incompatible 
>>>>> with
>>>>> labeled statement ..." there? How would the full diagnostic for an
>>>>> unreferenced global function (or data item) look like?
>>>>
>>>> These two have nothing do do with functions never referenced indeed: 
>>>> the
>>>> rule is about unreachable code in general, of which functions that are
>>>> never called is just a subcase.
>>>
>>> Yet then in your earlier mail which part of deviations.ecl did you 
>>> refer
>>> to?
>>
>> Sorry, I assumed I had pasted it [1], but forgot:
>>
>> -doc_begin="Some functions are intended to be not referenced."
>> -config=MC3A2.R2.1,+reports={deliberate,"first_area(^.*is never 
>> referenced$)"}
>> -doc_end
>>
>> this bit specifically is about both static and non-static functions
> 
> Oh, I see. Since this deviation is unspecific as to static / non-static,
> I didn't think it was the one relevant here.

What's possibly worse (and what may have added to me not spotting it):
This does not look to have a representation in docs/misra/deviations.txt.
Such an inconsistency imo needs addressing.

How would the above configuration setting look like when limiting things
to static functions?

Jan

