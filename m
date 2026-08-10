Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD147C5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 15:05:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387579.1628843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtRYW-0007b8-KA; Mon, 10 Aug 2026 15:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387579.1628843; Mon, 10 Aug 2026 15:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtRYW-0007b1-H2; Mon, 10 Aug 2026 15:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1387579;
 Mon, 10 Aug 2026 15:04:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtRYU-0007av-Oh
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 15:04:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtRYT-003qFa-O0
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 17:04:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79e883-8faa-0a2a0a5109dd-0a2a450aafe0-48
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:04:45 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79e88d-f2d2-0a2a450a0019-d1558029a806-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:04:45 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso31576355e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 08:04:45 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995420bd1csm441680165e9.3.2026.08.10.08.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2026 08:04:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786374285; x=1786979085; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skTb9mvllojkrjztHhBL1PK1ndFafhM1LatERGnQ4Fg=;
        b=qKFRnzlqlpR0qTaa6/gwyMv89LUAPHW5ZIyNT0eLlaGIQfpZ2YgKYyWxnWXW4TZyaA
         zOK9rdcumyTFR+nWjN2zhRXhDhXeHj4bC8Z9nz11IS1hpOaytiB2gVweAhGVDAWv4Cvt
         Tbl14Rk54e8tT8bHFIoMZF5eQo6TdEQXhJw8tMqL5lrm7Hiz2ibtcBtO4WNlRuJfWHOX
         3BApc2uI24RgDIJ+MBm9LJ29Fsa4KcOSR9zHf8rbb/qRKhmEJwjTLXejIBllKx9oEIUl
         IbB9FOKtdWKgQg6nqQDaF9yB0LbTGWr8n5X3KoL14dFtcqIUtpI+aA6GcUJPIo7EB46P
         Q8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786374285; x=1786979085;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skTb9mvllojkrjztHhBL1PK1ndFafhM1LatERGnQ4Fg=;
        b=IU/egJf5m3pwV6q/MlELzaePYE+6yZL5ujErFBNVzPo+OMeMo4tl+rxWXNc0E9AWYi
         xUQJ8siqOQMVfn2INGp2Y67Zo5lXXwpg6atVi0TMTBZcdd5FQkaL922GdIi7jE7OAnaT
         ZubFlPixz9pcNECRixjopOKDtIlokH/WcLw1UFb2fArPKY5QxMLdt+NC10aeBaeRUKTO
         CHxtNM6bU4Dooz0jj7hN+bg0S/bhf5o8kDZALRSUKEsIREf/Gmv284Uy0UVwaPrl3gCy
         u+qGUPGt5TBA5vQ6J9Ppir2ZjEQCeH+0FBvWx3/3hu2eclB9eB5EDW5a8ESd2wzMn7kW
         mInA==
X-Gm-Message-State: AOJu0YzG+o8i3GhWOzfMEfGYVFm/mtQwIe0sBkeRMCDal4L5Tm9R2fR3
	2K2skqj9tlp0VxNgM51+7X973HM1Y163M4TuxGbvU6cr8NLPf+llRECX
X-Gm-Gg: AR+sD12CAbceWdfhQqI/klZ/4Wp9RHeOQOljFw44b0iAci/W9Wu2jibJ4GC6Pmn9Jt2
	2PeMwLHJH+iD15zFeOm0N9ngqa53aqRVC/llJDcJvv6TSLBVUCvEUN3Z/O7ZMN9g+LV9Uu1Jx7n
	93uE8stYZpTw9d9sx1v6reUNdHcJTNY9EB/qCZFrPURaKWqFCHyfMg8Ig760Xv0VL7bUQl4VLSM
	z66m39YL5R39tDdATvuDeOb6oK1FT+2f6t5JZUh6T6TvNubpdham5DR+2wc+MZVg1QezDM4KfGZ
	0T3LqkKfMqDpnT+UfC4M8XxgfHR45aRZrh6XGLU8vidr3+2yulLVcCaZiOyAFf2JFQCmevZdDjp
	U1k3kuZPjabkBvU7ySeiXQFG6ucAJhClAi5MDsEaO6Mh+RmTRw/wELwp+BxpvbPp2ViG/7kX6me
	ZixoA7LE9QZof79Uxz/dwi39LhW/4d8/FGAgGHgqY9x8aUX8WlX+pe1HdI6joR805Eio6JpupK3
	lWQ0I3omNwIAmYIlm502FDeF9InLrz+el00MomdRac=
X-Received: by 2002:a05:600c:45d5:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4996247a563mr23707995e9.8.1786374284985;
        Mon, 10 Aug 2026 08:04:44 -0700 (PDT)
Message-ID: <293a08d8-ff96-4726-b713-bc2d14973ca4@gmail.com>
Date: Mon, 10 Aug 2026 17:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/17] xen/riscv: add basic VGEIN management for AIA
 guests
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786368748.8631fc262581453bbf619ec5b2062170.19febdfed5f000e099@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786368748.8631fc262581453bbf619ec5b2062170.19febdfed5f000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1786374285-53CD3CFC-7EC80455/10/73395122804
X-purgate-type: spam
X-purgate-size: 9889



