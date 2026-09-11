Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB4FC88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 10:44:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416333.1645405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4yjS-00068x-Dp; Fri, 11 Sep 2026 10:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416333.1645405; Fri, 11 Sep 2026 10:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4yjS-00068q-A8; Fri, 11 Sep 2026 10:43:46 +0000
Received: by outflank-mailman (input) for mailman id 1416333;
 Fri, 11 Sep 2026 10:43:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4yjR-00068j-8c
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:43:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4yjQ-000zbS-0x
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:43:44 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3db4b-e002-0a2a0a5209dd-0a2a450c858e-22
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:43:43 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3db5f-f479-0a2a450c0019-d155d02ac573-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:43:43 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6a9b4e73feaso1141810a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 03:43:43 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a9b594f0fasm688499a12.25.2026.09.11.03.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 03:43:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789123423; x=1789728223; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSkdOFVgx9Y/tZ2KFB46VUO+inbqTTv16Au0ym3z5tE=;
        b=KTyjj+iCijCws9GBfO2L2vmKyQOY/EnJE4AelG3GZcqQCK05nCanUCkeQNUe/VYUjY
         FxOPMKq8nUfbOphzgaMkAYMySUXYxX4YKcZ2I7ORkq1OcphtzyquGFaxWIy9qnSCAJYE
         LJ2FPwFQEHdM37pThiY3/36SWPaa5dOHtVL6v8F8rCWXWco5VePO860lxXlZ27NwvN0o
         DhSzC544zRDE89iVCCpKS2z30meg/JwoRhkPbmsFvhoeKV9yJHaej44uXxt+a8d8Kb6i
         Ip1jqiT4xU29ta16OZbm5DrVnxkCSIW+/MnCXG1u56dz8zMo54ODg0H7Ws8bSpOaEX2a
         o+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123423; x=1789728223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSkdOFVgx9Y/tZ2KFB46VUO+inbqTTv16Au0ym3z5tE=;
        b=sBby8Md+h1ir1niKUkMx4bG2kRXey6XDwVhru0vczPB52KT6S243QFwArtWLZYcPFX
         W2N3cwoKANVs7LcpIv27hLMxfjmMaUmoPcGEDVokcQWYwwrtRFereaVTuY8pwvIodBXC
         uPl+Fr13hObsx1fB0zRPgKJx5TmmLiaKHjltc0e0rIQ7BZH9wHg3PTTPUqT6CddAKf50
         9JO9Rw3lkZJPUhh9S0nOz010kd3nRqgSuxXvR1duR9NssT2nlAaWJdOSV82V4x1Pa8BM
         amkIbkaz4F1I3IEhWEXkCigWuIRILLGL7rg6++XugfID4G6d/l7lvcN5wKQAvkG6dVps
         WF/A==
X-Forwarded-Encrypted: i=1; AKwUvBxUe2RH8Htbw4RyRhb9x9VOE9kruU+tdw7k55k44OVja6vo0AHJY8dBTWe/e8DTaSbKdiiiEmAz0bY=@lists.xenproject.org
X-Gm-Message-State: AFuF++lKi/1EF9M+HuK+NEMV7X9hCCuqxyMUaRjge5vcL+gvVSd9eePI
	9KtMfkP2YPrQxOcZLumdy39EtPHpM0DC8YBZik35OH4xmzMG0nF52+Qd
X-Gm-Gg: AYBFou1EgEdgWrOhn6lnZE0apshK1AjdCeWGHu0/HcFOzW2KRJtE+z0px9qW2GMxR5T
	TfkT1y8ui/rqg9ZBDUhTXly/oZiqTHz+WGaY/XYtpqFEPanFYI96ilMXAjU8bcapTHNJ2wcYgX4
	pnlDkQ4DVQ1ZQzM+Vb0AgxuhmuO1wYCv4NawnV5UZhToPgEw3L09F67gtb4tdgSH3TD9UrfL6wC
	DJUUjl8y6hBNEJX4sLKi6KoJPOFzyN1yiitNv2gO04W/PGz0MI2cONBPu+Ex5wdRdFYMcCoPHSE
	gvwoSnBAnyGZiZR61/IrYkbZL+rQpc6xh0h3rjCQ5XA1IjOZ79da8yluY9qTzqB0qLeEEESLDdO
	nx648MrnpI1iezDb999EjH7Z20rkmtjmM8FCBB7JQdBDeR7rnh6Pfv3YEkryTABj5/hNshniPvU
	ZaYtvYddvzFRr/+qxCfRGd2LeOSjEZYQbpRDZCf7MvNNzZ4uGdJN/x+NLMCH+2/PoGETUuTtWPI
	55w9bLTR1qJAGkE/IacSUPj/pz5//CI
