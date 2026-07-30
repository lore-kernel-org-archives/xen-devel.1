Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D8BC55162
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 15:47:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378070.1623697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSyD-0007yp-7Z; Thu, 30 Jul 2026 15:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378070.1623697; Thu, 30 Jul 2026 15:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSyD-0007yi-4k; Thu, 30 Jul 2026 15:46:53 +0000
Received: by outflank-mailman (input) for mailman id 1378070;
 Thu, 30 Jul 2026 15:46:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wpSyB-0007yc-Tu
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 15:46:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpSyB-003wsK-AL
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 17:46:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6b71ce-e002-0a2a0a5209dd-0a2a4509c62a-46
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:46:51 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6b71eb-be1a-0a2a45090019-d155dd2ae06b-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:46:51 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so2148454f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:46:51 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc892cc5fsm5890215f8f.24.2026.07.30.08.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 08:46:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785426411; x=1786031211; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hF75ORF7Ww3tkis9yBl1qYyiv4O+FhPZ1Bzsywb9o/4=;
        b=Hs56HNMmdAFc/VlAQpDtK7dlX0oqdwTqaY4SGYi8cEjhFp6embLf1p2JvBN2wFMGKz
         H2JKsZ3nvfvB8mt9LCk3e/FtJdw/yBfYhi1r/ktaYnhymW3GwbZ3eN7Z7+YzwGArDPP3
         zJK7N7obbyfGqNxBLX7Qu85yFf420TXj7kO96GFIeK3Eo05WzS+bnBpGiR+G9q1WQFJP
         lmPdl2Fl5TQj8a+UbFs8hALbtY/qSYuGdEORe9/eNAFdrMlFSwXLJ0Udc+a+mO/KJvjb
         vzQkj0QtH8yqrSzCQWzfXP8Yzt0G/4ceD/Ts7fambseIHKYhYnydoZoxWNhDhVOSFdnX
         82mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785426411; x=1786031211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF75ORF7Ww3tkis9yBl1qYyiv4O+FhPZ1Bzsywb9o/4=;
        b=g8gOIAXTnf7uy6LGo5vpnyNswsCWfRs2dSctVHD+OHigdP5V59jT4AILLvbEOqZGgt
         DRiCrFzQFTMpbXXe5cuYoq8TxarCJB+RoRVpC/ykNYGc6V6sl/VHzQm5SIXHtF+RPzgB
         VGjlsoA4RjhrnsXWp+7Wd94TZuoo2o8YgvTT34NpNQlqVxo6ZgGxAxn1NAGBm291H2yv
         qv0C0FAIf+1zBYQUgxQJqEopi62lFpH4BKZQUhNe9Vx8kWzcTiBvdP5g1aVjZrWeidq8
         AVRFl1hwA8/Vm/1GaP0NOodbajj+S8jjG+h84iVcoPqbs7rCYhLDR2VUlB6XenV3De/P
         rPoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXqZPEBjRnGZEkaW2+E8NHGFFD3y0FoXECUXMdvT14zoyNGjjwlSU2dza8ScKsSUlRFIFgx398UOk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOqbPRv4UXFxjQ74SuYQ2ykZgv4luvrwpTkcekYEirEAVY9MrV
	46OrQcwOfRT0E/yL2cEMYr+sOS3IkU4yeCxj7MjvwezorpIZ9x+z1Bdx
X-Gm-Gg: AR+sD11Wpcc6tHU7G91pvr/sMWe7kvnAkPfuegotgMnlVbxMtaWvwFqU0Yfwjiakuos
	VcP5rGb1WiPjFMrTWqbJh6geT12/P9Gd4IY+VPJ82H9jCG3fdWJUhtopZP3bXyY48r0CswLltIX
	AkBnuedcpugLBGRkAALxbsuuTAlgWWzV/pWSdYUvs3oPkMjdGxLBWWD98gakAkfrZUVKBMhRsmC
	sAJBtQVKYkm59jbeIT9pValaeo4zWNKNaZFX/u5BxhUZN2hArtk6+J8Q/EukwxT9u2avDStJp+L
	bUcYyqOZor/hznhqd5YoVGB130T+Bv5O5QffdT7pTLc56pbUStts5ihYLa+ZF4A7Qy+RX5Nfx8P
	79xaIvQ7V+enmMF4I9eesYb3NNKSm+8F8+ASW6eff6N7bnRXSGmeUeFB24DnmyNWA6UjuKT+WKO
	BxDy4N5Xa/adz+0IO925XS9ojB1yYX5LPTQkuzMc5r+Juq+GuJmOnhIkeMol4FvbvVuggLNRWfp
	5zINO8yjYR6W51BSDgUJ2jmKG5qXAA7ytOlJP9UyLs=
