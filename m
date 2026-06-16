Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D37CD98DA
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2026 10:25:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1339085.1600206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQyR-0000qb-RA; Tue, 16 Jun 2026 10:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339085.1600206; Tue, 16 Jun 2026 10:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQyR-0000qU-OD; Tue, 16 Jun 2026 10:24:51 +0000
Received: by outflank-mailman (input) for mailman id 1339085;
 Tue, 16 Jun 2026 10:24:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZQyQ-0000pH-Qf
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:24:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQyQ-003INa-60
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:24:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a31246a-bab6-0a2a0a5309dd-0a2a4505b894-38
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:24:50 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a312471-aaa8-0a2a45050019-d155dd35c846-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:24:50 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45f3cf907ceso2285369f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:24:50 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0c10sm43450507f8f.21.2026.06.16.03.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 03:24:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781605489; x=1782210289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqOPBvXHSHqKhlVfCfyf+dtpaECr7Ynlh5AXB/N0Q2c=;
        b=LnWagrZNesUnjTiOXuZK8fgyzfgKJQuQ+Qt1j9JxhkYTzYfNf8PJI7K6EWZg8WWjoj
         I1h2Wig302DAyY8dSygNNuNKW2Mh+saVvUbZ3RJ8B6nACmSeZeJGawlngla5i0bmSGsq
         uekrwiG2kAldUwAY2Bkgi48W3BFBuMsZQNSjL6uJrbV5Ce9o8+sNSet5M4YroHHx8Z2W
         YaBx41+74MXRSCVip9zKd0n7FvUQvh2nGPLrCP/tFZ47DV0AfxnMal/1UY27xzbNy7L2
         Cgs9mW/ZcOpcESdbu//39OZPTuV1DmW4hlKBJjPMf7H0H9yvds4+xFKcSlZ6n5WKJTye
         CcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605489; x=1782210289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqOPBvXHSHqKhlVfCfyf+dtpaECr7Ynlh5AXB/N0Q2c=;
        b=VNfo/XTCGS1az8yVKNZAIgDEIhRBvb242QLPXcKU1UYNWYnEbCFpwgJ73kgqUjE5tN
         R6VjB4PSFrnAYvKuz+REiC4w43r8bNAs518Xufkft3DVZkMPnQA1VO1GNPC7PptZhhNE
         NyEaLAAqf0UjjEqIR4QMxNN2J581WGECq13Gs5EWmTimY8w5xhC6Q1cQLz5fbYNE7fRy
         9LkHdyDjaDMlA1grS81/H/v+2euqJ1SBuw11BMRmzxEjIhspD0RNEOy2y9986WJtINRf
         0FsiIc94oF64gvDl03Mm1qLlgNrFlqDWkL7BLNFqw1DPGbpDLUz5eAW0v+3xtzU9HGLv
         MslA==
X-Forwarded-Encrypted: i=1; AFNElJ/CugwQYCQwqauvaG2kDRL8mbisw6qNe+dGx6L4Hshj7wdw4z1ZXha3AVWPbDXRxm8UslpPGiICYuk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkNuWs3Q+GMET2oL9IIdoIr/1SFe5KXhk9IVpU/4NaFpzMOZSJ
	L+lmK3bR8lmYrzhl3zZsltrDnjStHVz9VU8JYI9XKYjuD50U+lZNMLlE
X-Gm-Gg: Acq92OHCvdoAGGKgSJlUtKYD6fZV2uPOa6Yjq6PlLH5KYslCBIeOkQ83a2yny8b0FxR
	hZqOeaj+KlarBWuJDFblWPSRPtJT9Ufa/olRYpbzCTIGrBn7lyvoUGJ6G/JAg6RkwJaoKXDRaY/
	vse2R+cqrpWVJSKc+HtgnlGQIabZT/v52wTPUyrCSlNC5gZSKRkK/i6g2MlhLDlz0Z9BdMa1uEU
	itg7Az2IZsi09DdqmjWJ2Kd4QFRKhj5wTUjZo8A1gY+O3xFTe6MQyZOGzmMLeAigFkbJCcgo7zt
	SprxO5UP7U+GAR/eIJnXCdDRjzjHfhCiWg8tn6dI1sEIeeQHK3d8M5N93cvsQLGYv0StJPzZPMt
	ZrclQQMQrADqiprQeFkpsW+F5GGU/ZpEMg5j9f++XdnRxbYzElm9gQUXimr19punCiUrXsVG45w
	MFH0Hvy+jUuWFL3ORoTtdMSYiEKgKk7Vy9reWq8Ycu1fNI+AeiamDNrdgRJKT4nyBL61T+vn0r2
	KI1cg==
X-Received: by 2002:a05:6000:1787:b0:460:2ee5:67b8 with SMTP id ffacd0b85a97d-46074b891bcmr20468897f8f.36.1781605489296;
        Tue, 16 Jun 2026 03:24:49 -0700 (PDT)
Message-ID: <3da5b194-772c-4fb9-8b0a-194c1415dc87@gmail.com>
Date: Tue, 16 Jun 2026 12:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/26] xen/riscv: manage IRQ_DISABLED flag in APLIC irq
 enable/disable callbacks
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <6121dce6347f03030a2de05f29c1780b6fc0cd01.1778250616.git.oleksii.kurochko@gmail.com>
 <4580492d-c5e7-454d-b4a9-4bc959268cfb@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4580492d-c5e7-454d-b4a9-4bc959268cfb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1781605490-D3563443-1AAEA9AB/10/73395122804
X-purgate-type: spam
X-purgate-size: 6010



