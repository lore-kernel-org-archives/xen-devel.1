Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D937C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:58:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408344.1640956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SYh-0002dh-2K; Fri, 04 Sep 2026 11:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408344.1640956; Fri, 04 Sep 2026 11:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SYg-0002da-W3; Fri, 04 Sep 2026 11:58:14 +0000
Received: by outflank-mailman (input) for mailman id 1408344;
 Fri, 04 Sep 2026 11:58:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2SYg-0002dI-76
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:58:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2SYf-009eI3-Jh
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:58:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9ab24d-bab6-0a2a0a5309dd-0a2a4509ec98-14
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:58:13 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9ab255-be1a-0a2a45090019-d155dd30ccef-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:58:13 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48584dc164fso870137f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:58:13 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c074asm5693592f8f.23.2026.09.04.04.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 04:58:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523093; x=1789127893; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLRioPwh51wHlSBOpnQVXFjNOS94GBkjggIBfjVcKiI=;
        b=armHqpDmogp8dcui31cbjJ2br/B2DJzBspO9BLUpJuDewCxxik3R75RrO812IVwxn5
         heDRry0gMhc9Q008QNf5pbRprnw7x02Nwmn1cG6f4ggZlKfFvaTwv0n39EFWR9znEe2b
         VrOMdBX/pY2tO4NqZzGN1m0QbCytBnXCZH5EYJdVn7f48rcKufI3gh2/sM4JGFi1IIOY
         IaZuZcIolbBW4zFIx2XFjsJe5CBzyZM5qSR8g3pH161soG6vEUrz1CokI9Wf0JZ9WCEh
         8WtdRwYp5N7jANzS0m6x05/3hYLrQ1QQ6rPMUPfbWH+0VLT2siLjAObLAHdvcDTq7PZg
         NbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523093; x=1789127893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLRioPwh51wHlSBOpnQVXFjNOS94GBkjggIBfjVcKiI=;
        b=gYryd4xSUOQtCF6eVfhC5sXpap2Mg4R3deHTDC0bsNOKSdcjHZ76Ni4goZecKSp229
         t6iHtxPqllD5sPD+750tPLY2UpwcuO8yt9EBG2xpfvWKhjd+Ln+ilUvdNIVi/kpgGLx0
         FaVi4iorPR4yQx+5nSU4aWWqwRl2gj0HowGfvSWtPNlVgfp75Tff28iimOkgkiqQhmds
         kEkyStKSKmHYHEbaDwi37sUHuit648dDTJwYzPIPYHG9sIJh4daUk09NKA4Guedf41bu
         9ogJ7eVYI5u+OVfxxBll45nSO3Y9iL0iq2V0l+wDyD0ex8gsXTlnZYoVPqoHFXLQYaX4
         jqRg==
X-Gm-Message-State: AFuF++mhymhxfxfSAXqiPPa04oWBBjw1j7cYtWjqVcDkyPRnn3wrKMrm
	qOFT5asmWDWE2FCp6mBqoZaTya8EN1Mu1ugjNy6ieQq4PpqO6BF4hfgl
X-Gm-Gg: AYBFou0KDcSgPvDaDrgvpkNmW3+2L1EJ+oZCL8pA7DngL92++sj/4PbzZdNBImatoV7
	EV+Z6KScc1sqpWSqRb/QkDweEhwHWXCFyoAUnh7+AjMT2jKaqosw/X27OrP+/5DCelYEojXbbEV
	OZ83Q6yr1OSqMz8l/u6INiFy4xy0Sq3XMSJfIo+qkKdBYgojq3EgN1144U9Dpybts45bxoBhJyh
	oU+/EXmSkORk7g/h2dImGn9+59WuMcsTQHMLuFw+eLLJgLAfQYhOG9ytS1l+GDf3MCelBRprhEG
	OVKwnCEAieFieGBWYMRHKXgMcN3mMJmOxYuQKPX66mlqmsKbZS0ekiAcZljh9AUMAmjjiSbvlrB
	y9n4IUrZv2lxHkchEbvGMQh6qzWmxE2ors7+jMFMLIrsT5LC8n4OK5KbGUHHO5/lFfu0fA0NvYL
	Fe38fN1sT4FtMXslALv2J9Seu/NYntGO+UJdpCd51xivMOHtu1+KXGFCU8gvXsIU3j0xVcjzdW7
	sJgE+mri8ktOICAr7LEfocPYG7uE9drr66vq0dxMmSN6HIHPw==
