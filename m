Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DF6C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 14:04:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389106.1630031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9Yd-0004sZ-9h; Wed, 12 Aug 2026 14:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389106.1630031; Wed, 12 Aug 2026 14:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9Yd-0004sS-6N; Wed, 12 Aug 2026 14:03:51 +0000
Received: by outflank-mailman (input) for mailman id 1389106;
 Wed, 12 Aug 2026 14:03:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wu9Yb-0004sL-25
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 14:03:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu9Ya-000Ej1-F5
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 16:03:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff64938f1000c4f3@swg.vates.tech>)
 id 6a7c7d32-bab6-0a2a0a5309dd-0a2a45028be0-32
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:03:48 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff64938f1000c4f3@swg.vates.tech>)
 id 6a7c7d43-6ca4-0a2a45020019-b9ff1c228a83-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:03:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ff64938f1000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Aug 2026 14:03:41 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B44FC8159B;
 Wed, 12 Aug 2026 16:03:40 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=iLZtSt22vfR2LB7LFYAEOG+oDPKyuUTswtUaaj87lFk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=UzsZ+3umlvAE4zVXhRUit1W7+xWtjejtaWX4aERvtqHGtO2okhddBmx0iF2NJRfliESWc7Vzo
 /i20cBNvIlcGLOFWW4mAXzOSGHykiGsSfYVj7QfDQaAe5v7kuPG9IRcWm2RP6yOUIDc4lL/Vd/M
 5Wt7m98n1mV6TThhSCD+6QcZg8WH5BWqrhYRkjFGzy4U6wwip09uSJBk9L1CrcQUrJiAFyHdj6C
 8mHcwnD7Ny4CRKsZ8rKUR2mSAhvUEIvC1zQn+ieidyW7Wc3RrAkS02qAPFf3xRAKgc+KX5tid8q
 VEDyFnbUnlJpHrgA2GfSVOWlA8nahavc8CYgO5B2ODHg==
X-Zone-Loop: 6902e8c487a42c68a0aaa4835805e663dc8aa347469e
x-campaign-type: default
x-transaction-id: b882a6e1-5dd0-4cf9-86c6-1bb5dcb6687e
x-swg-uid: 01-4e71573b-4354-4ccf-b120-ee08dd3b00d7
X-Mailer: Sweego
Message-ID:
 <1786543421.8631fc262581453bbf619ec5b2062170.19ff64938f1000c4f3@vates.tech>
x-swg-bid: 1786543421.8631fc262581453bbf619ec5b2062170.19ff64938f1000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 05/17] xen/riscv: implement virtual APLIC MMIO
 emulation
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
Date: Wed, 12 Aug 2026 16:03:33 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786543420; l=11849;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=MWHi21j2IO4mBaWnIOvUV5BO5/PdlSho/xRfc5nngWo=;
 b=zxkFkM7iQ8HmQbQMi9YB3jNCOJW4jDUNFyMWNRJdv3ZZQ8y86hsF1A0E17LaetgtnT/RXegId
 2177ydpbOP/ABN+cXvtryDGiM0JxjcazqT5sfzUSh8/3H8nq7J4mhPq
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786543420934
X-purgate-ID: tlsNG-720697/1786543427-F28B42AC-D52472E2/10/73395122804
X-purgate-type: spam
X-purgate-size: 11849

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


















>
> diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
> index 1391837f89..96bc56dbe5 100644
> --- a/xen/arch/riscv/aplic-priv.h
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -48,4 +48,6 @@ struct aplic_priv {
>   */
>  extern unsigned int guest_aplic_num_sources;
>  
> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu, uint32_t base_val);


> +
>  #endif /* ASM_RISCV_APLIC_PRIV_H */
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index 3681f0669e..87f2134bc5 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -16,6 +16,7 @@
>  #include <xen/irq.h>
>  #include <xen/mm.h>
>  #include <xen/sections.h>
> +#include <xen/sched.h>
>  #include <xen/spinlock.h>
>  #include <xen/types.h>
>  #include <xen/vmap.h>
> @@ -38,6 +39,60 @@ static struct intc_info __ro_after_init aplic_info = {
>      .hw_variant = INTC_APLIC,
>  };
>  
> +static unsigned long aplic_hart_field(unsigned long hartid)


