Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E271C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 08:24:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428330.1651059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vmx-0003A1-KM; Tue, 22 Sep 2026 08:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428330.1651059; Tue, 22 Sep 2026 08:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vmx-00039u-HS; Tue, 22 Sep 2026 08:23:43 +0000
Received: by outflank-mailman (input) for mailman id 1428330;
 Tue, 22 Sep 2026 08:23:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8vmw-00039o-5K
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:23:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8vmt-00F1Un-U9
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:23:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab23b0a-e002-0a2a0a5209dd-0a2a4503dcd8-14
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 10:23:39 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab23b0b-fae8-0a2a45030019-4a7de18d9609-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 10:23:39 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso28526125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 01:23:39 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fd8b97385sm60771805e9.2.2026.09.22.01.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 01:23:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790065419; x=1790670219; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RbzJwYzlXEAdBV4JQhB+dJYYKzQBYazVAXgi+oR0Bz4=;
        b=TU6o/gEDJ/SHm5pp1Zfn18/1jQlxj7SCBKORdHDUsj36Hlxydc18MCo/Ef5Unl5Zzh
         OcrBLEuahgsnOTgm3GoaSpFp/1zf/hZdAr4vfcwZfZIRwpwcufpvyRTNTqj+sii+geu3
         VoxoMQd0zH48wnUfcqAQHR/YXhR6K6LlnVJzkVgGgVmcA/BQ6Do0WJt8/Ip6Bdy7La1I
         QFAozvURCiQeMRlmu+qcjyCB7K39PZY5q3uHAO61KvlpzwOrHPdkUFEEZj5abhIKTFTf
         utgznaJfs03KRcGhTMobhBHhrNhrtlFcbMuTJwUmpGnRM3kJiXelMFRBrLI05VFvE3xQ
         7CAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065419; x=1790670219;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbzJwYzlXEAdBV4JQhB+dJYYKzQBYazVAXgi+oR0Bz4=;
        b=hSTVOSjqRt6m8Nf687HzaurHwn1+2t5bSKt5o9jwVhmtvBcMtxta118eGG7ut7L8p6
         RcNxdzYM1NASmb/dve8hb5MtALpR2H9cji+R1TjsIzH70mByGBC/F2gN+VN9W1/VPNA9
         FM4i+XQ966sKMyKvC1+mSLm6IAKexqLRgDaodYNV5GtDo5FD48QvoWVos5PgLopxCzn5
         BQOG7JK11y4eeBq9Xxb5AMRXJoEhtVCG+cSWm4by0FJk/yGZi0vhTLy13P8juMLG7dfT
         Ajz1zo4fAf/Z7GTp57mbkKyBZTtXyW3E5IidoUQuPMAa2NS84gBRlGUuiR4gvdyBiuX2
         IK+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzOZGAgBqYZFs4P30zC+BaPKc4PP5AEfz+9bKs74GdMYF19dztnAJRw5xT9i81AGtr+UyvIz+n1K0k=@lists.xenproject.org
X-Gm-Message-State: AFuF++mPp6Oh/dKIdJmP0Rk9ud4U/fG9tUQvK1DMYS+Bo8CFVT69GyIp
	aP8AYRTQMS6Jvx46ZF2g/oxN5kDlm3LqtyprYNHbAyqRYZ4lqaBgkIgN
X-Gm-Gg: AYBFou3j/NCeLfOKbxxo2Rf2ebDi9wZabirDcPDx//pedhg7NxDcvYYtn2XVuzaD1Qf
	rxspu3Ghj2cIX/lMAlA/PSebUmn9opYHUNIlNjW+nEKkrMaEPvy+EzN8EBMFBS/UbSj/PTde9d9
	Ieq3KbWe4RVdNsxWI3I71Yj7TRDZ7Nuc1H1o2X0sydiq3gcLSXs4d1rAAI6rdZLL0ouUsxjZQ8Y
	B5pB7k53L3HLC9hSTCAC5k6QjY68wZcTu4FcwpfMzp/JsVEhZrP0rAYD5IGovY5iBt5382wdxN0
	IqWoGdHsEiA7zjilnlujseWhd6lxEqaPNyvdnzdkDPbL1WHCWpKCOm2zlvBYiLpGrNAtnKcv0jf
	+CUYvVpeWFkMci31XeD0sqB+3/eyiv29vLckQvorLrIlG06FSb4z0yGcN9zIw0Eo9Hs4OX8OoPa
	+Tv705a6rcy+hEqe1HeT6GewVj4Ip+ExgJyLnGEta1bLALYSpK3WJPyqHMFijZBrExdA3Dd+n/0
	YFDYCGFEl9enjqiJostpSzRvbLkAbsL1Hb8xQEO2uk8TAHk5w==
