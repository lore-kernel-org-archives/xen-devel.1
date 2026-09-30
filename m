Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7E8CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 12:20:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437160.1655958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtIU-0005FY-UB; Wed, 30 Sep 2026 12:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437160.1655958; Wed, 30 Sep 2026 12:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtIU-0005FR-Qy; Wed, 30 Sep 2026 12:20:30 +0000
Received: by outflank-mailman (input) for mailman id 1437160;
 Wed, 30 Sep 2026 12:20:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBtIT-0005FL-V1
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:20:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBtIS-00EHAR-Py
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:20:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcfe85-8faa-0a2a0a5109dd-0a2a450be9ec-28
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:20:28 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcfe8c-b7e8-0a2a450b0019-4a7de14cd4a3-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:20:28 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843796e373so3097252f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 05:20:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029f5bcdsm3124313f8f.27.2026.09.30.05.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 05:20:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1790770828; x=1791375628; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOGIuQ563v4isyl038QmlfbnsPE8ol2Tuf5SCt3ht4k=;
        b=gAi4yG38J0jJkN9SQwgNhlZQGus5I1M2Wy+q7vy4MdpjEt2z61fBejdK5X2W+gnYL+
         54Estbf+qnR8lGuTCB+B7gnCWENG1qEoWKCitB/5R1EwVYExoJj35y6iQZeIo6KJJaKG
         HonfIrIaNMMsT4MVv6/c3wvCbDr3w2MQlmrE0pq7gyHSj8rIb4eXwZMrkgc1nGPyaMJR
         Y4DOXdmAkWcdUfaMVxNoSY/SxiLgqq+Iwx0XABoB7rn0G0CWBtjOznME8ILjwrHebCrg
         fTiItlughky6+CHRawMZeRT9FtNqoEHlrqFpXL3ZG3p0PpqPeRNcKziyV6nLmb/+XJTj
         fNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770828; x=1791375628;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOGIuQ563v4isyl038QmlfbnsPE8ol2Tuf5SCt3ht4k=;
        b=VNF7PPp1+rYsYrfQ4exLWJF17BO6nVE8Ema5XcYu/Rljj85MwUpmush3mstRSs0uFT
         oR5dSsUT8CIUm0QX2nsCQqAG1y7jkbHspPp7666pxLRR7KsDZ/86XA4GkMB/a5H5lySp
         5ean/HdftpMJPHTaH75bn7qo089eWLD2MO1YzsYTObdpaIe75XvIBJvacPmibn4jpojA
         YZb++brX2ToIr6i8uO2JT3B84msccm8NLIO2HSe4OZa2HMemT2YvXntU5VH0VWnakElM
         S++t12GX5u7zbU0g2XLe9lpDsUypC+PQZDQCnHCgzNglkkgsnby/KC8TqckN2PaVpnrf
         iJCA==
X-Forwarded-Encrypted: i=1; AKwUvBz3oTxy+LKUa3f21/XISTV3zzCMjVJVKSr8FOsC4B/YbRFgRCX+3UaY+gpoISQitSVA+g6EeIDn//M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJiapO9oDhcCmGtDzEIBjwv8OkhyKlEbTPqHIrWI8gx6dBIEJR+
	tY6bsGVgfMZt/CZHbK+umNZC338m5IE3lmYKNk4KrAF+r4vPCJXa/le0PkDM03JQyQ==
X-Gm-Gg: AYBFou0cZwnanI68Mn8aKOE5yErejoT5fh0aTDzq5Wx54DCihbqR+Bkm4D9ikqouBxh
	+XC/6A7dNh7yztADLoQTKlAeDgaCN6PHDWCgdlAZiFywwa+8lUcvjt5XmGnWNEjmNvnO8LjNdiy
	6kcc3uNWVSt45+R2XMWIVGsDS/RhklucI6bNovkhWS0gTtt6yIS5W0xOZrnwt6+KyUTPFkQ1VWx
	v5yHtw5PKR7d1W72KrKd1wMnPcHB7OG3DIw1wIrGud9p3GC8YokjojqRQsbMigk1D3rBi+d1+xr
	yaQ8/LPeNwHcqF4fSL2x8EzptwrF+9QdC7vut7xRW3rq10jzoM4r7k7jEdiGxYDOXXCXDt0vQIm
	1sOR1yg/AmUtAmuD/iRnsVuSEh8Xpddq079zWt2cHiHEov34tk/GD4jNpbXuG96gaMkQlS4/b7T
	DvtrSnqPmodgxNbhGqckxdUYSV4GqrnoN58Coy45iMr/RYxK7NXHLN4qewBOKJklfgZmbv/pZ2F
	lTNTlCfIVfttJvY9fdUemUurB11srJe5t1Cd7uem9OcchkwZvnYBbrZABHcJQ==
X-Received: by 2002:a05:6000:3c7:b0:48a:f073:336b with SMTP id ffacd0b85a97d-48b025023bemr2652409f8f.23.1790770827874;
        Wed, 30 Sep 2026 05:20:27 -0700 (PDT)
