Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105E4CC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:28:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448036.1664025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeQ7-0000qO-SR; Tue, 13 Oct 2026 15:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448036.1664025; Tue, 13 Oct 2026 15:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeQ7-0000qH-PY; Tue, 13 Oct 2026 15:28:03 +0000
Received: by outflank-mailman (input) for mailman id 1448036;
 Tue, 13 Oct 2026 15:28:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGeQ6-0000qB-6J
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:28:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGeQ5-00ADZ1-JM
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:28:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace4df6-8faa-0a2a0a5109dd-0a2a4505b9d0-36
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:28:01 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace4e01-4cb1-0a2a45050019-d155802cc83d-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:28:01 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4956869750eso23509715e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:28:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be964dfsm365369895e9.7.2026.10.13.08.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 08:27:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1791905281; x=1792510081; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+adB/lSV5aRZCnfxRM1GINh1x+YdY7V7O2gRyvNPaA=;
        b=L8240Eduu8Gu5V6jZkS+7Nb0cPkYcVezSVpIy15ASfY+ckZ2+kuL/bGwBL/QFOvvw7
         rNV28VSVHz4gdX0LDUrlmuxxmHhQYTTy/spm1+n1sRIEe2RztZ6Vs1Or6pjwd3o8vUzd
         X+Z6gWorKaM0rGLD7MGA+RVn2ySbNw6tXWABZqIFnmmj/wh9gk2H7yB5ou5mgXB3AFs+
         QoUMqcIspMUbBlmadiyRsHFPigBUmC2DwmEkSZSjPgX8XwV+FCQu3TNLkH+YACDocP1b
         VtIzBrDgn5FmSgc4OEMrlfWd/wePPgXCbOpZv4S3aoH5p9Q6tebvQFGTGZnpxLFuRNWZ
         GqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791905281; x=1792510081;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+adB/lSV5aRZCnfxRM1GINh1x+YdY7V7O2gRyvNPaA=;
        b=DeUT5QTa8Z8Yy/+6vqlsEuzpp8m9Ou6JOZwy5OLv17paWPr+WlmXMB4tZaTIfXkq8D
         da80PL2q6krhb66TTPS8LDh/uj0PxoQDA7mt3bmuKANUiE8t2REVJyywgla/BlTaLf5X
         V3XV6GBGC5WO4KuzLGX86ltrzVR9Tz089oXBwzseyouaG4INuOezTC9ScS8nzNie4IPf
         ts7yhycTEN6YSnfoON5AZRPvRdgSC94LNnOkuQrOKsOidxb1rdDyUmglCMngniihBqGr
         IJg+iIrZvsziNpMlC5e6B2oVPcQukcBh20IP2xSHV5sui7YknFwgC1Ql8qxa2YuUwh41
         /56Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7Ck4MJd1zLpiE91u4jJrJLxVbMbaeUjI/A61NUfw+T/ImelpX6VkqELUM1gtDCOCkZwAOh16fFYI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLNePhpVUUbU7acVaf6xgk5wR9glJnJyFb/RtvPvTxo7XcQrZ99
	layp7JsmPqu2I/V9Zw/Q1YS7JKn9ClKlKW9eGyV1X8C6E95lGZxGxJVR8IucX45sY8CVVO0h1WJ
	SWors2Q==
