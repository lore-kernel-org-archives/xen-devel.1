Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D08C5AC7A
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 16:08:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1386165.1628268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsN7S-0001hq-I0; Fri, 07 Aug 2026 16:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1386165.1628268; Fri, 07 Aug 2026 16:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsN7S-0001hj-Dn; Fri, 07 Aug 2026 16:08:26 +0000
Received: by outflank-mailman (input) for mailman id 1386165;
 Fri, 07 Aug 2026 16:08:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wsN7Q-0001hd-DH
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 16:08:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsN7P-001cXz-QF
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 18:08:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7602e0-bab6-0a2a0a5309dd-0a2a450cc8de-22
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 18:08:23 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7602f7-f479-0a2a450c0019-d155dd2aacab-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 18:08:23 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f703a9e5dso1901116f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 09:08:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021e8c5asm7639218f8f.18.2026.08.07.09.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 09:08:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786118903; x=1786723703; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcaFk3ixeEuYgcoQ8XLn+8G7y+rECFC1WUDOEimqWVw=;
        b=JY7iI8SiBhtmh9V6/DQvfRRLNJZtSHkcWwvRIlPSe/PUOMSq2TYAeAPIo5DFXbZe3e
         yRQu2YhoVOqeFGwDpAqEJ+2KGKXf7PnShta+rvgtuk0DV4ZqUWwl5YtU/tyeMyuTVXw4
         jIseGjiYwEfjN2gDKN1Fv8/+4MQ/42pt2vWnsI7Y86XmhQuZp5AmU17VxTCctV3Q1/xt
         HnwYUymLfp+pFyBoWt6zHJQ5GEgkBSBeupWbXys1AUFmYeza29sjqvrMVx979GMkQVRH
         S6f7u6+w9Ex/HrH77tO+naMJ4GQUCV2pm/D+Q7bD+l4Obxr0eBAVVC3aMFrooNfQw7EI
         e2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786118903; x=1786723703;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcaFk3ixeEuYgcoQ8XLn+8G7y+rECFC1WUDOEimqWVw=;
        b=H8OcBTqCGTOjXZErhxLConT/sOXKG6j+H/Qcz/It2ky7JFW+gJiBVdr3bKD6tr228D
         Yse+fC9Wx/pKmfSLoB6vBzi7NOd5sOGgwIu5DUbUnttJDjLFSnvrsS8Zt53jiNZ9Xmx7
         sHf3eIi8d2XC+2Vu+m/iz9J8TIhlQwI2XPH0hv6oln2ynCkJ2MiokSnx5lBbTvX3im+X
         1QMQDQb84DdSL8mpa9kylPrw/Dij4HdBeDikv6OwiWCinQr3ck6/mZYuHBSxZGoZq/Ng
         0yT3oYVaZuUuLMaKcR1TWr1Rnt4/DYTYiFZoYnhCE0b6vTj9XUpU08OetC8U/NI2dRx4
         Ewgg==
X-Forwarded-Encrypted: i=1; AHgh+RqiS/N5KYWZR/JJaS5KOte/BlKnQtTuX7o3RJPve97BR7bp7niRgPsxiQyLzRa2rKOKX6PRdIbrlXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGsl5DKTFD05SScnNnK3JEnxAooCYdl8ZwHK4PxQymyDtgP5HO
	a7KcyYJ0VTVVTp9WwQrDIgqdquotO3xbAggOt/EN2NPJ9dLybiYhbTJ1vFf1aQ==
