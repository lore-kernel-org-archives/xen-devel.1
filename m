Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABE7C61DBC
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 16:06:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399334.1635467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wytfa-000110-KY; Tue, 25 Aug 2026 16:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399334.1635467; Tue, 25 Aug 2026 16:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wytfa-00010t-H8; Tue, 25 Aug 2026 16:06:38 +0000
Received: by outflank-mailman (input) for mailman id 1399334;
 Tue, 25 Aug 2026 16:06:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wytfZ-00010n-8o
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 16:06:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wytfY-00Brca-Ag
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 18:06:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a8dbd70-bab6-0a2a0a5309dd-0a2a4502c59a-26
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 18:06:36 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a8dbd8c-6ca4-0a2a45020019-d155da34b888-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 18:06:36 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c20e70a0962so764138266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 09:06:36 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a88ac5csm19461166b.40.2026.08.25.09.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 09:06:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787673996; x=1788278796; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDijApkDgns953IQEs3qT974eR4YLNg3THaJQ2Gagys=;
        b=Pb0LnHTTcA51T2tbNl2LvBGzuUw4Y0+vU2hB9knMotSBpEcELnOlqFpTKT5k0TyD8i
         nQH/WzQ1q7ccsiwvG//4siWd7VI2b3kFgWs4aCJmGwZxa8kDW09UQ9dB0AeQaXygk9rv
         Zqpt2IC7yiikEkhCO9+tWfofengc/wX5biQvuBe5DWfky02pJ92T71XTEGSTYW5z7nAx
         2Rup+xadK46HSZstS0CaoDRRhQnVNKeZTIEE4MCwUu3HyajquAOBnFhG1PAjq4mwer0/
         q697BRYXcduP2hAaQkb5Keb6VBo6l/bn2Md1shq7lWlyNN4GWRgGW98tVHhVl90TIJ3z
         +wFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787673996; x=1788278796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDijApkDgns953IQEs3qT974eR4YLNg3THaJQ2Gagys=;
        b=GBgNx5IX1CHTi/wmtUa8WbHnVtvjn/gKJiNT7yck9s0n3eWIvvLi3vBEVQRc8EuKOt
         j+VdQSNSuy7EU4F4QzYTYkJeR6eAVjqcLJlBlQccuOacYjNuZ9BTgpZtE36BxSeIh7DW
         pryy7ZdvD4fWpl+ZiQWNi3NpDQN7EUots3Z5CGhW2HG38IGVIZat7TMqoOAqum/yFm/Q
         LU639Ex3vhqKTr26AvbWWh4sRRcIOw0ATVifufCv75cCkH7tmB4OD18ItGKbrChktm1i
         niC0Net7WDE8RlIfDEw9769E8t6Kxed/+g7k9QAmvMJpK/G9B1YWv+nWXo+snU1j1FqD
         RcwA==
X-Forwarded-Encrypted: i=1; AHgh+Rqu/PPCmU/LdD8pWZG0FIyhZIMc9ZmKXXT1e2omCE4i9cJ6a1r1Vutm8LuFMFrID6L05V0kNbQKCnk=@lists.xenproject.org
X-Gm-Message-State: AFuF++nZqpW0EI5Li5ih0qhLhktQFBsiSabTmsFQ8Itx6ZoiGqL4jsZv
	p1XwMqCoZIVHkg+guGzKEGDuejV/LSs+/cyuIe/UrMAF1/PvXL6yh3nNwIK9FA==
X-Gm-Gg: AR+sD11RWVrS39kHBSEg3ZodL4wU86FkPw9zW80ZguGn1FDqqoWwIwD1kixNRm8qdOh
	8Yp15KuS0OOe+QHGxOssaRDVfsXzxONNDlAx0YjkkM1hCGeF3ksm7gchazcQIRU/8pIhrC3hboJ
	GJdQazwbpRJ2fCBR62xQLyZEqx0eXamJVcA2mXtHZSizqyWL40CulvF/JnLlk4GL43KMhOFQ00Y
	5ytb+0aE7WX7Sxx2g/kfbcFcG1oIW0aLsOigPJ9pud33BHq3Urm/MBzkuC9zTDnqibxDP8nlECM
	7+R5KS8bHKLCHFTL/5bmfOumT57ZG1DCtrll2X80cbC5wvHngqZWeqefB29IqqVxCAZ7eA5lJv5
	04h5EFIDhuRGqeDcpTx3RF92+InCg4iit0vIhTARuFk2X0h/g40udlBFKklZ9XYboFjsEo+snvT
	DX1purCwy8C7UN7q80lqcZAYyYw4WQx2mBh0BzYM6jlPfCjb5oTOX9WNSOtHJVYG/II6WTt2g5E
	6FhJUSB6ty3gFYfxXx9Z0yNJ97ou2I4NJe/yozDOfE=
