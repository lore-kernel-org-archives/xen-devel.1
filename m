Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3160606B1D9
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HcWDT/M7
Received: from list by lists.xenproject.org with outflank-mailman.1468461.1677557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNuES-0008JV-Os; Mon, 02 Nov 2026 15:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468461.1677557; Mon, 02 Nov 2026 15:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNuES-0008JO-LO; Mon, 02 Nov 2026 15:46:00 +0000
Received: by outflank-mailman (input) for mailman id 1468461;
 Mon, 02 Nov 2026 15:45:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNuER-0008JI-6z
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:45:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNuEQ-000SS0-Jn
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 16:45:58 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8b02a-e002-0a2a0a5209dd-0a2a450adf08-22
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 16:45:55 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8b033-f2d2-0a2a450a0019-d155dd36d4be-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 16:45:55 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48e00eee27dso1574700f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 07:45:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d4f9sm21009735f8f.2.2026.11.02.07.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 07:45:54 -0800 (PST)
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
        d=suse.com; s=google; t=1793634355; x=1794239155; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgnpjN07xx918bsvOgOOZRIdz0VDMkS97pExvRDMKJI=;
        b=HcWDT/M7TSIN2y70TkCKNaVy2WSrhYo6pd5/JSEAFxhLn44RyWtv4x5gnYGwIASZxl
         Skua+MGr6Nu+vV2Q/eT2SWA1pOpyU5xHskzupIsSea0IF8VlA2apbs8dLpGmzincDu5O
         73flYFh1lT0VCAqICdNCEqJhuBxOa2k40EFYr0m0uAbzxWTh+xsuWErUxeUy0QrDYXCn
         6yGtqRctzUhtaC47+yf9gB1OFDaZpSRUIRnsvMZcs5RksGPhKjFTVQn4m2Rhm6N+qytz
         xpgHD9zX51CSh4Ak+rOBQ1h3w8HKBqFHSsrdjirbi8r2WaSyNZOo2xTbmtg4LeN/+l7C
         mQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634355; x=1794239155;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgnpjN07xx918bsvOgOOZRIdz0VDMkS97pExvRDMKJI=;
        b=UklrM6bme3vt1vIEcdtFNv7tEcM58DYLb5MresyNGsEhIKEHgGqVPfH6/+SUprEeLY
         vophjHQjfcefGTMZA+zGzbBMUhwKi5YxSPqt1nT28S3BgvptcwMqcYi776kvZErH3ExY
         kJgc3zWer3s04wZCPymqOTdSXYoZ1+wriK6RUlGBVWTIEfITaH7TuTous+0pJmiTvQYH
         wlBgYkc8SSGR/FvQaIcyOeU/kfgUjUYPrTqMJZBFfSUE85RA5lHDOMT+E/ad285bg5B1
         cLV+vp2gyuCs5Gd5IRUfg+RFRzB5/Uw9aXPH7MLWaGQh8UMt5XeRnTGjy5V0FiIsiHce
         d7Og==
X-Forwarded-Encrypted: i=1; AKwUvBzaqtVMc5ABGIVpz6hrUk38PPZALAukTMgoFGblRJ4xES6PuCIMm1u96uQX1fllG0zs1PEyxM+gzZ0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9Apxm8o6hhxcz8/yQZgLRSJrEmbtXwvF+XOb77GTB+b6RTTUf2
	knSG4QCEIt9GkgWzb8Hhi6lyYJ7zRHZ5Vvf2+t+qCI3l3Y2jR+rjGLt17Wp/EuOSqjkC7nfkkiR
	39kUTCg==
