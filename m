Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BA0CA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:38:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437384.1656275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvSC-00048Q-Ss; Wed, 30 Sep 2026 14:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437384.1656275; Wed, 30 Sep 2026 14:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvSC-00048J-Pl; Wed, 30 Sep 2026 14:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1437384;
 Wed, 30 Sep 2026 14:38:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBvSB-000487-0e
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:38:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBvS9-00CiIA-V2
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:38:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd1ee5-bab6-0a2a0a5309dd-0a2a4509de70-32
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:38:37 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd1eed-be1a-0a2a45090019-4a7de162ac43-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:38:37 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48affb828f1so880983f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:38:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029edea4sm4307062f8f.22.2026.09.30.07.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 07:38:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790779117; x=1791383917; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBf0sKBAYGIevVR2sKEuKTDrhc+45zCJhlPo48JzdmI=;
        b=cD8U+sx4eIPft6J3fveYDYzoz9dj2XHz0W0CN/E5bYbj2/f8s8j11OBOJDNH5zQzut
         LwW7LVDt6EELS3PeOode83gojQOi1LC4pmN++zk+xjI6VfZhNJMaXvX3Ir56oycIHw+A
         D0Dg1cJYj2xPdNR6av/5Pb0kLxcjLMZ8Iv0cu6419rrGXpJs7ue1nrhB0aiPUqsHftJj
         5p5CBXYZ25IIy+WRRKKgY3aN88/pvFeR71cOdYMN6Ll525g/zj9ReFYCPIsm0qviJnRx
         2ybXXmahvERDauy7sB99pJJXHTrMs6xFPHOXy3EjbUyMkGItRuwi+9FoPwnuiTiEjG2r
         L6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779117; x=1791383917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBf0sKBAYGIevVR2sKEuKTDrhc+45zCJhlPo48JzdmI=;
        b=FqVsRLKjxs2gPVbNLlEvbr/RNBD3NL/LE02wFI0N1L8Ksx2RpCQ6cK1mUsDdyKXQqM
         IS96oKesLne87cxP32MqwXdN/UJ9f/6D3FHGmvDcZb9/hoPhfrZ+WkC8eTfDPTDWiCGS
         ZMTHItyTHo1Uvp8F0BULuwnFBhIX7yVS4TJBRi62Dr3eJ6cvSjaSyx92+EAAu6Aqawbo
         Y0OOOGmOqFENhdw6V2FHPZ05eAaQrId5nbqknBgQ8t9AvhTrHFwqb54pc82dugoizIpf
         sghY9bilbPVTsMqXmePXH6dl4sDooPXTAV9uJK90DlyF8DQ4vda/tc6lQfTBr/iv5xgD
         +s+w==
X-Forwarded-Encrypted: i=1; AKwUvBwE0Ld/FwTJE/K7dt7+8d7vHM1XBNjYCL5xEJRJIuCI2/RF1JzsYy6UzyStCi5rU1NV39OcwOeAPv0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIpLJZdO63RCOXILpaRHtTYG7w6kZLVfIxJ+4axy4fKMQ9r4O3X
	0RLfds0ktKVKHWFX2NyMOQeewHd0RdI32SROdHofEqoxbfrOLeCFWwjg
X-Gm-Gg: AYBFou1D9AeJhQv4WRXwqwmmAK+Zc1FmDmzeEdgmYTP7OFPLQlkmTLbX2pTv8sVv33l
	s8N9/hIHdQaWtlpveEfGjmhBOCTh7wz7uHrdBO+8kt2qfe24Rfdz4Jbiui0pxnEFt1lPpjdEEX/
	JVfogP49SlhfbX5JoJQ2PDm12HqjOTdQZwrqBhzgJwqVrGVAmcBD5H8oHtWnx+IEjXROou3bAd8
	CQVQTXahD5u8nwEEqJPbsENozJWdbLBUK8IvX+CDeByqcEPXkmVVgf0q5HPbrcaVHn3wvfmg/+M
	peLefJn2XCzyee0Oh4BCkz/e0xQFLeDRuhCLq0VfZx7hPouebyj79KQXa1XMz8HApNtHj91T0ry
	qBymSI4Uu2dP9w7iBKl2Wah0StFPG53VWIq56w+tdNiNSJvpag59TjCOuDJt3Xi4XPuJQg4cb1L
	BPbt1/KOXJR8iR8OV2ubgEDGZ65h2jGMYb+e6zF+ml296QlvWV8u1UeUMhrZkL5eaYmK90qVmuV
	1Ew+Kcx5Xl3wZdGBWPMtOjoxzPa8ZzqRMgeJnr2tcP/ghCuQg==
X-Received: by 2002:a5d:5f87:0:b0:488:8a5d:ffc3 with SMTP id ffacd0b85a97d-48b024c57eamr3473142f8f.11.1790779116459;
        Wed, 30 Sep 2026 07:38:36 -0700 (PDT)
