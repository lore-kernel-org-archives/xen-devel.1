Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A54606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T+Iz/6TE
Received: from list by lists.xenproject.org with outflank-mailman.1479707.1683619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQLIg-0003RZ-7V; Mon, 09 Nov 2026 09:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479707.1683619; Mon, 09 Nov 2026 09:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQLIg-0003RS-42; Mon, 09 Nov 2026 09:04:26 +0000
Received: by outflank-mailman (input) for mailman id 1479707;
 Mon, 09 Nov 2026 09:04:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQLIf-0003RM-6I
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:04:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQLIe-00AWwQ-Fj
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:04:24 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af18c84-2eae-0a2a0a5409dd-0a2a4501eb1c-16
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:04:24 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af18c98-5984-0a2a45010019-d155dd35b460-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:04:24 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-492f0a1b685so417347f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 01:04:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597d0a775sm9459396f8f.55.2026.11.09.01.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 01:04:23 -0800 (PST)
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
        d=suse.com; s=google; t=1794215064; x=1794819864; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t81HF7aTOCdiFK+Q40/jr27seD2l7L8uanwamMLecYQ=;
        b=T+Iz/6TEGmshunozHZkho8NZSZjxGcjRjtc6Dbr5lJSCxvxJXQ7mo3VvOeIswn3K+c
         p7Ghfq71GfCS5uhOZnqH+Bg2KyAi7rlmJystfVO+dY+Pv1YqfGMfFMU4CeN/HsMQscSc
         /9y01uXMgM6mAcjymZLJlulralZywCfiY69w8hqujthKxmiriHcPQJsIiaYRiz3Qxr/6
         pg+H676B8AwlZZc0cEU+GqThFv+2BiLsOME7igsipohJYS9z/ODX+IF2OYeCaYxFl/ce
         OfUIySOEeDqV/ixclRHZqGpRPFvk2sBx8elAcwTUF+tk3I40WfkMlGYhxreXfquQ7dKJ
         HADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215064; x=1794819864;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t81HF7aTOCdiFK+Q40/jr27seD2l7L8uanwamMLecYQ=;
        b=M57wlIx3StTY17/f4MxQ474yeh103SD/AuVQrpmBZK+ZzOYiHAxiqxNvhgP47inrbq
         PR7Zko9FjxOm28R61hn/qEVajKiexbkArN+rf6c6C/EwNra0dqqCujvKT9twdjHyYaK8
         iAb8wpop/PyjskdXuBCD3MDqHnpNf5Wh53SNT36ACfbjNgpBG0vXqItj3d12fuh2pns5
         revORirWovz5wDbvpBSNQiBs0sZMwbgojie62zJXj7ktZ+uPNOZpYq9HWmVWi9U8Uf28
         3hBmbNQU5DEDYL47RzrzvuR+acxWM+ksjAq/xN249h0cOXC0LFvKUZDIEOHJCcGZn+8f
         Wt/Q==
X-Gm-Message-State: APuU4Z93O+Ty8n9iLk27oCXlfECvSDcJ6fd9Sju+EPL0tsx6Cii5XxP9
	LNK16/YdIM0hjQ4f0Y8Rg6sJunIZUqh3KSUiAUMXTCjnAPA7o/z9jY8WUPkg4rGJ0g==
