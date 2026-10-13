Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1154CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:37:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447781.1663625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbkq-00083c-14; Tue, 13 Oct 2026 12:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447781.1663625; Tue, 13 Oct 2026 12:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbkp-00083V-Uh; Tue, 13 Oct 2026 12:37:15 +0000
Received: by outflank-mailman (input) for mailman id 1447781;
 Tue, 13 Oct 2026 12:37:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGbkp-00083P-7a
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:37:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbko-00DJqI-Jq
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:37:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace25ef-bab6-0a2a0a5309dd-0a2a4501ba7e-38
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:37:14 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace25fa-5984-0a2a45010019-d155d031c8db-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:37:14 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6aa9164072cso4169884a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 05:37:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b1c6df3794sm2284214a12.32.2026.10.13.05.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 05:37:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1791895034; x=1792499834; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QrB9/Ew6Sxj4YNHE/qGuA6q1KlvGkxTi9ld3Z9JK2g=;
        b=aojU7Gzyj3zvq9UdDP6ZIIrgyRjFAMgueGj4awS3+IIf+hSagfLnGkAhcCKUH5jlJA
         bgAHiX24sqiFqHgIrTn/uBsPkDbSZhC1eDsaK+khWgGz3syOTwffeK2kL8c+1KyStD7l
         9UrgIlCsXtFULUfp6pFsx32SUZlWlsA8/5tO0HPnOJ9XrfOcCh28XWojxOXR9UKl0YNK
         mnqn9MFBNd5Bu29kjBM3lPJv2qnUDqrLr3TNMeGXzrLrTpryGCtX95d5i+Sxql0pKHzX
         gLfDbSrg8eLmtjbRAaLEOfO6kkMPJRz/EvXSWP1116yfk7Mk3a+z+7ZPzGwnH0YYktSx
         iy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895034; x=1792499834;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QrB9/Ew6Sxj4YNHE/qGuA6q1KlvGkxTi9ld3Z9JK2g=;
        b=0ooGEAmEsCDdwTSd0YFVjrIQR4GT1vlXYhBbnxDjobhOF8ZtAgMZrPKSi3DIAVkA2J
         M3wv8LNqOOSQ7ROgsfwsmNi/qfvW1LV2F8QPaJgvwV6FVizyDsfe7sOGcyueiFEvKDPr
         Bk358e9edNXbulQdJvA2oWLPzAkfkRJo+Bx7kIwMDNxw/bnY8/MoB6u+tO+I9o5zA+GF
         wnCBVz6NgTi95viQye1ds9iZCVIcr3kF9iEN4mY52UnRytqzCtKa5/Ehan6GA61LwbX8
         2cjuzk5mBmN6BmpUmQGc6XDixMK+Nj5W7EZ+mUUn1jriZhg2VkLHDqxOjWVDLhmzeVZo
         lp+A==
X-Gm-Message-State: AFq9FYLg5f1707fWJoPMurzqfx6Ir0tX+d0GLNixO6TE27a8jaa1DZ0r
	O+RO3UpVhikYP8Cob+haIFqLiXQ2gr6NR7EO7ADiNRyQt8yNS4sIpvppznC4BUc/0g==
X-Gm-Gg: AYBFou1yDqAp187GG0yyTQzrSArEblFIk499qDcH8q9KgEJ2JgG3d3alrkNRqVAxihF
	aoZB9whdY93C+YgRuwVyo6EEws5GGoMSjFIp/Yu5eGk/julIHhM+VKoRCSuLVSVKvppo41gw+GC
	nhMKsqVxdHImy0G5JPik6UE8BGk6K8nhiSinKeeKwGr1UuFRKHw4blOA+yX/yLHx1Br/yq/lVV2
	THIm4E+U9KySPa85IRmVBtYbpKTvN/3lthqbwhIcmaIA+ereBxqu1/6as8CI+B7AwlQarH0yMKU
	X+h5hBxZk8LMrhrN6Cog/TZKLPbHoXZj2EnLn2lskWZgL/ioaaWVFACfjEbp/cwo/GbbnZ+xNce
	gQIJuxn2ngwsiVFNaGVG5+NMTgv4/VFm2Pm8s47tIte2fepqLEn2QdYte2Ovsdy+7IHoamSXcAn
	Xf991ybo4yOrbxA5sFzOmSYZWIIaysFVqa7ELXInbLSthX1V2YVZ3sShgkjojq1vkXeedQYZpSC
	m4qcA+/6zl/ClpE2PAEOJ+aIHQ2c1YNb0AiQ5FN0XKam0nL3dBmtzAy7W+HZA==
