Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A33C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:52:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405754.1639207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jVZ-0002QJ-4S; Wed, 02 Sep 2026 11:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405754.1639207; Wed, 02 Sep 2026 11:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jVZ-0002QC-1L; Wed, 02 Sep 2026 11:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1405754;
 Wed, 02 Sep 2026 11:52:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1jVX-0002Om-Ex
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:52:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jVW-003yFK-Rx
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:51:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a061f620c5000c4f3@swg.vates.tech>)
 id 6a980dce-8faa-0a2a0a5109dd-0a2a45048324-40
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:51:58 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a061f620c5000c4f3@swg.vates.tech>)
 id 6a980dde-b57f-0a2a45040019-b9ff1c12b00d-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:51:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a061f620c5000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Sep 2026 11:51:55 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6C04682029;
 Wed,  2 Sep 2026 13:51:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=4Rj/QjRwx9bZQal0N4deeVdgTUJTB5KU1MZwyQkK434=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=i4ZoD8Y6Dtfq6XHUyCy++yXdKZsDC6p3ZTxM2vIqqdOrYYde9GBPoI2oBBSz6dRoRL2BNWQMt
 r4eibkLvXLqZVG1AgI+Hb45EjEGtDHXYnQ+6b9ZPrvpG6BOzpDsS+lCUq/2+ERhfRwEVnQs8QGp
 Rj9FmaPFZcl4W751i67gl/HLNTc+oesGTDsqCNqqVzMtWkzUqK9Uzw1CRQsfFhWmAf+srnk0nyx
 e+1gVqJikRXgzSUsO1XO5SMxOGOqU9szovhe+GiyosG6ReJ5RZEJ4WC5PLiXbJCe/FndT6D9hjG
 X3UoJz/UUYxIRo3ZDYBNSB/838rqYWvIiuTqnSmqcXFQ==
X-Zone-Loop: 0d93d65ffd8a62b4db03ce1c4c61c08cfca768ba6ade
x-campaign-type: default
x-transaction-id: 3170e725-6a0b-442f-bd3b-d269bf997006
x-swg-uid: 01-114702fe-973f-4847-8306-dfe08c47af98
X-Mailer: Sweego
Message-ID:
 <1788349915.8631fc262581453bbf619ec5b2062170.1a061f620c5000c4f3@vates.tech>
