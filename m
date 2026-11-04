Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDDF606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=hHFCYSvs
Received: from list by lists.xenproject.org with outflank-mailman.1471903.1680028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOb52-0000Ob-Tb; Wed, 04 Nov 2026 13:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471903.1680028; Wed, 04 Nov 2026 13:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOb52-0000OU-Qw; Wed, 04 Nov 2026 13:31:08 +0000
Received: by outflank-mailman (input) for mailman id 1471903;
 Wed, 04 Nov 2026 13:31:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOb51-0000O0-Hq
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 13:31:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOb50-00EaCs-UY
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:31:06 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb339a-bab6-0a2a0a5309dd-0a2a4503b9c6-8
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:31:06 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb339a-fae8-0a2a45030019-d1558030c83c-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:31:06 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so5065215e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:31:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b43d4c9d4csm73165215e9.12.2026.11.04.05.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 05:31:05 -0800 (PST)
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
        d=suse.com; s=google; t=1793799066; x=1794403866; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEKyi63FwfdhLQCi+rq0mDadwoOTO7xrjoRDGEKx9yQ=;
        b=hHFCYSvsAeOgjPPHFVuVKep0OtZGGHuBVSzFk6s0Do4P0wWQV9Q5Y7OJNegrmhMQVi
         tJBg55YWmO+vpJDIf9ZGLgP4xSwxjr+jQPlnr85cAaHzuEerQNE5kmW94FHyjO36TLJi
         Kw1/RSUiRbk3It4tr+tx4zUdBjAFeM4Rf4sK0QO2CQYRxcGkGzETdwlXy2AGg9dcEZfd
         6ErpBEJQ2nBxI89fcjUk5+qVfWBm2VoySajpBzms/0JmZjdjiy7abMh8G+C6TI0lD/G2
         5+vF/MbOKFT230tUlQoJmSYlL/zlbUpzYjPnrbj8T3UWdsI25Iwi+FHpamThQdceBHHo
         MC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799066; x=1794403866;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEKyi63FwfdhLQCi+rq0mDadwoOTO7xrjoRDGEKx9yQ=;
        b=l/YhDRsBKPjHSCHln7Dndf7nDbAHRnYYm8VrdZlkq/M30Q63r1Qudzyj0fmBeJeg0M
         ybohbpimkf78qrrV9EGfAV4X8zVYqrMTCEjPmPtEdBwdyUChvLgkOK0vgFIIh9wmLye0
         YAbd/+TcH5I+MwXg6kdLRWO4+A6UKDXT9fboem9bo1t0i5FCex+LE9eBZBwJYxtN4kD+
         l5QzKVTHUZ5DXatByKcZuL9r+cXwf8Q593E5PSLvEEAhK/SK5UF05o+pXiZ0IvthLtd3
         /+DkF7FNhORtlMpkKkU+axOovKf936c/f7pCcH1OHY48i6Gn6XXCaZPFZxA//LKv3HcJ
         skmw==
X-Forwarded-Encrypted: i=1; AKwUvBxEWKvd2ysYouAA0cuaM63fiaNJghpyNtPJXy+hq86DYZwiirO+rv0w8tKff6zUZeI5MQ4ibKJuIQo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8jXLH89jkLEkdRSTVMFRR19850gjei0vlz8lTmu1ki6Y1QyVVx
	iPDpOkeOBB60FVmxPg7TcYQw/+DGT0OqAvdvfLDcpgvj1zpDixx9mwqqX+L4z6lixg==
X-Gm-Gg: AYBFou2Np5m3tn5AHSG4PR/klrnmrveEQ28HAyK9/mVeWxCvpBX5mBCPUrwxKKJOi1E
	LjBlZsrNenkW/97T7dR/M+H2PPw9AyFsxKUYqtbqUSSLvKokVcchnbRXpnHLdbIYLYus65LZCWe
	WFI34WB5a3oMSqXPNZATnqMl/A6H2iKW5BVa/USPdmN5haxzKvak9V+42Py7iFHPMINUNV7fJ2K
	CYMV8d76F2SSPNdHgu0SFSfwG0HwRGrTqARkdeM1HR0HYuKGgq2W1Rqmnf2rPrDrHHNre2XM6YT
	anLb2KnEMIv596W6vCz8PkYtOeqRyvgw8ZLLoMW3X4VBh5PMuSTU4KtyXDSwgLJEzkloU+Lcjrw
	3DTFd+1R3nX4cmgfSYifgKu7gBsJDKXk8UnHB7fnMCkxvFzTS7kyxKuagbZhK7gIAHYHX56Ms4d
	cEbq9CWkSNH9gIF6u7Zca7VS0ffCV/EXnsZqJXESou7LJImUlcYb52Y2LWoyv0asddIstSXrfiA
	xE0hWey5vM/6SWCRH8FkQ35WVNNzY7GoQsP0+W/qybMj8LxUi5dCjm0gIXJG3x7hBKi7vFaESwQ
	znLrwxiRGVVY/EENB2RrkfPROE/TJzELWZrodS41eisi2+TSUtSa1lBC4bRmFDKCXn7T7xd9ZpG
	dqkvaz5kIyjxL49bm
