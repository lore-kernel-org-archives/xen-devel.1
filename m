Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE25606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mG+TDBzo
Received: from list by lists.xenproject.org with outflank-mailman.1474836.1681766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOyLh-0003Ad-ME; Thu, 05 Nov 2026 14:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474836.1681766; Thu, 05 Nov 2026 14:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOyLh-0003AW-JO; Thu, 05 Nov 2026 14:21:53 +0000
Received: by outflank-mailman (input) for mailman id 1474836;
 Thu, 05 Nov 2026 14:21:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOyLg-00039L-1D
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:21:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOyLf-00A0lk-DV
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:21:51 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec90fe-2eae-0a2a0a5409dd-0a2a4504ea6a-2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 15:21:51 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec90ff-b57f-0a2a45040019-d155dd2ec052-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 15:21:51 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-491aaed7565so389521f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 06:21:51 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8748sm10375982f8f.16.2026.11.05.06.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 06:21:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888511; x=1794493311; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSejp9A0sjLzLSVB368wdKm/cwyGhDQchQcPYouvIxc=;
        b=mG+TDBzoqzNtdGONYFxDTCRHIKjf1l3jhMpwZbk/AngGyhThcwdqjW3fOZdJlKiMx5
         XzAtKHG1qvki+iMQr/+zVBSa8qmKsUPGcl7JqsL8NSkJVg0rf4Dn5F7JCTbyq0+Ryt2/
         kZLUrrAp/4hQxWxthxKEO9UvxQ1e+hV9hsL+YxT/vuiuL1pZ/Ur30HydqQjXODnlX9x5
         L7forUG6Q+HhIf9TTN37bkGzYmXxHMm4/aK6BgLUasf3sGlNPu7fTYs7VoDSSJWilKi+
         y1K6eKqDy4bOlF1BX+VUfWvy7GTLSCldvSjz+/2k+KC/fYzfaSm621ypODE5WgXD3JzX
         xZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888511; x=1794493311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSejp9A0sjLzLSVB368wdKm/cwyGhDQchQcPYouvIxc=;
        b=l6dNWN1Ax/3O70VKnukP3K0/OOPmO9dsaUzsZsLzN1aCJXTpZ25es7t7D6SSKkQ2sy
         c8TUzEW6oTaLBBP6f+JsVuKY7N83uGTdbSFT9ALD7P6mlUbR8l7breymr82PF//uBB6s
         k03Rnnjs6m2g0WbCOmNhm/XmfJaNhqcLyuUqYxXrQ47VWdKYfvAygipEn6qg86qH/LsX
         TEiAnmmHJPA6jdQeXCz/7qux7xGshh5kCQdVbrFYlrgZIcjvMvZ7qc46HzCwRR+H7CHI
         1rSAWleNSCzEt2UnfcPpvN0lsSg7esC44THGZrVUOUKqh0W/3azfBf4c9p0WOCrTNejU
         Icrw==
X-Gm-Message-State: APuU4Z9pjQwPXwJKtnduHqtYVXBDEdnU+zlMW2q69W+sMOYrjq9pwPuq
	HqLuCJ9JCl/K94YYKljUPt80TUbzkdEqjgIMU/KyP6J4OgYPSB6LO6XV
X-Gm-Gg: AYBFou3K22F1WkiLMWyUOn4g0oQ8SIW9SizBsb0Jv49Y3+IYBxdcWAOgO2vTsbrQ50G
	nvaT84Sk3LCiZCadjo5XySpxnhooJ/zJNE6eZcBT/RqdSHZo/idIsojMqkvaZPGXRN99aB+T6k8
	5hNpgQoqSD0eSAmlcJNkE7gDGnt3r1C7rpMZUrx7OV+qbo35EEWRoXZKHklBk0jBSlt4qVc3g5Q
	bTj0zGkVIX1kO34wKzPcJEKPDLnSNSkqvB6U4URP+wNb+tzQS62IVYjvmvQIspeH9Ga+OYdin+Q
	+cTUnXYldqN3hJ7Wzk7+6nZjNL3oxgU6sMRA40eXhnfjfRBv8Hi32yNmFyxHrizQklOlaO0Di2u
	j9vCYunJr8wEfZwV35RdBw2OK2WdwSObS/NOB2QX8VP9ixH3yv90To/1YmiE9Yzsoohu3DXoP6X
	qpO7ck9BDFmzDDr/Fs+UBoL00pO9XV0zwv8HdmRLdKD4F1N6b19PqTw3LZyBzyKa6qSihQaJ99M
	U0SyfotmfJhlT3pUSa9HaAOPK1qUDgEPaIoT5wsXWH0xRw+oBNo6zlDdPxqUPUfq3kMrJc0T3cH
	m2e3evWz05slEl1kEnNq0CT0EkzOprZNCWKpPwvncKNN1HLgV67ikMa/7fyRkrSFK1WzugGBbEZ
	22mfQs8btEIKuqoIgTR2q1g==
