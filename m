Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67328CC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:07:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448143.1664200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGf1q-0006fg-4O; Tue, 13 Oct 2026 16:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448143.1664200; Tue, 13 Oct 2026 16:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGf1q-0006fZ-1M; Tue, 13 Oct 2026 16:07:02 +0000
Received: by outflank-mailman (input) for mailman id 1448143;
 Tue, 13 Oct 2026 16:07:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGf1n-0006fT-Sx
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:07:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGf1n-001lgY-2O
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:06:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ace571f-2eae-0a2a0a5409dd-0a2a4506c378-12
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:06:59 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ace5721-195a-0a2a45060019-d1558030a99d-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:06:57 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49e73611928so32791145e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:06:57 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs376946.centertel.pl. [37.47.103.179])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf3e044sm360372855e9.14.2026.10.13.09.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 09:06:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791907617; x=1792512417; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X8Bt47MDCPiiwpSOAjVfijshONvTSqNNKyc8YgzblPo=;
        b=hSmJcqw/lzj6hYlQLtQ3h4JKaOHBirwXb7zdYoirWMt0spqk6Hp6fYOGtDlL7qb6gm
         zB/ns33b51Cxwpml1iWt8AkIL4Wj5YlxVTTKDOTezTSoKtVKoYUaPR6j5CjkGu3BuH86
         dTGt4yWMKEFCKi+GBcnF2Cl2OTHFMFMXudvVSM6/arBLqJGAHGStDrkOKHEUZV2smVgI
         s1V6LE8D1y+XpJETyjA3xgVeFsGtPolDLrlSCx2RvXt+BcNrf0x0PdV25u4XCRfbHlZU
         5jh0W9DkWlF+VFHY1/K/sA1ViMOWYG+fsBwhEweQUej9SJDR0xjxGeDeOr/Knjo7F2rK
         liMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907617; x=1792512417;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8Bt47MDCPiiwpSOAjVfijshONvTSqNNKyc8YgzblPo=;
        b=aYTipIwClp8KTcgm5micWFCZqBLjnqn5OIe3CVRkofuid/j+2wgsURNd0sA/3TcVEf
         qu9sveoJ7F9XkPubHJBzFa+R3xfVRGFmnghrt2TIIlVoGHwytOz9zYYwSninmprcAGZy
         40VuioARSeBmM5uCSvxPMpbbvkU0iH/SLsPBuj7USPN1p9ZG37OJGuEfXY7KS8k0DnyU
         xdxftgRm3OSJURkhqsdKBPLYUm9XeJc86U/gkA0Y2XfiY1z65sZP6rHYriqGlqvhh/7f
         bxQ9Xo1i6SYx62JQJvKNpuYv+lU+qXJnkKEjQOL5a6335RVLlEOCtj4m4htHjsP/Tuz+
         am1Q==
X-Gm-Message-State: AFq9FYKhdec+1eOKMsy0aCpOIJ5wCdm+2ojjWW9/JFgyjfmGcHHKWods
	1cGuzrmJLCUr7pdyxSPQVwZLfnB41nli9nYwK7hs7O6TfcpA6LG93VcR
X-Gm-Gg: AYBFou39+fIyPLod2n2m2BslogakEbCEsKpGXCF5BSx5BqJP9y5a52zWy7An7M49gaR
	V4Qc5WxaHD7tvryV4meiO5cPd/RLgCq5/HDcwFcSJmn1q26llIcBstvoy1jQW+Tm8sIxVEPwS0o
	l/+gj4cEaipfIYTx/YQixxDdkSyh2mN/9OFW2dZtl1uCC5AP6B/vCAen0+yV8w0muN9+ITpHvGm
	SzbIIG1wmkRpVo2KysQzqrwnEnR0q10twhccUz3JBYiKIbfHHepBGr+3vopqTz78NAneyzJZIG4
	xGIVPcmaRTbE2sCsQx5rGBLfXHYUuDPVXKpkgKInacChLejeLCehGy6sEuTxlKQGZZpgwabouB2
	08wiZm0u4JY6cA65rXOHrjj1t+V5Gp/SElg3/CnoWUnve3dCC6NqACIFAQ+WmJyBf8qyY51uDuW
	h0oNlu4nZsc1SizWXPxpScE6uDyGL+T8OhNlr/NFvwjHCaTzps0C1zNw2r9+kN9fJpRMeb3/ETL
	Z1OIFL9091BbzBKkJ3g3NZFUUXsrrULxdvD2ULz
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a18e4b1311mr245828605e9.17.1791907616965;
        Tue, 13 Oct 2026 09:06:56 -0700 (PDT)
