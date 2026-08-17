Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E263CC5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 15:36:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393078.1631974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvzNx-0002lO-Oa; Mon, 17 Aug 2026 15:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393078.1631974; Mon, 17 Aug 2026 15:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvzNx-0002lH-Kd; Mon, 17 Aug 2026 15:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1393078;
 Mon, 17 Aug 2026 15:36:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wvzNv-0002lA-H4
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 15:36:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvzNu-00HZGS-9z
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 17:36:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a832a74-bab6-0a2a0a5309dd-0a2a45028f1c-6
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 17:36:22 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a832a76-6ca4-0a2a45020019-d155dd2ed0aa-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 17:36:22 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4799b3f7c83so2509214f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 08:36:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3b896sm4829015f8f.16.2026.08.17.08.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 08:36:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786980982; x=1787585782; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=APmx+OQyjJW2Ssi7kcgtOEycsmzzm5MjhN44NhTcf0M=;
        b=UDnqy6Efwb6uI03Hv5ea+YPirTmP/wfcLC1Yh4N1hu8oLqSVXIYIOIy/XDH7KQREQa
         vP8SQrJ+HFQwXsH6Ehv4wNB3kjLcJmryAKmkwLVRrT+UdFqXi5P7i4/EsdACUxDWHDgK
         X7rF8WWRQaSyRVUPg2Iy1It/8fmGCKZnR9EkMjAcDZ69UYtGfYpY5rlTex1AwBTRtvmw
         TAm/y6kgN/33FvRJuCBEonvKrinGqNKhFLKEfC/v+/Iz6XqewVTKPiL3dl4w3j4zdj4+
         aC/CSs9JE5sLJy8ZerzieGEdAgAHHPnXsLlMDCWjF/Us5NhoF4tJjnqS3eqvnMI7yyyX
         KqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786980982; x=1787585782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APmx+OQyjJW2Ssi7kcgtOEycsmzzm5MjhN44NhTcf0M=;
        b=IPtUyguk9j8lrS2CovTmd87Axp90kayM30+1byRPXYpGlpzCkNDSHdNuQtLhOWOZgQ
         Rt+nyv3Y6+absw3E7QpkTrSFOfkCekWCf7EpE5p5gafe6L0ef1HLMhkR1aj8LsS4+I3h
         25afHKjybr4sdhfPycpVgCTXXH/4wIH9o5VQAxJsa/yujlLIvmmIW27niOm2KNRcxOXp
         TGRwEA00R+ptkoXTJr05IDP+K3giA2FoYadf5uK7YQRZ65n0oDbCSXEep0VZmgN6waGu
         kNO6c72iM7fndRzTjaRd53RlFxpqXMMlXGedKOG9L3p4Q1kJbi2vVQr8RcER1VuSRJOa
         PpTw==
X-Forwarded-Encrypted: i=1; AHgh+RpQEW4gvaQM/clntwmmFyO4bv6Pgu8y/uwO9ZjULYjfN9yzDeEmoG7gw+qpMSiHoiICVtjjF/9jGAw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSl6A75JsujuYo5F/UtZCMBHBOJBuc1dAWMvkPuYvJ4nKb9FYw
	crRjZ4PlrUMdZ/pMXdrjl81U9iF/XjZ+1f/uIM5GXPLJSOXUnhdGwxnc
X-Gm-Gg: AR+sD12dTo6toDFsXf1LCjIFL/fCk480fuz6zmll9G7BykIFNBbEGH1LiQi2XLhFFXT
	2dVpax8qyPf31XwRjvQTia80wLN6NIv/qfjGIzbGeggCxWbQXWklqwbFL5IQawED6CN4IAmifn7
	PybdcyyS6Is4p8Wz6uMPUJ/gZHKDL0nEoiQzw/uOBYzBkPNC/MLDlMCCe/9b0H5s7zTTnVkFgdD
	YDC8WgkOYNDzWH2LK4/3Jj/aYMJ7MH6pwj0u0Ij3vbnhRakdXMdFeoeOYm29cuPWmt0s8B/vbCx
	kZcnnXU1KRhOBGEzcc0Ogohoi09T9L6ADAxTYJ7JDXb7bO8EK3j6h4RF/hw6u7EHSFJJPEs3Q8u
	yrKezD6dre80XsIM8ee/sSdkUx0/Ds7caIhUL+iikTs+4//Vkd4yZEKXCy3c12HXqzj94xu1FRd
	olgeSkZPTJ9zyiHsa2glL20RJqoiRURah4Sq+BdjjFSK2jxInomuhf/iNiy8bxk7ri4wGUbtI0X
	pKt6df+6B2coIBYi7uzW2keEpPIKjAt/sHdHdsPks4srH1l