x-swg-bid: 1788349915.8631fc262581453bbf619ec5b2062170.1a061f620c5000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
 emulation
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
Date: Wed, 02 Sep 2026 13:51:46 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788349914; l=22568;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=2NAlNX/nlpeYCLz4rfJXvamyJ4ZNBnU39utniyWgylg=;
 b=JmcTXyRw73D7FEedI8S34Lf5dTR3YpYKQP6KauERz3DZdfjCCF2DJUM47MIe5xFdD6JmiCE0n
 i2BqySgxGl4DE5FwmR0PJeqo7T8cx86+nee5AtRpu+KJ/P7l62F5O5X
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788349914662
X-purgate-ID: tlsNG-ebf023/1788349918-C24CBB50-6AE0616A/10/73395122804
X-purgate-type: spam
X-purgate-size: 22568

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
> index 35100d3a64..b3a1f79c5b 100644
> --- a/xen/arch/riscv/aplic-priv.h
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -47,4 +47,7 @@ struct aplic_priv {
>   */
>  extern unsigned int guest_aplic_num_sources;
>  
> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
> +                              uint32_t base_val);
> +
>  #endif /* ASM_RISCV_APLIC_PRIV_H */
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index 3681f0669e..66ba4986a9 100644
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
> @@ -28,8 +29,6 @@
>  #include <asm/io.h>
>  #include <asm/riscv_encoding.h>
>  
> -#define APLIC_DEFAULT_PRIORITY  1
> -
>  static struct aplic_priv aplic = {
>      .lock = SPIN_LOCK_UNLOCKED,
>  };
> @@ -38,6 +37,127 @@ static struct intc_info __ro_after_init aplic_info = {
>      .hw_variant = INTC_APLIC,
>  };
>  
> +/*
> + * The arrangement of IMSIC interrupt files in MMIO space follows a topology
> + * defined by the RISC-V AIA specification. An IMSIC group is a set of
> + * interrupt files (e.g., in a cluster or socket) co-located in memory.
> + *
> + * The physical address of an outgoing MSI is calculated by bitwise ORing a
> + * Base Physical Page Number (Base PPN) with the Group Index (g), the Hart
> + * Index (h) and, for a supervisor-level interrupt domain, the Guest Index:
> + *
> + *   ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | guest ) << 12
Nit: it should be Guest Index (according to the spec) instead of `guest`
wording:
    ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | Guest Index ) << 12
> + *
> + * where Base PPN, HHXS, LHXS, HHXW and LHXW come from the {m,s}msiaddrcfg[h]
> + * registers of the interrupt domain that sends the MSI:
> + *
> + * XLEN-1       HHXS+24          LHXS+12          12          0
> + * |            |                |                |           |
> + * ------------------------------------------------------------
> + * |xxxx|   g   |xxxxxxxx|   h   |xxxx|Guest Index|     0     |
> + * ------------------------------------------------------------
> + *
> + * - g: group number.
> + * - h: hart number relative to the group.
> + * - xxxx: remaining Base PPN bits; each gap may be zero-width.
> + * - Guest Index: selects one of the 4 KiB pages right above the hart's own
> + *   supervisor-level file, i.e. it starts at bit 12; LHXS must therefore be
> + *   at least as large as the number of guest index bits.
> + * - Bits 11:0: always zero because IMSIC files are 4 KiB page-aligned.
> + *
> + * For wired interrupts in MSI delivery mode (domaincfg.DM = 1) the APLIC
> + * builds that address itself from the "Hart Index" field (bits 31:18) of the
> + * corresponding target[i] register. That field holds a hart index *number*,
> + * in which both indices are packed adjacently:
> + *
> + * 13          lhxw+hhxw   lhxw       0
> + * |           |           |          |
> + * ------------------------------------
> + * |     0     |Group Index|Hart Index|
> + * ------------------------------------
> + *
> + * - lhxw (Low Hart Index Width): the number of bits used for the hart number
> + *   within a group.
> + * - hhxw (High Hart Index Width): the number of bits used for the group
> + *   number; the remaining bits of the field must be zero.
>
I think it's not very clear that the schema represents the "Hart Index" field
i.e. target[i] bits 31:18. Moreover, the schema like that is wrong as it is
not Group Index or Hart Index but `g` and `h`.

I'd suggest something like this:

    * For wired interrupts in MSI delivery mode (domaincfg.DM = 1), the APLIC
    * computes the MSI target address itself from the "Hart Index" field
    * (bits 31:18) of the corresponding target[i] register. This 14-bit field
    * holds both g and h:
    *
    * 13          lhxw+hhxw   lhxw       0
    * |           |           |          |
    * ------------------------------------
    * |     0     |     g     |    h     |
    * ------------------------------------
    *
    * - lhxw (Low Hart Index Width): the number of bits used for the hart number
    *   within a group.
    * - hhxw (High Hart Index Width): the number of bits used for the group
    *   number; the remaining bits of the field must be zero.


> + *
> + * The Guest Index isn't a part of it: for a supervisor-level interrupt domain
> + * it has its own field (bits 17:12) in target[i].
> + *
> + * Because there are "xxxx" gaps (Base PPN bits) between the indices in the
> + * physical address (depending on HHXS and LHXS), software must extract the
> + * group and hart components separately and pack them into the APLIC-defined
> + * Hart Index format to ensure correct MSI targeting.
> + */
> +static unsigned long aplic_hart_field(unsigned int cpu)
I should have renamed this to aplic_hart_index() as it's formerly what
the function returns.
> +{
> +    const struct imsic_config *imsic = imsic_get_config();
> +    const struct imsic_msi *msi = &imsic->msi[cpu];
Nit: this could be const ...
> +    /* Low Hart Index Shift */
> +    unsigned int lhxs = imsic->guest_index_bits;
It seems incoherent with the diagram above as there is some xxxx
between Guest Index bits and lhxs + 12. Therefore, it is not that obvious
that lhxs is equal to guest_index_bits.
> +    /* Low Hart Index Width */
> +    unsigned int lhxw = imsic->hart_index_bits;
> +    /* High Hart Index Width */
> +    unsigned int hhxw = imsic->group_index_bits;
> +    /* High Hart Index Shift */
> +    unsigned int hhxs =
> +        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
... 
> +    /*
> +     * msi->base_addr is the base of the MMIO regset this CPU's interrupt
So if I understood correctly, msi->base_addr corresponds to the group
terminology? Is it always the case?
> +     * files live in, and one regset can cover several harts; msi->offset
> +     * selects this CPU's block inside it. The hart index bits are part of
> +     * that offset, so both indexes have to be derived from the full address.
> +     */
> +    paddr_t target_addr = msi->base_addr + msi->offset;
> +    unsigned long tppn = target_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
> +    unsigned long g =
> +        (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
> +        APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
> +    unsigned long h =
> +        (tppn >> APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs)) &
> +        APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
> +
> +    return (g << lhxw) | h;
> +}
> +
> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
> +                              uint32_t base_val)
> +{
> +    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
> +    unsigned long hart_field = aplic_hart_field(target_vcpu->processor);
Nit: could be const
Should be hart_index too, according to previous comment.
> +
> +    base_val &= APLIC_TARGET_EIID;
> +    base_val |= MASK_INSR(guest_id, APLIC_TARGET_GUEST_IDX);
> +    base_val |= MASK_INSR(hart_field, APLIC_TARGET_HART_IDX);
> +
> +    return base_val;
> +}
> +
> +uint32_t aplic_hw_read_reg(unsigned int offset)
> +{
> +    unsigned long flags;
> +    uint32_t val;
> +
> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
> +
> +    spin_lock_irqsave(&aplic.lock, flags);
> +    val = readl((volatile void __iomem *)aplic.regs + offset);
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
> @@ -53,9 +173,9 @@ static void __init aplic_init_hw_interrupts(void)
>          /*
>           * Low bits of target register contains Interrupt Priority bits which
>           * can't be zero according to AIA spec.
> -         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
> +         * Thereby they are initialized to APLIC_TARGET_IPRIO_DEFAULT.
>           */
> -        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i]);
> +        writel(APLIC_TARGET_IPRIO_DEFAULT, &aplic.regs->target[i]);
>      }
>  
>      writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
> diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
> index a2af55d54f..babba38607 100644
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
> @@ -89,6 +96,9 @@
>  #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
>  /* Bit 11 is reserved and reads as zero */
>  #define  APLIC_TARGET_EIID              GENMASK(10, 0)
> +/* If target is in DM mode */
I think this comment is not clear; I expect, by reading it, to have
domaincfg.DM = 1 which is MSI mode, but I think you were talking about
direct delivery mode, right? If so, I would change this comment to