X-Received: by 2002:a17:906:99c4:b0:c20:af9d:4544 with SMTP id a640c23a62f3a-c246a4e6388mr3653739066b.6.1787673995403;
        Tue, 25 Aug 2026 09:06:35 -0700 (PDT)
Message-ID: <4c0f0abd-b036-46fe-a93e-7df4ffcc20ca@gmail.com>
Date: Tue, 25 Aug 2026 18:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/20] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <cbbaea00bd461284f6440dbd11653a64f7434b94.1785836421.git.oleksii.kurochko@gmail.com>
 <0fe5fa72-e10c-41c1-8f4c-749cf241bf29@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0fe5fa72-e10c-41c1-8f4c-749cf241bf29@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787673996-67CBA2AC-89B7494A/10/73395122804
X-purgate-type: spam
X-purgate-size: 18342



On 8/18/26 12:18 PM, Jan Beulich wrote:
> On 04.08.2026 17:48, Oleksii Kurochko wrote:
>> dom0less device passthrough requires granting guest domains access to
>> device interrupts. Introduce map_device_irqs_to_domain() to enumerate
>> a DT node's interrupt properties, skipping those not owned by
>> the primary interrupt controller (as at the moment I haven't seen usages
>> of it), and map_irq_to_domain() to grant domain access and configure
>> Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
>> rejected.
>>
>> Both map_irq_to_domain() and map_device_irqs_to_domain() are marked
>> __overlay_init, mirroring Arm: without CONFIG_OVERLAY_DTB this expands to
>> __init, so the functions are init-only and need no XSM check; with
>> CONFIG_OVERLAY_DTB they become runtime-callable, but the only runtime
>> entry point is dt_overlay_domctl(), which performs the XSM checks at the
>> domctl layer.  RISC-V does not wire up DT overlay yet, so today these are
>> strictly __init; if/when overlay support is added, the domctl-level XSM
>> gating must be added together with it, as on Arm.
>>
>> route_irq_to_guest() and release_irq() manage irq_desc ownership for
>> guest-assigned interrupts. Each assignment carries a small irq_guest
>> structure as irqaction::dev_id, recording the owning domain and virtual
>> IRQ number which is 1:1 mapped to physical IRQ number. A per-domain
>> vIRQ allocation bitmap (used_irqs in struct vintc), managed by
>> vintc_reserve_virq(), prevents the same vIRQ being claimed twice.
>>
>> Host and guest interrupts may differ in some operations (EOI timing in
>> particular, possibly others): a host IRQ is completed once Xen's handler
>> runs, whereas a passthrough IRQ must defer the physical completion until
>> the guest issues its own EOI, otherwise a still-asserted level line would
>> immediately retrigger and storm. This affects only the .end callback;
>> the rest of hw_interrupt_type is shared, hence the separate host and
>> guest hw_interrupt_type instances.
>>
>> With APLIC+IMSIC, guest interrupts are delivered directly by hardware
>> through the IMSIC, bypassing do_IRQ(). The _IRQ_GUEST branch in
>> do_IRQ() is therefore left as BUG() until a platform without direct
>> IMSIC delivery is encountered.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

[...]

>> Updates
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Changes in v7:
>>   - Build device.c as device.init.o: everything it provides is
>>     __overlay_init, which is plain __init as long as CONFIG_OVERLAY_DTB
>>     stays Arm-only.  Unlike Arm, which picks device.o/device.init.o based
>>     on that config, RISC-V cannot enable it, so the choice is
>>     unconditional for now.
>>   - Don't have release_irq() free the guest IRQ info anymore: set
>>     free_on_release = false and free 'info' explicitly in
>>     release_guest_irq(), i.e. reinstate the xvfree() dropped in v5.  The
>>     action stays embedded in struct irq_guest, so a single allocation
>>     still covers both, but it no longer has to be the structure's first
>>     member: the offsetof() BUILD_BUG_ON and the xvfree() of a pointer
>>     that merely happened to coincide with the allocation base are gone.
>>     The ->dev_id concern from v5 doesn't apply: release_irq() clears
>>     desc->action under desc->lock and waits for in-flight handling before
>>     returning, so nothing can observe ->dev_id once 'info' is freed.
>>   - Move 'action' to the end of struct irq_guest and reword its comment
>>     accordingly.
>>   - Use xvzalloc() instead of xvmalloc() for struct irq_guest, so that
>>     the embedded action is fully initialized (action.handler was left
>>     uninitialized before).
>>   - route_irq_to_guest(): free 'info' via the common free_info label when
>>     intc_route_irq_to_guest() fails, now that release_irq() no longer
>>     frees it.
>>   - Drop a stray blank line ahead of release_irq().
>> ---
>> ---
> 
> Why does this appear a 2nd time? All of the above is already long / verbose
> enough.

