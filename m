Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D237EC5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 16:06:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395662.1633974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwio1-0004zS-B6; Wed, 19 Aug 2026 16:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395662.1633974; Wed, 19 Aug 2026 16:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwio1-0004zL-8E; Wed, 19 Aug 2026 16:06:21 +0000
Received: by outflank-mailman (input) for mailman id 1395662;
 Wed, 19 Aug 2026 16:06:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwio0-0004zF-7P
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 16:06:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwinz-00A1fF-60
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 18:06:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a85d46a-bab6-0a2a0a5309dd-0a2a4503bf1a-36
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 18:06:19 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a85d47a-fae8-0a2a45030019-d155dd34a883-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 18:06:18 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47db714766aso41712f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:06:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e784b3sm61369175e9.3.2026.08.19.09.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 09:06:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787155578; x=1787760378; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V3aCry1tuYFSYd1HvBy8Hn801kksHmedceglL/moChE=;
        b=lRArQjA5sv4nXXOFpMhz5qi4p9OyC1ddSDHNs5Ht1fFrnUU19KEZEUggTpc6FI+1nz
         Ktpcjj8jqkPBoIzF81R2xchyX4TePR9ri67RAt7moS9Rr/j1R0HZMaSv783uuJAiSyi5
         odXwbpeAkJKDi/M1rPtRvCFR6Y4+ofOcQ2ppnpP4yIk2Mr6PzkqKP+bxBzgyiQCd+o23
         QsZGYO2OGVyQZ5TYX54m1qyX/sPjGQ4qA3wGr5ZKE+TacBO241/t/1p++IAuHJQQ9ADC
         AOVbBbPsypcElb35Fs2Dd1EXhNINhMmzSaUkbMh9gRPqasoyq3shPZsFdX2pUZbgcdAi
         9Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155578; x=1787760378;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3aCry1tuYFSYd1HvBy8Hn801kksHmedceglL/moChE=;
        b=H0MuoiD5I33suu1+beU9KyKLAsJ17Ff5q2LlUAptWqqnALEfdqxS3Gr6+UxZk1gRuZ
         OL8a7s4S1kBSlUHVIfFPmQTnpNJ7fovkX9BYJG1r/Ba44Eo4FTzvSZcoDbjqYkzGB0xv
         ruWyzF8qCHvlDIL7d4u0ncu366V1jBc8TtApLXdsGK9+MiyCsN7Q9yPfxkisSIhAtb79
         BiTCfS/uT4XlpydQo5+OtdyMGZrU9dDWLYJ198mBjUrt6eO558hh+RrqBfe+jrHrbxxy
         n8ue5dnEhvX4nwvlWRMqFovYPUybDmnok85h3Bcw/qBnZY68BtX0hA/74xKOv4ZDIcX7
         HI2g==
X-Forwarded-Encrypted: i=1; AHgh+RrcId/9rRS+dIX3Yy6p+2jHEaxYQKHefjwBz+TTZjhNArBiDX6fyTdNoaMxd5H5r4f8MzOp7xAj1Oo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLJwI67mBArOkHfH+I4I5QPNz8rsgCAhEgTwqmd29BRFwzRIoM
	s2hJ19scd0+v1hvH/zoMcVqIbX5P0y8tZja9gFzBdfatgJHn09IM4T9Q
X-Gm-Gg: AR+sD128mn63MY5OHUzx+/goW6V+TQ0dP0oXtq+TdMoP5u01S1vlX2Qi9R6Y69KAjya
	MoX5QCct0bF71eqkQg9NlGiDMWPlK7cyiMlrRHvnPVyaFlN2auMJj025JCyTYs14t7uo45ErgCU
	LMXDtUZ1zoIO5hbUpONxJoig/SYiDLSBNy+zqjWNjZNozuDS0HEFIjphuAajYh+kaDoPQz25a+S
	YBVAHUc0q8G2kqfdEEydx6dOj1/cpmuaq5o+UixFIOqre5uxCvqb6+C/yVjaO7848oBZgKsuloo
	8Hr6WymBmMur5lP+CE1t2rS+dBQP/9w/Emvbl8LWSJysALFUUwsJ0gGx2Pv8wQS6HdwApUxcK0S
	n9X0fgd3CbR4uXstc7xrTyFLK7SO5J9uhHMzx89NAGPnc7Qz0D8sJW0rdXctWEOMQXEsgugbRmr
	qZt1GtOpwPXjUPbhbq9ELyfb2qoULVcakpSBs1cVBuqarIiO/6Gphy5GJH82Rcd/vNJGarhpfg2
	Ph2/eBSq5C6NkZETGEQ8+1s2rRD2D0p9UHTnU7ygqY=
