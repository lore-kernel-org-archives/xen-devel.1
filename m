Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B7CC982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 15:57:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427698.1650506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gO6-0007rz-QR; Mon, 21 Sep 2026 15:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427698.1650506; Mon, 21 Sep 2026 15:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gO6-0007rs-NY; Mon, 21 Sep 2026 15:57:02 +0000
Received: by outflank-mailman (input) for mailman id 1427698;
 Mon, 21 Sep 2026 15:57:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8gO5-0007r5-B1
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:57:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8gO4-0078y9-1g
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 17:57:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab153c0-8faa-0a2a0a5109dd-0a2a4508a5ba-12
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:56:59 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab153cb-f659-0a2a45080019-4a7de18cdc63-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:56:59 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ce364488dso8635595e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 08:56:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd07cca6sm236288425e9.11.2026.09.21.08.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 08:56:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1790006219; x=1790611019; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUtow8Uf9yxDMJ8PoFWIAMmTgPt2YQ5jPZTRbsIUPBo=;
        b=IdXcf2dw6n9Uj/n8STn0D5SnpoFHYXxWSliNJHVyO8w6rseLHBzwBIMuh5DBZ9ahd3
         AS5DsCJk+YMw0VQ4fMcq/9/F6V0hUaZ9rEBzWDcKFusn+v+ryVu5cS2/bpAis80in4JF
         +0OcugkUXSdw8qs3VD/GBXm99tLGaMB7sypMqc1/xvhyU/VCfB47womVhJL4CMOJbUjf
         Ea3WRCaHlJmMPD9mtK99wV8Nh/VJepvZPrwmF0IW1to8oCeCyKEmjAN8tJciuQzLEBR3
         nIKwZsOroDpH0mn4bOLsxlyMILQn024GKLA9fUAD2VWn7LlWVfVduBUmh/41XMotcPQ3
         E04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006219; x=1790611019;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUtow8Uf9yxDMJ8PoFWIAMmTgPt2YQ5jPZTRbsIUPBo=;
        b=VkIc5RZJVdxe0HwggqqYZKfhnTpkhP3FmKzZDV7p5RSSn4SQPxy+nMQOdNy4lGLi+f
         Tp8W9Au57/tOHrdF18E6tvPN3kX3gBTKFHGphNDfLVfD9YI2ORRvja9yLuREFo8PfzOT
         ZYiMpVj/Z6ZgmVY3Jd/OtJ1X+ZXivnOp56Ex+dUnHsv11tuwHsUIQRezu84XwNbdHLo9
         4gf1LqPLv/XLwaur+eVoysLQwgcyp8tW7hsUqM5h/nxT0PRj8Uvuz+P7Ntk/puo/D0hY
         P2BC8OhDoKVIC5bPMj6mZStXy7ZOLpB/nYgWHxKg9byZiWNTbIvPruWIuynAazAMmz0T
         yumQ==
X-Gm-Message-State: AFuF++koOsUhKfD+YdwMZyx1eZpbNIuR22MAda3CnEU3ETH4hzx08/l5
	N/9o8e4mQZQrpIFRtddciKsgY/5ATHdjdFoaHm2HCP40DTalKWMGLkjQpWFsMLhF/A==
X-Gm-Gg: AYBFou3o2ZnstTrWtGPNHHZcgv1axYpz86kPkqJkccQ1sQ49/A5+CxBE5k/v/DvHbaC
	tG5OVr1W+i7EcR8Y2Vcs07WYYZIRh/cnhaZ5c1ksiJ2vakGuHRcDjFiS15yrq+d65VrVVvV03Zl
	Mj/j/xp8m79pF0jjQ3b7ieA35LfC8VFi+rszHTw1POxnllz4al/KWy9VvF03B9CHjPMKfSmdlTu
	344pA2aO/Hr0zGkTcrs8MbLdKmGLg1edaTyMX4bu6cH6udaCGj9cHv/PoMlgDRs7JE2WGRP1C3y
	+2cXb4NcK4cLkEtBQg+5bpyG7jsAy2trSN6xU/7IG/p8um+cdUCtg8sFF6nriF4QxXmNOHGbE6P
	Uctps2RM9T+0ko18/eGp1Ssng0kDlOP7I/M9NMQHP7+xkUhVJ4QakSYJiXo4QpDTtkMCmeRda33
	TxZGBmxB6tiBNMrC5xMt2qggiyr5UfZw1beoH9MRkAFzCTKvGjgQAimJmCjwPALUnPZfZUQ5gqp
	RL0+heSIxpAXT2wvxaHghIgZ0SsN5YysPHcLZ05jOvWXFXzkb9G0NIIyiC2aw==