X-Received: by 2002:a05:6402:2351:b0:6b1:b626:5bd9 with SMTP id 4fb4d7f45d1cf-6b1b6265e2fmr5235342a12.0.1791895033213;
        Tue, 13 Oct 2026 05:37:13 -0700 (PDT)
Message-ID: <870ae4c3-9776-49b0-bb62-5db71c9f6192@suse.com>
Date: Tue, 13 Oct 2026 14:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/eclair: generalize the noreturn
 function-pointer deviation
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
 <5b5cccc8bbbc4c87fc99427eb4c1c413@bugseng.com>
 <96319798-7cf6-4905-9b1b-37bb6a41bdcd@suse.com>
 <d66bcdda409b9144da2c9bc75d3afd1b@bugseng.com>
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
In-Reply-To: <d66bcdda409b9144da2c9bc75d3afd1b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1791895034-BFE68757-28CCB2C8/10/78276251493
X-purgate-type: spam
X-purgate-size: 2935

On 13.10.2026 13:46, Nicola Vetrini wrote:
> On 2026-10-12 08:52, Jan Beulich wrote:
>> On 09.10.2026 17:37, Nicola Vetrini wrote:
>>> On 2026-10-05 20:56, Dmytro Prokopchuk1 wrote:
>>>> The R11.1 safe cast only matched void noreturn (*)(void *). Accept 
>>>> any
>>>> noreturn function pointer converted to a compatible function pointer.
>>>> canonical() covers typeof destinations, and 
>>>> compatible_deep_unqualified
>>>> keeps the parameter and return types aligned.
>>>>
>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>> ---
>>>>
>>>> This patch tries to cover both of these:
>>>>
>>>> 1. eclair: widen R11.1 noreturn cast deviation
>>>> https://patchew.org/Xen/c6632dd805a119aca54b9d1ae2eea68ef9c1334c.1790674358.git.dmytro._5Fprokopchuk1@epam.com/
>>>>
>>>> 2. Eclair: relax "noreturn" function-pointer conversion deviation
>>>> https://patchew.org/Xen/6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com/4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com/
>>>>
>>>> Test CI pipeline:
>>>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2914802667
>>>>
>>>> The only one Rule11.1 violation remains, which is covered by this 
>>>> Jan's
>>>> patch:
>>>> x86/kexec: address Misra rule 11.1 violation in machine_kexec_load()
>>>>
>>>
>>> The change itself is fine, but the aspect I'm concerned with is the
>>> following: if you have a function marked noreturn, the compiler is
>>> entitled to
>>> essentially remove any code following it, so in principle this could 
>>> be
>>> the case also when invoking a function pointer (i.e. the compiler has 
>>> no
>>> obligation to retain code after a call to a function pointer that is
>>> actually a noreturn function). While this in practice may not happen
>>> often (e.g., the analysis done by a compiler is probably too shallow 
>>> to
>>> actually infer paths where the function pointer is only ever assigned 
>>> to
>>> noreturn functions when it is called), it is still not completely true
>>> to say that the behavior is not altered by casting away noreturn.
>>
>> With "behavior" here you mean that of the compiler? Because Xen's 
>> behavior
>> won't change if the code following such an indirect call isn't 
>> eliminated.
>> It will "just" be unreachable code then.
>>
>> That said, ...
> 
> I was more worried about the other direction: code that is expected to 
> be executed by the developer that is instead removed by the compiler, 
> with (rightfully) no diagnostic. Clearly if code is not removed it would 
> be unreachable, but such that a static analysis tool or compiler will 
> likely not diagnose, precisely because the attribute is dropped, so 
> there may be missing diagnostics.

Hmm, interesting. The noreturn attribute isn't visible at call sites
anyway, so I don't quite see how that would be any more unexpected than
for a normal (direct) function call.

Jan

