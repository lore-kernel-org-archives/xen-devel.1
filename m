Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42470C56208
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 14:29:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384854.1627601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrz5h-0001h5-GJ; Thu, 06 Aug 2026 14:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384854.1627601; Thu, 06 Aug 2026 14:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrz5h-0001gy-Cm; Thu, 06 Aug 2026 14:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1384854;
 Thu, 06 Aug 2026 14:28:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrz5f-0001gs-6e
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 14:28:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrz5e-0010z3-8W
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 16:28:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a749a15-e002-0a2a0a5209dd-0a2a450baf20-34
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:28:58 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a749a29-b7e8-0a2a450b0019-d1558034c551-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:28:58 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4980dc26022so22404025e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 07:28:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995420cb4esm66193295e9.2.2026.08.06.07.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 07:28:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1786026537; x=1786631337; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzaRPmaEHzQlkduFv0nG4HxLqJX6MeEmdM6T+7huPik=;
        b=DFDXbM9al6GvAxyc97QaUfXDdsy03XUaENB5pEkvO6BM0/2cbyfZJLQdKDNMj4sUFg
         nivnqICUE265WOUvlkL/Jbx3KDm4WgYC7sC/07S3/kXP6EsF2ODxap6mbDQc6abyn9eI
         N4Ujd2ncAusUhqS8aMOh1xeS2wsoChHEQsV80z2v6mRJt1/ykn2Cd87DLHE8+y4Bm4w2
         kwy6W65dccgkNGKEQWwRho8e0DfeVRt+uqL6vISvGmCHytcuEJuKwJZabVMeE/vUOe3U
         O3T5v3eOCMt1TCTVajk3T2ip/Yy2yzalLyb/CMOg3TyG6YySIiPwTeCVCZkNSISY3kb1
         E6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786026537; x=1786631337;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzaRPmaEHzQlkduFv0nG4HxLqJX6MeEmdM6T+7huPik=;
        b=WuPkYtDZFAO3tbocjREMXi5F6IUmdVuvPew0acE/I0O6R8DgnKZBzqv3A8yfchcZoh
         jy6dVt2ZQYsKhwhEmecnidHlTalQwmgLYYvdHLlrIVFY28JBFHftnET5MQfchh+L1zeT
         46UQY8+zEHq+J1ab+B1LmsTHjj6iIrvTOAHA3YvZoXamPo/m+HgG/8pYBGEmsQjVBz+z
         wkFO8rLp1W0qSTy1BCAtvPQzW/Y9mClboFcmItNDZ6k0pvNVZMKiju82qeDI6Q36HUlw
         Uc6qYKEWnP3XzURY8GMh0mSWF8BQQh4iwzgF9JTXMmdokiol/aFVRuCdWlhNJFZw3Onc
         Afkg==
X-Forwarded-Encrypted: i=1; AHgh+Rrw8SooQIS5okhP67Z/CzyCJ+PvwMumn2IjHsJXd4Jk+OiiaQAePD/E0icHty93T0kMRWxBd2Xs20I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+gl7DBvxNOF7jkhSNpUAIAWjDe0gRCFuozoh+nOXxOPwARQuT
	21vAq0f5fqi10CgIarTwA+u7g0iW8ZkTdx668UMDJtfDAIIqSNWR3zpwrUf/w2sERA==
X-Gm-Gg: AR+sD12iupUHXs2gsXDXU9MCY/AUy84EPpaJH5TMG4BIJFBk30DSQbq4tKUIgkNTRcy
	FwRI2Wbn/oV5VrOy2kLegcimQk3wGRERSuCil/2ARaqmggkz1dAr1JiAfdER1j1J8wvCpOYnX5A
	20/x8dm1JgRaYNPrK/7FLvrJZsuT0JOHo3i5y5dmjGeW18rRFMQuUgis2nPThXS4suz+xu7YtGw
	bf8OzJz7c8s7WKHi+htczcOo/MiCQSFuS/uWahPDvI7/6uUjZ53N0kiimrYWXsDN0P5XbMBDU5v
	251mzbNIH5tAK0l/+61xbAVK5G9ep4j5SIkcvWsJGR3cp6OQlOR1rORWsjGjig1zqLDZAnSsrpU
	a67iwbDZU6srUxHYcjUVJFYY/tMXtR+UBJ5rKbmoGZVE3Za2PiPt7NL0Qr2vaa1/IBld6CNS6hy
	txWxkMfV9wrP7nxDPdCYI6gHHflRPmGRTeMFIVWKORsV3kXEzdE/leLcCBIfpKeB6oUWOfe2qrM
	pAdtwbbaQdpDQUwGsYqcF5pPbbQDgxXZWudvN45TGT9DqbUr4Tx