X-Gm-Gg: AYBFou1RdBA7cvzCZjVpCPp8MV7rtsNFoKpgX6TvpGZqQFLQJGfs9BRFh1b6hmMMW9a
	4DsSPss+8qu/i8MzdnKmb2Q+KN18PCbvfomCzCZ2otApr8b+DgQf9RcBAU1c+rTCc5V5zp5KXDn
	5558AK2vlrngVYo1eL8LEpXCPi/PkYLe7zbovgKX+8v76FFbp7kOe2BZozmwj2pcDlYh3yHKi1s
	Xg8VJtRwJCpB9UnfeK56fwR2Sil5l/n2awyFspFPJOZ8WWotHpErrSiIZ1ZU57tsuxNsuII+SrF
	BBuSAQSLy/19kfHJxHcH+u6Y+OWw1jNHYGE6zzfJgA/K9I4Rfw7GNAv2sbQjLH4LUHVt66Z6kx2
	XpahvpREV8h7FABRjxSaio6kK+miXHcmMf72UOElqfNsADhxB4HP9u/oLMjPSJ7E43u8tNo1nM1
	fLTVGSd40kcPmtt7PbwfwOTFQHw7N6uoNnJg+YbjyzwqLIA8w5bLXeoFKYGtARLUS2Shk7FQNQJ
	nEJ9+rkuEkYbLYqg1v+Ff+grLcVTSrIKBrjLDJx+SMwy/Uh082zpm3pqDmVKUnsC6AuQr92mvEP
	JMcaz5s2b3kT2VL4H5sveB5xicVFgJigZrkEtxg90C23QMIOPN5INB/HpYygv4Oc97GR4F5K2NM
	YUAdnDCsfwwrggNUU
X-Received: by 2002:a05:6000:3103:b0:48e:f47:273c with SMTP id ffacd0b85a97d-49586a3bf71mr7035186f8f.8.1794215063664;
        Mon, 09 Nov 2026 01:04:23 -0800 (PST)
Message-ID: <26698add-7103-4d64-84ff-af40ac9c4fe8@suse.com>
Date: Mon, 9 Nov 2026 10:04:24 +0100
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
In-Reply-To: <629945f7492fbb65d1378ea05d1cf43d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794215064-BF46D757-CDF0E6C0/10/78276251493
X-purgate-type: spam
X-purgate-size: 2629
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.11.2026 08:23, Nicola Vetrini wrote:
> On 2026-11-03 12:28, Jan Beulich wrote:
>> On 03.11.2026 10:42, Jan Beulich wrote:
>>> Only HYPERV_GUEST has a need for an executable fixmap, so with that 
>>> option
>>> unset __set_fixmap_x() (and l1_fixmap_x[] in turn) is unreachable. 
>>> Address
>>> this Misra rule 2.1 violation by introduction ofa new FIXMAP_X Kconfig
>>> setting.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Why is __set_fixmap_x() not found by Eclair as a rule 2.1 violation in 
>>> the
>>> x86_64-amd job?
>>
>> Same question actually for both functions converted to static by [1]. 
>> This
>> apparently being a wider problem, are we (again / still) having an 
>> issue
>> with the scanning of the linking steps?
>>
>> Jan
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2026-10/msg01537.html
> 
> It was a Xen project decision not to consider for R2.1 functions that 
> are never referenced: you can see in 
> "automation/eclair_analysis/ECLAIR/deviations.ecl". Of course that is 
> reversible and I am in favour of not hiding those violations, but the 
> rationale for the justification that was given is that the compiler will 
> indeed DCE those:
> 
>     * - R2.1
>       - The compiler implementation guarantees that the unreachable code 
> is
>         removed. Constant expressions and unreachable branches of if and 
> switch
>         statements are expected.
>       - Tagged as `safe` for ECLAIR.

For the cases at hand (and then likely many more) the compiler doesn't DCE
anything. Imo the wording here is completely bogus. It may say "If the
compiler implementation guarantees ..." Which it might do for static
functions, but aiui without LTO it never will for non-static ones.

Then I'm also puzzled by the deviations.ecl entry:

-doc_begin="The compiler implementation guarantees that the unreachable code is removed.
Constant expressions and unreachable branches of if and switch statements are expected."
-config=MC3A2.R2.1,+reports={safe,"first_area(^.*has an invariantly.*$)"}
-config=MC3A2.R2.1,+reports={safe,"first_area(^.*incompatible with labeled statement$)"}
-doc_end

First - these are two different deviations, and hence imo should be two
separate entries. More important here though is that I can't connect the
two config= lines to the deviation of unreferenced non-static functions.
There's nothing "... has an invariantly ..."  or "... incompatible with
labeled statement ..." there? How would the full diagnostic for an
unreferenced global function (or data item) look like?

Jan

