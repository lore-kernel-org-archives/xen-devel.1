Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBCCCC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:24:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448030.1664016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeMX-00008K-E1; Tue, 13 Oct 2026 15:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448030.1664016; Tue, 13 Oct 2026 15:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeMX-00008A-BQ; Tue, 13 Oct 2026 15:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1448030;
 Tue, 13 Oct 2026 15:24:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGeMW-00007z-AH
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:24:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGeMV-001fYm-CJ
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:24:19 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace4cfd-8faa-0a2a0a5109dd-0a2a4506cd6e-24
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:24:19 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace4d23-195a-0a2a45060019-d155802fa4c7-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:24:19 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso40751225e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:24:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e48db03sm533044085e9.3.2026.10.13.08.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 08:24:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1791905059; x=1792509859; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfzD61GjKLYFbsWNF7jULFxbpAX1jF6qoMbPq1vMzg4=;
        b=QXcVIOuEaVTohG6iRDFLjLjgIedIMMhNU/fZLfd6JMEPCqRZcfJpkTLX+lzgn4OBIz
         4fsmdV0ePV4p5BZc7H38BQmXvsjtXFpAUDpDOIqyZjGHnneHUzAA1uuhmTzHvWGC8cBg
         34j2c68HQtp65qOfpDBcJ057bWUdHDnxlqKlJWoe0EHbsy2o/sYQh4ynOAaflowdj1L3
         unBEQmBMiwMGTMt8u2kT1Rm4XZWBncGSwKwDuhTpJHrHJQef5d1oy+vSo5J6jYm4ldSu
         Pl3B506m1FvJDlZknWSF/vPLS2NdoLlRr7sG1Ky+UkC4e2vN9Q+5pFLYWIeA7ETxM+Bh
         joIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791905059; x=1792509859;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfzD61GjKLYFbsWNF7jULFxbpAX1jF6qoMbPq1vMzg4=;
        b=i4lEzoAddhnauZzg39Oshb6TkM319I7AvvXbUkxAdccWW0Gp6WuCnVQ24U94QhUqaN
         JiJQI0ahC6ESbKrzLea+6SjreXjoPEZnsRgwlc6mIZLtT+jkKrWZNbmAdGtimMVs6wc2
         0KfiWt1fYorE78neLOZnD1pW3YQVajj25OOGsiDhypJDahXXntSoxDqFd/hdAEkGx/eD
         DZ1xhRK67cp6Fxht8otlggGzM5IiVBAarFSGfdan5k55nIx4nt0Ivp0Bq4/79JK8GHCQ
         KjE9D3b3iPIDYG/hvOHhr7GT8zabeii950iKd/5RCEJMfL9j04U0k/sfomSbNa8AHNmD
         +ahw==
X-Forwarded-Encrypted: i=1; AKwUvByoK7OvDzIMxpQiSBvuR20eOgx7cNC2oF35VV0PY0Cxh7/aLe1gahX51sk2V4SIHJohjOxNiVVm+Ko=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLmebAasAs5zLi6KzOaPtglOgZ0otvUclJ2WMgX+gKrs/byGUfW
	FM8WjmsdxixblGRFvd6nTHEY12vLSKpJW34YH3AniDKhjEivEMxkJaK1Yvv4qDPySg==
X-Gm-Gg: AYBFou30QehWPL+kic7C4/2HVhzf7q2LPWBb7uPJlTyhFZ0hmNzI1/DSU5ODNPEHH3E
	RuDnTnRRAxWK0whDYPm5ncFwhLwC5Ao0vQ4vTuVSfErLM4xuUTXc7ZCHth6qWiyUgXF+UMmig6a
	S66fs4JSeD2SmTeJL1qpogI6Ltygt5EqysiuxZVBJQFkEAxYv5vpww1+wW92L6+wS+0zFZMVT8c
	mZ6PVRPh2MecFZUHOdTUHGlxxqT44ygISbp4A1Jd5goJiBPjSjZjswQAVa3q3V2HEM57GZUcO8K
	5V0209QB4gsDqa2qTKiyQEqj4gK4r78INg1kWpdcmW0Qtb51QLc6Ag6T3/E5RZFVss13nDL/d/q
	KJpivawti49H7k9sMMVSks7DXRFHM4qPbFKAYhzx1ft0RUwgcvissTedI5HGFuEw8YgwdUnomXf
	cDHu5pLzvkor08WUHUr9OFDZS7p1wVzxdUu58c8RGlL7fXlD5e4TEiuHBUABESj1j/StpxKyWF6
	6q3GVPmDazXshXkVjAvPYlC0bYw7PyEjdgZjwP04CC37UjGRcubD9YsUThofIE=