X-Received: by 2002:a05:600c:474f:b0:499:5210:c537 with SMTP id 5b1f17b1804b1-4995210c57fmr106068785e9.1.1786026537383;
        Thu, 06 Aug 2026 07:28:57 -0700 (PDT)
Message-ID: <57793423-aadd-4786-90fd-2923925b766d@suse.com>
Date: Thu, 6 Aug 2026 16:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/17] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1786026538-AB4D39EA-C2C9447D/10/73395122804
X-purgate-type: spam
X-purgate-size: 14636

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> Guests running under Xen program interrupt routing by writing to APLIC
> MMIO registers. Xen must intercept these accesses to enforce interrupt
> isolation between domains and to translate guest routing intent into the
> underlying physical MSI topology.
> 
> Writes are gated by the domain's authorised interrupt bitmap so that a
> guest cannot affect interrupts it does not own. TARGET register writes
> additionally require translation of the hart and IMSIC guest-file
> indices from virtual to physical, as the APLIC uses these fields
> directly to compute the MSI delivery address.
> 
> Delegation (APLIC_SOURCECFG_D) is not yet supported.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech> # vaplic_mmio_{read,write}

For this tag to have any meaning, it should move ahead of the --- above;
the explanations ...

> The downstream changes related to `vaplic_mmio_{read,write}` were originally
> in a separate patch (which was reviewed by Baptiste). However, before
> upstreaming, it was decided to merge them into the current patch.
> I added `Reviewed-by: Baptiste` in this form for now, but Baptiste will
> probably review the remaining changes as well.
> Once that happens, I'll simply move the `Reviewed-by` tag up and
> remove the `#`.

... here rather explain the restriction on the R-b, not its odd placement.

> ---
> Changes in v3:

As this looks to be recurring - please get versioning of your series right.
The series is supposedly v1, but here you give the impression of it being
v3. If there really was an earlier v2 posting, why isn't the entire series
here v3?

> --- a/xen/arch/riscv/aplic-priv.h
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -48,4 +48,6 @@ struct aplic_priv {
>   */
>  extern unsigned int guest_aplic_num_sources;
>  
> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu, uint32_t base_val);

PLease can you, before submitting, self-review your patches? I'm really
getting tired of having to repeatedly point out basic style issues, like
the overlong line here.

> @@ -38,6 +39,60 @@ static struct intc_info __ro_after_init aplic_info = {
>      .hw_variant = INTC_APLIC,
>  };
>  
> +static unsigned long aplic_hart_field(unsigned long hartid)
> +{
> +    const struct imsic_config *imsic = imsic_get_config();
> +    unsigned int lhxw = imsic->hart_index_bits;
> +    unsigned int hhxw = imsic->group_index_bits;

It extends to the other local variables here, but I'll use these two to
try to make my point: I'm struggling to associate the names with the
values they are set to. Likely "hxw" is an abbreviation of hart index
width, but (a) what's the leading 'l' then and (b) why is there no 'g'
in "hhxw"? By using hard to grasp names, you make it hard to actually
understand the subsequent expressions, in particular ...

> +    unsigned int hhxs =
> +        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
> +    unsigned long tppn =
> +        imsic->msi[hartid].base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
> +    unsigned long group_index =
> +        (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
> +        APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
> +
> +    return (group_index << lhxw) | hartid;

... these last two. As it stands, they may be easier to understand if
you didn't have the local variables at all, despite them then getting
textually longer.

> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu, uint32_t base_val)

Same issue as with the decl.

> +{
> +    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
> +    unsigned long hart_id = cpuid_to_hartid(target_vcpu->processor);
> +    unsigned long hart_field = aplic_hart_field(hart_id);
> +
> +    base_val &= APLIC_TARGET_EIID_MASK;
> +    base_val |= MASK_INSR(guest_id, APLIC_TARGET_GUEST_IDX_MASK);
> +    base_val |= MASK_INSR(hart_field, APLIC_TARGET_HART_IDX_MASK);
> +
> +    return base_val;
> +}
> +
> +uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask)
> +{
> +    unsigned long flags;
> +    uint32_t val;
> +
> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
> +
> +    spin_lock_irqsave(&aplic.lock, flags);
> +    val = readl((volatile void __iomem *)aplic.regs + offset) & mask;

Wouldn't this applying of a mask better be done in those callers which
actually need it? It's not the least the asymmetry with ...

> +    spin_unlock_irqrestore(&aplic.lock, flags);
> +
> +    return val;
> +}
> +
> +void aplic_hw_write_reg(unsigned int offset, uint32_t value)

