Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385FEC79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 14:26:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413180.1643409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JFy-00006W-3F; Wed, 09 Sep 2026 14:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413180.1643409; Wed, 09 Sep 2026 14:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JFy-00006P-0E; Wed, 09 Sep 2026 14:26:34 +0000
Received: by outflank-mailman (input) for mailman id 1413180;
 Wed, 09 Sep 2026 14:26:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4JFw-00006J-93
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:26:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JFv-007rmQ-46
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:26:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa16c8b-8faa-0a2a0a5109dd-0a2a450bcae8-22
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:26:31 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa16c96-b7e8-0a2a450b0019-d1558030c542-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:26:30 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49b8ce9b733so47711815e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:26:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d1fd58c31sm51666065e9.1.2026.09.09.07.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:26:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1788963990; x=1789568790; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X2H/90oQDfjM4+y9oJSlivSth0VhUyGD5q0kYrhqD0=;
        b=ashy+tJEthRb/QFCa2TSTmPDhz6BVgXrlMdo0o+KouC/93B+m9FpjNTzOkdTOkPA2W
         Y3q2G3j6W5o1SqlZTIvbxHoXHJSbHNOVONkV/QVDBVT0kpEpx1AA6k7q4us2LG1T4sEL
         8lqkuyZ0bwkeJfF2YVlNLfyVanKn4hKqUidwSaxdPfS2m9f77pTwuGrOw9JrOPvTcXbM
         MnAn3mbhjlf5JruC1idhNcHbY+7tk/TDRR1NcZKdVZWk4aREHG6m1x5v5C66RvYQa4i+
         IiMu7rPvCxOibN+g99Woo2uWS1hFe3JLLjccj596Xr6sePLPVU2woKkM+mqZGtOj1jp6
         SqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963990; x=1789568790;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4X2H/90oQDfjM4+y9oJSlivSth0VhUyGD5q0kYrhqD0=;
        b=B1rhrt9rpTlWnPe5lM0z2aFEkDbtAVxau1VGvIXtLGNHIOk6mIo6GUlMO5uMs9H7aM
         farRgwUvxrj/bC9MbTrkmxVR6bdop79uFK1udSWXIPoEykwuGGHDUwyh9+zyeUjxe/0c
         wDnLK/+B5JxRC5OESZly5fF2LAzLHwA6mNRDDMl+ZLVhmNqQaSYfEjDlXRWbCEh+jTCJ
         sweo840FRGiED8yFLkt4aG6ZUgFs8s8De4/IseyLrymC416zdbZQ4NbH00idlhPwYZHT
         5JMcVMilG0ZZIwV0NUHn6xBoiSKqAMtzP5o5R+SuTwyZ8ghQDNCpJ07tOEc3JZoJLhPL
         7bFA==
X-Forwarded-Encrypted: i=1; AKwUvBwEGbBDVUeSizuirHzWG7bWiYyGpbyb2xWrokbyLbHVEmcrr/L6Nc6N4jiQFr5i1FxonZfnbRy9alE=@lists.xenproject.org
X-Gm-Message-State: AFuF++m/e+m/kPwuB6G/NH5zpqkRSC70OyOZ0w5fcOmZ3PMZIbMHDhhp
	JUlxbkWSEVUBJWCL62Dt0pKMWxtiiTbaoSP0zaJsAYcRtfplpngu7MlFP99hvDoQnNADbIt9Rym
	ytHYG4g==
X-Gm-Gg: AYBFou3mvCTJvf2BcdFLyfVV+g/Dy+DHcbeF5vLgtAL1uGf8PHP06PBiIauPEbf1uo1
	/w+UIEeIAxza3iOccFLDXqS8auHVfTKSM5qv892EHfVkvinQJq3HPVddmOPVqD1+5qeGHTxhFlS
	9eaz0uJVCtFWuHWGMdZajRwYgYnztrLlRsjU52q/95i4yWFXY+mqIyGqNPZER9wJ6/RHKOqY47v
	lqfS0pIoPpU1mvfBFGP4TksCql6HQSBTr1ePy/QNBWLpz9uNrAvRddZVJvORcjWOtyKUf6/c0S9
	Oxu9FVFNRjvq5bEzGrcYGaZOcEF3jVgbV/6RhC4GzAiOD3G0oxqouj4ufnWBCsKRXWrklbhAYBf
	4LSQMnuXUkYiE5T0tv4XpApvBycFlhkIdYuyCf4hh15NEuii48MPv/VGMC1qv48hjUc4IdyGuO7
	134EzBEJ1hYSBsLkeF/Ker8O0jCnxXMFdcXYTCrvj01N7CjRzpReW0dTXzQiuRLAiOPNmTZdIsM
	W1agXUiPTejEe1mgohTAjXcV0jXi98K+VBbj6R/BMLmsJLEMnjl5D3hZkzhXTw=
