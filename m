Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA526C79FA0
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 14:54:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410915.1641720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3ajN-0001QK-Hp; Mon, 07 Sep 2026 14:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410915.1641720; Mon, 07 Sep 2026 14:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3ajN-0001QD-EJ; Mon, 07 Sep 2026 14:53:57 +0000
Received: by outflank-mailman (input) for mailman id 1410915;
 Mon, 07 Sep 2026 14:53:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3ajL-0001Q7-TN
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 14:53:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3ajL-000ray-4k
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 16:53:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ecfdf-2eae-0a2a0a5409dd-0a2a450ca0ec-36
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 16:53:55 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ecffd-f479-0a2a450c0019-d1558030d01a-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 16:53:50 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso55148345e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 07:53:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c6ba4sm33307283f8f.25.2026.09.07.07.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 07:53:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1788792829; x=1789397629; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4edHddT0m1mePVUVxLLIFvpz3mhD/PlFMkh58naLP8M=;
        b=CP3WFl8Dlm5bpYgq4UscSXW+AAQHIiTcSiuWe8ZTVlHtwKHR7Cswh/7QEfqMenK3Fw
         iC5rDZ09/XCC01AEieBne/mUKVbK5AnZfRfZdFNPBOZN2B4973MDVCpeHguTold9vCLo
         DWMkmOjP1qomfl/r+/PcZa2/Cf+z1SGkiO3Dz39iJ2BP5uB89p1wEi0D1rLwKto8dvxH
         AeXLOHg3Mmwv3awRrsBhpl6dMq5bmqaeVEE3oIOA2QmyTNlIc/BrlD+7oknbWdTKJn9I
         PyBOUlu0WqriT+pDqC3icX6luP+2EGsmlagS+S6kPNCE5YgQXaPosuk66rh5SIcq/fOo
         9yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792829; x=1789397629;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4edHddT0m1mePVUVxLLIFvpz3mhD/PlFMkh58naLP8M=;
        b=owXVELOlvw2OzyCKfpkv5ZjYgwsoH7k8Yu9DjXq3Kp1xH0YsVrD58xC8G9cHm/3WI3
         ie1BESv0XpiLW+hngJ2+2LzUnDs3ermePIYv7VON8TjpBp+dutWcbq7gkzHBRd0CRQPc
         neHcFKx6h+5IpOgfXEzrEkXvVzKb437/iw+LFk3GuiO16ywIxd8k8dLlNRYt4u92SNXe
         mmgsVOQUjooWsBZeaUIYYYNJWczj90fM404jg5RFH3P6TZRY24HkOb+hVrb+GDlnDQ6t
         6z5/2WwyDKRWTb585RlEhT9FDMpwCVLN/0f57iPdbgHY4e/W2L/IESp/iK7VXKUfpjm6
         ccig==
X-Forwarded-Encrypted: i=1; AKwUvBwzmoIssXy2akyYETgzXn1Pc9kVMpm7eUubSO4V6B+mZI7aFY4nTeGXyPp4sRyzdRk8uKw0JiViE2E=@lists.xenproject.org
X-Gm-Message-State: AFuF++mTtWAwtjhQ2uOiwDf37JO+/Exko6xZY15ZTqxkL0vIRzoJcDc3
	JAmv7O+EumuWxObXMKD7AVydheGXb9bAzsOyXoZpJBHMRNnaowQuWw3nbh1DXVQjLQ==
X-Gm-Gg: AYBFou2IW0YkQt7Qzdi1xlKkP7qtANGq7M+IwELkdxuau0NOTgLcRkWeu5yhyEfYYol
	wdxLOMOy5LxFr7Ig/ZoEI3nxQdQLjWYU5W1DIg7KXrRl9ZLmtUipqql3Mde3VDgSWK+97BUsZQj
	K0PfmhGzdZCQ00uPPRvvgm49OvLiKbHheuDQ8dqaVmFLCKECw+uUJaAAcCA3oQb/ZxqOyeTfFUC
	cA5I8bZa9REhSjkZkjGFJc4aTwEwnV3n2kk+qJTHSK1NDZQH5j0P678ay5SZKTfsTziVDUslrO1
	3nweQC6/5rqkysLhZv6jsVeP9Jc27JB6iyaWSRfaVyirquiyUR4iuRp6iUZi+M4ULdLucNy5/aL
	iwf+OJABatzJse0+NJ31+H8PqOnrfDt2NVpLeH2aa45UJdMlso74ZpH9qYM2vTGIlV3g1nlZMf7
	473Wn17kQWljmtlV0Una90JBCGtUciXLUSUfMqTvSzOfgaTwcdhUzeu7Ax0J0u0jVtY6NW1wi31
	XLtByB/qxbRLqJYapOA3x91vutex19njzgQ1bwoU+cmXlaCbBDR