X-Received: by 2002:a05:6000:2c0f:b0:478:4de8:9b91 with SMTP id ffacd0b85a97d-47fc8329e73mr4326022f8f.41.1785426410387;
        Thu, 30 Jul 2026 08:46:50 -0700 (PDT)
Message-ID: <aca9e72d-ff6d-49e0-b128-6675c5521493@gmail.com>
Date: Thu, 30 Jul 2026 17:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/17] xen/riscv: add basic VGEIN management for AIA
 guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
 <6501f040-ea59-4e78-8854-030f786dbcf7@suse.com>
 <191a9ddc-9f37-4d26-9141-7dfaf88cb26c@gmail.com>
 <489a1b05-4ae5-44ac-a73b-485669190b59@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <489a1b05-4ae5-44ac-a73b-485669190b59@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785426411-BF8D1034-01F5172C/10/73395122804
X-purgate-type: spam
X-purgate-size: 12027



On 7/30/26 9:42 AM, Jan Beulich wrote:
> On 29.07.2026 16:55, Oleksii Kurochko wrote:
>> On 7/27/26 5:41 PM, Jan Beulich wrote:
>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>> It was decided to add support for IMSIC from the start instead of having APLIC
>>>> operate in direct delivery mode, as it requires a trap-and-emulation approach,
>>>> which is not optimal from a performance standpoint.
>>>>
>>>> AIA provides a hardware-accelerated mechanism for delivering external
>>>> interrupts to domains via "guest interrupt files" located in IMSIC.
>>>> A single physical hart can implement multiple such files (up to GEILEN),
>>>> allowing several virtual harts to receive interrupts directly from hardware.
>>>>
>>>> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
>>>> for systems implementing AIA specification. Each CPU maintains
>>>> a bitmap describing which guest interrupt files are currently in use.
>>>>
>>>> Add helpers to initialize the bitmap based on the number of available
>>>> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
>>>> when no longer needed. When assigning a VGEIN, the corresponding value
>>>> is written to the VGEIN field of the guest hstatus register so that
>>>> VS-level external interrupts are delivered from the selected interrupt
>>>> file.
>>>
>>> And when exactly is this "assignment" intended to occur? vgein_assign() and
>>> vgein_release() have no callers here, so this remains entirely unclear.
>>
>> [A] Agreed, I should have added that information to the commit message:
>>
>> VGEIN is assigned (via vgein_assign()) before jumping to the new vCPU
>> execution context (in continue_new_vcpu()) and is re-assigned during
>> vCPU migration from one pCPU to another.
>>
>> VGEIN is released (via vgein_release()) on the old pCPU during migration.
> 
> That is, state of that vCPU is held in hardware for perhaps an extended
> period of time after the vCPU was last de-scheduled. That's a fair
> optimization (we do something similar on x86, albeit that has been
> increasingly under question lately). However, doesn't this then require
> sync_local_execstate() to become non-empty?

IIUC, sync_local_execstate() is needed for the lazy context switch case 
when switching from vCPUA to the idle vCPU. The idea is that if, after 
running the idle vCPU, the next scheduled vCPU is again vCPUA, then 
nothing needs to be done because no real context switch has occurred yet.

IMO, this is not the case for VGEIN. It is perfectly fine for a vCPU to 
keep its previously assigned VGEIN even if the next scheduled vCPU is 
different. In fact, it is necessary to preserve VGEIN because it will be 
needed later, for example, to wake up the vCPU if an interrupt for that 
vCPU occurs.

The idea is that if a vCPU uses a hardware interrupt file, then when the 
vCPU is descheduled, the corresponding CSR_HGEIE bit, where the bit 
number corresponds to the VGEIN value, is set. If an IRQ_S_GEXT trap 
then occurs, the hgei_interrupt() handler can determine which vCPU 
should be woken up:

