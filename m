Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0A2C88E72
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 04:55:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423626.1648603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x749M-0000OR-Pa; Thu, 17 Sep 2026 04:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423626.1648603; Thu, 17 Sep 2026 04:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x749M-0000OK-M2; Thu, 17 Sep 2026 04:55:08 +0000
Received: by outflank-mailman (input) for mailman id 1423626;
 Thu, 17 Sep 2026 04:55:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x749K-0000OE-PI
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 04:55:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x749I-004UiQ-Km
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 06:55:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aab7293-bab6-0a2a0a5309dd-0a2a4505e6d8-38
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 06:55:04 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aab72a8-4cb1-0a2a45050019-4a7de18dc760-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 06:55:04 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e69b9e16aso3831845e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 21:55:04 -0700 (PDT)
Received: from [10.250.112.129] (h-213.61.72.154.host.de.colt.net.
 [213.61.72.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd24108asm43188605e9.9.2026.09.16.21.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 21:55:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789620904; x=1790225704; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a8oqEQkzkKnAgHJ1zAnZI8QD5OUD1n2euF6jqK2YUcA=;
        b=PEg/r1LTCgk1Zux5YzBTRxGqb4K9jI80VRXUvBOwdcfg+7uCdpPVMLcJ1KdsgFRpwJ
         ldiiyaHu23iqGG9hPKwF+CqjSVY1h0YYJVYfjeILfYaFPkEP6kM3QSRqlaTBOGHKEhZe
         zztLB6MT7DfpA3l0HEJRYmBQbnq/xrztO6u9YuFeVdG2574vqERHpBOkemp+rfCX6MUM
         dCagPPeguhVEXcCRgqbHaxf9agebPqZnMNuMQpfP9AsJJ3VTcJ0YOZ3JI5wDefAsNakc
         QnjBzEdAwX01rrY4t9PGDBJ/UdWVnuDGiLVkZaCMAKXv/a/iBMuYtZytN/w7mSnkQRJB
         H6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620904; x=1790225704;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a8oqEQkzkKnAgHJ1zAnZI8QD5OUD1n2euF6jqK2YUcA=;
        b=yi5mHlaFn8gvmastLk7X6NvjIrWnRocsWv4yeJVcStZ7j3h0C+wQGhCumJ64fM/HX9
         E8Ix5O4rf7f+JWBW9q1eoLi7oa1dOYMnqqTmaCfNT32iEs9NBX45AuRZNAddZpTXJoxT
         O368OCQ19kz4ZiPw/+6GkE86DlFyeD8Vo1wtr7O4T2bo4dRpaAdF5U4GwgfZsf0eJ9fc
         vo8+rCmRA6x5FwRWQmHOWs6SlDYYonl9Jw88iPD8cKhJqrVTrokWPa196HYq9kZRpyN6
         D8r92xuICqSnifbeSjaklzvvHzYmygHIT7KoM10VF0YlYrXvuJoDodYIfkZs2M6MZkrF
         a81A==
X-Forwarded-Encrypted: i=1; AKwUvBzRVLnU1SUqqWYYeXNJFmEsWeZR1HIbi8/jOEMu1Xqneazff8AhJxMOZJvWnm1XJzGVm72y079oh8Y=@lists.xenproject.org
X-Gm-Message-State: AFuF++ngdGnuQwova36Yb67GpKnH4QEfwbJ2eKtmhXLYZh6IELnTWz5h
	vlOO/6+t8yPwfnI0LtuOQZaMSZN7DzPettjznhjPXwB4RnwU1zaNUQRNpz3ygr7b
X-Gm-Gg: AYBFou2RkjFcBNu1LDY8dhbRX+5Fze7D4Ec+Q7O8Fj7lPZmUH7n3/tkDhQT6v6Kfvaz
	xBVcVZL2hsE2pGX+LAvwxLguU7wQhYuqx3d95vRXfmmEylEZOZkR15g17NDpsKHh8jBL9yq4/Ia
	2BJL1QBrjtVa/wSIyUM+XtRWHfmkvxH8d5sVQbS5Lu4QEtB5NAIvHyRo6gvw2LKWaw8fefIdg5x
	MaxJs67CRhXs5UtYOMyQEiljw4DbCLAm+yF2964MYgNG8+sF2i1tYq1q+cu4Ehf3HhJaPoJZH5a
	mJwIlFBtiACQNePSWEaDdZbdJQuYo8FhZTpV0fLZ1HDBg8AMOfvTGZKPGaUEScWAfgf4joYv9Qs
	2/7mWZP0DREkTNbxkFoyjdrZ4DHpLM1aTa+bF18C5sU7gtWWZva90hS2erjFQfTcGpJtBceRf0f
	AftkpHhoPAxHkeAKnWHI/907QYOkpLWjzfJrMtJiUuZUMEUlphJ26YDVmKO5ZQoaroleFUlCxi7
	PZaAjes8RCTpCntyHsaLYdI5wHRzOcKNp5JiJ23wZQJgcs=
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49eb7339916mr63107195e9.31.1789620903846;
        Wed, 16 Sep 2026 21:55:03 -0700 (PDT)
Message-ID: <75658755-ba86-4089-85f4-fb608f628d7b@gmail.com>
Date: Thu, 17 Sep 2026 06:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 29/39] xen/riscv: introduce aplic_reconfigure_target()
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
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <d90832888c1bcb08146a6c36591ac0c31b8b0ce1.1787838835.git.oleksii.kurochko@gmail.com>
 <2e29de1d-370d-4251-8e1d-dd9f17720339@suse.com>
Content-Language: en-US
In-Reply-To: <2e29de1d-370d-4251-8e1d-dd9f17720339@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789620904-F429B2A1-6620D7E6/10/73395122804
X-purgate-type: spam
X-purgate-size: 4695



On 9/14/26 2:25 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> When a vCPU is migrated to a different pCPU, its IMSIC guest interrupt
>> file changes. Any APLIC interrupt previously configured to deliver an
>> MSI to the old interrupt file must be retargeted to the new one.
>>
>> Implement aplic_reconfigure_target() to scan all interrupts allocated
>> to the domain and update their APLIC TARGET registers accordingly.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> First of all I'd like to understand how this "reconfigure" works without
> losing interrupts and at the same time without other possible races. An
> interrupt can be raised at any time, after all.

The RISC-V AIA specification relies on this separation for the 6-step 
vCPU migration sequence:

Step 1. Setting eidelivery = 0 at the old interrupt file stops new traps 
on the host CPU.

Step 3: Reconfiguring APLIC/IOMMU and flushing the interconnect forces 
all in-flight "straggler" MSIs to reach the old interrupt file.

Step 4: Because eidelivery = 0 did not block incoming MSIs from setting 
bits in eip, those straggler MSIs safely landed in the old eip array.

Step 5: The hypervisor reads/dumps the old eip array and bitwise ORs it 
into the new interrupt file, guaranteeing that no in-flight MSIs are 
lost during the transition.

(Note that I re-word some steps and skipped some for simplicity. Here 
you can find full text: 
https://github.com/riscv/riscv-aia/blob/main/src/VSLevel.adoc?plain=1#L134)

Does it make sense now?

> 
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -138,6 +138,48 @@ uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
>>       return base_val;
>>   }
>>   
>> +void aplic_reconfigure_target(const struct vcpu *v,
>> +                              unsigned int old_guest_file_id,
>> +                              unsigned int old_cpu)
>> +{
>> +    const struct vintc *vintc = v->domain->arch.vintc;
>> +    const unsigned long *auth_irq_bmp = vintc->used_irqs;
>> +    unsigned long old_hart_field = aplic_hart_field(old_cpu);
> 
> Once again a question you may already recognize: What extra value does
> "field" in the variable name add?

Because aplic_hart_field() construct target's part of hart field which 
isn't contains only pure hart value (apparently, thanks to the way how 
spec is written and things are done).

Note that based on other reviews from this patch series it is renamed to:
   unsigned long old_hart_index = aplic_hart_index(old_cpu);
(and here _index for the same reason it is basically how AIA spec calls 
this part of the target register)


> 
>> +    unsigned long flags;
>> +    unsigned int irqn;
>> +
>> +    /* Support only MSI mode at the moment */
>> +    BUG_ON(!aplic_msi_mode());
>> +
>> +    spin_lock_irqsave(&aplic.lock, flags);
> 
> Taking a global lock for a per-vCPU operation isn't going to scale
> very well. Even more so when then ...
> 
>> +    bitmap_for_each ( irqn, auth_irq_bmp, vintc->nr_virqs )
> 
> ... you run a loop with perhaps many (hundreds? thousands?)
> iterations.

I agree.

Then per vcpu's target register lock (or per-irq lock) + APLIC's global 
lock mention here only for a short period when APLIC register would be 
needed.

I've done such change for support of IMSIC software interrupt file but 
it seems like it is started to need earlier.

> 
>> +    {
>> +        volatile uint32_t __iomem *ptarget;
>> +        uint32_t target_val;
>> +        unsigned int guest_index, hart_index;
>> +
>> +        if ( !irqn )
>> +            continue;
>> +
>> +        ptarget = &aplic.regs->target[irqn - 1];
>> +        target_val = readl(ptarget);
>> +
>> +        guest_index = MASK_EXTR(target_val, APLIC_TARGET_GUEST_IDX);
>> +        hart_index = MASK_EXTR(target_val, APLIC_TARGET_HART_IDX);
>> +
>> +        if ( (guest_index != old_guest_file_id) ||
>> +             (hart_index != old_hart_field) )
>> +            continue;
> 
> Along the lines of the naming comment above: This would be more
> logical to follow if it was
> 
>          if ( (guest_id != old_guest_id) ||
>               (hart != old_hart) )
>              continue;
> 
> i.e. names on each side of the != suitably matching up.

I agree with guest_id suggestion but hart_index should be left as 
according to the spec what is stored in hart index field of target 
register isn't pure hart cpu id but it is a combination of hart cpu id + 
group index (check the comment above aplic_hart_field() for better context).

Thanks.

~ Oleksii