X-Received: by 2002:a05:6000:26d0:b0:485:8a46:7056 with SMTP id ffacd0b85a97d-4858a4671a9mr3864421f8f.40.1788523092633;
        Fri, 04 Sep 2026 04:58:12 -0700 (PDT)
Message-ID: <957e4e19-5349-437b-9ec0-ea661292eaf5@gmail.com>
Date: Fri, 4 Sep 2026 13:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
 <1788349915.8631fc262581453bbf619ec5b2062170.1a061f620c5000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788349915.8631fc262581453bbf619ec5b2062170.1a061f620c5000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788523093-3BCD7034-069304B3/10/73395122804
X-purgate-type: spam
X-purgate-size: 18406



On 9/2/26 1:51 PM, Baptiste Le Duc wrote:
>>   
>> +/*
>> + * The arrangement of IMSIC interrupt files in MMIO space follows a topology
>> + * defined by the RISC-V AIA specification. An IMSIC group is a set of
>> + * interrupt files (e.g., in a cluster or socket) co-located in memory.
>> + *
>> + * The physical address of an outgoing MSI is calculated by bitwise ORing a
>> + * Base Physical Page Number (Base PPN) with the Group Index (g), the Hart
>> + * Index (h) and, for a supervisor-level interrupt domain, the Guest Index:
>> + *
>> + *   ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | guest ) << 12
> Nit: it should be Guest Index (according to the spec) instead of `guest`
> wording:
>      ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | Guest Index ) << 12

Applied.

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
>> + * - xxxx: remaining Base PPN bits; each gap may be zero-width.
>> + * - Guest Index: selects one of the 4 KiB pages right above the hart's own
>> + *   supervisor-level file, i.e. it starts at bit 12; LHXS must therefore be
>> + *   at least as large as the number of guest index bits.
>> + * - Bits 11:0: always zero because IMSIC files are 4 KiB page-aligned.
>> + *
>> + * For wired interrupts in MSI delivery mode (domaincfg.DM = 1) the APLIC
>> + * builds that address itself from the "Hart Index" field (bits 31:18) of the
>> + * corresponding target[i] register. That field holds a hart index *number*,
>> + * in which both indices are packed adjacently:
>> + *
>> + * 13          lhxw+hhxw   lhxw       0
>> + * |           |           |          |
>> + * ------------------------------------
>> + * |     0     |Group Index|Hart Index|
>> + * ------------------------------------
>> + *
>> + * - lhxw (Low Hart Index Width): the number of bits used for the hart number
>> + *   within a group.
>> + * - hhxw (High Hart Index Width): the number of bits used for the group
>> + *   number; the remaining bits of the field must be zero.
>>
> I think it's not very clear that the schema represents the "Hart Index" field
> i.e. target[i] bits 31:18. Moreover, the schema like that is wrong as it is
> not Group Index or Hart Index but `g` and `h`.
> 
> I'd suggest something like this:
> 
>      * For wired interrupts in MSI delivery mode (domaincfg.DM = 1), the APLIC
>      * computes the MSI target address itself from the "Hart Index" field
>      * (bits 31:18) of the corresponding target[i] register. This 14-bit field
>      * holds both g and h:
>      *
>      * 13          lhxw+hhxw   lhxw       0
>      * |           |           |          |
>      * ------------------------------------
>      * |     0     |     g     |    h     |
>      * ------------------------------------
>      *
>      * - lhxw (Low Hart Index Width): the number of bits used for the hart number
>      *   within a group.
>      * - hhxw (High Hart Index Width): the number of bits used for the group
>      *   number; the remaining bits of the field must be zero.

Applied.

> 
>> + *
>> + * The Guest Index isn't a part of it: for a supervisor-level interrupt domain
>> + * it has its own field (bits 17:12) in target[i].
>> + *
>> + * Because there are "xxxx" gaps (Base PPN bits) between the indices in the
>> + * physical address (depending on HHXS and LHXS), software must extract the
>> + * group and hart components separately and pack them into the APLIC-defined
>> + * Hart Index format to ensure correct MSI targeting.
>> + */
>> +static unsigned long aplic_hart_field(unsigned int cpu)
> I should have renamed this to aplic_hart_index() as it's formerly what
> the function returns.