X-Received: by 2002:a05:6000:46cd:b0:47f:9486:810b with SMTP id ffacd0b85a97d-4816074ac41mr30202251f8f.7.1786980981406;
        Mon, 17 Aug 2026 08:36:21 -0700 (PDT)
Message-ID: <3c0d33bd-ebab-48df-9ddf-a508e5bed5fe@gmail.com>
Date: Mon, 17 Aug 2026 17:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 13/17] xen/riscv: add unprivileged guest memory read
 helper
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
 <79cfa875e9dfc14bbcad948c20f4008b03d11f72.1784560663.git.oleksii.kurochko@gmail.com>
 <71a226b9-dc03-4a69-beb2-5c4c03b8d09b@suse.com>
Content-Language: en-US
In-Reply-To: <71a226b9-dc03-4a69-beb2-5c4c03b8d09b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1786980982-F02992AC-11CB2D4C/10/73395122804
X-purgate-type: spam
X-purgate-size: 13869



On 8/12/26 5:30 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> Introduce riscv_vcpu_unpriv_read() to allow Xen to safely read guest memory
>> using HLV/HLVX instructions while reliably capturing trap context.
> 
> Both for the title and the function name: How does "unprivileged" matter here?

Unprivileged because HLV/HLVX reads guest memory as if it were accessed 
from a less-privileged (guest) context, rather than by the hypervisor in 
HS mode.

I think I am okay generally to drop "unpriv..." from the function name.

> The same functions would be use for reading Dom0's memory, wouldn't they?

Yes, I don't see any issue to let this function to read DomO's memory 
too. But Dom0 could be counted as "unprivileged" too as it is executed 
in VS-mode which is less-privileged then HS-mode.

> 
>> @@ -114,3 +115,93 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
>>       return copy_guest(buf, gpa, len, GPA_INFO(d),
>>                         COPY_to_guest | COPY_gpa);
>>   }
>> +
>> +/*
>> + * Read machine word from Guest memory
>> + *
>> + * @read_insn: Flag representing whether we are reading instruction
>> + * @guest_addr: Guest address to read
>> + * @trap: Output pointer to trap details
>> + *
>> + * The hlv/hlvx instructions translate guest_addr through the live
>> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
>> + * space of the currently running vCPU.
>> + */
>> +unsigned long riscv_vcpu_unpriv_read(bool read_insn,
>> +                                     unsigned long guest_addr,
> 
> Personally for such a function I'd expect the address to be the main (first)
> parameter.

Agree, it will be better. I will update prototype of the function.

> 
>> +                                     struct trap_info *trap)
>> +{
>> +    unsigned long val, tmp;
>> +    unsigned long flags, old_hstatus;
>> +
>> +    /*
>> +     * As hstatus is going to be changed we don't want an interrupt to occur
>> +     * with guest's hstatus register.
>> +     */
> 
> I don't think "guest's hstatus register" is something real. hstatus is
> entirely the hypervisor's register, controlling the guest.

Agree, the wording is incorrect what I meant it is that we don't want to 
corrupt hstatus which was saved during guest exit to hypervisor.

I will just put the following comment "As hstatus is going to be changed 
we don't want an interrupt to change it".

> 
>> +    local_irq_save(flags);
>> +
>> +    /*
>> +     * The hypervisor virtual-machine load and store instructions are valid
>> +     * only in M-mode or HS-mode, or in U-mode when hstatus.HU=1. Each
>> +     * instruction performs an explicit memory access as though V=1; i.e.,
>> +     * with the address translation and protection, and the endianness,
>> +     * that apply to memory accesses in either VS-mode or VU-mode.
>> +     * Field SPVP of hstatus controls the privilege level of the access.
>> +     * The explicit memory access is done as though in VU-mode when SPVP=0,
>> +     * and as though in VS-mode when SPVP=1.
>> +     *
>> +     * So it is necessary to restore vCPU's hstatus before execution of
>> +     * hlv* instruction.
>> +     */
>> +    old_hstatus = csr_swap(CSR_HSTATUS,
>> +                           vcpu_guest_cpu_user_regs(current)->hstatus);
> 
> As you're limiting use of the function to the current vCPU, why would hstatus
> need fiddling with? The fields of interest aren't being altered between exit
> from guest and making it here, are they?

You're right, it doesn't. handle_trap() only saves hstatus into the trap 
frame on entry and restores it before sret; nothing in between installs 
a hypervisor-specific value. So the guest's hstatus (in particular SPVP, 
the only field HLV cares about here (HU only matters in U-mode) ) is 
still live when we get here. Traps taken from HS-mode update only SPV 
and GVA, neither of which affects HLV.

