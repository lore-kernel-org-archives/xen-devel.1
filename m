Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CCF606A333
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dQaIJh6q
Received: from list by lists.xenproject.org with outflank-mailman.1486104.1689017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRWyw-0006ao-9Z; Thu, 12 Nov 2026 15:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486104.1689017; Thu, 12 Nov 2026 15:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRWyw-0006ag-6Q; Thu, 12 Nov 2026 15:44:58 +0000
Received: by outflank-mailman (input) for mailman id 1486104;
 Thu, 12 Nov 2026 15:44:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRWyu-0006aZ-Ue
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:44:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRWyu-002Kd7-9c
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 16:44:56 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5def2-8faa-0a2a0a5109dd-0a2a45018de4-16
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 16:44:56 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5def7-5984-0a2a45010019-d155dd2be9b0-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 16:44:56 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so2989985f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:44:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365cd06fsm17334240f8f.40.2026.11.12.07.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 07:44:55 -0800 (PST)
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
        d=suse.com; s=google; t=1794498295; x=1795103095; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mShv9xK8NY19GIKPi4+d+zrAW+2CXiV/UtrYKMOVzq0=;
        b=dQaIJh6qyncMVNIYacWMWxlsQNDJD+hJ00BbHq+dY+3WEO4d19tgMrCaXFHUmOcjJW
         MmPJHPdbUpXcWNzTlF/UqE7h7u67AulBTkeCSNZ6ZW77N8Rn6lC3UFE7wtmhCkeSwm+b
         bfYp3SQ0Ff2+kU+zm9BJl9MLQlmdlwy/1lcsycD20f0Q6R+l/S4vi01NtWW/2hUQs0dy
         V42wmh1sUEl926dG4w7D5dNvTSi7rHD8SaW8nB/iUBLFREsvDPNgzGzUxCAin+zcOTKs
         EYxLXwJ3gVjoz+mi2aEuTp5cIsi7JPvhaF/N07xQ4+BiFaIxKd62S+aVJ0tSRIZ5/oR9
         TUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498295; x=1795103095;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mShv9xK8NY19GIKPi4+d+zrAW+2CXiV/UtrYKMOVzq0=;
        b=Gj/SKiAXje1N1Djf8lyyRJ5DBvhAnA3SYVLP7hpWzbKKJ6+FcADIQkYLY+tmoIVIeD
         mOZgLscrb+NybMLZT0D+CkXrVbsGbcG1vZ2b0YusjJrIKI+KnPLkGHNoD8ReyJ7bgz2K
         t0x6PUnmyMbrEQJGjqIdnX5rKnNEIy4tWHj3LX5h9T/xUoaCpcdu1Rf4DQzQywyieXuU
         oY+PDJVISjQEt051nlnhA16rgrucWFSaJeTnkYlauv7cvbjwZxvQGVCl6VnzsdJp1kg4
         1AinIMG9aa8pRO0dHPR6kScSbK9Z3LNI3MfTB09CtBG/itdzXW9J5S7j9kOv0bGC456A
         XR9A==
X-Gm-Message-State: APuU4Z+dO9SwrxI27Q5jS1izrH2FSq9WvGegDFg4sU+j5CxEN3CWHYgA
	N1bPof4alymsLEVo1CZclY8zE3Baf6g3x3f/dvaq04rJmvRtZnXcVEqQbtfqmUJ7pA==