X-Received: by 2002:a05:6402:3788:b0:6a6:32fa:54f4 with SMTP id 4fb4d7f45d1cf-6a9b565304emr1582881a12.19.1789123423166;
        Fri, 11 Sep 2026 03:43:43 -0700 (PDT)
Message-ID: <09bf2c58-de60-46a5-ab74-909814ae9bad@gmail.com>
Date: Fri, 11 Sep 2026 12:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
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
 <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
 <2eb325d0-8f53-4790-889d-d68a03da0784@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2eb325d0-8f53-4790-889d-d68a03da0784@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789123423-5270FA5B-8188E1DF/10/73395122804
X-purgate-type: spam
X-purgate-size: 11244



On 9/10/26 3:29 PM, Jan Beulich wrote:
> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>> +static void ctxt_switch_from(struct vcpu *p)
>> +{
>> +    /*
>> +     * When the idle VCPU is running, Xen will always stay in hypervisor
>> +     * mode.
>> +     * Therefore we don't need to save the context of an idle VCPU.
>> +     */
>> +    if ( is_idle_vcpu(p) )
>> +        return;
>> +
>> +    p2m_ctxt_switch_from(p);
>> +
>> +    vtimer_ctxt_switch_from(p);
>> +
>> +    save_csr_regs(p);
>> +}
>> +
>> +static void ctxt_switch_to(struct vcpu *n)
>> +{
>> +    /*
>> +     * When the idle VCPU is running, Xen will always stay in hypervisor
>> +     * mode.
>> +     * Therefore we don't need to restore the context of an idle VCPU.
>> +     */
>> +    if ( is_idle_vcpu(n) )
>> +        return;
>> +
>> +    /*
>> +     * If this vCPU last ran on a different pCPU, invalidate its VMID so
>> +     * vmid_handle_vmenter() assigns a fresh one from the current pCPU's pool.
>> +     * Without this, two pCPUs could independently assign the same
>> +     * (generation, vmid) pair, generation counters start at the same value
>> +     * on all pCPUs and increment independently, causing TLB contamination.
>> +     */
>> +    if ( n->arch.last_cpu != smp_processor_id() )
>> +        vmid_flush_vcpu(n);
> 
> I wonder why you need this, when we don't have anything similar in x86/HVM
> (and at the first glance Arm doesn't have anything similar either).

x86 does have the equivalent: vmx_do_resume() calls 
hvm_asid_flush_vcpu() in the active_cpu != smp_processor_id() branch, 
and svm_do_resume() does the same when launch_core != smp_processor_id() 
("Migrating to another ASID domain. Request a new ASID."). The RISC-V 
VMID allocator follows the x86 ASID scheme: VMIDs are a per-pCPU 
resource with a per-pCPU generation, so a (generation, vmid) pair 
obtained on one pCPU means nothing on another. Arm doesn't need this 
because it allocates a single VMID per domain from a global bitmap.

Also, note that I've update a little bit how VMIDs are flushed here [1]
but this check still present IIURC.

[1] 
https://lore.kernel.org/xen-devel/cover.1787838835.git.oleksii.kurochko@gmail.com/T/#m2c06e58c03a09022af112388be3585bf3ae6e4dc

> 
>> +    vtimer_ctxt_switch_to(n);
>> +
>> +    restore_csr_regs(n);
>> +
>> +    p2m_ctxt_switch_to(n);
>> +}
> 
> In the absenmce of a comment towards the need for this specific order I'd
> expect these three calls to be ordered the opposite of their counterparts
> in ctxt_switch_from().

I will put restore_csr_regs(n) (and rename it to 
csr_regs_ctxt_switch_to(n)) before vtimer_ctxt_switch_to(). There is no 
any specific requirement to be ordered in the way it is now.

> 
>> +static void schedule_tail(struct vcpu *prev)
>> +{
>> +    unsigned int cpu = smp_processor_id();
>> +
>> +    ASSERT(prev != current);
>> +
>> +    ctxt_switch_from(prev);
>> +
>> +    /*
>> +     * Mark this CPU in next domain's dirty cpumasks before calling
>> +     * ctxt_switch_to(). This avoids a race on things like p2m flushing,
>> +     * which is synchronised on that function.
>> +     */
>> +    if ( prev->domain != current->domain )
>> +    {
>> +        cpumask_set_cpu(cpu, current->domain->dirty_cpumask);
>> +
>> +        /*
>> +         * Once this hart drops out of prev's dirty_cpumask it stops being a
>> +         * target of p2m_tlb_flush(), while its TLB may still hold G-stage
>> +         * translations of prev's domain: neither the vCPU which just ran nor
>> +         * any other vCPU of that domain which ran here earlier has had its
>> +         * VMID invalidated. Move the hart to a new VMID generation so that
>> +         * none of them can be reached again.
>> +         *
>> +         * Switching away from the idle vCPU needs no bump: the idle domain
>> +         * has no p2m of its own, and whatever G-stage entries this hart may
>> +         * still hold (or speculatively create while HGATP keeps pointing at
>> +         * the last guest's p2m) are tagged with a VMID which was already made
>> +         * stale when that guest was switched out. Skipping the bump here also
>> +         * avoids burning a generation on every pass through idle.
>> +         */
>> +        if ( !is_idle_vcpu(prev) )
>> +            vmid_flush_hart();
>> +
>> +        cpumask_clear_cpu(cpu, prev->domain->dirty_cpumask);
>> +    }
>> +    write_atomic(&current->dirty_cpu, cpu);
>> +
>> +    ctxt_switch_to(current);
>> +
>> +    write_atomic(&prev->dirty_cpu, VCPU_CPU_CLEAN);
>> +
>> +    current->arch.last_cpu = cpu;
>> +
>> +    /*
>> +     * sched_context_switched() internally uses a spinlock,
>> +     * which requires interrupts to be enabled.
>> +     */
>> +    local_irq_enable();
>> +
>> +    sched_context_switched(prev, current);
>> +}
>> +
>> +void context_switch(struct vcpu *prev, struct vcpu *next)
>> +{
>> +    ASSERT(local_irq_is_enabled());
>> +    ASSERT(prev != next);
>> +    ASSERT(!vcpu_cpu_dirty(next));
>> +
>> +    local_irq_disable();
>> +
>> +    set_current(next);
>> +
>> +    prev = __context_switch(prev, next);
>> +
>> +    schedule_tail(prev);
>> +}
> 
> __context_switch() switches stacks, which can easily collide with code the
> compiler has emitted. For example, the call to schedule_tail() may not be
> a tail call, and context_switch()'s return address may have been spilled
> to the stack (or into one of the s<N> registers). There's a reason Arm and
> x86 have reset_stack_and_jump().

RISC-V will have reset_stack_and_jump() that too but just introduced 
later and will be used for different use case (in continue_new_vcpu() 
introduced later in this patch series). But as the Arm RISC-V doesn't 
use reset_stack_and_jump() in context_switch().

This follows the Arm model: every vCPU has its own Xen stack, and from 
the incoming vCPU's point of view __context_switch() is ABI-conforming. 
It restores exactly the sp/ra/s0-s11 that vCPU had when it itself called 
__context_switch() from context_switch(). So after the return we are in 
next's own context_switch() frame, and anything the compiler spilled 
there (ra included) belongs to next. The only exception is a vCPU which 
has never run: its ra points at continue_new_vcpu() on an empty stack, 
and that's where reset_stack_and_jump() is needed, as on Arm. I'll make 
continue_new_vcpu() noreturn accordingly. x86 differs because its stacks 
are per-pCPU (IIUC), hence its context_switch() can't return.

Here is some diagram for better understanding:
vCPU A (stack A)                vCPU B (stack B, switched out earlier)
schedule()                      schedule()
  `- context_switch(A, B)         `- context_switch(B, X)
      [A's frame: ra, s-regs]         [B's frame: ra, s-regs]
      `- __context_switch() --------> "returns" here
         (save A, load B)             schedule_tail(prev = A)
                                      ld ra <- B's frame (B's own ra)
                                      ret -> B's sched_context_switch()
                                          -> ... -> back into B


> 
>> --- a/xen/arch/riscv/entry.S
>> +++ b/xen/arch/riscv/entry.S
>> @@ -99,3 +99,47 @@ restore_registers:
>>   
>>           sret
>>   END(handle_trap)
>> +
>> +/*
>> + * struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next)
>> + *
>> + * This is called on prev's stack, and returns on next's.
> 
> With ra being switched it may also return to other than the caller. If
> that's really intended, I think it also needs calling out here.

Yes, it's intended. Normally it returns into next's own context_switch()
(where next itself last called __context_switch()), and for a vCPU
which has never run it returns to continue_new_vcpu(). I'll update the
comment to:

  * This is called on prev's stack, and returns on next's. As ra is
  * switched too, it doesn't return to its caller: it returns to where
  * next last called it from, i.e. into next's own context_switch(), or,
  * for a vCPU which has never run, to continue_new_vcpu() with an empty
  * stack.


> 
>> + * a0 - prev
>> + * a1 - next
>> + *
>> + * Returns prev in a0
>> + */
>> +FUNC(__context_switch)
>> +        REG_S   s0, VCPU_XEN_SAVED_CONTEXT_S0(a0)
>> +        REG_S   s1, VCPU_XEN_SAVED_CONTEXT_S1(a0)
>> +        REG_S   s2, VCPU_XEN_SAVED_CONTEXT_S2(a0)
>> +        REG_S   s3, VCPU_XEN_SAVED_CONTEXT_S3(a0)
>> +        REG_S   s4, VCPU_XEN_SAVED_CONTEXT_S4(a0)
>> +        REG_S   s5, VCPU_XEN_SAVED_CONTEXT_S5(a0)
>> +        REG_S   s6, VCPU_XEN_SAVED_CONTEXT_S6(a0)
>> +        REG_S   s7, VCPU_XEN_SAVED_CONTEXT_S7(a0)
>> +        REG_S   s8, VCPU_XEN_SAVED_CONTEXT_S8(a0)
>> +        REG_S   s9, VCPU_XEN_SAVED_CONTEXT_S9(a0)
>> +        REG_S   s10, VCPU_XEN_SAVED_CONTEXT_S10(a0)
>> +        REG_S   s11, VCPU_XEN_SAVED_CONTEXT_S11(a0)
>> +        REG_S   sp, VCPU_XEN_SAVED_CONTEXT_SP(a0)
>> +        REG_S   ra, VCPU_XEN_SAVED_CONTEXT_RA(a0)
>> +
>> +        REG_L   s0, VCPU_XEN_SAVED_CONTEXT_S0(a1)
>> +        REG_L   s1, VCPU_XEN_SAVED_CONTEXT_S1(a1)
>> +        REG_L   s2, VCPU_XEN_SAVED_CONTEXT_S2(a1)
>> +        REG_L   s3, VCPU_XEN_SAVED_CONTEXT_S3(a1)
>> +        REG_L   s4, VCPU_XEN_SAVED_CONTEXT_S4(a1)
>> +        REG_L   s5, VCPU_XEN_SAVED_CONTEXT_S5(a1)
>> +        REG_L   s6, VCPU_XEN_SAVED_CONTEXT_S6(a1)
>> +        REG_L   s7, VCPU_XEN_SAVED_CONTEXT_S7(a1)
>> +        REG_L   s8, VCPU_XEN_SAVED_CONTEXT_S8(a1)
>> +        REG_L   s9, VCPU_XEN_SAVED_CONTEXT_S9(a1)
>> +        REG_L   s10, VCPU_XEN_SAVED_CONTEXT_S10(a1)
>> +        REG_L   s11, VCPU_XEN_SAVED_CONTEXT_S11(a1)
>> +        REG_L   sp, VCPU_XEN_SAVED_CONTEXT_SP(a1)
>> +        REG_L   ra, VCPU_XEN_SAVED_CONTEXT_RA(a1)
>> +
>> +        ret
>> +END(__context_switch)
> 
> What about gp and tp?

tp points to this hart's pcpu_info (set up once per hart by
setup_tp()), i.e. it's per-pCPU rather than per-vCPU state.
__context_switch() starts and ends on the same hart, so tp has to be
left alone.

gp isn't used by Xen at all: there's no __global_pointer$ in the
linker script, so no gp-relative relaxation happens, and the compiler
never allocates gp.

Neither of them is callee-saved per the psABI, so there's nothing to
preserve across the call. The guest's gp/tp are part of the guest
state and are going to be saved/restored via cpu_user_regs by the
trap entry/exit path.


> 
>> --- a/xen/arch/riscv/include/asm/system.h
>> +++ b/xen/arch/riscv/include/asm/system.h
>> @@ -76,6 +76,10 @@ static inline bool local_irq_is_enabled(void)
>>   
>>   #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
>>   
>> +struct vcpu;
> 
> I don't think this is needed, as ...
> 
>> +struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);
> 
> ... parsing of the return type will make the struct known (before
> parameters are parsed).

Make sense to me. I will drop forward declaration.

> 
> Also - can't next be pointer-to-const?
It could be. I will add  const.

Thanks!

~ Oleksii



