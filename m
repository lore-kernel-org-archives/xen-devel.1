Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9865AC88E6E
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 15:58:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421162.1647267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6941-0002vi-OB; Mon, 14 Sep 2026 15:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421162.1647267; Mon, 14 Sep 2026 15:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6941-0002vb-KG; Mon, 14 Sep 2026 15:57:49 +0000
Received: by outflank-mailman (input) for mailman id 1421162;
 Mon, 14 Sep 2026 15:57:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x6940-0002uP-El
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 15:57:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x693z-001pfl-Ki
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 17:57:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa81960-8faa-0a2a0a5109dd-0a2a450cc4ac-42
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:57:47 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa8197b-f479-0a2a450c0019-4a7de18ce8ba-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:57:47 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so11899285e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:57:47 -0700 (PDT)
Received: from ?IPV6:2a02:778:142:8f01:2700:bad4:284c:5aa5?
 ([2a02:778:142:8f01:2700:bad4:284c:5aa5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7d67de8asm2141425e9.12.2026.09.14.08.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 08:57:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789401467; x=1790006267; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBDqS46zgMxbjss1lWF0YOIwg7GNOYawwN+MAfvbfJM=;
        b=XWbjI7BWvEqK/MkgFOpx77p1W2IWkt+UkX6VLwbagiCsCXKLuKmcbsphnPuAeePtDq
         TPXV3CIU7QqVeEL+oPPU5rh6V0KS58gxmvyoSXMycuja5LfsD3cqDt0SLqTEhoi9CCpC
         vGJMGmb+wvlrxKhwE8rXBW/xdQzn4kyQBX/pghhij3lOZTF7m0hwewSnTONvzJ4nvQdQ
         i+TxemskfS5F53NhR+4FYtt5IrJxw0yx54AT6PzN8KiPHiyxOv0NSrWq59qeyvgNaVmz
         4+5K0eMvLzjGGa4PUDpCKediTkbk9lCxjzCxvw7NTTKiEBLMokUMkaogUOEN3kTlEyqB
         ZpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401467; x=1790006267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBDqS46zgMxbjss1lWF0YOIwg7GNOYawwN+MAfvbfJM=;
        b=I7giCTqlVjQigZAu6TTphFc86rZaVIOKmfCRGglWkKpiPDcNAzDbnzM6XUbgd1CvEJ
         DirRVTB6rPp11C8SNcPRhEtfQEZkNxY2BIv52MXBeAZN2R3xVXJ+yGR1+ioWUivXoGKZ
         osK86RuXWbIB/AoHj+JgSZbjoC9yEPsPX2fgrJrOrn98FJ1dDfF4KiOK7anOJCipFHKV
         qswH3lo7ZpDPHjBtyGLooAh7iVRrRocRkovrTX91JvmQpPHJ2/VVyrwCJy9BEpPIWlW3
         ZDWchCqtHLJrNSNocgYe/5ikMzCBLX51Pmg66SWJ94PCF/nRvM7TLCkoCkvGTyg1hSJ3
         X6uw==
X-Forwarded-Encrypted: i=1; AKwUvBwVijy188f7xd0XB3m94iX2EJ8HjGRcLxNNy3Hp2zpHXKqG9BoqGqbB8KkWTLUbyQzgQ/BzspVjB5c=@lists.xenproject.org
X-Gm-Message-State: AFuF++l20jQgpM7bPb+3UZN55KQhjpDURhCSYyln90uwuNCVMEsZgCf5
	MKTRgWmIHKIptGOf34bk0tOz8dWgTehBHNgobSpnSsbYY5+GuQ4LQbmJ
X-Gm-Gg: AYBFou0KeqjLDb97ReNWmIQtsih/KpRjZj6InH7pnwEqJO6FArm1Ob7c9NcO8h2cmyv
	/SWWJmEXgYlOwdosddqbgqKm4xym0the1nbbyPyCOTe2oYIFh4OTkb5CU3WCKdgjD70CjdrxQFB
	zhQi/7KbRZdCWkZN8N3j3OhIplWRss7AYNfaXt7WaYuZZcyMk9vF1RFPI4DZ4hmltjUPYcw5zKz
	C5HUpQTN+qyhT+kXX7XAHErIk8lwE9TIQyt31+PWrVzZ73RC+5OSUjbNWrXnwebBpq33wAoghlv
	tSxfXpL01wVxPJaZYIjcbjDT/3arCe7fCEs1j0ONbAxo6RYo3KlYz/9QEDMpvEXwJ5Ip0jp/8QO
	QxsC0WJoDPNXlW/sZQ+hqiVGvNARJgJsk3XW0wXV8uMhF8+O+aVWvkxcgj+b4Qo2On7z/4bBIgk
	3MNjAET8JCVVIYHFRyg6HwjYDy02iPven8jRlkR3WuxCNspCt7sESoxrXyEdMbJqyET8bvWwLNL
	cM87kVA/Oj9MUKRymxiuTFk7GJ1BFmoLhyj7zAeBvydGv/iJm82qvhCx8dujIEuuQ==
X-Received: by 2002:a05:600c:8012:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49e7a67c769mr41079025e9.31.1789401466652;
        Mon, 14 Sep 2026 08:57:46 -0700 (PDT)
Message-ID: <62a6884d-f2dc-46d9-ba5d-0dc4949ba25f@gmail.com>
Date: Mon, 14 Sep 2026 17:57:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/39] xen/riscv: add helpers for decoding a trapped
 load or store
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
 <4c5361bda56e97f5338f4bc561498e018adbf618.1787838835.git.oleksii.kurochko@gmail.com>
 <895a427d-1adb-43cb-a2bb-e0e9d50791db@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <895a427d-1adb-43cb-a2bb-e0e9d50791db@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789401467-02ADCA5B-B46A7013/10/73395122804
X-purgate-type: spam
X-purgate-size: 21724



On 9/14/26 1:03 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> emulate_load() and emulate_store() will both need to obtain the
>> instruction which caused a guest MMIO trap, decode it, and locate the
>> register operand it names. Add what the two share, ahead of either of
>> them being implemented: struct decoded_insn, insn_fetch_faulted(),
>> decode_ldst_insn(), guest_xlen(), guest_gpr() and advance_pc().
>>
>> The mask/match chain is adapted from Linux's KVM RISC-V implementation.
>>
>> Nothing calls any of this yet, so tag the functions __maybe_unused to
>> keep the build going; the tags go away once emulate_load() and
>> emulate_store() gain their bodies later.
> 
> That'll be a lot of churn to drop those __maybe_unused again. As this
> is merely transient, did you consider putting
> 
>     (void)is_load_guest_page_fault;
> 
> etc in e.g. emulate_load()?

I think it could be really an option. I will rework in that way.

> 
>> @@ -13,9 +14,29 @@
>>   #include <asm/csr.h>
>>   #include <asm/current.h>
>>   #include <asm/emulate.h>
>> +#include <asm/guest_access.h>
>> +#include <asm/processor.h>
>>   #include <asm/riscv_encoding.h>
>>   #include <asm/traps.h>
>>   
>> +/*
>> + * Determine the trapped load or store instruction which caused a guest MMIO
>> + * trap.
>> + */
>> +struct decoded_insn {
>> +    /* The instruction itself, and its length in bytes. */
>> +    unsigned long insn;
>> +    unsigned int insn_len;
>> +    /* Width of the memory access, in bytes. */
>> +    unsigned int len;
>> +    /* Number of the register operand: rd for a load, rs2 for a store. */
>> +    unsigned int reg;
>> +    /* The access is a store rather than a load. */
>> +    bool is_write;
>> +    /* The load zero-extends its result rather than sign-extending it. */
>> +    bool is_unsigned;
>> +};
> 
> I wonder how efficient this is. With use of bitfield the size of this struct
> can likely be more than halved. With suitable choice of widths this may not
> even cause significantly worse generated code.
> 

We could compress the structure into 8 bytes:

struct decoded_insn {
     /*
      * The instruction itself: no ratified extension defines one wider than
      * 32 bits, and insn_fetch_faulted() rejects anything longer.
      */
     uint32_t insn;
     /* Length of the instruction in bytes: 2 or 4. */
     unsigned int insn_len:3;
     /* Width of the memory access, in bytes: 1, 2, 4 or 8. */
     unsigned int len:4;
     /* Number of the register operand: rd for a load, rs2 for a store. */
     unsigned int reg:5;
     /* The access is a store rather than a load. */
     bool is_write:1;
     /* The load zero-extends its result rather than sign-extending it. */
     bool is_unsigned:1;
};

> One thing in any event: Why would the insn field need to be wider than 32
> bits?

Initial idea was that htinst register is HSXLEN so here it will be nice 
to emphasize this.

But considering that read_guest() can read maximum 32-bit instructions 
and no ratified extension defines one wider than 32 bits, and 
insn_fetch_faulted() rejects anything longer then we could really use 
here uint32_t for insn + the comment will be useful:

struct decoded_insn {
     /*
      * The trapped instruction: as read from guest memory, or the 32-bit
      * equivalent the hardware transformed it into (see 
insn_fetch_faulted()).
      * None of the extensions exposed to guests has instructions wider than
      * 32 bits, and insn_fetch_faulted() rejects anything longer.
      */
     uint32_t insn;


> 
>> @@ -39,6 +60,71 @@ struct guest_fault {
>>       paddr_t gpa;
>>   };
>>   
>> +static bool is_load_guest_page_fault(unsigned long scause)
>> +{
>> +    return scause == CAUSE_LOAD_GUEST_PAGE_FAULT;
>> +}
> 
> With no "store" counterpart this may end up being a little fragile (at the
> use site(s)).

I will drop then function and just open-code where it is used.

> 
>> +/*
>> + * The effective XLEN of the guest at the point of the trap: hstatus.VSXL for a
>> + * trap taken from VS-mode, vsstatus.UXL for one taken from VU-mode.
>> + *
>> + * VSXL is consulted whichever mode the trap came from, as it also gives the
>> + * width of vsstatus itself: where VSXL says 32, that register has no UXL field
>> + * to consult and VU-mode is 32-bit as well, there being nothing to configure.
>> + *
>> + * It is needed to decode a trapped instruction: the encodings which exist only
>> + * for XLEN=64 must not be recognized for a 32-bit guest. Besides those simply
>> + * being reserved there, the compressed ones are ambiguous: C.LD and C.FLW
>> + * share the encoding 0x6000 (mask 0xe003), and likewise C.SD/C.FSW,
>> + * C.LDSP/C.FLWSP and C.SDSP/C.FSWSP.
>> + *
>> + * IS_ENABLED() can't be used here as HSTATUS_VSXL is defined for
>> + * __riscv_xlen == 64 only, the field not existing on RV32 in the first place.
>> + */
>> +static __maybe_unused unsigned int guest_xlen(const struct cpu_user_regs *regs)
>> +{
>> +#ifdef CONFIG_RISCV_32
>> +    return 32;
>> +#else
>> +    unsigned long xl = MASK_EXTR(regs->hstatus, HSTATUS_VSXL);
>> +
>> +    if ( (xl == XLEN_FIELD_64) && !(regs->sstatus & SSTATUS_SPP) )
> 
> How about xl > XLEN_FIELD_32 here, to be RV128-compatible?

good point. I'll apply.

> 
>> @@ -87,6 +173,250 @@ static void resolve_faulting_gpa(struct guest_fault *gf)
>>                 (htinst_is_pseudo(gf->htinst) ? 0 : (gf->stval & 3));
>>   }
>>   
>> +/*
>> + * Where the value of a decoded instruction's register operand is held.
>> + *
>> + * Relies on x0..x31 being laid out at the start of struct cpu_user_regs in
>> + * architectural register-number order; see the comment there.
>> + */
>> +static __maybe_unused unsigned long *guest_gpr(struct cpu_user_regs *regs,
>> +                                               unsigned int reg)
>> +{
>> +    ASSERT(reg < 32);
>> +
>> +    return REG_PTR(reg, 0, regs);
>> +}
> 
> For future callers of this: For 32-bit environments hardware guarantees
> upper halves of registers to be zero?

I think that no as according to the spec:

Whenever XLEN in any mode is set to a value less than the widest 
supported XLEN, all operations must ignore source operand register bits 
above the configured XLEN, and must sign-extend results to fill the 
entire widest supported XLEN in the destination register. Similarly, pc 
bits above XLEN are ignored, and when the pc is written, it is 
sign-extended to fill the widest supported XLEN.

I think we want to add the following to the comment above guest_gpr():

* The register is held at its full width, whatever the guest's XLEN is (see
  * guest_xlen()). Where XLEN is narrower, the bits above it are not 
guaranteed
  * to be zero, nor even a sign extension: hardware only ignores them in 
source
  * operands, so they may have been left there by more privileged code 
running
  * at a wider XLEN. Hence callers must not rely on those bits when 
reading a
  * value, and must sign-extend what they write from bit XLEN-1, as hardware
  * does for the result of an operation.


> 
>> +/*
>> + * Obtain the instruction which caused a guest MMIO trap, filling in
>> + * @di->insn and @di->insn_len. It either comes transformed in htinst, or has
>> + * to be fetched from guest memory.
>> + *
>> + * Returns true if the fetch faulted in turn; the resulting trap has then
>> + * already been redirected to the guest and there is nothing further for the
>> + * caller to do. Where it returns false, @di has been filled in and emulation
>> + * is to continue.
>> + */
>> +static bool __maybe_unused insn_fetch_faulted(const struct guest_fault *gf,
>> +                                              struct decoded_insn *di)
>> +{
>> +    unsigned long htinst = gf->htinst;
>> +
>> +    /*
>> +     * A pseudoinstruction says nothing about the instruction the guest was
>> +     * executing, and comes with a guest physical address which isn't the one
>> +     * that instruction accessed. handle_guest_page_fault() deals with such a
>> +     * fault on its own, so no emulation can ever start for one.
>> +     */
>> +    ASSERT(!htinst_is_pseudo(htinst));
>> +
>> +    if ( htinst & BIT(0, UL) )
>> +    {
>> +        /*
>> +         * Bit[0] == 1 implies trapped instruction value is
>> +         * transformed instruction or custom instruction.
>> +         *
>> +         * The transformation always yields the 32-bit format, with bits[1:0]
>> +         * holding a marker instead of the original opcode bits: bit[0] set to
>> +         * flag the transformation, bit[1] clear if the trapped instruction
>> +         * was a compressed one. Restoring the opcode bits makes the value the
>> +         * valid 32-bit encoding decode_ldst_insn() matches against. Its
>> +         * INSN_MASK_C_* cases exist for the branch below, where a compressed
>> +         * instruction is read from guest memory as is: a trapped one arrives
>> +         * here already expanded to its 32-bit equivalent, and the opcode bits
>> +         * just restored keep it from matching those cases anyway.
>> +         *
>> +         * The length then cannot come from the value anymore, only from
>> +         * bit[1]. And only a 16- or a 32-bit instruction is ever reported
>> +         * this way: the standard load and store instructions the hardware
>> +         * transforms are all of one of these two lengths, anything else comes
>> +         * as the zero special value handled below.
>> +         */
>> +        di->insn = htinst | INSN_16BIT_MASK;
>> +        di->insn_len = (htinst & BIT(1, UL)) ? 4 : 2;
> 
> Hmm, so ->insn_len doesn't describe ->insn, as suggested by the comment in
> the struct. That wants clarifying there.

Right, insn_len is the length of the trapped instruction in guest 
memory, which is what advance_pc() needs, whereas insn may hold its 
32-bit transformed equivalent. I'll clarify both comments in the struct.:

struct decoded_insn {
     /*
      * The trapped instruction: as read from guest memory, or the 32-bit
      * equivalent the hardware transformed it into (see 
insn_fetch_faulted()).
      * None of the extensions exposed to guests has instructions wider than
      * 32 bits, and insn_fetch_faulted() rejects anything longer.
      */
     uint32_t insn;
     /*
      * Length in bytes of the trapped instruction in guest memory: 2 or 4.
      * This need not be the length of the encoding in insn, as a compressed
      * instruction may have been transformed into its 32-bit equivalent.
      */
     unsigned int insn_len:3;


> 
>> +    }
>> +    else
>> +    {
>> +        const struct cpu_user_regs *regs = gf->regs;
>> +        struct trap_info utrap = {};
>> +
>> +        /*
>> +         * Bit[0] == 0 implies trapped instruction value is
>> +         * zero or special value. With the pseudoinstructions ruled out
>> +         * above, only zero is left: the instruction has to be read from
>> +         * guest memory.
>> +         */
>> +
>> +        di->insn = riscv_read_guest(regs->sepc, true, &utrap);
>> +        if ( utrap.scause )
>> +        {
>> +            /*
>> +             * If during getting of trapped instruction a fault happen in
>> +             * G-stage translation then CAUSE_LOAD_GUEST_PAGE_FAULT is
>> +             * generated. Such faults during this operation is considered as
>> +             * bus error.
>> +             */
>> +            if ( is_load_guest_page_fault(utrap.scause) )
>> +                utrap.scause = CAUSE_FETCH_ACCESS;
>> +
>> +            utrap.sepc = regs->sepc;
> 
> Couldn't this be part of the initializer of utrap? Or does read_guest()
> alter the field?

It can't: on a fault read_guest() overwrites it. The exception table 
fixup records the sepc of the nested trap, i.e. Xen's own PC at the 
faulting hlvx, while the trap is to be reported to the guest at its 
instruction. I'll add a comment saying so:

             /*
              * Not set in the initializer: on a fault read_guest() 
leaves in
              * utrap.sepc the address of its own faulting access, 
whereas the
              * trap is to be reported at the guest instruction.
              */
             utrap.sepc = regs->sepc;


> 
>> +            trap_redirect(&utrap);
>> +
>> +            return true;
>> +        }
>> +
>> +        /*
>> +         * riscv_read_guest() fetches at most two halfwords, so a wider
>> +         * encoding has been read in part only and cannot be decoded here.
>> +         *
>> +         * Report an illegal instruction, which is what the guest would have
>> +         * got for such an encoding anyway: the ISA defines no instruction
>> +         * wider than 32 bits.
>> +         */
> 
> Such wording is at risk of going stale. Better say that no guest-exposed
> extensions have wider than 32-bit insns.

I will re-word in the following way:

         /*
          * read_guest() fetches at most two halfwords, so a wider 
encoding has
          * been read in part only and cannot be decoded here.
          *
          * Report an illegal instruction: none of the extensions exposed to
          * guests has instructions wider than 32 bits, so such an 
encoding is
          * not a valid instruction for the guest in the first place.
          */


> 
>> +        if ( !INSN_IS_16BIT(di->insn) && !INSN_IS_32BIT(di->insn) )
>> +        {
>> +            utrap.sepc = regs->sepc;
> 
> With the earlier remark this may then also not be needed here.
> 
>> +            utrap.scause = CAUSE_ILLEGAL_INSTRUCTION;
>> +            /*
>> +             * stval is left zero: the spec allows that for an illegal
>> +             * instruction, and only part of the instruction is in hand.
>> +             */
> 
> Not just this - stval may also not be wide enough to hold the full insn.

Right, I'll mention that as well:

             /*
              * stval is left zero, which the spec allows for an illegal
              * instruction: only part of the instruction is in hand, 
and stval,
              * being only XLEN bits wide, may not be able to hold all of it
              * anyway.
              */


> 
>> +            trap_redirect(&utrap);
>> +
>> +            return true;
>> +        }
>> +
>> +        di->insn_len = INSN_LEN(di->insn);
> 
> If you moved this up a little, you could avoid the separate use of
> INSN_{32,64}BIT_MASK above, by going from the value calculated here.
> 

I will do in this way as INSN_LEN() will (after a conversation in 
another thread) return zero if insn is something not 16 or 32:

         di->insn_len = INSN_LEN(di->insn);
...
         if ( !di->insn_len )

>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +/*
>> + * Decode the load or store instruction fetched into @di, filling in the
>> + * remaining fields of it (@di->insn and @di->insn_len are filled by
>> + * insn_fetch_faulted()).
>> + *
>> + * @xlen is the effective XLEN of the guest, needed as
>> + * the encodings which exist for XLEN=64 only must not be recognized for a
>> + * 32-bit guest.
>> + *
>> + * Returns false if the instruction is not a load or store which can be
>> + * emulated here.
>> + */
>> +static __maybe_unused bool decode_ldst_insn(struct decoded_insn *di,
>> +                                            unsigned int xlen)
>> +{
>> +    unsigned long insn = di->insn;
>> +    /* Register fields of the uncompressed forms ... */
>> +    unsigned int rd = RV_RD(insn);
>> +    unsigned int rs2 = RV_RS2(insn);
>> +    /*
>> +     * ... and of the compressed ones, where the 3-bit field selects one of
>> +     * x8..x15, while the stack-pointer-relative forms have a full-width one.
>> +     */
>> +    unsigned int rs2s = RVC_RS2S(insn);
>> +    unsigned int rs2c = RVC_RS2(insn);
>> +
>> +    di->is_write = false;
>> +    di->is_unsigned = false;
> 
> Elsewhere we established that the whole struct has to start out zeroed.
> Why not leverage that also here?

The callers don't actually zero it at present: di is declared without an 
initializer in both emulate_load() and emulate_store(), which is why 
these two fields get reset here. But I agree that's the better way: I'll 
have both callers initialize di with {} and drop the resets, stating in 
the comment that @di is expected to start out zeroed:

"
... insn_fetch_faulted()). Fields which don't apply to the instruction 
are left
  * alone, so @di is expected to start out zeroed.
"


> 
>> +    di->reg = rd;
>> +
>> +    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
>> +        di->len = 1;
>> +    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
>> +    {
>> +        di->len = 1;
>> +        di->is_unsigned = true;
>> +    }
>> +    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
>> +        di->len = 2;
>> +    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
>> +    {
>> +        di->len = 2;
>> +        di->is_unsigned = true;
>> +    }
>> +    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
>> +        di->len = 4;
>> +    else if ( xlen == 64 && (insn & INSN_MASK_LWU) == INSN_MATCH_LWU )
>> +    {
>> +        di->len = 4;
>> +        di->is_unsigned = true;
>> +    }
>> +    else if ( (insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW )
>> +    {
>> +        di->len = 4;
>> +        di->reg = rs2s;
>> +    }
> 
> These insns encode the access width uniformly, i.e. doing things the
> way done above is rather inefficient.

I think that I don't know how to do that better at the moment.

It could be less of if/else if to do in this way:

static bool decode_ldst_insn(struct decoded_insn *di, unsigned int xlen)
{
     uint32_t insn = di->insn;
     unsigned int funct3, width_log2;

     if ( INSN_IS_16BIT(insn) )
     {
         /*
          * C.LW, C.LD, C.SW and C.SD (bits[1:0] == 00), and their 
sp-relative
          * C.*SP forms (bits[1:0] == 10), have bits[15:13] of the form x1y:
          * x is set for a store, and y selects a width of 4 or 8 bytes.
          */
         funct3 = RV_X(insn, 13, 3);

         if ( (insn & 1) || !(funct3 & 2) )
             return false;

         di->is_write = funct3 & 4;
         width_log2 = 2 + (funct3 & 1);

         if ( !(insn & 2) )
             di->reg = RVC_RS2S(insn);
         else if ( di->is_write )
             di->reg = RVC_RS2(insn);
         else
         {
             di->reg = RV_RD(insn);
             /* C.LWSP and C.LDSP are reserved with rd being x0. */
             if ( !di->reg )
                 return false;
         }
     }
     else
     {
         /*
          * funct3[1:0] is log2 of the width in bytes, and funct3[2] selects
          * zero-extension for a load, while being reserved for a store.
          */
         funct3 = RV_X(insn, 12, 3);
         width_log2 = funct3 & 3;

         switch ( insn & INSN_OPCODE_MASK )
         {
         case INSN_OPCODE_LOAD:
             di->is_unsigned = funct3 & 4;
             di->reg = RV_RD(insn);
             break;

         case INSN_OPCODE_STORE:
             if ( funct3 & 4 )
                 return false;
             di->is_write = true;
             di->reg = RV_RS2(insn);
             break;

         default:
             return false;
         }
     }

     di->len = 1U << width_log2;

     /*
      * No access is wider than XLEN, and one as wide as XLEN exists only in
      * its sign-extending form: this rules out the encodings which 
exist for
      * XLEN=64 only on a 32-bit guest, including C.FLW for C.LD (and 
alike).
      */
     if ( (di->len * BITS_PER_BYTE > xlen) ||
          (di->is_unsigned && di->len * BITS_PER_BYTE == xlen) )
         return false;

     return true;


     return true;
}

But I am not sure this is what you meant.

> 
>> +    /* c.lwsp and c.ldsp are reserved with rd being x0. */
>> +    else if ( (insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP && rd )
>> +        di->len = 4;
> 
> Careful with insns not part of the base ISA: Between the trap and you
> getting to fetch and decode, the in-memory insn may have changed. You
> posibly set yourself up for vulnerabilities if you permit C encodings
> for guests not having C exposed to them.

I think then it will be better to reject it duing instruction fetch in 
insn_fetch_faulted():

         di->insn_len = INSN_LEN(di->insn);

         /*
          * read_guest() fetches at most two halfwords, so a wider 
encoding has
          * been read in part only and cannot be decoded here.
          *
          * Report an illegal instruction: none of the extensions exposed to
          * guests has instructions wider than 32 bits, so such an 
encoding is
          * not a valid instruction for the guest in the first place. 
The same
          * goes for a compressed encoding where C isn't exposed to the 
guest:
          * the instruction in memory may have been changed since the 
trap, so
          * what is read back must not be taken to be what trapped.
          */
         if ( !di->insn_len ||
              (di->insn_len == 2 &&
               !riscv_isa_extension_available(current->domain->arch.isa,
                                              RISCV_ISA_EXT_c)) )
         {
             ...

Would it be better?

Thanks.

~ Oleksii