X-Received: by 2002:a05:600c:3e06:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49d00991db1mr166780145e9.9.1788792829490;
        Mon, 07 Sep 2026 07:53:49 -0700 (PDT)
Message-ID: <33a7c1f0-9bc2-4256-8234-91d7d6823db4@suse.com>
Date: Mon, 7 Sep 2026 16:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] public/xen.h: Update comment on mmu_update sub-command
 size and PTE alignment
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <1787563949.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3@vates.tech>
 <94e4e14c-11bb-48cf-aced-7ed6be8ad34a@suse.com>
 <1788789406.8631fc262581453bbf619ec5b2062170.1a07c283b48000c4f3@vates.tech>
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
In-Reply-To: <1788789406.8631fc262581453bbf619ec5b2062170.1a07c283b48000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788792835-032D8A5B-52DF429E/0/0
X-purgate-type: clean
X-purgate-size: 3058

On 07.09.2026 15:56, Teddy Astie wrote:
> Le 24/08/2026 à 14:13, Jan Beulich a écrit :
>> On 24.08.2026 11:31, Teddy Astie wrote:
>>> HYPERVISOR_mmu_update passes a set of request, where each request has a pointer
>>> to the PTE along with a sub-command.
>>>
>>> The PTE alignment padding is used to transport the sub-command while the rest
>>
>> There's no "alignment padding" here. It's the low bits of a necessarily-aligned
>> PTE which are used.
>>
>>> is used as an address to a PTE entry. The current documentation state that the
>>
>> Nit: states
>>
>>> 2 first bits are used for sub-command, hence the other ones for PTE which
>>
>> Better "2 low its", as "first" is ambiguous.
>>
>>> imply here a 4-bytes alignment on PTEs.
>>
>> The part after the comma I'm having trouble parsing. Can this please be re-
>> written some?
> 
> I agree, the wording is a bit weird. Though the name of the fields makes 
> it a bit odd to work with.
> 
> We have in struct mmu_update
> 
>   uint64_t ptr;       /* Machine address of PTE. */
> 
> yet, ptr is actually something like (pte_addr | sub_command).
> 
> So we probably want to say that it's a number composed of a 8-byte 
> aligned PTE address combined with 3 low bits large sub-command ?

Along these lines, yes.

>>> On PV64 and PV32-PAE guests, all pagetable PTEs are 8-bytes aligned, hence
>>> off-by-4 PTEs addresses are always incorrect. Non-PAE PV32 guests used
>>> "legacy pagetables" which had 4-byte aligned PTEs. However, support had
>>> been completely removed since Xen 4.0, and was only available when Xen was
>>> built in 32-bits non-PAE mode [1].
>>>
>>> Current Xen logic behaves as if 3 bits are used as sub-command, thus all
>>> off-by-4 PTEs are actually rejected as being unknown sub-commands.
>>>
>>> Adjust the documentation to match the current logic implemented in Xen,
>>> also expanding the documented sub-command parameter to 3 bits.
>>>
>>> [1] 84d54d5d8b31 ("i386: Remove non-PAE hypervisor build target.")
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>
>> Did you forget to also add a From: tag?
>>
>>> @@ -260,21 +260,26 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>>>    * hypercall. Also if so desired the OS can also try to write to the PTE
>>>    * and be trapped by the hypervisor (as the PTE entry is RO).
>>>    *
>>> + * Note: Historically, Xen had support for non-PAE PV guests with 4-bytes wide
>>> + *       PTEs (if Xen was built in non-PAE mode); which support got removed in
>>
>> A native speaker may correct me, but "which support" reads odd to me. Imo either
>> "that support" or "support for which" (and then perhaps with a comma in place of
>> the semicolon).
>>
> 
> Maybe it can be reworded as
> 
> Xen had support for non-PAE PV guests with 4-bytes wide PTEs (if Xen was 
> built in non-PAE mode) until Xen 4.0.

That'll be fine with me. Preferably "32-bit" instead of "4-bytes wide", though.

Jan