/* If target is in direct delivery mode (domaincfg.DM = 0) */
> +#define  APLIC_TARGET_IPRIO             GENMASK(7, 0)
> +#define   APLIC_TARGET_IPRIO_DEFAULT    1U
>  
>  #define APLIC_IDC_SIZE                  32
>  
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
> +
>  struct aplic_regs {
>      uint32_t domaincfg;         /* 0x0000 */
>      uint32_t sourcecfg[1023];   /* 0x0004 */
> @@ -141,4 +172,7 @@ struct aplic_regs {
>      uint32_t target[1023];      /* 0x3004 */
>  };
>  
> +uint32_t aplic_hw_read_reg(unsigned int offset);
> +void aplic_hw_write_reg(unsigned int offset, uint32_t value);
> +
>  #endif /* ASM_RISCV_APLIC_H */
> diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
> index 2425430ed1..93f9e44c7d 100644
> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -40,6 +40,19 @@ struct imsic_config {
>      /* Base address */
>      paddr_t base_addr;
>  
> +    /*
> +     * MSI Target Address Scheme
> +     *
> +     * XLEN-1       HHXS+24          LHXS+12          12          0
> +     * |            |                |                |           |
> +     * ------------------------------------------------------------
> +     * |xxxx|   g   |xxxxxxxx|   h   |xxxx|Guest Index|     0     |
> +     * ------------------------------------------------------------
> +     * - g: group number.
> +     * - h: hart number relative to the group.
> +     * - xxxx: remaining Base PPN bits; each gap may be zero-width.
> +     */
> +
Is this really needed as you already explain this above in aplic.c?
Please choose one place between the two if not.
>      /* Bits representing Guest index, HART index, and Group index */
>      unsigned int guest_index_bits;
>      unsigned int hart_index_bits;
> diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
> index 96080bfbc2..046c604915 100644
> --- a/xen/arch/riscv/include/asm/vaplic.h
> +++ b/xen/arch/riscv/include/asm/vaplic.h
> @@ -21,11 +21,16 @@ struct domain;
>  
>  struct vaplic_regs {
>      uint32_t domaincfg;
> +
> +    uint32_t *target;
>  };
>  
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
> index 14f6e3164a..8726f7203d 100644
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
> +
> +        return 0;
> +    }
> +
> +    return currd->arch.vintc->used_irqs[first_bit / BITS_PER_LONG] >>
> +           (first_bit % BITS_PER_LONG);
> +}
> +
> +static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
> +                                uint32_t *out)
> +{
> +    const struct domain *currd = curr->domain;
> +    const struct vaplic *vaplic = to_vaplic(currd);
> +    const unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;
> +    uint32_t auth_mask;
> +    unsigned int i;
> +
> +    ASSERT(curr == current);
> +
> +    switch ( offset )
> +    {
> +    case APLIC_DOMAINCFG:
> +        *out = vaplic->regs.domaincfg;
> +
> +        return true;
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
> +        return true;
> +
> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
> +        i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
> +        auth_mask = generate_auth_mask(currd, i);
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
> +        *out = AUTH_IRQ_BIT(currd, i) ? vaplic_target_read(currd, i) : 0;
> +
> +        return true;
> +
> +    default:
> +        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
> +                 offset);
> +
> +        return false;
> +    }
> +
> +    *out = aplic_hw_read_reg(offset) & auth_mask;
> +
> +    return true;
> +}
> +
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
>
Comment above this says "The write isn't rejected ... instead the field
is dropped, which is also what aplic_msi_target_gen() does with it." But
the code doesn't follow it as it returns true immediately here before
the write occurred and without zeroing the guest index field.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

