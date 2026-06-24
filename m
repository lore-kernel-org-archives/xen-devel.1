Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD0CCDE002
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 15:21:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1345107.1604096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPPs-0003sH-BU; Wed, 24 Jun 2026 15:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345107.1604096; Wed, 24 Jun 2026 15:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPPs-0003sA-8L; Wed, 24 Jun 2026 15:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1345107;
 Wed, 24 Jun 2026 15:21:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcPPr-0003s2-8B
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:21:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcPPq-0003Rv-Hm
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 17:21:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bf5ef-bab6-0a2a0a5309dd-0a2a4506ae08-12
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:21:26 +0200
Received: from [209.85.208.172] (helo=mail-lj1-f172.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bf5f6-08de-0a2a45060019-d155d0accc92-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:21:26 +0200
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-396bed274b9so12108461fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 08:21:26 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad6957a694sm1853643e87.49.2026.06.24.08.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:21:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782314486; x=1782919286; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aR8MpbYZMGz4/159CeTCHh6ap+/TrCZYEut089ZbtnY=;
        b=hRr3Wf36aWHCk7VpBsG0xaH4oGVlMyimBDi4bZwv8PKH/KoyT3M0fXow/vYmSRJQd6
         UK4n2SPW2feNvNLxeV5CPbB0cn313scPKJxT/85CqXjv3fXnwi8vhcze3QQC+t75MNry
         YmsjsrCMmn10J/5KrZs39PvBIbsG0heP5KWI+y42sSw9awFyXw9wiFOKwIzDo/qOkN66
         i5yq0hzNqozJKEdQ5MIhds9Y1pFTyZodvWVSQNVfd7hKROo53XCW/Xe/Rc60S/zdFnQ2
         ZiBA6fHWqnZ38xQd/GwI/vOsjBsafMCmd5M4thFvC/H2s+R2kwi70OxAiSdd7Nr8Xu7W
         9a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782314486; x=1782919286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aR8MpbYZMGz4/159CeTCHh6ap+/TrCZYEut089ZbtnY=;
        b=gLL0je/bl/OE6CgoZngtSV/mz7SPFif7Z3/0ExZRdz4uAKg9UGqGzpk7ApSJ+j82a6
         HgMTmEfFw/BP04PzbnZ+cL+kGqbbVUuba12anXif+N2WWK9GKgCpqHN9EX2HTgbmj2Wp
         Zte4EKjF825JUv4RBUsODtHRYxBvUjE5Rb2mseh/GgKipE20EVCe7MxDfKhMILHDknZ4
         SWh4gYPCw/3aW53XP3r4dDcLPdXeYuDWLhkMmcefnJizxZTL/3uYer7WNZMY7nwuZDT/
         MzIaeGPbOltxiz7dJvcvE+rYGvygKNiRGddH/MJqe4ga/3HKOG7XX6n5j9jtdszVP6+t
         LTgw==
X-Forwarded-Encrypted: i=1; AHgh+RquWDNRqS6UoSjB1R8hHqIGKAkW9l7iRmCdGuK2tHGrQh41Pg1LqVao3W7w5/+sjxWwexMqFynhCtY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8g8dKmqjH4Yoet/6yuPawdRYIYry/+oRqEPtqGxdE7ueRNHXO
	GXwRgIX9FV1Lwy1r6MmoqX7Q+5F98Z1XUsYZ37HaFbXeiix5r/z1Cf1M
X-Gm-Gg: AfdE7cldKZqKv9l/rR9IKtk8yAm1x8nsrIY87QNZNL45T79jL0Rbf2RaVDjj4IkllQ+
	IgcsoKmQhDsDkwuc60quDPen87sL7xG2lWuw3XUGKN7RF9i+g4HuXMBMdzrFH7MEY4wLTwLcEgr
	7vhcHRrmstcShlaL0dUVCXUZ2/0eQ28Orvr7hQkrC65XENwFguUhFgtheekXFm7ZcJ12NV5Tm03
	N44iEa8vSVF8gCo6pwjLR5Ie5zeedVveLYh+zDpV0D13RPFXS9WveOLSqWFhXOooxmiRCshDF3g
	/BVs+dGcY8JIZZpHQzA7UTjRvUMmkD4sU/UIm+q8KCAFNZxusmvszdv8cq61MmjeG7XU+SiIM6v
	wF5N1AjxqtR2Usx/JOGGdnzT066tFr71K5mQBL6VqUOhXcqGCgWeXRfFUitdO5RtwN3mYu9F7GO
	fKTUinrTutcc+bDSy+kbN430uwafynM/7RVWeyqMu20CIVtZUXd13ZDb9c4jvmK0kHn9s=
X-Received: by 2002:ac2:4949:0:b0:5ad:4dbe:907a with SMTP id 2adb3069b0e04-5ae9d55028cmr911247e87.11.1782314485349;
        Wed, 24 Jun 2026 08:21:25 -0700 (PDT)
Message-ID: <b4770ce2-9456-4dae-a322-c8e3f9239472@gmail.com>
Date: Wed, 24 Jun 2026 17:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <0458468cc5a6db911a9acc64f4c8cf17ceebe4c6.1781693963.git.oleksii.kurochko@gmail.com>
 <3a1aca27-cc18-4b57-bb31-c50161b8c261@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3a1aca27-cc18-4b57-bb31-c50161b8c261@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782314486-4392B68D-081A3D4F/10/73395122804
X-purgate-type: spam
X-purgate-size: 12171



On 6/22/26 5:57 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/device.c
>> @@ -0,0 +1,102 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/iocap.h>
>> +#include <xen/rangeset.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/intc.h>
>> +
>> +int map_irq_to_domain(struct domain *d, unsigned int irq,
>> +                      bool need_mapping, const char *devname)
>> +{
>> +    int res;
>> +
>> +    res = irq_permit_access(d, irq);
> 
> Such generally needs an XSM check up front, the more that the function isn't
> __init, i.e. is (apparently) intended for runtime use as well.

I think it really should be __init as it is used only during domain 
construction (boot/build-time only). For xl-created domUs it should be 
used route_irq_to_guest() called from XEN_DOMCTL_bind_pt_irq hypercall.

I will add __init for map_irq_to_domain() and correspondingly for 
map_device_irqs_to_domain().


> 
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Unable to permit %pd access to IRQ %u\n", d, irq);
>> +        return res;
>> +    }
>> +
>> +    if ( need_mapping )
>> +    {
>> +        /*
>> +         * Checking the return of vintc_reserve_virq is not
>> +         * necessary. It should not fail except when we try to map
>> +         * the IRQ twice. This can legitimately happen if the IRQ is shared.
>> +         */
>> +        vintc_reserve_virq(d, irq);
>> +
>> +        res = route_irq_to_guest(d, irq, irq, devname);
>> +        if ( res < 0 )
>> +        {
>> +            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
>> +            return res;
>> +        }
>> +    }
>> +
>> +    dt_dprintk("  - IRQ: %u\n", irq);
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * map_device_irqs_to_domain retrieves the interrupts configuration from
>> + * a device tree node and maps those interrupts to the target domain.
>> + *
>> + * Returns:
>> + *   < 0 error
>> + *   0   success
>> + */
>> +int map_device_irqs_to_domain(struct domain *d,
>> +                              struct dt_device_node *dev,
>> +                              bool need_mapping,
>> +                              struct rangeset *irq_ranges)
>> +{
>> +    unsigned int i, nirq = dt_number_of_irq(dev);
>> +
>> +    if ( irq_ranges )
>> +        return -EOPNOTSUPP;
>> +
>> +    /* Give permission and map IRQs */
>> +    for ( i = 0; i < nirq; i++ )
>> +    {
>> +        int res, irq;
>> +        struct dt_raw_irq rirq;
>> +
>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>> +                   i, dt_node_full_name(dev));
>> +            return res;
>> +        }
>> +
>> +        /*
>> +         * Don't map IRQ that have no physical meaning
>> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
>> +         */
> 
> Nit: Does this comment mean to use singular or plural for IRQ?

Plural would be better here.

> 
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -538,10 +538,11 @@ int __init imsic_init(const struct dt_device_node *node)
>>   
>>   static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
>>   {
>> +    paddr_t base = GUEST_IMSIC_S_BASE;
>>       paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;
>>       __be32 regs[4] = {
>> -        cpu_to_be32(GUEST_IMSIC_S_BASE >> 32),
>> -        cpu_to_be32(GUEST_IMSIC_S_BASE),
>> +        cpu_to_be32(base >> 32),
>> +        cpu_to_be32(base),
>>           cpu_to_be32(size >> 32),
>>           cpu_to_be32(size),
>>       };
> 
> What is this change about?

It doesn't really make sense. I think it I added it to fix type issue 
when GUEST_IMSIC_S_BASE was incorrectly wrapped. I will drop it.

> Does it perhaps belong into an earlier patch?

Yes, it should be part of prev. commit.

> 
>> --- a/xen/arch/riscv/include/asm/intc.h
>> +++ b/xen/arch/riscv/include/asm/intc.h
>> @@ -13,6 +13,7 @@ enum intc_version {
>>   };
>>   
>>   struct cpu_user_regs;
>> +struct domain;
>>   struct irq_desc;
>>   struct kernel_info;
>>   struct vcpu;
>> @@ -32,6 +33,9 @@ struct intc_hw_operations {
>>       /* hw_irq_controller to enable/disable/eoi host irq */
>>       const struct hw_interrupt_type *host_irq_type;
>>   
>> +    /* hw_irq_controller to enable/disable/eoi guest irq */
>> +    const struct hw_interrupt_type *guest_irq_type;
> 
> It's likely my limited RISC-V knowledge that I find this extremely odd:
> Separate struct hw_interrupt_type-s for host and guest?

The guest and host interrupt controllers may handle some 
hw_irq_controller operations differently, even though the operations 
themselves are conceptually the same. The hw_irq_controller interface 
provides fairly abstract interrupt controller operations, but the 
underlying implementation may differ depending on whether the controller 
is used by the host or a guest.

As an example, the Arm code already follows this approach:

/* XXX different for level vs edge */
static hw_irq_controller gicv2_host_irq_type = {
     .typename     = "gic-v2",
     .startup      = gicv2_irq_startup,
     .shutdown     = gicv2_irq_shutdown,
     .enable       = gicv2_irq_enable,
     .disable      = gicv2_irq_disable,
     .ack          = gicv2_irq_ack,
     .end          = gicv2_host_irq_end,
     .set_affinity = gicv2_irq_set_affinity,
};

static hw_irq_controller gicv2_guest_irq_type = {
     .typename     = "gic-v2",
     .startup      = gicv2_irq_startup,
     .shutdown     = gicv2_irq_shutdown,
     .enable       = gicv2_irq_enable,
     .disable      = gicv2_irq_disable,
     .ack          = gicv2_irq_ack,
     .end          = gicv2_guest_irq_end,
     .set_affinity = gicv2_irq_set_affinity,
};

These implementations reuse almost all interrupt controller operations, 
differing only in the .end callback.

In my case, I have a similar situation with the PLIC implementation, 
where the .ack and .end operations differ between the host and guest 
cases. However, I was planning to upstream the PLIC support a bit later.

> 
>> @@ -62,6 +66,8 @@ struct vintc_ops {
>>   };
>>   
>>   struct vintc {
>> +    unsigned int irq_nums;
> 
> I did ask before: Which word does "nums" stand for?

I will rename it to nr_irqs.

> 
>> @@ -106,12 +124,25 @@ int domain_vintc_init(struct domain *d)
>>           break;
>>       }
>>   
>> +    if ( !ret )
>> +    {
>> +        d->arch.vintc->used_irqs =
>> +            xvzalloc_array(unsigned long, BITS_TO_LONGS(d->arch.vintc->irq_nums));
>> +        if ( !d->arch.vintc->used_irqs )
>> +            ret = -ENOMEM;
>> +    }
>> +
>>       return ret;
>>   }
>>   
>>   void domain_vintc_deinit(struct domain *d)
>>   {
>>       const enum intc_version ver = intc_hw_ops->info->hw_version;
>> +    unsigned int virq;
>> +
>> +    for ( virq = 0; virq < d->arch.vintc->irq_nums; virq++ )
> 
> Here you de-reference d->arch.intc. One of the purposes of ...
> 
>> +        if ( test_bit(virq, d->arch.vintc->used_irqs) )
>> +            release_guest_irq(d, virq);
>>   
>>       switch ( ver )
>>       {
>> @@ -122,4 +153,14 @@ void domain_vintc_deinit(struct domain *d)
>>       default:
>>           break;
>>       }
>> +
>> +    XVFREE(d->arch.vintc->used_irqs);
> 
> ... this is to allow the function to be idempotent, i.e. to recognize that
> it was called before (or no setup was done at all), and hence it doesn't
> need to do anything.

I will add before for loop:
      if ( !d->arch.vintc )
         return;

> 
>> +void release_irq(unsigned int irq, const void *dev_id)
>> +{
>> +    struct irq_desc *desc;
>> +    unsigned long flags;
>> +    struct irqaction *action, **action_ptr;
>> +
>> +    desc = irq_to_desc(irq);
>> +
>> +    spin_lock_irqsave(&desc->lock,flags);
> 
> Nit: Missing blank after comma (again at least once further down).

Thanks. I will fix it.

> 
>> +    action_ptr = &desc->action;
>> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
>> +    for ( ;; )
>> +    {
>> +        action = *action_ptr;
>> +        if ( !action )
>> +        {
>> +            printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n", irq);
>> +            spin_unlock_irqrestore(&desc->lock, flags);
>> +            return;
>> +        }
>> +
>> +        if ( action->dev_id == dev_id )
>> +            break;
>> +
>> +        action_ptr = &action->next;
>> +    }
>> +
>> +    /* Found it - remove it from the action list */
>> +    *action_ptr = action->next;
>> +#else
>> +    action = *action_ptr;
>> +    *action_ptr = NULL;
>> +#endif
>> +
>> +    /* If this was the last action, shut down the IRQ */
>> +    if ( !desc->action )
>> +    {
>> +        desc->handler->shutdown(desc);
>> +        __clear_bit(_IRQ_GUEST, &desc->status);
>> +    }
>> +
>> +    spin_unlock_irqrestore(&desc->lock,flags);
>> +
>> +    /* Wait to make sure it's not being used on another CPU */
>> +    do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
> 
> Can you explain to me what the purpose of this barrier is?

if  do_IRQ() was called and:
     desc->status |= IRQ_INPROGRESS;
was called we have to wait while irq will be handled to avoid NULL 
pointer derefenece caused by in do_IRQ():
     action = desc->action;

So if release_irq() and do_irq() are called on different CPUs we want to 
be sure that do_IRQ() make desc->status visiable for all CPUs.

> 
>> +int release_guest_irq(struct domain *d, unsigned int virq)
>> +{
>> +    struct irq_desc *desc = irq_to_desc(virq);
>> +    struct irq_guest *info;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&desc->lock, flags);
>> +
>> +    if ( !test_bit(_IRQ_GUEST, &desc->status) )
>> +        goto unlock_err;
>> +
>> +    info = irq_get_guest_info(desc);
>> +    if ( d != info->d )
>> +        goto unlock_err;
>> +
>> +    spin_unlock_irqrestore(&desc->lock, flags);
>> +
>> +    release_irq(desc->irq, info);
>> +    xvfree(info);
> 
> So you drop the lock keeping the info associated with desc in place. How
> do you know what you free here is the correct thing, and isn't in use
> elsewhere?
> 

The object freed is captured under desc->lock (info = 
irq_get_guest_info(desc)), so it is by construction the dev_id of the 
action attached to this desc, it can't be a stale or wrong pointer.

"In use elsewhere" splits into two cases:

An in-flight interrupt handler on another CPU. The guest handler 
dereferences info (info->d). This is why the free is ordered after 
release_irq(): release_irq() detaches the action and then spins on 
_IRQ_INPROGRESS before returning, so once it returns no CPU is in the 
handler, and only then do we xvfree(info).

A second release_guest_irq() for the same vIRQ. You're right that, as 
originally written, dropping the lock left _IRQ_GUEST set and the action 
attached, so a concurrent caller could re-derive and double-free the 
same info. In practice the sole caller is domain_vintc_deinit() 
(serialised per-domain teardown), but the function shouldn't rely on 
that. I've changed it to clear _IRQ_GUEST while still holding 
desc->lock; a concurrent caller now fails the _IRQ_GUEST check and bails 
out, so exclusive ownership of info is provable from the lock rather 
than from caller serialisation:

diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 2f9461a23b5f..69b57eaf95f7 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -311,6 +311,8 @@ int release_guest_irq(struct domain *d, unsigned int 
virq)
      if ( d != info->d )
          goto unlock_err;

+    __clear_bit(_IRQ_GUEST, &desc->status);
+
      spin_unlock_irqrestore(&desc->lock, flags);

      release_irq(desc->irq, info);


Thanks.

~ Oleksii

