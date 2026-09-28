Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A218FC9833E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 11:01:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435917.1654675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB96Z-000733-GF; Mon, 28 Sep 2026 11:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435917.1654675; Mon, 28 Sep 2026 11:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB96Z-00072w-DP; Mon, 28 Sep 2026 11:01:07 +0000
Received: by outflank-mailman (input) for mailman id 1435917;
 Mon, 28 Sep 2026 11:01:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xB96Y-00072q-TY
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 11:01:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB96X-00GA0p-H6
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 13:01:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aba48f1-2eae-0a2a0a5409dd-0a2a4501cd06-4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 13:01:05 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aba48f0-5984-0a2a45010019-4a7de16290cd-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 13:01:05 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48aec508fe0so176495f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 04:01:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-489bd7b1df0sm6207085f8f.31.2026.09.28.04.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 04:01:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790593264; x=1791198064; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqO1idQEE8syThh03d/2EgO4yTiQBDN6p1NZg59Tth0=;
        b=i97e0FcRtSY1yyoKAaCNBlQjxr7ehCBJNAwZiKPhZIYVHNN4fi28/M8pAJhNji97rF
         lU7HtVAZ2B9vwusGhzjmVrBinXJtMJGMD3NCwW4GoI1ANv46Lt6S83XShhQywLVLZ9x+
         mO78V973o571BnVMeHiAAqP5DP87EzoqiQcmmFFINw2vupE4QEsNJWc0hYg3Ni56lCwz
         D3ntZ7kfgnwTXfy3Z3SQw9JvImYmB0R5ihmddivK42jp36jkCJEhY7alISmZ810kcG+M
         BSUTE3XfKltqV3gwb3QN/hhdHv5ZbbuEUxLhzAPDN/E+tytzwEiBrgy5qJXuKNjrtLaP
         bcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593264; x=1791198064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqO1idQEE8syThh03d/2EgO4yTiQBDN6p1NZg59Tth0=;
        b=QK1FdPS/0YGkwqO6tZh6+u7Ih/RKfQi/nVV1DL3WXFMG1XXfSvtKrAlyFAuFCfhW6s
         dvHs6mBgc5Ou6WIoMOjqO3O2g53bDPAVe3/chyiJIkBO69Xbluq1fzN+L4UH2mTLAUck
         vxQAXgypYgFDNubLFPeAMOyD4BOeuCxjmiaYVJN9nOOdc71MB9K3elg9V1mbefZHxoSx
         uWI0M/C0r+d7e50suVv91LqS1OSWQ293VxyRo1uL6gKzxHUFtIDK3D6PmkWwCi4asXvd
         TqOPQTqllyUEKg/Hfgi63malHUONq0O7JnuzhpnJ4hkQ7kDpelv3cfh6Tm29Rrz2tR1h
         eycQ==
X-Gm-Message-State: AFq9FYIf8pqfLuIWrMo9qFkAp7d708I9kJXYlL/PKaRfTxkXuSb58GRu
	giFthIYbocccIAo45CxvTLD4LNINnDcdGqTfzOhbytqXqY5c+XsIkdS9
X-Gm-Gg: AYBFou2Et+hBho9Lyc1saBSNf12g4WiAUJnsZNV9UMXHzWSgzBdH8v/dYghqBSP7LhJ
	nNiobrcjNVxYhgAXSmjXB7T/gxAS3PSc1jvh9VYLUBPaKJVNWEan6Q6zfQDFFFvN+SFEep04hPt
	3yTwkRnyFJywlWNi06n59givnCkkxmd2k/DVXoNiRoIxXoeJo0I1whLocpw5/FZELoR3qLRVvze
	/rjhom92I7+ENv0KPGgRB7ehiwuzJzNwDrehDberp6EPKOywm4kHAlRydvdc7dPjquXRnCa1pnJ
	l30xIn0pl0YPj50hKu7J40SeXVjn1XEvDrZ2D/Yux5sbnzBm0HLWnD1YgoTv3iPslCsUkQnFB/O
	0AiMAtZgmLOEHmjVCGxb8vxScvx/98QHiry3d7sHuh+No2kJfduGwKYZ/1dXBIDaCwUt6MbgrEb
	RMoUYmfKdLQ2lcz6a2kxysPNvgTNc672mO8/zsISZ9JaHelGyG7kJxNQ6dVR7+2u9v8keItrSU/
	WNpnEPVOlC4HfSODXYCUomTOQpEFvenD6VXUadBYopSCkuXfQ==
