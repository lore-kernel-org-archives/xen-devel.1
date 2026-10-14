Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC62CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:52:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449081.1665031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzP3-0002xe-W7; Wed, 14 Oct 2026 13:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449081.1665031; Wed, 14 Oct 2026 13:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzP3-0002xX-SU; Wed, 14 Oct 2026 13:52:21 +0000
Received: by outflank-mailman (input) for mailman id 1449081;
 Wed, 14 Oct 2026 13:52:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGzP2-0002wQ-L9
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:52:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGzP1-004nEZ-RP
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:52:19 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf890f-2eae-0a2a0a5409dd-0a2a4501daf8-12
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:52:19 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf8913-5984-0a2a45010019-d155dd2dc968-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:52:19 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48b0946c2c2so2666092f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 06:52:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de72c7e36sm6598086f8f.37.2026.10.14.06.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 06:52:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1791985939; x=1792590739; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezXCXUWK6SsuGyAG3eCrrjeZLo0IOueiBha//yJ648E=;
        b=AkOp2IbatdOIxPHvT41Tae/fGhhsDq4QfyhRF6DxOQIjmMr87lzjWrmaOOaoCf8ZWi
         ioIl0T9021zuM4k4+8XD3QMjctNS7T+ZWZLy/QJoT1vKhvxSZbYtCyIrB4x5zIN/x6wI
         v6ELOyuCVE8qN8U75lnYs6pxgE2m9rEBY322wUPC3ckYMc5IPmtoVX0U2nnwzDATAb2Z
         tWkVrp17ynYWNXaw4cAn8b1hz6DI7fm+EYD7FFPgR9mn+Q6Egw5dM6JquJWHaqRq2zM9
         2s7m3wID4HMwyGnrNzk2Wk1KXi/MijxiaT8nigKWG1AXNpccB72anftxALSBzWhG4dbJ
         HyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985939; x=1792590739;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezXCXUWK6SsuGyAG3eCrrjeZLo0IOueiBha//yJ648E=;
        b=vLJ5+M02njBk1kW/ukJSRX6P0KPz1uEzeQTjVopkDcnQ8wjU0NmYc66udIClGhXgip
         uwlZIENeqF4qvfr3z9SJ7VVwVK0y5K90+E0O1ktPCytfABLzvjSnbhksBiHXctwYyRyE
         WOU3fNaSKPi3/fo5Vxj1nlkoNB2cDqKDB5277Quf6Ktwyismh8HgobYm8YMhhDzAHhTk
         cVZnoH7kDmYKY/FOVvi1cgv2/i3r0xiun9ReTTOjfe1agzlpzt3/h9l7lSrkMcAkCe2Q
         avo0/30n7nb3QzN0ghbFq7IUCXt57cDXV0imaGSKAEhAwgycZdcA4tuKQopQ50VJa2di
         aFnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCFJIkF3bEqdcBSAl/ivz6NSSHmyMn9O5C8Oy1vvkYI79izC6SuGhf8CB3+McmxVj0KS/jPFQbE6c=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIm78EDm54Wxw5BPYk7BEQMiQG4CyEfO/SEhKZnlZigv3PBisbl
	tCGpGhZPh+4mQ/OEKXAfF2KGk5igVTjQIOJBnycPM6fdmjUDL6inNuzTEzFAmgb5hg==
X-Gm-Gg: AYBFou3YGr84eTyvsl0Lcv9dnvE/8UnFiRe5lmtjxv/UG0LUlysoGBfqVQ7iYev/loK
	WOwvUMqiAO+Hc7pLbK1F9UPWmKv9LpjzdQWdWQtAobBCi2WFwNVH4shGQyn93dbi/SRFGLxAXWn
	MzZnM2UMRyugicNrZx6vQvwWoz4HqfNA79xi103N8L6cTpmkoS954o7dBoO3WI194blYIPHdf+5
	ujYzAe2I1q6KOttfvn+qwSh3HNX43A9sxlqKXxENURvnPmn0qUtokkSU3Q9Y6xHI+v1Osu1Cgpd
	BqOV7J2fOBOB8DcD7/L/Ct3uVFdO2xZ22wNOGHqjEz5mxDajvfEBvL26JnOTAGa4rVs92gzW23z
	IpAc5+XM6qsoTymZ/KLtzT2JOd3AVYCUABkyMMqAdfgK5qLBnfHgbBzj+eK3j8VDL1/EaA5IYY2
	pA6LLxruPGDsnrZvlz7ZWBtbgn7q+WjnGiE5h8L8nW+f73i4c3omaiJVfSeWQ1QnBjkrjNUQI6W
	j/wMlecj7za4AwSl4SpdRPtzT1f93hGbT9PGFnlmJ6aROu/WWiTQWBqI21La9KlYvve2uBD