X-Gm-Gg: AYBFou2BRYdDAXQkBXBelhK8Y6U0E78tvNUGaJCfVHu0TqD3LHtaoC2b0dQhOOh6Fv5
	Yxs6/2EPx1tFkbw0dg7OEszx+cD22KdzQRySUyJrIWzCJHDkw8u4QsODEuw6z77QziZ4mbtB9JD
	WcWqU1ldMprDBHgWwm3EEaZ0Irn3mJAXQTXWnOWRU6WojQ1/L0S79jMig8OFqud8PwfBg4gDKh8
	gNHI5BGz/B0mBPzILVLO6NUDcuO3FlNz30xA5FOSrlcVFpov8Sjey2JuOsuzl3ybfULk/QD0mRu
	Bc/V0qnkTyCrqC5On+ybza0Te61WRZdYxGbU44PbSmdesat8CoAc7Jz9cW1o2yIF6mxiWgWL2bn
	0SEObbp+8kSvO7uScGXqFr9J3UcKDdUJcUWlCCkjYqcLMVoTuSUNC2i3aTPhFuIf1xo8X2thikN
	JrIykgZYsU6UQiLm0qc4gsibtAJV89brRmIA5Bka13G91aEBKO2oiP0U26VDzyzfm0GV0eEAb9D
	6N4ie59LvlwVNllMvUgHW5XsG2nVWBqbCaS2O6lc7iLGg+AHYA8uNUD7MdffVp7KnO6ki3czA==
X-Received: by 2002:a05:600c:3494:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-4a18e4c3f24mr262227495e9.23.1791905280781;
        Tue, 13 Oct 2026 08:28:00 -0700 (PDT)
Message-ID: <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
Date: Tue, 13 Oct 2026 17:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
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
In-Reply-To: <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791905281-73EB92A1-7C75966D/10/78276251493
X-purgate-type: spam
X-purgate-size: 2238

On 13.10.2026 16:32, Baptiste Le Duc wrote:
> On 2026-10-13 12:36 +0200, Jan Beulich wrote:
>> On 13.10.2026 12:07, Baptiste Le Duc wrote:
>>> @@ -620,6 +623,98 @@ static void __init compute_guest_isa(void)
>>>          panic("Failed to build guest \"riscv,isa\" string\n");
>>>  }
>>>  
>>> +static bool __init probe_hw_ad_update(void)
>>> +{
>>> +    bool updated = false;
>>> +    unsigned int slot = FIX_MISC;
>>> +    vaddr_t va = FIXMAP_ADDR(slot);
>>> +    struct page_info *pg;
>>> +    pte_t *entry, pte;
>>> +    mfn_t mfn;
>>> +    unsigned long tmp;
>>> +
>>> +    pg = alloc_domheap_page(NULL, 0);
>>> +    if ( !pg )
>>> +        return false;
>>
>> Why would you need a fresh page here? Can't you create a secondary mapping
>> of a page already in use (e.g. one from Xen's .data or .bss section, or the
>> stack page you're running on)?
>>
>>> +    mfn = page_to_mfn(pg);
>>> +
>>> +    arch_pmap_map(FIX_MISC, mfn);
>>> +    entry = &xen_fixmap[slot];
>>> +    pte = pte_from_mfn(mfn, PTE_VALID | PTE_READABLE);
>>> +    write_pte(entry, pte);
>>> +
>>> +    flush_tlb_one_local(va);
>>> +
>>> +    asm_inline volatile (
>>> +        "1: ld %[tmp], 0(%[va])\n"
>>> +        "   li %[updated], 1\n"
>>
>> If you mapped the stack page, you could preset a variable there to 1, load
>> from the alias mapping of that variable, and then avoid the LI altogether.
>>
>>> +        "2:\n"
>>> +        ASM_EXTABLE(1b, 2b)
>>> +        : [tmp] "=&r" (tmp), [updated] "+r" (updated)
>>> +        : [va] "r" (va)
>>> +        : "memory" );
>>> +
>>> +    arch_pmap_unmap(slot);
>>> +    free_domheap_page(pg);
>>> +
>>> +    return updated;
>>> +}
>>
>> Imo you'd better check that A also was actually set in the PTE.
> 
> If I check that A was set, can I drop the "updated" variable? The A bit
> would tell us more than whether the load succeeded.

Hmm, I'm inclined to suggest to check both.

There's one aspect to consider that I didn't think of earlier: On x86, for
example, the bit corresponding to A can also be set speculatively (the bit
corresponding to D cannot iirc). If the same is permitted on RISC-V, it
cannot be the A bit that you use for probing.

Jan