void hgei_interrupt(void)
{
     unsigned long hgei_mask, flags;
     struct vgein_ctrl *vgein_ = &this_cpu(vgein);

     hgei_mask = csr_read(CSR_HGEIP) & csr_read(CSR_HGEIE);
     csr_clear(CSR_HGEIE, hgei_mask);

     spin_lock_irqsave(&vgein_->lock, flags);

     for_each_set_bit ( vs_guest_file_id, hgei_mask )
     {
        ...
        /* do some logic to call vcpu_kick */
        ...
     }

     spin_unlock_irqrestore(&vgein_->lock, flags);
}

> 
> Furthermore, rather than having vgein_assign() fail when
> find_next_zero_bit() fails to find an available ID, shouldn't you release
> some other vCPU's ID, making it available for re-use?

This is a good question, and it requires a separate investigation to 
determine whether such an approach would actually be beneficial. It 
would require not only changing the VGEIN field in vcpu->hstatus, but 
also synchronizing at least the pending interrupts from one IMSIC 
interrupt file to another, which would also consume time and further 
complicate the logic.

If find_next_zero_bit() fails, the vCPU will simply receive VGEIN=0, 
which means that the software interrupt file will be used. Therefore, 
everything should continue to work correctly, although it will be slower 
than using a hardware interrupt file.

Considering that the maximum value of GEILEN is 31 for RV32 and 63 for 
RV64 (although there is no guarantee that an implementation will support 
the maximum value), let's assume a GEILEN value of 31 for RV64 as well. 
In that case, a system with 4 CPUs would cover the maximum number of 
vCPUs supported by Xen (IIURC, it is 128). Therefore, a software 
interrupt file would not be needed at all, assuming the scheduler 
distributes vCPUs reasonably well.

Even if GEILEN is smaller, I expect that the scheduler will migrate 
vCPUs between pCPUs from time to time. This will free a hardware IMSIC 
interrupt file slot on the previous pCPU, allowing another vCPU to 
obtain a hardware IMSIC interrupt file slot.

For now, I would prefer to keep the current VGEIN allocation strategy as 
it is definitely easier for implementation at least and consider your 
suggestion of releasing another vCPU's VGEIN as a potential 
optimization. I think this optimization should first be evaluated 
through measurements and experiments.

> 
>>>> +static int cf_check cpu_callback(struct notifier_block *nfb, unsigned long action,
>>>> +                        void *hcpu)
>>>> +{
>>>> +    unsigned int cpu = (unsigned long)hcpu;
>>>> +    int rc = 0;
>>>> +
>>>> +    switch ( action )
>>>> +    {
>>>> +    case CPU_STARTING:
>>>> +        rc = vgein_init(cpu);
>>>> +        if ( rc )
>>>> +            printk("AIA: failed to init vgein for CPU%u\n", cpu);
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return notifier_from_errno(rc);
>>>> +}
>>>
>>> Where's the freeing of the allocation vgein_init(), when CPU bringup fails
>>> or a CPU was brought down?
>> I'll add the following:
>>
>> case CPU_UP_CANCELED:
>> case CPU_DEAD:
>>       vgein_free(cpu);
>>       break;
>>
>> and:
>>
>> static void vgein_free(unsigned int cpu)
>> {
>>       struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
>>
>>       ASSERT(!vgein->bmp);
> 
> Does this hold in all cases? What migrates vCPU-s off of a pCPU going down?
> IOW aren't you introducing an ordering problem between your notifier handler
> and the scheduler's?

The migration is done by the scheduler/cpupool notifiers at 
CPU_DOWN_PREPARE (cpupool_cpu_remove_prologue() -> 
cpu_disable_scheduler()) and CPU_DYING (cpupool_cpu_remove()), i.e. in 
actions strictly preceding CPU_DEAD; each unit migration goes through 
sched_move_irqs() -> arch_move_irqs() -> imsic_migrate_vcpu(), which 
releases the VGEIN on the old pCPU. So there's no ordering dependency on 
notifier priority within CPU_DEAD.

However you're right that the assertion doesn't hold in all cases. On 
the suspend path both notifiers bail out for system_state > 
SYS_STATE_active, so no vCPU is migrated off at all and the bits are 
still set at CPU_DEAD — and freeing owners[] there would be actively 
wrong, since the vCPUs still reference that pCPU's VS-file. 
Independently, arch_vcpu_destroy() never releases the VGEIN today, so a 
destroyed vCPU leaks its bit for good.

Given GEILEN <= XLEN-1, I'll drop the allocation altogether and use a 
fixed struct vcpu *owners[BITS_PER_LONG] in the per-CPU structure; that 
removes vgein_free() and the question with it. I'll fix the missing 
release in vcpu teardown separately.

> 
>>       vgein->geilen = 0;
>>       XVFREE(vgein->owners);
>> }
>>
>> I'm also wondering whether vgein_init() should be moved to
>> CPU_UP_PREPARE. If vgein_init() fails in CPU_STARTING, the hypervisor
>> will stop instead of simply ignoring the CPU.
>>
>> However, in CPU_UP_PREPARE we don't yet know the value of GEILEN, which
>> is needed to allocate vgein->owners. As I understand it, CPU_UP_PREPARE
>> is not executed on the CPU that is being brought up.
> 
> But there's an upper bound, isn't there? Use that for preliminary allocation,
> and re-alloc (best effort) from CPU_ONLINE?

Considering that upper bound isn't to big then we could just live with 
that without having re-alloc. Look at what I wrote above.

> 
> Yet then I continue to question the presence of this array in the first place.
> Something similar isn't needed elsewhere (afaik), and its intended use (as
> said) doesn't become obvious here.