A rebase issue. all these changes were initially in the separate patch 
and after squashed I missed to remove this part.

I will drop it.
> 
>> @@ -101,12 +119,31 @@ int domain_vintc_init(struct domain *d)
>>           break;
>>       }
>>   
>> +    if ( !ret )
>> +    {
>> +        d->arch.vintc->used_irqs =
>> +            xvzalloc_array(unsigned long,
>> +                           BITS_TO_LONGS(d->arch.vintc->nr_virqs));
>> +        if ( !d->arch.vintc->used_irqs )
>> +            ret = -ENOMEM;
>> +    }
>> +
>>       return ret;
>>   }
> 
> Patch 13 doesn't arrange for domain_vintc_deinit() to be called when
> domain_vintc_init() fails. Ideally that would change, or else you'd
> now need to call the function in the error case from here.


I will add a call of domain_vintc_deinit() in arch_domain_destroy() in 
patch 13:

  void arch_domain_destroy(struct domain *d)
  {
-    printk(XENLOG_WARNING "%s: unimplemented\n", __func__);
+    printk(XENLOG_WARNING "%s: not fully implemented\n", __func__);
+
+    domain_vintc_deinit(d);
  }

> In either
> case ...
> 
>>   void domain_vintc_deinit(struct domain *d)
>>   {
>>       const enum intc_variant variant = intc_hw_ops->info->hw_variant;
>> +    unsigned int virq;
>> +
>> +    if ( !d->arch.vintc )
>> +        return;
>> +
>> +    for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
>> +        if ( test_bit(virq, d->arch.vintc->used_irqs) )
>> +            release_guest_irq(d, virq);
>> +
>> +    XVFREE(d->arch.vintc->used_irqs);
> 
> ... this function will then need to become resilient against being
> called with partially initialized state.

I will update it to:

  void domain_vintc_deinit(struct domain *d)
  {
      const enum intc_variant variant = intc_hw_ops->info->hw_variant;
-    unsigned int virq;

      if ( !d->arch.vintc )
          return;

-    for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
-        if ( test_bit(virq, d->arch.vintc->used_irqs) )
-            release_guest_irq(d, virq);
+    if ( d->arch.vintc->used_irqs )
+    {
+        unsigned int virq;
+
+        for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
+            if ( test_bit(virq, d->arch.vintc->used_irqs) )
+                release_guest_irq(d, virq);

-    XVFREE(d->arch.vintc->used_irqs);
+        XVFREE(d->arch.vintc->used_irqs);
+    }


> 
>> @@ -118,3 +155,11 @@ void domain_vintc_deinit(struct domain *d)
>>           break;
>>       }
>>   }
>> +
>> +bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
>> +{
>> +    if ( virq >= d->arch.vintc->nr_virqs )
>> +        return false;
>> +
>> +    return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
>> +}
> 
> Is the present caller of this going to remain the only one? If so,
> __overlay_init would want using here as well. If not - will future
> callers appear on paths which are exposed to guests? If in turn so,
> speculation safety may need adding here.

I don't see any others calls of it in downstream. So I will add 
__overlay_init.

