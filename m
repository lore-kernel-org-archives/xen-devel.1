Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880B8C56201
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 10:43:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383281.1626543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrZ5s-0008SM-Mn; Wed, 05 Aug 2026 10:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383281.1626543; Wed, 05 Aug 2026 10:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrZ5s-0008SF-JK; Wed, 05 Aug 2026 10:43:28 +0000
Received: by outflank-mailman (input) for mailman id 1383281;
 Wed, 05 Aug 2026 10:43:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrZ5q-0008S9-AU
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:43:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrZ5p-00Bh8Y-Ar
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:43:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7313c6-e002-0a2a0a5209dd-0a2a4506d6f2-28
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 12:43:25 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7313cc-195a-0a2a45060019-d155dd2bb919-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 12:43:24 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47f84023916so705261f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 03:43:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfda0cbsm7652648f8f.6.2026.08.05.03.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 03:43:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1785926604; x=1786531404; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1Bb4vmR8cZXbl+BHofF+bpO39VFBzO9m9JaXAQs06w=;
        b=WGf1gFgCDF6dfHH31vFQ5XwdAgdfEabDfP26YBulucQaLizMy3S6Wvh1UsB1UKzuJi
         cjvAiXE+Hvx+zoAmStnWjR2TL47NSZtI+rbvTytyfFcwZ8Oxo6FXBCet3a/QDexHeQ1j
         2CEa9288VdSjurveL1YmbiRASBhpQQxZgdPb5dd+X8L4pAB9iISjWIvmVs47emVoZ518
         gKCxxz/fMGxVpBy/Afgjio20f/Ukz/u71Kk6fWf1md14MJcps+2ae8ZXu1DejWX4kznv
         oFCgFu5drZlQ1mqQnkPdSmUoMu2JIlgsAKD2Xd7dYoz2XwDgYLijo9DrhHn99GDDLLyn
         Qqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926604; x=1786531404;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1Bb4vmR8cZXbl+BHofF+bpO39VFBzO9m9JaXAQs06w=;
        b=OyXOmzjKXSli9g64F/fYdAd+QA4jBkvhH64YBR/JbV5ZITqGwePF0n0VCpE+Wm3xgm
         RRZWvHhWcqSZkkv/H6RQcbOecWsz+ElCtkmsUWwCnVd2udgpyeKdspw0vQgSoWClj0mE
         n+/5mzgUIt82MZMCNUNqkX6hG8+DQcyDemEuxkQbtEN5ZCE9Ouwl4syOkhtxXOuxIEgK
         7wZ93GslwdvmaVM1Gtt0EW2P5PBauLnJFGbTWKK1QfGVrVj4632Bd4i0sa/EWHTaBKkJ
         7c05ByIDr5Ov7iedrQfRydeDnlT2g+OtGSCH21xQ9Z9VbcVRfg8u3i3e1oMl6Z/wzPv5
         OSCg==
X-Forwarded-Encrypted: i=1; AHgh+RqvOtRO5mKJLGNifD8EAQAMmasTQf55JO06pP0nbqxhi4vS1b0HEvntKCGx7ZWugeCAJfo2rRMD0d0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGm8c1FRg91xx+3MTaEsx7vX56z1drFfQjungwH3dXCeWPrwle
	2NhK21QSM46C3J8qRL8oJckrnBn8LNxAWKWFzoS7SZWIPNor3BPv/yeA0TWoBOuos56s4RFJv2X
	aCDMOOQ==
X-Gm-Gg: AR+sD10CL/ZKTbXG3CFWioEsKlJBslzAO/RgmxhAR/MtROlPDlKb1iiu2ikFjHCJJGe
	HLYpwV84vcuIM1Cs9Xh0+6UTjSiNDr4k+XaNyjU7kGgeSML4SHQQd0Pk2DE12CbWVROXwXSbAoD
	DIDCjBVYcFHivH1UBAc2+YhXUOIQRFY9mMXETO3cjg/Y6oyZdLi+WkPrPUc2+swg/UpVaLlG/yn
	Pn/53AsBD7cJ1daG+/v3+SJY3qwqgJAvUkNDzP3QKC0Ge4RS3rXRXRb128Z2VQUcVP+8FBL8c15
	Wh41W81e6vAMaS1yiAYV/+Q9rgaDwLbpiJAcmXGwqKIoAxgOGjIsal4ZJFefIFCo5xZrqn/NgwB
	I+0r4CobndJ9j/OGCrk+vDjdtZef8bEOLhBFTcWZ37dFoYTyHoFhu08ThcCylEvlYbvZZ5u2r0y
	3a1MTC85JUnkIw2tiaIYnn3HFoDikWqY/0zovDbBO+BUZzQvd+lZvPNnAFeP6+qpH8PJW/Qz25A
	ELkrJZDJp328EjpDoeTN4FdXestWYF3J+tjAsy3oYkmW6hALWrR
X-Received: by 2002:adf:e6cc:0:b0:47f:97e9:fe60 with SMTP id ffacd0b85a97d-47fec51a252mr6403140f8f.15.1785926604441;
        Wed, 05 Aug 2026 03:43:24 -0700 (PDT)
Message-ID: <13dd0296-95d4-43e4-9d79-3ffa113927ec@suse.com>
Date: Wed, 5 Aug 2026 12:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: reduce dependencies on x86_emulate/x86_emulate.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2a4d839d-44ce-40fb-af7b-5becd878c9fc@suse.com>
 <81729a84-dccc-4470-ba91-4e7689c387fa@citrix.com>
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
In-Reply-To: <81729a84-dccc-4470-ba91-4e7689c387fa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785926604-FD40B77B-5019A7A0/0/0
X-purgate-type: clean
X-purgate-size: 1624

On 05.08.2026 12:38, Andrew Cooper wrote:
> On 05/08/2026 9:29 am, Jan Beulich wrote:
>> Split out struct x86_event to an entirely separate header, and move a few
>> other items describing the architecture to a new x86-types.h. With a few
>> forward decls of structures and with a fair number of new #include-s in
>> .c files, the inclusion of x86_emulate.h (and hence
>> x86_emulate/x86_emulate.h) can be dropped from all header files except
>> hvm/emulate.h; it needs additionally adding to hvm/ioreq.h though.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This looks broadly fine.
> 
> However, I don't see any hunks downgrading arch/x86/hvm/svm/vmcb.h from
> x86_emulate.h to x86-types.h.  It needs struct segment_register, but
> nothing else I can spot.

Hmm, yes, I can apparently convert that as well. I was really after tidying
non-private headers, primarily.

>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/x86-types.h
>> @@ -0,0 +1,76 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * x86-types.h
>> + *
>> + * Type definitions and basic helpers which are more or less directly
>> + * describing aspects of the architecture.
>> + */
>> +
>> +#ifndef X86_X86_TYPES_H
>> +#define X86_X86_TYPES_H
>> +
>> +#ifdef __XEN__
>> +# include <xen/types.h>
>> +#else
>> +# include <stdint.h>
>> +#endif
>> +
>> +/*
>> + * Comprehensive enumeration of x86 segment registers.
> 
> This comment has become stale with the recent additions.  I'd be tempted
> to simply drop "registers" from this sentence while you move it.

Can do, sure.

Jan