I can drop it for now and reintroduce it later when it is actually 
needed. In short, it is intended to be used in hgei_interrupt(), as I 
described above, in the following way (inside the for-loop):

...
for_each_set_bit(vs_guest_file_id, hgei_mask)
{
unsigned int owners_index = vs_guest_file_id /* - 1 */;

```
if ( vgein_->owners[owners_index] )
{
     dprintk("kick ->%pv, hgei_mask(%#lx)\n",
             vgein_->owners[owners_index], hgei_mask);

     vcpu_kick(vgein_->owners[owners_index]);
}
```

}
...

Alternatively, I could introduce this in this series, since it will be 
necessary to set the HGEIE bit in imsic_state_save() anyway to allow the 
vCPU to be woken up. It also seems like the best option, as it addresses 
at least some of the comments you raised.

> 
>>>> +unsigned int vgein_assign(struct vcpu *v)
>>>> +{
>>>> +    unsigned int vgein_id;
>>>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
>>>> +    unsigned long *bmp = &vgein->bmp;
>>>> +    unsigned long flags;
>>>> +
>>>> +    if ( !vgein->geilen )
>>>> +        return 0;
>>>> +
>>>> +    spin_lock_irqsave(&vgein->lock, flags);
>>>
>>> Because it's unclear where this is to be called from, it's also unclear whether
>>> a lock is needed here (and if so whether a plain spin lock is appropriate).
>>
>> Based on what I wrote in [A] above a lock is defintely needed as it
>> could be that vgein_release() is called for old pCPU during migration
>> and at the same time old pCPU could call vgein_assign() so we want to
>> keep vgein bitmap consistent.
> 
> Can this really happen? It almost sounds as if you were suspecting
> context-switch-in could race with context-switch-out. Yet again - none of
> this can sensibly be discussed without seeing how / where the functions are
> to be used.

Maybe I didn't explain it clearly, but during migration (which, 
according to my understanding of vcpu_move_irqs(), is executed on 
pCPU1), when vCPU0 is migrated from pCPU0 to pCPU1, its old VGEIN on 
pCPU0 needs to be released. I don't see any reason why, at the same 
time, pCPU0 could not try to assign that VGEIN to another vCPU. Without 
proper protection, this could lead to race conditions.

Also, setting a bit in the VGEIN bitmap and updating the owner array 
should be an atomic operation, at least to correctly handle the 
hgei_interrupt() case mentioned above and vCPU migration, which calls 
vgein_release(...,old_pcpu,...).

I agree that it would probably be easier if the migration patches were 
included in this patch series as well. I can either post those patches 
to this thread now or include them in the v2 series when it is ready. 
What do you think?

> 
>> Regarding why _irqsave() it is mostly connected to ...
> 
> Why the mention of _irqsave? My use of "plain spinlock" was meant to contrast
> to the possible use of an r/w lock.

Oh, okay... I thought your question was why the _irqsave() variant is 
used specifically.

I think it is hard to predict whether read operations will be much more 
frequent than write operations in this case. It depends on how often 
vCPU migration occurs and how often hgei_interrupt() is called. At the 
moment, I believe hgei_interrupt() is the only reader.

~ Oleksii


