Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F94CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:37:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446955.1663097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZsV-0005bw-32; Tue, 13 Oct 2026 10:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446955.1663097; Tue, 13 Oct 2026 10:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZsV-0005bp-0V; Tue, 13 Oct 2026 10:37:03 +0000
Received: by outflank-mailman (input) for mailman id 1446955;
 Tue, 13 Oct 2026 10:37:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZsU-0005bS-9h
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:37:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZsT-00F0Ss-MR
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:37:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace09cd-8faa-0a2a0a5109dd-0a2a4502e0e8-2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:37:01 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace09c9-6ca4-0a2a45020019-d1558030c962-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:36:57 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so22207325e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 03:36:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19f249692sm293425625e9.3.2026.10.13.03.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:36:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1791887817; x=1792492617; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B34eL7ZwM32LwTO8G0c5PwiiqLd3hFw10RyDa6j6dqM=;
        b=CGks6/bUzj1MWoDZA8zL7iiOGG/cDqOYNi0IQuj1YLoeQJt0L50Ir4wLnyndLWDPOp
         2RQ3KjF7tf12EWNoUR2j8r6FgysO4KOolj70oWiZLShSt+XEzghK0krA6MOFSdKvEaq7
         iW4UKnll4A3WD4JKRdsA3NW45gGS6YkJJipg8lCDmC2kBeczXqbx6P7riOJYzXQM1Gxm
         GVYwkxhrrjlYvGA7bWKNwwiAmq+IjpP+W1o/+i04AKpQRuToiVizHxEUZ4t4PE80MDAU
         XJWvzqt9HFXK5gsH0D5ecUyYXzprTBQ/ek08txe/3lGB+kzFAPHCO6IA0bgCopuO/KbH
         8Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887817; x=1792492617;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B34eL7ZwM32LwTO8G0c5PwiiqLd3hFw10RyDa6j6dqM=;
        b=VzDHNSTf0Jn0OZBjwE9NxymG1kEzC6s0AqCDPic5flmWi2VrUljZXcXRau51ReWg/t
         hw/T1oNA0QQ74vtRtR6sJEDwBpAZ+yxi1OwBQ/UHh7o4llmgdkUjyVnf4+QHLzgGPdhB
         85hLPlDC4Q5MFFccd4f2kwUssYmMNEpD199xKca4M8eQ/FwsGRmg9AQFAjDDX67v7HWb
         LG/rDfg49gQ2X5lm6nSNDU//nyxSveoYuzzFXtrTq/Y5h7RvdsI2tui1R7TnybEa8oae
         NA1/WOyT3DZgbi85LgTNEZs1UkJZ8it15lNqU+FRRlugy4m5JHD5oEeBUt7KOK4JQiTN
         6wAA==
X-Forwarded-Encrypted: i=1; AKwUvBxXW4VmsBQ6/87kYbiUm9sQrxhxODJGXhgvcW4G4+/jF1QPF6QOwtVyjgbQ1kmqQKzV3hUDhSBYrFU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIDthH8y+0i2DTzqWHy+feKvJOwuiYkJ5UmFHDQcbQTE7MRGuW9
	68yOWWv23WbruB5GVfjpYTTg+t9k6NEqYERBFESAEmnvNsfA0Wb1bkWx3h6mH+cZLg==
X-Gm-Gg: AYBFou0bkXR5qmEXLcCMTpA+eefj3Ch688qfW5w3f+MlHDYZu5AIBNVQ1uPJEGDsVCE
	O6x8scpzJBWFXqHn6g3QjiOe0NdnzzsaLSWMEShidFQXVcZVvYZHVUQ7X/en19Skc6FF++FS4qA
	pVRow3Xzw5M/vNV3N/nFGEdjKUY/UrRRVkczVVEjdfCKONKZan1H2XMNa2MGTNfmf3lWzo9Umds
	pdhzubpxHV7RLv2us1bfbuVS7jFmvPJGyJaW13xgHrTCS+qIa6ZuvNtEqZaLpRTkYU65pGtvBv2
	yvZwtSh7nA/cyunjmHWc2kKSTAjxJ9PcWPP6cNWdkQ7rVvKTlJjYOjU9oLf7Cz0WR0JW0Jaz+r/
	2sHyM5CCqWiIIjNPlJcV/O97tg0GnM8EE9t93KPO4Xqvdo3tGeoUJpcPaKP7GJG98tO1Uxk19+x
	U9vo7DYvcUdUas3nIp8spHPQpwWjtV2E0U+C/DVJ6Yj2sQPfqsspGOFPN2JzJSeu+PhQLg/F5u6
	YzEFqtVUUAWA/G5xP4AYIQpF6qoxNfuPfGVEDkncqfKWXDi1J8Xdu0/QerEdS8=
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr236218695e9.26.1791887816877;
        Tue, 13 Oct 2026 03:36:56 -0700 (PDT)