X-Received: by 2002:a05:600c:83cf:b0:4a1:ac66:604b with SMTP id 5b1f17b1804b1-4a1ac666a65mr46600395e9.1.1791905058579;
        Tue, 13 Oct 2026 08:24:18 -0700 (PDT)
Message-ID: <9baeae94-edfb-44f9-9d45-dca32f0d0ed1@suse.com>
Date: Tue, 13 Oct 2026 17:24:17 +0200
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
 <1791892682.8631fc262581453bbf619ec5b2062170.1a1352076650008425@vates.tech>
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
In-Reply-To: <1791892682.8631fc262581453bbf619ec5b2062170.1a1352076650008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1791905059-FE27077B-E56DA481/10/78276251493
X-purgate-type: spam
X-purgate-size: 4357

On 13.10.2026 13:57, Baptiste Le Duc wrote:
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
> You're right, I will map the current stack page.
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
> Yes mapping the stack page appears to be the best way.
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
> Right, I will do that.
>>
>>> +
>>> +    /* Neither advertised: trust the probe. */
>>> +    __set_bit(has_hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
>>> +              riscv_isa);
>>
>> Hmm, this feels fragile. Other schemes are possible, e.g. A being updated
>> by hardware but D being left to software. Are such truly precluded by the
>> spec, including older versions thereof? Furthermore, probe_hw_ad_update()
>> can (right now) return false for unrelated reasons.
> Since 1.10 the spec lists exactly two schemes, and each one covers A and
> D together: either a clear A (or a clear D on a store) raises a page
> fault, or hardware sets the corresponding bit(s). A-bit being set by
> hardware while D is left to software isn't one of them. Before 1.10, the
> hardware must set the two bits. Therefore, there is not other schemes
> possible.
>> As a consequence, patch 2 imo also can't leave the A/D pre-setting unaltered.
>> It perhaps needs doing unless Svadu is positively identified as present.
> I agree it is more robust to preset A/D bits unless Svadu is truly
> identified, i.e. advertised in the DTS (without Svade) and confirmed by
> probe_hw_ad_update(). The worst case then becomes the probe failing for
> an unrelated reason on hardware which does update A/D: we'd preset A/D
> needlessly, which is harmless, as hardware only writes the PTE when a
> bit is clear.
> 
> To sum up, and to avoid unnecessary respins, would you be fine with:
> 1) Keeping the probe as it is, with your remarks addressed (map stack page).

(... and verify A bit was set).

> 2) Presetting A/D bits unless Svadu is truly identified as above.

Yes. Assuming Oleksii also agrees.

>>> --- a/xen/arch/riscv/include/asm/cpufeature.h
>>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>>> @@ -42,6 +42,7 @@ enum riscv_isa_ext_id {
>>>      RISCV_ISA_EXT_sstc,
>>>      RISCV_ISA_EXT_svade,
>>>      RISCV_ISA_EXT_svpbmt,
>>> +    RISCV_ISA_EXT_svadu,
>>
>> Isn't there some sort of sorting in effect here?
> No, as it is mentioned in the docstring that:
>     * New extensions should just be added to the bottom, rather than added
>     * alphabetically, in order to avoid unnecessary shuffling.

I see. Yet I wonder: What shuffling would we need to be afraid of? Always
inserting at the bottom increases the risk of patch conflicts. Furthermore
single-letter extensions can't be inserted at the bottom anyway.

Jan