X-Gm-Gg: AYBFou3ti32uodZvNTWPBEW7sKah3I/RTSy1/6axtkUVFCLvY3gLFG4sQQRDilSx6wN
	tt8grMyZqV2X0urcDJsAx8/Anju5EHr7a8wUwhCSGiRqqEP3+m3Fy+RJbi/BIVvQubCh/Xqt7Uc
	J14PUMN9kOrd1nrBBYFY/H/PhSUzKkitQ+WjieGoj2XFMypcStcyfL8Z64YPKNXyRXpluPPHWI/
	KHLtagpy9amcuorOcZw/st6kvkDSqiTo9VbYJ856EFD8naSU0ybUxKOupJqGjA1vdQARsa9egEz
	VfTvDJ+6vA+Oh84BKEsts4XRQgEpujg/TThP+1gTaO5P7xhdQnh1zfjO052A9hpWc1xZ8HEAaTf
	iaUEhxrAjgoRELuXuEe50qi1NaewA0AZpO3SveigL9S5fnVhi70hbjdR4VtQB38foglfqP3lpn7
	YqKb//g0f+XpbMZwuIDA0yGgKVDyAPD7GzU0tU1rVPCCjv4Gr4qvw58SZgE8Gr7h7Nz8ZVWZsf1
	qbUgTMuOImHyZJueWdI0Ud3r6pSAJMLSeqIja8zzpZ7GT9eBSpFSQGMfnloa4RshqFNJF9lNTS5
	5jkjOQtZBhKqAw1oTgPssy+FtC/nkYi6Kv0pD9lMy+z8C7l3Xw6rJ0bOF8GgGsLhFmE2lHFkpTW
	uZkCtXGZQ+se720zo
X-Received: by 2002:a05:6000:3ca:b0:498:1a65:50ce with SMTP id ffacd0b85a97d-499c7a24ac2mr10123200f8f.22.1794498295527;
        Thu, 12 Nov 2026 07:44:55 -0800 (PST)
