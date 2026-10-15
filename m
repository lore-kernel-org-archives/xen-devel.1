Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58948CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 14:57:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450756.1666173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHMtK-0004Td-MU; Thu, 15 Oct 2026 14:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450756.1666173; Thu, 15 Oct 2026 14:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHMtK-0004TW-IH; Thu, 15 Oct 2026 14:57:10 +0000
Received: by outflank-mailman (input) for mailman id 1450756;
 Thu, 15 Oct 2026 14:57:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHMtJ-0004TP-EN
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 14:57:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHMtI-00G4IH-RN
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 16:57:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad0e9c4-e002-0a2a0a5209dd-0a2a4508c548-2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 16:57:08 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad0e9c4-f659-0a2a45080019-d155da29c92d-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 16:57:08 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c3f8d72d7ceso106882966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 07:57:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c3eda61fb26sm137336066b.69.2026.10.15.07.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 07:57:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792076228; x=1792681028; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IyUTAzmyclIG5Mnn77AVzYUDG8mdFz2EGhUHHeev15Q=;
        b=XV5HHLW3l36oCZk6KxiIzW5SPFtmiFLtunp+d5gIIla+24z9MTwoWf1dze4AbQdrDI
         GiEZc0UxDRVlEiymHzgs6N5eIShZ5QMMcA509l01pqmwumI+3keoKVdqoAPDY+MIlo77
         n6Aw+NDF0QSqtgZb07/7mHBMUtoeAYgCFn5Ow72i3NOdJTXTCSsIhhWitAaXx8oNTUFe
         fVjnGdiUkuTnf/1ysxyqesRTQ8UJRt7BNucwfCehl72AZg3MLQ/SxqrwVITdywWxXV9U
         1Dv/9wD79KPm3cezAfFIxnRVHiD6KvzSQLLZkIiC6SSrSzQKOuyYiKFYXKsusOZYZnP+
         viQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076228; x=1792681028;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyUTAzmyclIG5Mnn77AVzYUDG8mdFz2EGhUHHeev15Q=;
        b=D830CYxedgHhjqXvR5C5b92TE/27Tfo+qJgGFx67Y5GzgHatiTudOFfI92+PkVwpYd
         62JFvrUMZDyS77s5bZe1H19hZOxn2NFerAXyPlUVIxZ+UAIsoiP+rZIwf1feTTSwcRyY
         saxsAdcuzoua8GLFvilJVxg1S1nSHy4uBUc215M6ISYyva/JAiYOLbtnVtAjKMe3FVyj
         2Y19S+MV0tVVhlZv0RvazUVGk8Xi9OQziYx7V4EnrYPrNbVV7lj1Z1biHXq83N4uzk38
         OaAL7ua1M5ocDAH8zZIE8RmLzVXYlN34lUOAfDEcxPfVWSkSOwy0UDwqNTLc+y95iEGw
         c6bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzshutTRmqnTE9B7SWb/+5J881IhG0K7q6tT6eUEJpSVd45772mL3X5BGOeqKd2GQTgroM6DmaABpw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ6uiw3aeSxCUdQjAXREUvg4jhvHIeM7RJeqJmCoaDLdqadmW4z
	9cpz1G+T4Z2AO01Zr1OL1AO3e+RJh9Al2wTL/c8sus6ZKcz7zgLUsesO
X-Gm-Gg: AYBFou1GshNTqyXm1YW3H7BZToaV06ZWmNTg1z3W8uz1r4HO2wfiVOi2cxfAP9ce69C
	rtv3zOgv+UgShjug4JieqSUWwCCtaftT2aC1/PgbSIWHIPe3AqQYX2BEgHLSRvD5IiyCLwtl46Q
	nW8wzTeMLD6tCp84eHO+4rF91yifWo2s+jNv1LlyOgPmV9Loz9djFfQj+KCVwCtUaH2UW1WcmoX
	eBWeL7GDbbXB54RJQ3lDv7e3DRFVWdFO7T6N++D2F31jCyn2JJp5XWl57yE1VnXLT2eD1mCadNp
	uTE7sdfgFfXztlRBJs4ouEj/MXPM1BPiE3iBAley8rXQItFW9d5+XKC9RfYok5m0Q3AVdMhpudC
	81uMPCEfkjlUf72dqIAy1o/HKqk3fe4jMdsyN1o1FM3JmwaH6SjVxR5o49VN3bc9bg5mQ5YSeg4
	USrirRUkuWSb2U3WRrYYseT2jTKByquLyT68vduGdnUv1oGygB/klMjkZh1YOdArrojNQfFtbyU
	nA1Z63cSiXwujnqQVg1I5y+bIHjOED8AHOrj3BcvtyV3Xc=
X-Received: by 2002:a17:906:c107:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c31a9d2fc30mr1966395866b.20.1792076228005;
        Thu, 15 Oct 2026 07:57:08 -0700 (PDT)
