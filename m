Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FD7C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:45:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430967.1653368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PA5-0005wk-Rj; Wed, 23 Sep 2026 15:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430967.1653368; Wed, 23 Sep 2026 15:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PA5-0005wd-Or; Wed, 23 Sep 2026 15:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1430967;
 Wed, 23 Sep 2026 15:45:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9PA4-0005wX-3q
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9PA3-00DhQe-Gs
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:45:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3f41b-2eae-0a2a0a5409dd-0a2a4507a486-0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:45:31 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3f41b-b4ea-0a2a45070019-4a7de18de6c9-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:45:31 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso14020135e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 08:45:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1da00bsm80910615e9.10.2026.09.23.08.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 08:45:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790178331; x=1790783131; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Df1rqWp3t8plN4b+c9Y1sHrb3OEKE0S8PfzeS6gM4c=;
        b=SI6AteYVoA0SSu/g6nVHE7GuGKyee2U2UnqVNQ1Z5FJQ6mpEoq+c4bm8yIcVG8XmoK
         5Qp36dpcP9brrB14tA2rua7W1Ep4dctshzKMwC0qmTFtk9hKTQKHg+Jt5qwUXCc8aor/
         9NwHUhINe7DgpHUL2VFog3ibk2GgiWESgNmSa1GYxSCAtbB7l3G3VWsesCy1ngP3qLjz
         8Frz/259VBphdeM6ra8hlXSjU3SQj0686xWEB0ZHsQU9McWT1lzTgJZ2Y4fM51xHka8Z
         o2ZUcPdKYIrjo+qDgwGU5RSBxhSB4M2kta7VM7HlBytdxYZgqJLV1jrhv4K09jaE3rv4
         55Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178331; x=1790783131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Df1rqWp3t8plN4b+c9Y1sHrb3OEKE0S8PfzeS6gM4c=;
        b=2NHdqJC6nroX/5y+rrkOS3DNwDXytfNAjZZmnuRJytx3DeWZnfOmbi9AHnVnOE5ArC
         ZikSycrvYqBdEUv7A2o/O0BVHvEUznuo8Yj2RTKnTXmkWsi7vilBNdK1r4B7SSeDTi0/
         5VKTjTUZqnBp4BeMvWiiu6qi3eLqJD8amSLMKCZzpmsYALBx/ytWMsEHhNulDzmgxtUf
         7cQA4mLVmN7+Ct/Skqjv22s2l7z2d7cF8SWYFwCdB3ghVnkxADPxxjX5yeMUSfRlD2gu
         xs9I/QVpdnUaYOlzOFg/lqKogwFcPC0OAZo7XJcFdVF84+J66BNcAzIzAKQUa7LJwiUr
         ycGQ==
X-Gm-Message-State: AFuF++nM5aaHmVrwoNPBFVvJ7N/1oUItUhj4Nd9Z6o4DhL4kEHHMHD2L
	G6a5Z0wNaGwgZ8xsw2voRpXzKRwC3uAAGTtXS6Quf+YLW1Iq0T9UbDUx
X-Gm-Gg: AYBFou2MoQG5xaD9z1asc5YA0jRlOqGWj3EprHbht9bWoscnGOBsOn5iybYcf/xtwFZ
	IzV6B/rm/S/aLx4mnxFUR2UvaocvXHJJQO/FlqFVdITMpzP4E/bERUR5ZnYHfVh9SFWpDXv2QRn
	7j/VjD+dCQaUvJ2jkWUEv4kqi5czWYv79nFROQuQ1wm9QGU7qgu/Qb0wfiqVWn/sbFyPt1AMEq5
	nnT8e6Pd2+3+FZDngZTCULFXLMCoTD68gAStqyUroh1/r2c2d2B6Q7q7VvET4rmBNOSjemcRvP7
	mdqKUxu0HvLEDg9HgUvy7sNqcIA5Qe5t36i0dnmUqim7aBLionrS7ooyFlVt6HX2I7yJlm5UO8X
	yZQhPsRrXDNisEhAW/uDw7XygoZmyGgimShdF1HFFZ1lFSYns7puTOrkri+zA5DvjILNcdJoYrd
	ltpUuj0MnFM/6geoH6gGn06w/Hl3NbX8/7coBjooi5hzy9Z3TOlAnCtpD5sEFy1pEE+GM7lFfqq
	lQg5JF6DxORIJWeke+tK4fueaebi0mcJdomzDrHtfA/I/JTOw==
