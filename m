Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73412CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 14:06:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449121.1665058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzc8-0006wK-Jc; Wed, 14 Oct 2026 14:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449121.1665058; Wed, 14 Oct 2026 14:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzc8-0006wD-GU; Wed, 14 Oct 2026 14:05:52 +0000
Received: by outflank-mailman (input) for mailman id 1449121;
 Wed, 14 Oct 2026 14:05:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGzc7-0006w7-RS
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:05:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGzc7-00CRsc-8R
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:05:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf8c31-8faa-0a2a0a5109dd-0a2a450aebb0-48
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:05:51 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf8c3e-f2d2-0a2a450a0019-d1558035e5f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:05:50 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a1682bff3cso4616625e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 07:05:50 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs378609.centertel.pl. [37.47.110.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bcf3c8b8sm3707235e9.10.2026.10.14.07.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 07:05:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791986750; x=1792591550; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFJJL+9AqxcnZpFPPjUKvHI8vqTS8pUG9i6dcJfjtco=;
        b=HfgxHG60p2sxSkSp1arBoTwqsJXmAP94KL0tHUvE7DRD1dKzYIamB/eXq2/PjMew6j
         SvMnmYMCciFW4vtSG5EaF/0nHkv0qcqRDBjHUeaCCWl6H/YmnjIa/uy7S5lDX5nb93tI
         IqOO+SnnYoFX3E9xCFXUmzPomuv8ZrBJoa4Xyr1hW+VYDahUQfjV9dF2no8fZGKJmkaJ
         L1rrtZtaSKB1bIrFWt75s9rXAgP05mzpNREuqwSaWUB7tJc2YpkAwzy/kBy7zwLAd5fN
         gCTlf1v2n8vQTrSTe/Gp3o3ZPXOSbf+3d+U4iRDVSflvcBUj6h0UnEm4OdsdbFROXl2Y
         GZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986750; x=1792591550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFJJL+9AqxcnZpFPPjUKvHI8vqTS8pUG9i6dcJfjtco=;
        b=zkjHlxVpYm2b5qwuO1zQuVFPexopXvkCBzgCfU7G3X62RLcxHRutvLjIA5kL8c3YfO
         umTGcVtfnngJ2V8C3IuSXitT8km0v1ypfdBbtoR4Kl1iEt/GZbqJ2yQi9gQw/ag34AvQ
         XOwy1cKP01P7LFb979+W/hEYbFodNqMDbdoxzUov9p58UlA5lxMXNYOPM5IcpOzZG0QA
         Bpy0U96QyCVnZ1qTyJZ/vwp9jA43WGBq7LkJfkW/nMuuH+MjoqaHBe9KDqDfLVcOPn34
         FF0d2T1Osg8hgN+PUtneSWJqi2cmwVsljBnb+IEO7Ebp8MtPcfHVH7+YzjX/sNJh4A7b
         QRfQ==
X-Gm-Message-State: AFq9FYKxHVGvcgv4DSnMu9cqnWn9gmroy1RvvabVFsIrJZ2wQmPR4eCL
	wFy5wm15aWgxcmiDVp2/Lat5SugtuT6PXHsw2/HM4WSoj2/mtwc72Imy
X-Gm-Gg: AYBFou3bFTY7s4uiig/fdBBX4zl8NyOuPBJk774Ycd7WSE+RUX+ivsiOlulCfCUlXVa
	Bq9+VumQT8uzWwjXUu54FrPMAhjsM+vvYXV1W1DYh8xZOx7w3arH5KRhIClRJshnoSmGHHL+aPm
	SDu936yryQs9Q0FTbDmRuoMu11yIjiE255SM4OdKKxpFIzmBMFvOmlzZH6JviKTc6x99T0BPWy2
	IicVBdGFj9Z2uD/+fnUZb9Cfhz/UyEes4NCxirJ3Khl+rxzOjAtQJe6zierQt1oFR8nQO0n/M8W
	rVmlOLfC7FYAuxotfJQ1wNBhr6Rn0HPdNe31X/C3xV2UbGG1AjTgxfUVsZOmUmrwJpJIIkg3fna
	2Iq7GhKpXw1UcdsPEKQ9vAENcjmJSur/n1qpomYFPGBMhzKGA5+o4x0jcVIZBeRpH0ShXSfiq1V
	meCQl6BL/CK8hSRTJJYeH720wE/68PBBM9hh55Z3uDPDmUHvZFezMGTGKJdfb+SL3X8fRNu5UjG
	vUdfP+SuzwMZRf3yQ5ZbL0ALdAkgVdF7u3Tzxk=
X-Received: by 2002:a05:600c:c16f:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-4a18e3ef314mr305314675e9.0.1791986749968;
        Wed, 14 Oct 2026 07:05:49 -0700 (PDT)
Message-ID: <9ac3fdbe-9f3b-4abd-ab8d-7e252a7cf809@gmail.com>
Date: Wed, 14 Oct 2026 16:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/39] xen/riscv: implement vCPU context switching
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <6e539cc5ded7f62c4347781785af714840893184.1790779209.git.oleksii.kurochko@gmail.com>
 <1791305420.8631fc262581453bbf619ec5b2062170.1a1121f8fef0003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791305420.8631fc262581453bbf619ec5b2062170.1a1121f8fef0003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791986750-536D6CFC-5EC1067A/10/73395122804
