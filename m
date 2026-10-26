Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12315606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T9xjJXwE
Received: from list by lists.xenproject.org with outflank-mailman.1461558.1672593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMs1-0006pQ-JE; Mon, 26 Oct 2026 15:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461558.1672593; Mon, 26 Oct 2026 15:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMs1-0006pJ-G5; Mon, 26 Oct 2026 15:44:21 +0000
Received: by outflank-mailman (input) for mailman id 1461558;
 Mon, 26 Oct 2026 15:44:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLMrz-0006pD-Bz
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:44:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMry-00HKqF-P1
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:44:18 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf7531-bab6-0a2a0a5309dd-0a2a4501e60e-14
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:44:18 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf7552-5984-0a2a45010019-d155dd31e4c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:44:18 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso1718141f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:44:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f305sm15934623f8f.3.2026.10.26.08.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 08:44:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1793029458; x=1793634258; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8FH/yACPBdDQ7puvZM/CecliNc8NkDm+G5loaHvK/c=;
        b=T9xjJXwE662enmUXGwoPlJoBxLka+If2r12OB1af+OI8pZRg9iLXt6EqXOlk0WMi7q
         M6Zxjhl/Vu/V+9jxRUpFrS25aag98Kf0bn0bAXAiMyzU4r2yd26+t09BA9f31e7xs7CQ
         HGgHs88KboUBio2qvfXjFCmYyKS26Z7+9tUIJXiZhEdvjekPOx6YOAhrwMt8N9jMyDxk
         Dh5b0CfFrT1rDmKGCQHg7ajvNbSauI0LGPMPPdnH4hKqhADwpAMmkGbAXQPP1IJ714CL
         bRsT19cJjK2rsOICAz3oLg9j1OKZFEbk0j06brWzdbXUaStv9bK4+cIibxTntHahWGRs
         40Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029458; x=1793634258;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8FH/yACPBdDQ7puvZM/CecliNc8NkDm+G5loaHvK/c=;
        b=MAMK28CTmuboHWl5DD6Z3wSddIJocgFpsN5NkJ7r1E981k5SC2tvPx0YLv7RsQ07zt
         R1aljUZHXfB9o929wU+or1+WDg+NMbyqYnO6raXQu5bnajLCelQdIju8JWON/oMV9dwG
         3tmwhVWSE5/Wd7VcBOmNlL5M2Xu6AR5Sgp+EaYRUoFz2ka8KhTLpsSi8OdPHISvYpEFr
         nz4q9Wq3k3KDvY6krVfBP9sCNPj7+Y+DkAa22ZaIYBCoIJHIyPy0wh+p78AM1zXkXyGl
         xjNSwTkSm2N04T4c9GKT8MEjTt3OT+1Ug+/2r6tG+BwGeD91OtPlOcmj1iLyg/P7Djtw
         N0PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk3j604FJSckAtrQqar23Hi+fmLAPb7wbqZPCgOHYesTo+TyHXcJ3acN5sM5z1zRk2nJ9rgRaHfvs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIeLj7g5FHee353X3YAdGNgE1xa5iBQTmhfdkVbujDCw83Vb5ji
	WyhfwnJ5JX7rLMWA/RfZ8FRIBPWrbxk99wFwiCHcQECIQHNyNPG3gm/Rd65BBByJzg==
X-Gm-Gg: AYBFou3/PCiUR+neyWmW5NipCkDiHvfGMOHotXwcdAfySQESUq98zWJ/UBUiBm7jNRN
	D/s7WmsWtNMtphzLnHcE7iTgDbXQjaRtx9SMT0U8GIGUKetMka63KSEQ4yZ6PvI3xCoN6UuJg1/
	0s0k93YaelVsRThkn6WdlCJJA7gFAoEFFhRFFBjq1cBewS1KPyikDcJRLR3zniGq9Tve+pMHbwL
	wij+nWkjVpLbDjDzUunpE9hN0EnC2GZ+0nECDcBJxDdxu1XOdTEARDOPtwD4PTzCDrcYjdsD4n/
	EE9jukU7GCYCUdYR0K6Tc4OzVGirqVl3p/IR1CsHNNrsV6NQMPVBE+Q9E/0W82k2u06uqjqqqA9
	XIznYfH5kkqBN6DAl2pRUkLAcaI4NsDrCw0KKYYnxcYh7LGNEubAMjMf4vjRWfLzZ+FAEVfXC9K
	9xeSWt2REUCvQSX5viZYIuMHclg2Vt2abTafyZ8FRp2GmdgK5eIoF6GTi0xCXja5MJ/IHk3LOXC
	yUw2zF9i0ZbodeRFCWqxD8IPdE7GIORr8G+iUy3l8Cc0nRAiZ+pmJHAgVTPu3DF7ICTVeI6BQTj
	kuQVa/gWS3qWOTqtzZsNV67C+OINdpBG9PsDPZ/y0Ks=
X-Received: by 2002:a05:6000:22ca:b0:488:6561:b324 with SMTP id ffacd0b85a97d-48e3eb7e535mr12525043f8f.9.1793029458162;
        Mon, 26 Oct 2026 08:44:18 -0700 (PDT)
Message-ID: <e34fc3c1-a92f-486a-8265-682ef6491345@suse.com>
Date: Mon, 26 Oct 2026 16:44:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
 <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@vates.tech>
 <9986e03e-bf09-46b6-9d2a-82a1864a59b5@gmail.com>
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
In-Reply-To: <9986e03e-bf09-46b6-9d2a-82a1864a59b5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793029458-C4D44757-3DD06567/10/78276251493
X-purgate-type: spam
X-purgate-size: 1541
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 16:35, Oleksii Kurochko wrote:
> On 10/26/26 4:14 PM, Baptiste Le Duc wrote:
>> +/*
>> + * Probe whether hardware updates the PTE A/D bits by writing to a local
>> + * variable through an alias mapping whose A and D bits are clear.
>> + *
>> + * Check the D bit rather than the A bit, as the A bit may be set
>> + * speculatively while the D bit can't.
>> + *
>> + * Under Svade, the store raises a page fault instead, so use the extable to
>> + * handle it.
>> + */
>> +static bool __init probe_hw_ad_update(void)
>> +{
>> +    unsigned int probe_target;
>> +    vaddr_t va = FIXMAP_ADDR(FIX_MISC) + PAGE_OFFSET(&probe_target);
>> +    pte_t *entry = &xen_fixmap[FIX_MISC];
>> +    bool d_set = false;
>> +
>> +    ASSERT(!pte_is_valid(*entry));
>> +
>> +    /*
>> +     * Any page in use will do, so alias the stack page this code runs on,
>> +     * with A and D clear. Store to a variable of its own, so that nothing
>> +     * the compiler relies on gets overwritten.
>> +     */
>> +    write_pte(entry, pte_from_mfn(maddr_to_mfn(virt_to_maddr(&probe_target)),
>> +                                  PTE_VALID | PTE_READABLE | PTE_WRITABLE));
>> +    flush_tlb_one_local(va);
>> +
>> +    asm_inline goto (
> 
> I think that generally this code should be wrapped by "#ifdef 
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT"

I don't follow why you say this when ...

> but we can keep it as is here as we don't 
> use output operands.

... right afterwards you explain why it isn't needed.

Jan