Message-ID: <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
Date: Tue, 13 Oct 2026 12:36:55 +0200
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
In-Reply-To: <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1791887817-31DC92AC-1332B168/10/78276251493
X-purgate-type: spam
X-purgate-size: 4668

On 13.10.2026 12:07, Baptiste Le Duc wrote:
> @@ -620,6 +623,98 @@ static void __init compute_guest_isa(void)
>          panic("Failed to build guest \"riscv,isa\" string\n");
>  }
>  
> +static bool __init probe_hw_ad_update(void)
> +{
> +    bool updated = false;
> +    unsigned int slot = FIX_MISC;
> +    vaddr_t va = FIXMAP_ADDR(slot);
> +    struct page_info *pg;
> +    pte_t *entry, pte;
> +    mfn_t mfn;
> +    unsigned long tmp;
> +
> +    pg = alloc_domheap_page(NULL, 0);
> +    if ( !pg )
> +        return false;

Why would you need a fresh page here? Can't you create a secondary mapping
of a page already in use (e.g. one from Xen's .data or .bss section, or the
stack page you're running on)?

> +    mfn = page_to_mfn(pg);
> +
> +    arch_pmap_map(FIX_MISC, mfn);
> +    entry = &xen_fixmap[slot];
> +    pte = pte_from_mfn(mfn, PTE_VALID | PTE_READABLE);
> +    write_pte(entry, pte);
> +
> +    flush_tlb_one_local(va);
> +
> +    asm_inline volatile (
> +        "1: ld %[tmp], 0(%[va])\n"
> +        "   li %[updated], 1\n"

If you mapped the stack page, you could preset a variable there to 1, load
from the alias mapping of that variable, and then avoid the LI altogether.

> +        "2:\n"
> +        ASM_EXTABLE(1b, 2b)
> +        : [tmp] "=&r" (tmp), [updated] "+r" (updated)
> +        : [va] "r" (va)
> +        : "memory" );
> +
> +    arch_pmap_unmap(slot);
> +    free_domheap_page(pg);
> +
> +    return updated;
> +}

Imo you'd better check that A also was actually set in the PTE.

> +/*
> + * The privileged spec allows exactly two schemes for the PTE A and D bits:
> + *  1) hardware sets them on access and on write.
> + *  2) accessing a page whose A and/or D bit is clear raises a page fault,
> + *     so that software can set them (ratified as Svade).
> + *
> + * Hence an implementation without Svade uses the hardware scheme (1), and one
> + * that faults on clear A/D bits implements Svade, whether or not it says so.
> + *
> + * Svadu isn't itself a scheme: it adds menvcfg.ADUE, selecting between the
> + * two for S-mode and G-stage translation, and henvcfg.ADUE, doing the same
> + * for VS-stage translation (read-only zero when menvcfg.ADUE is zero).
> + *
> + * Rather than trusting the DTS alone, probe the scheme in effect with a read
> + * through a PTE whose A bit is clear, and check it against what the DTS
> + * advertises, as described by the DT binding. Panic on a mismatch Xen cannot
> + * run with, and record the probed scheme when the DTS advertises neither.
> + */
> +static void __init resolve_ad_scheme(void)
> +{
> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
> +    bool has_hw_update = probe_hw_ad_update();
> +
> +    /* Both advertised: Svade applies until FWFT enables hardware updating. */
> +    if ( svade && svadu )
> +    {
> +        if ( !has_hw_update )
> +            printk(XENLOG_WARNING
> +                   "Svade and Svadu are both advertised, but software updates A/D bits. "
> +                   "To use hardware updating, drop Svade from the DTS or use FWFT (not implemented yet)\n");
> +        return;
> +    }
> +
> +    /* Only Svadu advertised: firmware must have enabled hardware updating. */
> +    if ( svadu )
> +    {
> +        if ( !has_hw_update )
> +            panic("Svadu is advertised but A/D bits are not updated by hardware\n");
> +        return;
> +    }
> +
> +    /* Only Svade advertised: the hart must not update A/D bits. */
> +    if ( svade )
> +    {
> +        ASSERT(!has_hw_update);
> +        return;
> +    }
> +
> +    /* Neither advertised: trust the probe. */
> +    __set_bit(has_hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
> +              riscv_isa);

Hmm, this feels fragile. Other schemes are possible, e.g. A being updated
by hardware but D being left to software. Are such truly precluded by the
spec, including older versions thereof? Furthermore, probe_hw_ad_update()
can (right now) return false for unrelated reasons.

As a consequence, patch 2 imo also can't leave the A/D pre-setting unaltered.
It perhaps needs doing unless Svadu is positively identified as present.

> --- a/xen/arch/riscv/include/asm/cpufeature.h
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -42,6 +42,7 @@ enum riscv_isa_ext_id {
>      RISCV_ISA_EXT_sstc,
>      RISCV_ISA_EXT_svade,
>      RISCV_ISA_EXT_svpbmt,
> +    RISCV_ISA_EXT_svadu,

Isn't there some sort of sorting in effect here?

Jan