... this which I consider unhelpful.

> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -28,6 +28,8 @@
>  #define APLIC_DOMAINCFG_BE      BIT(0, U)
>  
>  /* sourcecfg register fields */
> +#define APLIC_SOURCECFG_D       BIT(10, U)

As to the comment - this indeed looks to be a field, but ...

>  #define APLIC_SOURCECFG_SM_INACTIVE     0x0
>  #define APLIC_SOURCECFG_SM_DETACH       0x1
>  #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4

... these look to be values of some other field which isn't described. Please
may I (again) ask that definitions are their commentary at the very least not
misguide readers?

> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -40,6 +40,16 @@ struct imsic_config {
>      /* Base address */
>      paddr_t base_addr;
>  
> +    /*
> +     * MSI Target Address Scheme
> +     *
> +     * XLEN-1                                                12     0
> +     * |                                                     |     |
> +     * -------------------------------------------------------------
> +     * |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
> +     * -------------------------------------------------------------
> +     */

And the xxx-es in here mean what exactly? Don't care? Some other, unrelated
values? Yet something else?

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
> @@ -27,6 +28,256 @@ unsigned int __ro_after_init guest_aplic_num_sources;
>  
>  #define FDT_VAPLIC_INT_CELLS 2
>  
> +#define AUTH_IRQ_BIT(d, irqn) ( \
> +    ((irqn) < (d)->arch.vintc->nr_virqs) && \
> +    test_bit(irqn, (d)->arch.vintc->used_irqs) )

Nit: Indentation.