X-Received: by 2002:a05:600c:8b0a:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ac17191009mr366200125e9.11.1793799065766;
        Wed, 04 Nov 2026 05:31:05 -0800 (PST)
Message-ID: <3293924d-2333-4edd-97c1-91baa5ba00d4@suse.com>
Date: Wed, 4 Nov 2026 14:31:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate MISRA C Rule 10.1 for boolean operands of
 arithmetic
To: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a536212d9cb18b5c23d06c1c06b9a8ae03941440.1792428626.git.dmytro_prokopchuk1@epam.com>
 <83187933-b4cd-46df-b428-368d6f71cfaa@suse.com>
 <dd2f093b-4151-4c42-ba7a-c7b1ce96e02d@epam.com>
 <929b051d-2735-4d33-9240-fdf13355c11c@suse.com>
 <fddeac51-52fc-4ab9-bb24-0b3b33faf07a@epam.com>
 <6cde35ac-186f-4a9e-bd66-71b752582a21@suse.com>
 <7ce2c3c6-f73c-405e-adb5-e8a2b68427f9@epam.com>
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
In-Reply-To: <7ce2c3c6-f73c-405e-adb5-e8a2b68427f9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793799066-77AC44E9-028094A7/10/78276251493
X-purgate-type: spam
X-purgate-size: 3275
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04.11.2026 14:28, Dmytro Prokopchuk wrote:
> 
> 
> On 11/2/26 17:45, Jan Beulich wrote:
>> On 02.11.2026 15:43, Dmytro Prokopchuk wrote:
>>>
>>>
>>> On 11/2/26 12:52, Jan Beulich wrote:
>>>> On 02.11.2026 11:20, Dmytro Prokopchuk wrote:
>>>>> On 10/26/26 13:13, Jan Beulich wrote:
>>>>>> On 19.10.2026 18:54, Dmytro Prokopchuk1 wrote:
>>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>> @@ -335,6 +335,11 @@ still non-negative."
>>>>>>>     -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>>>>>>     -doc_end
>>>>>>>     
>>>>>>> +-doc_begin="The result of relational, equality and logical negation operators has type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5),
>>>>>>> +so using it as an operand of an arithmetic operator is well defined and well known to all Xen developers."
>>>>>>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||mul||add_assign||sub_assign))", "src_type(ebool||boolean)"}
>>>>>>> +-doc_end
>>>>>>
>>>>>> Why the restriction to add/sub/mul? The text ...
>>>>>
>>>>> Because this is the pattern found in the Eclair's report, and it can be
>>>>> deviated safely (as opposed to unary minus, division and remainder which
>>>>> are not included intentionally).
>>>>
>>>> Division and remainder aren't very useful with boolean operands, so can
>>>> surely be left out. However, more generally: How does "Eclair's report"
>>>> matter here? In deviation wording we want to go from what the Misra spec
>>>> says. The spec covers all operators. Hence any special casing we do
>>>> wants to be justified. And, right now at least, I see no justification
>>>> for restricting the deviation to just add/sub/mul.
>>>
>>> Agreed, the report shouldn't be the argument.
>>> The deviation should cover only the established idioms with a clear
>>> meaning, and leave the rule's protection in place elsewhere. With a
>>> Boolean operand these idioms are:
>>> - + and - (and += / -=): "count it if the condition holds",
>>> - * (and *=): "this value if the condition holds, else 0".
>>>
>>> Other operators have no such idiom (at least, I'm not aware of them).
>>
>> The use with * easily extends to <<. With that it's only logical to also
>> include >>.
>>
>> With + and - covered, it feels pretty much natural that relational
>> operators also want covering.
>>
>> Once there, and with division and modulo agreed upon to leave out, there
>> isn't that much else left, I think.
> 
> I agree these uses would be equally well defined.
> 
> My thought is about deviating them without a need. For these operators 
> there is currently nothing in Xen. Without the deviation the rule keeps 
> protecting new code: e.g. Boolean operand of << would be reported and 
> looked at, rather than silently accepted.
> 
> So I'd prefer to keep deviation limited to +, - and * (and assignment 
> forms). If you still think the wider scope is preferable, I'll of course 
> go with that in v3.

I do think the wider form is what we want to go with, yet at the same time
it's not just me to take that decision.

Jan

