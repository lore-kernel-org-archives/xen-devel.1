Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DC3C98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 13:01:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428803.1651737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x907Q-0001zq-FB; Tue, 22 Sep 2026 13:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428803.1651737; Tue, 22 Sep 2026 13:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x907Q-0001zj-CQ; Tue, 22 Sep 2026 13:01:08 +0000
Received: by outflank-mailman (input) for mailman id 1428803;
 Tue, 22 Sep 2026 13:01:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x907P-0001zZ-H2
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:01:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x907O-005niM-Cq
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:01:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab27c12-8faa-0a2a0a5109dd-0a2a4508e44c-0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:01:06 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab27c12-f659-0a2a45080019-4a7de5cdebb3-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:01:06 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b8c9954ccbso2450394e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 06:01:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8d46ad0b5sm487273e87.5.2026.09.22.06.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 06:01:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790082066; x=1790686866; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnQ0ideIs48MmX8Q0RhKG0Die5lKQw6VCxIcqz/H+aY=;
        b=DI5O1TphM6UaU9FsS5vtqW7pWvHqpgtByw4HqIWUI5H0te6xNGO6l6G+q9gmA3gG6m
         qTeqNETMZC7I3mWjC2+ascux1hvWRZw2Q0TQMmyZ1zAuiLNzcQk/1UFsrB5TQwuI3Wgo
         wb67Ssy8WvdgmkNc11wsESo/f2k76debHnxnG3LadLcLuzGct0lh565sBZpxEkBP3WJ/
         oMATJEKZ37AUH9/QaXWaJMCdAncHNF34qlDsQQnwRkaDuQuzoXzw4DCyEu7lBfFpAwtp
         k/mCQYNUWF0OoMm15KL5pOMvxOEOatxs1Wqms+7dbhxrOLhET+qMuyhohwAy84TYmaq7
         F7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082066; x=1790686866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnQ0ideIs48MmX8Q0RhKG0Die5lKQw6VCxIcqz/H+aY=;
        b=p5KppfoSsYENHH3RI87kIeG88ud+UyX55g6qPhj07cSgqo9EKHliyZ7LRUEEiJpuKJ
         WElwxjYi95fsTH1Jafn3jS31klUwbL1XCUtRwdid5XQdOZhoX/jOktrDYMC0VapES2V6
         OAw8ZIUrh91ZT+jRNMJ92AWyfm7Ca9m5Jn0NoC+KhzyDy2YGnLBFcmi9GaMa3hL3kpXT
         Ml//RKUESW0uZtHjGY08A3o+zWbQieBi2cMRhRx6ybv5NfnIs+H65ldXx1VxFhQUzL4e
         ry4EyRzooS4cyjmM/Uuxpq35COv0uI5ZJ2DmM28+EI7z7MHS67EQhuwYRBahN5J4vs/A
         9sGw==
X-Forwarded-Encrypted: i=1; AKwUvBwsSVjuqWVh5kuJkORSglEUqueK8+O+chniEI9kccs+IZLk/M8hLbEwG6O2JkZZ35CRCVPPPDH2t6c=@lists.xenproject.org
X-Gm-Message-State: AFuF++mX2S54a3rku1FM+z1a3BXGbGME/U657Y+zWIyHKbFY7igqjnaR
	k5SICkjhVdTpU5Nts8qVZoDu81TaeRPb08kzss+KcdM0linuV3LVEAFy
X-Gm-Gg: AYBFou1aKuRCOXvCRPjGruk/Y4lo7X7p52fcL9SAMozkz+fbEIqHQ2cBEjT+RULT+e8
	ZCjr6BUr/PMdmTBPlN0NxSPnlKdvIQRSPOKgDXrbpxI+T3KoPz7mjXtpXjuozZBtZDrFNRqGIFp
	kzATU/3z83WQGuKyqOIpjfzBRTVM90Wic5n1wi7h6cRmjOYiMkkNvGhivaMxV5UipsiT1HoMMNC
	ICsik5gZPNn/z9hAkSA7AYaw6TQEZX0O7xW8AEfT124z1ig6UOx3zIpSAtkIUvKVA9EPYPdp0Su
	OKgqFAiCWnbKydQXfvUvWBwlZATOp6A2SIrrzqBIgilEzIMqMr76Q2s/JDfs8V1M1Qk99FbqwT7
	VmBdLBripyn7Xpraj9H771Mx9DFnc8enxT4jHYmBV2LujAYjHCJD6NJffZhrESikEKFrllOA/Lm
	S4sglcHTFBwVUnYx4ONnGaZh+OjUCce6pf9U/mkb0DNiIn/yjHbUiqrXdHLG4ThMZKzA/s2xn1T
	c9+cNiWhffxtdcD76LhLeilgEP4AJMtUaUyNj+Vq6f5XiOG4w==
X-Received: by 2002:a05:6512:3ca5:b0:5b7:674f:cab8 with SMTP id 2adb3069b0e04-5b8c1821977mr4869113e87.15.1790082065147;
        Tue, 22 Sep 2026 06:01:05 -0700 (PDT)
