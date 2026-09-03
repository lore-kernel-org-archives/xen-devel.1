Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0B6C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:40:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407360.1640454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28bh-00073h-EN; Thu, 03 Sep 2026 14:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407360.1640454; Thu, 03 Sep 2026 14:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28bh-00073a-9g; Thu, 03 Sep 2026 14:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1407360;
 Thu, 03 Sep 2026 14:40:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x28bg-00073U-4j
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:40:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28bf-006ZQQ-1N
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:39:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9986ad-2eae-0a2a0a5409dd-0a2a4507ea1a-20
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:39:59 +0200
Received: from [209.85.167.53] (helo=mail-lf1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9986be-b4ea-0a2a45070019-d155a735c078-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:39:58 +0200
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5b5e18f0439so2404336e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 07:39:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b606b94655sm1427658e87.41.2026.09.03.07.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 07:39:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788446398; x=1789051198; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=42+uphfCCLRvNwxaRgHxqMYnP9Bgc+IH+RL7USpLoVM=;
        b=VS2Xz2BcXGCY5HO+d8i2Gc5W70FVwSy187AfrXgjxo8MOtiRB4m3OA5uEPc4Kji2aq
         gNQdlL648WppQXzevrs5iFKz4MVEXJd10YPotuLsLc8cnNpoShjt3yaS1gtMpTD0igD9
         KerwdJSzfLrTBej1Ara9n/HT91cwf3CSBYlwrOAvbg2faR8WH3izrb4mVlKBxAPXvt+3
         PLlKt+1FmFyc0Pszc5tvr6wAarNl9J41KGirwexI1Q5OpImugRBpXIiywfu7W/yrlsxm
         RwCN/rwF0LbgALJFs1A1CL2OUx27O00sNHoePtw0cJlTFzKtIhgW/KmhO9nMptATHDZH
         Zoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446398; x=1789051198;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42+uphfCCLRvNwxaRgHxqMYnP9Bgc+IH+RL7USpLoVM=;
        b=dK7oFntboEcIgN3gWShhOEhcjDoYWi08j6mKF3OtCbU1DBkVVJ6oiDcXXTTLeGNbin
         scSYPSWurtLIDOj21Kkt3Yp9aErsEg93x5h8NLX/oa2ZhuDVLxPIGcaHtFt/tUFnYQqa
         AQJgeMxUmLl5yVDv0SGwZ/JCLmDkKpLdXbiXBfQcGf4NH74nF6o2UHn4b4Oc3mvkYojg
         QgaqbwAijnE70iPKEBaUJ+sV7Tkynvzu3sOApXwPHJlQboYNaVGFnQch6+mgrkINM3BS
         Bzj4QAcxTRJcJTXEyxBk7I+U2cxIeTvTZayWEdYt+fT+RRjIz7TGmSVJB8zW2jD2rNIH
         LlSg==
X-Forwarded-Encrypted: i=1; AKwUvBwNYF3cj2YyP0TEjo1VXVmdBzcSr6QYmpkvqSbnabtMjDqm0SnjAfQMbMxPv90CBBgRQWYg/yWU534=@lists.xenproject.org
X-Gm-Message-State: AFuF++m1zdz+17HveIY8GfLHJduAJVa+NwDr1D9HSQLsW0M821R9+OZU
	G1VwaCvE64YnG9ttBI2bwNp9EOaIQp7I/zT1w7zSdckl0J4uR2/eTBW4
X-Gm-Gg: AYBFou3F1nDddRLqTAzKig+/Nym2F5NOxArdwgPvbHbDhECZFs5tw/xuujeLg8+cpjU
	sy+JLCHhcK4TMmjfeYRctH3Z+3XkvHjtBn1wmKJXQjO10UYKgDoE5l6NepHE7FH6ZWMh2HmVzVP
	H/87+eX5d4vg7YnGoxhcpn7lB3IcZWlZyCbk/OtmCORAlfPsKIcPMFDC+oWeTJe/DDdi3eo6zUs
	CmahkWzVCe3ImeM4bFcTdCq9c4UOzNdyIkh76tCAR5oCWZQrge48lqyc+d3nXqaEElR+LHYyog9
	yYODd0/ikDey+uG+H228/tVEl63VUJ36QprFh/8ayG20J+n5x22AI5Xd4FfFaVuySmfndmxOEnm
	rAM0UW+tV52I4YTnQnUF2nFv071LHkri3pAiEe/LBgsGu6n7oAtDL48nYTbHSdAxrnkgC0wbKUm
	m9J3ZomKLB+58+34iDybvcQbQi1hKQpadj7deTplvIzflKQDTqsw4fATHAthBOazYnI33WGWmrt
	L5FFOTzVgCeMaSCE3NdxcK658630hmbrYgQdKx/9g==
X-Received: by 2002:a05:6512:1252:b0:5b2:958f:8cdc with SMTP id 2adb3069b0e04-5b608344615mr4753675e87.11.1788446397861;
        Thu, 03 Sep 2026 07:39:57 -0700 (PDT)
Message-ID: <ffa2c0cb-52ed-421b-8c4e-9b61edd43f6f@gmail.com>
Date: Thu, 3 Sep 2026 16:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v8 16/20] xen/riscv: implement IRQ routing for device
 passthrough
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <d5ac0f45de409ab0a63b2b17e4fd3cdd47dbffa0.1787836900.git.oleksii.kurochko@gmail.com>
 <0cf2c9f6-5fba-4d1e-a9cd-e2a409730efa@suse.com>