Message-ID: <c2d30da2-6844-4df2-9029-238f5ce25838@suse.com>
Date: Wed, 30 Sep 2026 14:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/riscv: fix A/D bit handling in G-stage
 mappings
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504@vates.tech>
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
In-Reply-To: <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790770828-188C99EA-483AA6C9/10/78276251493
X-purgate-type: spam
X-purgate-size: 5869

On 29.09.2026 18:32, Baptiste Le Duc wrote:
> @@ -500,6 +502,45 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
>      }
>  }
>  
> +/*
> + * Svade and Svadu extensions represent two schemes for managing the PTE A/D
> + * bits. When the PTE A/D bits need to be set, the Svade extension indicates
> + * that a page fault will be raised. In contrast, the Svadu extension supports
> + * hardware updating of the PTE A/D bits.
> + *
> + * There are 4 possible combinations of these extensions in the device tree.
> + * The default hardware behavior for each is:
> + *
> + * 1) Neither Svade nor Svadu present in DT => It is technically unknown
> + *    whether the platform uses Svade or Svadu. Xen should be prepared to
> + *    handle either hardware updating of the PTE A/D bits or page faults when
> + *    they need updating.
> + *
> + * 2) Only Svade present in DT => Xen must assume Svade to be always enabled.
> + *
> + * 3) Only Svadu present in DT => Xen must assume Svadu to be always enabled.
> + *
> + * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned off
> + *    at boot time, so it presets the A/D bits. To use Svadu, the supervisor
> + *    must explicitly enable it using the SBI FWFT extension.
> + *
> + * The Svade extension is mandatory and the Svadu extension is optional in the
> + * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
> + * option 3. Platforms aware of the profile can choose option 4, and Xen won't
> + * get the benefit of Svadu until the SBI FWFT extension is available.
> + */
> +static void __init riscv_resolve_ad_scheme(void)
> +{
> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
> +
> +    if ( svadu && svade )
> +        if ( sbi_probe_extension(SBI_EXT_FWFT) <= 0 )

Such successive if()s want folding.

> +            printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
> +                XENLOG_WARNING "RISC-V: Defaulting to software A/D updates (Svade).\n"
> +                XENLOG_WARNING "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");

Nit: Indentation, and no full stop at the end of log messages please.

Overall - what use is this? Nothing will be logged if FWFT is present, yet
there's no real use of the extension. I.e. even in that case you default
to svade. Further, removing svadu from DT doesn't alter hardware behavior.
How can that be a useful suggestion?

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -586,42 +586,24 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
>  
>  static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
>  {
> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
> +
>      e->pte &= ~PTE_ACCESS_MASK;
>  
>      e->pte |= PTE_USER;
>  
>      /*
> -     * Two schemes to manage the A and D bits are defined:
> -     *   • The Svade extension: when a virtual page is accessed and the A bit
> -     *     is clear, or is written and the D bit is clear, a page-fault
> -     *     exception is raised.
> -     *   • When the Svade extension is not implemented, the following scheme
> -     *     applies.
> -     *     When a virtual page is accessed and the A bit is clear, the PTE is
> -     *     updated to set the A bit. When the virtual page is written and the
> -     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
> -     *     address translation is in use and is not Bare, the G-stage virtual
> -     *     pages may be accessed or written by implicit accesses to VS-level
> -     *     memory management data structures, such as page tables.
> -     * Thereby to avoid a page-fault in case of Svade is available, it is
> -     * necessary to set A and D bits.
> -     *
> -     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
> -     *       delegates page faults to a lower privilege mode and so OpenSBI
> -     *       isn't expect to handle page-faults occured in lower modes.
> -     *       By setting the A/D bits here, page faults that would otherwise
> -     *       be generated due to unset A/D bits will not occur in Xen.
> -     *
> -     *       Currently, Xen on RISC-V does not make use of the information
> -     *       that could be obtained from handling such page faults, which
> -     *       could otherwise be useful for several use cases such as demand
> -     *       paging, cache-flushing optimizations, memory access tracking,etc.
> +     * A RISC-V implementation can choose to either:
> +     * 1) Update 'A' and 'D' PTE bits in hardware.
> +     * 2) Generate page fault when 'A' and/or 'D' PTE bits are not set so that
> +     *    software can update these bits.
>       *
> -     *       To support the more general case and the optimizations mentioned
> -     *       above, it would be better to stop setting the A/D bits here and
> -     *       instead handle page faults that occur due to unset A/D bits.
> +     * Xen supports both options mentioned above: unless the platform guarantees
> +     * (1), i.e. only Svadu is present, set 'A' and 'D' so that (2) never
> +     * faults.
>       */
> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> +    if ( !svadu || svade )
>          e->pte |= PTE_ACCESSED | PTE_DIRTY;

I may have asked this already when the original conditional was introduced:
What use is it to leave A and D clear, when we don't otherwise consume the
bits? This way hardware has to issue more (atomic) writes, i.e. performance
suffers for no gain.

Jan

