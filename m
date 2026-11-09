Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467B606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YGsJj7i2
Received: from list by lists.xenproject.org with outflank-mailman.1479605.1683526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJi8-0006LE-2U; Mon, 09 Nov 2026 07:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479605.1683526; Mon, 09 Nov 2026 07:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJi7-0006L5-VK; Mon, 09 Nov 2026 07:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1479605;
 Mon, 09 Nov 2026 07:22:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQJi7-0006Kz-1Q
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 07:22:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQJi6-001iuG-3d
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 08:22:34 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af174a8-8faa-0a2a0a5109dd-0a2a4501c1e0-34
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 08:22:30 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af174b6-5984-0a2a45010019-d155802be52e-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 08:22:30 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso3131725e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:22:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90f10c701sm112602405e9.11.2026.11.08.23.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2026 23:22:29 -0800 (PST)
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
        d=suse.com; s=google; t=1794208950; x=1794813750; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QNUdsmxeafB4K8/wWuN6x0mlIeIZ7jN+soPpETr894=;
        b=YGsJj7i2IIRiRvL4MdPAQYEiPhNVSZ9tqj3QpqRx+vNHnSmUkuP4ALf2JJk6rbCo8+
         GwT7J6UB68hIWDu2fxxtavpB1/UQ31LqfLs+gwhDd7byQ67Dh3FVD8Qv6Bfwxh1BOZII
         NnCYw9HYPl0S4zZNghEUSSercuoQMzWvc3AgFLIKeHD0ByMw9vAxhhgZtbvAs/Q4hXD7
         kzfC1n4qei6ygbtokslPg/Aj3tuFvWJkHwE3F4VzbBaz6E+aBJ3Zu1qkATZiWyNW2wTJ
         4veHzbZUvmYbiCxtMvUwbfc4/of/Btke/Y9Q+lHymHso6fEltzkM9ifdr9NaqaSztLrE
         5szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208950; x=1794813750;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QNUdsmxeafB4K8/wWuN6x0mlIeIZ7jN+soPpETr894=;
        b=YVKx3utVtNKZYb4mnJnaSagJTrS4t5yQWfS3EbXeg5EbucvwIWOdBixCV+Fv165I9n
         ZgRggD0NwYMInn2LW383YBWJeLDAmb5Xz1j6AlQbXablw6E9o6BAbXPhhLSDn+Bo9CNo
         cCRQgW4rhcE60oZCjIc+Lj43mFd+MGVSCRwtaJn8k2crVr67qAmJO46P5enLYOQvij71
         aaA8nejgbaAMbTq5aalYVPkhL67koT25loT6ev0hI9jCsYKYahRvwOen7U4GqUnS42uT
         4eIhIgxEb7q8/jDyB8rz9iEfzckjAqnf2HnFHGmEVmp/+ca44xQdbomwn5CC8yOKKodE
         KW8w==
X-Forwarded-Encrypted: i=1; AL+hErGUGb5ZhRLJZaVZb+8TmaBoub14dhGfYEfA684moe8pgCcSbzOWShy7wHYGuaA3ZHG5TkHUODkF3a8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/P5xpYt/EYCfp2tfwfzf8j6GmeeWke0YPXzyLGUw9OcP4/AjSs
	QOq2GuDl1qMhWhr3j9PCmH+bNk9VCg715PLJKCBJoOnrvYr8Yd97zORMj/xhUE9jwQ==
X-Gm-Gg: AYBFou0dX4jyDQq9wQphH8OuGncsepLt1+qxwDcqxJ5NhJiXSddj3KyxZd7RWU701IX
	KtPeGFH/atGHJ1o+6HOFxL9aph8bFV6Gf+Q0lAuQF/pHS7jN9Sgbc/+ti62yJ0X7YP4e8Wry4tt
	uU+BiexWn1cT5zM60KK8WnEHX0xTpGst8oQQe7kbZiVaqgg7LM9uyodXXFBIO4/6wHwh7Y492y5
	VKUUs8gIf8Lg7twWpX7ArPj7tFZ3fWKiRa3fzysQxP3dZTL54ez1FpIrody6QlVNBBHRueZGlHP
	c8l7A0uv/nzOCdsw1zgk++JrAi+eIj437tyVp00WvtYz/kzX8jtmIFLEg0/MJHq7AHeOMBYogzA
	t90l+GkjHemjrEA6W0/BCfUesVdZsXSc3XIY1RMQ+9BVNbxKbWVuVxAyhKVEAYko8UIr9CUxpeA
	UkWOirzcZFXk3affXWMqCM7hyB6OdY6wY4wBYwkmkx6AIJxU+qUQhVvoPU54IN68utbb1UrSKxX
	MzbRWwXyCumwUtseg+9Qpj996fDqOS0MTi0BHG2xPlVWhrTOTDAc8R1uLHhuG+gmTw3Sifm03Sb
	4Pi9YQRf99OMX/6wtsSXse2mnDQtBZ9ug1/I9EqprHapCBhrSHfpMM/0sGvWZcKy4theFvbpX5I
	c7Z77f6/vtqAjZfzV
X-Received: by 2002:a05:600c:314f:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4b963c73aa2mr61543125e9.25.1794208950096;
        Sun, 08 Nov 2026 23:22:30 -0800 (PST)
Message-ID: <b1c8cf89-57c7-4fbe-8417-a524d5a680bd@suse.com>
Date: Mon, 9 Nov 2026 08:22:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufreq: allocate processor_pminfo[] dynamically
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9cd6da48-7a5e-4971-93e1-7d7262ddf7fc@suse.com>
 <00e27752-0049-4112-9ce8-97f0d2788d1a@amd.com>
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
In-Reply-To: <00e27752-0049-4112-9ce8-97f0d2788d1a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794208950-C4B45757-7905E2DF/10/78276251493
X-purgate-type: spam
X-purgate-size: 1142
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.11.2026 00:44, Jason Andryuk wrote:
> On 2026-11-03 07:53, Jan Beulich wrote:
>> There's no need to have a NR_CPUS-dimensioned static array there.
>>
>> As ordering of pre-SMP initcalls isn't well-defined, allocate the array
>> from both cpufreq_presmp_init() and cpufreq_register_driver().
>>
>> Alongside adding a few NULL checks, drop a redundant one from
>> get_cpufreq_para().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/drivers/acpi/pm-op.c
>> +++ b/xen/drivers/acpi/pm-op.c
>> @@ -104,8 +104,7 @@ static int get_cpufreq_para(struct xen_s
>>       pmpt = processor_pminfo[op->cpuid];
>>       policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
>>   
>> -    if ( !pmpt ||
>> -         ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
>> +    if ( ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
> 
> It's redundant today, but that depends on the other check.  Though maybe 
> get_cpufreq_para could take pmpt as an argument?

Perhaps, yet I'd view this as an independent change.

> Anyway:
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks again.

Jan

