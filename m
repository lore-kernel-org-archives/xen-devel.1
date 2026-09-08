Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17497C79FA0
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 09:20:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411208.1641907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3rzu-0005B1-5C; Tue, 08 Sep 2026 09:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411208.1641907; Tue, 08 Sep 2026 09:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3rzu-0005Au-2G; Tue, 08 Sep 2026 09:20:10 +0000
Received: by outflank-mailman (input) for mailman id 1411208;
 Tue, 08 Sep 2026 09:20:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3rzt-0005Ao-0M
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 09:20:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3rzs-00BDnZ-D3
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 11:20:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fd33d-e002-0a2a0a5209dd-0a2a450ca638-18
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:20:08 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fd348-f479-0a2a450c0019-d155da2ec50c-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:20:08 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c259e5c22ffso348524266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 02:20:08 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2624eb1813sm453768766b.38.2026.09.08.02.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 02:20:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788859208; x=1789464008; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnCLKJ77mUMpT3mH8mFEo/V++A6Zz0zlernPGtB6I+w=;
        b=aa3gPBX6G0xDy9z13dEuxWx5jELM3ZfaVnHE1i0b/ZBHwOao8p+kcb1TAB3hUKM7mr
         eq2kz40+M/m9TtXpqCvmsQ+IBC6W5eb4eGAMpH9xjz8zEdYxqPQwahfYznuBlJOgm+J/
         RzZQlmrZCqFyLQyLrDGziNg3eqxvL0e0jUV4WhsLipDF3o4vyxIOzl1CAq28byXgipg6
         43dyJjB6bpni3Em+abbzBeOEB8FxAvtvsLa8H8Lm1X3YGm49TFQhhj9A3w01OEBr+X4d
         6MFkAs3ZtjOak8R2iQiDn5CSzgL+Wf5vy2pW6MatWeTCvN+CUHujA7T8gQoIRe4Pi9g3
         0xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859208; x=1789464008;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnCLKJ77mUMpT3mH8mFEo/V++A6Zz0zlernPGtB6I+w=;
        b=Vh03TTJT0ZT9m5xY7rpRBuoNrfcrmaBUMd1T3Mer5rftvRUTLdYY1fL/bZ4D11+p/Y
         PsOShn+3seklAa+7i3roqWpKu+Kz0seqiNfS554iaY+6XRG/+NhlAgi4ZW2TwbzO1QQ6
         j6doQ8+QrPUhA13mNo8ZzJL5fX2tV89WdMVsi2S5EBIWBhEglyZg9s/H2SkZpTiSL3ei
         tQSLOrs2KxF/0aZ4FbPh5zP8qjjxuF6GeL4OHlob/7+pITkvaCcgopan5jXVTtUQ3B8y
         XBloeoX/XlMvgLMfav5vlFhkolMVlz/29y5DevVik53ZZ0s0uj7hi+yHl6Yswe32RTYl
         GQZg==
X-Gm-Message-State: AFuF++nl95euuXOIBGBYjtVMO1b6IdAh9EPcVhyrWRFqsdqKj0Va8SUw
	YKxBSRR0OP/zGAFtWPl0JuI9hWMzIAHHOobMjJfzrwD3I5CBujdwEMPX
X-Gm-Gg: AYBFou0u77B3N/j5O9v5kgJPhMlGtESMWnKck6ANX3XmzdOojVg1116QFdSsJXfLra/
	nlY7lCcnouH+B4klXGjpvNuNa+jKoyp+BwiD3Qg//YVV7+kLXevthJYHa4mzwvT3oLzQ8MejNXW
	WGZvNe+5R6FrNAnkwpQMz2PRGxNMyt8sV38BmqsegdO1ZX7dzRAacTAX2j7+OPEGnV4oAFtqcYw
	7qaGOTfywLhGIx/5aCUXRrGQSu3UGD2uXJ5VIY2yU/CYHf64ZVvz5/z+846Sh/JSyLMyQVNybRC
	zB32Ldm86Y6/hypAQ6HnvL27fE6F0saCEAytkWgeV1WM7OI4vWK4J9J+Ik6kURjZQf3nXqae5ku
	TKFPHhrWGcNgYs1M1P8vD9cHe9TtKueaftuboBy2n85DMxtuz5iMNr7J+PUVEJ1B1ggUhGvCwMS
	BTfeHB2VAVYuz1EGiN6Ohg2UUfF4o/HWMYqx+Yij4CP9nXVga7RcthgKXbTYwK6vRKSWOmNNUEA
	37PE9+zPz7EDPKLotxPow==
X-Received: by 2002:a17:907:94c7:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c260cb54617mr1090264466b.23.1788859207724;
        Tue, 08 Sep 2026 02:20:07 -0700 (PDT)
