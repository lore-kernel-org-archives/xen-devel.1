Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B524EC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 16:27:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412284.1642826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3yeu-0005yz-Pv; Tue, 08 Sep 2026 16:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412284.1642826; Tue, 08 Sep 2026 16:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3yeu-0005ys-NG; Tue, 08 Sep 2026 16:26:56 +0000
Received: by outflank-mailman (input) for mailman id 1412284;
 Tue, 08 Sep 2026 16:26:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3yet-0005ym-Di
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 16:26:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3yes-00H8cn-6p
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 18:26:54 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a081d7fd55000c4f3@swg.vates.tech>)
 id 6aa0374e-bab6-0a2a0a5309dd-0a2a45088f14-0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 18:26:54 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a081d7fd55000c4f3@swg.vates.tech>)
 id 6aa0374d-f659-0a2a45080019-b9ff1c228025-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 18:26:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a081d7fd55000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 08 Sep 2026 16:26:51 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4A75281F1A;
 Tue,  8 Sep 2026 18:26:50 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=BNooUJFj17vn28id/72MdZJ4fzxtNpDNa+NRhcUCBbw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=RsVyBJt9IFo+hbEfjVJNGOBsNJSxj7li1347PjjBy9buA2hxyr6VVYHaN3d4jpGCbSA9R0gkz
 mhqOPg8jMqWSGtOgUbHP6jRlCWiZcd6X8S1V1Q1YM7FHO7x4h+5mgE2btoDjKl3cJQHH3FXNg6v
 P7JMSl2dqtT3jUZy3O6oA8Cg93PXQMIJmjBC3M2oYTbz9U4lVkN/06hSp5xTE5XkFVgRAaiWoEW
 mYknxCgYuQeDUgI9zUBJRbH19AvPl00Vu4EYKg5SUnNCL7F2rgaEU9HSoBXsAsVkNJy914a1nwF
 CZ8kn6J+2pgk9hKHWdyMHI8jt5qlqVycRcsmD74FUPfQ==
X-Zone-Loop: abd2896f67ed2cc50327b62c8baec90b322af8521612
x-campaign-type: default
x-transaction-id: ee76e8a8-0e35-44ba-8341-3f5de6c70e60
x-swg-uid: 01-fa1edfc4-1213-4681-9b1c-bc1324a11eb0
X-Mailer: Sweego
Message-ID:
 <1788884811.8631fc262581453bbf619ec5b2062170.1a081d7fd55000c4f3@vates.tech>
x-swg-bid: 1788884811.8631fc262581453bbf619ec5b2062170.1a081d7fd55000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 16/39] xen/riscv: extend exception tables with type
 and data fields
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <11432bb6-009c-4563-9339-ddfbed1b50dc@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8aef9dfabe1d485abe4c48fd7499e09dbd8e0c27.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796633.8631fc262581453bbf619ec5b2062170.1a07c968185000c4f3@vates.tech>
 <11432bb6-009c-4563-9339-ddfbed1b50dc@gmail.com>
Date: Tue, 08 Sep 2026 18:26:44 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788884810; l=14056;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=gNReYr2HTUbjitpcHBdI2MNLWZe1QxeVTIFDsCQ5eac=;
 b=kmQDj47enyE5Ma98pLvrKna06kW3IxR/U9FmRJOaE0TUoBI0Ws4EpD2ST+EL6UBAIJ/KHpwH4
 anZnr/B2FmeCjmCoa9NF1XwD5uI4Mf24dkz6Vy8E+g0ACB7l1B8O6Pg
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788884810515
X-purgate-ID: tlsNG-c1860d/1788884814-D795A87B-C1DC85C3/10/73395122804
X-purgate-type: spam
X-purgate-size: 14060