X-Received: by 2002:a05:600c:1f85:b0:499:90d0:4906 with SMTP id 5b1f17b1804b1-499b06bf1a1mr3549415e9.5.1787155578048;
        Wed, 19 Aug 2026 09:06:18 -0700 (PDT)
Message-ID: <aff1f879-48c6-4047-a6c1-237a350e0f35@gmail.com>
Date: Wed, 19 Aug 2026 18:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 16/17] xen/riscv: add guest load emulation for trapped
 MMIO accesses
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
 <9b18a20367754605efd6a6b5bf09d4483d9c3ab2.1784560663.git.oleksii.kurochko@gmail.com>
 <7a2e46da-5b1f-448e-aba3-7eefe0a61950@suse.com>
Content-Language: en-US
In-Reply-To: <7a2e46da-5b1f-448e-aba3-7eefe0a61950@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1787155579-768FA4E9-506633C2/10/73395122804
X-purgate-type: spam
X-purgate-size: 22051



On 8/13/26 9:15 AM, Jan Beulich wrote:
> On 29.07.2026 15:40, Oleksii Kurochko wrote:
>> Introduce emulate_load() to decode and emulate guest load instructions
>> that fault due to MMIO accesses. This provides the basic infrastructure
>> required for MMIO emulation on RISC-V.
>>
>> The instruction decode (decode_trapped_insn() and the mask/match chain
>> for standard and compressed load encodings) is adapted from Linux's KVM
>> RISC-V implementation. The completion path differs from KVM's,
>> since Xen dispatches MMIO synchronously to an in-hypervisor handler via
>> try_handle_mmio() and has no userspace exit/return step equivalent to
>> KVM's kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
>> split.
>>
>> A fault taken while re-reading the trapped instruction is handled
>> depending on the faulting translation stage:
>>   - A VS-stage fault is the guest's own fault (e.g. it modified its page
>>     tables from another vCPU) and, as in KVM, is redirected to the
>>     guest's trap vector, with the cause remapped to
>>     CAUSE_FETCH_PAGE_FAULT since HLVX reports execute-permission failures
>>     as load faults.
>>   - A G-stage fault would mean the P2M mapping of the instruction page
>>     disappeared after the instruction was fetched. KVM must handle this
>>     by resuming the guest and retrying, as Linux MM can invalidate
>>     G-stage mappings at any time. Xen does not remove P2M mappings of a
>>     running domain at the moment, so this case is asserted unreachable with
>>     BUG_ON(); it will need to be revisited once such removal is implemented.
> 
> I don't see why this cannot be implemented correctly right away. The behavior
> should be that of an access to unpopulated space on bare hardware, whatever
> that behavior is on RISC-V.

I wasn't able to find a spec what should be returned in this case but in 
QEMU source code I founded (unassigned_mem_ops → MEMTX_DECODE_ERROR → 
io_failed() → riscv_cpu_do_transaction_failed().):

void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
                                      int mmu_idx, MemTxAttrs attrs,
                                      MemTxResult response, uintptr_t 
