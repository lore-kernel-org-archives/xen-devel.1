Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56077CC6B27
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 09:10:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448598.1664624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGuzr-0001K3-SG; Wed, 14 Oct 2026 09:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448598.1664624; Wed, 14 Oct 2026 09:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGuzr-0001JU-P7; Wed, 14 Oct 2026 09:10:03 +0000
Received: by outflank-mailman (input) for mailman id 1448598;
 Wed, 14 Oct 2026 09:10:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGuzq-0000qc-5X
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:10:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGuzp-00G4Hp-2w
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:10:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf46cd-8faa-0a2a0a5109dd-0a2a4505921a-34
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:10:00 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf46e8-4cb1-0a2a45050019-d1558031a40e-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:10:00 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso50089825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 02:10:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1b481b7f8sm39555305e9.3.2026.10.14.02.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 02:09:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1791969000; x=1792573800; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSsE83eP0Lgqnp8ps3bURT9k8cekl+eczWy5FLgxgf8=;
        b=AriuEIsM6us9pRvB5qlLEWb7qsL+vsGbCFo9LoJNm4/sv87JPOnbRBXchZVB1raNhE
         HBf2WMBF2YWligtq66eeJwIEOSPRt5pQYqcTSxHtGn8LVB+v9ZEUuDC4Cm9XbFP7r8nW
         XCmegZx1xkTfrbrsrsbRNrh9JppDSWzOqsb8mM8dHDarzBscUZn3DZLdLGTcpX/1CxTg
         fdeyryxuHxCJheyfuW9LakVru7dbBaeF+Q5opyXgyH9SJfgCryzpaNB6+27eL8ZvMdNm
         TADMGOI1DpOLFlOLsoV8X7qWDpi3feQx2MIZLoon81XRcfBahVQ6JlRt+CQw8/vSte+T
         uD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969000; x=1792573800;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSsE83eP0Lgqnp8ps3bURT9k8cekl+eczWy5FLgxgf8=;
        b=vI5cAN44RWjcfe+TRVtJQRijCgAYxNCP752lCGPILGonViHhE29RL4Kr+5Qx/x2cmg
         TJA/D4qDLCV1pxprfvqmYllWUsxVrcLYLfS/DjdpvS8gq3E4pFaAcjcD8RRasDRMs+JK
         RDeMu2w2SCP4Bax33rnu5+ZCCiEd7LiFbqqmgaskWAqyj6Yo66yjaGJu2teIaSuflih7
         uHO1DETQHTaWhd2YYY2q7u116fgU80o39ZpSVN6QIc89WzIFyqyzbvmCCBqleP3V+DRv
         RVTDLU/ljHQkrzwp+unfAolhqLbtHEA5X+7n00YixN2aeT8sHXuuchtrA/sD5BUOlTTE
         NVVw==
X-Forwarded-Encrypted: i=1; AKwUvBzNsn7hAq9tvHtqqXKI/l6d5DboD5ge7fXLGAJIUJAOn1KqEetIuRHHHFopOi1tvEyFK8MdnY5EjtM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIunx3nJQ9hPVwcthatrTszeOkg4roW3V+Vsy29ImiKi4faeL/v
	D39atmv4LJ19PyFXRx+Iv+hY1X476VkhM0UZOkpOy3G6fTeArDuYqeZbXMmdITh6bg==