X-Received: by 2002:a05:6000:2dc1:b0:488:8850:50ec with SMTP id ffacd0b85a97d-48de2b4d7e5mr10736800f8f.46.1791985938638;
        Wed, 14 Oct 2026 06:52:18 -0700 (PDT)
Message-ID: <6de1f79c-2e2b-4794-8eba-ad7ac224d24d@suse.com>
Date: Wed, 14 Oct 2026 15:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/39] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bd546cae116c93c88706b49e7c24a125b4e5237c.1790779209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <bd546cae116c93c88706b49e7c24a125b4e5237c.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1791985939-1D67C757-82538338/10/78276251493
X-purgate-type: spam
X-purgate-size: 13595

On 30.09.2026 18:18, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -39,6 +39,13 @@
>  #define  APLIC_DOMAINCFG_IE             BIT(8, U)
>  #define  APLIC_DOMAINCFG_DM             BIT(2, U)
>  #define  APLIC_DOMAINCFG_BE             BIT(0, U)
> +/*
> + * The bits a write may change. Everything else, including the read-only zero
> + * bit 7 and the reserved bits, has to read back as zero, and BE is WARL and
> + * hardwired to 0 as Xen is little-endian only.
> + */
> +#define  APLIC_DOMAINCFG_WMASK          (APLIC_DOMAINCFG_IE | \
> +                                         APLIC_DOMAINCFG_DM)
>  
>  #define APLIC_SOURCECFG_BASE            0x0004
>  #define APLIC_SOURCECFG_LAST            0x0ffc
> @@ -58,6 +65,12 @@
>  #define   APLIC_SOURCECFG_SM_EDGE_FALL  0x5
>  #define   APLIC_SOURCECFG_SM_LEVEL_HIGH 0x6
>  #define   APLIC_SOURCECFG_SM_LEVEL_LOW  0x7
> +/*
> + * All other bits of sourcecfg[] are reserved and read as zero, so drop them
> + * on a write.
> + */
> +#define  APLIC_SOURCECFG_WMASK          (APLIC_SOURCECFG_D | \
> +                                         APLIC_SOURCECFG_SM)

You don't drop any bits here; that would happen at the use site of this
constant. The comment would better be worded accordingly. (The comment
a few lines up, for APLIC_DOMAINCFG_WMASK, is better in this regard.)

> @@ -89,6 +102,9 @@
>  #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
>  /* Bit 11 is reserved and reads as zero */
>  #define  APLIC_TARGET_EIID              GENMASK(10, 0)
> +/* If target is in direct delivery mode (domaincfg.DM = 0) */
> +#define  APLIC_TARGET_IPRIO             GENMASK(7, 0)
> +#define   APLIC_TARGET_IPRIO_DEFAULT    1U

With this overlap of bits with EEID, should that one gain a similar
comment?

> @@ -98,6 +114,24 @@
>  #define APLIC_SIZE(nr_cpus) \
>      (APLIC_MIN_SIZE + APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
>  
> +/*
> + * Using setip is fine here, as all SET* and CLR* register groups consist of 32
> + * registers and therefore have identical sizes.
> + *
> + * Lowest 2 bits are always zero for SET* and CLR* registers.
> + */
> +#define APLIC_SETCLR_OFFSET_MASK \
> +    (sizeof_field(struct aplic_regs, setip) - sizeof(uint32_t))
> +
> +#define APLIC_xMSICFGADDR_PPN_SHIFT IMSIC_MMIO_PAGE_SHIFT
> +
> +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw) (BIT(hhxw, UL) - 1)
> +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs) \
> +    ((hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
> +
> +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw) (BIT(lhxw, UL) - 1)
> +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs) (lhxs)

As previously indicated (perhaps in other contexts): Pairs of masks and
shifts are almost always ambiguous. Hence why we have MASK_EXTR() and
MASK_INSR(), requiring only a mask: The shift value can be derived from
the mask.

> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -17,6 +17,7 @@
>  #include <asm/aia.h>
>  #include <asm/imsic.h>
>  #include <asm/intc.h>
> +#include <asm/mmio.h>
>  #include <asm/vaplic.h>
>  
>  #include "aplic-priv.h"
> @@ -27,6 +28,313 @@ unsigned int __ro_after_init guest_aplic_num_sources;
>  
>  #define FDT_VAPLIC_INT_CELLS 2
>  
> +#define AUTH_IRQ_BIT(d, irqn) \
> +    (((irqn) < (d)->arch.vintc->nr_virqs) && \
> +     test_bit(irqn, (d)->arch.vintc->used_irqs))
> +
> +/*
> + * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
> + * a 32-bit word index into the used_irqs bitmap. Each word covers 32
> + * interrupt sources. For SOURCECFG and TARGET groups the same division also
> + * yields the interrupt number directly, because those arrays store one 32-bit
> + * register per source.
> + */
> +#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
> +
> +static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
> +{
> +    const struct vaplic *vaplic = to_vaplic(d);
> +
> +    /* target[0] doesn't exist so irqn == 0 should be impossible */
> +    if ( !irqn || irqn >= vaplic->vintc.nr_virqs )
> +        return 0;
> +
> +    return read_atomic(&vaplic->regs.sources[irqn].target);
> +}

I wonder whether in cases like this one, where you work with guest controlled
array indexes, you wouldn't be better off using array_{access,index}_nospec()
right away.