X-Gm-Gg: AYBFou15ApKGBlXt8o3VkaM1JN9Tihf/IaQbUn9nb938QwyN0NLc/Umr8Tqwga2KjZ5
	0H6sIsr/MQY+ys5IKXiy6j6pbcAVJ6WF0yoQX4pzzv7IcZv2l19lIXEk4DHjNPADPlHGMr0/po1
	4SVC6WQkphGwXXQilUC1QggIU9tu2XfIMfS1Cs65dcAAY+5twD20Pzp8ZlAVSxjRCMsxMiRNJxC
	qpUaWE5rXlY7dGUysBFQXhfkeUIImmw5YiB/zilXkKhoJQ7UHvJeMO5csCfrHX26ZaSjJ02cCF4
	I8UqGEslrIUAUsDkBZo6bbPYTGBow1Tv2d1Z7T/qtpSbxT9yzvmMo3O7McwTqlULBVLkphKqbJf
	ZqrvkFlJLXbgMzmFiVyWVMrMAH8phPMTDep4HFFc+62BL5HEPM2+Y+HqHlOaWUPU9ltiwCP+y6n
	Qa5hqH99aVmu43ie/NpJnV/GOGWJ7n3oICl5PjIcBeV6Yw39usCi2SmQIVMCtY2fWEdw5I/CjKP
	slvn5TZdOgHqXc+IDVvaNmCY+/k+9i9mpnvXnwngSVTWdIzbG8sCj66Gxu5ZS/HPpMIKnatNUmX
	B1dnFA3Ee1kwg8AgMgRR9rn45uhf8Y28scAtONYjbxIwGrX5JstPeSZAOhfrkMA7DvGiB9h2vG/
	Wh2HpWKK+zUPfMFQ=
X-Received: by 2002:a05:6000:2603:b0:48e:932:aef3 with SMTP id ffacd0b85a97d-48e6e30417amr23287223f8f.23.1793634354689;
        Mon, 02 Nov 2026 07:45:54 -0800 (PST)
Message-ID: <6cde35ac-186f-4a9e-bd66-71b752582a21@suse.com>
Date: Mon, 2 Nov 2026 16:45:53 +0100
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
In-Reply-To: <fddeac51-52fc-4ab9-bb24-0b3b33faf07a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793634355-518C5CFC-98C23063/10/78276251493
X-purgate-type: spam
X-purgate-size: 2452
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02.11.2026 15:43, Dmytro Prokopchuk wrote:
> 
> 
> On 11/2/26 12:52, Jan Beulich wrote:
>> On 02.11.2026 11:20, Dmytro Prokopchuk wrote:
>>> On 10/26/26 13:13, Jan Beulich wrote:
>>>> On 19.10.2026 18:54, Dmytro Prokopchuk1 wrote:
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -335,6 +335,11 @@ still non-negative."
>>>>>    -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>>>>    -doc_end
>>>>>    
>>>>> +-doc_begin="The result of relational, equality and logical negation operators has type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5),
>>>>> +so using it as an operand of an arithmetic operator is well defined and well known to all Xen developers."
>>>>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||mul||add_assign||sub_assign))", "src_type(ebool||boolean)"}
>>>>> +-doc_end
>>>>
>>>> Why the restriction to add/sub/mul? The text ...
>>>
>>> Because this is the pattern found in the Eclair's report, and it can be
>>> deviated safely (as opposed to unary minus, division and remainder which
>>> are not included intentionally).
>>
>> Division and remainder aren't very useful with boolean operands, so can
>> surely be left out. However, more generally: How does "Eclair's report"
>> matter here? In deviation wording we want to go from what the Misra spec
>> says. The spec covers all operators. Hence any special casing we do
>> wants to be justified. And, right now at least, I see no justification
>> for restricting the deviation to just add/sub/mul.
> 
> Agreed, the report shouldn't be the argument.
> The deviation should cover only the established idioms with a clear 
> meaning, and leave the rule's protection in place elsewhere. With a 
> Boolean operand these idioms are:
> - + and - (and += / -=): "count it if the condition holds",
> - * (and *=): "this value if the condition holds, else 0".
> 
> Other operators have no such idiom (at least, I'm not aware of them).

The use with * easily extends to <<. With that it's only logical to also
include >>.

With + and - covered, it feels pretty much natural that relational
operators also want covering.

Once there, and with division and modulo agreed upon to leave out, there
isn't that much else left, I think.

Jan