On 2026-09-08 11:19 +0200, Oleksii Kurochko wrote:
> 
> 
> On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
> >> Extend the RISC-V exception table format to include a type and
> >> auxiliary data field.
> >>
> >> The existing format only supports simple fixups. Some use cases require
> >> additional context from the fault (e.g. capturing trap information),
> >> which cannot be expressed with the current EX_TYPE_FIXUP entries.
> >>
> >> Introduce a generic ASM_EXTABLE_RAW() helper to describe entries with a
> >> handler type and associated data. Reimplement ASM_EXTABLE() in terms of
> >> it using EX_TYPE_FIXUP for compatibility.
> >>
> >> Add EX_TYPE_TRAP_INFO to allow handlers to retrieve trap state
> >> (sepc/scause/stval) and pass it to the fixup path. The data field is
> >> used to encode which GPR contains a pointer to a struct trap_info.
> >>
> >> Provide ASM_EXTABLE_TRAP_INFO() as a convenience wrapper for this case.
> >>
> >> Also add gpr-num.h, providing symbolic GPR numbers for use in assembly
> >> and inline asm. This is derived from Linux 6.16 with minor adjustments such
> >> as using .irp instead of open-coding the same using a set of .equ.
> >>
> >> Update the exception handling code to dispatch based on the entry type.
> >>
> >> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>
> >> diff --git a/xen/arch/riscv/extable.c b/xen/arch/riscv/extable.c
> >> index 5b89c4278c..6470198d01 100644
> >> --- a/xen/arch/riscv/extable.c
> >> +++ b/xen/arch/riscv/extable.c
> >> @@ -6,8 +6,10 @@
> >>   #include <xen/sort.h>
> >>   #include <xen/virtual_region.h>
> >>   
> >> +#include <asm/csr.h>
> >>   #include <asm/extable.h>
> >>   #include <asm/processor.h>
> >> +#include <asm/traps.h>
> >>   
> >>   #define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
> >>   
> >> @@ -32,6 +34,12 @@ static void __init cf_check swap_ex(void *a, void *b)
> >>   
> >>       x->fixup = y->fixup + delta;
> >>       y->fixup = tmp.fixup - delta;
> >> +
> >> +    x->type = y->type;
> >> +    y->type = tmp.type;
> >> +
> >> +    x->data = y->data;
> >> +    y->data = tmp.data;
> >>   }
> >>   
> >>   static int cf_check cmp_ex(const void *a, const void *b)
> >> @@ -59,7 +67,49 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
> >>       regs->sepc = ex_fixup(ex);
> >>   }
> >>   
> >> -bool fixup_exception(struct cpu_user_regs *regs)
> >> +#define CHECK_GPR_INDEX(num, name)                      \
> >> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, name)   \
> >> +                 != (num) * sizeof(unsigned long));
> >> +
> >> +static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
> >> +                                  unsigned int num)
> >> +{
> >> +    /*
> >> +     * The GPR number -> struct index mapping below relies on x0..x31 being
> >> +     * laid out at the start of struct cpu_user_regs in architectural order,
> >> +     * matching the register numbers GPR_LIST() hands to the assembler.
> >> +     */
> >> +    GPR_LIST(CHECK_GPR_INDEX)
> >> +
> >> +    ASSERT(num < 32);
> >> +
> >> +    return ((const unsigned long *)regs)[num];
> >> +}
> >> +
> >> +#undef CHECK_GPR_INDEX
> >> +
> >> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
> >> +                                 struct cpu_user_regs *regs,
> >> +                                 unsigned long cause)
> >> +{
> >> +    struct trap_info *trap_info =
> >> +        (struct trap_info *)regs_get_gpr(regs, ex->data);
> >> +
> >> +    BUG_ON(!trap_info);
> >> +
> >> +    /*
> >> +     * Only stval still needs a CSR read: sepc and scause were already
> >> +     * captured by the trap entry path and do_trap() respectively. Latch
> >> +     * trap_info->sepc before regs->sepc is pointed at the fixup code.
> >> +     */
> >> +    trap_info->sepc = regs->sepc;
> >> +    trap_info->scause = cause;
> >> +    trap_info->stval = csr_read(CSR_STVAL);
> >> +
> >> +    regs->sepc = ex_fixup(ex);
> >> +}
> >> +
> >> +bool fixup_exception(struct cpu_user_regs *regs, unsigned long cause)
> >>   {
> >>       unsigned long pc = regs->sepc;
> >>       const struct virtual_region *region = find_text_region(pc);
> >> @@ -77,7 +127,23 @@ bool fixup_exception(struct cpu_user_regs *regs)
> >>       if ( !ex )
> >>           return false;
> >>   
> >> -    ex_handler_fixup(ex, regs);
> >> +    switch ( ex->type )
> >> +    {
> >> +    case EX_TYPE_FIXUP:
> >> +        ex_handler_fixup(ex, regs);
> >> +        break;
> >> +
> >> +    case EX_TYPE_TRAP_INFO:
> >> +        ex_handler_trap_info(ex, regs, cause);
> >> +        break;
> >> +
> >> +    default:
> >> +        printk(XENLOG_ERR
> >> +               "Unsupported exception table entry type %u for pc %#lx\n",
> >> +               ex->type, pc);
> >> +
> >> +        return false;
> >> +    }
> >>   
> >>       return true;
> >>   }
> >> diff --git a/xen/arch/riscv/include/asm/extable.h b/xen/arch/riscv/include/asm/extable.h
> >> index c0128a9181..7378f86e7e 100644
> >> --- a/xen/arch/riscv/include/asm/extable.h
> >> +++ b/xen/arch/riscv/include/asm/extable.h
> >> @@ -3,17 +3,24 @@
> >>   #ifndef ASM__RISCV__ASM_EXTABLE_H
> >>   #define ASM__RISCV__ASM_EXTABLE_H
> >>   
> >> +#include <asm/gpr-num.h>
> >> +
> >> +#define EX_TYPE_FIXUP       0
> >> +#define EX_TYPE_TRAP_INFO   1
> >> +
> >>   #ifdef __ASSEMBLER__
> >>   
> >> -#define ASM_EXTABLE(insn, fixup) \
> >> -    .pushsection .ex_table, "a"; \
> >> -    .balign     4;               \
> >> -    .word       (insn) - .;      \
> >> -    .word       (fixup) - .;     \
> >> +#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
> >> +    .pushsection .ex_table, "a";                    \
> >> +    .balign     4;                                  \
> >> +    .word       (insn) - .;                         \
> >> +    .word       (fixup) - .;                        \
> >> +    .half       (type);                             \
> >> +    .half       (data);                             \
> >>       .popsection
> >>   
> >> -.macro asm_extable, insn, fixup
> >> -    ASM_EXTABLE(\insn, \fixup)
> >> +.macro _asm_extable, insn, fixup
> >> +    ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
> >>   .endm
> >>   
> >>   #else /* __ASSEMBLER__ */
> >> @@ -23,20 +30,36 @@
> >>   
> >>   struct cpu_user_regs;
> >>   
> >> -#define ASM_EXTABLE(insn, fixup)      \
> >> -    ".pushsection .ex_table, \"a\"\n" \
> >> -    ".balign    4\n"                  \
> >> -    ".word      (" #insn " - .)\n"    \
> >> -    ".word      (" #fixup " - .)\n"   \
> >> +#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
> >> +    ".pushsection .ex_table, \"a\"\n"               \
> >> +    ".balign    4\n"                                \
> >> +    ".word      (" insn ") - .\n"                   \
> >> +    ".word      (" fixup ") - .\n"                  \
> >> +    ".half      (" type ")\n"                       \
> >> +    ".half      (" data ")\n"                       \
> >>       ".popsection\n"
> >>   
> >> +#define ASM_EXTABLE(insn, fixup)    \
> >> +    ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_FIXUP), "0")
> >> +
> >> +#define EX_TRAP_INFO_REG(gpr)   \
> >> +    "(.L_gpr_num_" #gpr ")"
> >> +
> >> +#define ASM_EXTABLE_TRAP_INFO(insn, fixup, data)                    \
> >> +    DEFINE_ASM_GPR_NUMS                                             \
> >> +    ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_TRAP_INFO),  \
> >> +                    EX_TRAP_INFO_REG(data))
> >> +
> >>   /*
> >> - * The exception table consists of pairs of relative offsets: the first
> >> - * is the relative offset to an instruction that is allowed to fault,
> >> - * and the second is the relative offset at which the program should
> >> - * continue. No general-purpose registers are modified by the exception
> >> - * handling mechanism itself, so it is up to the fixup code to handle
> >> - * any necessary state cleanup.
> >> + * Each exception table entry consists of two relative offsets and a
> >> + * handler description: `insn` is the relative offset to an instruction
> >> + * that is allowed to fault, `fixup` is the relative offset at which the
> >> + * program should continue, `type` selects how the exception is handled
> >> + * (EX_TYPE_*), and `data` holds auxiliary information for the handler
> >> + * (e.g. for EX_TYPE_TRAP_INFO, the number of the GPR that contains a
> >> + * pointer to a struct trap_info). No general-purpose registers are
> >> + * modified by the exception handling mechanism itself, so it is up to
> >> + * the fixup code to handle any necessary state cleanup.
> >>    *
> >>    * The exception table and fixup code live out of line with the main
> >>    * instruction path. This means when everything is well, we don't even
> >> @@ -45,14 +68,15 @@ struct cpu_user_regs;
> >>    */
> >>   struct exception_table_entry {
> >>       int32_t insn, fixup;
> >> +    uint16_t type, data;
> >>   };
> >>   
> >>   extern struct exception_table_entry __start___ex_table[];
> >>   extern struct exception_table_entry __stop___ex_table[];
> >>   
> >>   void sort_exception_tables(void);
> >> -bool fixup_exception(struct cpu_user_regs *regs);
> >> +bool fixup_exception(struct cpu_user_regs *regs, unsigned long cause);
> >>   
> >> -#endif /* __ASSEMBLY__ */
> >> +#endif /* __ASSEMBLER__ */
> >>   
> >>   #endif /* ASM__RISCV__ASM_EXTABLE_H */
> >> diff --git a/xen/arch/riscv/include/asm/gpr-num.h b/xen/arch/riscv/include/asm/gpr-num.h
> >> new file mode 100644
> >> index 0000000000..3b97a72e6c
> >> --- /dev/null
> >> +++ b/xen/arch/riscv/include/asm/gpr-num.h
> >> @@ -0,0 +1,37 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +#ifndef RISCV_GPR_NUM_H
> >> +#define RISCV_GPR_NUM_H
> > Nit: commit message says this is derived from Linux 6.16. Other
> > imported RISC-V headers here carry an in-file note (bitops.h: "Based on
> > linux/arch/.../bitops.h") but this file doesn't.
> >> +/*
> >> + * GPRs by ABI name, together with their register number (x0 .. x31).
> >> + *
> >> + * This is the single source of truth for the mapping: it generates the
> >> + * .L_gpr_num_<name> assembler symbols used to turn a register name emitted
> >> + * by the compiler into a register number, and struct cpu_user_regs is
> >> + * checked against it at build time (see regs_get_gpr()). Neither list can
> >> + * therefore be changed without the other.
> >> + */
> >> +#define GPR_LIST(x)                                 \
> >> +    x(0,  zero) x(1,  ra)  x(2,  sp)  x(3,  gp)     \
> >> +    x(4,  tp)   x(5,  t0)  x(6,  t1)  x(7,  t2)     \
> >> +    x(8,  s0)   x(9,  s1)  x(10, a0)  x(11, a1)     \
> >> +    x(12, a2)   x(13, a3)  x(14, a4)  x(15, a5)     \
> >> +    x(16, a6)   x(17, a7)  x(18, s2)  x(19, s3)     \
> >> +    x(20, s4)   x(21, s5)  x(22, s6)  x(23, s7)     \
> >> +    x(24, s8)   x(25, s9)  x(26, s10) x(27, s11)    \
> >> +    x(28, t3)   x(29, t4)  x(30, t5)  x(31, t6)
> >> +
> >> +#ifdef __ASSEMBLER__
> >> +
> >> +#define GPR_NUM_EQU(num, name)  .equ .L_gpr_num_##name, num;
> >> +GPR_LIST(GPR_NUM_EQU)
> >> +#undef GPR_NUM_EQU
> >> +
> >> +#else /* __ASSEMBLER__ */
> >> +
> >> +#define GPR_NUM_EQU(num, name)  ".equ .L_gpr_num_" #name ", " #num "\n"
> >> +#define DEFINE_ASM_GPR_NUMS     GPR_LIST(GPR_NUM_EQU)
> >> +
> >> +#endif /* __ASSEMBLER__ */
> >> +
> >> +#endif /* RISCV_GPR_NUM_H */
> >> diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
> >> index b1745c1071..e7b0f2321a 100644
> >> --- a/xen/arch/riscv/include/asm/processor.h
> >> +++ b/xen/arch/riscv/include/asm/processor.h
> >> @@ -12,7 +12,19 @@
> >>   
> >>   #ifndef __ASSEMBLER__
> >>   
> >> -/* On stack VCPU state */
> >> +/*
> >> + * On stack VCPU state.
> >> + *
> >> + * x0..x31 must remain at the start of this structure, in architectural
> >> + * register-number order: code which resolves a register number to its saved
> >> + * value indexes this structure directly (instruction emulation via
> >> + * REG_PTR() from asm/riscv_encoding.h, exception table fixups via
> >> + * regs_get_gpr()). ->zero therefore has to stay at offset 0 and must always
> >> + * read as 0, since it supplies the value of x0 when x0 is used as a source
> >> + * operand. The layout is checked against GPR_LIST() at build time; see
> >> + * regs_get_gpr() in extable.c. Do not reorder these fields or insert
> >> + * anything between them.
> >> + */
> >>   {
> >>       unsigned long zero;
> > Comment claims ->zero "must always read as 0" as it's hard-wired to zero
> > by the HW, but nothing enforces that, it's still a plain writable
> > unsigned long. Maybe a write-side counterpart that special-cases num==0
> > as a no-op, or with a minimum ASSERT(num != 0) / BUG_ON(num == 0) to
> > anticipate any future forbidden writes.
> > 
> 
> Could you please clarify where do you want me to put this check in this 
> patch? In regs_get_gpr()? There is no write-side in this patch. Am i 
> missing something?

Honestly, I don't know where it would be most appropriate. But I'd like
to highlight that nothing strictly forbids Xen code from writing a value
!= 0 into regs->zero.

I saw that in emulate_load(), which is introduced later, you used a
branch to avoid an incorrect load into regs->zero:
    /*
    * A load into x0 discards its result: writing regs->zero would break
    * the invariant that it reads as zero when x0 is a source operand
    * elsewhere.
    */

One solution could be to make cpu_user_regs private and add get/set
methods, with a check in the setter that forbids this type of write, but
that would imply some big changes, so it may not be the appropriate fix.

> 
> 
> Thanks in advance.
> 
> ~ Oleksii
> 
> 
> 