retaddr)
{
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;

     if (access_type == MMU_DATA_STORE) {
         cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
     } else if (access_type == MMU_DATA_LOAD) {
         cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
     } else {
         cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
     }

So RISCV_EXCP_INST_ACCESS_FAULT (in Xen it is CAUSE_FETCH_ACCESS) will 
be fine to return.

So do the following:

             if ( is_load_guest_page_fault(utrap.scause) )
                 utrap.scause = CAUSE_FETCH_ACCESS;

will be fair enough instead of: 
BUG_ON(is_load_guest_page_fault(utrap.scause)).

Probably, we want to rename CAUSE_FETCH_ACCESS to be closer to RISC-V 
spec as for value 1 in spec it is used:
    1 Instruction access fault
Interesting that all other CAUSE_* defines are aligned with the spec...

> 
>> @@ -13,6 +14,11 @@ struct trap_info {
>>       register_t stval;
>>   };
>>   
>> +static inline bool is_load_guest_page_fault(unsigned long scause)
>> +{
>> +    return (scause == CAUSE_LOAD_GUEST_PAGE_FAULT);
>> +}
> 
> Is something like this really a useful wrapper to have? It doesn't really
> shorten anything, nor does (imo) it aid readability.
> 
>> @@ -191,6 +193,11 @@ static void timer_interrupt(void)
>>       raise_softirq(TIMER_SOFTIRQ);
>>   }
>>   
>> +static always_inline void advance_pc(struct cpu_user_regs *regs, int step)
> 
> See my earlier remark regarding always_inline. Also - why plain int? Are
> there (going to be) cases where PC is moved backwards (in which case
> "advance" isn't suitable naming)?

No, it won't. At least, I don't see such use cases now. I'll use 
unsigned int instead.

> 
>> +{
>> +    regs->sepc += step;
>> +}
>> +
>>   static always_inline unsigned long get_faulting_gpa(void)
>>   {
>>       /*
>> @@ -210,9 +217,162 @@ static always_inline unsigned long get_faulting_gpa(void)
>>       return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
>>   }
>>   
>> +/*
>> + * Determine the trapped instruction which caused a guest MMIO trap.
>> + *
>> + * Returns true if the trap was redirected to the guest, in which case
>> + * the caller must stop emulation and return success. Otherwise *insn
>> + * and *insn_len are filled in and the caller should continue decoding.
>> + */
>> +static bool decode_trapped_insn(unsigned long htinst, unsigned long *insn,
>> +                                unsigned int *insn_len)
>> +{
>> +    if ( htinst & 0x1 )
>> +    {
>> +        /*
>> +         * Bit[0] == 1 implies trapped instruction value is
>> +         * transformed instruction or custom instruction.
>> +         */
>> +        *insn = htinst | INSN_16BIT_MASK;
>> +        *insn_len = (htinst & BIT(1, UL)) ? INSN_LEN(*insn) : 2;
> 
> In the if() you don't use BIT(), while here you do. Please be consistent.
> 
> Why the use of INSN_LEN(), when due to the earlier assignment it'll always
> yield 4 here?

ld/sd instruction which we are trapping here at the moment here could be 
2 bit and 4 bit depends on C extension so we need to pass correct 
instruction length to advance_pc() after it is emulated.

> 
> Finally, how would the caller know whether it looks at a transformed insn
> or (as fetched below) a "normal" one?

According to the spec ((part from htinst ... ):
On a synchronous exception, if a nonzero value is written, one of the 
following shall be true about the value:

• Bit 0 is 1, and replacing bit 1 with 1 makes the value into a valid 
encoding of a standard instruction.
In this case, the instruction that trapped is the same kind as indicated 
by the register value, and the register value is the transformation of 
the trapping instruction, as defined later. For example, if bits 1:0 are 
binary 11 and the register value is the encoding of a standard LW (load 
word) instruction, then the trapping instruction is LW, and the register 
value is the transformation of the trapping LW instruction.

• Bit 0 is 1, and replacing bit 1 with 1 makes the value into an 
instruction encoding that is explicitly designated for a custom 
instruction (not an unused reserved encoding). This is a custom value. 
The instruction that trapped is a non-standard instruction. The
interpretation of a custom value is not otherwise specified by this 
standard.

• The value is one of the special pseudoinstructions defined later, all 
of which have bits 1:0 equal to 00.

So setting bit 0 to 1 we will guarantee that it is normal "normal" 
instruction.

> 
>> +    }
>> +    else
>> +    {
>> +        struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
> 
> Pointer-to-const.
> 
>> +        struct trap_info utrap = { 0 };
> 
> Just {} please.
> 
>> +        /*
>> +         * Bit[0] == 0 implies trapped instruction value is
>> +         * zero or special value.
>> +         */
> 
> How come you get away without dealing with pseudoinsns? The insn pointed at
> by regs->sepc is of no interest for faults caused by implicit memory accesses
> originating from VS-stage address translation.

It is really problem but I think it should be resolved much earlier in 
handle_guest_page_fault(). I will add the following:

/*
      * A guest page fault taken on an implicit memory access performed for
      * VS-stage address translation (reading a PTE, or updating its A/D 
bits)
      * reports a pseudoinstruction in htinst rather than a transformed
      * instruction. Such a fault can't be emulated: htval holds the guest
      * physical address of a VS-stage PTE rather than of any access the 
guest
      * itself performed (and its two least significant bits are zero 
instead
      * of matching stval), while the instruction at sepc is unrelated 
to the
      * access which actually faulted.
      *
      * Report an access fault to the guest at the original virtual address,
      * which is what stval already holds and what hardware would raise 
for a
      * page table walk hitting an inaccessible address.
      */
     if ( (htinst == INSN_PSEUDO_VS_LOAD) || (htinst == 
INSN_PSEUDO_VS_STORE) )
     {
         struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
         struct trap_info utrap = {
             .scause = (htinst == INSN_PSEUDO_VS_LOAD) ? CAUSE_LOAD_ACCESS
                                                       : CAUSE_STORE_ACCESS,
             .sepc = regs->sepc,
             .stval = csr_read(CSR_STVAL),
         };

         riscv_trap_redirect(&utrap);
         return;
     }

and will update the comment:

 >> +        /*
 >> +         * Bit[0] == 0 implies trapped instruction value is
 >> +         * zero or special value. It can't be pseudoinstruction as 
it is guaranteed by check in handle_guest_page_fault().
 >> +         */

> 
>> +        *insn = riscv_vcpu_unpriv_read(true, regs->sepc, &utrap);
>> +        if ( utrap.scause )
>> +        {
>> +            /*
>> +             * A G-stage fault here would mean the P2M mapping of the page
>> +             * containing the trapped instruction disappeared after it was
>> +             * fetched.
> 
> Does it? What about, again, faults from VS-stage address translation while
> hardware was trying to fetch an insn? That is ...
> 
>> Nothing removes P2M mappings of a running domain yet,
>> +             * so this cannot happen.
> 
> ... the necessary P2M mapping may never have been there.

If VS-stage failed then CAUSE_LOAD_PAGE_FAULT will happen so BUG_ON() 
won't occur and it will be passed to guest to handle it.

BUG_ON() here catches CAUSE_LOAD_GUEST_PAGE_FAULT (G-stage translation 
failure).

Also, as I mentioned above I will change BUG_ON() too:

             /*
              * If during getting of trapped instruction a fault happen in
              * G-stage translation then CAUSE_LOAD_GUEST_PAGE_FAULT is
              * generated. Such faults during this operation is 
considered as
              * bus
              */
             if ( is_load_guest_page_fault(utrap.scause) )
                 utrap.scause = CAUSE_FETCH_ACCESS;


> 
>> +             * TODO: Revisit once P2M mappings can be removed at runtime.
>> +             */
>> +            BUG_ON(is_load_guest_page_fault(utrap.scause));
>> +
>> +            utrap.sepc = regs->sepc;
>> +            utrap.stval = utrap.sepc;
> 
> How do you know the fault was at .sepc? A 32-bit insn crossing a page boundary
> (implying the C extension is available) may well fault only on its higher half.

According to the spec, if stval is written with a nonzero value when an 
instruction access-fault or page-fault exception occurs on a system with 
variable-length instructions, then stval will contain the virtual 
address of the portion of the instruction that caused the fault, while 
sepc will point to the beginning of the instruction.

So here, we are trying to emulate what real hardware will do in this 
case. In regs->sepc, we have the start of the instruction that we didn't 
touch. sepc is filled according to the spec in this case.

Regarding utrap.stval, we know that utrap.sepc points to the correct 
part of the faulting address, as we are reading the instruction in 
16-bit chunks:

HLVX_HU(%[val], %[addr])        ; low 16 bits from sepc
andi %[tmp], %[val], 3
addi %[tmp], %[tmp], -3
bne  %[tmp], zero, 2f           ; if not (insn & 3) == 3 -> 16-bit, end
addi %[addr], %[addr], 2        ; <- addr is now sepc+2
HLVX_HU(%[tmp], %[addr])        ; high 16 bits, possibly from another page

So, if a trap happens while reading the high 16 bits (which may be 
located on another page), then utrap.sepc, if the read fails, will point 
to the high part of the instruction, which is what the spec requires.

Does that make sense?

> 
>> +            riscv_vcpu_trap_redirect(&utrap);
>> +
>> +            return true;
>> +        }
>> +
>> +        *insn_len = INSN_LEN(*insn);
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +/*
>> + * Check alignment and dispatch a decoded MMIO access to a registered
>> + * handler. On success (0), info->data holds the read value for loads.
>> + */
>> +static int do_mmio(mmio_info_t *info, unsigned long fault_addr,
>> +                   unsigned int len)
>> +{
>> +    /* Fault address should be aligned to length of MMIO */
>> +    if ( fault_addr & (len - 1) )
>> +        return -EIO;
>> +
>> +    info->gpa = fault_addr;
>> +    info->len = len;
>> +
>> +    switch ( try_handle_mmio(info) )
>> +    {
>> +    case IO_HANDLED:
>> +        return 0;
>> +    case IO_ABORT:
>> +        return -EIO;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
> 
> And there's no indication of "retry needed", e.g. when something changed
> between find_mmio_handler() and handle_{read,write}()?

I don't have any specific scenario where it is needed now so I don't 
know what to say.
And there is no race between find_mmio_handler() and 
handle_{read,write}() as find_mmio_handler() returns copy of the 
structure under read_lock():
/*
  * Return a copy of the matching handler rather than a pointer into
  * vmmio->handlers: a concurrent register_mmio_handler() shifts entries
  * up to keep the array sorted, so an escaped pointer could refer to a
  * different (or torn) entry once the lock is dropped. The copy stays
  * valid as the ops structures are never freed.
  */
static bool find_mmio_handler(struct domain *d, paddr_t gpa,
                               struct mmio_handler *out)
{
     struct vmmio *vmmio = &d->arch.vmmio;
     struct mmio_handler key = { .addr = gpa };
     const struct mmio_handler *handler;

     read_lock(&vmmio->lock);
     handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
                       sizeof(*handler), cmp_mmio_handler);
     if ( handler )
         *out = *handler;
     read_unlock(&vmmio->lock);

     return handler != NULL;
}

At the moment, use cases are pretty strainghforward, a device from guest 
trying to read/write into MMIO and so the result logically could be or 
it is successfully handled or some issue happened and it is just 
aborted. As a real hardware will do, I think.

> 
> Also, nit: Blank lines please between non-fall-through case blocks.
> 
>>   static int emulate_load(unsigned long fault_addr, unsigned long htinst)
>>   {
>> -    return -EOPNOTSUPP;
>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
>> +    mmio_info_t info = { .is_write = false };
>> +    unsigned long insn;
>> +    unsigned int shift = 0, len, insn_len;
>> +    bool is_unsigned = false;
>> +    int rc;
>> +
>> +    if ( decode_trapped_insn(htinst, &insn, &insn_len) )
>> +        return 0;
>> +
>> +    /* Decode length of MMIO and whether it is a sign- or zero-extending load */
>> +    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
>> +        len = 1;
>> +    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
>> +    {
>> +        len = 1;
>> +        is_unsigned = true;
>> +    }
>> +    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
>> +        len = 2;
>> +    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
>> +    {
>> +        len = 2;
>> +        is_unsigned = true;
>> +    }
>> +    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
>> +        len = 4;
> 
> Already up to here this demonstrates a weakness of the INSN_MASK_*
> set of #define-s (which I similarly observe in binutils, and I expect it
> all has the same questionable origin). All INSN_MASK_L* and INSN_MASK_FL*
> (also INSN_MASK_S* and INSN_MASK_FS*) are identical, allowing for a nice
> switch() to be used here in principle. That said, with access width
> nicely encoded in FUNCT3, it's not even clear whether a switch() would
> end up being needed / efficient.

.......

> 
> Otoh none of these masks cover the pseudoinsns that htinst may supply.

As I answered above we should handle that before this function will call 
so here we won't deal with htinst at all. Of course, if what I wrote 
above is correct. I will double check before applying that.

> 
> Further, what about A-extension insns? Some (if not all) of them can
> plausibly be used on MMIO, I think.

I’m not really sure that the A-extension is actively used for MMIO. At 
least, Linux doesn’t do that for now, which is why we don’t handle 
A-extension instructions here.

I think this is related to the fact that MMIO is usually (if not 
always?) naturally aligned, and naturally aligned loads and stores are 
guaranteed by RISC-V to execute atomically.

Anyway, since we don’t have a case for this for now, I think we could go 
with the current emulation. If this turns out not to be true in the 
future, A-extension support can be added separately.

> 
>> +#ifndef CONFIG_RISCV_32
>> +    else if ( (insn & INSN_MASK_LWU) == INSN_MATCH_LWU )
> 
> First: Better use IS_ENABLED() in favor of #if{,n}def, whenever possible.
> And then this depends not only on CONFIG_RISCV_32, but also on guest
> bitness.

Both points taken. The #ifndef will become a condition in the if-chain; 
the INSN_MATCH_/INSN_MASK_ definitions are unconditional in 
riscv_encoding.h, so that builds either way.

On guest bitness you're right, and it's worse than the 32-bit-only 
encodings being reserved in RV32: the compressed RV64 encodings collide 
with the RV32 single-precision float ones — C.LD and C.FLW are both 
0x6000 under mask 0xe003, likewise C.SD/C.FSW, C.LDSP/C.FLWSP and 
C.SDSP/C.FSWSP. A 32-bit guest doing a c.flw to an emulated MMIO region 
would be decoded as c.ld, i.e.an 8-byte access with the result written 
to an integer register.

I'll fold both into a helper returning the guest's effective XLEN
(hstatus.VSXL, or vsstatus.UXL when the trap was taken from VU-mode, and
unconditionally 32 for a RV32 build) and gate the RV64-only cases on it. 
As a side note, vcpu hstatus setup currently leaves VSXL alone and thus 
relies on the WARL behaviour of the field; I think Xen should set it 
explicitly.

/*
  * The effective XLEN of the guest at the point of the trap: 
hstatus.VSXL for a
  * trap taken from VS-mode, vsstatus.UXL for one taken from VU-mode.
  *
  * It is needed to decode a trapped instruction: the encodings which 
exist only
  * for XLEN=64 must not be recognized for a 32-bit guest. Besides those 
simply
  * being reserved there, the compressed ones are ambiguous: C.LD and C.FLW
  * share the encoding 0x6000 (mask 0xe003), and likewise C.SD/C.FSW,
  * C.LDSP/C.FLWSP and C.SDSP/C.FSWSP.
  *
  * IS_ENABLED() can't be used here as HSTATUS_VSXL is defined for
  * __riscv_xlen == 64 only, the field not existing on RV32 in the first 
place.
  */
static unsigned int guest_xlen(const struct cpu_user_regs *regs)
{
#ifdef CONFIG_RISCV_32
     return 32;
#else
     unsigned long xl = (regs->sstatus & SSTATUS_SPP)
                        ? MASK_EXTR(regs->hstatus, HSTATUS_VSXL)
                        : MASK_EXTR(csr_read(CSR_VSSTATUS), SSTATUS64_UXL);

     /* 1 encodes XLEN=32, 2 encodes XLEN=64. */
     return (xl == HSTATUS_VSXL_32) ? 32 : 64;
#endif
}

and then use it in emulate_store/load():

     unsigned int xlen = guest_xlen(regs);
     ...
     else if ( (xlen == 64) && ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) )
     {
         len = 4;
         is_unsigned = true;
     }
     ...
     else if ( (xlen == 64) && ((insn & INSN_MASK_C_LD) == 
INSN_MATCH_C_LD) )


> 
>> +    {
>> +        len = 4;
>> +        is_unsigned = true;
>> +    }
>> +#endif
>> +    else if ( (insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW )
>> +    {
>> +        len = 4;
>> +        insn = RVC_RS2S(insn) << SH_RD;
>> +    }
>> +    else if ( (insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
>> +              RV_X(insn, SH_RD, 5) )
>> +        len = 4;
>> +#ifndef CONFIG_RISCV_32
>> +    else if ( (insn & INSN_MASK_LD) == INSN_MATCH_LD )
>> +        len = 8;
>> +    else if ( (insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD )
>> +    {
>> +        len = 8;
>> +        insn = RVC_RS2S(insn) << SH_RD;
>> +    }
>> +    else if ( (insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
>> +              RV_X(insn, SH_RD, 5) )
>> +        len = 8;
>> +#endif
>> +    else
>> +        return -EOPNOTSUPP;
> 
> Because you don't permit F/D/Q for guests (yet), FL* and FS* aren't
> covered, I expect? 

At the moment, I wrote this function with handling of MMIO instruction 
in mind, which are at the moment ld and sd.

Even if to permit F/D/Q then do we really need to trap that 
instructions? Hypervisor could allow access to FPU to guest and then it 
will be just a question of context switch to properly save and restore FPU.

> I wonder how easy it is going to be to spot the places
> needing adjustment once support is to be added. Same perhaps for Zilsd in
> RV32 guests.

There is a message in handle_guest_page_fault():

     if ( rc )
         domain_crash(current->domain,
                      "%s: unable to handle faulted guest %s addr %#lx\n",
                      __func__,
                      (cause == CAUSE_LOAD_GUEST_PAGE_FAULT) ? "load" : 
"store",
                      addr);

Probably, it isn't enough and we could print here instruction (in hex) 
before return -EOPNOTSUPP.

Thanks.

~ Oleksii