X-Gm-Gg: AR+sD12NXLxoPxIZGBTIMsuanMKyi8u4fFqZOscbmE4SCaXBKoKDTtjPjuUnym4VVGU
	URQTl/uc1I4S8lUPbFGpLO7VPnU0+P0apzcx04ll0/OichUbnI0hnkXgI0acSOEFEZD/2Wy9N43
	RCbtF2ENWJTCqd1DkUYi8UKemfq1wHpGwm07YvajTUu1bs9Ec2MEjQnCur3ILroJH8YaJ50rZco
	iPi6yn2plj65IzIpVL9u/bkLF6+EI8d+u6dopWD86Dd+iWAj3DFK/B8fqjac5ehSK+WbNh0exwG
	CSP+eZSZo5pQMh9b7jFHOfbxQnbJqWD9cYf1kbgEWoyA7micE560HyArjfJzK7FnldKtOiu4roY
	t2Bw7CO23509PLMhmTvHvR/lpuamDyXCWNCqkiMUSw5eFt+mLW85KwEaax9RzxR022A11ryrbMa
	nH8WXu55eHIYSrUq6DHAH6toFslF2Ze5/q6fLoP78sV5O1FhSUB5wxsmWvuj2d5Oq2HmnR93S5z
	gvaL53kOI18SGoby/j+kn8hvVm8xnqxUquliFJAE5o=
X-Received: by 2002:a05:6000:1787:b0:47f:8802:c182 with SMTP id ffacd0b85a97d-47fec63cdd1mr36686966f8f.29.1786118902822;
        Fri, 07 Aug 2026 09:08:22 -0700 (PDT)
Message-ID: <4c62661a-f944-4806-824a-e74bcbaea3df@gmail.com>
Date: Fri, 7 Aug 2026 18:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 05/17] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Jan Beulich <jbeulich@suse.com>
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
 <57793423-aadd-4786-90fd-2923925b766d@suse.com>
Content-Language: en-US
In-Reply-To: <57793423-aadd-4786-90fd-2923925b766d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1786118903-52530A5B-98AD61D7/10/73395122804
X-purgate-type: spam
X-purgate-size: 20273



On 8/6/26 4:28 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> Guests running under Xen program interrupt routing by writing to APLIC
>> MMIO registers. Xen must intercept these accesses to enforce interrupt
>> isolation between domains and to translate guest routing intent into the
>> underlying physical MSI topology.
>>
>> Writes are gated by the domain's authorised interrupt bitmap so that a
>> guest cannot affect interrupts it does not own. TARGET register writes
>> additionally require translation of the hart and IMSIC guest-file
>> indices from virtual to physical, as the APLIC uses these fields
>> directly to compute the MSI delivery address.
>>
>> Delegation (APLIC_SOURCECFG_D) is not yet supported.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech> # vaplic_mmio_{read,write}
> 
> For this tag to have any meaning, it should move ahead of the --- above;
> the explanations ...
> 
>> The downstream changes related to `vaplic_mmio_{read,write}` were originally
>> in a separate patch (which was reviewed by Baptiste). However, before
>> upstreaming, it was decided to merge them into the current patch.
>> I added `Reviewed-by: Baptiste` in this form for now, but Baptiste will
>> probably review the remaining changes as well.
>> Once that happens, I'll simply move the `Reviewed-by` tag up and
>> remove the `#`.
> 
> ... here rather explain the restriction on the R-b, not its odd placement.
> 
>> ---
>> Changes in v3:
> 
> As this looks to be recurring - please get versioning of your series right.
> The series is supposedly v1, but here you give the impression of it being
> v3. If there really was an earlier v2 posting, why isn't the entire series
> here v3?

It is v3 before before it was a part of another patch series connected 
to dom0less config enablement.

Would it be better to just write in "Change in v3" that it is moved from 
another patch series + link to that patch series? Or it will be enough 
just to drop "Changes in v2 and v1" and just start from v1?

> 
>> --- a/xen/arch/riscv/aplic-priv.h
>> +++ b/xen/arch/riscv/aplic-priv.h
>> @@ -48,4 +48,6 @@ struct aplic_priv {
>>    */
>>   extern unsigned int guest_aplic_num_sources;
>>   
>> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu, uint32_t base_val);
> 
> PLease can you, before submitting, self-review your patches? I'm really
> getting tired of having to repeatedly point out basic style issues, like
> the overlong line here.

Sorry for that, I will write an extra checker for such cases to not miss 
them.