X-Received: by 2002:a05:6000:46c5:b0:48e:5db7:fd6c with SMTP id ffacd0b85a97d-48e6e2bde59mr25041368f8f.4.1793888510394;
        Thu, 05 Nov 2026 06:21:50 -0800 (PST)
Message-ID: <cf206b92-88df-4f51-b10b-960e0c141d9e@gmail.com>
Date: Thu, 5 Nov 2026 15:21:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/39] xen/riscv: implement APLIC-IMSIC-hart sync
 barrier for vCPU migration
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
 <2075cb10e5f6df787b29f2f087632c82b787a007.1790779209.git.oleksii.kurochko@gmail.com>
 <c77101fe-2505-4cdb-8520-52f92a1c668d@gmail.com>
 <1792763490.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792763490.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793888511-C10DDB50-1603620A/10/73395122804
X-purgate-type: spam
X-purgate-size: 14781
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/23/26 3:51 PM, Baptiste Le Duc wrote:
> On 2026-10-06 16:25:55+02:00, Oleksii Kurochko wrote:
>> On 9/30/26 6:23 PM, Oleksii Kurochko wrote:
>>> When a vCPU is moved to a different guest interrupt file, MSIs that the
>>> APLIC has already sent towards the old file may still be in flight. They
>>> must land before the old file's state is saved and the switch is done,
>>> otherwise they would be lost.
>>>
>>> To wait for them, use the APLIC's genmsi register. Writing it makes the
>>> APLIC itself send an MSI (an "extempore" MSI) with a given interrupt
>>> identity to a given hart. genmsi can only target the hart's hypervisor-
>>> level interrupt file, not a guest one, but the AIA spec guarantees that
>>> all MSIs previously sent by the same APLIC to the same hart become
>>> visible at the hart's IMSIC before the extempore MSI does. So once the
>>> extempore MSI has been delivered, no older MSI from this APLIC to the
>>> hart can still be in flight, whichever interrupt file it targets.
>>>
>>> genmsi's Busy bit clearing only tells that the APLIC has sent the
>>> extempore MSI, not that it has arrived, so the sequence described in the
>>> AIA spec under "Synchronizing interactions between a hart and the APLIC"
>>> is split in two. aplic_genmsi_barrier() does the APLIC side, while
>>> imsic_aplic_sync() does the hart side: it clears the pending bit of the
>>> reserved identity before the genmsi write and spins on it afterwards,
>>> which is what tells that the extempore MSI, and hence every older MSI
>>> from this APLIC to this hart, has really arrived. Keeping the hart side
>>> in imsic.c leaves the APLIC code free of the IMSIC local CSR accessors.
>>>
>>> The last interrupt identity (nr_ids) is reserved for this purpose.
>>>
>>> Migration doesn't use the barrier at this stage, so imsic_migrate_vcpu()
>>> only references imsic_aplic_sync() to keep the compiler from complaining
>>> about it being unused.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in v3:
>>>    - Rename from "xen/riscv: implement APLIC-hart sync barrier for vCPU
>>>      migration", as the barrier waits for the MSIs to reach the hart's IMSIC.
>>>    - Re-word the commit message, describing in it how the sequence is split
>>>      between aplic_genmsi_barrier() and imsic_aplic_sync().
>>>    - Move imsic_aplic_sync(), imsic_local_is_pending() and imsic_csr_read()
>>>      here from "xen/riscv: remap interrupts to new IMSIC VS-file", so that
>>>      both halves of the synchronization sequence are introduced together.
>>>    - s/aplic_hart_field/aplic_hart_index/ following the rename of the helper
>>>      in "xen/riscv: implement virtual APLIC MMIO emulation".
>>>    - Drop masking of sync_id with APLIC_TARGET_EIID, which could silently
>>>      chop off bits; instead add BUILD_BUG_ON() and ASSERT() to make it
>>>      explicit that sync_id always fits into the EIID field.
>>>    - Drop the redundant parentheses around the macro argument in
>>>      imsic_csr_read().
>>>    - Use unsigned int for isel in imsic_local_is_pending() and drop the
>>>      redundant !! as the function returns bool.
>>>    - Rename the unused argument of imsic_aplic_sync() to unused.
>>> ---
>>> Changes in v2:
>>>    - New patch.
>>> ---
>>> ---
>>>    xen/arch/riscv/aplic.c             | 33 +++++++++++++++++++
>>>    xen/arch/riscv/imsic.c             | 52 ++++++++++++++++++++++++++++++
>>>    xen/arch/riscv/include/asm/aplic.h |  3 ++
>>>    xen/arch/riscv/include/asm/imsic.h |  8 +++++
>>>    4 files changed, 96 insertions(+)
>>>
>>> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
>>> index 283e5d6046a6..5f9a894b5a76 100644
>>> --- a/xen/arch/riscv/aplic.c
>>> +++ b/xen/arch/riscv/aplic.c
>>> @@ -27,7 +27,9 @@
>>>    #include <asm/imsic.h>
>>>    #include <asm/intc.h>
>>>    #include <asm/io.h>
>>> +#include <asm/processor.h>
>>>    #include <asm/riscv_encoding.h>
>>> +#include <asm/smp.h>
>>>    
>>>    static struct aplic_priv aplic = {
>>>        .lock = SPIN_LOCK_UNLOCKED,
>>> @@ -183,6 +185,37 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
>>>        spin_unlock_irqrestore(&aplic.lock, flags);
>>>    }
>>>    
>>> +/*
>>> + * As needed, synchronize with all IOMMUs and APLICs to ensure that no
>>> + * straggler MSIs will arrive at the old interrupt file after this step.
>>> + */
>>> +void aplic_genmsi_barrier(void)
>>> +{
>>> +    const struct imsic_config *imsic = imsic_get_config();
>>> +    unsigned int cpu = smp_processor_id();
>>> +    unsigned long flags;
>>> +    uint32_t val;
>>> +
>>> +    /*
>>> +     * sync_id is nr_ids, which imsic_parse_node() limits to IMSIC_MAX_ID,
>>> +     * so it always fits into the EIID field.
>>> +     */
>>> +    BUILD_BUG_ON(IMSIC_MAX_ID > MASK_EXTR(~0U, APLIC_TARGET_EIID));
>>> +    ASSERT(imsic->sync_id <= IMSIC_MAX_ID);
>>> +
>>> +    val = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) |
>>> +          imsic->sync_id;
>>> +
>>> +    spin_lock_irqsave(&aplic.lock, flags);
>>> +
>>> +    writel(val, &aplic.regs->genmsi);
>>> +
>>> +    while ( readl(&aplic.regs->genmsi) & APLIC_GENMSI_BUSY )
>>> +        cpu_relax();
>>> +
>>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>>> +}
>>> +
>>>    static void __init aplic_init_hw_interrupts(void)
>>>    {
>>>        unsigned int i;
>>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>>> index f1e44dc56bb8..8e0273eab902 100644
>>> --- a/xen/arch/riscv/imsic.c
>>> +++ b/xen/arch/riscv/imsic.c
>>> @@ -27,6 +27,7 @@
>>>    #include <xen/xvmalloc.h>
>>>    
>>>    #include <asm/aia.h>
>>> +#include <asm/aplic.h>
>>>    #include <asm/imsic.h>
>>>    
>>>    #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
>>> @@ -60,6 +61,12 @@ static unsigned int __ro_after_init guest_num_msis;
>>>    #define IMSIC_DISABLE_EITHRESHOLD   1
>>>    #define IMSIC_ENABLE_EITHRESHOLD    0
>>>    
>>> +#define imsic_csr_read(c)       \
>>> +({                              \
>>> +    csr_write(CSR_SISELECT, c); \
>>> +    csr_read(CSR_SIREG);        \
>>> +})
>>> +
>>>    #define imsic_csr_write(c, v)   \
>>>    do {                            \
>>>        csr_write(CSR_SISELECT, c); \
>>> @@ -203,6 +210,15 @@ void imsic_irq_enable(unsigned int irq)
>>>         */
>>>        ASSERT(!local_irq_is_enabled());
>>>    
>>> +    if ( irq == imsic_cfg.sync_id )
>>> +    {
>>> +        printk(XENLOG_WARNING
>>> +               "irq%u is reserved for APLIC sync so shouldn't be set by %s\n",
>>> +               irq, __func__);
>>> +
>>> +        return;
>>> +    }
>>> +
>>>        spin_lock(&imsic_cfg.lock);
>>>        /*
>>>         * There is no irq - 1 here (look at aplic_set_irq_type()) because:
>>> @@ -241,6 +257,15 @@ void imsic_irq_disable(unsigned int irq)
>>>        spin_unlock(&imsic_cfg.lock);
>>>    }
>>>    
>>> +static bool imsic_local_is_pending(unsigned int id)
>>> +{
>>> +    unsigned int isel =
>>> +        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
>>> +    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
>>> +
>>> +    return imsic_csr_read(isel) & bit;
>>> +}
>>> +
>>>    /* Callers aren't intended to changed imsic_cfg so return const. */
>>>    const struct imsic_config *imsic_get_config(void)
>>>    {
>>> @@ -387,6 +412,9 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
>>>    
>>>        imsic_cfg.nr_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1, 64);
>>>    
>>> +    /* Reserve last identity for APLIC-to-hart synchronization */
>>> +    imsic_cfg.sync_id = imsic_cfg.nr_ids;
>>> +
>>>        /* Compute base address */
>>>        *nr_mmios = 0;
>>>        rc = dt_device_get_address(node, *nr_mmios, &base_addr, NULL);
>>> @@ -497,6 +525,27 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
>>>            on_selected_cpus(cpumask_of(cpu), func, data, 1);
>>>    }
>>>    
>>> +/*
>>> + * Ensure that all the MSIs the APLIC has already generated for the hart this
>>> + * runs on have really reached the hart's IMSIC.
>>> + *
>>> + * The barrier is the one described by the AIA specification in
>>> + * "Synchronizing interactions between a hart and the APLIC": ask the APLIC to
>>> + * send an MSI to the hart itself and wait until it shows up as pending in the
>>> + * hart's own interrupt file. As it says nothing about MSIs on their way to
>>> + * any other hart, it has to be executed by the pCPU owning the interrupt file
>>> + * the MSIs were being sent to.
>>> + */
>>> +static void cf_check imsic_aplic_sync(void *unused)
>>> +{
>>> +    imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);
>>> +
>>> +    aplic_genmsi_barrier();
>>> +
>>> +    while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
>>> +        cpu_relax();
>>> +}
>>> +
>>>    static void cf_check imsic_vsfile_local_clear(void *data)
>>>    {
>>>        unsigned int i;
>>> @@ -862,5 +911,8 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>>        /* Zero-out new IMSIC VS-file */
>>>        imsic_call_on_cpu(v->processor, imsic_vsfile_local_clear, &vsfile_data);
>>>    
>>> +    /* Avoid an unused-function error until the barrier has a user. */
>>> +    (void)imsic_aplic_sync;
>>> +
>>>        BUG_ON("unimplemented");
>>>    }
>>> diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
>>> index 9018936ca95a..bfb510b2ae5e 100644
>>> --- a/xen/arch/riscv/include/asm/aplic.h
>>> +++ b/xen/arch/riscv/include/asm/aplic.h
>>> @@ -94,6 +94,7 @@
>>>    #define APLIC_SETIPNUM_LE               0x2000
>>>    
>>>    #define APLIC_GENMSI                    0x3000
>>> +#define APLIC_GENMSI_BUSY               BIT(12, U)
>>>    
>>>    #define APLIC_TARGET_BASE               0x3004
>>>    #define APLIC_TARGET_LAST               0x3ffc
>>> @@ -177,4 +178,6 @@ struct aplic_regs {
>>>    uint32_t aplic_hw_read_reg(unsigned int offset);
>>>    void aplic_hw_write_reg(unsigned int offset, uint32_t value);
>>>    
>>> +void aplic_genmsi_barrier(void);
>>> +
>>>    #endif /* ASM_RISCV_APLIC_H */
>>> diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
>>> index 8130d125f5c3..f86407e21765 100644
>>> --- a/xen/arch/riscv/include/asm/imsic.h
>>> +++ b/xen/arch/riscv/include/asm/imsic.h
>>> @@ -62,6 +62,14 @@ struct imsic_config {
>>>         */
>>>        unsigned int nr_eix;
>>>    
>>> +    /*
>>> +     * Interrupt identity reserved exclusively for APLIC-to-hart
>>> +     * synchronization.
>>> +     *
>>> +     * Must not be allocated to any interrupt source.
>>> +     */
>>> +    unsigned int sync_id;
>>> +
>>>        /* MSI */
>>>        const struct imsic_msi *msi;
>>>    
>>
>>
>> I think it also makes sense here to apply the following fixup patch:
>>
>> commit db57e94ed8405c98d7a21f4f88764fa5e0ea2d04
>> (riscv-next-upstreaming-fixups)
>> Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Date:   Tue Oct 6 15:59:52 2026 +0200
>>
>>       fixup! xen/riscv: implement APLIC-IMSIC-hart sync barrier for vCPU
>> migration
>>
>>       In MSI delivery mode the MSI of APLIC source N carries identity N, by
>>       which Xen recognises it in its own IMSIC interrupt file. A source
>>       numbered sync_id or higher can't be told apart: its identity either
>>       isn't implemented, so its MSIs are dropped, or is the one reserved for
>>       the sync barrier, which it would satisfy early and whose pending bit
>>       would swallow its interrupt. Limit the usable sources to those below
>>       sync_id, and document how the identities of Xen's interrupt file are
>>       allocated.
>>
>> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
>> index 96aa4edb3958..86ff3cae984d 100644
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -246,6 +246,7 @@ static int __init cf_check aplic_init(void)
>>        uint64_t size, paddr;
>>        const struct dt_device_node *imsic_node;
>>        const struct dt_device_node *node = aplic_info.node;
>> +    const struct imsic_config *imsic;
>>        int rc;
>>
>>        /* Check for associated imsic node */
>> @@ -270,6 +271,22 @@ static int __init cf_check aplic_init(void)
>>            panic("%s: failed to get number of interrupt sources\n",
>>                  node->full_name);
>>
>> +    /*
>> +     * In MSI delivery mode the MSI of source N carries identity N, by
>> which
>> +     * Xen recognises it in its own IMSIC interrupt file. Hence the sources
>> +     * numbered from sync_id on can't be used: their identities either
>> aren't
>> +     * implemented or are the one reserved for the APLIC-IMSIC sync
>> barrier.
>> +     */
>> +    imsic = imsic_get_config();
>> +    if ( aplic_info.num_irqs >= imsic->sync_id )
>> +    {
>> +        printk(XENLOG_WARNING
>> +               "%s: only %u of %u interrupt sources usable with %u
>> IMSIC identities\n",
>> +               node->full_name, imsic->sync_id - 1, aplic_info.num_irqs,
>> +               imsic->nr_ids);
>> +        aplic_info.num_irqs = imsic->sync_id - 1;
>> +    }
>> +
>>        guest_aplic_num_sources = min(GUEST_APLIC_MAX_SOURCES,
>> aplic_info.num_irqs);
>>
>>        if ( aplic_info.num_irqs > ARRAY_SIZE(aplic.regs->sourcecfg) )
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index ca5243826726..408b94b22ee9 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -533,7 +533,15 @@ static int __init imsic_parse_node(const struct
>> dt_device_node *node,
>>
>>        imsic_cfg.nr_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1, 64);
>>
>> -    /* Reserve last identity for APLIC-to-hart synchronization */
>> +    /*
>> +     * The identities of Xen's own interrupt file are allocated statically:
>> +     *  - the APLIC sources take 1 .. riscv,num-sources, as the MSI of
>> source
>> +     *    N carries identity N (aplic_init() drops the sources which
>> don't fit
>> +     *    below sync_id);
>> +     *  - the last one, nr_ids, is reserved for APLIC-to-hart
>> synchronization.
>> +     * Anything else taking identities from this file has to stay clear of
>> +     * both.
>> +     */
>>        imsic_cfg.sync_id = imsic_cfg.nr_ids;
>>
>>        /* Compute base address */
>>
>> Any thoughts about it?
> LGTM, but I wonder why, as I said in the original patch, sync_id is
> really needed.
> 

I think that I am not understand your response. Could you please 
re-phrase it?

~ Oleksii