Message-ID: <c645f0b5-62f7-465c-9518-226cbd124bac@gmail.com>
Date: Tue, 13 Oct 2026 18:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 08/39] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bd546cae116c93c88706b49e7c24a125b4e5237c.1790779209.git.oleksii.kurochko@gmail.com>
 <1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e58370003f66@vates.tech>
Content-Language: en-US
In-Reply-To: <1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e58370003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791907618-F4E0677B-80014A46/10/73395122804
X-purgate-type: spam
X-purgate-size: 32646



On 10/5/26 4:53 PM, Baptiste Le Duc wrote:
>> Guests running under Xen program interrupt routing by writing to APLIC
>> MMIO registers. Xen must intercept these accesses to enforce interrupt
>> isolation between domains and to translate guest routing intent into the
>> underlying physical MSI topology.
>>
>> Register the vAPLIC range with the MMIO dispatch and emulate the accesses:
>>   - reads and writes are masked with the domain's authorised interrupt
>>     bitmap, so that a guest can neither observe nor affect interrupts it
>>     does not own;
>>   - target registers are shadowed per source, so that a guest reads back
>>     what it wrote. The h/w register instead gets the hart index and guest
>>     interrupt file of the pCPU the target vCPU's interrupt file lives on,
>>     as the APLIC uses these fields directly to compute the MSI address. As
>>     long as the target vCPU has no h/w guest interrupt file, only the
>>     shadow copy is updated;
>>   - only MSI delivery mode is emulated: target writes made while the
>>     guest's domaincfg.DM is clear are ignored.
>>
>> Delegation (APLIC_SOURCECFG_D) is not yet supported.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Co-developed-by: needs a matching Signed-off-by: from Romain right after
> it.

I will contact Romain and ask for his Signed-off-by.

[...]

