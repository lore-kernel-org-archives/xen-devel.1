Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791D3C79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 10:38:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414383.1644139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4cAJ-0001Kt-A1; Thu, 10 Sep 2026 10:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414383.1644139; Thu, 10 Sep 2026 10:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4cAJ-0001Ki-6o; Thu, 10 Sep 2026 10:37:59 +0000
Received: by outflank-mailman (input) for mailman id 1414383;
 Thu, 10 Sep 2026 10:37:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4cAI-0001Kc-6m
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 10:37:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4cAG-00AXQm-St
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 12:37:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa28877-2eae-0a2a0a5409dd-0a2a450699fa-22
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 12:37:56 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa28884-195a-0a2a45060019-d155da30e535-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 12:37:56 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c2956d30b56so18255266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 03:37:56 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2945ab67c3sm101282166b.27.2026.09.10.03.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 03:37:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789036676; x=1789641476; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FKD99PzG2ZUhrNmLv19ZWuE9n7M65hZZxxymIKbswM=;
        b=FFcOUwOG7ugI7/9QX2xUdwKiUq9VsSExuI2l6oDmPXFkhogMM17fwqI24gQL0wFnTC
         YB6l00ZqmZUB8Zdzqc8xCDA7wKqUyvOMMUjNKay/l4DFJaDkrMIajYVkmS0mdAPLLbch
         9wAieu/XuFoNDg9ZJc8hFDgwtogongmeEBqx9IxsIsrm9+OCy7SAnV0NgSTqCt9YDmqd
         Llbe9zNOfr/dGDgkwIbkglss5K87j07ZMLTjRAUQdYTeCxvwA8hmjfETXZ4ig/MkcA8F
         jE1Wy8PjE63XGcCbxgaq2J8mh1Wsu60nxdZBP3Wh1v8LGyYGAkKJVBpxkaPvacPqvH2T
         CptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036676; x=1789641476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4FKD99PzG2ZUhrNmLv19ZWuE9n7M65hZZxxymIKbswM=;
        b=adUu4RNz4COSPRAAYscLndUFe1CoZTdUowp5QjvZPd82Z/TC9ewwU/JdxcTkUK9Ldm
         0xv8878K4IhITybKipR99QhYeC+L6EWDzwHzlYvSYmbiGb0LEIQh5G8vTclbxmSjDNl2
         Okj/tAfBCkhIpA6CXQib7Ym8jpiE7rf99XKoQtyFio7Wg+HV9Kzb9ULPwyL6qstJQDjr
         GHthv1XmIRVNLK7n49Z4/HppDq1hwNPIl1AYL0gkIeJ3NWQmvTvcyb9y2lqwfzQrc3/o
         7F74pK0barjUYpIIP08nSzBvwzqShp4zmnevTguiLMQpBa+sk2FaSR9bESxvsIoeiBR1
         nDDw==
X-Forwarded-Encrypted: i=1; AKwUvByHKcJy6BDcns8DtZ+DxG+lB6mJGOW7aYItxnTQqXniiEw65PzrNNzb2QLY1yxAPhAGFIbdtUrcDC0=@lists.xenproject.org
X-Gm-Message-State: AFuF++lLganmEWA9zVE4XJ2TsHbYJnYHSka9DZCowrYLgupc5mXlUCDE
	pkyd5ZO3EeEMLFfzJiUIS/uDTOfSPJ7ErWlIeimGh9QHTtrlZ05TBKcH
X-Gm-Gg: AYBFou3mTvWKkTQfO/m/I9DXDyHUDGAo0a/m67QOWwB8SbJL9VrZOUODtY3zh4Z+ULW
	AO2kz2QglTG7O9FPLxDUIOVIz0A0PUIl/elOS8SQ6uGAY4D5pOxEEjFmg3nLG5FonWa8coOKhRg
	ZnQBLCTlPYdU/dTD49SbpeoSPUMjtbmo09J+SFCI/V58Yyrx1BNm0LHc8gtU3yC3OnwZY64zojI
	vOV4wLwH5jRG13UI7K56f+0zHNddQTtuqgSLmy/M3ReCbK5u2bWk5rtxQjt7zJqDIAfP8vbSoPq
	3NdTU7Y+xERydWJLhtSyF60GzBzbz7+3yCBRFPYnrQIFdpUy3Hiwe9a64D3+aWAw4ssXX/Po9Gb
	Ckz311/uH2bVmg1fBK9hgvTe2aKK/3dAvd6SxHX+RZV0K8yaf2e1NRkUtY7/lLzaxp8RNBFgO3L
	qtmEjX6b0BCQd29xSDTXOvp66bz4pwNFQg65V3VQv7oiyzfu3tEhUy2WXywBaAkmUHTkfoOrKfN
	oUr8stsZrzHU/Oa53A9McZe2KWhC91j