On 8/10/26 3:32 PM, Baptiste Le Duc wrote:
>> It was decided to add support for IMSIC from the start instead of having APLIC
>> operate in direct delivery mode, as it requires a trap-and-emulation approach,
>> which is not optimal from a performance standpoint.
>>
>> AIA provides a hardware-accelerated mechanism for delivering external
>> interrupts to domains via "guest interrupt files" located in IMSIC.
>> A single physical hart can implement multiple such files (up to GEILEN),
>> allowing several virtual harts to receive interrupts directly from hardware.
>>
>> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
>> for systems implementing AIA specification. Each CPU maintains
>> a bitmap describing which guest interrupt files are currently in use.
>>
>> Add helpers to initialize the bitmap based on the number of available
>> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
>> when no longer needed. When assigning a VGEIN, the corresponding value
>> is written to the VGEIN field of the guest hstatus register so that
>> VS-level external interrupts are delivered from the selected interrupt
>> file.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
>> index e31c9c2d24..4f7f46f58f 100644
>> --- a/xen/arch/riscv/aia.c
>> +++ b/xen/arch/riscv/aia.c
>> @@ -1,11 +1,33 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>> +#include <xen/bitmap.h>
>> +#include <xen/cpu.h>
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
> 
> Add a #include <xen/percpu.h> here instead of in aia.h.

Sorry, but I’m a little confused here. <asm/aia.h> doesn’t include 
<xen/percpu.h>.

> 
>>   #include <xen/sections.h>
>> +#include <xen/sched.h>
>> +#include <xen/spinlock.h>
>>   #include <xen/types.h>
>> +#include <xen/xvmalloc.h>
>>   
>> +#include <asm/aia.h>
>>   #include <asm/cpufeature.h>
>> +#include <asm/csr.h>
>> +#include <asm/current.h>
>> +
>> +struct vgein_ctrl {
>> +    unsigned long bmp;
>> +    spinlock_t lock;
>> +    struct vcpu **owners;
>> +    /* The least-significant bits are implemented first, apart from bit 0 */
>> +    unsigned int geilen;
>> +};
>> +
>> +/*
>> + * VGEIN control structure for each physical CPU to track which VS (guest)
>> + * interrupt file IDs are in use.
>> + */
>> +static DEFINE_PER_CPU(struct vgein_ctrl, vgein);
>>   
>>   static bool __ro_after_init _aia_usable;
>>   
>> @@ -14,10 +36,133 @@ bool aia_usable(void)
>>       return _aia_usable;
>>   }
>>   
>> +static int vgein_init(unsigned int cpu)
> 
> Could we call this function with a different cpu arg than the current
> one running? If yes, we would read hgeie of not the cpu we wanted.

Considering that it touches the CSR_HGIEI register, it can only be 
called on the currently running CPU.

That’s why I suggested in one of my replies to Jan B. that I would drop 
the argument altogether for this function.