On 6/15/26 5:53 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> desc->status is only set once during setup_irq(), but interrupts can be
>> enabled/disabled at runtime, so update it in the corresponding callbacks.
>>
>> wmb() in aplic_irq_enable() ensures do_IRQ(), which can fire immediately
>> after the interrupt is enabled, sees the updated desc->status.
> 
> This doesn't look entirely correct. Aiui ...
> 
>> No rmb() is
>> needed on the do_IRQ() side because desc->status is read under a spinlock,
>> which implies an acquire barrier.
>>
>> No barrier is needed in aplic_irq_disable() because the hardware disables
>> the interrupt before the status is updated, so do_IRQ() cannot fire, and
>> spin_unlock() makes the updated value visible.
>>
>> Fixes: d4676a1398bc5 ("xen/riscv: implementation of aplic and imsic operations")
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - New patch.
>> ---
>>   xen/arch/riscv/aplic.c | 5 +++++
>>   xen/arch/riscv/irq.c   | 3 ---
>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -161,6 +161,9 @@ static void cf_check aplic_irq_enable(struct irq_desc *desc)
>>   
>>       spin_lock(&aplic.lock);
>>   
>> +    desc->status &= ~IRQ_DISABLED;
>> +    wmb();
>> +
>>       /* Enable interrupt in IMSIC */
>>       imsic_irq_enable(desc->irq);
> 
> ... you want to order the ->status update ahead of the imsic_irq_enable()
> operation. Yet that's a CSR write. Do fences really cover that?

Good point. The RISC-V ISA spec is clear that fence orders memory 
predecessor and successor operations. CSR accesses are architecturally a 
distinct category. fence w,w carries no formal guarantee that a 
preceding memory store to desc->status becomes visible before a 
subsequent CSR write.

Also, according to the spec:

Each RISC-V hart normally observes its own CSR accesses, including its 
implicit CSR accesses, as performed in program order. In particular, 
unless specified otherwise, a CSR access is performed after the 
execution of any prior instructions in program order whose behavior 
modifies or is modified by the CSR state and before the execution of any 
subsequent instructions in program order whose behavior modifies or is 
modified by the CSR state. Furthermore, an explicit CSR read returns the 
CSR state before the execution of the instruction, while an explicit CSR 
write suppresses and overrides any implicit writes or modifications to 
the same CSR by the same instruction.

and ...

  If not,
> you may need to resort to mb(), to order the ->status write against the
> ->irq read, in lieu of being able to order against a CSR write.
> 
> Of course with imsic_irq_enable() itself acquiring a lock (which
> necessarily has a memory write), you could then further argue that wmb()
> is indeed sufficient, bot for a reason different from the one presently
> stated in the description. (I would also strongly suggest to annotate the
> wmb() with an explanatory comment.)

...

After re-looking at imsic_irq_enable() it is calling 
imsic_local_eix_update() which targets the local hart's IMSIC interrupt 
file (note the function name), and IRQs are disabled at this point (the 
ASSERT(!local_irq_is_enabled())). So do_IRQ() can only fire on the same 
hart, after IRQs are re-enabled on return from aplic_irq_enable(). 
Same-hart program order already guarantees desc->status is committed 
(before of the mentioned above) before the CSR write retires, making the 
barrier redundant.

So barrier could be dropped here.

On the other side if some code will check on different CPU what is 
desc->status without a barrier it will see a stale value. But then in 
this case we have to use or atomic set_bit() here or 
spinlock(desc->lock) around an update of desc->status. Then the similar 
is needed for aplic_irq_disable().

> 
>> @@ -189,6 +192,8 @@ static void cf_check aplic_irq_disable(struct irq_desc *desc)
>>       /* Disable interrupt in IMSIC */
>>       imsic_irq_disable(desc->irq);
>>   
>> +    desc->status |= IRQ_DISABLED;
>> +
>>       spin_unlock(&aplic.lock);
>>   }
> 
> The ->status write becoming globally visible ahead of imsic_irq_disable()
> doing its work is not an issue? In the paragraph in the description you
> again appear to assume that the CSR write and the memory write of the
> spin-unlock are ordered wrt one another.

The ordering is intentional: desc->status |= IRQ_DISABLED is placed 
after imsic_irq_disable() so that do_IRQ() can never observe 
IRQ_DISABLED while the interrupt is still enabled in hardware.

Regarding the fence/CSR ordering concern: imsic_irq_disable() writes to 
the local hart's IMSIC interrupt file, so do_IRQ() for this irq can only 
run on the same hart. Same-hart program order already guarantees that 
both the CSR write and the desc->status update are visible in the 
correct sequence before any subsequent interrupt handler runs.

> 
>> --- a/xen/arch/riscv/irq.c
>> +++ b/xen/arch/riscv/irq.c
>> @@ -145,9 +145,6 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
>>           desc->handler->set_affinity(desc, cpumask_of(smp_processor_id()));
>>   
>>           desc->handler->startup(desc);
>> -
>> -        /* Enable irq */
>> -        desc->status &= ~IRQ_DISABLED;
>>       }
> 
> Arm and x86 are different in this regard, so it's hard to tell which way
> it ought to be for RISC-V. This removal surely wants a sentence or two in
> the description.

I will add the following to commit description:

The removal of desc->status &= ~IRQ_DISABLED from setup_irq() is safe 
for RISC-V because aplic_irq_startup() calls aplic_irq_enable() 
directly, which now clears the flag itself. The explicit clear in 
setup_irq() is therefore redundant.

Thanks.

~ Oleksii