Content-Language: en-US
In-Reply-To: <0cf2c9f6-5fba-4d1e-a9cd-e2a409730efa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788446399-A72DCAE4-0FDE81D7/10/73395122804
X-purgate-type: spam
X-purgate-size: 15101



On 9/3/26 12:00 PM, Jan Beulich wrote:
> On 27.08.2026 17:19, Oleksii Kurochko wrote:
>> dom0less device passthrough requires granting guest domains access to
>> device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
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
>> guest-assigned interrupts.  Each assignment carries a small irq_guest
>> structure as irqaction::dev_id, recording the owning domain and virtual
>> IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
>> vIRQ allocation bitmap (used_irqs in struct vintc), managed by
>> vintc_reserve_virq(), prevents the same vIRQ being claimed twice.
>>
>> Host and guest interrupts may differ in some operations (EOI timing in
>> particular, possibly others): a host IRQ is completed once Xen's handler
>> runs, whereas a passthrough IRQ must defer the physical completion until
>> the guest issues its own EOI, otherwise a still-asserted level line would
>> immediately retrigger and storm.  This affects only the .end callback;
>> the rest of hw_interrupt_type is shared, hence the separate host and
>> guest hw_interrupt_type instances.
> 
> Irrespective of there not being any .end() hook yet, I think the two would
> better be split properly right away. aplic_guest_irq_type's .name could
> then also properly point to e.g. "aplic-guest".

I agree with renaming and I will do that now.

Regarding splitting I can split now but they will look the same for AIA 
case as we supports only a vAPLIC which works in MSI mode 
(vAPLIC+vIMSIC) and it will be true until we will introduce only vAPLIC 
support w/o vIMSIC. And in case of absence of vIMSIC we will really need 
a separate .end() for a guest.

And .end() for guest will be definitely also needed in the case of vPLIC.

So for now I can suggest to do the following:

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 3681f0669efb..422c65ece4f7 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -325,13 +325,40 @@ static const hw_irq_controller aplic_xen_irq_type = {
      .set_affinity = aplic_set_irq_affinity,
  };

-/* At the moment there is no difference between guest and Xen ops */
-#define aplic_guest_irq_type aplic_xen_irq_type
+static unsigned int cf_check aplic_guest_irq_startup(struct irq_desc *desc)
+{
+    BUG_ON("unimplemented");
+}
+
+/*
+ * Shared by ->shutdown(), ->enable(), ->disable() and ->end(), which have
+ * no state.
+ */
+static void cf_check aplic_guest_irq_stub(struct irq_desc *desc)
+{
+    BUG_ON("unimplemented");
+}
+
+static void cf_check aplic_guest_set_irq_affinity(struct irq_desc *desc,
+                                                  const cpumask_t *mask)
+{
+    BUG_ON("unimplemented");
+}
+
+static const hw_irq_controller aplic_guest = {
+    .typename     = "aplic",
+    .startup      = aplic_guest_irq_startup,
+    .shutdown     = aplic_guest_irq_stub,
+    .enable       = aplic_guest_irq_stub,
+    .disable      = aplic_guest_irq_stub,
+    .end          = aplic_guest_irq_stub,
+    .set_affinity = aplic_guest_set_irq_affinity,
+};

  static const struct intc_hw_operations aplic_ops = {
      .info                = &aplic_info,
      .host_irq_type       = &aplic_xen_irq_type,
-    .guest_irq_type      = &aplic_guest_irq_type,
+    .guest_irq_type      = &aplic_guest,
      .handle_interrupt    = aplic_handle_interrupt,
      .set_irq_type        = aplic_set_irq_type,
  };