>> --- a/xen/arch/riscv/aplic-priv.h
>> +++ b/xen/arch/riscv/aplic-priv.h
>> @@ -47,4 +47,6 @@ struct aplic_priv {
>>    */
>>   extern unsigned int guest_aplic_num_sources;
>>   
>> +uint32_t aplic_msi_target_gen(const struct vcpu *v, uint32_t base_val);
>> +
>>   #endif /* ASM_RISCV_APLIC_PRIV_H */
>> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
>> index 17c96177a3..febc451760 100644
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -16,6 +16,7 @@
>>   #include <xen/irq.h>
>>   #include <xen/mm.h>
>>   #include <xen/sections.h>
>> +#include <xen/sched.h>
> Nit: <xen/sched.h> sorts before <xen/sections.h>.

Applied.

> 
>>   #include <xen/spinlock.h>
>>   #include <xen/types.h>
>>   #include <xen/vmap.h>
>> @@ -28,8 +29,6 @@
>>   #include <asm/io.h>
>>   #include <asm/riscv_encoding.h>
>>   
>> -#define APLIC_DEFAULT_PRIORITY  1
>> -
>>   static struct aplic_priv aplic = {
>>       .lock = SPIN_LOCK_UNLOCKED,
>>   };
>> @@ -38,6 +37,137 @@ static struct intc_info __ro_after_init aplic_info = {
>>       .hw_variant = INTC_APLIC,
>>   };
>>   
>> +/*
>> + * The arrangement of IMSIC interrupt files in MMIO space follows a topology
>> + * defined by the RISC-V AIA specification. An IMSIC group is a set of
>> + * interrupt files (e.g., in a cluster or socket) co-located in memory.
>> + *
>> + * The physical address of an outgoing MSI is calculated by bitwise ORing a
>> + * Base Physical Page Number (Base PPN) with the Group Index (g), the Hart
>> + * Index (h) and, for a supervisor-level interrupt domain, the Guest Index:
> Sorry but as I already mentioned before, Hart Index is equal to (g << lhxw) | h
> I think it is a miss as you explained this later correctly ....
> 
> I would propose this:
>      ```
>      * The physical address of an outgoing MSI is calculated by bitwise ORing a
>      * Base Physical Page Number (Base PPN) with the group number (g), the
>      * hart number relative to the group (h) and, for a supervisor-level
>      * interrupt domain, the Guest Index:
>      ```

Hm, I think that probably I applied something incorrectly from your 
prev. suggestion. I will re-apply what you suggested here.



> 
>> + *
>> + *   ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | Guest Index ) << 12
>> + *
>> + * where Base PPN, HHXS, LHXS, HHXW and LHXW come from the {m,s}msiaddrcfg[h]
>> + * registers of the interrupt domain that sends the MSI:
>> + *
>> + * XLEN-1       HHXS+24          LHXS+12          12          0
>> + * |            |                |                |           |
>> + * ------------------------------------------------------------
>> + * |xxxx|   g   |xxxxxxxx|   h   |xxxx|Guest Index|     0     |
>> + * ------------------------------------------------------------
>> + *
>> + * - g: group number.
>> + * - h: hart number relative to the group.
> ... here
>> + * - xxxx: remaining Base PPN bits; each gap may be zero-width.
>> + * - Guest Index: selects one of the 4 KiB pages right above the hart's own
>> + *   supervisor-level file, i.e. it starts at bit 12; LHXS must therefore be
>> + *   at least as large as the number of guest index bits.
>> + * - Bits 11:0: always zero because IMSIC files are 4 KiB page-aligned.
>> + *
>> + * For wired interrupts in MSI delivery mode (domaincfg.DM = 1), the APLIC
>> + * computes the MSI target address itself from the "Hart Index" field
>> + * (bits 31:18) of the corresponding target[i] register. This 14-bit field
>> + * holds both g and h:
>> + *
>> + * 13          lhxw+hhxw   lhxw       0
>> + * |           |           |          |
>> + * ------------------------------------
>> + * |     0     |     g     |    h     |
>> + * ------------------------------------
>> + *
>> + * - lhxw (Low Hart Index Width): the number of bits used for the hart number
>> + *   within a group.
>> + * - hhxw (High Hart Index Width): the number of bits used for the group
>> + *   number; the remaining bits of the field must be zero.
>> + *
>> + * The Guest Index isn't a part of it: for a supervisor-level interrupt domain
>> + * it has its own field (bits 17:12) in target[i].
>> + *
>> + * Because there are "xxxx" gaps (Base PPN bits) between the indices in the
>> + * physical address (depending on HHXS and LHXS), software must extract the
>> + * group and hart components separately and pack them into the APLIC-defined
>> + * Hart Index format to ensure correct MSI targeting.
>> + */
>> +static unsigned long aplic_hart_index(unsigned int cpu)
>> +{
>> +    const struct imsic_config *imsic = imsic_get_config();
>> +    const struct imsic_msi *msi = &imsic->msi[cpu];
>> +    /* Low Hart Index Shift */
>> +    unsigned int lhxs = imsic->guest_index_bits;
>> +    /* Low Hart Index Width */
>> +    unsigned int lhxw = imsic->hart_index_bits;
>> +    /* High Hart Index Width */
>> +    unsigned int hhxw = imsic->group_index_bits;
>> +    /* High Hart Index Shift */
>> +    unsigned int hhxs =
>> +        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
>> +    /*
>> +     * msi->base_addr is the base of the MMIO regset this CPU's interrupt
>> +     * files live in, and one regset can cover several harts; msi->offset
>> +     * selects this CPU's block inside it. The hart index bits are part of
>> +     * that offset, so both indexes have to be derived from the full address.
>> +     */
>> +    paddr_t target_addr = msi->base_addr + msi->offset;
>> +    unsigned long tppn = target_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
>> +    unsigned long g =
>> +        (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
>> +        APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
>> +    unsigned long h =
>> +        (tppn >> APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs)) &
>> +        APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
>> +
>> +    return (g << lhxw) | h;
>> +}
>> +uint32_t aplic_hw_read_reg(unsigned int offset)
>> +{
>> +    unsigned long flags;
>> +    uint32_t val;
>> +
>> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
> Nit: the parentheses around offset < aplic.size aren't needed:
>          ASSERT(offset < aplic.size && IS_ALIGNED(offset, sizeof(uint32_t)));
> 
>> +
>> +    spin_lock_irqsave(&aplic.lock, flags);
>> +    val = readl((const volatile void __iomem *)aplic.regs + offset);
>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> +void aplic_hw_write_reg(unsigned int offset, uint32_t value)
>> +{
>> +    unsigned long flags;
>> +
>> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
> Same here.

So from correctness point of view there is no need for the parentheses 
around offset < aplic.size, I agree with that. Usually in other places 
such parentheses are presented (for stylistic).

Considering your Nit just above do you want me know to remove the 
parentheses? If not, I am okay to keep them.

[...]

>> +/*
>> + * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
>> + * a 32-bit word index into the used_irqs bitmap. Each word covers 32
>> + * interrupt sources. For SOURCECFG and TARGET groups the same division also
>> + * yields the interrupt number directly, because those arrays store one 32-bit
>> + * register per source.
>> + */
>> +#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
>> +
>> +static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
>> +{
>> +    const struct vaplic *vaplic = to_vaplic(d);
>> +
>> +    /* target[0] doesn't exist so irqn == 0 should be impossible */
>> +    if ( !irqn || irqn >= vaplic->vintc.nr_virqs )
>> +        return 0;
>> +
>> +    return read_atomic(&vaplic->regs.sources[irqn].target);
>> +}
>> +
>> +static inline uint32_t generate_auth_mask(const struct domain *currd,
> Nit: inline in a .c file isn't needed, the compiler decides anyway.

Agree, I will drop it.

>> +                                          unsigned int word_idx)
>> +{
>> +    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
>> +
>> +    if ( word_idx >= DIV_ROUND_UP(currd->arch.vintc->nr_virqs,
>> +                                  sizeof(uint32_t) * BITS_PER_BYTE) )
>> +    {
>> +        gdprintk(XENLOG_DEBUG, "incorrect word_idx(%u)\n", word_idx);
>> +
>> +        return 0;
>> +    }
>> +
>> +    return currd->arch.vintc->used_irqs[first_bit / BITS_PER_LONG] >>
>> +           (first_bit % BITS_PER_LONG);
>> +}
>> +
>> +static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
>> +                                uint32_t *out)
>> +{
>> +    const struct domain *currd = curr->domain;
>> +    const struct vaplic *vaplic = to_vaplic(currd);
>> +    const unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;
> 
> With that, every access with addr >= APLIC_CTRL_REGION_OFFSET_MASK
> aliases onto the same control region: e.g. an access to
> GUEST_APLIC_S_BASE + 0x4000 (idelivery of IDC 0) ends up in the
> APLIC_DOMAINCFG case, and a store there rewrites domaincfg.

Good point. From the guest's point of view, accesses from base + 0x4000
up to the end of the region advertised in the DT (at least
base + 0x7fff) are legal. As vAPLIC supports only MSI delivery mode for
now, it has no IDC structures, so generally we shouldn't report to guest 
that it range to guest I think or make it at least read-only zero.

> 
> It also silently relies on GUEST_APLIC_S_BASE being 16 KiB aligned.

Indeed. The spec only requires the control region to be "aligned to a
4-KiB address boundary", so e.g. a base of 0xd001000 would be valid,
but with the mask an access to base + 0 would then be decoded as offset
0x1000 rather than domaincfg.

> 
> The AIA spec ("Memory-mapped control region for an interrupt domain")
> says IDC structures start at 0x4000 and are only needed for direct
> delivery mode, and that all other bytes of the control region are
> reserved and read-only zero, writes to them being ignored. So I'd expect
> something like:
> 
>      const paddr_t offset = addr - vaplic->regs_start;

Agreed, computing the offset by subtraction is better. I think offset
can stay unsigned int, though, as it is always below regs_size, which
is unsigned int itself.

> 
> Then read/write out of control region would go to "default:" case.

I will do read-only zeros instead of default as it is what AIA spec 
suggest to do in such cases.

> and APLIC_CTRL_REGION_OFFSET_MASK could go away.

Agreed, I'll drop it.


> 
>> +    uint32_t auth_mask;
>> +    unsigned int i;
>> +
>> +    ASSERT(curr == current);
>> +
>> +    switch ( offset )
>> +    {
>> +    case APLIC_DOMAINCFG:
>> +        *out = vaplic->regs.domaincfg;
>> +
>> +        return true;
>> +
>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
>> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
>> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
>> +        i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
>> +        auth_mask = generate_auth_mask(currd, i);
>> +
>> +        break;
>> +
>> +    case APLIC_SETIPNUM:
>> +    case APLIC_CLRIPNUM:
>> +    case APLIC_SETIENUM:
>> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
>> +    case APLIC_CLRIENUM:
>> +    case APLIC_SETIPNUM_LE:
>> +        /*
>> +         * Based on the RISC-V AIA spec a read of these registers
>> +         * always returns zero
>> +         */
>> +        *out = 0;
>> +
>> +        return true;
>> +
>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>> +        /*
>> +         * As target registers start from 1:
>> +         *  0x3000 genmsi
>> +         *  0x3004 target[1]
>> +         *  0x3008 target[2]
>> +         *   ...
>> +         *  0x3FFC target[1023]
>> +         * It is necessary to calculate an interrupt number by subtracting
>> +         * APLIC_GENMSI instead of APLIC_TARGET_BASE.
>> +         */
>> +        i = regoffset_to_word_idx(offset - APLIC_GENMSI);
>> +
>> +        *out = AUTH_IRQ_BIT(currd, i) ? vaplic_target_read(currd, i) : 0;
>> +
>> +        return true;
>    genmsi (0x3000) isn't covered by any case, so an access to it ends up
>    in default: and faults while in MSI delivery mode it isn't read-only zero:
>    Hart Index and EIID behave as in a target register, and Busy is
>    read-only. I would suggest to add a dedicated switch case:
>    
>      ```
>      case APLIC_GENMSI:
>          *out = vaplic_is_msi_mode(currd) ? vaplic->regs.genmsi : 0;
> 
>          return true;
>      ```
> With a new helper vaplic_is_msi_mode -> bool that could also be used in
> write counterpart and a new genmsi field in vaplic->regs.
> 
> If we assume the guest will never try to read genmsi then it is okay but
> it might worth to at least mention it somewhere.


It wasn't implemented because there is no user of it in Linux, which,
I agree, isn't a good argument. Also, really injecting an MSI into the
guest requires some extra functionality. I've implemented it for the
s/w interrupt file support, and it could be re-used here.

I am not sure it is a good idea to emulate genmsi the way you suggested 
for now. Take, as an example, Xen's own sync function, which uses genmsi 
as the AIA spec describes for synchronizing a hart with the APLIC:

static void cf_check imsic_aplic_sync(void *unused)
{
     imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);

     aplic_genmsi_barrier();

     while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
         cpu_relax();
}

If a guest did the same, aplic_genmsi_barrier() wouldn't get stuck with
the emulation you suggested, as Busy would always read as zero, but the
guest would then wait forever in:

     while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
         cpu_relax();

because Xen would never inject the MSI into the guest.

So I see two options:
1. Accept for now that a guest trying to use genmsi gets crashed. 
(current behaviour)
2. Introduce genmsi emulation now. It shouldn't be too hard, as almost
    all of the needed functionality already exists in the s/w interrupt
    file support series.

Probably for now it would be fine to go with 1 + some TODO comment:

+    /*
+     * TODO: emulate genmsi. A write to it has to send an extempore MSI to
+     * the target vCPU, and a guest typically waits for that MSI to become
+     * pending in its interrupt file. Just recording the written value 
would
+     * leave such a guest waiting forever, so until genmsi is emulated, an
+     * access to it is treated as an unhandled one, which gets the domain
+     * crashed.
+     */
+    case APLIC_GENMSI:
      default:

But I will check how big will be diff if to introduce genmsi emulation 
now and if it isn't too big I wll introduce emulation now.

>> +    default:
>> +        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
>> +                 offset);
>> +
>> +        return false;
>> +    }
>> +
>> +    *out = aplic_hw_read_reg(offset) & auth_mask;
>> +
>> +    return true;
>> +}
>> +
>> +static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
>> +                                 uint32_t value)
>> +{
>> +    const struct domain *currd = curr->domain;
>> +    unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;
> 
> Same aliasing issue as in vaplic_emulate_load(), here with the write
> going to the aliased register.

Agreed. Will fix that.

> 
>> +
>> +    ASSERT(curr == current);
>> +
>> +    switch ( offset )
>> +    {
>> +    case APLIC_DOMAINCFG:
>> +    {
>> +        struct vaplic *vaplic = to_vaplic(currd);
>> +
>> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
>> +                                 (value & APLIC_DOMAINCFG_WMASK);
> APLIC_DOMAINCFG_WMASK includes DM, so a guest writing DM=0 reads 0 back
> and assumes direct delivery mode is in effect. However, only MSI
> delivery is emulated: there are no IDC structures, and with DM=0 the
> target handling below drops the write, so the guest just stops getting
> interrupts.
> 
> DM is WARL, so an MSI-only APLIC is expected to keep it at 1 whatever
> is written, which is how software figures out that direct mode isn't
> available. Can't we do the same here, as is already done for BE?
> I.e. drop DM from APLIC_DOMAINCFG_WMASK, and OR APLIC_DOMAINCFG_DM in
> here and in domain_vaplic_init(). That would also justify sizing the
> region at APLIC_MIN_SIZE (see my comment on regs_size at the end).

Generally, I agree with your suggestion, and this is how it was done in
earlier versions. I then moved away from it, as I thought that with DM
hardwired to 1 there would be an issue with the following
initialization code in the Linux kernel:

	/* Disable all interrupts */
	for (i = 0; i <= priv->nr_irqs; i += 32)
		writel(-1U, priv->regs + APLIC_CLRIE_BASE + (i / 32) * sizeof(u32));

	/* Set interrupt type and default priority for all interrupts */
	for (i = 1; i <= priv->nr_irqs; i++) {
		writel(0, priv->regs + APLIC_SOURCECFG_BASE + (i - 1) * sizeof(u32));
		writel(APLIC_DEFAULT_PRIORITY,
		       priv->regs + APLIC_TARGET_BASE + (i - 1) * sizeof(u32));
	}

	/* Clear APLIC domaincfg */
	writel(0, priv->regs + APLIC_DOMAINCFG);

Linux doesn't check domaincfg at this point and writes
APLIC_DEFAULT_PRIORITY to the target registers whatever DM is, i.e. in
the direct delivery mode format, although an APLIC supporting MSI
delivery mode only is legal from the spec's point of view (writing 1 to
a target register in MSI delivery mode probably wouldn't hurt, though).
This confused me, so for a while I allowed DM to be 0, with a warning
for a target register written while DM is 0 (missing that such a write
is then ignored).

Looking at it again, the Linux code is fine from h/w point of view: it 
makes source i inactive by writing 0 to sourcecfg[i] right before 
writing target[i], and target[i] is read-only zero while source i is 
inactive, so that write is ignored whatever the delivery mode. Also, I 
have to admit that write to target[i] in such case doesn't make too much 
sense...

So I'll take your suggestions and, in addition, make target[i]
read-only zero while source i is inactive, as the spec requires (vAPLIC
doesn't do that at the moment). That makes the code above safe with DM
hardwired to 1, and is worth having anyway.


>> +
>> +        return true;
>> +    }
>> +
>> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
>> +        /*
>> +         * Only D (bit 10) and SM (bits 2:0) are implemented, the rest of the
>> +         * bits are reserved and read as zero, so ignore what a guest writes
>> +         * to them.
>> +         */
>> +        value &= APLIC_SOURCECFG_WMASK;
>> +
>> +        if ( value & APLIC_SOURCECFG_D )
>> +        {
>> +            gdprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
>> +
>> +            goto fail;
>> +        }
>> +
>> +        /*
>> +         * SM is WARL, so the reserved values 0x2 and 0x3 need no handling
>> +         * here: vAPLIC keeps no shadow copy of sourcecfg[], the value is
>> +         * written straight to the h/w register and is read back from it, so
>> +         * it is the h/w which substitutes a legal value for an illegal one.
>> +         *
>> +         * TODO: when vAPLIC starts to shadow sourcecfg[], the WARL behaviour
>> +         * will have to be emulated here instead, e.g.:
>> +         *   if ( value == 0x2 || value == 0x3 )
>> +         *       value = APLIC_SOURCECFG_SM_INACTIVE;
>> +         */
>> +
>> +        /*
>> +         * As sourcecfg register starts from 1:
>> +         *   0x0000 domaincfg
>> +         *   0x0004 sourcecfg[1]
>> +         *   0x0008 sourcecfg[2]
>> +         *    ...
>> +         *   0x0FFC sourcecfg[1023]
>> +         * It is necessary to calculate an interrupt number by subtracting
>> +         * APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
>> +         */
>> +        if ( !AUTH_IRQ_BIT(currd,
>> +                           regoffset_to_word_idx(offset - APLIC_DOMAINCFG)) )
>> +            /* Interrupt not enabled, ignore it */
>> +            return true;
>> +
>> +        break;
>> +
>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
>> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
>> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
>> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
>> +    {
>> +        unsigned int word_idx =
>> +            regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
>> +
>> +        value &= generate_auth_mask(currd, word_idx);
>> +
>> +        break;
>> +    }
>> +
>> +    case APLIC_SETIPNUM:
>> +    case APLIC_CLRIPNUM:
>> +    case APLIC_SETIENUM:
>> +    case APLIC_CLRIENUM:
>> +    case APLIC_SETIPNUM_LE:
>> +        if ( !value || !AUTH_IRQ_BIT(currd, value) )
>> +            return true;
>> +
>> +        break;
>> +
>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>> +    {
>> +        struct vaplic *vaplic = to_vaplic(currd);
>> +        /*
>> +         * Look at vaplic_emulate_load() for explanation why APLIC_GENMSI is
>> +         * subtracted.
>> +         */
>> +        unsigned int srcn = regoffset_to_word_idx(offset - APLIC_GENMSI);
>> +
>> +        if ( !AUTH_IRQ_BIT(currd, srcn) )
>> +            /* Interrupt not enabled, ignore it */
>> +            return true;
>> +
>> +        if ( vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM )
>> +        {
>> +            struct vaplic_source *src = &vaplic->regs.sources[srcn];
>> +            struct vcpu *target_vcpu;
> target_vcpu is only read, so this can be const struct vcpu *.

Agree, i will do it const.

> 
>> +            unsigned int guest_hart_idx =
>> +                MASK_EXTR(value, APLIC_TARGET_HART_IDX);
>> +            unsigned long flags;
>> +            struct vimsic_state *vimsic_state;
>> +
>> +            target_vcpu = domain_vcpu(currd, guest_hart_idx);
>> +
>> +            if ( !target_vcpu )
>> +            {
>> +                gdprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
>> +
>> +                /* Ignore such writings */
>> +                return true;
>> +            }
>> +
>> +            vimsic_state = target_vcpu->arch.vimsic_state;
>> +
>> +            /*
>> +             * A non-zero guest index asks for delivery to an interrupt file
>> +             * of a nested guest. The vIMSIC node has no riscv,guest-index-bits
>> +             * property, so a guest is told its harts have no guest interrupt
>> +             * files and the field reads as zero for them. Such a write is
>> +             * illegal and is therefore ignored as a whole: the stored copy
>> +             * keeps the zero it was allocated with, so the field never needs
>> +             * to be masked out here.
>> +             * What ends up in the h/w register is Xen's own value anyway:
>> +             * aplic_msi_target_gen() overwrites the field with
>> +             * vcpu_guest_file_id() of the target vCPU.
>> +             */
>> +            if ( MASK_EXTR(value, APLIC_TARGET_GUEST_IDX) )
>> +            {
>> +                printk_once(XENLOG_WARNING
>> +                            "%pd: vAPLIC target guest index != 0 is unsupported\n",
>> +                            currd);
>> +
>> +                return true;
>> +            }
>> +
>> +            /*
>> +             * src->lock keeps the stored copy and the h/w register updated
>> +             * as a pair.
>> +             */
>> +            spin_lock_irqsave(&src->lock, flags);
>> +
>> +            write_atomic(&src->target, value);
>> +
>> +            /* IRQs are already off under src->lock. */
>> +            read_lock(&vimsic_state->vsfile_lock);
>> +
>> +            /*
>> +             * The h/w register names the hart and the guest interrupt file
>> +             * MSIs are sent to, and there is none of either until the target
>> +             * vCPU is given a h/w guest interrupt file. The stored copy
>> +             * reaches the h/w at that point.
>> +             *
>> +             * TODO: once s/w guest interrupt files are supported, a vCPU using
>> +             * one still needs its MSIs, so the h/w register will have to be
>> +             * written for it too, pointing at an interrupt file Xen receives
>> +             * them in on the vCPU's behalf.
>> +             */
>> +            if ( vimsic_state->vsfile_cpu != CPU_NONE )
>> +                aplic_hw_write_reg(offset,
>> +                                   aplic_msi_target_gen(target_vcpu, value));
> 
> The comment above says the stored copy reaches the h/w once the vCPU gets
> a h/w guest interrupt file, but nothing in this patch does that: it only
> happens with vaplic_reconfigure_target(), added by "xen/riscv: introduce
> vaplic_reconfigure_target()" and called from imsic_vsfile_move() by
> "xen/riscv: remap interrupts to new IMSIC VS-file". At this commit a
> target written before the first attach never reaches the h/w.

What about the case domain has 2 vCPU and second vCPU hasn't been 
brought up but a guest decided to use it as a target vCPU then 
domain_vcpu() will return someting not NULL and we will get here with 
h/w file not really attached for now.

Normally it shouldn't happen but technically "bad" guest driver could 
try to do that.

> 
>> +
>> +            read_unlock(&vimsic_state->vsfile_lock);
>> +
>> +            spin_unlock_irqrestore(&src->lock, flags);
>> +
>> +            return true;
>> +        }
>> +
>> +        /* printk_once(), as a guest could otherwise flood the log. */
>> +        printk_once(XENLOG_WARNING
>> +                    "%pd: vAPLIC direct delivery mode isn't supported\n",
>> +                    currd);
>> +
>> +        return true;
>> +    }
>> +
>> +    default:
>> +    fail:
>> +        gdprintk(XENLOG_WARNING,
>> +                 "Unhandled APLIC write at offset %#x (value %#x)\n", offset,
>> +                 value);
> Nit: now that the arguments wrap, put offset on its own line as well.

Will do.

> 
>> +
>> +        return false;
> So in this function you are assuming the guest will never try to write
> genmsi. Is it expected? so a guest accessing it faults. Linux doesn't
> use it today, but the spec defines it in MSI delivery mode. Could it at
> least get an explicit case (reads as zero, writes ignored, with a TODO
> about extempore MSI injection) rather than relying on guests never
> touching it?

As I mentioned above I will do or at least TODO or provide a separate 
patch to emulate it.

> 
>> +    }
>> +
>> +    aplic_hw_write_reg(offset, value);
>> +
>> +    return true;
>> +}
>> +
>>   static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
>>   {
>>       struct domain *d = kinfo->bd.d;
>> @@ -95,6 +403,56 @@ static const struct vintc_init_ops __initconstrel init_ops = {
>>       .make_domu_dt_node = vaplic_make_domu_dt_node,
>>   };
>>   
>> +static enum io_state cf_check vaplic_mmio_read(struct vcpu *v,
>> +                                               mmio_info_t *info)
> 
> Jan asked in v1 to rename the parameter to curr once ASSERT(v ==
> current) is added. Same for vaplic_mmio_write().

Thanks for noticing that, missed that. I will fix that.

> 
>> +{
>> +    uint32_t val;
>> +
>> +    ASSERT(v == current);
>> +
>> +    if ( info->len != sizeof(uint32_t) ||
>> +         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
>> +    {
>> +        gdprintk(XENLOG_DEBUG,
>> +                 "VAPLIC: unaligned/wrong-width read gpa=%"PRIpaddr" len=%u\n",
>> +                 info->gpa, info->len);
>> +        return IO_ABORT;
> Please drop the "VAPLIC:" prefix, gdprintk() already says where the
> message comes from. Also a blank line before the return, as you do
> elsewhere in the file.

Agree, not too much sense in the prefix here. I will drop it.

> 
>> +    }
>> +
>> +    if ( !vaplic_emulate_load(v, info->gpa, &val) )
>> +        return IO_ABORT;
>> +
>> +    /* APLIC registers are 32-bit; zero-extend to the guest register width. */
>> +    info->data = val;
>> +
>> +    return IO_HANDLED;
>> +}
>> +
>> +static enum io_state cf_check vaplic_mmio_write(struct vcpu *v,
>> +                                                const mmio_info_t *info)
>> +{
>> +    ASSERT(v == current);
>> +
>> +    if ( info->len != sizeof(uint32_t) ||
>> +         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
>> +    {
>> +        gdprintk(XENLOG_DEBUG,
>> +                 "VAPLIC: unaligned/wrong-width write gpa=%"PRIpaddr" len=%u\n",
>> +                 info->gpa, info->len);
>> +        return IO_ABORT;
> Same here.
> 
>> +    }
>> +
>> +    if ( !vaplic_emulate_store(v, info->gpa, info->data) )
>> +        return IO_ABORT;
>> +
>> +    return IO_HANDLED;
>> +}
>> +
>> +static const struct mmio_handler_ops vaplic_mmio_ops = {
>> +    .read  = vaplic_mmio_read,
>> +    .write = vaplic_mmio_write,
>> +};
>> +
>>   static const struct vintc_ops vintc_ops = {
>>       .vcpu_init = vcpu_imsic_init,
>>       .vcpu_deinit = vcpu_imsic_deinit,
>> @@ -103,6 +461,8 @@ static const struct vintc_ops vintc_ops = {
>>   int domain_vaplic_init(struct domain *d)
>>   {
>>       struct vaplic *vaplic = xvzalloc(struct vaplic);
>> +    unsigned int i;
>> +    int rc;
>>   
>>       if ( !vaplic )
>>           return -ENOMEM;
>> @@ -123,7 +483,28 @@ int domain_vaplic_init(struct domain *d)
>>        */
>>       d->arch.vintc->nr_virqs = guest_aplic_num_sources + 1;
>>   
>> -    return 0;
>> +    /* Slot 0 is unused: APLIC source numbering starts at 1 (see used_irqs). */
>> +    vaplic->regs.sources = xvzalloc_array(struct vaplic_source,
>> +                                          d->arch.vintc->nr_virqs);
>> +    if ( !vaplic->regs.sources )
>> +    {
>> +        domain_vaplic_deinit(d);
>> +
>> +        return -ENOMEM;
>> +    }
>> +
>> +    for ( i = 0; i < d->arch.vintc->nr_virqs; i++ )
>> +        spin_lock_init(&vaplic->regs.sources[i].lock);
>> +
>> +    vaplic->regs_start = GUEST_APLIC_S_BASE;
>> +    vaplic->regs_size = APLIC_SIZE(d->max_vcpus);
> 
> The vAPLIC only supports MSI delivery (msi-parent → vIMSIC, no direct
> mode emulated), so no IDC structures are needed and APLIC_MIN_SIZE is
> enough. To make that explicit I'll also hardwire domaincfg.DM to 1
> (WARL), so the guest can't select a mode the region doesn't back.
> 

Agree. I think it should be here APLIC_SIZE(0) (with probable renaming 
an arugment of APLIC_SIZE to make things more clear) and in one more 
place and as I confirmed above I think it also make sense to set DM to 1 
always.

Thanks.

~ Oleskii

