Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28982C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 10:00:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406657.1639849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24FE-00080P-Mh; Thu, 03 Sep 2026 10:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406657.1639849; Thu, 03 Sep 2026 10:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24FE-00080I-H4; Thu, 03 Sep 2026 10:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1406657;
 Thu, 03 Sep 2026 10:00:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x24FC-00080C-OP
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:00:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x24FB-005kUh-Hg
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:00:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a994535-e002-0a2a0a5209dd-0a2a45078efc-28
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:00:29 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a99453d-b4ea-0a2a45070019-d155dd29c1e7-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:00:29 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47fe89fb333so1393816f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 03:00:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce554d52esm77963235e9.3.2026.09.03.03.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 03:00:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788429629; x=1789034429; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2NziDJMKrul72aQFgBtOreRtl8idoWHlsvdnsWBq4A=;
        b=VRjaINMKUL+AkzkgLjiGBOhuYKHnef5aStNig+/R+J40kD7pS4g75moiHRjZz8U4QR
         iFBdUxpf54hIvOkJQlz8gDQgHoZczo06FE0XRJ494Y2bOrd/lLf+84kF3cT7hIjz9ArY
         9l+y/Fefn43DrwKCXnzg83lDE/l39PbhbiZlTCOsTt4Xo8RXWxt69LZM8QkTU/Ecp8Ay
         duZV5si8BrcuKLqH6n8x43iwwfj5zd6UL3ZHiiDq+sKQmwEKeJ1TI2ezmalydo9WTvcE
         /rt1VSYQcH9buSzzg0e/duLnT85y/XGNsmBPGd6vNtnYD6VnQ0srnDDVbMfuve6+nV/o
         XXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429629; x=1789034429;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2NziDJMKrul72aQFgBtOreRtl8idoWHlsvdnsWBq4A=;
        b=kJPYUzsiOV7yeg3oUEstYt8a+lFuo1xrSGFss5r85MFtn5x92U7NladXv3VXip1BcW
         QtwwLj6ZDO0N4m//1BcWasZNNPIblZzb72Olneu2ssyjpvIsPyrTJ6nVJj+XfDuEuYrB
         CEFd3N8/Ci+wqf9nOQrK4hARD7N8PK4d9MkHazaom7L4U7gq2nr7Q3VWvo+fQu8VRgMI
         M58NpuMNFTsLRz2/RnWNDkKOD2bLfWU+motyg1s7XgnCingv/zyIDyQ39Hv6vP+2OieR
         cSLoons+jTBQzPKpipJc4y2GgoXkd4Mgb4nUNzSQdo2+2oyWvmSbp4F/ZCXrAB1qgn62
         0n7Q==
X-Forwarded-Encrypted: i=1; AKwUvByuQ9V45jNJes72ybmpA/H/RWVAvDFRvYqJ6jsd6Hle2C1t/wRR7Tzarg3i6Jw3CkWlc7G+P7339hI=@lists.xenproject.org
X-Gm-Message-State: AFuF++kJQv2HCqU0HAC1w+NjToZ4OqoN3LqWjYnHXMIr/k/jzBN6i0o0
	smMXKcTI2zwHzkhnPcXMdpbk2sZme/Sic6zg5lyBErQYdEujZULHqHu5iNC+RmwMaQ==
X-Gm-Gg: AYBFou3dtjocwyu6aeF2f1+JNEK8Ci6LJZ/I6A9L68swtm8IHCoPdkRB7HzGdjbyoUP
	1cDCxf8iwiIGB6zuOmJSPWXymTYYlNPebTjlP1PepAeE19YafEfuK1hUshC3gqfByLYZeqeLppr
	9fJOXFAV08g9CQ2uEyMoeXytnkPGgJfmmsiavFZPrTT6dXJOen0owd3pIS0iiZpdkO0WJ2Xi5H9
	kQnGmnLs4fRDcNgRZMrv8ZJTRAwEU6ukMJ/MIXTXKhgGTZUHMGYOhgWUxQH4bybVWuyEf4AXeHs
	Mswi/cn6cfI28mlmJI1l7M8ijznzNLENCRh4gFaoh/PgIvD45py6p7qa3jfxFxYpbIV98mUOxKk
	5y5R6cqngBfAIFtB0x7aTXmweX0ZMDL+axsnVgN3y5xk8KWwW0Q24SE3x1VkDZWO5L/SiBoZVkg
	ZHmZeWeebuUzgeI/hlMg22KbYArTEkjAYuYgdZ+SS0FPX2YBMIvRg3jgbUOLBEjMmZOdWP8+xS4
	WxWF8H+NssxgzvnxVVAjc7/Q62PYco52UJizLhezJ6KGmZCmM5D
