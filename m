Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ABF60A3832
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=am7fNx+d
Received: from list by lists.xenproject.org with outflank-mailman.1481409.1685275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQicR-0001n7-8M; Tue, 10 Nov 2026 09:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481409.1685275; Tue, 10 Nov 2026 09:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQicR-0001n0-4k; Tue, 10 Nov 2026 09:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1481409;
 Tue, 10 Nov 2026 09:58:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQicP-0001mX-Qy
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:58:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQicP-00AWCl-74
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:58:21 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2eabb-2eae-0a2a0a5409dd-0a2a4509d3ea-14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:58:21 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2eabc-be1a-0a2a45090019-d155802fb49c-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:58:20 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4b7252a32c8so19052875e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 01:58:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba022fbf75sm44276215e9.0.2026.11.10.01.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 01:58:20 -0800 (PST)
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
        d=suse.com; s=google; t=1794304700; x=1794909500; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5eLmrR3RE15k5BHAwxkm9YPoCdckNav8+yfVLb/hfU=;
        b=am7fNx+dn21wdvz6pajo/AZOiMiOLZmPYNMSJiXqyo8rUco9d1nY1lMuo9Eib2s0+2
         XP1kmI2IyIcZwUrly3Di7/NDdb9z6J/ku3+E/Tf3DJIKNd2oiFglZ1Tz5fLc1qRTE7KV
         jGwuJiEf0LJAa+eQ0NR6INvXakOxGUdE8XdG80Ci7wcO4GACUsLY8LpakNCN2WBEsEHa
         hyHQhGZGVm8BjNZYR6cxBWslPuvLQlMyaEigPNwv8ezUrRxM6N7IN24WYuG0F5rl0AD9
         iiGOwg35EpyRLfO2oy0D6oZFMmU5kXLvDedkqkBGVnsJW0OSMQfdi6vqFloBv33UkIOz
         F1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304700; x=1794909500;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5eLmrR3RE15k5BHAwxkm9YPoCdckNav8+yfVLb/hfU=;
        b=Gbho316i7rjbUZ89aROnXhUM4m++zkmeO4QIFM/8cD3vTQINpwpof8JM6PWSiu1CI/
         E4noy6IAE6yVDX88VhPshnjGyb3eKGIBsHUOVFvOy5vxCmM9Je/jXMQllRCrrwCGQ9CA
         IAme/VhF2GnGiJaTTmsJONAp6ehwJa8oN4E026JAunuv/a5Q3edCUGgZ0tQXrzNogXZI
         5I777VMG7T1Stte655IyTYMxe4F56PALHUHrzDbumsefDlDg/wKOszXr9XThVAP4qbMr
         YOHrCc0EZqACBTkyaGiHpsAq/1b8CJ23qKFET70Z5jSS2pBdJE/wUQzU82/oEH3UL3tL
         P/3w==
X-Forwarded-Encrypted: i=1; AL+hErF5R8Q0PZCWfBJkuccZJWIUMP7LJzo3ITuBUuoYhiBqJawDBgfrO+t6ieIrq6FOccnS9l2PNObIA/g=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9QrLDeOGkuXUTG956zXp1ZY17TttVytKzlhoAdL6IhM4FmiJMh
	FwhScsj4g7EudQFnEpRxpk8rMDMDhJmhp2y+M3kyil80jyYvN/o+u5+fhHGdeu7uuA==
X-Gm-Gg: AYBFou3j7hde62ygXEl+wmNEMCxb5SS0fKjTSyf90EfQy2meLBq2iqe7J5T5ZPZxdQ1
	3J2AwxB3usVHxeagZPx8/dgdSclXFPRdwJXZC1TciItzJd8waHjWbjUMB18TLmY9HiFww2XwOAA
	Ba/P4Zfh0ITG2/e1mn96yjKRLqccTccEXZxdiux/5+TfA/GAg209lBNtaDY+i/WAtk6qIFd6cV+
	tq8fhiul8a403ODiBNW0msKOpBcwoL275AP59RI7z5YkJCobpIF7z12eiYV1sHBabiaWZ8DatRX
	AWr8XuJ7cZMiiJ8gcm+qxhHKPRtcjSvkhkhLc2suWTm2OO+QIdl4GurMCa2WuxSvdXMOYer2YV0
	ag6Ov539hfWIzMX5hfCcDKGp5qxRraYl8sqJOymP4MOqQc1Kwq4mfgzWUr0Uzsx0MxQQfBN37He
	+95xuUXPQO4CbolfkFc5MRdDze+3r5MfsjcJ62F+jCXjWYx4QBHPa7+gDayJgctaHh6HYrziiFU
	FUf+V/SCxvY69AF6yO7X1i8q8fbBEDzw8Nc3SN+XmTdLr01JfntAghvHaX+SvUrwpqXf/ncIKtz
	byGdHhdjBYjz4PF8Lm7x3+AaG/rFzAx2m1d9VVCcpD8Evzc7BpwBY9bQqStB8bqc8AG1iVcEe0B
	3hSgcUpCtaIP+ldFXmQ==
X-Received: by 2002:a05:600c:5254:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4ba023494c0mr33609395e9.20.1794304700483;
        Tue, 10 Nov 2026 01:58:20 -0800 (PST)
Message-ID: <21557e4f-305e-4a21-8c57-aadcb77fabd9@suse.com>
Date: Tue, 10 Nov 2026 10:58:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: deviate MISRA C Rule 10.1 for boolean operands
 of arithmetic
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <810b14fef78b77572a87a7268aa718274b975f80.1794298911.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <810b14fef78b77572a87a7268aa718274b975f80.1794298911.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794304701-BCCCF034-6813E9DA/10/78276251493
X-purgate-type: spam
X-purgate-size: 1917
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 10:25, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 10.1 states: "Operands shall not be of an inappropriate
> essential type".
> 
> The result of relational, equality and logical negation operators has
> type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5). An object
> or function result of type bool has value 0 or 1 too, and it is
> promoted to int (C99 6.3.1.2, 6.3.1.1p2). Using that value as an
> operand of binary +, -, *, <<, >>, <, >, <=, >= and of +=, -=, *=,
> <<=, >>= is well-defined. Division, remainder, unary plus and minus,

We did discuss division and remainder. What's wrong with unary plus and
minus? Unary minus in particular can be used to create a mask value from
a boolean (all bits set or all bits clear). And why would unary plus and
minus be excluded when bitwise complement (which is less useful with a
boolean operand than unary minus) is not?

As to relational operators (which it looks like we didn't discuss in v1):
Is it possible to express anything with them which cannot be expressed
with equality operators? If not, I'd suggest keeping them out as well.

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -335,6 +335,10 @@ still non-negative."
>  -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>  -doc_end
>  
> +-doc_begin="A 0-or-1 Boolean operand of binary +, -, *, <<, >>, <, >, <=, >= and of +=, -=, *=, <<=, >>= is safe. See docs/misra/deviations.rst for the full explanation."
> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||add_assign||sub_assign||mul||mul_assign||shl||shr||shl_assign||shr_assign||lt||gt||le||ge))", "src_type(ebool||boolean)"}

Imo this wants shortening by making use of regex-es (provided such can be
used here).

Jan