> 
> Without that IRQs also wouldn't need turning off (what about NMIs, btw, once
> supported on Xen?), which would help real-time use cases (latency here can
> otherwise be affected by guests, by wait of forcing exceptions to be raised).

Correct, and I'll drop local_irq_save() too. In fact it is already a 
no-op at both call sites: do_trap() runs with interrupts disabled by the 
trap entry itself. And even with the hstatus write in place it would not 
have been needed: any nested trap goes through the same entry path, 
which saves and restores hstatus (an NMI path built the same way would 
be safe for the same reason, rather than relying on interrupts being 
masked).

What I will do instead is document and assert the actual precondition: 
the function may only be called on the trap-handling path of the current 
vCPU, before returning to the guest. That is where hstatus, vsatp and 
hgatp are guaranteed to still be that vCPU's. do_trap() reaches 
check_for_pcpu_work(), and hence any reschedule, only after handling is 
done.

The following check I will add instead csr_swap() and local_irq_save():
   ASSERT(vcpu_guest_cpu_user_regs(current)->hstatus & HSTATUS_SPV);

> 
>> +    if ( read_insn )
>> +    {
>> +        asm volatile ( "\n"
>> +            "1:\n"
>> +            "   hlvx.hu %[val], (%[addr])\n"
>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
> 
> Imo labels used for extable entries would better live on the same line as
> the insn they mark.
> 
>> +            "   andi %[tmp], %[val], 3\n"
>> +            "   addi %[tmp], %[tmp], -3\n"
>> +            "   bne %[tmp], zero, 3f\n"
> 
> Use BNEZ?
> 
>> +            "   addi %[addr], %[addr], 2\n"
>> +            "\n"
>> +            "2:\n"
>> +            "   hlvx.hu %[tmp], (%[addr])\n"
>> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
>> +            "   sll %[tmp], %[tmp], 16\n"
>> +            "   add %[val], %[val], %[tmp]\n"
> 
> May I suggest OR instead of ADD?
> 
>> +            "3:\n"
> 
> If this is an insn wider than 32 bits, you won't have fetched all of it.
> I think you want to at least add a comment here indicating that e.g. it's
> the callers responsibility to deal with that. 

I will add the following comment above the function:

  * At most two halfwords are fetched when @read_insn is true, i.e. 
encodings
  * wider than 32 bits are not supported. Such an encoding cannot be 
completed
  * by calling this function again at @guest_addr + 4: the length check is
  * applied to the first halfword read, which would then be a 
continuation of
  * the instruction rather than its opcode. It is up to the caller to reject
  * anything that is neither a 16- nor a 32-bit encoding.

> (How they would do that is
> entirely unclear to me, as they can't simply invoke this function again
> passing guest_addr + 4.)

Then it will be needed to update the code of riscv_unpriv_read().

For now we could something like:

        /*
          * Only two halfwords are fetched, so an encoding wider than 32 
bits
          * would have been truncated. Report it as illegal with a zero 
stval:
          * a nonzero one would have to hold the actual faulting 
instruction,
          * whereas zero simply means the value isn't provided.
          */
         if ( !INSN_IS_16BIT(insn) && !INSN_IS_32BIT(insn) )
             return truly_illegal_insn(v, 0);

> 
>> +        : [val] "=&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr)
>> +        : [ti] "r" (trap) : "memory" );
> 
> You want to tell the compiler that *trap is written. Instead I don't see
> why a memory clobber would be needed: You access a different address space,
> i.e. nothing the compiler can make any assumptions about.

memory clobber tells the compiler that the assembly code performs memory 
reads or writes to items other than those listed in the input and output 
operands and so I don't tell here that *trap will be changed.

Why this understanding is wrong?

Alternative, I think, could be:
         : [val] "+r" (val), "+m" (*trap)
         : [addr] "r" (guest_addr), [ti] "r" (trap) );
And then memory clobber could be dropped.