X-Received: by 2002:a05:600c:45c4:b0:49c:e1df:79a4 with SMTP id 5b1f17b1804b1-49ce57fdd1emr197297165e9.5.1788429628101;
        Thu, 03 Sep 2026 03:00:28 -0700 (PDT)
Message-ID: <0cf2c9f6-5fba-4d1e-a9cd-e2a409730efa@suse.com>
Date: Thu, 3 Sep 2026 12:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/20] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <d5ac0f45de409ab0a63b2b17e4fd3cdd47dbffa0.1787836900.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <d5ac0f45de409ab0a63b2b17e4fd3cdd47dbffa0.1787836900.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788429629-A64DBAE4-0A20115B/0/0
X-purgate-type: clean
X-purgate-size: 9249

On 27.08.2026 17:19, Oleksii Kurochko wrote:
> dom0less device passthrough requires granting guest domains access to
> device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
> a DT node's interrupt properties, skipping those not owned by
> the primary interrupt controller (as at the moment I haven't seen usages
> of it), and map_irq_to_domain() to grant domain access and configure
> Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
> rejected.
> 
> Both map_irq_to_domain() and map_device_irqs_to_domain() are marked
> __overlay_init, mirroring Arm: without CONFIG_OVERLAY_DTB this expands to
> __init, so the functions are init-only and need no XSM check; with
> CONFIG_OVERLAY_DTB they become runtime-callable, but the only runtime
> entry point is dt_overlay_domctl(), which performs the XSM checks at the
> domctl layer.  RISC-V does not wire up DT overlay yet, so today these are
> strictly __init; if/when overlay support is added, the domctl-level XSM
> gating must be added together with it, as on Arm.
> 
> route_irq_to_guest() and release_irq() manage irq_desc ownership for
> guest-assigned interrupts.  Each assignment carries a small irq_guest
> structure as irqaction::dev_id, recording the owning domain and virtual
> IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
> vIRQ allocation bitmap (used_irqs in struct vintc), managed by
> vintc_reserve_virq(), prevents the same vIRQ being claimed twice.
> 
> Host and guest interrupts may differ in some operations (EOI timing in
> particular, possibly others): a host IRQ is completed once Xen's handler
> runs, whereas a passthrough IRQ must defer the physical completion until
> the guest issues its own EOI, otherwise a still-asserted level line would
> immediately retrigger and storm.  This affects only the .end callback;
> the rest of hw_interrupt_type is shared, hence the separate host and
> guest hw_interrupt_type instances.

Irrespective of there not being any .end() hook yet, I think the two would
better be split properly right away. aplic_guest_irq_type's .name could
then also properly point to e.g. "aplic-guest".

> --- a/xen/arch/riscv/irq.c
> +++ b/xen/arch/riscv/irq.c
> @@ -12,11 +12,26 @@
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>
> +#include <xen/sched.h>
>  #include <xen/spinlock.h>
> +#include <xen/xvmalloc.h>
>  
>  #include <asm/hardirq.h>
>  #include <asm/intc.h>
>  
> +/* Describe an IRQ assigned to a guest */
> +struct irq_guest
> +{
> +    struct domain *d;
> +    unsigned int virq;
> +    /*
> +     * The action of a guest IRQ has the same lifetime as this structure, so
> +     * embed it here to have both covered by a single allocation. Consequently
> +     * it must not be freed by release_irq() (see free_on_release below).
> +     */
> +    struct irqaction action;

Why the mention of release_irq(), when release_guest_irq() doesn't use that
function? (In fact release_irq() looks to be unused altogether.)

> @@ -227,3 +250,235 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>      spin_unlock(&desc->lock);
>      irq_exit();
>  }
> +
> +static struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
> +{
> +    ASSERT(spin_is_locked(&desc->lock));
> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));

Nit: I don't quite see why this cannot be the simpler

    ASSERT(desc->status & IRQ_GUEST);