Applied.

>> +{
>> +    const struct imsic_config *imsic = imsic_get_config();
>> +    const struct imsic_msi *msi = &imsic->msi[cpu];
> Nit: this could be const ...

Sorry, I am not understand what do you expect from me to do with 'const' 
here. At the moment we don't chnage anything in this function connected 
to msi variable, just a reading.

>> +    /* Low Hart Index Shift */
>> +    unsigned int lhxs = imsic->guest_index_bits;
> It seems incoherent with the diagram above as there is some xxxx
> between Guest Index bits and lhxs + 12. Therefore, it is not that obvious
> that lhxs is equal to guest_index_bits.
>> +    /* Low Hart Index Width */
>> +    unsigned int lhxw = imsic->hart_index_bits;
>> +    /* High Hart Index Width */
>> +    unsigned int hhxw = imsic->group_index_bits;
>> +    /* High Hart Index Shift */
>> +    unsigned int hhxs =
>> +        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
> ...
>> +    /*
>> +     * msi->base_addr is the base of the MMIO regset this CPU's interrupt
> So if I understood correctly, msi->base_addr corresponds to the group
> terminology? Is it always the case?

I think - yes. This value is taken from DTS which and is used to 
describe IMSIC group.

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
>> +
>> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
>> +                              uint32_t base_val)
>> +{
>> +    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
>> +    unsigned long hart_field = aplic_hart_field(target_vcpu->processor);
> Nit: could be const

Techically I agree. Then for guest_id it should const too, right?

But it seems like Xen in such cases don't use const. Have you found a 
rule that we have to use const in such cases?

I don't mind to put const here but then it would be nice if someone will 
tell me some kind of rule...

> Should be hart_index too, according to previous comment.

Applied.
>> +
>> +    base_val &= APLIC_TARGET_EIID;
>> +    base_val |= MASK_INSR(guest_id, APLIC_TARGET_GUEST_IDX);
>> +    base_val |= MASK_INSR(hart_field, APLIC_TARGET_HART_IDX);
>> +
>> +    return base_val;
>> +}
>> +
>> +uint32_t aplic_hw_read_reg(unsigned int offset)
>> +{
>> +    unsigned long flags;
>> +    uint32_t val;
>> +
>> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
>> +
>> +    spin_lock_irqsave(&aplic.lock, flags);
>> +    val = readl((volatile void __iomem *)aplic.regs + offset);
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
>> +
>> +    spin_lock_irqsave(&aplic.lock, flags);
>> +    writel(value, (volatile void __iomem *)aplic.regs + offset);
>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>> +}
>> +
>>   static void __init aplic_init_hw_interrupts(void)
>>   {
>>       unsigned int i;
>> @@ -53,9 +173,9 @@ static void __init aplic_init_hw_interrupts(void)
>>           /*
>>            * Low bits of target register contains Interrupt Priority bits which
>>            * can't be zero according to AIA spec.
>> -         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
>> +         * Thereby they are initialized to APLIC_TARGET_IPRIO_DEFAULT.
>>            */
>> -        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i]);
>> +        writel(APLIC_TARGET_IPRIO_DEFAULT, &aplic.regs->target[i]);
>>       }
>>   
>>       writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
>> diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
>> index a2af55d54f..babba38607 100644
>> --- a/xen/arch/riscv/include/asm/aplic.h
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -39,6 +39,13 @@
>>   #define  APLIC_DOMAINCFG_IE             BIT(8, U)
>>   #define  APLIC_DOMAINCFG_DM             BIT(2, U)
>>   #define  APLIC_DOMAINCFG_BE             BIT(0, U)
>> +/*
>> + * The bits a write may change. Everything else, including the read-only zero
>> + * bit 7 and the reserved bits, has to read back as zero, and BE is WARL and
>> + * hardwired to 0 as Xen is little-endian only.
>> + */
>> +#define  APLIC_DOMAINCFG_WMASK          (APLIC_DOMAINCFG_IE | \
>> +                                         APLIC_DOMAINCFG_DM)
>>   
>>   #define APLIC_SOURCECFG_BASE            0x0004
>>   #define APLIC_SOURCECFG_LAST            0x0ffc
>> @@ -89,6 +96,9 @@
>>   #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
>>   /* Bit 11 is reserved and reads as zero */
>>   #define  APLIC_TARGET_EIID              GENMASK(10, 0)
>> +/* If target is in DM mode */
> I think this comment is not clear; I expect, by reading it, to have
> domaincfg.DM = 1 which is MSI mode, but I think you were talking about
> direct delivery mode, right? If so, I would change this comment to
> 
> /* If target is in direct delivery mode (domaincfg.DM = 0) */