X-purgate-type: spam
X-purgate-size: 8399

[...]

>> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
>> index a5cb24c863..aad82c6a6d 100644
>> --- a/xen/arch/riscv/include/asm/csr.h
>> +++ b/xen/arch/riscv/include/asm/csr.h
>> @@ -40,6 +40,13 @@
>>       csr_write(csr ## H, v_ >> 32);  \
>>   })
>>   
>> +#define csr_read64(csr)                 \
>> +({                                      \
>> +    uint64_t v_ = csr_read(csr ## H);   \
> This violates Misra 20.12 rule (docs/misra/rules.rst) as we use macro
> parameter `csr` as an operand of ##, while it could be expanded as a
> macro (e.g. csr_read64(CSR_HENVCFG)).

To avoid MISRA violation, if i understand it correctly, I will do the 
following:

+#define csr_read64(name)                       \
+({                                             \
+    uint64_t v_ = csr_read(CSR_ ## name ## H); \
+                                               \
+    (v_ << 32) | csr_read(CSR_ ## name);       \

and ...

>> +                                        \
>> +    (v_ << 32) | csr_read(csr);         \
>> +})
>> +
>>   /*
>>    * The two halves are read by separate instructions, so a CSR which hardware
>>    * increments can carry from the low half into the high one in between,
>> @@ -72,6 +79,12 @@
>>       (void)csr ## H;                 \
>>       csr_read(csr);                  \
>>   })
>> +
>> +#define csr_read64(csr)             \
>> +({                                  \
>> +    (void)csr ## H;                 \
> Same as above.

... the following here:

+#define csr_read64(name) csr_read(CSR_ ## name)


>> +    csr_read(csr);                  \
>> +})
>>   #endif

[...]

>> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
>> index de25607247..02e7f6364f 100644
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -243,6 +243,15 @@ static void p2m_tlb_flush(struct p2m_domain *p2m)
>>   
>>       p2m->need_flush = false;
>>   
>> +    /*
>> +     * Order the p2m updates above against the read of dirty_cpumask below,
>> +     * pairing with the barrier in p2m_vmid_switch_to(). Either that hart is
>> +     * seen here and gets an HFENCE.GVMA, or it adds itself to the mask
>> +     * afterwards, in which case it starts walking this p2m only once the
>> +     * updates are visible to it.
>> +     */
>> +    smp_mb();
>> +
>>       sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
>>   }
>>   
>> @@ -1504,16 +1513,110 @@ void p2m_ctxt_switch_from(struct vcpu *p)
>>        * VMID, world-switch code should zero vsatp, then swap hgatp, then
>>        * finally write the new vsatp value what will be done in
>>        * p2m_ctxt_switch_to().
>> -     * Note, that also HGATP update could happen in p2m_handle_vmenter().
>>        */
>>       p->arch.vsatp = csr_swap(CSR_VSATP, 0);
>>   
>>       /*
>> -     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
>> -     * or/and in p2m_handle_vmenter().
>> +     * Nothing to do with HGATP as it will be updated in
>> +     * p2m_ctxt_switch_to().
>>        */
>>   }
>>   
>> +/*
>> + * Domain whose p2m this hart's HGATP points at. ctxt_switch_to() bails out
>> + * early for the idle vCPU, so HGATP survives a pass through idle and keeps
>> + * pointing at the domain which ran here last. That domain, rather than the
>> + * one the scheduler switched away from, is what owns this hart's G-stage
>> + * translations. The hart also keeps its place in the owner's dirty_cpumask:
>> + * p2m_tlb_flush() goes on reaching it, and a domain which idles between two
>> + * runs on the same hart keeps its VMIDs.
>> + *
>> + * TODO: nothing resets hgatp_owner when its domain is destroyed, so a hart
>> + *       which stays idle from the domain's last run until it is freed is
>> + *       left with a dangling pointer. Once domain_relinquish_resources()
>> + *       tears down the p2m, it has to reset hgatp_owner of every hart still
>> + *       pointing at the domain (cmpxchg() against d), i.e. before the RCU
>> + *       grace period of domain_destroy() and so before the domain is freed.
>> + */
>> +static DEFINE_PER_CPU(struct domain *, hgatp_owner);
>> +
>> +/*
>> + * Update this hart's place in the dirty_cpumask of the domains involved and
>> + * claim a VMID for n. Must be called before HGATP is pointed at n's p2m, as
>> + * it is written with the VMID claimed here.
>> + */
>> +static void p2m_vmid_switch_to(struct vcpu *n)
>> +{
>> +    unsigned int cpu = smp_processor_id();
>> +    struct domain *owner = this_cpu(hgatp_owner);
>> +    bool need_flush;
>> +
>> +    ASSERT(!is_idle_vcpu(n));
>> +
>> +    if ( owner != n->domain )
>> +    {
>> +        /*
>> +         * Once this hart drops out of the owner's dirty_cpumask it stops
>> +         * being a target of p2m_tlb_flush(), while its TLB may still hold
>> +         * G-stage translations of that domain: none of the vCPUs of that
>> +         * domain which ran here has had its VMID invalidated. Move the hart
>> +         * to a new VMID generation so that none of them can be reached
>> +         * again.
>> +         *
>> +         * This has to precede the VMID claim below, so that n gets a VMID of
>> +         * the new generation.
>> +         */
>> +        if ( owner )
>> +        {
>> +            vmid_flush_hart();
>> +
>> +            cpumask_clear_cpu(cpu, owner->dirty_cpumask);
>> +        }
>> +
>> +        /*
>> +         * Mark this hart in the incoming domain's dirty_cpumask before HGATP
>> +         * is pointed at its p2m: from that write on the hart may cache the
>> +         * p2m's translations, so p2m_tlb_flush() must already reach it.
>> +         */
>> +        cpumask_set_cpu(cpu, n->domain->dirty_cpumask);
>> +
>> +        /*
>> +         * Pairs with the barrier in p2m_tlb_flush(). cpumask_set_cpu() is an
>> +         * unordered AMO on RISC-V, so without this a concurrent flusher could
>> +         * read the mask without this hart in it while this hart is already
>> +         * walking the p2m it is about to be pointed at.
>> +         */
>> +        smp_mb();
>> +
>> +        this_cpu(hgatp_owner) = n->domain;
>> +    }
>> +
>> +    /*
>> +     * A VMID is meaningful only on the hart whose pool issued it: generations
>> +     * are per-hart counters which all start at 1 and advance independently,
>> +     * so the pair a vCPU brings from another hart may match this hart's
>> +     * generation by coincidence, leaving the vCPU under a VMID which is live
>> +     * here for someone else.
>> +     */
> So if I understand correctly, we are setting generation to 0 to mark the
> vCPU that it is coming from other hart right?

Yes, at least that is the case this code deals with. Strictly speaking,
generation 0 just invalidates the vCPU's VMID, so that a new one is
claimed on the next VM entry; vmid_flush_vcpu() could be used wherever
that is needed, coming from another hart being one such case.

> Nit: If it's the case I may simplify the comment to:
>        /*
>         * VMIDs and generations are per hart, so a pair issued on another hart
>         * may match this hart's generation by coincidence. Reset the generation
>         * to 0, which no hart ever uses, so that a fresh VMID is claimed from
>         * this hart's pool.
>         */
> 

Looks good to me, I'll take it.


>> +    if ( n->arch.last_cpu != cpu )
>> +        vmid_flush_vcpu(n);
>>
> Nit: I had to read this a couple of times to get why the guest entry is too
> late. "makes HGATP live" doesn't say what happens once it is: if it's
> because of speculation filling the TLB with G-stage entries tagged with
> the VMID in HGATP, like you explained in the commit message then it may

I thought that having "HGATP live" would be clear.

> worth spell out:
> 
>        /*
>         * Claim the VMID before the caller writes HGATP rather than on guest
>         * entry: from that write on, speculation may fill the TLB with this
>         * domain's G-stage entries tagged with that VMID. A stale VMID may
>         * already have been re-issued to a vCPU of another domain, which would
>         * then hit these entries.
>         */
> 

Indeed, that's clearer. I'll take your wording.

Thanks!

~ Oleksii