>> +{
>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
>> +
>> +    csr_write(CSR_HGEIE, -1UL);
>> +    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
>> +    csr_write(CSR_HGEIE, 0);
>> +
>> +    printk("cpu%u.geilen=%u\n", cpu, vgein->geilen);
> 
>> +
>> +    if ( !vgein->geilen )
>> +        return -EOPNOTSUPP;
>> +
>> +    vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen);
>> +    if ( !vgein->owners )
>> +        return -ENOMEM;
>> +
>> +    spin_lock_init(&vgein->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static int cf_check cpu_callback(struct notifier_block *nfb, unsigned long action,
>> +                        void *hcpu)
>> +{
>> +    unsigned int cpu = (unsigned long)hcpu;
>> +    int rc = 0;
>> +
>> +    switch ( action )
>> +    {
>> +    case CPU_STARTING:
>> +        rc = vgein_init(cpu);
>> +        if ( rc )
>> +            printk("AIA: failed to init vgein for CPU%u\n", cpu);
>> +        break;
>> +    }
>> +
>> +    return notifier_from_errno(rc);
>> +}
>> +
>> +static struct notifier_block cpu_nfb = {
>> +    .notifier_call = cpu_callback,
>> +};
>> +
>>   void __init aia_init(void)
>>   {
>> +    int rc;
>> +
>>       if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
>> +    {
>> +        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
>>           return;
>> +    }
>> +
>> +    if ( (rc = vgein_init(0)) )
> 
> Why `0` rather than smp_processor_id()? As described above vgein_init() reads CSR_HGEIE
> of the current hart but stores the result into per_cpu(vgein, cpu), so the two
> must agree.

aia_init() is executed on boot cpu only so it uses 0 as Xen boot cpu is 
always 0. But it won't be an issue anymore as I mentioned above an 
argument of vgein_init() will be dropped anyway so it will be guaranteed 
that a correct CPU is used.

> 
>> +    {
>> +        dprintk(XENLOG_ERR, "vgein_init() failed: %d\n", rc);
>> +        return;
>> +    }
>>   
>>       _aia_usable = true;
>> +
>> +    register_cpu_notifier(&cpu_nfb);
>> +}
>> +
>> +unsigned int vgein_assign(struct vcpu *v)
>> +{
>> +    unsigned int vgein_id;
>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
> 
> What happens if v->processor change between vgein_assign() and
> vgein_release? Because it seems in such case the release will hit a
> different pCPU's bitmap: the original bit will leak and an unrelated
> CPU's bit will be cleared under another vCPU's feet.

So, if v->processor changes between the calls to vgein_assign() and 
vgein_release(), it means that migration has happened. If migration has 
happened, then it is the responsibility of the migration code to 
properly assign the new vgein and release the previous one.

All other cases where vgein_release() is called are when the vCPU is 
dying, so everything is okay there as migration cannot happen.


> 
>> +    unsigned long *bmp = &vgein->bmp;
>> +    unsigned long flags;
>> +
>> +    if ( !vgein->geilen )
>> +        return 0;
>> +
>> +    spin_lock_irqsave(&vgein->lock, flags);
>> +    /*
>> +     * The vgein_id shouldn't be zero, as it will indicate that no guest
>> +     * external interrupt source is selected for VS-level external interrupts
>> +     * according to RISC-V privileged spec:
>> +     *   Hypervisor Status Register (hstatus) in RISC-V privileged spec:
>> +     *
>> +     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
>> +     *   a guest external interrupt source for VS-level external interrupts.
>> +     *   VGEIN is a WLRL field that must be able to hold values between zero
>> +     *   and the maximum guest external interrupt number (known as GEILEN),
>> +     *   inclusive.
>> +     *   When VGEIN=0, no guest external interrupt source is selected for
>> +     *   VS-level external interrupts.
>> +     *
>> +     * So start to search from bit number 1.
>> +     */
>> +    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
>> +
>> +    if ( vgein_id > vgein->geilen )
>> +        vgein_id = 0;
>> +    else
>> +    {
> 
> Potential index error, because above you did:
> 
>      vgein->owners = xvzalloc_array(struct vcpu*, vgein->geilen)
> 
> so valid index are 0...(vgein->geilen-1). Adopt either
> one of those two options:
>      1. vgein->owners[vgein_id-1] = v
>      2. vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen+1) in
>         vgein_init()
> 
> I think `2` could be better to have vgein->owners replicated hgeie CSR but
> it would left the first entry read-only.

I've found that too during prepare a reply to Jan B. so fixed it already 
in v2. I've decided to go with what you suggested in 2.

> 
>> +        __set_bit(vgein_id, bmp);
>> +        vgein->owners[vgein_id] = v;
>> +    }
>> +
>> +    spin_unlock_irqrestore(&vgein->lock, flags);
>> +
>> +#ifdef VGEIN_DEBUG
> 
> VGEIN_DEBUG is not defined anywhere in the patch, please use
> gdprintk(XENLOG_DEBUG, ...) directly, or drop this branch.

It is intentionally not defined. If a user needs additional VGEIN debug 
information, they should define it themselves, as it can produce a 
pretty large amount of logs due to, for example, the migration process, 
where vgein_assign() and vgein_release() are used quite actively.

> 
>> +    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
>> +           __func__, v, vgein_id, v->processor, *bmp);
>> +#endif
>> +
>> +    return vgein_id;
>> +}
>> +
>> +void vgein_release(struct vcpu *v, unsigned int vgein_id)
>> +{
>> +    unsigned long flags;
>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
>> +
>> +    if ( !vgein_id )
>> +        return;
>> +
>> +    spin_lock_irqsave(&vgein->lock, flags);
>> +    __clear_bit(vgein_id, &vgein->bmp);
>> +    vgein->owners[vgein_id] = NULL;
>> +    spin_unlock_irqrestore(&vgein->lock, flags);
>> +
>> +#ifdef VGEIN_DEBUG
>> +    gprintk(XENLOG_DEBUG, "%s: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
>> +           __func__, vgein_id, v->processor, vgein->bmp);
>> +#endif
>>   }
>> diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
>> index aaa4bf91fc..c67be0069a 100644
>> --- a/xen/arch/riscv/include/asm/aia.h
>> +++ b/xen/arch/riscv/include/asm/aia.h
>> @@ -3,8 +3,16 @@
>>   #ifndef RISCV_AIA_H
>>   #define RISCV_AIA_H
>>   
>> +#include <xen/percpu.h>
> 
> asm/aia.h needs neither <xen/percpu.h> nor <xen/spinlock.h> as struct
> vgein_ctrl and the per-CPU variable both live in aia.c. Please drop them
> and add <xen/percpu.h> in aia.c
> 

Yes, it is redundant code that I missed removing. I’ve already noticed 
it and removed it in v2.

Thanks.

~ Oleksii