X-Received: by 2002:a17:907:97d3:b0:c29:1133:e17b with SMTP id a640c23a62f3a-c291133e32bmr691803966b.19.1789036676038;
        Thu, 10 Sep 2026 03:37:56 -0700 (PDT)
Message-ID: <071ed630-4c72-4df1-b15e-3037e3f076ba@gmail.com>
Date: Thu, 10 Sep 2026 12:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
 <68ab5241-7301-4988-9420-bcccc4b16e3d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <68ab5241-7301-4988-9420-bcccc4b16e3d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789036676-F70C777B-94915A6B/10/73395122804
X-purgate-type: spam
X-purgate-size: 13821



On 9/9/26 4:26 PM, Jan Beulich wrote:
> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
>> +                              uint32_t base_val)
>> +{
>> +    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
>> +    unsigned long hart_field = aplic_hart_field(target_vcpu->processor);
> 
> What guarantees target_vcpu's ->processor field to be meaningful at this
> point? 

Good question. Considering the places where it is called, I would expect 
target_vcpu->processor to have something meaningful, since it is called 
from a place that can only be reached when the guest is running.

Even without that, I don't think there is a big issue here, as 
->processor is initialized to 0 at allocation time. This means that the 
target register will be configured in such a way that CPU 0 will handle 
such IRQs.

>(Also again naming of the parameter: Generally it wants to be "v"
> or "curr"; only very special cases may use other names.)

I will use just `v` then here.

> 
>> +uint32_t aplic_hw_read_reg(unsigned int offset)
>> +{
>> +    unsigned long flags;
>> +    uint32_t val;
>> +
>> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
>> +
>> +    spin_lock_irqsave(&aplic.lock, flags);
>> +    val = readl((volatile void __iomem *)aplic.regs + offset);
> 
> Please can this have const alongside volatile?

Sure, I will add.

> 
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
> 
> May I ask to avoid unnecessary line splitting here as well?

I will fix that for APLIC_xMSICFGADDR_PPN_HHX_MASK, 
APLIC_xMSICFGADDR_PPN_LHX_MASK and APLIC_xMSICFGADDR_PPN_LHX_SHIFT.

> 
>> --- a/xen/arch/riscv/include/asm/vaplic.h
>> +++ b/xen/arch/riscv/include/asm/vaplic.h
>> @@ -21,11 +21,16 @@ struct domain;
>>   
>>   struct vaplic_regs {
>>       uint32_t domaincfg;
>> +
>> +    uint32_t *target;
>>   };
> 
> A pointer in this structure is odd, as this (supposedly) is a set of
> guest register values. The field name also doesn't clarify its purpose.
> All in all: Likely a comment is needed here.

It is a pointer because I tried to save some memory and allocate 
register target based on how many irqs a guest really needed.

As an option I can allocate that statically and use the value from AIA
spec: target[1]-target[1023]. Would it better?

If a dynamic allocation is still fine then I will add the following comment:

     /*
      * Guest's view of the APLIC target registers, indexed by IRQ number.
      *
      * The array holds d->arch.vintc->nr_virqs elements; target[0] is 
unused
      * as APLIC interrupt sources start from 1.
      */
     uint32_t *target;


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
>> @@ -27,6 +28,279 @@ unsigned int __ro_after_init guest_aplic_num_sources;
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
>> +    return read_atomic(&vaplic->regs.target[irqn]);
>> +}
>> +
>> +static inline uint32_t generate_auth_mask(const struct domain *currd,
>> +                                          unsigned int word_idx)
>> +{
>> +    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
>> +
>> +    if ( word_idx >= DIV_ROUND_UP(currd->arch.vintc->nr_virqs,
>> +                                  sizeof(uint32_t) * BITS_PER_BYTE) )
>> +    {
>> +        gdprintk(XENLOG_DEBUG, "incorrect word_idx(%u) is passed\n", word_idx);
> 
> Along the lines of earlier remarks: What value does "is passed" add?

Probably not too much sense. I will drop it.

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
> 
> gdprintk()?

Agree, it would be better to be gdprintk() here.

> 
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
> 
> This, btw, is a case where I think not using "v" is warranted.
> 
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
>> +
>> +            write_atomic(&vaplic->regs.target[srcn], value);
>> +
>> +            value = aplic_msi_target_gen(target_vcpu, value);
>> +        }
>> +        else
>> +        {
>> +            /*
>> +             * IPRIO is WARL and zero isn't a legal value for it, so normalize
>> +             * it once: the guest then reads back exactly what it gets.
>> +             */
> 
> What is "reads back exactly what it gets" supposed to express? The use of
> "once" there also isn't quite clear to me.

"once" meant the substitution is done in a single place (before the 
value is stored) so nothing has to be adjusted again on the read path; 
"reads back exactly what it gets" meant the shadow copy holds the same 
legal priority that is programmed into the hardware, not the zero the 
guest wrote.

I will re-word the comment to:

/*
  * IPRIO is WARL and zero isn't a legal value for it, so a write
  * of zero is replaced by APLIC_TARGET_IPRIO_DEFAULT. This is done
  * before the value is stored, so the guest-visible copy and what
  * is programmed into the h/w hold the same legal priority and no
  * fix-up is needed when the guest reads the register back.
  */

> 
>> +            unsigned int iprio = MASK_EXTR(value, APLIC_TARGET_IPRIO) ?:
>> +                                 APLIC_TARGET_IPRIO_DEFAULT;
>> +            unsigned long h = cpuid_to_hartid(guest_hart_idx);
>> +
>> +            value = MASK_INSR(guest_hart_idx, APLIC_TARGET_HART_IDX) |
>> +                    MASK_INSR(iprio, APLIC_TARGET_IPRIO);
>> +
>> +            write_atomic(&vaplic->regs.target[srcn], value);
>> +
>> +            value = MASK_INSR(h, APLIC_TARGET_HART_IDX) |
>> +                    MASK_INSR(iprio, APLIC_TARGET_IPRIO);
>> +        }
>> +
>> +        break;
>> +    }
>> +
>> +    case APLIC_SETIPNUM:
>> +    case APLIC_SETIPNUM_LE:
>> +    case APLIC_CLRIPNUM:
>> +    case APLIC_SETIENUM:
>> +    case APLIC_CLRIENUM:
>> +        if ( !value || !AUTH_IRQ_BIT(currd, value) )
>> +            return true;
>> +
>> +        break;
>> +
>> +    case APLIC_DOMAINCFG:
>> +    {
>> +        struct vaplic *vaplic = to_vaplic(currd);
>> +
>> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
>> +                                 (value & APLIC_DOMAINCFG_WMASK);
>> +
>> +        return true;
>> +    }
> 
> May I suggest that you arrange case blocks (primarily) by offset? This would
> then mean for DOMAINCFG handling to move to the top, helping at least a little
> with SOURCECFG_{BASE,LAST} handling (slightly oddly) using APLIC_DOMAINCFG.

I will do that.

> 
>> @@ -122,7 +447,29 @@ int domain_vaplic_init(struct domain *d)
>>        */
>>       d->arch.vintc->nr_virqs = guest_aplic_num_sources + 1;
>>   
>> -    return 0;
>> +    /* Slot 0 is unused: APLIC source numbering starts at 1 (see used_irqs). */
>> +    vaplic->regs.target = xvzalloc_array(uint32_t, d->arch.vintc->nr_virqs);
>> +    if ( !vaplic->regs.target )
>> +    {
>> +        d->arch.vintc = NULL;
>> +        xvfree(vaplic);
>> +
>> +        return -ENOMEM;
>> +    }
>> +
>> +    vaplic->regs_start = GUEST_APLIC_S_BASE;
>> +    vaplic->regs_size = APLIC_SIZE(d->max_vcpus);
>> +
>> +    rc = register_mmio_handler(d, &vaplic_mmio_ops,
>> +                               vaplic->regs_start, vaplic->regs_size);
>> +    if ( rc )
>> +    {
>> +        d->arch.vintc = NULL;
>> +        xvfree(vaplic->regs.target);
>> +        xvfree(vaplic);
>> +    }
> 
> Could you perhaps arrange for it to be possible to simply call
> domain_vaplic_deinit() here (and maybe also on at least some of the earlier
> error paths)? The code above loks very similar to ...
> 
>> @@ -134,5 +481,6 @@ void domain_vaplic_deinit(struct domain *d)
>>   
>>       vaplic = to_vaplic(d);
>>       d->arch.vintc = NULL;
>> +    xvfree(vaplic->regs.target);
>>       xvfree(vaplic);
>>   }
> 
> ... what's here.

Agree, domain_vaplic_deinit() could be used instead of open-coding when 
recieved rc is handled from  register_mmio_handler() and error path above.

Thanks!

~ Oleksii