X-Received: by 2002:a05:6000:4607:b0:488:84b6:81bb with SMTP id ffacd0b85a97d-48884b68275mr12412398f8f.23.1790593263804;
        Mon, 28 Sep 2026 04:01:03 -0700 (PDT)
Message-ID: <9a7b1269-6038-42f8-bbe2-6680f438e7f5@gmail.com>
Date: Mon, 28 Sep 2026 13:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 39/39] xen/riscv: introduce IMSIC h/w interrupt file
 attaching to vcpu
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4df9cf63943d0f371c8a25c6c9e84adbd3083a61.1787838835.git.oleksii.kurochko@gmail.com>
 <1790341922.8631fc262581453bbf619ec5b2062170.1a0d8b1bfe100072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790341922.8631fc262581453bbf619ec5b2062170.1a0d8b1bfe100072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1790593265-1D87F757-488F8DAA/10/73395122804
X-purgate-type: spam
X-purgate-size: 11509



On 9/25/26 3:11 PM, Baptiste Le Duc wrote:
>> Introduce imsic_vsfile_attach() to initialize the AIA-related state needed
>> for a vCPU to have a working guest interrupt file.
>>
>> A guest (VS) interrupt file must be mapped to one of a pCPU's
>> hardware interrupt files (if they exist), so the pCPU a vCPU will actually
>> run on needs to be known first. arch_vcpu_create() is therefore not a
>> suitable place to call vcpu_aia_init(), since the pCPU assigned to a
>> vCPU can still change before it is first scheduled. To avoid
>> reassigning the VS interrupt file id and remapping it to a different
>> pCPU's hardware interrupt file, imsic_vsfile_attach() is called from a
>> later point in the scheduling path (e.g. continue_new_vcpu()). Since
>> it will end up being called from a non-__init context, it is not
>> itself marked __init.
>>
>> Introduce imsic_update_state() to update a vCPU's guest IMSIC state
>> (the guest interrupt file id and the pCPU whose hardware interrupt
>> file it is mapped to) as a single consistent unit. This state can be
>> read concurrently, e.g. by a future helper that checks whether a
>> vCPU has a pending IMSIC interrupt, though no such consumer exists
>> yet at this stage, so it is protected by a lock.
> I have difficulties to clearly understand the aim of this function. In
> fact, if we want to know if a vCPU has a pending interrupts, wouldn't be
> enough to check hgeip[guest_file_id]?

Lets consider the function which checks pending interrupts:

bool imsic_has_interrupt(const struct vcpu *vcpu)
{
     struct vimsic_state *imsic_state = vcpu->arch.vimsic_state;
     unsigned long flags;
     bool ret = false;

     /*
      * The IMSIC SW-file directly injects interrupt via hvip so
      * only check for interrupt when IMSIC VS-file is being used.
      */

     read_lock_irqsave(&imsic_state->vsfile_lock, flags);
     if ( imsic_state->vsfile_cpu != NR_CPUS )
         ret = !!(csr_read(CSR_HGEIP) & BIT(imsic_state->guest_file_id, 
UL));
     read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);

     return ret;
}

You are right that it is enough hgeip[guest_file_id] but at the same 
time we won't to be sure that guest_file_id wasn't changed during this 
check, right? Otherwise we could accidentally check guest_file_id of 
ohter vCPU.

And so we need imsic_update_state() to have abitility atomically update 
guest_file_id (and also vsfile_pcpu).

I will re-write this part with dropping part of pending interrupts it 
will be just clear from the code of imsic_has_interrupt() when it will 
be needed to be introduced:
```
Implement imsic_update_state(), which records the vCPU's guest
interrupt file id together with the pCPU owning the file. The two are
read as a pair, e.g. by imsic_migrate_vcpu() and the IMSIC context
switch hooks, so they are updated under vsfile_lock as a single unit.
```


> 
> In any case, why does updating vCPU's guest IMSIC state would be
> required?

If it is migrating from one pCPU to another we will need to update 
guest_file_id as on new pCPU guest_file_id could be different from what 
we had for this vCPU on old pCPU + we have to update vsfile_pcpu as a 
new pCPU will be an owner of guest file id of vCPU.