Message-ID: <9a3113c2-1c38-44d0-a41f-bc25de309b98@gmail.com>
Date: Wed, 30 Sep 2026 16:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] xen/riscv: implement IRQ routing for device
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
References: <cover.1790158750.git.oleksii.kurochko@gmail.com>
 <99d3f072b0c4b97e2ebac8b227bd57f90e780605.1790158750.git.oleksii.kurochko@gmail.com>
 <52703422-cc20-472d-96be-68d9a4f17fbc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <52703422-cc20-472d-96be-68d9a4f17fbc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1790779117-39CC7034-7D1A5367/10/78276251493
X-purgate-type: spam
X-purgate-size: 6461



On 9/30/26 1:56 PM, Jan Beulich wrote:
> On 23.09.2026 12:26, Oleksii Kurochko wrote:
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
>> route_irq_to_guest() and release_guest_irq() manage irq_desc ownership
>> for guest-assigned interrupts.  Each assignment carries a small irq_guest
>> structure as irqaction::dev_id, recording the owning domain and virtual
>> IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
>> vIRQ allocation bitmap (used_irqs in struct vintc), managed by
>> vintc_reserve_virq(), prevents the same vIRQ being claimed twice.
>>
>> Host and guest interrupts may differ in some operations, EOI timing in
>> particular: a host IRQ is completed once Xen's handler runs, whereas a
>> passthrough IRQ must defer the physical completion until the guest issues
>> its own EOI, otherwise a still-asserted level line would immediately
>> retrigger and storm.  Hence a separate guest hw_irq_controller instance,
>> aplic_guest_irq_type, rather than an alias of the host one.
>>
>> Its callbacks are BUG_ON("unimplemented") for now.  The only interrupt
>> controller configuration supported so far is APLIC in MSI mode together
>> with IMSIC, where guest interrupts are delivered by hardware straight to
>> the guest's interrupt file, bypassing do_IRQ() and thereby Xen entirely.
>> The _IRQ_GUEST branch in do_IRQ() is left as BUG() for the same reason.
>> Real callbacks, .end() in particular, become necessary once a platform
>> without direct IMSIC delivery has to be supported, where Xen traps the
>> interrupt and injects it into the guest itself.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> 
> One nit:
> 
>> Changes in v8:
>>   - vintc_reserve_virq(): return an error code instead of a bool: 0 on
>>     success, -EEXIST when the vIRQ has already been reserved (which
>>     legitimately happens for an IRQ shared between devices) and -ERANGE
>>     when the vIRQ is outside the range the vINTC provides. Document the
>>     function and its return values.
>>   - vintc_reserve_virq(): mark it __overlay_init, as its only caller
>>     map_irq_to_domain() is __overlay_init too. Add the <xen/dt-overlay.h>
>>     and <xen/errno.h> includes this needs.
>>   - map_irq_to_domain(): check the return value of vintc_reserve_virq()
>>     and propagate anything but -EEXIST. Otherwise the IRQ would end up
>>     routed to the domain without domain_vintc_deinit() ever releasing it
>>     again. Update the stale comment accordingly.
>>   - domain_vintc_deinit(): only walk used_irqs and free it if it has
>>     actually been allocated. domain_vintc_init() can fail after the vINTC
>>     itself has been allocated, leaving used_irqs NULL.
>>   - irq.c: split the body of release_irq() into two helpers:
>>     irq_detach_action(), which removes the action matching dev_id from
>>     desc->action with desc->lock held, and irq_release_action(), which
>>     waits for a handler still running on another CPU and frees the action
>>     with desc->lock dropped. Both document the locking rules they rely on.
>>     release_irq() is now just a wrapper around the two.
>>   - release_guest_irq(): use irq_detach_action()/irq_release_action()
>>     instead of open-coding __clear_bit(_IRQ_GUEST, ...) followed by
>>     release_irq(), which looked the action up by dev_id a second time.
>>   - release_guest_irq(): drop the -EBUSY restriction that only allowed
>>     unrouting from a dying domain. Detaching the action under desc->lock
>>     now closes the window this was working around.
>>   - route_irq_to_guest(): on the intc_route_irq_to_guest() failure path,
>>     detach the action while desc->lock is still held and only release it
>>     after the lock has been dropped, instead of dropping the lock first
>>     and calling release_irq().
>>   - route_irq_to_guest(): initialise desc at its declaration.
>>   - irq_get_guest_info(): use ASSERT(desc->action) instead of
>>     ASSERT(desc->action != NULL).
> 
> Along the lines of this, and in line with ...
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
> 
> ... e.g. this, ...
> 
>> +        return -ENOMEM;
>> +
>> +    info->d = d;
>> +    info->virq = virq;
>> +
>> +    info->action.dev_id = info;
>> +    info->action.name = devname;
>> +
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
> 
> ... this would more consistently be "if ( desc->action )". I think I'll take
> the liberty to adjust this while committing.

I will be happy with that.

Thanks.

~ Oleksii