> +{
> +    const struct imsic_config *imsic = imsic_get_config();
> +    unsigned int lhxw = imsic->hart_index_bits;
> +    unsigned int hhxw = imsic->group_index_bits;
> +    unsigned int hhxs =
> +        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
> +    unsigned long tppn =
> +        imsic->msi[hartid].base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
> +    unsigned long group_index =
> +        (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
> +        APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
> +
> +    return (group_index << lhxw) | hartid;
> +}
> +
> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu, uint32_t base_val)
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
> +    spin_unlock_irqrestore(&aplic.lock, flags);
> +
> +    return val;
> +}
> +
> +void aplic_hw_write_reg(unsigned int offset, uint32_t value)
> +{
> +    unsigned long flags;
> +
> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
> +
> +    spin_lock_irqsave(&aplic.lock, flags);
> +    writel(value, (volatile void __iomem *)aplic.regs + offset);
> +    spin_unlock_irqrestore(&aplic.lock, flags);
> +}
> +
>  static void __init aplic_init_hw_interrupts(void)
>  {
>      unsigned int i;
> diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
> index f22622b9a2..4ae5fb8f26 100644
> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -28,6 +28,8 @@
>  #define APLIC_DOMAINCFG_BE      BIT(0, U)
>  
>  /* sourcecfg register fields */
> +#define APLIC_SOURCECFG_D       BIT(10, U)
> +
>  #define APLIC_SOURCECFG_SM_INACTIVE     0x0
>  #define APLIC_SOURCECFG_SM_DETACH       0x1
>  #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
> @@ -38,6 +40,16 @@
>  /* target register fields */
>  #define APLIC_TARGET_HART_IDX_SHIFT 18
>  #define APLIC_TARGET_EIID_MASK      0x7ff
> +#define APLIC_TARGET_HART_IDX_MASK  0xfffc0000
> +#define APLIC_TARGET_GUEST_IDX_MASK 0x3f000
> +
> +/* xmsicfgaddr/h register fields */
> +#define APLIC_xMSICFGADDR_PPN_SHIFT IMSIC_MMIO_PAGE_SHIFT
> +
> +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw) \
> +    (BIT(hhxw, UL) - 1)
> +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs) \
> +    ((hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
>  
>  #define APLIC_DOMAINCFG         0x0000
>  #define APLIC_SOURCECFG_BASE    0x0004
> @@ -77,6 +89,15 @@
>  #define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
>                                   APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
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
>  struct aplic_regs {
>      uint32_t domaincfg;         /* 0x0000 */
>      uint32_t sourcecfg[1023];   /* 0x0004 */
> @@ -120,4 +141,7 @@ struct aplic_regs {
>      uint32_t target[1023];      /* 0x3008 */
>  };
>  
> +uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask);
> +void aplic_hw_write_reg(unsigned int offset, uint32_t value);
> +
>  #endif /* ASM_RISCV_APLIC_H */
> diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
> index e1ec3d03c4..612f503b57 100644
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
> +
>      /* Bits representing Guest index, HART index, and Group index */
>      unsigned int guest_index_bits;
>      unsigned int hart_index_bits;
> diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
> index 96080bfbc2..7bf9247f4e 100644
> --- a/xen/arch/riscv/include/asm/vaplic.h
> +++ b/xen/arch/riscv/include/asm/vaplic.h
> @@ -26,6 +26,9 @@ struct vaplic_regs {
>  struct vaplic {
>      struct vintc vintc;
>      struct vaplic_regs regs;
> +
> +    paddr_t regs_start;
> +    unsigned int regs_size;
>  };
>  
>  int domain_vaplic_init(struct domain *d);
> diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
> index b07b4aa4d3..a09a720d68 100644
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
> +
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
> +
> +        return 0U;
> +    }
> +
> +    return (uint32_t)(d->arch.vintc->used_irqs[first_bit / BITS_PER_LONG] >>
> +                      (first_bit % BITS_PER_LONG));
> +}
> +
> +static int cf_check vaplic_emulate_load(const struct vcpu *v,


> +                                        const unsigned long addr,
> +                                        uint32_t *out)
> +{
> +    const struct domain *d = v->domain;
> +    const struct vaplic *vaplic = to_vaplic(d);
> +    const unsigned int offset = addr & APLIC_REG_OFFSET_MASK;


> +    uint32_t auth_mask;
> +    unsigned int i;
> +
> +    switch ( offset )
> +    {
> +    case APLIC_DOMAINCFG:
> +        *out = vaplic->regs.domaincfg;
> +
> +        return 0;
> +
> +    case APLIC_SETIPNUM:
> +    case APLIC_SETIPNUM_LE:
> +    case APLIC_CLRIPNUM:
> +    case APLIC_SETIENUM:
> +    case APLIC_CLRIENUM:
> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
> +        /*
> +         * Based on the RISC-V AIA spec a read of these registers
> +         * always returns zero
> +         */
> +        *out = 0;
> +
> +        return 0;
> +
> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
> +        i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
> +        auth_mask = generate_auth_mask(d, i);
> +
> +        break;
> +
> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
> +        /*
> +         * As target registers start from 1:
> +         *  0x3000 genmsi
> +         *  0x3004 target[1]
> +         *  0x3008 target[2]
> +         *   ...
> +         *  0x3FFC target[1023]
> +         * It is necessary to calculate an interrupt number by subtracting
> +         * APLIC_GENMSI instead of APLIC_TARGET_BASE.
> +         */
> +        i = regoffset_to_word_idx(offset - APLIC_GENMSI);
> +
> +        if ( !AUTH_IRQ_BIT(d, i) )
> +        {
> +            *out = 0;
> +
> +            return 0;
> +        }
> +
> +        auth_mask = ~0U;
> +
> +        break;
> +
> +    default:
> +        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
> +                 offset);
> +
> +        return -EINVAL;
> +    }
> +
> +    *out = aplic_hw_read_reg(offset, auth_mask);

I think there is a problem here for the target registers: a read does not
return what the guest wrote.

Consider domU calling request_irq() for source 10, with the interrupt
affinity to vCPU1:

      writel(0x0004000A, GUEST_APLIC_BASE + 0x3028)
      /* hart_idx = 1 (vCPU1), guest_idx = 0, EIID = 10 */

vaplic_emulate_store() passes this through aplic_msi_target_gen(), which
keeps only the EIID and substitutes the physical hart field and the
vCPU's guest interrupt file index, so we write target[10] = 0x001C100A

Therefore, a readl() of the same address returns that raw value (0x001C100A) instead of 0x0004000A, since
auth_mask is ~0U here.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

