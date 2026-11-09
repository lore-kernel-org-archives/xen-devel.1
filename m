Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9A606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HIHoq8dB
Received: from list by lists.xenproject.org with outflank-mailman.1479965.1683865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQObJ-0007Xw-T6; Mon, 09 Nov 2026 12:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479965.1683865; Mon, 09 Nov 2026 12:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQObJ-0007Xp-QB; Mon, 09 Nov 2026 12:35:53 +0000
Received: by outflank-mailman (input) for mailman id 1479965;
 Mon, 09 Nov 2026 12:35:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQObI-0007Xh-Dg
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:35:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQObH-00E2A8-G4
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:35:51 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1be0f-e002-0a2a0a5209dd-0a2a4502c036-46
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:35:51 +0100
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1be27-6ca4-0a2a45020019-d155da32e8a7-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:35:51 +0100
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c3f04e0e65fso110641166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 04:35:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d6a4ae2f7sm163580266b.51.2026.11.09.04.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 04:35:50 -0800 (PST)
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
        d=suse.com; s=google; t=1794227751; x=1794832551; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7gLySX+k4X+4xSSXNG+TYiO93SwjQOFP5vq7/zYcDI=;
        b=HIHoq8dBOTibHTByDOS1gXCdS3ninOGYaGuxCVh+OsmiDuihYDu2tcPG5vy3lbDYhd
         SzTVqsxABBqFrUWyewpHj4WeOSbXlvh2WXXGKClSCvVW/6VInnAb8iuZbWNXmp+lAdqI
         HYOPlbzkPX/f/EFghPK9HhpsUHVHkNnVkYcz0TDRUVQffLghD7EJp+E9al55SZuOR5L+
         YG8AjSALsDFDgTNz8if9N90lImEWFkJmDk2Vk+atrwSeY4DmIRViDpqfDHTpkHQD7T7D
         2kCnyorsSe30v3Cr79yu20dX07cdBhdr+CbWoJYWzHoJEZ884AdeABeCVOsjJDNfhq5w
         Zxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227751; x=1794832551;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7gLySX+k4X+4xSSXNG+TYiO93SwjQOFP5vq7/zYcDI=;
        b=qkGuO1Az3vEubFeOPqjHeX6SSMwDYhos+exHJeg684uPLrnOt1xirhu9gmC6JcjVJb
         LHhuVqDGaefijiplnZmukUCxJOwFUGK+p2AcTzvTNtGLjyMM2H6okwkrtmXo7mAbkJ4z
         mknBDcwiuDcOQytVeH5zTJ68SN4ummDW26coeM0TihkCDSozrnldovbf5fRvDYXO6e/M
         GHKYIX+eJ2DNw+uXu/qY/oTjW+W9RrWuhFuYxBsci0lUaqGajwtQgJmYFAku6j973jMR
         Zo4v9sKiHyxHC94Y4GQ7D1V6AQcizhcq5Hfw3w3zWKmA5Etn+keufWVpq5mGYnXwjE2a
         xWLA==
X-Gm-Message-State: APuU4Z8fg1wSk2791qm6YxX8yO0Cm9s3P+PRbZNPauoj+he0d//ADQ0X
	ZAYa7NYStheJqvLMBsuW3iIYgI8r7U6Ly+VON/J1PTnNrRynzRny2DSZw/kiIHhjdw==
X-Gm-Gg: AYBFou3Bsri5vv4wtOBQU38y1DwCVE0SdHealjCXrwHBKjtN41QpEox0MiMVB2M89Xm
	AQ54gWjLsZoap9T+qu2UKDDKY+HkkJR30aKTnEslgSUcwrj5ZQc735y23BgoXd0NH+8HAucz6Je
	1iW3iNzMnl+DMPG7ZkelAlY1tLILSIbVD/e8lkWlqQEljjHYsqHw3EhVsVFFI0GEr/NpySwaFf3
	q8HIf2BS9VTU5uKSiesW/enZpFLfcIngOqWcjbo/2V4HUG30Xo+ynF7NmQXEcHjaG7mvXGpHPa9
	raNH+ODvLZYZ6VQkWecfdt4cFzKUiz4g683XMKGaStKPGekNPqEAqk1msaqsmvjTRsB9tGHactE
	Y/vGDx/av/4Ovs1Ec85G4RZNabvhqG/3yWIrpqMbNNllOAGaQETcRzLqjq4jzek/1m5bf3ZHwgr
	mGlXFrv6MLmSiUukmQruZQLiGTIwx0G8KrDCfGmQhxnAa/oXele52hSiSIx7QI21HjXyR5lB1Co
	6CGSQHwY9o2rgNBUO9dl9obsKE+EK+9iAhyTq6KTJIGDP5jPN1F9P+jAJjmqHEHBpSUro4QbDYu
	gZfmCI0Xu+MqAPFKENImQUASzPEC2jM4AR107yo3xcBU0r2GAUDKtvjMC7A37PJRN5hQt1DCe6k
	4S0lrMGqlWxA51gEHWUUsw6jMZQ5umaFTy8O/uA==