> 
> You also need to take precautions for not returning an uninitialized "val".
> I think the variable wants initializing (perhaps to ~0) and "+r" wants
> using as constraint. (Afaik & isn't necessary to use together with +.)

I agree with '+' if we will initialize val with some value.

Regarding, '&' my understanding is that I have to use it always when

> 
>> +        /*
>> +         * Although HLVX instructions' explicit memory accesses require execute
>> +         * permissions, they still raise the same exceptions as other load
>> +         * instructions, rather than raising fetch exceptions instead.
>> +         */
>> +        if ( trap->scause == CAUSE_LOAD_PAGE_FAULT )
>> +            trap->scause = CAUSE_FETCH_PAGE_FAULT;
>> +    }
>> +    else
>> +    {
>> +        asm volatile ( "\n"
>> +            "1:\n"
>> +#ifdef CONFIG_RISCV_64
>> +            "hlv.d %[val], (%[addr])\n"
>> +#else
>> +            "hlv.w %[val], (%[addr])\n"
>> +#endif
> 
> Once again please use enough care that RV128 would at least obviously fail to
> build, rather than building something which then doesn't work.

Sure, I will do the following:

#if defined(CONFIG_RISCV_64)
             "hlv.d %[val], (%[addr])\n"
#elif defined(CONFIG_RISCV_32)
             "hlv.w %[val], (%[addr])\n"
#else
              #error "unsupported RISC-V variant: no hlv for a machine word"
#endif

> 
>> +            "2:\n"
>> +            ASM_EXTABLE_TRAP_INFO(1b, 2b, %[ti])
>> +        : [val] "=&r" (val)
>> +        : [addr] "r" (guest_addr), [ti] "r" (trap) : "memory" );
>> +    }
>> +
>> +    csr_write(CSR_HSTATUS, old_hstatus);
>> +
>> +    local_irq_restore(flags);
>> +
>> +    return val;
>> +}
> For both reads and fetches - are there no alignment constraints at all on the
> incoming guest_addr?
> 

For the fetch path there is an implicit constraint, but the architecture
guarantees it: guest_addr is always the guest's sepc, and IALIGN is 16
bits (32 without the C extension), so it cannot be odd, the guest would
have taken an instruction-address-misaligned exception before we ever 
saw this trap. hlvx.hu is then a naturally aligned halfword access, and
advancing by 2 preserves that.

For the data read there is deliberately no constraint: HLV behaves as 
the guest's own access would, so on a hart which handles misaligned 
accesses it simply works, and on one which doesn't it raises 
load-address-misaligned, which the exception table turns into 
trap->scause for the caller to redirect.

But then it will be need to:

--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -565,51 +565,73 @@ static void do_unexpected_trap(const struct 
cpu_user_regs *regs)
  void do_trap(struct cpu_user_regs *cpu_regs)
  {
      register_t pc = cpu_regs->sepc;
      unsigned long cause = csr_read(CSR_SCAUSE);

+    /*
+     * A synchronous trap taken while Xen itself was running may come 
from an
+     * access done on a vCPU's behalf, e.g. the hlv/hlvx sequences in
+     * riscv_vcpu_unpriv_read(). Those accesses are covered by 
exception table
+     * entries which record the fault details for the caller and resume
+     * execution past the faulting instruction.
+     *
+     * Interrupts must be excluded here: one taken at an address which 
happens
+     * to be listed in the exception table would otherwise be "fixed 
up" as if
+     * the access itself had faulted, silently skipping it.
+     *
+     * Returning early skips check_for_pcpu_work() below, which is correct:
+     * that only runs for traps taken from the guest.
+     */
+    if ( !(cause & CAUSE_IRQ_FLAG) && !(cpu_regs->hstatus & HSTATUS_SPV) &&
+         fixup_exception(cpu_regs) )
+        return;
+
      switch ( cause )
      {
      case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
          /* CAUSE_VIRTUAL_SUPERVISOR_ECALL should come from VS-mode */
          BUG_ON(!(cpu_regs->hstatus & HSTATUS_SPV));

          vsbi_handle_ecall(cpu_regs);
          break;

      case CAUSE_LOAD_GUEST_PAGE_FAULT:
      case CAUSE_STORE_GUEST_PAGE_FAULT:
+        /*
+         * Anything not recovered by the exception table above must 
have come
+         * from the guest: a G-stage fault taken in Xen context, e.g. by an
+         * hlv/hlvx not covered by an entry, is a bug.
+         */
+        BUG_ON(!(cpu_regs->hstatus & HSTATUS_SPV));
+
          handle_guest_page_fault(cause, cpu_regs);
          break;

      case CAUSE_VIRTUAL_INST_FAULT:
      {
          int ret;

          BUG_ON(!(cpu_regs->hstatus & HSTATUS_SPV));

          ret = handle_virt_instruction_fault(current);
          if ( ret < 0 )
              /* TODO: crash only domain instead of Xen? */
              /* domain_crash(current->domain); */
              panic("couldn't handle CAUSE_VIRTUAL_INST_FAULT: %d\n", ret);
          break;
      }

      case CAUSE_ILLEGAL_INSTRUCTION:
          if ( do_bug_frame(cpu_regs, pc) >= 0 )
          {
              if ( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
              {
                  printk("Something wrong with PC: %#lx\n", pc);
                  die();
              }

              cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);

              break;
          }

-        if ( fixup_exception(cpu_regs) )
-            break;
-
          fallthrough;
      default:
          if ( cause & CAUSE_IRQ_FLAG )
          {
              /* Handle interrupt */

Does it make sense?

Thanks.

~ Oleksii



