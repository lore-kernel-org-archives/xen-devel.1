Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C722C88E65
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 10:54:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420762.1646993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64Kc-000839-QI; Mon, 14 Sep 2026 10:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420762.1646993; Mon, 14 Sep 2026 10:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64Kc-000832-NK; Mon, 14 Sep 2026 10:54:38 +0000
Received: by outflank-mailman (input) for mailman id 1420762;
 Mon, 14 Sep 2026 10:54:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x64Kb-00082w-Jn
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 10:54:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x64Kb-008TLc-00
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:54:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa7d266-e002-0a2a0a5209dd-0a2a4505a158-6
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:54:36 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa7d26c-4cb1-0a2a45050019-4a7de18cbfd2-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:54:36 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so9360205e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 03:54:36 -0700 (PDT)
Received: from ?IPV6:2a02:778:142:8f01:2700:bad4:284c:5aa5?
 ([2a02:778:142:8f01:2700:bad4:284c:5aa5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60ac411asm294572305e9.8.2026.09.14.03.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 03:54:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789383276; x=1789988076; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uR4S+flbKftxTsnvkVTTjO2b1d5a5haTCsx34TGyzE0=;
        b=Qv52MuuW+Wbym+rURLozpSAaJhn/hRbXoJefIroMZ7x4Xe3XIHraI63SFHHFTDTdic
         sSraelUVt2eA3ZmfmKEE7L8DGl3El/VWBAC9GJi+/mVrk9Ao8dp9432fOjiasxAd5We1
         MMzifvqgTszsMwsYz6MjJVWBMnVdSxpxM3BS3OtcU/6/prlEmeBaYjXXy94VlWf3TDAM
         zS6cYTCVCEvsx5UZj8MURlu6LyrfhxTpsARfP8U4RjEhzirSAZkyJF4RNazPDOBIk4s+
         9AYFovpdhO4fjFL+x+oIUcWNXxKA863+Yus5WsVMlAEZLGR93gS8LeSGH2+GuR+KSisX
         C8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383276; x=1789988076;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uR4S+flbKftxTsnvkVTTjO2b1d5a5haTCsx34TGyzE0=;
        b=Tno5hLq1SE7IjIgBPIho9ojyphvxtn5W1NBI5bsOGuHB8XzAKpWG7FNu3FwgeR/IsO
         GWkmisvnzHy7YxItmB8sPqhtUc/FuXBocQHVJBbWxAwcUhce4o/AEJPF8MMsCsEFvgZl
         6siND9wOPFliayTZ3Mk1/AKBuiV3FDjeI74y9RtY1lCm+W4Y9YVRED/xx3LE1Vp+XbGa
         6pVFaDDmQ+jWi9VUzwJ7x4g7Vdr6vQvxpnWDnW2nKDGcfxjvh8jpmtRWudUbAyQp8KiO
         SX7pZ8GWQ+0iJ6J5bTKRYlOnDST91+SZKx9nNrVT9XeI6J+OrDpUsfhwhuU8e3vdA4Ba
         jjEw==
X-Forwarded-Encrypted: i=1; AKwUvByQYYqJHSCGwRyj9fz09o+amF5S2SF0ZfdXLU0RxPVy/c1LMe9ylK7Xyw5H+HY2jvGSnTte2P7b4qc=@lists.xenproject.org
X-Gm-Message-State: AFuF++khQQubBupK3Bu74+0Jvvh117RE/SYogOtJgeSN6RF46iGZpB96
	L7jQ1kjqWHSuHvpoaIarg1/smSDI2uNnluf8OOOfKPWTsQRROzIuCfA8rzzV2m5o
X-Gm-Gg: AYBFou0VGcYOUvZAOxs22Puhdxi0Yol+6RhZZNaGNCNsTUvDMLyR/UBl6AtFC2CkiCt
	BmLUcKU2B1Rkpk8tiJ0NDJKY8m+i0vzZaQdiOPUWoZBx1xCEy3bRKny+d5+MOd/9V3VA+DrWnrG
	PSJG9Wjlbhx+HBxMtXMG6k9Zi2ksFfhs2m1EJPKgVzxBJ/7s3xk+ioXk8hC91/qg1taRaPhe7iv
	s6+hRLLLyK00sp9m2E7jXtCn8YZHXKwERshvIZP0LDB6271cUlF3abmxmD7Ul5zZi4wvDVpSbSB
	m+zGT1uoEZQGLn2ynmlM5HfvYDzRaj9+RthuPANL2JvXP87TGPtKW97YaEu0SHx1ONU6y3gAAks
	ff1be1fx3NxSWCWUTTndfGKygOO5hvzZ0k3WQ+qzb9Jvl11NRmSES0noM8aCZjmm0HbX1CBhP+3
	4RIr7bmOSvd/Op7vv7VSa65B3UlKaY1S1JeYVzoSViNouPiY0J44XlzPIJiPM0PlYs4DfIMcpIS
	tmp7aXU4r/DAQd17HY/TK0UWQ4R2r0tbjk935lfr/EhcbpqqeBLo8nYYezOQAR5zQ==
X-Received: by 2002:a05:600c:8b74:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49e7a658021mr43224175e9.1.1789383276208;
        Mon, 14 Sep 2026 03:54:36 -0700 (PDT)
Message-ID: <d8f7e714-4c62-41a3-9a1b-aed30f4f586e@gmail.com>
Date: Mon, 14 Sep 2026 12:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/20] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
 <afef58245a58f4084e38ea1d9880282a8e8beeef.1788876411.git.oleksii.kurochko@gmail.com>
 <e1d611bc-115d-4050-89c9-9781e9900ea1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e1d611bc-115d-4050-89c9-9781e9900ea1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789383276-24B1D2A1-C43D94B2/10/73395122804
X-purgate-type: spam
X-purgate-size: 6148



On 9/10/26 2:53 PM, Jan Beulich wrote:
> On 09.09.2026 17:07, Oleksii Kurochko wrote:
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -205,7 +205,7 @@ void __init init_IRQ(void)
>>   static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
>>   {
>>       ASSERT(spin_is_locked(&desc->lock));
>> -    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
>> +    ASSERT(desc->status & IRQ_GUEST);
>>       ASSERT(desc->action != NULL);
>>   
>>       return desc->action->dev_id;
> 
> Why did an Arm change slip into a RISC-V patch?

Considering that this code is executed under the spinlock it is fine to 
not use test_bit() so it is part of dropping of bitops functions.

> 
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -325,9 +325,40 @@ static const hw_irq_controller aplic_xen_irq_type = {
>>       .set_affinity = aplic_set_irq_affinity,
>>   };
>>   
>> +static unsigned int cf_check aplic_guest_irq_startup(struct irq_desc *desc)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +/*
>> + * Shared by ->shutdown(), ->enable(), ->disable() and ->end(), which have
>> + * no state.
>> + */
>> +static void cf_check aplic_guest_irq_stub(struct irq_desc *desc)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +static void cf_check aplic_guest_set_irq_affinity(struct irq_desc *desc,
>> +                                                  const cpumask_t *mask)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +static const hw_irq_controller aplic_guest = {
>> +    .typename     = "aplic",
> 
> This is indistinguishable from aplic_xen_irq_type. Naming of both variables
> also isn't consistent

I will align names properly:

--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -316,8 +316,8 @@ static void cf_check aplic_set_irq_type(struct 
irq_desc *desc,
      spin_unlock(&aplic.lock);
  }

-static const hw_irq_controller aplic_xen_irq_type = {
-    .typename     = "aplic",
+static const hw_irq_controller aplic_host_irq_type = {
+    .typename     = "aplic-host",
      .startup      = aplic_irq_startup,
      .shutdown     = aplic_irq_disable,
      .enable       = aplic_irq_enable,
@@ -345,8 +345,8 @@ static void cf_check 
aplic_guest_set_irq_affinity(struct irq_desc *desc,
      BUG_ON("unimplemented");
  }

-static const hw_irq_controller aplic_guest = {
-    .typename     = "aplic",
+static const hw_irq_controller aplic_guest_irq_type = {
+    .typename     = "aplic-guest",
      .startup      = aplic_guest_irq_startup,
      .shutdown     = aplic_guest_irq_stub,
      .enable       = aplic_guest_irq_stub,
@@ -357,8 +357,8 @@ static const hw_irq_controller aplic_guest = {

  static const struct intc_hw_operations aplic_ops = {
      .info                = &aplic_info,
-    .host_irq_type       = &aplic_xen_irq_type,
-    .guest_irq_type      = &aplic_guest,
+    .host_irq_type       = &aplic_host_irq_type,
+    .guest_irq_type      = &aplic_guest_irq_type,
      .handle_interrupt    = aplic_handle_interrupt,
      .set_irq_type        = aplic_set_irq_type,
  };

> 
>> --- a/xen/arch/riscv/include/asm/intc.h
>> +++ b/xen/arch/riscv/include/asm/intc.h
>> @@ -15,6 +15,7 @@ enum intc_variant {
>>   };
>>   
>>   struct cpu_user_regs;
>> +struct domain;
>>   struct irq_desc;
>>   struct kernel_info;
>>   struct vcpu;
> 
> Why is this suddenly necessary? There are ...
> 
>> @@ -76,10 +82,13 @@ void register_intc_ops(const struct intc_hw_init_ops *init_ops);
>>   void intc_init(void);
>>   
>>   void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
>> +int intc_route_irq_to_guest(struct irq_desc *desc, unsigned int priority);
>>   
>>   void intc_handle_external_irqs(struct cpu_user_regs *regs);
>>   
>>   int domain_vintc_init(struct domain *d);
>>   void domain_vintc_deinit(struct domain *d);
>>   
>> +int vintc_reserve_virq(const struct domain *d, unsigned int virq);
> 
> ... existing uses of struct domain already, immediately ahead of this added
> line.

Forward declaration of 'sturct domain' was missed before so it was added 
with this change. I can drop forward declaration as you noticed that it 
hasn't been needed before this change but it still make sense to add IMO.

> 
>> @@ -78,6 +82,22 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>>       intc_set_irq_priority(desc, priority);
>>   }
>>   
>> +int intc_route_irq_to_guest(struct irq_desc *desc,
>> +                            unsigned int priority)
>> +{
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +
>> +    ASSERT(intc_hw_ops->guest_irq_type);
>> +
>> +    desc->handler = intc_hw_ops->guest_irq_type;
>> +    __set_bit(_IRQ_GUEST, &desc->status);
> 
> The revlog says you replaced all of these bitops.
> 
>> @@ -227,3 +251,240 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>>       spin_unlock(&desc->lock);
>>       irq_exit();
>>   }
>> +
>> +static struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
>> +{
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
> 
> Same here. And more elsewhere.
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
> The revlog says this line doesn't exist anymore.
> 
I will double check all the places before sending v10.

Thanks.