X-Gm-Gg: AYBFou2JLo/iGkFW85xFeC/bK/JBEdPvWNxBHV7CMwUfhJ++4IAHhYcMkcb+lWKMKyf
	HMpyg6HBG6Pq8G07R+rFxKbPh75o58xdX5WViXHwLxt9rBWDbv1quEBdyQ+b6Sw6FX3HbzToLDV
	1zFTvFF+nVOUoBIgolgZlAiC/eUv2BmHlVU9qOrZKYk0ld3ipeRtmsmsv2NDPhjx+HwoxfluxRr
	iov7EYO+Rgholg5seDqCkMuDhTH++wPjY+BWx1k73okKsEOEy6VjHnT2mT1+Mw3rbfLYYzmT3df
	F/cTUn9FBhDSIBvW73CDtEztHeBxCuCsW+pQPwYnXARWS0C67nT8hLFEox9DvalzzxNdHX3k5ri
	bS5cNl14H4iWHAccdYX+CGLpvcU5LcxrUkZtOBcQO6Sht9vgt8EedCyjAbPTHuMbw3tA4JGNVFD
	+q+qYWNYfGF+ilF84dNM3+zt66e/nh745hY880Fbf3XePX8yN4dxDSu8rMv3elb/9axhwOFlMjr
	u+Nip9LLZL5FOpm/BXQtglMggSB3xqPjyitYiGF/RdKQ2qliquyqqLSy2Cia3M=
X-Received: by 2002:a05:600c:5254:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a18e4aa11dmr308160795e9.16.1791969000241;
        Wed, 14 Oct 2026 02:10:00 -0700 (PDT)
Message-ID: <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
Date: Wed, 14 Oct 2026 11:09:58 +0200
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
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
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
In-Reply-To: <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791969000-F6AB72A1-B7FDE20D/10/78276251493
X-purgate-type: spam
X-purgate-size: 3039

On 14.10.2026 11:00, Baptiste Le Duc wrote:
>>>>> +        "2:\n"
>>>>> +        ASM_EXTABLE(1b, 2b)
>>>>> +        : [tmp] "=&r" (tmp), [updated] "+r" (updated)
>>>>> +        : [va] "r" (va)
>>>>> +        : "memory" );
>>>>> +
>>>>> +    arch_pmap_unmap(slot);
>>>>> +    free_domheap_page(pg);
>>>>> +
>>>>> +    return updated;
>>>>> +}
>>>>
>>>> Imo you'd better check that A also was actually set in the PTE.
>>>
>>> If I check that A was set, can I drop the "updated" variable? The A bit
>>> would tell us more than whether the load succeeded.
>>
>> Hmm, I'm inclined to suggest to check both.
> Then I'd rather probe D than A, since D, unlike A, cannot be set
> speculatively (spec: "updates to the D bit, resulting from an explicit store,
> must be exact (i.e., non-speculative)"). The result would
> then be:
> 
>       return updated && d_set;
> 
> with a warning (or panic()?) on updated && !d_set, which the spec
> doesn't allow (spec: "the access must not be performed before the PTE update is
> globally visible").
> 
> Furthermore, if I understood your earlier suggestion correctly, you'd
> like the A/D bits to be preset in p2m_set_pte_flags() unless Svadu is
> in use:
> 
>     if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> 
> However, when both Svade and Svadu are advertised, Svade is in effect
> until Svadu is enabled via FWFT (perfectly legit), so this condition
> would skip the preset and the first access would fault.

In which case it would need to be

    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) ||
         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
        e->pte |= PTE_ACCESSED | PTE_DIRTY;

albeit I have to admit that permitting two contradicting extensions to
be exposed at the same time is irritating.

> I see two ways to address this:
> 
> 1) Keep checking Svade:
> 
>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> 
>     After resolve_ad_scheme(), the Svade bit is set in every case where
>     software has to preset the A/D bits. The only imprecise case is both
>     extensions advertised with hardware updating already enabled by
>     firmware, where presetting A/D is unnecessary but harmless.
> 
> 2) Record the probe result in a global, e.g.
> 
>     static bool __ro_after_init hw_ad_update;
> 
>     and use:
> 
>     if ( !hw_ad_update )
>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> 
>     This is exact in all cases, at the cost of a new global that mostly
>     duplicates what resolve_ad_scheme() already records in the ISA bitmap.
> 
> I discussed with Oleksii and we are fine with either. What do you prefer?

As to 1), see above. For 2), while maybe okay, I think we're better off
not deriving too much from probing. Whatever can be (reliably) derived from
what the platform description says should be preferred imo.

Jan