Message-ID: <11432bb6-009c-4563-9339-ddfbed1b50dc@gmail.com>
Date: Tue, 8 Sep 2026 11:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/39] xen/riscv: extend exception tables with type and
 data fields
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
 <8aef9dfabe1d485abe4c48fd7499e09dbd8e0c27.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796633.8631fc262581453bbf619ec5b2062170.1a07c968185000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788796633.8631fc262581453bbf619ec5b2062170.1a07c968185000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788859208-52132A5B-15722E92/10/73395122804
X-purgate-type: spam
X-purgate-size: 12663



On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
>> Extend the RISC-V exception table format to include a type and
>> auxiliary data field.
>>
>> The existing format only supports simple fixups. Some use cases require
>> additional context from the fault (e.g. capturing trap information),
>> which cannot be expressed with the current EX_TYPE_FIXUP entries.
>>
>> Introduce a generic ASM_EXTABLE_RAW() helper to describe entries with a
>> handler type and associated data. Reimplement ASM_EXTABLE() in terms of
>> it using EX_TYPE_FIXUP for compatibility.
>>
>> Add EX_TYPE_TRAP_INFO to allow handlers to retrieve trap state
>> (sepc/scause/stval) and pass it to the fixup path. The data field is
>> used to encode which GPR contains a pointer to a struct trap_info.
>>
>> Provide ASM_EXTABLE_TRAP_INFO() as a convenience wrapper for this case.
>>
>> Also add gpr-num.h, providing symbolic GPR numbers for use in assembly
>> and inline asm. This is derived from Linux 6.16 with minor adjustments such
>> as using .irp instead of open-coding the same using a set of .equ.
>>
>> Update the exception handling code to dispatch based on the entry type.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/extable.c b/xen/arch/riscv/extable.c
>> index 5b89c4278c..6470198d01 100644
>> --- a/xen/arch/riscv/extable.c
>> +++ b/xen/arch/riscv/extable.c
>> @@ -6,8 +6,10 @@
>>   #include <xen/sort.h>
>>   #include <xen/virtual_region.h>
>>   
>> +#include <asm/csr.h>
>>   #include <asm/extable.h>
>>   #include <asm/processor.h>
>> +#include <asm/traps.h>
>>   
>>   #define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
>>   
>> @@ -32,6 +34,12 @@ static void __init cf_check swap_ex(void *a, void *b)
>>   
>>       x->fixup = y->fixup + delta;
>>       y->fixup = tmp.fixup - delta;
>> +
>> +    x->type = y->type;
>> +    y->type = tmp.type;
>> +
>> +    x->data = y->data;
>> +    y->data = tmp.data;
>>   }
>>   
>>   static int cf_check cmp_ex(const void *a, const void *b)
>> @@ -59,7 +67,49 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>       regs->sepc = ex_fixup(ex);
>>   }
>>   
>> -bool fixup_exception(struct cpu_user_regs *regs)
>> +#define CHECK_GPR_INDEX(num, name)                      \
>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, name)   \
>> +                 != (num) * sizeof(unsigned long));
>> +
>> +static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>> +                                  unsigned int num)
>> +{
>> +    /*
>> +     * The GPR number -> struct index mapping below relies on x0..x31 being
>> +     * laid out at the start of struct cpu_user_regs in architectural order,
>> +     * matching the register numbers GPR_LIST() hands to the assembler.
>> +     */
>> +    GPR_LIST(CHECK_GPR_INDEX)
>> +
>> +    ASSERT(num < 32);
>> +
>> +    return ((const unsigned long *)regs)[num];
>> +}
>> +
>> +#undef CHECK_GPR_INDEX
>> +
>> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
>> +                                 struct cpu_user_regs *regs,
>> +                                 unsigned long cause)
>> +{
>> +    struct trap_info *trap_info =
>> +        (struct trap_info *)regs_get_gpr(regs, ex->data);
>> +
>> +    BUG_ON(!trap_info);
>> +
>> +    /*
>> +     * Only stval still needs a CSR read: sepc and scause were already
>> +     * captured by the trap entry path and do_trap() respectively. Latch
>> +     * trap_info->sepc before regs->sepc is pointed at the fixup code.
>> +     */
>> +    trap_info->sepc = regs->sepc;
>> +    trap_info->scause = cause;
>> +    trap_info->stval = csr_read(CSR_STVAL);
>> +
>> +    regs->sepc = ex_fixup(ex);
>> +}
>> +
>> +bool fixup_exception(struct cpu_user_regs *regs, unsigned long cause)
>>   {
>>       unsigned long pc = regs->sepc;
>>       const struct virtual_region *region = find_text_region(pc);
>> @@ -77,7 +127,23 @@ bool fixup_exception(struct cpu_user_regs *regs)
>>       if ( !ex )
>>           return false;
>>   
>> -    ex_handler_fixup(ex, regs);
>> +    switch ( ex->type )
>> +    {
>> +    case EX_TYPE_FIXUP:
>> +        ex_handler_fixup(ex, regs);
>> +        break;
>> +
>> +    case EX_TYPE_TRAP_INFO:
>> +        ex_handler_trap_info(ex, regs, cause);
>> +        break;
>> +
>> +    default:
>> +        printk(XENLOG_ERR
>> +               "Unsupported exception table entry type %u for pc %#lx\n",
>> +               ex->type, pc);
>> +
>> +        return false;
>> +    }
>>   
>>       return true;
>>   }
>> diff --git a/xen/arch/riscv/include/asm/extable.h b/xen/arch/riscv/include/asm/extable.h
>> index c0128a9181..7378f86e7e 100644
>> --- a/xen/arch/riscv/include/asm/extable.h
>> +++ b/xen/arch/riscv/include/asm/extable.h
>> @@ -3,17 +3,24 @@
>>   #ifndef ASM__RISCV__ASM_EXTABLE_H
>>   #define ASM__RISCV__ASM_EXTABLE_H
>>   
>> +#include <asm/gpr-num.h>
>> +
>> +#define EX_TYPE_FIXUP       0
>> +#define EX_TYPE_TRAP_INFO   1
>> +
>>   #ifdef __ASSEMBLER__
>>   
>> -#define ASM_EXTABLE(insn, fixup) \
>> -    .pushsection .ex_table, "a"; \
>> -    .balign     4;               \
>> -    .word       (insn) - .;      \
>> -    .word       (fixup) - .;     \
>> +#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
>> +    .pushsection .ex_table, "a";                    \
>> +    .balign     4;                                  \
>> +    .word       (insn) - .;                         \
>> +    .word       (fixup) - .;                        \
>> +    .half       (type);                             \
>> +    .half       (data);                             \
>>       .popsection
>>   
>> -.macro asm_extable, insn, fixup
>> -    ASM_EXTABLE(\insn, \fixup)
>> +.macro _asm_extable, insn, fixup
>> +    ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
>>   .endm
>>   
>>   #else /* __ASSEMBLER__ */
>> @@ -23,20 +30,36 @@
>>   
>>   struct cpu_user_regs;
>>   
>> -#define ASM_EXTABLE(insn, fixup)      \
>> -    ".pushsection .ex_table, \"a\"\n" \
>> -    ".balign    4\n"                  \
>> -    ".word      (" #insn " - .)\n"    \
>> -    ".word      (" #fixup " - .)\n"   \
>> +#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
>> +    ".pushsection .ex_table, \"a\"\n"               \
>> +    ".balign    4\n"                                \
>> +    ".word      (" insn ") - .\n"                   \
>> +    ".word      (" fixup ") - .\n"                  \
>> +    ".half      (" type ")\n"                       \
>> +    ".half      (" data ")\n"                       \
>>       ".popsection\n"
>>   
>> +#define ASM_EXTABLE(insn, fixup)    \
>> +    ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_FIXUP), "0")
>> +
>> +#define EX_TRAP_INFO_REG(gpr)   \
>> +    "(.L_gpr_num_" #gpr ")"
>> +
>> +#define ASM_EXTABLE_TRAP_INFO(insn, fixup, data)                    \
>> +    DEFINE_ASM_GPR_NUMS                                             \
>> +    ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_TRAP_INFO),  \
>> +                    EX_TRAP_INFO_REG(data))
>> +
>>   /*
>> - * The exception table consists of pairs of relative offsets: the first
>> - * is the relative offset to an instruction that is allowed to fault,
>> - * and the second is the relative offset at which the program should
>> - * continue. No general-purpose registers are modified by the exception
>> - * handling mechanism itself, so it is up to the fixup code to handle
>> - * any necessary state cleanup.
>> + * Each exception table entry consists of two relative offsets and a
>> + * handler description: `insn` is the relative offset to an instruction
>> + * that is allowed to fault, `fixup` is the relative offset at which the
>> + * program should continue, `type` selects how the exception is handled
>> + * (EX_TYPE_*), and `data` holds auxiliary information for the handler
>> + * (e.g. for EX_TYPE_TRAP_INFO, the number of the GPR that contains a
>> + * pointer to a struct trap_info). No general-purpose registers are
>> + * modified by the exception handling mechanism itself, so it is up to
>> + * the fixup code to handle any necessary state cleanup.
>>    *
>>    * The exception table and fixup code live out of line with the main
>>    * instruction path. This means when everything is well, we don't even
>> @@ -45,14 +68,15 @@ struct cpu_user_regs;
>>    */
>>   struct exception_table_entry {
>>       int32_t insn, fixup;
>> +    uint16_t type, data;
>>   };
>>   
>>   extern struct exception_table_entry __start___ex_table[];
>>   extern struct exception_table_entry __stop___ex_table[];
>>   
>>   void sort_exception_tables(void);
>> -bool fixup_exception(struct cpu_user_regs *regs);
>> +bool fixup_exception(struct cpu_user_regs *regs, unsigned long cause);
>>   
>> -#endif /* __ASSEMBLY__ */
>> +#endif /* __ASSEMBLER__ */
>>   
>>   #endif /* ASM__RISCV__ASM_EXTABLE_H */
>> diff --git a/xen/arch/riscv/include/asm/gpr-num.h b/xen/arch/riscv/include/asm/gpr-num.h
>> new file mode 100644
>> index 0000000000..3b97a72e6c
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/gpr-num.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef RISCV_GPR_NUM_H
>> +#define RISCV_GPR_NUM_H
> Nit: commit message says this is derived from Linux 6.16. Other
> imported RISC-V headers here carry an in-file note (bitops.h: "Based on
> linux/arch/.../bitops.h") but this file doesn't.
>> +/*
>> + * GPRs by ABI name, together with their register number (x0 .. x31).
>> + *
>> + * This is the single source of truth for the mapping: it generates the
>> + * .L_gpr_num_<name> assembler symbols used to turn a register name emitted
>> + * by the compiler into a register number, and struct cpu_user_regs is
>> + * checked against it at build time (see regs_get_gpr()). Neither list can
>> + * therefore be changed without the other.
>> + */
>> +#define GPR_LIST(x)                                 \
>> +    x(0,  zero) x(1,  ra)  x(2,  sp)  x(3,  gp)     \
>> +    x(4,  tp)   x(5,  t0)  x(6,  t1)  x(7,  t2)     \
>> +    x(8,  s0)   x(9,  s1)  x(10, a0)  x(11, a1)     \
>> +    x(12, a2)   x(13, a3)  x(14, a4)  x(15, a5)     \
>> +    x(16, a6)   x(17, a7)  x(18, s2)  x(19, s3)     \
>> +    x(20, s4)   x(21, s5)  x(22, s6)  x(23, s7)     \
>> +    x(24, s8)   x(25, s9)  x(26, s10) x(27, s11)    \
>> +    x(28, t3)   x(29, t4)  x(30, t5)  x(31, t6)
>> +
>> +#ifdef __ASSEMBLER__
>> +
>> +#define GPR_NUM_EQU(num, name)  .equ .L_gpr_num_##name, num;
>> +GPR_LIST(GPR_NUM_EQU)
>> +#undef GPR_NUM_EQU
>> +
>> +#else /* __ASSEMBLER__ */
>> +
>> +#define GPR_NUM_EQU(num, name)  ".equ .L_gpr_num_" #name ", " #num "\n"
>> +#define DEFINE_ASM_GPR_NUMS     GPR_LIST(GPR_NUM_EQU)
>> +
>> +#endif /* __ASSEMBLER__ */
>> +
>> +#endif /* RISCV_GPR_NUM_H */
>> diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
>> index b1745c1071..e7b0f2321a 100644
>> --- a/xen/arch/riscv/include/asm/processor.h
>> +++ b/xen/arch/riscv/include/asm/processor.h
>> @@ -12,7 +12,19 @@
>>   
>>   #ifndef __ASSEMBLER__
>>   
>> -/* On stack VCPU state */
>> +/*
>> + * On stack VCPU state.
>> + *
>> + * x0..x31 must remain at the start of this structure, in architectural
>> + * register-number order: code which resolves a register number to its saved
>> + * value indexes this structure directly (instruction emulation via
>> + * REG_PTR() from asm/riscv_encoding.h, exception table fixups via
>> + * regs_get_gpr()). ->zero therefore has to stay at offset 0 and must always
>> + * read as 0, since it supplies the value of x0 when x0 is used as a source
>> + * operand. The layout is checked against GPR_LIST() at build time; see
>> + * regs_get_gpr() in extable.c. Do not reorder these fields or insert
>> + * anything between them.
>> + */
>>   {
>>       unsigned long zero;
> Comment claims ->zero "must always read as 0" as it's hard-wired to zero
> by the HW, but nothing enforces that, it's still a plain writable
> unsigned long. Maybe a write-side counterpart that special-cases num==0
> as a no-op, or with a minimum ASSERT(num != 0) / BUG_ON(num == 0) to
> anticipate any future forbidden writes.
> 

Could you please clarify where do you want me to put this check in this 
patch? In regs_get_gpr()? There is no write-side in this patch. Am i 
missing something?


Thanks in advance.

~ Oleksii


