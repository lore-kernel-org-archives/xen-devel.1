Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C09606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OIDXt7CT
Received: from list by lists.xenproject.org with outflank-mailman.1468117.1677143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNpet-00019I-Ce; Mon, 02 Nov 2026 10:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468117.1677143; Mon, 02 Nov 2026 10:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNpet-00019B-7x; Mon, 02 Nov 2026 10:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1468117;
 Mon, 02 Nov 2026 10:52:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNpes-00017s-5t
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:52:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNper-006t8q-3L
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 11:52:57 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae86b68-8faa-0a2a0a5109dd-0a2a4501d162-42
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:52:54 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae86b85-5984-0a2a45010019-d155802bc9b1-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:52:54 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so21519015e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 02:52:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8a84esm21416598f8f.39.2026.11.02.02.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 02:52:53 -0800 (PST)
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
        d=suse.com; s=google; t=1793616773; x=1794221573; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrty6JBhFtVL8uV3JET7wNOpx3Uc4x0jRrpd/K1spgM=;
        b=OIDXt7CTQ5oO3HQ+/KZLKlraNAVYxGkmSBHp6WM+nrj32sdaCYSYvePDS9iyVSziYo
         2vJcYn1fqSpbGaX8w1YENyX2egPi6zvbaUZqcGdmaNd0/hRYd7WtTTDuzVxHyUq0hABs
         JrNGjJEDpCs+/QsJQ4ws1PGrNZ3h+HhVh2TIgLQ+qVYUt13eLw5BvHbZGrYiTywOjxPT
         P8M8n829bR96WIeXWucsNa25OcNfTZFpjjK/twkouB5rBl/hi4B3oV3i5j0Ez4FqfTmh
         6r2IzhduZn6RwXLwgfrAxGxQp15w7lyWqH+7hlk2IWf0+6EDaT/6tF1bzsp8UD0EqVVP
         dLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616773; x=1794221573;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrty6JBhFtVL8uV3JET7wNOpx3Uc4x0jRrpd/K1spgM=;
        b=ssNd4riImfNMWcAjZ2iJxi6H+Ss7bYpv2+ktxj4IOebenhpheoXyZa9w7glKh9O5D3
         N3LfZMq3jhrDFcvnBfQetdx8cntHPIT39YBF1Ow4HvuWimlCgsPG9Y5bZEB+2KjA8qWP
         0+G0H8/iYGAMVznr2xXOK3lYilIbaQY9f7obkjbl6ffVAD+fXIKmn/I5N92oM6FsCJnt
         3kLl4U4o+P0lJpoT8VPw01zJO1+6wzRYk43c+KLkTzesDV4JXuRO9KLeGhpyKnX0tRyD
         pNqSzwA0ihyw41wzwZuYSuynv2S1tDqOSm8V3jtlf0f8EJXcj9F6zJn2l+KZY2M5TB1I
         3JPA==
X-Forwarded-Encrypted: i=1; AKwUvBwgtDnhQuHLgmJlJNQcecTVxOq8FC6AroRc5UDZMxAHbyjviAtw7dgoT9vJZH98z/f6xr9Mjn1BEUc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI5lZGVSfpLUCvV93s++5+VpEGzvs1HICRYHYpzuhWJfvh9qGT4
	ddtvFgXiqlHyHPnAKJo1xPZmUUg2HwG01ZQJo10mJBc0Rr5CKN7kilBnspJ62hIY4g==
X-Gm-Gg: AYBFou0MP3y3smrCGlSAgf2g9BkoLu0B67gR9piiG/npZjRM/GNTuN+noI1NmjhuZOK
	3wNJ7y59GdIPx6bP4O7274vKjQNlHXI3XDy05zOJ2ro/UvIKoxrmaqyyCheFwgDN4tFJct1pujE
	BRAi5sEN0Hz0lNClJyOQQeOEwUMImSnFiDETz1NenY6Ex+q0YHogICm5V18r+9snyvDW8H7hXNB
	4SxtXMMTqJulCJt1UP8bcxdzqQ10AOXwbftOSyUIfiF3PDg38BrhZ4fOr+5hKwKsvyNd/NaAUy2
	xYybXzk7cdPLSFB9azh8U3N0puHYH/C7kFQdOAQ06eOAq7pWhlBoAwt8FwSqhILSvkj28Sb1gS4
	R/EhuyI9HILkum3QY46S1KJmol6mkNaeHpcrp5Ae7GWDOntXetFpLztmUBQ2S6GxY/OZT847nXR
	9vUtpskIHBY4rHUnpdIbccjydSJEvFsq1/cdd8acX22kIRDyboanSkgi1z9RuaMVPYqy7sX5Rm2
	eFXNg7Q8YCM2qA/VFbz7dFcbsWoSz5n35X9/thzD1SbH4QKAaPz2ul2fRt4NUprVyVioF3EVFdV
	3X7uXoq4aFNCJm0KdUnyq3s60zpAHI9I0ArT8NqsJdssCLsD0IyLSRo+1QYG4WNliNb71Xw3JBf
	E9RT8aloYwy32SaQ=
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ac1889d5a1mr215598435e9.28.1793616773521;
        Mon, 02 Nov 2026 02:52:53 -0800 (PST)
Message-ID: <929b051d-2735-4d33-9240-fdf13355c11c@suse.com>
Date: Mon, 2 Nov 2026 11:52:52 +0100
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
In-Reply-To: <dd2f093b-4151-4c42-ba7a-c7b1ce96e02d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793616774-BEE60757-662A5C55/10/78276251493
X-purgate-type: spam
X-purgate-size: 1559
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02.11.2026 11:20, Dmytro Prokopchuk wrote:
> On 10/26/26 13:13, Jan Beulich wrote:
>> On 19.10.2026 18:54, Dmytro Prokopchuk1 wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -335,6 +335,11 @@ still non-negative."
>>>   -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>>   -doc_end
>>>   
>>> +-doc_begin="The result of relational, equality and logical negation operators has type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5),
>>> +so using it as an operand of an arithmetic operator is well defined and well known to all Xen developers."
>>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||mul||add_assign||sub_assign))", "src_type(ebool||boolean)"}
>>> +-doc_end
>>
>> Why the restriction to add/sub/mul? The text ...
> 
> Because this is the pattern found in the Eclair's report, and it can be 
> deviated safely (as opposed to unary minus, division and remainder which 
> are not included intentionally).

Division and remainder aren't very useful with boolean operands, so can
surely be left out. However, more generally: How does "Eclair's report"
matter here? In deviation wording we want to go from what the Misra spec
says. The spec covers all operators. Hence any special casing we do
wants to be justified. And, right now at least, I see no justification
for restricting the deviation to just add/sub/mul.

Jan