Message-ID: <f57fe42b-b146-4c11-9b60-6732dc62b6a9@gmail.com>
Date: Thu, 15 Oct 2026 16:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 08/39] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Jan Beulich <jbeulich@suse.com>
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
 <6de1f79c-2e2b-4794-8eba-ad7ac224d24d@suse.com>
Content-Language: en-US
In-Reply-To: <6de1f79c-2e2b-4794-8eba-ad7ac224d24d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1792076228-CEF5F87B-C055AC7C/10/73395122804
X-purgate-type: spam
X-purgate-size: 19469



On 10/14/26 3:52 PM, Jan Beulich wrote:
> On 30.09.2026 18:18, Oleksii Kurochko wrote:
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
>> @@ -58,6 +65,12 @@
>>   #define   APLIC_SOURCECFG_SM_EDGE_FALL  0x5
>>   #define   APLIC_SOURCECFG_SM_LEVEL_HIGH 0x6
>>   #define   APLIC_SOURCECFG_SM_LEVEL_LOW  0x7
>> +/*
>> + * All other bits of sourcecfg[] are reserved and read as zero, so drop them
>> + * on a write.
>> + */
>> +#define  APLIC_SOURCECFG_WMASK          (APLIC_SOURCECFG_D | \
>> +                                         APLIC_SOURCECFG_SM)
> 
> You don't drop any bits here; that would happen at the use site of this
> constant. The comment would better be worded accordingly. (The comment
> a few lines up, for APLIC_DOMAINCFG_WMASK, is better in this regard.)

Indeed. I'll reword it to describe the mask, as the comment for
APLIC_DOMAINCFG_WMASK does: "The bits a write may change. All the other
bits of sourcecfg[] are reserved and read as zero."

> 
>> @@ -89,6 +102,9 @@
>>   #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
>>   /* Bit 11 is reserved and reads as zero */
>>   #define  APLIC_TARGET_EIID              GENMASK(10, 0)
>> +/* If target is in direct delivery mode (domaincfg.DM = 0) */
>> +#define  APLIC_TARGET_IPRIO             GENMASK(7, 0)
>> +#define   APLIC_TARGET_IPRIO_DEFAULT    1U
> 
> With this overlap of bits with EEID, should that one gain a similar
> comment?

Makes sense: GUEST_IDX and EIID exist only in MSI delivery mode, as
IPRIO exists only in direct delivery mode, so I'll mark them with a
similar comment.

Also, these definitions aren't really related to what this patch
introduces, so I'll move them, together with their use in
aplic_init_hw_interrupts(), to a separate patch.

> 
>> @@ -98,6 +114,24 @@
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
>> +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw) (BIT(hhxw, UL) - 1)
>> +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs) \
>> +    ((hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
>> +
>> +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw) (BIT(lhxw, UL) - 1)
>> +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs) (lhxs)
> 
> As previously indicated (perhaps in other contexts): Pairs of masks and
> shifts are almost always ambiguous. Hence why we have MASK_EXTR() and
> MASK_INSR(), requiring only a mask: The shift value can be derived from
> the mask.

These aren't masks of fixed fields: where the group and hart indexes sit 
in the MSI address, and how wide they are, are runtime parameters 
(HHXS/LHXS/HHXW/LHXW in the spec's terms, taken here from the IMSIC DT 
node). What the macros call masks are right-aligned width masks, applied 
after the shift. To use MASK_EXTR(), a positioned mask would have to be 
built at runtime. Either width may be zero (a single group is the common 
case, and a single hart is possible), and then MASK_EXTR() would divide 
by zero, so every use would need a guard.

IMO, it is fine to keep these macros as an exception.

> 
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -17,6 +17,7 @@
>>   #include <asm/aia.h>
>>   #include <asm/imsic.h>
>>   #include <asm/intc.h>
>> +#include <asm/mmio.h>
>>   #include <asm/vaplic.h>
>>   
>>   #include "aplic-priv.h"
>> @@ -27,6 +28,313 @@ unsigned int __ro_after_init guest_aplic_num_sources;
>>   
>>   #define FDT_VAPLIC_INT_CELLS 2
>>   
>> +#define AUTH_IRQ_BIT(d, irqn) \
>> +    (((irqn) < (d)->arch.vintc->nr_virqs) && \
>> +     test_bit(irqn, (d)->arch.vintc->used_irqs))
>> +
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
> 
> I wonder whether in cases like this one, where you work with guest controlled
> array indexes, you wouldn't be better off using array_{access,index}_nospec()
> right away.

Agree. In the next version I'll use array_index_nospec() here and in the
other places in vaplic.c where a guest-controlled index is used after a
bounds check:
  - AUTH_IRQ_BIT(), for the test_bit() on used_irqs[];
  - generate_auth_mask(), for the used_irqs[] word picked by word_idx;
  - the target register write path, for sources[srcn].

It seems like array_access_nospec() doesn't fit here: it takes the bound 
from ARRAY_SIZE(), but used_irqs[] and sources[] are allocated per 
domain and bounded by nr_virqs.