X-Received: by 2002:a05:600c:37c8:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49cf826c4e2mr344372345e9.16.1788963990158;
        Wed, 09 Sep 2026 07:26:30 -0700 (PDT)
Message-ID: <68ab5241-7301-4988-9420-bcccc4b16e3d@suse.com>
Date: Wed, 9 Sep 2026 16:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788963991-196C29EA-6BBBFA75/0/0
X-purgate-type: clean
X-purgate-size: 11180

On 27.08.2026 17:20, Oleksii Kurochko wrote:
> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
> +                              uint32_t base_val)
> +{
> +    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
> +    unsigned long hart_field = aplic_hart_field(target_vcpu->processor);

What guarantees target_vcpu's ->processor field to be meaningful at this
point? (Also again naming of the parameter: Generally it wants to be "v"
or "curr"; only very special cases may use other names.)

> +uint32_t aplic_hw_read_reg(unsigned int offset)
> +{
> +    unsigned long flags;
> +    uint32_t val;
> +
> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
> +
> +    spin_lock_irqsave(&aplic.lock, flags);
> +    val = readl((volatile void __iomem *)aplic.regs + offset);

Please can this have const alongside volatile?

> @@ -98,6 +108,27 @@
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
> +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw) \
> +    (BIT(hhxw, UL) - 1)
> +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs) \
> +    ((hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
> +
> +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw) \
> +    (BIT(lhxw, UL) - 1)
> +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs) \
> +    (lhxs)

May I ask to avoid unnecessary line splitting here as well?

> --- a/xen/arch/riscv/include/asm/vaplic.h
> +++ b/xen/arch/riscv/include/asm/vaplic.h
> @@ -21,11 +21,16 @@ struct domain;
>  
>  struct vaplic_regs {
>      uint32_t domaincfg;
> +
> +    uint32_t *target;
>  };