X-Received: by 2002:a05:600c:3e0b:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49fc5687115mr170537275e9.11.1790065419017;
        Tue, 22 Sep 2026 01:23:39 -0700 (PDT)
Message-ID: <96f66feb-8889-4475-b39f-ed52b1f58a68@gmail.com>
Date: Tue, 22 Sep 2026 10:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 38/39] xen/riscv: implement continue_new_vcpu()
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
 <a282887cc08cd9b05f59d46cab9377915e83c61d.1787838835.git.oleksii.kurochko@gmail.com>
 <8dbc4ba6-bf92-4e9f-b4b6-7286d5a96443@suse.com>
Content-Language: en-US
In-Reply-To: <8dbc4ba6-bf92-4e9f-b4b6-7286d5a96443@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790065419-6C2E04E9-DEF6DF2E/10/73395122804
X-purgate-type: spam
X-purgate-size: 13308



On 9/21/26 2:12 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> continue_new_vcpu() is the arch hook invoked the first time a freshly
>> created vCPU is scheduled. Implement both cases it has to cover:
>>   - for the idle vCPU, switch to its own stack and jump to idle_loop();
>>   - for a guest vCPU, restore hstatus and enter the guest through the new
>>     return_to_new_vcpu() path in entry.S, which loads sepc, passes the
>>     hart id in a0 and the DTB address in a1 as expected by the RISC-V
>>     boot protocol, sets sstatus.SPP and executes sret.
> 
> Is this a requirement for all CPUs, or just for the boot one? (I can't
> quite see why secondary processors would need passing a DTB address.)

It is requirement for boot one. For secondary processors it is HSM boot 
data which is passed to sbi_hsm_hart_start() and then intercpeted by Xen.

At the moment of writing of this commit message we have only boot CPU 
and so only DTB could be passed.

I can update the commit message and the comment in return_to_new_vcpu() 
to tell that it could be DTB address for boot cpu and/or for secondary 
CPUs HSM boot data or it will be better to add info about HSM boot data 
during and an introduction of secondary CPUs support?

> 
>> Interrupts have to stay disabled across the restore. The trap entry
>> logic implicitly clears hstatus.SPV, so an interrupt taken between the
>> write of hstatus and sret would make sret return to HS-mode instead of
>> VS-mode, and restoring SPV afterwards is non-trivial. Instead interrupts
>> are simply kept off and sstatus.SPIE is set, so that SIE is restored from
>> SPIE once sret has been executed.
> 
> As written this reads as if the guest would be responsible for doing this.
> Isn't it rather SRET itself which does this?

IIUC to which part you refer then yes, it is SRET itself which does 
this. So some re-wording should be done ...

> 
>> Also, it follows what hardware will do
>> with real CPU which is also started with interrupts disabled.
> 
> Further up, aiui, you talk about the host's interrupt state. How vCPU-s
> are started, however, is virtual interrupt state. Mixing both isn't
> very helpful.

...:

Interrupts have to stay disabled across the restore. The trap entry
logic implicitly clears hstatus.SPV, so an interrupt taken between the
write of hstatus and sret would make sret return to HS-mode instead of
VS-mode, and restoring SPV afterwards is non-trivial. Hence interrupts
are kept disabled, and sstatus.SPIE is set so that sret itself 
re-enables them (SIE := SPIE) as part of entering the guest.

Then it will be also need to update the comment inside 
continue_new_vcpu() to:

-         * To avoid this, interrupts are kept disabled during the restore.
-         * Additionally, setting sstatus.SPIE=1 ensures that after sret is
-         * executed (as sstatus.SIE will be loaded from SPIE), HS-mode will
-         * continue to receive interrupts normally.
+         * To avoid this, interrupts are kept disabled during the restore,
+         * and sstatus.SPIE is set so that sret itself re-enables them
+         * (SIE := SPIE) as part of entering the guest.
           */

Would it be the wording okay for you now?


> 
>> Introduce get_cpu_info() and reset_stack_and_jump() in asm/current.h,
>> needed by the above. get_cpu_info() is a macro rather than a static
>> inline because asm/current.h is pulled in by <xen/percpu.h> before
>> this_cpu() is defined and before <xen/sched.h> completes struct vcpu.
> 
> This is odd, given the similarity to Arm. They get away without using
> "current", and hence without using this_cpu().

Arm calculates struct cpu_info * based on sp register + STACK_SIZE:

static inline struct cpu_info *get_cpu_info(void)
{
#ifdef __clang__
     unsigned long sp;

     asm ("mov %0, sp" : "=r" (sp));
#else
     register unsigned long sp asm ("sp");
#endif

     return (struct cpu_info *)((sp & ~(STACK_SIZE - 1)) +
                                STACK_SIZE - sizeof(struct cpu_info));
}

what is equal to current->arch.cpu_info as I can see based on how both 
arch-es are initializing v->arch.cpu_info what is used in RISC-V.