>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>> index 0782148b72..15b6bfffa9 100644
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -155,6 +155,8 @@ static void continue_new_vcpu(struct vcpu *prev)
>>           reset_stack_and_jump(idle_loop);
>>       else
>>       {
>> +        imsic_vsfile_attach(current);
>> +
>>           /*
>>            * During a context switch to a new vCPU, interrupts must be disabled
>>            * to guarantee that the vCPU's CSR state can be safely restored into
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index 374a21ace1..ad638d7485 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -212,7 +212,14 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
>>   
>>   void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
>>   {
>> -    BUG_ON("unimplemented\n");
>> +    unsigned long flags;
>> +    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
>> +    unsigned int cpu = guest_file_id ? v->processor : NR_CPUS;
>> +
>> +    write_lock_irqsave(&vimsic_state->vsfile_lock, flags);
>> +    vimsic_state->guest_file_id = guest_file_id;
>> +    vimsic_state->vsfile_cpu = cpu;
>> +    write_unlock_irqrestore(&vimsic_state->vsfile_lock, flags);
>>   }
>>   
>>   void __init imsic_ids_local_delivery(bool enable)
>> @@ -640,6 +647,16 @@ struct imsic_vsfile_data {
>>       struct imsic_mrif *mrif;
>>   };
>>   
>> +/*
>> + * Number of 64-bit EIx groups needed to cover all the interrupt identities an
>> + * IMSIC interrupt file provides, which are 0 (never valid, but it still
>> + * occupies a bit) up to and including imsic_cfg.nr_ids.
>> + */
>> +static unsigned int imsic_nr_eix(void)
>> +{
>> +    return DIV_ROUND_UP(imsic_cfg.nr_ids + 1, BITS_PER_TYPE(uint64_t));
>> +}
>> +
>>   /*
>>    * Execute func() on the pCPU which owns the IMSIC interrupt file func() is
>>    * going to work with.
>> @@ -1138,20 +1155,90 @@ static void cf_check imsic_vsfile_local_update(void *data)
>>       csr_write(CSR_VSISELECT, old_vsiselect);
>>   }
>>   
>> +/*
>> + * Point the vCPU's HSTATUS.VGEIN at the guest interrupt file it has been
>> + * given. It is applied to the hart when the vCPU's context is restored.
>> + */
>> +static void vcpu_set_vgein(struct vcpu *v, unsigned int vsfile_id)
>> +{
>> +    unsigned long hstatus = vcpu_guest_cpu_user_regs(v)->hstatus;
>> +
>> +    hstatus &= ~HSTATUS_VGEIN;
>> +    hstatus |= MASK_INSR(vsfile_id, HSTATUS_VGEIN);
>> +
>> +    vcpu_guest_cpu_user_regs(v)->hstatus = hstatus;
>> +}
>> +
>> +/*
>> + * Take a h/w guest interrupt file of 'cpu' for the vCPU: zero the file out,
>> + * map it into the domain's G-stage at the vCPU's virtual IMSIC page and
>> + * record the new location in the per-vCPU IMSIC state.
>> + *
>> + * HSTATUS.VGEIN is deliberately left alone: the vCPU may be pointed at the
>> + * file only when the file already holds the vCPU's interrupt state, which in
>> + * the case of imsic_migrate_vcpu() happens only after the old file has been
>> + * moved to the new one. Thereby it is up to the caller to call
>> + * vcpu_set_vgein() at the right moment.
> Nit: would clarify the paragraph here:
>    HSTATUS.VGEIN is deliberately left alone: it must only point at a file
>    which already holds the vCPU's interrupt state. The file taken here is
>    zeroed, so for imsic_migrate_vcpu() VGEIN can only be updated once the
>    state of the old file has been copied into it. Thereby it is up to the
>    caller to call vcpu_set_vgein() at the right moment.

I will use your suggesttion.

>> + *
>> + * Returns the id of the taken interrupt file, or 0 if none could be taken, in
>> + * which case the domain is crashed.
>> + */
>> +static unsigned int imsic_vsfile_acquire(struct vcpu *v, unsigned int cpu)
>> +{
>> +    struct imsic_vsfile_data vsfile_data = { .nr_eix = imsic_nr_eix() };
>> +    unsigned int vsfile_id;
>> +    int rc;
>> +
>> +    vsfile_id = vgein_assign(v);
>> +    if ( !vsfile_id )
>> +    {
>> +        /*
>> +         * vgein_assign() returns 0 when no free h/w guest interrupt file is
>> +         * available. s/w guest interrupt files aren't supported yet, so such
>> +         * a vCPU can't be run.
>> +         */
>> +        domain_crash(v->domain,
>> +                     "%pv: no free h/w guest interrupt file on CPU%u\n",
>> +                     v, cpu);
>> +        return 0;
>> +    }
>> +
>> +    vsfile_data.hgei = vsfile_id;
>> +
>> +    /* The file could still hold the state of its previous owner */
>> +    imsic_call_on_cpu(cpu, imsic_vsfile_local_clear, &vsfile_data);
>> +
>> +    rc = imsic_map_guest_file(v, vsfile_id);
>> +    if ( rc )
>> +    {
>> +        vgein_release(v, vsfile_id, cpu);
>> +
>> +        /* Can't continue w/o correctly mapped IMSIC interrupt file */
>> +        domain_crash(v->domain,
>> +                     "%pv: failed to map h/w guest interrupt file %u: %d\n",
>> +                     v, vsfile_id, rc);
>> +        return 0;
>> +    }
>> +
>> +    imsic_update_state(v, vsfile_id);
>> +
>> +    return vsfile_id;
>> +}
>> +
>>   void imsic_migrate_vcpu(struct vcpu *v)
>>   {
>> -    unsigned int new_vsfile_hgei;
>> +    unsigned int new_vsfile_id;
>>       unsigned int new_vsfile_cpu;
>> -    unsigned int nr_hw_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1,
>> -                                          BITS_PER_TYPE(uint64_t));
>> -    struct imsic_vsfile_data vsfile_data = {
>> -        .nr_eix = nr_hw_eix,
>> -    };
>> +    unsigned int nr_hw_eix = imsic_nr_eix();
>>       struct vimsic_state *imsic_state = v->arch.vimsic_state;
>>       unsigned long flags;
>>       unsigned int old_vsfile_id;
>>       unsigned int old_vsfile_cpu;
>>       struct imsic_mrif tmrif = { };
>> +    struct imsic_vsfile_data vsfile_data = {
>> +        .nr_eix = nr_hw_eix,
>> +        .mrif = &tmrif,
>> +    };
>>   
>>       /*
>>        * The scheduler can mark a freshly created vCPU's unit as migrated and
>> @@ -1189,25 +1276,10 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>        */
>>       new_vsfile_cpu = v->processor;
>>   
>> -    new_vsfile_hgei = vgein_assign(v);
>> -
>> -    /* We don't support SW interrupt files at the moment. */
>> -    BUG_ON(!new_vsfile_hgei);
>> -
>> -    vsfile_data.hgei = new_vsfile_hgei;
>> -
>> -    /* Zero-out new IMSIC VS-file */
>> -    imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
>> -
>> -    /* Update G-stage mapping for the new IMSIC VS-file */
>> -    if ( imsic_map_guest_file(v, new_vsfile_hgei) )
>> -    {
>> -        domain_crash(v->domain, "Migration to hw interrupt file failed\n");
>> -
>> +    /* Zero-out, map and start to use the new IMSIC VS-file */
>> +    new_vsfile_id = imsic_vsfile_acquire(v, new_vsfile_cpu);
>> +    if ( !new_vsfile_id )
>>           return;
>> -    }
>> -
>> -    imsic_update_state(v, new_vsfile_hgei);
>>   
>>       /*
>>        * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
>> @@ -1245,7 +1317,7 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       vgein_release(v, old_vsfile_id, old_vsfile_cpu);
>>   
>>       /* Restore register state in the new IMSIC VS-file */
>> -    vsfile_data.mrif = &tmrif;
>> +    vsfile_data.hgei = new_vsfile_id;
> Isn't this already done by imsic_vsfile_acquire()?

It isn't done by imsic_vsfile_acquire() as this function returns new 
vsfile id.

> Couldn't we pass a
> &vsfile_data in their arg so it could fill it instead of allocating one
> in the stack?

We could done in that way but then we will need a stack variable for 
vsfile_data structure in imsic_vsfile_attach() which will consume more 
stack memory then just one local variable for new_vsfile_id currently 
declared in imsic_vsfile_attach(). But I will double-check if it won't 
be really better just refactor something and pass &vsfile_data as you 
suggested.
Thanks.

~ Oleksii