X-Received: by 2002:a05:600c:19d2:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49fdf1370bcmr45308265e9.16.1790178330682;
        Wed, 23 Sep 2026 08:45:30 -0700 (PDT)
Message-ID: <8d29264c-d364-4a77-9ee9-977a1017f76b@gmail.com>
Date: Wed, 23 Sep 2026 17:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC VS-file
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
 <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
 <1790170494.8631fc262581453bbf619ec5b2062170.1a0ce79f65d00072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790170494.8631fc262581453bbf619ec5b2062170.1a0ce79f65d00072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790178331-368D9AE4-3E6586E7/10/73395122804
X-purgate-type: spam
X-purgate-size: 7746



On 9/23/26 3:34 PM, Baptiste Le Duc wrote:
>> After new IMSIC VS-file is zeroed-out it is necessary to do G-stage remaping
>> fo new IMSIC VS-file. Also, if any interrupts at an APLIC are forwarded by
>> MSIs to the old interrupt file, reconfigure the APLIC to send them to the
>> new interrupt file.
>>
>> Generally it is needed also to modify the relevant translation tables at
>> all IOMMUs so that MSIs for this virtual interrupt file are now sent to
>> the new physical interrupt file but it is skipped for now there is no IOMMU
>> support for RISC-V.
>>
>> Synchronize with APLIC to ensure that no straggler MSIs will arrive at
>> the old interrupt file by using of aplic_genmsi_barrier().
>>
> 
> 
>> Technically there is no need for read_lock_irqsave() and
>> read_unlock_irqrestore() around reading of ->guest_file_id, as a write
>> cannot happen in parallel: any update to ->guest_file_id for a vCPU
>> will happen either in imsic_migrate_vcpu() itself or before the vCPU
> 
> 
>> first gains control (in continue_new_vcpu()), so there is no concurrent
>> access to it in imsic_migrate_vcpu(). The lock is added here for
>> potential future cases.
>>
>> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
>> against silent incorrect behaviour or unexpected panics in guest VMs until
>> the function is fully implemented.
>>
>> imsic_map_guest_file() and imsic_update_state() are stubs for now and will
>> be introduced later in a separate patch.
> "will be introduced later" would be stale in the future.

I will drop that part from the commit message.

>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> 
>>
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index 5de4594961..5e9f6995e4 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -27,6 +27,7 @@
>>   #include <xen/xvmalloc.h>
>>   
>>   #include <asm/aia.h>
>> +#include <asm/aplic.h>
>>   #include <asm/imsic.h>
>>   
>>   #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
>> @@ -60,6 +61,12 @@ static unsigned int __ro_after_init guest_num_msis;
>>   #define IMSIC_DISABLE_EITHRESHOLD   1
>>   #define IMSIC_ENABLE_EITHRESHOLD    0
>>   
>> +#define imsic_csr_read(c)           \
>> +({                                  \
>> +    csr_write(CSR_SISELECT, (c));   \
>> +    csr_read(CSR_SIREG);            \
>> +})
>> +
>>   #define imsic_csr_write(c, v)   \
>>   do {                            \
>>       csr_write(CSR_SISELECT, c); \
>> @@ -141,6 +148,11 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
>>       return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
>>   }
>>   
>> +void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
>> +{
>> +    BUG_ON("unimplemented\n");
>> +}
>> +
>>   void __init imsic_ids_local_delivery(bool enable)
>>   {
>>       if ( enable )
>> @@ -242,6 +254,15 @@ void imsic_irq_disable(unsigned int irq)
>>       spin_unlock(&imsic_cfg.lock);
>>   }
>>   
>> +static bool imsic_local_is_pending(unsigned int id)
>> +{
>> +    unsigned long isel =
>> +        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
>> +    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
>> +
>> +    return !!(imsic_csr_read(isel) & bit);
>> +}
>> +
>>   /* Callers aren't intended to changed imsic_cfg so return const. */
>>   const struct imsic_config *imsic_get_config(void)
>>   {
>> @@ -436,6 +457,11 @@ void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>>       /* Nothing to do */
>>   }
>>   
>> +int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>>   int cf_check vcpu_imsic_init(struct vcpu *v)
>>   {
>>       struct vimsic_state *imsic_state;
>> @@ -497,6 +523,27 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
>>           on_selected_cpus(cpumask_of(cpu), func, data, 1);
>>   }
>>   
>> +/*
>> + * Ensure that all the MSIs the APLIC has already generated for the hart this
>> + * runs on have really reached the hart's IMSIC.
>> + *
>> + * The barrier is the one described by the AIA specification in
>> + * "Synchronizing interactions between a hart and the APLIC": ask the APLIC to
>> + * send an MSI to the hart itself and wait until it shows up as pending in the
>> + * hart's own interrupt file. As it says nothing about MSIs on their way to
>> + * any other hart, it has to be executed by the pCPU owning the interrupt file
>> + * the MSIs were being sent to.
>> + */
>> +static void cf_check imsic_aplic_sync(void *data)
> It seems data arg is not used here