X-Received: by 2002:a17:906:d550:b0:c3f:a728:b437 with SMTP id a640c23a62f3a-c4d6ddbf213mr294381066b.45.1794227750865;
        Mon, 09 Nov 2026 04:35:50 -0800 (PST)
Message-ID: <70b2744a-a75b-4375-91ef-0d1c8a4ec807@suse.com>
Date: Mon, 9 Nov 2026 13:35:46 +0100
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
In-Reply-To: <866c42195d447dcf1e7ad1192645020c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794227751-30FCE2AC-4C832D55/10/78276251493
X-purgate-type: spam
X-purgate-size: 3368
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 11:50, Nicola Vetrini wrote:
> On 2026-11-09 10:04, Jan Beulich wrote:
>> On 07.11.2026 08:23, Nicola Vetrini wrote:
>>> On 2026-11-03 12:28, Jan Beulich wrote:
>>>> On 03.11.2026 10:42, Jan Beulich wrote:
>>>>> Only HYPERV_GUEST has a need for an executable fixmap, so with that
>>>>> option
>>>>> unset __set_fixmap_x() (and l1_fixmap_x[] in turn) is unreachable.
>>>>> Address
>>>>> this Misra rule 2.1 violation by introduction ofa new FIXMAP_X 
>>>>> Kconfig
>>>>> setting.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> Why is __set_fixmap_x() not found by Eclair as a rule 2.1 violation 
>>>>> in
>>>>> the
>>>>> x86_64-amd job?
>>>>
>>>> Same question actually for both functions converted to static by [1].
>>>> This
>>>> apparently being a wider problem, are we (again / still) having an
>>>> issue
>>>> with the scanning of the linking steps?
>>>>
>>>> Jan
>>>>
>>>> [1] 
>>>> https://lists.xen.org/archives/html/xen-devel/2026-10/msg01537.html
>>>
>>> It was a Xen project decision not to consider for R2.1 functions that
>>> are never referenced: you can see in
>>> "automation/eclair_analysis/ECLAIR/deviations.ecl". Of course that is
>>> reversible and I am in favour of not hiding those violations, but the
>>> rationale for the justification that was given is that the compiler 
>>> will
>>> indeed DCE those:
>>>
>>>     * - R2.1
>>>       - The compiler implementation guarantees that the unreachable 
>>> code
>>> is
>>>         removed. Constant expressions and unreachable branches of if 
>>> and
>>> switch
>>>         statements are expected.
>>>       - Tagged as `safe` for ECLAIR.
>>
>> For the cases at hand (and then likely many more) the compiler doesn't 
>> DCE
>> anything. Imo the wording here is completely bogus. It may say "If the
>> compiler implementation guarantees ..." Which it might do for static
>> functions, but aiui without LTO it never will for non-static ones.
>>
> 
> I'm not saying the configuration is good as is. Ideally that should be 
> removed or restricted to static functions and the likely newly present 
> violations triaged.
> 
>> Then I'm also puzzled by the deviations.ecl entry:
>>
>> -doc_begin="The compiler implementation guarantees that the unreachable 
>> code is removed.
>> Constant expressions and unreachable branches of if and switch 
>> statements are expected."
>> -config=MC3A2.R2.1,+reports={safe,"first_area(^.*has an 
>> invariantly.*$)"}
>> -config=MC3A2.R2.1,+reports={safe,"first_area(^.*incompatible with 
>> labeled statement$)"}
>> -doc_end
>>
>> First - these are two different deviations, and hence imo should be two
>> separate entries. More important here though is that I can't connect 
>> the
>> two config= lines to the deviation of unreferenced non-static 
>> functions.
>> There's nothing "... has an invariantly ..."  or "... incompatible with
>> labeled statement ..." there? How would the full diagnostic for an
>> unreferenced global function (or data item) look like?
> 
> These two have nothing do do with functions never referenced indeed: the 
> rule is about unreachable code in general, of which functions that are 
> never called is just a subcase.

Yet then in your earlier mail which part of deviations.ecl did you refer
to?

Jan