> 
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -8,10 +8,13 @@
>>   #include <xen/smp.h>
>>   #include <xen/vmap.h>
>>   
>> +#include <asm/aia.h>
>> +#include <asm/aplic.h>
>>   #include <asm/bitops.h>
>>   #include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>>   #include <asm/current.h>
>> +#include <asm/imsic.h>
>>   #include <asm/intc.h>
>>   #include <asm/mmio.h>
>>   #include <asm/riscv_encoding.h>
> 
> What makes these additions necessary here?

None, they are leftovers from an earlier version of this patch. I'll 
drop them; <asm/imsic.h> will be added by the patch which starts using
imsic_vsfile_attach().

> 
>> @@ -140,9 +143,43 @@ static void vcpu_csr_init(struct vcpu *v)
>>       v->arch.hie = MIP_SGEIP;
>>   }
>>   
>> +static void schedule_tail(struct vcpu *prev);
>> +static void noreturn idle_loop(void);
>> +void noreturn return_to_new_vcpu(void);
> 
> For this last one: asmlinkage?

Will add.

> 
>>   static void continue_new_vcpu(struct vcpu *prev)
>>   {
>> -    BUG_ON("unimplemented\n");
>> +    schedule_tail(prev);
>> +
>> +    if ( is_idle_vcpu(current) )
>> +        reset_stack_and_jump(idle_loop);
>> +    else
> 
> This is the kind of "else" which I consider particularly confusing: It
> suggests that the if() body can actually be exited at the bottom, when
> (by the name "reset_stack_and_jump") it hopefully cannot.

Agreed, the "else" isn't needed here. I kept it only because it looked 
more symmetric to me, but I'll drop it and move its body out to the same 
level as the if().

> 
>> +    {
>> +        /*
>> +         * During a context switch to a new vCPU, interrupts must be disabled
>> +         * to guarantee that the vCPU's CSR state can be safely restored into
>> +         * the hart without being clobbered by an interrupt trap.
>> +         *
>> +         * For example, when return_to_new_vcpu() finishes, it executes sret.
>> +         * At that point, the hart checks hstatus.SPV=1 and sstatus.SPP=1 in
>> +         * order to return from HS-mode into VS-mode. If an interrupt were to
>> +         * arrive before sret, the trap entry logic would implicitly clear
>> +         * hstatus.SPV to 0. Correctly restoring it afterwards is non-trivial,
>> +         * and if left as 0, sret would incorrectly return to HS-mode instead
>> +         * of VS-mode.
>> +         *
>> +         * To avoid this, interrupts are kept disabled during the restore.
>> +         * Additionally, setting sstatus.SPIE=1 ensures that after sret is
>> +         * executed (as sstatus.SIE will be loaded from SPIE), HS-mode will
>> +         * continue to receive interrupts normally.
>> +         */
>> +        local_irq_disable();
>> +        csr_set(CSR_SSTATUS, SSTATUS_SPIE);
>> +
>> +        csr_write(CSR_HSTATUS, vcpu_guest_cpu_user_regs(current)->hstatus);
>> +
>> +        reset_stack_and_jump(return_to_new_vcpu);
> 
> What are the criteria by which you split CSR accesses between doing some here
> and some in return_to_new_vcpu()? In particular you set sstatus.SPIE here but
> sstatus.SPP there, when both could - I think - be done with a single CSR
> access.

There was no real criterion (and SPIE is set here only for better 
explanation of the comment). I'll move all the CSR setup sret depends on
(hstatus, sepc, sstatus.SPP and sstatus.SPIE) into return_to_new_vcpu(),
like the regular return-to-guest path in entry.S already does, and set 
SPP and SPIE with a single CSR access there. Only local_irq_disable() 
will stay in continue_new_vcpu().

I will do the following:

+     * return_to_new_vcpu() sets up hstatus.SPV, sstatus.SPP and sepc so
+     * that sret enters the guest in VS-mode. A trap taken in HS-mode
+     * overwrites all of them (trap entry clears hstatus.SPV in 
particular),
+     * so interrupts have to stay disabled until sret. They are 
re-enabled by
+     * sret itself, as return_to_new_vcpu() also sets sstatus.SPIE.
       */
      local_irq_disable();
-    csr_set(CSR_SSTATUS, SSTATUS_SPIE);
-
-    csr_write(CSR_HSTATUS, vcpu_guest_cpu_user_regs(current)->hstatus);

      reset_stack_and_jump(return_to_new_vcpu);

and then:

-/* t0 is used as a temporary reg and is clobbered to oblivion */
+/*
+ * Enter a vCPU for the first time. Must be called with interrupts 
disabled,
+ * see continue_new_vcpu().
+ *
+ * t0 is used as a temporary reg and is clobbered to oblivion.
+ */
  FUNC(return_to_new_vcpu)
          /* Swap tp with sscratch */
          csrrw   tp, CSR_SSCRATCH, tp

          /* Set vCPU registers */
+        REG_L   t0, CPU_USER_REGS_HSTATUS(sp)
+        csrw    CSR_HSTATUS, t0
+
          REG_L   t0, CPU_USER_REGS_SEPC(sp)
-        csrw    sepc, t0
+        csrw    CSR_SEPC, t0

          /* Hartid goes to a0 */
          REG_L   a0, CPU_USER_REGS_A0(sp)

          /* DTB goes to a1 */
          REG_L   a1, CPU_USER_REGS_A1(sp)

-        /* Set guest mode to supervisor */
-        li      t0, SSTATUS_SPP
+        /* Return to (V)S-mode, with interrupts re-enabled by sret */
+        li      t0, SSTATUS_SPP | SSTATUS_SPIE
          csrs    CSR_SSTATUS, t0

          /* Enter guest */
          sret
  END(return_to_new_vcpu)


> 
>> --- a/xen/arch/riscv/entry.S
>> +++ b/xen/arch/riscv/entry.S
>> @@ -143,3 +143,26 @@ FUNC(__context_switch)
>>   
>>           ret
>>   END(__context_switch)
>> +
>> +/* t0 is used as a temporary reg and is clobbered to oblivion */
>> +FUNC(return_to_new_vcpu)
>> +        /* Swap tp with sscratch */
>> +        csrrw   tp, CSR_SSCRATCH, tp
> 
> What is this about? I'm not aware of any counterpart code, yet all on its
> own this I can't see it being overly useful.

It will be needed later when a guest will be able to launch to 
distinguish in handle_trap() [1] if a trap is from guest or not. I can 
drop it for now and re-introduce it with the code of handle_trap() or as 
an option I could update the comment above to:

         /*
          * SSCRATCH holds this hart's struct pcpu_info while a guest 
runs and
          * is zero while Xen runs, so that a trap handler can tell the two
          * apart: tp is Xen's pointer to pcpu_info in Xen context, but 
belongs
          * to the guest once sret has been executed. Establish that by 
swapping
          * the two here; the trap path swaps them back.
          */
         csrrw   tp, CSR_SSCRATCH, tp

(but then the last part will point to the part which isn't yet 
introduced so probably it will be better to drop this line for now)

[1] 
https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/entry.S?ref_type=heads&blame=1#L15


> 
>> +        /* Set vCPU registers */
>> +        REG_L   t0, CPU_USER_REGS_SEPC(sp)
>> +        csrw    sepc, t0
>> +
>> +        /* Hartid goes to a0 */
>> +        REG_L   a0, CPU_USER_REGS_A0(sp)
>> +
>> +        /* DTB goes to a1 */
>> +        REG_L   a1, CPU_USER_REGS_A1(sp)
> 
> The fields loaded are merely .a0 and .a1 of the register struct. There's
> nothing here making sure (all on its own) that what is loaded is what is
> said by the comments. If e.g. the first comment was /* .a0 holds the
> hart id */ or some such to remind readers what is being loaded without
> giving the impression that the correct value is _established_ here, that
> may be better.

I will re-word the comments in suggested way:

-        /* Hartid goes to a0 */
+        /* .a0 holds the hart id */
          REG_L   a0, CPU_USER_REGS_A0(sp)

-        /* DTB goes to a1 */
+        /* .a1 holds the address of the DTB */
          REG_L   a1, CPU_USER_REGS_A1(sp)


> 
>> +        /* Set guest mode to supervisor */
>> +        li      t0, SSTATUS_SPP
>> +        csrs    CSR_SSTATUS, t0
>> +
>> +        /* Enter guest */
>> +        sret
>> +END(return_to_new_vcpu)
> 
> Aiui SRET does not switch stacks. Shouldn't you therefore clear sp here?
> And perhaps also other GPRs, not the least ra? Exposing hypervisor
> register values to guests is, well, a bit of a problem.

Good point, sret leaves all GPRs as they are, so the guest would indeed 
see Xen's sp, ra and friends. Only a0 and a1 are architecturally 
meaningful for a booting hart, so I'll clear every other GPR right 
before sret.

I will add the following before sret:

         /*
          * sret doesn't switch stacks and leaves the GPRs alone, so every
          * register which isn't meaningful to the vCPU being started 
has to be
          * cleared here: otherwise the guest would see Xen's values, sp 
(this
          * vCPU's Xen stack) and ra among them.
          */
         .irp reg, ra, sp, gp, tp, t0, t1, t2, s0, s1, a2, a3, a4, a5, 
a6, a7, \
                   s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, t3, t4, t5, t6
         mv      \reg, zero
         .endr

Thanks.

~ Oleksii