> 
>> @@ -227,3 +250,206 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>>       spin_unlock(&desc->lock);
>>       irq_exit();
>>   }
>> +
>> +static struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
>> +{
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
>> +    ASSERT(desc->action != NULL);
> 
> Btw, no need for the " != NULL" part.

I will drop it.

> 
>> +    return desc->action->dev_id;
>> +}
>> +
>> +void release_irq(unsigned int irq, const void *dev_id)
>> +{
>> +    struct irq_desc *desc;
>> +    unsigned long flags;
>> +    struct irqaction *action, **action_ptr;
>> +
>> +    desc = irq_to_desc(irq);
> 
> Can't this (once again) be the initializer of the variable?
> 
>> +    spin_lock_irqsave(&desc->lock, flags);
>> +
>> +    action_ptr = &desc->action;
> 
> Same for this one, which also doesn't require the lock to be held.

I will apply both remarks.

> 
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
>> +    spin_unlock_irqrestore(&desc->lock, flags);
>> +
>> +    /*
>> +     * Wait to make sure it's not being used on another CPU.
>> +     *
>> +     * The read barrier pairs with the spin_unlock() in do_IRQ(): once we
>> +     * observe _IRQ_INPROGRESS cleared, we are guaranteed to also see the
>> +     * writes do_IRQ() made to desc (e.g. desc->action) before releasing the
>> +     * lock, so it is safe to free the action below.
>> +     */
>> +    do { smp_rmb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
>> +
>> +    if ( action->free_on_release )
>> +        xvfree(action);
>> +}
>> +
>> +int release_guest_irq(struct domain *d, unsigned int virq)
>> +{
>> +    struct irq_desc *desc = irq_to_desc(virq);
>> +    struct irq_guest *info;
>> +    unsigned long flags;
>> +    int ret = -EINVAL;
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
>> +    /*
>> +     * Live IRQ unrouting from a running domain is not supported: the tear-down
>> +     * drops desc->lock across release_irq()/xvfree() and relies on no
>> +     * concurrent route_irq_to_guest() being issued for this domain. Only permit
>> +     * it for a dying domain, where assignment is frozen and no new routes can
>> +     * appear.
>> +     */
>> +    if ( !d->is_dying )
>> +    {
>> +        ret = -EBUSY;
>> +        goto unlock_err;
>> +    }
>> +
>> +    /*
>> +     * Clear _IRQ_GUEST while still holding the lock so that a concurrent
>> +     * release_guest_irq() for the same IRQ observes it and bails out, rather
>> +     * than capturing the same 'info' and double-freeing it below.
>> +     */
>> +    __clear_bit(_IRQ_GUEST, &desc->status);
>> +
>> +    spin_unlock_irqrestore(&desc->lock, flags);
>> +
>> +    release_irq(desc->irq, info);
>> +    xvfree(info);
> 
> While in the v7 revlog you claim there is no issue here, imo there (still) is.
> You obtain "info" with the lock held, then drop the lock, for release_irq() to
> re-acquire. If a similar pattern was used elsewhere (info obtained under lock,
> lock dropped, then using info), the pointer would go stale the moment you free
> it here. Imo for this to be safe _and_ not setting a bad precendent, you need
> a variant of release_irq() which is passed desc with the lock already held.
> release_irq() itself (if to be called from anywhere else) would then be a thin
> wrapper around it.

I agree that it will be safer in general.

I will introduce:

static void irq_release_action(const struct irq_desc *desc,
                                struct irqaction *action)
{
     /*
      * Wait to make sure it's not being used on another CPU.
      *
      * The read barrier pairs with the spin_unlock() in do_IRQ(): once we
      * observe _IRQ_INPROGRESS cleared, we are guaranteed to also see the
      * writes do_IRQ() made to desc (e.g. desc->action) before 
releasing the
      * lock, so it is safe to free the action below.
      */
     do { smp_rmb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );

     if ( action->free_on_release )
         xvfree(action);
}

+void release_irq(unsigned int irq, const void *dev_id)
+{
+    struct irq_desc *desc = irq_to_desc(irq);
+    struct irqaction *action;
+    unsigned long flags;
+
+    spin_lock_irqsave(&desc->lock, flags);
+    action = irq_detach_action(desc, dev_id);
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    if ( action )
+        irq_release_action(desc, action);
+}

Where irq_detach_action() will be almost what release_irq() was before:

+static struct irqaction *irq_detach_action(struct irq_desc *desc,
+                                           const void *dev_id)
  {
-    struct irq_desc *desc = irq_to_desc(irq);
-    unsigned long flags;
      struct irqaction *action, **action_ptr = &desc->action;

-    spin_lock_irqsave(&desc->lock, flags);
+    ASSERT(spin_is_locked(&desc->lock));
+
  #ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
      for ( ;; )
      {
          action = *action_ptr;
-        if ( !action )
-        {
-            printk(XENLOG_WARNING "Trying to free already-free IRQ 
%u\n", irq);
-            spin_unlock_irqrestore(&desc->lock, flags);
-            return;
-        }
-
-        if ( action->dev_id == dev_id )
+        if ( !action || (action->dev_id == dev_id) )
              break;

          action_ptr = &action->next;
      }
+#else
+    action = *action_ptr;
+#endif
+
+    if ( !action )
+    {
+        printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n",
+               desc->irq);
+        return NULL;
+    }

      /* Found it - remove it from the action list */
+#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
      *action_ptr = action->next;
  #else
-    action = *action_ptr;
      *action_ptr = NULL;
  #endif

@@ -298,8 +309,22 @@ void release_irq(unsigned int irq, const void *dev_id)
          __clear_bit(_IRQ_GUEST, &desc->status);
      }

-    spin_unlock_irqrestore(&desc->lock, flags);
+    return action;
+}

and then release_guest_irq() (the end) will be changed in the following way:

....
     /*
      * Detaching the action happens with desc->lock still held, so that a
      * concurrent release_guest_irq() for the same IRQ sees _IRQ_GUEST 
already
      * cleared and bails out, rather than capturing the same 'info' and
      * double-freeing it below.
      */
     action = irq_detach_action(desc, info);

     spin_unlock_irqrestore(&desc->lock, flags);

     if ( action )
         irq_release_action(desc, action);

     xvfree(info);

     return 0;

> 
>> +/* Route an IRQ to a specific guest */
>> +int route_irq_to_guest(struct domain *d, unsigned int virq,
>> +                       unsigned int irq, const char *devname)
>> +{
>> +    struct irq_guest *info;
>> +    struct irq_desc *desc;
>> +    unsigned long flags;
>> +    int retval = 0;
>> +
>> +    if ( d->is_dying )
>> +        return -EINVAL;
>> +
>> +    desc = irq_to_desc(irq);
> 
> Imo this either wants to be the initializer of the variable, or (perhaps
> better here) it wants to move immediately ahead of ...
> 
>> +    info = xvzalloc(struct irq_guest);
>> +    if ( !info )
>> +        return -ENOMEM;
>> +
>> +    info->d = d;
>> +    info->virq = virq;
>> +
>> +    info->action.dev_id = info;
>> +    info->action.name = devname;
>> +    /* The action is part of 'info', thus it is freed together with it. */
>> +    info->action.free_on_release = false;
>> +
>> +    spin_lock_irqsave(&desc->lock, flags);
> 
> ... this.

I will move initialization here.

> 
>> +    /*
>> +     * If the IRQ is already used by someone
>> +     *  - If it's the same domain -> Xen doesn't need to update the IRQ desc.
>> +     *  For safety check if we are not trying to assign the IRQ to a
>> +     *  different vIRQ.
>> +     *  - Otherwise -> For now, don't allow the IRQ to be shared between
>> +     *  Xen and domains.
>> +     */
>> +    if ( desc->action != NULL )
>> +    {
>> +        if ( test_bit(_IRQ_GUEST, &desc->status) )
>> +        {
>> +            struct domain *ad = irq_get_guest_info(desc)->d;
>> +
>> +            if ( d != ad )
>> +            {
>> +                printk(XENLOG_G_ERR "IRQ %u is already used by %pd\n",
>> +                       irq, ad);
>> +                retval = -EBUSY;
>> +            }
>> +            else if ( irq_get_guest_info(desc)->virq != virq )
>> +            {
>> +                printk(XENLOG_G_ERR
>> +                       "%pd: IRQ %u is already assigned to vIRQ %u\n",
>> +                       d, irq, irq_get_guest_info(desc)->virq);
>> +                retval = -EBUSY;
>> +            }
>> +        }
>> +        else
>> +        {
>> +            printk(XENLOG_G_ERR "IRQ %u is already used by Xen\n", irq);
>> +            retval = -EBUSY;
>> +        }
>> +        goto out;
>> +    }
>> +
>> +    retval = _setup_irq(desc, 0, &info->action);
>> +    if ( retval )
>> +        goto out;
>> +
>> +    retval = intc_route_irq_to_guest(desc, IRQ_NO_PRIORITY);
>> +
>> +    spin_unlock_irqrestore(&desc->lock, flags);
>> +
>> +    if ( retval )
>> +    {
>> +        release_irq(desc->irq, info);
> 
> Like above, I think you want to avoid transiently dropping the lock here.

With suggested above it will look like:

      retval = intc_route_irq_to_guest(desc, IRQ_NO_PRIORITY);
-
-    spin_unlock_irqrestore(&desc->lock, flags);
-
      if ( retval )
      {
-        release_irq(desc->irq, info);
+        struct irqaction *action = irq_detach_action(desc, info);
+
+        spin_unlock_irqrestore(&desc->lock, flags);
+
+        if ( action )
+            irq_release_action(desc, action);
+
          goto free_info;
      }

+    spin_unlock_irqrestore(&desc->lock, flags);
+
      return 0;

   out:

Thanks.

~ Oleksii