> 
>> @@ -38,6 +39,60 @@ static struct intc_info __ro_after_init aplic_info = {
>>       .hw_variant = INTC_APLIC,
>>   };
>>   
>> +static unsigned long aplic_hart_field(unsigned long hartid)
>> +{
>> +    const struct imsic_config *imsic = imsic_get_config();
>> +    unsigned int lhxw = imsic->hart_index_bits;
>> +    unsigned int hhxw = imsic->group_index_bits;
> 
> It extends to the other local variables here, but I'll use these two to
> try to make my point: I'm struggling to associate the names with the
> values they are set to. Likely "hxw" is an abbreviation of hart index
> width, but (a) what's the leading 'l' then and (b) why is there no 'g'
> in "hhxw"? By using hard to grasp names, you make it hard to actually
> understand the subsequent expressions, in particular ...

The names it taken directly from AIA spec:

The use of this value and fields HHXS (High Hart Index Shift), LHXS (Low 
Hart Index Shift), HHXW (High Hart Index Width), and LHXW (Low Hart 
Index Width) for determining target addresses for MSIs is described 
later, in Section 4.9.1.

The AIA specification interprets the machine-level hart index as a 
combination of the **group index** (`g`) and the **hart index within the 
group** (`h`), according to the following formulas:

```
(1) g = (machine-level hart index >> LHXW) & (2^HHXW − 1)
(2) h = machine-level hart index & (2^LHXW − 1)
```

(In our case, the machine-level hart index is equal to `mhartid`, i.e. 
the hart index.)

For systems that use IMSIC groups, the IMSIC address layout is defined 
by the following parameters:

* `lhxw` (Low Hart Index Width, or *k*): the number of bits used for the 
hart number within a group.
* `hhxw` (High Hart Index Width, or *j*): the number of bits used for 
the group number.
* `hhxs` (High Hart Index Shift): the bit offset of the combined 
hart/group index field within the physical address.

To extract the group index, we first shift the address by `hhxs` so that 
the group index bits are aligned, and then apply a mask derived from 
`hhxw` to isolate those bits.

The hardware performs the same operation to extract the hart index from 
the MSI address. However, in our case we already know which hart should 
receive the interrupt (`hartid`), so there is no need to extract the 
hart index from the base address. We only need to recover the group 
index and combine it with `hartid` to construct the value expected by 
the `target` register.

> 
>> +    unsigned int hhxs =
>> +        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
>> +    unsigned long tppn =
>> +        imsic->msi[hartid].base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
>> +    unsigned long group_index =
>> +        (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
>> +        APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
>> +
>> +    return (group_index << lhxw) | hartid;
> 
> ... these last two. As it stands, they may be easier to understand if
> you didn't have the local variables at all, despite them then getting
> textually longer.

With the explanation above, do the variable names make sense?

To be closer to AIA spec I think it would be better to rename 
group_index to g and hart_id to h. Does it make sense to you?

>> +
>> +uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask)
>> +{
>> +    unsigned long flags;
>> +    uint32_t val;
>> +
>> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
>> +
>> +    spin_lock_irqsave(&aplic.lock, flags);
>> +    val = readl((volatile void __iomem *)aplic.regs + offset) & mask;
> 
> Wouldn't this applying of a mask better be done in those callers which
> actually need it? It's not the least the asymmetry with ...

Agree, that to be in sync, I will drop mask argument and apply it on 
caller side.

> 
>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> +void aplic_hw_write_reg(unsigned int offset, uint32_t value)
> 
> ... this which I consider unhelpful.
> 
>> --- a/xen/arch/riscv/include/asm/aplic.h
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -28,6 +28,8 @@
>>   #define APLIC_DOMAINCFG_BE      BIT(0, U)
>>   
>>   /* sourcecfg register fields */
>> +#define APLIC_SOURCECFG_D       BIT(10, U)
> 
> As to the comment - this indeed looks to be a field, but ...
> 
>>   #define APLIC_SOURCECFG_SM_INACTIVE     0x0
>>   #define APLIC_SOURCECFG_SM_DETACH       0x1
>>   #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
> 
> ... these look to be values of some other field which isn't described. Please
> may I (again) ask that definitions are their commentary at the very least not
> misguide readers?

Thanks for pointing this out. You're right, the comment is misleading as 
written. APLIC_SOURCECFG_D is a field, whereas the APLIC_SOURCECFG_SM_* 
definitions are values for the source mode (SM) field, and the comment 
doesn't make that distinction.

I'll update the comments to describe the fields more accurately:

#define APLIC_SOURCECFG_BASE            0x0004
#define APLIC_SOURCECFG_LAST            0x0ffc
/*
  * sourcecfg[] register fields:
  *  - bit 10 (D) selects the layout of the remaining bits;
  *  - D = 1: bits [9:0] hold the Child Index, i.e. the source is delegated
  *           to a child domain (unsupported by Xen);
  *  - D = 0: bits [2:0] hold the source mode SM (WARL).
  */
#define  APLIC_SOURCECFG_D              BIT(10, U)
/* SM field values (0x2 and 0x3 are reserved): */
#define   APLIC_SOURCECFG_SM_INACTIVE   0x0
#define   APLIC_SOURCECFG_SM_DETACH     0x1
#define   APLIC_SOURCECFG_SM_EDGE_RISE  0x4
#define   APLIC_SOURCECFG_SM_EDGE_FALL  0x5
#define   APLIC_SOURCECFG_SM_LEVEL_HIGH 0x6
#define   APLIC_SOURCECFG_SM_LEVEL_LOW  0x7

Does it look better? Probably there is not sense for two extra spaces 
for APLIC_SOURCECFG_SM_*. I want to show by such identation that it is 
values for SM field of APLIC_SOURCECFG.


> 
>> --- a/xen/arch/riscv/include/asm/imsic.h
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -40,6 +40,16 @@ struct imsic_config {
>>       /* Base address */
>>       paddr_t base_addr;
>>   
>> +    /*
>> +     * MSI Target Address Scheme
>> +     *
>> +     * XLEN-1                                                12     0
>> +     * |                                                     |     |
>> +     * -------------------------------------------------------------
>> +     * |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
>> +     * -------------------------------------------------------------
>> +     */
> 
> And the xxx-es in here mean what exactly? Don't care? Some other, unrelated
> values? Yet something else?

  The `x` bits denote address bits that are constant across all IMSIC 
interrupt files. They are not used to encode the group, HART, or guest 
index; instead, they correspond to the fixed portion of the IMSIC 
address determined by the platform's memory map.

For example, consider the IMSIC DT binding:

     interrupt-controller@28000000 {
       compatible = "qemu,imsics", "riscv,imsics";
       interrupts-extended = <&cpu1_intc 9>,
                             <&cpu2_intc 9>,
                             <&cpu3_intc 9>,
                             <&cpu4_intc 9>;
       reg = <0x28000000 0x2000>, /* Group0 IMSICs */
             <0x29000000 0x2000>; /* Group1 IMSICs */
       interrupt-controller;
       #interrupt-cells = <0>;
       msi-controller;
       #msi-cells = <0>;
       riscv,num-ids = <127>;
       riscv,group-index-bits = <1>;
       riscv,group-index-shift = <24>;
     };


Here, `hart_index_bits = 2` (4 CPUs) and `guest_index_bits = 0`, so the 
address layout becomes:

31          25 24 23         14 13 12 11          0
+-------------+-+-------------+-----+-------------+
| constant    |G|  constant   |HART |    zeros    |
+-------------+-+-------------+-----+-------------+


I can update the comment to say:
"x denotes bits that are constant across all interrupt file addresses."

or, if you think it's clearer: "x denotes bits whose values are 
platform-defined and common to all interrupt file addresses."

Does it make sense any of suggested options?


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
>> @@ -27,6 +28,256 @@ unsigned int __ro_after_init guest_aplic_num_sources;
>>   
>>   #define FDT_VAPLIC_INT_CELLS 2
>>   
>> +#define AUTH_IRQ_BIT(d, irqn) ( \
>> +    ((irqn) < (d)->arch.vintc->nr_virqs) && \
>> +    test_bit(irqn, (d)->arch.vintc->used_irqs) )
> 
> Nit: Indentation.

I will use the following indentation:

... (((irqn) < (d)->arch.vintc->nr_virqs) && \
      test_bit(irqn, (d)->arch.vintc->used_irqs))

> 
>> +/*
>> + * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
>> + * a 32-bit word index into the allocated_irqs bitmap.  Each word covers 32
>> + * interrupt sources.  For SOURCECFG and TARGET groups the same division also
>> + * yields the interrupt number directly, because those arrays store one 32-bit
>> + * register per source.
>> + */
>> +#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
>> +
>> +static inline uint32_t generate_auth_mask(const struct domain *d,
>> +                                          unsigned int word_idx)
>> +{
>> +    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
>> +
>> +    if ( word_idx >= DIV_ROUND_UP(d->arch.vintc->nr_virqs,
>> +                                  sizeof(uint32_t) * BITS_PER_BYTE) )
>> +    {
>> +        dprintk(XENLOG_DEBUG, "incorrect word_idx(%u) is passed\n", word_idx);
> 
> Is this really meant to stay?

For debug purpose it could be useful, so I prefer to have it with 
changing it to gprintk(XENLOG_DEBUG, ...) to understand which domain is 
trying to access something wrong.

> 
>> +        return 0U;
> 
> The U suffix is mainly (even if only slightly) obfuscating things, I think.

Agree, I will drop U.

> 
>> +    }
>> +
>> +    return (uint32_t)(d->arch.vintc->used_irqs[first_bit / BITS_PER_LONG] >>
>> +                      (first_bit % BITS_PER_LONG));
> 
> I don't quite understand the need for the cast.

Functionally it isn't need but it documents that it is expected that 
translation from unsinged long  to uint32_t will happen. I will drop the 
cast.

> 
>> +static int cf_check vaplic_emulate_load(const struct vcpu *v,
> 
> Why the cf_check (also for the store counterpart)?

Missed to drop. Before vaplic_emulate_load() was used to initialize 
vints_ops. It should be dropped here.

> 
>> +static int cf_check vaplic_emulate_store(const struct vcpu *v,
>> +                                         unsigned long addr, uint32_t value)
>> +{
>> +    int rc = -EINVAL;
>> +    const struct domain *d = v->domain;
>> +    unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
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
>> +        value &= generate_auth_mask(d, word_idx);
>> +
>> +        break;
>> +    }
>> +
>> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
>> +        if ( value & APLIC_SOURCECFG_D )
>> +        {
>> +            rc = -EOPNOTSUPP;
>> +
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
>> +        if ( !AUTH_IRQ_BIT(d, regoffset_to_word_idx(offset - APLIC_DOMAINCFG)) )
>> +            /* Interrupt not enabled, ignore it */
>> +            return 0;
>> +
>> +        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
>> +        {
>> +            gdprintk(XENLOG_ERR,
>> +                     "value(%u) is incorrect for sourcecfg register\n", value);
>> +
>> +            return 0;
>> +        }
>> +
>> +        break;
>> +
>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>> +    {
>> +        struct vcpu *target_vcpu = NULL;
>> +        unsigned int hart_idx = value >> APLIC_TARGET_HART_IDX_SHIFT;
>> +
>> +        /*
>> +         * Look at vaplic_emulate_load() for explanation why
>> +         * APLIC_GENMSI is subtracted.
>> +         */
>> +        if ( !AUTH_IRQ_BIT(d, regoffset_to_word_idx(offset - APLIC_GENMSI)) )
>> +            /* Interrupt not enabled, ignore it */
>> +            return 0;
>> +
>> +        if ( hart_idx < v->domain->max_vcpus )
> 
> You have d as a local variable.
> 
>> +            target_vcpu = v->domain->vcpu[hart_idx];
> 
> Use domain_vcpu()?

It will be better, thanks.

> 
>> +        if ( !target_vcpu )
>> +        {
>> +            dprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
>> +
>> +            /* Ignore such writings */
>> +            return 0;
>> +        }
>> +
>> +        value = aplic_msi_target_gen(target_vcpu, value);
>> +
>> +        break;
>> +    }
>> +
>> +    case APLIC_SETIPNUM:
>> +    case APLIC_SETIPNUM_LE:
>> +    case APLIC_CLRIPNUM:
>> +    case APLIC_SETIENUM:
>> +    case APLIC_CLRIENUM:
>> +        if ( !value || !AUTH_IRQ_BIT(d, value) )
>> +            return 0;
>> +
>> +        break;
>> +
>> +    case APLIC_DOMAINCFG:
>> +    {
>> +        struct vaplic *vaplic = to_vaplic(v->domain);
>> +
>> +        /*
>> +         * The domaincfg register has this format:
>> +         * bits 31:24 read-only 0x80
>> +         * bit 8      IE
>> +         * bit 7      read-only 0
>> +         * bit 2      DM (WARL)
>> +         * bit 0      BE (WARL)
>> +         *
>> +         * The most interesting bit for us is IE(Interrupt Enable) bit.
>> +         * At the moment, at least, Linux doesn't use domaincfg.IE bit to
>> +         * disable interrupts globally, but if one day someone will use it
>> +         * then extra actions should be done.
>> +         *
>> +         * Only DM (bit 2) and IE (bit 8) are writable here. They are assigned
>> +         * (not OR-ed) so that a write of 0 can also clear them (WARL), and the
>> +         * read-only high byte (0x80) is always kept set on read-back.
>> +         */
>> +        if ( value & ~(APLIC_DOMAINCFG_RO | APLIC_DOMAINCFG_DM |
>> +                       APLIC_DOMAINCFG_IE) )
>> +            printk_once("%s: Ignore writes to non-writable domaincfg bits as "
>> +                        "they are set by aplic during initialization in Xen\n",
>> +                        __func__);
>> +
>> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
>> +                                 (value & (APLIC_DOMAINCFG_DM |
>> +                                           APLIC_DOMAINCFG_IE));
>> +
>> +        return 0;
>> +    }
>> +
>> +    default:
>> +        goto fail;
> 
> Instead of this goto, I think you simply want to move the label here.
> That'll also make the function more similar to its load counterpart.

Good point. I am curious how fail label should be aligned:

     default:
  fail:
         gdprintk(XENLOG_WARNING,
                  "Unhandled APLIC write at offset %#x (value %#x)\n", 
offset,
                  value);

         return rc;
     }

or default:
     fail:

?

> 
>> @@ -105,6 +356,50 @@ static const struct vintc_init_ops __initconstrel init_ops = {
>>       .make_domu_dt_node = vaplic_make_domu_dt_node,
>>   };
>>   
>> +static enum io_state cf_check vaplic_mmio_read(struct vcpu *v, mmio_info_t *info,
>> +                                               register_t *r)
>> +{
>> +    uint32_t data = 0;
>> +
>> +    if ( info->len != sizeof(uint32_t) ||
>> +         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
>> +    {
>> +        gdprintk(XENLOG_DEBUG,
>> +                 "VAPLIC: unaligned/wrong-width read gpa=%"PRIpaddr" len=%u\n",
>> +                 info->gpa, info->len);
> 
> You have v passed in here, but you'd log current. If passing in v is
> necessary (i.e. here or elsewhere it may be other than current), then you
> need to either ASSERT(v == current) at the top of the funciton or otherwise
> handle v != current correctly.

It makes sense. I will add ASSERT(v == current) here and for 
vaplic_mmio_write().

> 
>> +        return IO_ABORT;
>> +    }
>> +
>> +    if ( vaplic_emulate_load(v, info->gpa, &data) < 0 )
> 
> If all you care about is a boolean result, why not make the function return
> bool?

Agree, bool will be enough for vaplic_emulate_load() and 
vaplic_emulate_save().

Thanks!

~ Oleksii