It will be renamed to `unused` in the v3 but we still need to have it 
becuase how this function is called through imsic_call_on_cpu().

>> +{
>> +    imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);
>> +
>> +    aplic_genmsi_barrier();
>> +
>> +    while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
>> +        cpu_relax();
>> +}
>> +
>>   static void cf_check imsic_vsfile_local_clear(void *data)
>>   {
>>       unsigned int i;
>> @@ -837,6 +884,10 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       struct imsic_vsfile_data vsfile_data = {
>>           .nr_eix = nr_hw_eix,
>>       };
>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>> +    unsigned long flags;
>> +    unsigned int old_vsfile_id;
>> +    unsigned int old_vsfile_cpu;
>>   
>>       /*
>>        * The scheduler can mark a freshly created vCPU's unit as migrated and
>> @@ -848,8 +899,22 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       if ( v->arch.last_cpu == NR_CPUS )
>>           return;
>>   
>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>> +    old_vsfile_id = imsic_state->guest_file_id;
>> +    old_vsfile_cpu = imsic_state->vsfile_cpu;
>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>> +
>> +    /*
>> +     * We don't support SW interrupt files at the moment. Bail out before
>> +     * anything is touched, as the old file has no owning pCPU in that case
>> +     * and there is nothing to retarget the producers away from.
>> +     */
>> +    if ( old_vsfile_cpu == NR_CPUS )
>> +        panic("IMSIC SW-file isn't supported\n");
>> +
>>       /*
>>        * At this point, all interrupt producers are still using the old IMSIC
>> +     * VS-file so we first move all interrupt producers to the new IMSIC
>>        * VS-file.
>>        */
>>   
>> @@ -870,5 +935,43 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       /* Zero-out new IMSIC VS-file */
>>       imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
>> +    /* Update G-stage mapping for the new IMSIC VS-file */
>> +    if ( imsic_map_guest_file(v, new_vsfile_hgei) )
>> +    {
>> +        domain_crash(v->domain, "Migration to hw interrupt file failed\n");
>> +
>> +        return;
>> +    }
>> +
>> +    imsic_update_state(v, new_vsfile_hgei);
>> +
> This gets rewritten later in the series by "xen/riscv: introduce IMSIC h/w
> interrupt file attaching to vcpu", which moves the clear/map/update sequence
> into imsic_vsfile_acquire() (and adds vgein_release() on the error path).
> 
> Could imsic_vsfile_acquire() be introduced here (or in a prep patch) instead,
> so that the later patch only adds imsic_vsfile_attach()? That would avoid the
> churn.
> 

It could, I just thought that it will be easier to justify necessity of 
it by introduction in "xen/riscv: introduce IMSIC h/w interrupt file 
attaching to vcpu". But I am okay to move it to this patch.

Thanks.

~ Oleksii