Message-ID: <763a544a-a9dd-4fba-a81d-313799402212@suse.com>
Date: Thu, 12 Nov 2026 16:44:54 +0100
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
 <abc874bc-a74b-434f-a741-be17bcf87da6@suse.com>
 <07e68d78-850d-42d8-af8d-bb2ea87b9d78@suse.com>
 <85b76901d8c647a7b5c560e7316921f7@bugseng.com>
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
In-Reply-To: <85b76901d8c647a7b5c560e7316921f7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794498296-BFE68757-ECB5D70B/10/78276251493
X-purgate-type: spam
X-purgate-size: 5655
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11.11.2026 19:43, Nicola Vetrini wrote:
> On 2026-11-10 13:57, Jan Beulich wrote:
>> On 09.11.2026 14:19, Jan Beulich wrote:
>>> On 09.11.2026 13:51, Nicola Vetrini wrote:
>>>> On 2026-11-09 13:35, Jan Beulich wrote:
>>>>> On 09.11.2026 11:50, Nicola Vetrini wrote:
>>>>>> On 2026-11-09 10:04, Jan Beulich wrote:
>>>>>>> On 07.11.2026 08:23, Nicola Vetrini wrote:
>>>>>>>> On 2026-11-03 12:28, Jan Beulich wrote:
>>>>>>>>> On 03.11.2026 10:42, Jan Beulich wrote:
>>>>>>>>>> Only HYPERV_GUEST has a need for an executable fixmap, so with
>>>>>>>>>> that
>>>>>>>>>> option
>>>>>>>>>> unset __set_fixmap_x() (and l1_fixmap_x[] in turn) is 
>>>>>>>>>> unreachable.
>>>>>>>>>> Address
>>>>>>>>>> this Misra rule 2.1 violation by introduction ofa new FIXMAP_X
>>>>>>>>>> Kconfig
>>>>>>>>>> setting.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>>> ---
>>>>>>>>>> Why is __set_fixmap_x() not found by Eclair as a rule 2.1
>>>>>>>>>> violation
>>>>>>>>>> in
>>>>>>>>>> the
>>>>>>>>>> x86_64-amd job?
>>>>>>>>>
>>>>>>>>> Same question actually for both functions converted to static by
>>>>>>>>> [1].
>>>>>>>>> This
>>>>>>>>> apparently being a wider problem, are we (again / still) having 
>>>>>>>>> an
>>>>>>>>> issue
>>>>>>>>> with the scanning of the linking steps?
>>>>>>>>>
>>>>>>>>> Jan
>>>>>>>>>
>>>>>>>>> [1]
>>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2026-10/msg01537.html
>>>>>>>>
>>>>>>>> It was a Xen project decision not to consider for R2.1 functions
>>>>>>>> that
>>>>>>>> are never referenced: you can see in
>>>>>>>> "automation/eclair_analysis/ECLAIR/deviations.ecl". Of course 
>>>>>>>> that
>>>>>>>> is
>>>>>>>> reversible and I am in favour of not hiding those violations, but
>>>>>>>> the
>>>>>>>> rationale for the justification that was given is that the 
>>>>>>>> compiler
>>>>>>>> will
>>>>>>>> indeed DCE those:
>>>>>>>>
>>>>>>>>     * - R2.1
>>>>>>>>       - The compiler implementation guarantees that the 
>>>>>>>> unreachable
>>>>>>>> code
>>>>>>>> is
>>>>>>>>         removed. Constant expressions and unreachable branches of 
>>>>>>>> if
>>>>>>>> and
>>>>>>>> switch
>>>>>>>>         statements are expected.
>>>>>>>>       - Tagged as `safe` for ECLAIR.
>>>>>>>
>>>>>>> For the cases at hand (and then likely many more) the compiler
>>>>>>> doesn't
>>>>>>> DCE
>>>>>>> anything. Imo the wording here is completely bogus. It may say "If
>>>>>>> the
>>>>>>> compiler implementation guarantees ..." Which it might do for 
>>>>>>> static
>>>>>>> functions, but aiui without LTO it never will for non-static ones.
>>>>>>>
>>>>>>
>>>>>> I'm not saying the configuration is good as is. Ideally that should 
>>>>>> be
>>>>>> removed or restricted to static functions and the likely newly 
>>>>>> present
>>>>>> violations triaged.
>>>>>>
>>>>>>> Then I'm also puzzled by the deviations.ecl entry:
>>>>>>>
>>>>>>> -doc_begin="The compiler implementation guarantees that the
>>>>>>> unreachable
>>>>>>> code is removed.
>>>>>>> Constant expressions and unreachable branches of if and switch
>>>>>>> statements are expected."
>>>>>>> -config=MC3A2.R2.1,+reports={safe,"first_area(^.*has an
>>>>>>> invariantly.*$)"}
>>>>>>> -config=MC3A2.R2.1,+reports={safe,"first_area(^.*incompatible with
>>>>>>> labeled statement$)"}
>>>>>>> -doc_end
>>>>>>>
>>>>>>> First - these are two different deviations, and hence imo should 
>>>>>>> be
>>>>>>> two
>>>>>>> separate entries. More important here though is that I can't 
>>>>>>> connect
>>>>>>> the
>>>>>>> two config= lines to the deviation of unreferenced non-static
>>>>>>> functions.
>>>>>>> There's nothing "... has an invariantly ..."  or "... incompatible
>>>>>>> with
>>>>>>> labeled statement ..." there? How would the full diagnostic for an
>>>>>>> unreferenced global function (or data item) look like?
>>>>>>
>>>>>> These two have nothing do do with functions never referenced 
>>>>>> indeed:
>>>>>> the
>>>>>> rule is about unreachable code in general, of which functions that 
>>>>>> are
>>>>>> never called is just a subcase.
>>>>>
>>>>> Yet then in your earlier mail which part of deviations.ecl did you
>>>>> refer
>>>>> to?
>>>>
>>>> Sorry, I assumed I had pasted it [1], but forgot:
>>>>
>>>> -doc_begin="Some functions are intended to be not referenced."
>>>> -config=MC3A2.R2.1,+reports={deliberate,"first_area(^.*is never
>>>> referenced$)"}
>>>> -doc_end
>>>>
>>>> this bit specifically is about both static and non-static functions
>>>
>>> Oh, I see. Since this deviation is unspecific as to static / 
>>> non-static,
>>> I didn't think it was the one relevant here.
>>
>> What's possibly worse (and what may have added to me not spotting it):
>> This does not look to have a representation in 
>> docs/misra/deviations.txt.
>> Such an inconsistency imo needs addressing.
>>
>> How would the above configuration setting look like when limiting 
>> things
>> to static functions?
> 
> Probably something like:
> 
> -config=MC3A2.R2.1,+reports={deliberate,"first_area(^.*is never 
> referenced$&&decl(kind(function)&&storage_duration(static))"}

Using that (with the missing parenthesis added) I get (pipeline [1])
no change in numbers for Arm64 and a drop by 4 for x86-64, compared
to the results with [2]). With that I'm not sure whether it's worth
keeping the rule in this modified form vs deleting it altogether.

Jan

[1] https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/3059613055
[2] https://lists.xen.org/archives/html/xen-devel/2026-11/msg01007.html