Message-ID: <5b70c0d6-12ec-429c-be9c-a96d78d48e68@gmail.com>
Date: Tue, 22 Sep 2026 15:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/39] xen/riscv: prepare new IMSIC VS-file
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
 <1790007309.8631fc262581453bbf619ec5b2062170.1a0c4bff57900072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790007309.8631fc262581453bbf619ec5b2062170.1a0c4bff57900072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790082066-CDB4987B-8BABB209/10/73395122804
X-purgate-type: spam
X-purgate-size: 9602



On 9/21/26 6:15 PM, Baptiste Le Duc wrote:
> 
> 
> On 8/27/26 5:24 PM, Oleksii Kurochko wrote:
>> Implement first steps of migration a vCPU to a different guest 
>> interrupt file
>> procedure:
>> - At the old interrupt file, save to memory the values of registers
>>    eidelivery and eithreshold, and set eidelivery = 0.
>> - At the new interrupt file, set eidelivery = 0, and zero all
>>    implemented interrupt-pending bits (the eip array).
>>
>> The following steps will be introduced in follow-up patches.
>>
>> Add a BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to 
>> guard
>> against silent incorrect behaviour or unexpected panics in guest VMs 
>> until
>> the function is fully implemented.
>>
>> vgein_assign() will be introduced later in a separate patch, for not 
>> it is
>> only stub.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - New patch.
>> ---
>> ---
>>   xen/arch/riscv/aia.c             |   9 ++
>>   xen/arch/riscv/imsic.c           | 159 +++++++++++++++++++++++++++++++
>>   xen/arch/riscv/include/asm/aia.h |   4 +
>>   xen/include/xen/config.h         |   1 +
>>   4 files changed, 173 insertions(+)
>>
>> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
>> index e31c9c2d24b6..75c82bcfa1b3 100644
>> --- a/xen/arch/riscv/aia.c
>> +++ b/xen/arch/riscv/aia.c
>> @@ -1,8 +1,10 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>> +#include <xen/bug.h>
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/sections.h>
>> +#include <xen/sched.h>
>>   #include <xen/types.h>
>>   #include <asm/cpufeature.h>
>> @@ -21,3 +23,10 @@ void __init aia_init(void)
>>       _aia_usable = true;
>>   }
>> +
>> +unsigned int vgein_assign(struct vcpu *v)
>> +{
>> +    BUG_ON("unimplemented\n");
>> +
>> +    return 0;
>> +}
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index ad7fbe708bfd..516f0105352a 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -26,6 +26,7 @@
>>   #include <xen/spinlock.h>
>>   #include <xen/xvmalloc.h>
>> +#include <asm/aia.h>
>>   #include <asm/imsic.h>
>>   #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * 
>> IMSIC_MMIO_PAGE_SZ)
>> @@ -77,6 +78,64 @@ do {                            \
>>       csr_clear(CSR_SIREG, v);    \
>>   } while (0)
>> +#define imsic_vs_csr_write(c, v)    \
>> +do {                                \
>> +    csr_write(CSR_VSISELECT, (c));  \
>> +    csr_write(CSR_VSIREG, (v));     \
>> +} while ( 0 )
>> +
>> +/*
>> + * Generic switchcase expansion pyramid.
>> + * F is the per-operation leaf macro, ireg is the base register index.
>> + * Optional extra args (e.g. an operation and/or a value) are 
>> forwarded to F
>> + * via __VA_ARGS__.
>> + *
>> + * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg,v); 
>> break;"
>> + * imsic_switchcase_ret(ireg, op, ...) - emit "case ireg: return 
>> op(ireg[,v]);"
>> + *   The variadic tail is optional so the same leaf works for both 
>> read (no v)
>> + *   and swap (with v).
>> + */
>> +#define imsic_switchcase_break(ireg, op, v) \
>> +    case ireg:                              \
>> +        op(ireg, v);                        \
>> +        break;
>> +
>> +#define imsic_switchcase_ret(ireg, op, ...) \
>> +    case ireg:                              \
>> +        return op(ireg, ##__VA_ARGS__);
>> +
>> +#define imsic_switchcase_2(F, ireg, ...)    \
>> +    F(ireg + 0, ##__VA_ARGS__)              \
>> +    F(ireg + 1, ##__VA_ARGS__)
>> +#define imsic_switchcase_4(F, ireg, ...)    \
>> +    imsic_switchcase_2(F, ireg + 0, ##__VA_ARGS__)  \
>> +    imsic_switchcase_2(F, ireg + 2, ##__VA_ARGS__)
>> +#define imsic_switchcase_8(F, ireg, ...)    \
>> +    imsic_switchcase_4(F, ireg + 0, ##__VA_ARGS__)  \
>> +    imsic_switchcase_4(F, ireg + 4, ##__VA_ARGS__)
>> +#define imsic_switchcase_16(F, ireg, ...)   \
>> +    imsic_switchcase_8(F, ireg + 0, ##__VA_ARGS__)  \
>> +    imsic_switchcase_8(F, ireg + 8, ##__VA_ARGS__)
>> +#define imsic_switchcase_32(F, ireg, ...)   \
>> +    imsic_switchcase_16(F, ireg + 0, ##__VA_ARGS__) \
>> +    imsic_switchcase_16(F, ireg + 16, ##__VA_ARGS__)
>> +#define imsic_switchcase_64(F, ireg, ...)   \
>> +    imsic_switchcase_32(F, ireg + 0, ##__VA_ARGS__) \
>> +    imsic_switchcase_32(F, ireg + 32, ##__VA_ARGS__)
>> +
>> +static void imsic_eix_write(unsigned int ireg, unsigned long val)
>> +{
>> +    switch ( ireg )
>> +    {
>> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
>> +                        imsic_vs_csr_write, val)
>> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
>> +                        imsic_vs_csr_write, val)
>> +    default:
>> +        ASSERT_UNREACHABLE();
>> +    }
>> +}
>> +
>>   unsigned int vcpu_guest_file_id(const struct vcpu *v)
>>   {
>>       return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
>> @@ -389,6 +448,76 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
>>       return 0;
>>   }
>> +/*
>> + * Arguments of the imsic_vsfile_local_*() helpers, which are 
>> executed by the
>> + * pCPU owning the interrupt file, thereby through imsic_call_on_cpu().
>> + */
>> +struct imsic_vsfile_data {
>> +    unsigned int hgei;
>> +    unsigned int nr_eix;
>> +    struct imsic_mrif *mrif;
>> +};
>> +
>> +/*
>> + * Execute func() on the pCPU which owns the IMSIC interrupt file 
>> func() is
>> + * going to work with.
>> + *
>> + * An IMSIC VS-file is reachable only through hstatus.VGEIN of the 
>> hart the
>> + * file belongs to, and a guest interrupt file index is meaningless 
>> on any
>> + * other hart, so such work always has to be done by that very hart.
>> + *
>> + * The local case runs with IRQs disabled to provide func() with the 
>> same
>> + * environment it is given when it is called from the function call IPI
>> + * handler.
>> + */
>> +static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
>> +                              void *data)
>> +{
>> +    if ( cpu == smp_processor_id() )
>> +    {
>> +        unsigned long flags;
>> +
>> +        local_irq_save(flags);
>> +        func(data);
>> +        local_irq_restore(flags);
>> +    }
>> +    else
>> +        on_selected_cpus(cpumask_of(cpu), func, data, 1);
>> +}
>> +
>> +static void cf_check imsic_vsfile_local_clear(void *data)
> I think the remark from Jan to direclty pass the type instead of void
> could be applied here.

I think it can't because of how function pointer is passed to 
on_selected_cpus() through imsic_call_on_cpu().

>> +{
>> +    unsigned int i;
>> +    const struct imsic_vsfile_data *idata = data;
>> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
>> +
>> +    /* We can only zero-out if we have a IMSIC VS-file */
>> +    if ( !idata->hgei )
>> +        return;
>> +
>> +    old_vsiselect = csr_read(CSR_VSISELECT);
>> +    old_hstatus = csr_read(CSR_HSTATUS);
>> +    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
>> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
>> +    csr_write(CSR_HSTATUS, new_hstatus);
>> +
>> +    imsic_vs_csr_write(IMSIC_EIDELIVERY, 0);
>> +    imsic_vs_csr_write(IMSIC_EITHRESHOLD, 0);
>> +
>> +    for ( i = 0; i < idata->nr_eix; i++ )
>> +    {
>> +        imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
>> +        imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
>> +#ifdef CONFIG_RISCV_32
>> +        imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
>> +        imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
>> +#endif
>> +    }
>> +
>> +    csr_write(CSR_HSTATUS, old_hstatus);
>> +    csr_write(CSR_VSISELECT, old_vsiselect);
>> +}
>> +
>>   void cf_check vcpu_imsic_deinit(struct vcpu *v)
>>   {
>>       XVFREE(v->arch.vimsic_state);
>> @@ -689,6 +818,14 @@ int __init vimsic_make_domu_dt_node(struct 
>> kernel_info *kinfo,
>>   void imsic_migrate_vcpu(struct vcpu *v)
>>   {
>> +    unsigned int new_vsfile_hgei;
>> +    unsigned int new_vsfile_cpu;
>> +    unsigned int nr_hw_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1,
>> +                                          BITS_PER_TYPE(uint64_t));
> This value appears to remain constant after initialization, since it 
> depends directly on the hw,
> so it is not necessary to calculate it each time.

I will add then:

--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ struct imsic_config {
      /* Number off interrupt identities */
      unsigned int nr_ids;

+    /*
+     * Number of 64-bit EIx groups needed to cover all the interrupt
+     * identities, which are 0 (never valid, but it still occupies a 
bit) up
+     * to and including nr_ids.
+     */
+    unsigned int nr_eix;
+

and init it once in imsic_parse_node().

Thanks.

~ Oleksii