> +static struct irqaction *irq_detach_action(struct irq_desc *desc,
> +                                           const void *dev_id)
> +{
> +    struct irqaction *action, **action_ptr = &desc->action;
> +
> +    ASSERT(spin_is_locked(&desc->lock));
> +
> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
> +    for ( ;; )
> +    {
> +        action = *action_ptr;
> +        if ( !action || (action->dev_id == dev_id) )
> +            break;
> +
> +        action_ptr = &action->next;
> +    }
> +#else
> +    action = *action_ptr;
> +#endif
> +
> +    if ( !action )
> +    {
> +        printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n",
> +               desc->irq);
> +        return NULL;
> +    }
> +
> +    /* Found it - remove it from the action list */
> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
> +    *action_ptr = action->next;
> +#else
> +    *action_ptr = NULL;
> +#endif
> +
> +    /* If this was the last action, shut down the IRQ */
> +    if ( !desc->action )
> +    {
> +        desc->handler->shutdown(desc);
> +        __clear_bit(_IRQ_GUEST, &desc->status);

Similarly

        desc->status &= ~IRQ_GUEST;

here then.

> +/*
> + * Complete the release of an action detached by irq_detach_action().
> + *
> + * To be called with desc->lock dropped: the lock cannot be held all the way
> + * through, as waiting for a handler still running on another CPU to complete
> + * requires do_IRQ() to be able to acquire the very same lock.
> + *
> + * Once this function has returned, the action (and hence any object embedding
> + * it) is no longer referenced by anyone and may be freed by the caller.
> + */
> +static void irq_release_action(const struct irq_desc *desc,
> +                               struct irqaction *action)
> +{
> +    /*
> +     * Wait to make sure it's not being used on another CPU.
> +     *
> +     * The read barrier pairs with the spin_unlock() in do_IRQ(): once we
> +     * observe _IRQ_INPROGRESS cleared, we are guaranteed to also see the
> +     * writes do_IRQ() made to desc (e.g. desc->action) before releasing the
> +     * lock, so it is safe to free the action below.
> +     */

I fear I don't understand this: What writes to desc->action would do_IRQ()
ever want to do? I could see if you gave desc->status as example here;
really I don't think any other field (apart from perhaps statistics) would
ever want modifying there.

> +    do { smp_rmb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );

Please split this across three lines, to conform to style. (Also same nit
as above.)

> +    if ( action->free_on_release )
> +        xvfree(action);

How does this being done here fit with the last paragraph of the comment
ahead of the function?

> +int release_guest_irq(struct domain *d, unsigned int virq)
> +{
> +    struct irq_desc *desc = irq_to_desc(virq);
> +    struct irqaction *action;
> +    struct irq_guest *info;
> +    unsigned long flags;
> +    int ret = -EINVAL;
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +
> +    if ( !test_bit(_IRQ_GUEST, &desc->status) )
> +        goto unlock_err;
> +
> +    info = irq_get_guest_info(desc);
> +    if ( d != info->d )

This looks to be the only use of "d" - any reason the function parameter cannot
be pointer-to-const?

> +        goto unlock_err;
> +
> +    /*
> +     * Detaching the action happens with desc->lock still held, so that a
> +     * concurrent release_guest_irq() for the same IRQ sees _IRQ_GUEST already

I think "sees" is misleading here, as it suggests that a racing check can occur.
With the lock held, that's impossible. Hence imo better "will see" (i.e. only
after having got hold of the lock).

> +/* Route an IRQ to a specific guest */
> +int route_irq_to_guest(struct domain *d, unsigned int virq,
> +                       unsigned int irq, const char *devname)
> +{
> +    struct irq_guest *info;
> +    struct irq_desc *desc = irq_to_desc(irq);
> +    unsigned long flags;
> +    int retval = 0;
> +
> +    if ( d->is_dying )
> +        return -EINVAL;
> +
> +    info = xvzalloc(struct irq_guest);

With zeroing used here, ...

> +    if ( !info )
> +        return -ENOMEM;
> +
> +    info->d = d;
> +    info->virq = virq;
> +
> +    info->action.dev_id = info;
> +    info->action.name = devname;
> +    /* The action is part of 'info', thus it is freed together with it. */
> +    info->action.free_on_release = false;

... this is dead code.

> +    spin_lock_irqsave(&desc->lock, flags);
> +
> +    /*
> +     * If the IRQ is already used by someone
> +     *  - If it's the same domain -> Xen doesn't need to update the IRQ desc.
> +     *  For safety check if we are not trying to assign the IRQ to a
> +     *  different vIRQ.
> +     *  - Otherwise -> For now, don't allow the IRQ to be shared between
> +     *  Xen and domains.
> +     */
> +    if ( desc->action != NULL )
> +    {
> +        if ( test_bit(_IRQ_GUEST, &desc->status) )
> +        {
> +            struct domain *ad = irq_get_guest_info(desc)->d;
> +
> +            if ( d != ad )
> +            {
> +                printk(XENLOG_G_ERR "IRQ %u is already used by %pd\n",
> +                       irq, ad);

Perhaps best to also have %pd: at the start of this message, just like ...

> +                retval = -EBUSY;
> +            }
> +            else if ( irq_get_guest_info(desc)->virq != virq )
> +            {
> +                printk(XENLOG_G_ERR
> +                       "%pd: IRQ %u is already assigned to vIRQ %u\n",
> +                       d, irq, irq_get_guest_info(desc)->virq);

... you have it here?

Jan