> +/*
> + * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
> + * a 32-bit word index into the allocated_irqs bitmap.  Each word covers 32
> + * interrupt sources.  For SOURCECFG and TARGET groups the same division also
> + * yields the interrupt number directly, because those arrays store one 32-bit
> + * register per source.
> + */
> +#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
> +
> +static inline uint32_t generate_auth_mask(const struct domain *d,
> +                                          unsigned int word_idx)
> +{
> +    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
> +
> +    if ( word_idx >= DIV_ROUND_UP(d->arch.vintc->nr_virqs,
> +                                  sizeof(uint32_t) * BITS_PER_BYTE) )
> +    {
> +        dprintk(XENLOG_DEBUG, "incorrect word_idx(%u) is passed\n", word_idx);

Is this really meant to stay?

> +        return 0U;

The U suffix is mainly (even if only slightly) obfuscating things, I think.

> +    }
> +
> +    return (uint32_t)(d->arch.vintc->used_irqs[first_bit / BITS_PER_LONG] >>
> +                      (first_bit % BITS_PER_LONG));

I don't quite understand the need for the cast.

> +static int cf_check vaplic_emulate_load(const struct vcpu *v,

Why the cf_check (also for the store counterpart)?

> +static int cf_check vaplic_emulate_store(const struct vcpu *v,
> +                                         unsigned long addr, uint32_t value)
> +{
> +    int rc = -EINVAL;
> +    const struct domain *d = v->domain;
> +    unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
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
> +        value &= generate_auth_mask(d, word_idx);
> +
> +        break;
> +    }
> +
> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
> +        if ( value & APLIC_SOURCECFG_D )
> +        {
> +            rc = -EOPNOTSUPP;
> +
> +            dprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
> +
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
> +        if ( !AUTH_IRQ_BIT(d, regoffset_to_word_idx(offset - APLIC_DOMAINCFG)) )
> +            /* Interrupt not enabled, ignore it */
> +            return 0;
> +
> +        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "value(%u) is incorrect for sourcecfg register\n", value);
> +
> +            return 0;
> +        }
> +
> +        break;
> +
> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
> +    {
> +        struct vcpu *target_vcpu = NULL;
> +        unsigned int hart_idx = value >> APLIC_TARGET_HART_IDX_SHIFT;
> +
> +        /*
> +         * Look at vaplic_emulate_load() for explanation why
> +         * APLIC_GENMSI is subtracted.
> +         */
> +        if ( !AUTH_IRQ_BIT(d, regoffset_to_word_idx(offset - APLIC_GENMSI)) )
> +            /* Interrupt not enabled, ignore it */
> +            return 0;
> +
> +        if ( hart_idx < v->domain->max_vcpus )

You have d as a local variable.

> +            target_vcpu = v->domain->vcpu[hart_idx];

Use domain_vcpu()?

> +        if ( !target_vcpu )
> +        {
> +            dprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
> +
> +            /* Ignore such writings */
> +            return 0;
> +        }
> +
> +        value = aplic_msi_target_gen(target_vcpu, value);
> +
> +        break;
> +    }
> +
> +    case APLIC_SETIPNUM:
> +    case APLIC_SETIPNUM_LE:
> +    case APLIC_CLRIPNUM:
> +    case APLIC_SETIENUM:
> +    case APLIC_CLRIENUM:
> +        if ( !value || !AUTH_IRQ_BIT(d, value) )
> +            return 0;
> +
> +        break;
> +
> +    case APLIC_DOMAINCFG:
> +    {
> +        struct vaplic *vaplic = to_vaplic(v->domain);
> +
> +        /*
> +         * The domaincfg register has this format:
> +         * bits 31:24 read-only 0x80
> +         * bit 8      IE
> +         * bit 7      read-only 0
> +         * bit 2      DM (WARL)
> +         * bit 0      BE (WARL)
> +         *
> +         * The most interesting bit for us is IE(Interrupt Enable) bit.
> +         * At the moment, at least, Linux doesn't use domaincfg.IE bit to
> +         * disable interrupts globally, but if one day someone will use it
> +         * then extra actions should be done.
> +         *
> +         * Only DM (bit 2) and IE (bit 8) are writable here. They are assigned
> +         * (not OR-ed) so that a write of 0 can also clear them (WARL), and the
> +         * read-only high byte (0x80) is always kept set on read-back.
> +         */
> +        if ( value & ~(APLIC_DOMAINCFG_RO | APLIC_DOMAINCFG_DM |
> +                       APLIC_DOMAINCFG_IE) )
> +            printk_once("%s: Ignore writes to non-writable domaincfg bits as "
> +                        "they are set by aplic during initialization in Xen\n",
> +                        __func__);
> +
> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
> +                                 (value & (APLIC_DOMAINCFG_DM |
> +                                           APLIC_DOMAINCFG_IE));
> +
> +        return 0;
> +    }
> +
> +    default:
> +        goto fail;

Instead of this goto, I think you simply want to move the label here.
That'll also make the function more similar to its load counterpart.

> @@ -105,6 +356,50 @@ static const struct vintc_init_ops __initconstrel init_ops = {
>      .make_domu_dt_node = vaplic_make_domu_dt_node,
>  };
>  
> +static enum io_state cf_check vaplic_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                                               register_t *r)
> +{
> +    uint32_t data = 0;
> +
> +    if ( info->len != sizeof(uint32_t) ||
> +         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
> +    {
> +        gdprintk(XENLOG_DEBUG,
> +                 "VAPLIC: unaligned/wrong-width read gpa=%"PRIpaddr" len=%u\n",
> +                 info->gpa, info->len);

You have v passed in here, but you'd log current. If passing in v is
necessary (i.e. here or elsewhere it may be other than current), then you
need to either ASSERT(v == current) at the top of the funciton or otherwise
handle v != current correctly.

> +        return IO_ABORT;
> +    }
> +
> +    if ( vaplic_emulate_load(v, info->gpa, &data) < 0 )

If all you care about is a boolean result, why not make the function return
bool?

> +        return IO_ABORT;
> +
> +    *r = data;
> +    return IO_HANDLED;

Nit: Blank line please ahead of <etc>.

> +static enum io_state cf_check vaplic_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                                                register_t r)
> +{
> +    if ( info->len != sizeof(uint32_t) ||
> +         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
> +    {
> +        gdprintk(XENLOG_DEBUG,
> +                 "VAPLIC: unaligned/wrong-width write gpa=%"PRIpaddr" len=%u\n",
> +                 info->gpa, info->len);
> +        return IO_ABORT;
> +    }
> +
> +    if ( vaplic_emulate_store(v, info->gpa, r) < 0 )

Same here.

Jan