X-Received: by 2002:a05:600c:3e16:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49fd8a69266mr755935e9.13.1790006219373;
        Mon, 21 Sep 2026 08:56:59 -0700 (PDT)
Message-ID: <9ea9edfc-be76-4507-8b71-a483daa9e7d5@suse.com>
Date: Mon, 21 Sep 2026 17:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] xen/riscv: make Svpbmt no longer a required
 extension
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@vates.tech>
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
In-Reply-To: <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790006219-CF95A87B-E12904DB/0/0
X-purgate-type: clean
X-purgate-size: 4312

On 10.09.2026 11:34, Baptiste Le Duc wrote:
> Without the Svpbmt extension, memory attributes (such as cacheability and
> ordering) are strictly tied to physical address ranges and enforced by the
> hardware's Physical Memory Attributes (PMA) checker.
> 
> In this configuration, supervisor software relies on the platform's memory
> map:
>     - peripheral device registers (MMIO) are physically mapped into
>       hardware-defined I/O regions (which are implicitly non-cacheable and
>       strongly-ordered)
>     - regular RAM is mapped as cacheable main memory.
> 
> S-mode paging can safely map these physical ranges without specifying
> page-based memory types in the PTEs, as the hardware MMU and PMA pipeline
> will correctly bypass caches for MMIO accesses and use caches for RAM
> accesses, based on the target physical address.

Provided firmware got absolutely everything right.

> Furthermore, on platforms that either feature fully hardware-coherent DMA
> or don't expose non-coherent DMA agents to the OS, page-level programmatic
> cache control via Svpbmt is not required, making it safe to boot and run
> when Svpbmt is absent.

Yet a fully coherent platform should also be possible to somehow identify?

> Drop Svpbmt from required_extensions. Introduce svpbmt_enabled, a
> __ro_after_init flag computed once in init_csr_masks() from ISA
> availability and the henvcfg.PBMTE bit. Xen cannot read menvcfg.PBMTE
> directly, since menvcfg is M-mode-only and unreadable from HS-mode, but the
> spec guarantees henvcfg.PBMTE reads as zero whenever menvcfg.PBMTE is zero,
> so checking henvcfg.PBMTE alone is sufficient.

I don't understand this logic. If menvcfg.PBMTE is non-zero, we know
nothing about (or from) henvcfg.PBMTE's setting.

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -47,6 +47,8 @@ static struct csr_masks __ro_after_init csr_masks;
>  #define HENVCFG_VALID_MASK 0xe0000003000000ffUL
>  #define HSTATEEN0_VALID_MASK 0xde00000000000007UL
>  
> +bool __ro_after_init svpbmt_enabled;
> +
>  void __init init_csr_masks(void)
>  {
>      /*
> @@ -79,6 +81,10 @@ void __init init_csr_masks(void)
>          INIT_RO_ONE_MASK(HSTATEEN0, hstateen0);
>      }
>  
> +    svpbmt_enabled = (riscv_isa_extension_available(NULL,
> +                RISCV_ISA_EXT_svpbmt)) && (ENVCFG_PBMTE &
> +                csr_masks.henvcfg);

Line wrapping wants doing entirely differently here. One of the style-
conforming options is

    svpbmt_enabled =
        riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) &&
        (csr_masks.henvcfg & ENVCFG_PBMTE);

> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -11,6 +11,7 @@
>  #include <xen/types.h>
>  
>  #include <asm/atomic.h>
> +#include <asm/cpufeature.h>
>  #include <asm/page-bits.h>
>  
>  #define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)
> @@ -42,7 +43,21 @@
>   *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
>   *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
>   *  11 - Rsvd   Reserved for future standard use
> + *
> + * These bits are only meaningful when Svpbmt is enabled. Otherwise they must
> + * stay 0 (PMA).
>   */
> +extern bool svpbmt_enabled;
> +static inline unsigned long pte_pbmt_nocache(void)
> +{
> +    return svpbmt_enabled ? BIT(61, UL) : 0;
> +}
> +
> +static inline unsigned long pte_pbmt_io(void)
> +{
> +    return svpbmt_enabled ? BIT(62, UL) : 0;
> +}

Why open-code ...

>  #define PTE_PBMT_NOCACHE            BIT(61, UL)
>  #define PTE_PBMT_IO                 BIT(62, UL)

... what is still available here?

> @@ -53,6 +68,7 @@
>  #define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE | PTE_ACCESSED)
>  
>  #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
> +
>  /*
>   * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
>   *

Stray change?

> @@ -82,7 +98,7 @@ enum pbmt_type {
>  
>  #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
>  
> -#define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
> +#define PTE_PBMT_MASK   (BIT(61, UL) | BIT(62, UL))

I don't understand the need for this change.

Jan