A pointer in this structure is odd, as this (supposedly) is a set of
guest register values. The field name also doesn't clarify its purpose.
All in all: Likely a comment is needed here.

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
> @@ -27,6 +28,279 @@ unsigned int __ro_after_init guest_aplic_num_sources;
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
> +    return read_atomic(&vaplic->regs.target[irqn]);
> +}
> +
> +static inline uint32_t generate_auth_mask(const struct domain *currd,
> +                                          unsigned int word_idx)
> +{
> +    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
> +
> +    if ( word_idx >= DIV_ROUND_UP(currd->arch.vintc->nr_virqs,
> +                                  sizeof(uint32_t) * BITS_PER_BYTE) )
> +    {
> +        gdprintk(XENLOG_DEBUG, "incorrect word_idx(%u) is passed\n", word_idx);

Along the lines of earlier remarks: What value does "is passed" add?

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
> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
> +        if ( value & APLIC_SOURCECFG_D )
> +        {
> +            dprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");

gdprintk()?

> +            goto fail;
> +        }
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
> +        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "value(%#x) is incorrect for sourcecfg register\n",
> +                     value);
> +
> +            return true;
> +        }
> +
> +        break;
> +
> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
> +    {
> +        struct vaplic *vaplic = to_vaplic(currd);
> +        struct vcpu *target_vcpu;

This, btw, is a case where I think not using "v" is warranted.

> +        unsigned int guest_hart_idx = MASK_EXTR(value, APLIC_TARGET_HART_IDX);
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
> +        target_vcpu = domain_vcpu(currd, guest_hart_idx);
> +
> +        if ( !target_vcpu )
> +        {
> +            dprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
> +
> +            /* Ignore such writings */
> +            return true;
> +        }
> +
> +        if ( vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM )
> +        {
> +            /*
> +             * A non-zero guest index asks for delivery to an interrupt file of
> +             * nested guest. The vIMSIC node has no riscv,guest-index-bits
> +             * property, so a guest is told its harts have no guest interrupt
> +             * files and the field is read-only zero for them. The write isn't
> +             * rejected (that would throw away a valid hart index and EIID);
> +             * instead the field is dropped, which is also what
> +             * aplic_msi_target_gen() does with it when programming the h/w.
> +             */
> +            if ( MASK_EXTR(value, APLIC_TARGET_GUEST_IDX) )
> +            {
> +                printk_once(XENLOG_WARNING
> +                            "%pd: vAPLIC target guest index != 0 is unsupported\n",
> +                            currd);
> +
> +                /* Ignore such writes ... */
> +                return true;
> +            }
> +
> +            write_atomic(&vaplic->regs.target[srcn], value);
> +
> +            value = aplic_msi_target_gen(target_vcpu, value);
> +        }
> +        else
> +        {
> +            /*
> +             * IPRIO is WARL and zero isn't a legal value for it, so normalize
> +             * it once: the guest then reads back exactly what it gets.
> +             */

What is "reads back exactly what it gets" supposed to express? The use of
"once" there also isn't quite clear to me.

> +            unsigned int iprio = MASK_EXTR(value, APLIC_TARGET_IPRIO) ?:
> +                                 APLIC_TARGET_IPRIO_DEFAULT;
> +            unsigned long h = cpuid_to_hartid(guest_hart_idx);
> +
> +            value = MASK_INSR(guest_hart_idx, APLIC_TARGET_HART_IDX) |
> +                    MASK_INSR(iprio, APLIC_TARGET_IPRIO);
> +
> +            write_atomic(&vaplic->regs.target[srcn], value);
> +
> +            value = MASK_INSR(h, APLIC_TARGET_HART_IDX) |
> +                    MASK_INSR(iprio, APLIC_TARGET_IPRIO);
> +        }
> +
> +        break;
> +    }
> +
> +    case APLIC_SETIPNUM:
> +    case APLIC_SETIPNUM_LE:
> +    case APLIC_CLRIPNUM:
> +    case APLIC_SETIENUM:
> +    case APLIC_CLRIENUM:
> +        if ( !value || !AUTH_IRQ_BIT(currd, value) )
> +            return true;
> +
> +        break;
> +
> +    case APLIC_DOMAINCFG:
> +    {
> +        struct vaplic *vaplic = to_vaplic(currd);
> +
> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
> +                                 (value & APLIC_DOMAINCFG_WMASK);
> +
> +        return true;
> +    }

May I suggest that you arrange case blocks (primarily) by offset? This would
then mean for DOMAINCFG handling to move to the top, helping at least a little
with SOURCECFG_{BASE,LAST} handling (slightly oddly) using APLIC_DOMAINCFG.

> @@ -122,7 +447,29 @@ int domain_vaplic_init(struct domain *d)
>       */
>      d->arch.vintc->nr_virqs = guest_aplic_num_sources + 1;
>  
> -    return 0;
> +    /* Slot 0 is unused: APLIC source numbering starts at 1 (see used_irqs). */
> +    vaplic->regs.target = xvzalloc_array(uint32_t, d->arch.vintc->nr_virqs);
> +    if ( !vaplic->regs.target )
> +    {
> +        d->arch.vintc = NULL;
> +        xvfree(vaplic);
> +
> +        return -ENOMEM;
> +    }
> +
> +    vaplic->regs_start = GUEST_APLIC_S_BASE;
> +    vaplic->regs_size = APLIC_SIZE(d->max_vcpus);
> +
> +    rc = register_mmio_handler(d, &vaplic_mmio_ops,
> +                               vaplic->regs_start, vaplic->regs_size);
> +    if ( rc )
> +    {
> +        d->arch.vintc = NULL;
> +        xvfree(vaplic->regs.target);
> +        xvfree(vaplic);
> +    }

Could you perhaps arrange for it to be possible to simply call
domain_vaplic_deinit() here (and maybe also on at least some of the earlier
error paths)? The code above loks very similar to ...

> @@ -134,5 +481,6 @@ void domain_vaplic_deinit(struct domain *d)
>  
>      vaplic = to_vaplic(d);
>      d->arch.vintc = NULL;
> +    xvfree(vaplic->regs.target);
>      xvfree(vaplic);
>  }

... what's here.

Jan