> 
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
>> +    case APLIC_DOMAINCFG:
>> +    {
>> +        struct vaplic *vaplic = to_vaplic(currd);
> 
> In vaplic_emulate_load() you have this at function scope? Why do you do
> it differently here, despite there being at least one more instance
> later in the function? With this moved, the oddly placed (yet still
> style conforming) figure braces also wouldn't be needed.

Agree, there was no reason for that. In the next version vaplic is 
looked up once at function scope, as in vaplic_emulate_load(), so both 
inner instances are gone, and so are the braces of the APLIC_DOMAINCFG case.

> 
>> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
>> +                                 (value & APLIC_DOMAINCFG_WMASK);
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
>> +
>> +        return false;
>> +    }
>> +
>> +    aplic_hw_write_reg(offset, value);
> 
> I continue to struggle with this passing through of writes (reads are
> passed through as well, but at least those don't alter state). Aren't
> different guests going to interfere with their writes to setip, clrip,
> setie, clrie, and apparently also {set,clr}i{p,e}num?

They shouldn't. setip, clrip, setie and clrie are write-1-to-set/clear
registers: a 0 bit in the written value leaves the corresponding source
untouched. Before the write is passed through, the value is masked with
the sources assigned to the domain (generate_auth_mask()), so the bits 
of sources belonging to other domains or to Xen are written as 0 and 
aren't affected. {set,clr}i{p,e}num and setipnum_le take a single source 
number, and the write is dropped unless that source is assigned to the 
domain (AUTH_IRQ_BIT()). sourcecfg[] gets the same check, as it is a 
per-source register. domaincfg and target[] writes aren't passed through 
at all: domaincfg is emulated, and the h/w target[] gets a value built 
by Xen.

This relies on a source never being assigned to more than one domain, or
to both a domain and Xen, which route_irq_to_guest() refuses with: EBUSY.
Interrupts are assigned only at domain construction, so the set doesn't
change while the guest runs. And as virq == pirq, the bit (or number) a
guest writes is also the h/w one, so no translation is needed.

There is also no read-modify-write on Xen's side: a guest write is
forwarded as a single 32-bit store, the only access the APLIC supports
in its control region, and Xen doesn't read the h/w register first. For
setip, in_clrip, setie, clrie and the *num registers, the spec defines
what a write does only for the bits written as one (or for the single
source named), regardless of the register's current value. So concurrent
writes to the same register from Xen or from other guests, which always
name disjoint sets of sources, all take effect, whatever order they
reach the APLIC in. Xen's own APLIC driver only uses setienum/clrienum
at runtime.

I'll add a comment summarizing this above the aplic_hw_write_reg() call 
in vaplic_emulate_store():

+    /*
+     * What is left is passed through to the h/w, which can affect only the
+     * sources assigned to currd:
+     *  - setip, clrip, setie and clrie are write-1-to-set/clear, and the
+     *    value was masked with currd's sources above, so the bits of the
+     *    other sources are written as 0, which leaves them untouched;
+     *  - {set,clr}i{p,e}num, setipnum_le and sourcecfg[] name one source,
+     *    which was checked above to be assigned to currd.
+     * route_irq_to_guest() never assigns a source to more than one domain,
+     * or to both a domain and Xen, and as virq == pirq, no translation is
+     * needed either.
+     */
      aplic_hw_write_reg(offset, value);

> 
>> @@ -95,6 +403,56 @@ static const struct vintc_init_ops __initconstrel init_ops = {
>>       .make_domu_dt_node = vaplic_make_domu_dt_node,
>>   };
>>   
>> +static enum io_state cf_check vaplic_mmio_read(struct vcpu *v,
>> +                                               mmio_info_t *info)
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
>> +    }
>> +
>> +    if ( !vaplic_emulate_load(v, info->gpa, &val) )
>> +        return IO_ABORT;
>> +
>> +    /* APLIC registers are 32-bit; zero-extend to the guest register width. */
>> +    info->data = val;
> 
> How do you know info->data has the size of registers as seen by guests? Plus,
> how does this matter anyway? You reject info->len being other than 4, which
> means the originating insn will necessarily have been a 4-byte load. What
> happens to the upper bits (if there are any) depends on the behavior of the
> insn that's being emulated, not on what you do here when storing into
> info->data.

You're right, the comment is wrong on both counts: info->data is
register_t, so it has Xen's register width rather than the guest's, and
it is the load emulation [1] which extends the value into the guest
register, as the instruction requires (lw sign-extends, lwu
zero-extends). I'll drop the comment.

[1]:

static int emulate_load(const struct guest_fault *gf)
...
      if ( !di.is_unsigned )
         shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
     ...
         *guest_gpr(regs, &di) = (long)(info.data << shift) >> shift;
...

And looking on that it would be more correctly to do in this way:

     shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
     ...
     if ( di.reg )
         *guest_gpr(regs, &di) = di.is_unsigned
                                 ? (info.data << shift) >> shift
                                 : (long)(info.data << shift) >> shift;

Thanks.

~ Oleksii