> +static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
> +                                 uint32_t value)
> +{
> +    const struct domain *currd = curr->domain;
> +    unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;
> +
> +    ASSERT(curr == current);
> +
> +    switch ( offset )
> +    {
> +    case APLIC_DOMAINCFG:
> +    {
> +        struct vaplic *vaplic = to_vaplic(currd);

In vaplic_emulate_load() you have this at function scope? Why do you do
it differently here, despite there being at least one more instance
later in the function? With this moved, the oddly placed (yet still
style conforming) figure braces also wouldn't be needed.

> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
> +                                 (value & APLIC_DOMAINCFG_WMASK);
> +
> +        return true;
> +    }
> +
> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
> +        /*
> +         * Only D (bit 10) and SM (bits 2:0) are implemented, the rest of the
> +         * bits are reserved and read as zero, so ignore what a guest writes
> +         * to them.
> +         */
> +        value &= APLIC_SOURCECFG_WMASK;
> +
> +        if ( value & APLIC_SOURCECFG_D )
> +        {
> +            gdprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
> +
> +            goto fail;
> +        }
> +
> +        /*
> +         * SM is WARL, so the reserved values 0x2 and 0x3 need no handling
> +         * here: vAPLIC keeps no shadow copy of sourcecfg[], the value is
> +         * written straight to the h/w register and is read back from it, so
> +         * it is the h/w which substitutes a legal value for an illegal one.
> +         *
> +         * TODO: when vAPLIC starts to shadow sourcecfg[], the WARL behaviour
> +         * will have to be emulated here instead, e.g.:
> +         *   if ( value == 0x2 || value == 0x3 )
> +         *       value = APLIC_SOURCECFG_SM_INACTIVE;
> +         */
> +
> +        /*
> +         * As sourcecfg register starts from 1:
> +         *   0x0000 domaincfg
> +         *   0x0004 sourcecfg[1]
> +         *   0x0008 sourcecfg[2]
> +         *    ...
> +         *   0x0FFC sourcecfg[1023]
> +         * It is necessary to calculate an interrupt number by subtracting
> +         * APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
> +         */
> +        if ( !AUTH_IRQ_BIT(currd,
> +                           regoffset_to_word_idx(offset - APLIC_DOMAINCFG)) )
> +            /* Interrupt not enabled, ignore it */
> +            return true;
> +
> +        break;
> +
> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
> +    {
> +        unsigned int word_idx =
> +            regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
> +
> +        value &= generate_auth_mask(currd, word_idx);
> +
> +        break;
> +    }
> +
> +    case APLIC_SETIPNUM:
> +    case APLIC_CLRIPNUM:
> +    case APLIC_SETIENUM:
> +    case APLIC_CLRIENUM:
> +    case APLIC_SETIPNUM_LE:
> +        if ( !value || !AUTH_IRQ_BIT(currd, value) )
> +            return true;
> +
> +        break;
> +
> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
> +    {
> +        struct vaplic *vaplic = to_vaplic(currd);
> +        /*
> +         * Look at vaplic_emulate_load() for explanation why APLIC_GENMSI is
> +         * subtracted.
> +         */
> +        unsigned int srcn = regoffset_to_word_idx(offset - APLIC_GENMSI);
> +
> +        if ( !AUTH_IRQ_BIT(currd, srcn) )
> +            /* Interrupt not enabled, ignore it */
> +            return true;
> +
> +        if ( vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM )
> +        {
> +            struct vaplic_source *src = &vaplic->regs.sources[srcn];
> +            struct vcpu *target_vcpu;
> +            unsigned int guest_hart_idx =
> +                MASK_EXTR(value, APLIC_TARGET_HART_IDX);
> +            unsigned long flags;
> +            struct vimsic_state *vimsic_state;
> +
> +            target_vcpu = domain_vcpu(currd, guest_hart_idx);
> +
> +            if ( !target_vcpu )
> +            {
> +                gdprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
> +
> +                /* Ignore such writings */
> +                return true;
> +            }
> +
> +            vimsic_state = target_vcpu->arch.vimsic_state;
> +
> +            /*
> +             * A non-zero guest index asks for delivery to an interrupt file
> +             * of a nested guest. The vIMSIC node has no riscv,guest-index-bits
> +             * property, so a guest is told its harts have no guest interrupt
> +             * files and the field reads as zero for them. Such a write is
> +             * illegal and is therefore ignored as a whole: the stored copy
> +             * keeps the zero it was allocated with, so the field never needs
> +             * to be masked out here.
> +             * What ends up in the h/w register is Xen's own value anyway:
> +             * aplic_msi_target_gen() overwrites the field with
> +             * vcpu_guest_file_id() of the target vCPU.
> +             */
> +            if ( MASK_EXTR(value, APLIC_TARGET_GUEST_IDX) )
> +            {
> +                printk_once(XENLOG_WARNING
> +                            "%pd: vAPLIC target guest index != 0 is unsupported\n",
> +                            currd);
> +
> +                return true;
> +            }
> +
> +            /*
> +             * src->lock keeps the stored copy and the h/w register updated
> +             * as a pair.
> +             */
> +            spin_lock_irqsave(&src->lock, flags);
> +
> +            write_atomic(&src->target, value);
> +
> +            /* IRQs are already off under src->lock. */
> +            read_lock(&vimsic_state->vsfile_lock);
> +
> +            /*
> +             * The h/w register names the hart and the guest interrupt file
> +             * MSIs are sent to, and there is none of either until the target
> +             * vCPU is given a h/w guest interrupt file. The stored copy
> +             * reaches the h/w at that point.
> +             *
> +             * TODO: once s/w guest interrupt files are supported, a vCPU using
> +             * one still needs its MSIs, so the h/w register will have to be
> +             * written for it too, pointing at an interrupt file Xen receives
> +             * them in on the vCPU's behalf.
> +             */
> +            if ( vimsic_state->vsfile_cpu != CPU_NONE )
> +                aplic_hw_write_reg(offset,
> +                                   aplic_msi_target_gen(target_vcpu, value));
> +
> +            read_unlock(&vimsic_state->vsfile_lock);
> +
> +            spin_unlock_irqrestore(&src->lock, flags);
> +
> +            return true;
> +        }
> +
> +        /* printk_once(), as a guest could otherwise flood the log. */
> +        printk_once(XENLOG_WARNING
> +                    "%pd: vAPLIC direct delivery mode isn't supported\n",
> +                    currd);
> +
> +        return true;
> +    }
> +
> +    default:
> +    fail:
> +        gdprintk(XENLOG_WARNING,
> +                 "Unhandled APLIC write at offset %#x (value %#x)\n", offset,
> +                 value);
> +
> +        return false;
> +    }
> +
> +    aplic_hw_write_reg(offset, value);

I continue to struggle with this passing through of writes (reads are
passed through as well, but at least those don't alter state). Aren't
different guests going to interfere with their writes to setip, clrip,
setie, clrie, and apparently also {set,clr}i{p,e}num?

> @@ -95,6 +403,56 @@ static const struct vintc_init_ops __initconstrel init_ops = {
>      .make_domu_dt_node = vaplic_make_domu_dt_node,
>  };
>  
> +static enum io_state cf_check vaplic_mmio_read(struct vcpu *v,
> +                                               mmio_info_t *info)
> +{
> +    uint32_t val;
> +
> +    ASSERT(v == current);
> +
> +    if ( info->len != sizeof(uint32_t) ||
> +         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
> +    {
> +        gdprintk(XENLOG_DEBUG,
> +                 "VAPLIC: unaligned/wrong-width read gpa=%"PRIpaddr" len=%u\n",
> +                 info->gpa, info->len);
> +        return IO_ABORT;
> +    }
> +
> +    if ( !vaplic_emulate_load(v, info->gpa, &val) )
> +        return IO_ABORT;
> +
> +    /* APLIC registers are 32-bit; zero-extend to the guest register width. */
> +    info->data = val;

How do you know info->data has the size of registers as seen by guests? Plus,
how does this matter anyway? You reject info->len being other than 4, which
means the originating insn will necessarily have been a 4-byte load. What
happens to the upper bits (if there are any) depends on the behavior of the
insn that's being emulated, not on what you do here when storing into
info->data.

Jan