> 
>> --- a/xen/arch/riscv/irq.c
>> +++ b/xen/arch/riscv/irq.c
>> @@ -12,11 +12,26 @@
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>> +#include <xen/sched.h>
>>   #include <xen/spinlock.h>
>> +#include <xen/xvmalloc.h>
>>   
>>   #include <asm/hardirq.h>
>>   #include <asm/intc.h>
>>   
>> +/* Describe an IRQ assigned to a guest */
>> +struct irq_guest
>> +{
>> +    struct domain *d;
>> +    unsigned int virq;
>> +    /*
>> +     * The action of a guest IRQ has the same lifetime as this structure, so
>> +     * embed it here to have both covered by a single allocation. Consequently
>> +     * it must not be freed by release_irq() (see free_on_release below).
>> +     */
>> +    struct irqaction action;
> 
> Why the mention of release_irq(), when release_guest_irq() doesn't use that
> function? (In fact release_irq() looks to be unused altogether.)
> 

Right, the reference is wrong. release_guest_irq() detaches the action 
itself and then calls irq_release_action(), which is what actually 
honours free_on_release.

It should be:

-     * it must not be freed by release_irq() (see free_on_release below).
+     * it must not be freed on its own, which is why free_on_release is 
left
+     * false for it (see irq_release_action()).

>> @@ -227,3 +250,235 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>>       spin_unlock(&desc->lock);
>>       irq_exit();
>>   }
>> +
>> +static struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
>> +{
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
> 
> Nit: I don't quite see why this cannot be the simpler
> 
>      ASSERT(desc->status & IRQ_GUEST);

It could. I will apply that.

> 
>> +static struct irqaction *irq_detach_action(struct irq_desc *desc,
>> +                                           const void *dev_id)
>> +{
>> +    struct irqaction *action, **action_ptr = &desc->action;
>> +
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +
>> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
>> +    for ( ;; )
>> +    {
>> +        action = *action_ptr;
>> +        if ( !action || (action->dev_id == dev_id) )
>> +            break;
>> +
>> +        action_ptr = &action->next;
>> +    }
>> +#else
>> +    action = *action_ptr;
>> +#endif
>> +
>> +    if ( !action )
>> +    {
>> +        printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n",
>> +               desc->irq);
>> +        return NULL;
>> +    }
>> +
>> +    /* Found it - remove it from the action list */
>> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
>> +    *action_ptr = action->next;
>> +#else
>> +    *action_ptr = NULL;
>> +#endif
>> +
>> +    /* If this was the last action, shut down the IRQ */
>> +    if ( !desc->action )
>> +    {
>> +        desc->handler->shutdown(desc);
>> +        __clear_bit(_IRQ_GUEST, &desc->status);
> 
> Similarly
> 
>          desc->status &= ~IRQ_GUEST;
> 
> here then.

I will apply that. It could be really done in this way as we are under 
lock here.

> 
>> +/*
>> + * Complete the release of an action detached by irq_detach_action().
>> + *
>> + * To be called with desc->lock dropped: the lock cannot be held all the way
>> + * through, as waiting for a handler still running on another CPU to complete
>> + * requires do_IRQ() to be able to acquire the very same lock.
>> + *
>> + * Once this function has returned, the action (and hence any object embedding
>> + * it) is no longer referenced by anyone and may be freed by the caller.
>> + */
>> +static void irq_release_action(const struct irq_desc *desc,
>> +                               struct irqaction *action)
>> +{
>> +    /*
>> +     * Wait to make sure it's not being used on another CPU.
>> +     *
>> +     * The read barrier pairs with the spin_unlock() in do_IRQ(): once we
>> +     * observe _IRQ_INPROGRESS cleared, we are guaranteed to also see the
>> +     * writes do_IRQ() made to desc (e.g. desc->action) before releasing the
>> +     * lock, so it is safe to free the action below.
>> +     */
> 
> I fear I don't understand this: What writes to desc->action would do_IRQ()
> ever want to do? I could see if you gave desc->status as example here;
> really I don't think any other field (apart from perhaps statistics) would
> ever want modifying there.

I will reword:

       * The read barrier pairs with the spin_unlock() in do_IRQ(): once we
-     * observe _IRQ_INPROGRESS cleared, we are guaranteed to also see the
-     * writes do_IRQ() made to desc (e.g. desc->action) before 
releasing the
-     * lock, so it is safe to free the action below.
+     * observe _IRQ_INPROGRESS cleared in desc->status, we are 
guaranteed to
+     * also see whatever the handler did on that CPU before the bit was
+     * cleared, so it is safe to free the action below.

> 
>> +    do { smp_rmb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );

I am thinking if a barrier is in correct place or needed at all.

Considering that desc->status is updated under spinlock() which uses 
full barrier the result here should be already observable without 
smp_rmb() inside do {} while ().

Probably we want to have load->load between test_bit() and a read of 
action->free_on_release in if () below but I don't see what could go 
wrong if this read will happen before do {} while ().

xvfree() (stores inside it) can't be executed ealier because of control 
dependency [Rule 11: b (xfree) is a (action->free_on_release) store, and 
b has a syntactic control dependency on a] so again it looks like a 
barrier isn't needed here.

So considering what kind of barrier is used inside spinlock + Rule 11 we 
can just move smp_rmb() after the cycle (just in case) and it looks like 
smp_rmb() is only here just to force compiler not to order the things 
considering how action->free_on_release is used:

static void irq_release_action(const struct irq_desc *desc,
                                struct irqaction *action)
{
     /*
      * Wait to make sure it's not being used on another CPU.
      *
      * desc->status is cleared in do_IRQ() under desc->lock, whose
      * acquire/release barriers are a full smp_mb() on this arch, so the
      * handler's writes are already ordered before the clear is visible.
      * On this side, xvfree() is control-dependent on the final test_bit()
      * load, so Rule 11 (RVWMO) already orders it after the wait with no
      * barrier. smp_rmb() below adds real read->read ordering, but nothing
      * after the loop depends on it (action->free_on_release isn't racy);
      * it's kept as a guard against the compiler breaking the control
      * dependency the ordering actually relies on.
      */
     while ( test_bit(_IRQ_INPROGRESS, &desc->status) )
         cpu_relax();
     smp_rmb();

     if ( action->free_on_release )
         xvfree(action);

Am I missing something?

> 
> Please split this across three lines, to conform to style. (Also same nit
> as above.)
> 
>> +    if ( action->free_on_release )
>> +        xvfree(action);
> 
> How does this being done here fit with the last paragraph of the comment
> ahead of the function?

The comment is inaccurate. I will drop "... by the caller."



> 
>> +int release_guest_irq(struct domain *d, unsigned int virq)
>> +{
>> +    struct irq_desc *desc = irq_to_desc(virq);
>> +    struct irqaction *action;
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
> 
> This looks to be the only use of "d" - any reason the function parameter cannot
> be pointer-to-const?

Missed that. It looks like it could be really const.

> 
>> +        goto unlock_err;
>> +
>> +    /*
>> +     * Detaching the action happens with desc->lock still held, so that a
>> +     * concurrent release_guest_irq() for the same IRQ sees _IRQ_GUEST already
> 
> I think "sees" is misleading here, as it suggests that a racing check can occur.
> With the lock held, that's impossible. Hence imo better "will see" (i.e. only
> after having got hold of the lock).

I will correct the comment in suggested way.

> 
>> +/* Route an IRQ to a specific guest */
>> +int route_irq_to_guest(struct domain *d, unsigned int virq,
>> +                       unsigned int irq, const char *devname)
>> +{
>> +    struct irq_guest *info;
>> +    struct irq_desc *desc = irq_to_desc(irq);
>> +    unsigned long flags;
>> +    int retval = 0;
>> +
>> +    if ( d->is_dying )
>> +        return -EINVAL;
>> +
>> +    info = xvzalloc(struct irq_guest);
> 
> With zeroing used here, ...
> 
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
> 
> ... this is dead code.

I will drop init. with false here.

> 
>> +    spin_lock_irqsave(&desc->lock, flags);
>> +
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
> 
> Perhaps best to also have %pd: at the start of this message, just like ...
> 
>> +                retval = -EBUSY;
>> +            }
>> +            else if ( irq_get_guest_info(desc)->virq != virq )
>> +            {
>> +                printk(XENLOG_G_ERR
>> +                       "%pd: IRQ %u is already assigned to vIRQ %u\n",
>> +                       d, irq, irq_get_guest_info(desc)->virq);
> 
> ... you have it here?

Sure, I will aligh the comments.

Thanks.

~ Oleksii