Yes, my comment is incorrect, it should be yours. Applied.

>> +#define  APLIC_TARGET_IPRIO             GENMASK(7, 0)
>> +#define   APLIC_TARGET_IPRIO_DEFAULT    1U
>>   
>>   #define APLIC_IDC_SIZE                  32
>>   
>> @@ -98,6 +108,27 @@
>>   #define APLIC_SIZE(nr_cpus) \
>>       (APLIC_MIN_SIZE + APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
>>   
>> +/*
>> + * Using setip is fine here, as all SET* and CLR* register groups consist of 32
>> + * registers and therefore have identical sizes.
>> + *
>> + * Lowest 2 bits are always zero for SET* and CLR* registers.
>> + */
>> +#define APLIC_SETCLR_OFFSET_MASK \
>> +    (sizeof_field(struct aplic_regs, setip) - sizeof(uint32_t))
>> +
>> +#define APLIC_xMSICFGADDR_PPN_SHIFT IMSIC_MMIO_PAGE_SHIFT
>> +
>> +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw) \
>> +    (BIT(hhxw, UL) - 1)
>> +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs) \
>> +    ((hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
>> +
>> +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw) \
>> +    (BIT(lhxw, UL) - 1)
>> +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs) \
>> +    (lhxs)
>> +
>>   struct aplic_regs {
>>       uint32_t domaincfg;         /* 0x0000 */
>>       uint32_t sourcecfg[1023];   /* 0x0004 */
>> @@ -141,4 +172,7 @@ struct aplic_regs {
>>       uint32_t target[1023];      /* 0x3004 */
>>   };
>>   
>> +uint32_t aplic_hw_read_reg(unsigned int offset);
>> +void aplic_hw_write_reg(unsigned int offset, uint32_t value);
>> +
>>   #endif /* ASM_RISCV_APLIC_H */
>> diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
>> index 2425430ed1..93f9e44c7d 100644
>> --- a/xen/arch/riscv/include/asm/imsic.h
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -40,6 +40,19 @@ struct imsic_config {
>>       /* Base address */
>>       paddr_t base_addr;
>>   
>> +    /*
>> +     * MSI Target Address Scheme
>> +     *
>> +     * XLEN-1       HHXS+24          LHXS+12          12          0
>> +     * |            |                |                |           |
>> +     * ------------------------------------------------------------
>> +     * |xxxx|   g   |xxxxxxxx|   h   |xxxx|Guest Index|     0     |
>> +     * ------------------------------------------------------------
>> +     * - g: group number.
>> +     * - h: hart number relative to the group.
>> +     * - xxxx: remaining Base PPN bits; each gap may be zero-width.
>> +     */
>> +
> Is this really needed as you already explain this above in aplic.c?
> Please choose one place between the two if not.

No, I don't think so. For me, it is also enough to have in one place. I 
will drop it here and keep only in aplic.c.

[...]
>> +
>> +static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
>> +                                 uint32_t value)
>> +{
>> +    const struct domain *currd = curr->domain;
>> +    unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;
>> +
>> +    ASSERT(curr == current);
>> +
>> +    switch ( offset )
>> +    {
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
>> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
>> +        if ( value & APLIC_SOURCECFG_D )
>> +        {
>> +            dprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
>> +
>> +            goto fail;
>> +        }
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
>> +        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
>> +        {
>> +            gdprintk(XENLOG_ERR,
>> +                     "value(%#x) is incorrect for sourcecfg register\n",
>> +                     value);
>> +
>> +            return true;
>> +        }
>> +
>> +        break;
>> +
>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>> +    {
>> +        struct vaplic *vaplic = to_vaplic(currd);
>> +        struct vcpu *target_vcpu;
>> +        unsigned int guest_hart_idx = MASK_EXTR(value, APLIC_TARGET_HART_IDX);
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
>> +        target_vcpu = domain_vcpu(currd, guest_hart_idx);
>> +
>> +        if ( !target_vcpu )
>> +        {
>> +            dprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
>> +
>> +            /* Ignore such writings */
>> +            return true;
>> +        }
>> +
>> +        if ( vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM )
>> +        {
>> +            /*
>> +             * A non-zero guest index asks for delivery to an interrupt file of
>> +             * nested guest. The vIMSIC node has no riscv,guest-index-bits
>> +             * property, so a guest is told its harts have no guest interrupt
>> +             * files and the field is read-only zero for them. The write isn't
>> +             * rejected (that would throw away a valid hart index and EIID);
>> +             * instead the field is dropped, which is also what
>> +             * aplic_msi_target_gen() does with it when programming the h/w.
>> +             */
>> +            if ( MASK_EXTR(value, APLIC_TARGET_GUEST_IDX) )
>> +            {
>> +                printk_once(XENLOG_WARNING
>> +                            "%pd: vAPLIC target guest index != 0 is unsupported\n",
>> +                            currd);
>> +
>> +                /* Ignore such writes ... */
>> +                return true;
>> +            }
>>
> Comment above this says "The write isn't rejected ... instead the field
> is dropped, which is also what aplic_msi_target_gen() does with it." But
> the code doesn't follow it as it returns true immediately here before
> the write occurred and without zeroing the guest index field.
> 

You're right that the comment doesn't match the code, but the fix is in 
the comment rather than in the code. vaplic->regs.target[] comes from 
xvzalloc_array(), so the guest index field starts as zero, and every 
write carrying a non-zero guest index is rejected here, the field can 
therefore never become non-zero and there is nothing to mask out. 
Rejecting the whole write is deliberate: a non-zero guest index is 
illegal for a guest whose vIMSIC advertises no guest interrupt files.

The second half of the comment was wrong too: aplic_msi_target_gen() 
doesn't drop the field, it overwrites it with vcpu_guest_file_id() of 
the target vCPU, which is non-zero when that vCPU owns a h/w VS-file. 
I'll reword the comment in v3 accordingly:

/*
* A non-zero guest index asks for delivery to an interrupt file
* of a nested guest. The vIMSIC node has no riscv,guest-index-bits
* property, so a guest is told its harts have no guest interrupt
* files and the field reads as zero for them. Such a write is
* illegal and is therefore ignored as a whole: the stored copy
* keeps the zero it was allocated with, so the field never needs
* to be masked out here.
* What ends up in the h/w register is Xen's own value anyway:
* aplic_msi_target_gen() overwrites the field with
* vcpu_guest_file_id() of the target vCPU.
*/

Are you okay with that?

Thanks!

~ Oleksii


