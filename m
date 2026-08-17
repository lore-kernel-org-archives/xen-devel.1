Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072C0C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 11:33:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392850.1631815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvaS-0008HV-JU; Mon, 17 Aug 2026 11:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392850.1631815; Mon, 17 Aug 2026 11:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvaS-0008HO-Gq; Mon, 17 Aug 2026 11:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1392850;
 Mon, 17 Aug 2026 11:33:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wvvaR-0008HI-Nk
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:33:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvvaR-008LEW-4C
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 13:33:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82f162-2eae-0a2a0a5409dd-0a2a45099a84-8
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:33:03 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82f16e-be1a-0a2a45090019-d155dd33ada1-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:33:03 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47fe377a217so2194792f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 04:33:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b7cd38sm3623402f8f.32.2026.08.17.04.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 04:33:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786966382; x=1787571182; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5E/dpWHVWMicXfmC4k6Vyuy2D8lsuqK70W0AlsfajI=;
        b=fZIQrEDykI87JG9uDNlkMA5AVLUh2pnF+tAmwqr8+tVB38AQM1Vf4GrX830mJFrbnk
         gPRdNzoYua1Avc/DtudRN1fFnsGGzMr3PgEjsi3eLZ4QQw9Fx2CvWs116qRpGZ+faYvk
         E8cPLXc2dC+TkCnkOuScFrHhr9vt1KLHp4ZVMr1lRA9/9iITSloN6DWG70zIqiFPUL62
         NXppzIFW7C5tLuldmInVajbscBjb5Ukgzo7YszKezxM66WcaZXPqvb2mIe346tZNhL2H
         g9OcTKZl0VsyeOczsMT4JfcVjwubii5nDstugxGDT8BpJbRRzFvqNCujNra/FSgnElIt
         6f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966382; x=1787571182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5E/dpWHVWMicXfmC4k6Vyuy2D8lsuqK70W0AlsfajI=;
        b=ewTnFHm4itWL6qXz/bKuVkIzkIQCQRaQ02pGulzAcL3GtLagqWtCzIQcUlkQVYqDrx
         X8QEHj8Th19PHCG62Di+8SUBPXVAl9KCCvbasOOa0PYtKUgfn8kFWlbHHVOzKY6r2/SJ
         4+yn3nuAGIl68HqOTp/FDK/yMSwIaUbL4OOgb0/gJg3TAqZPlhas4U2QLFzlxZfLkbrp
         lUM3xUAqmRSs5i64cGJA80RjCcDPk4SGXHc5DDm7UG2MtJaXFVMifpZXREw/GWLPzdSf
         VHb0lDWUUPG81HdaAyJ5Ga6rBJEncB0+X30rtfb5HEhPCj328VeH0GfYiSlBbFPN/tpk
         bgnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqELttJqVvko863SXccC3y/kg107HxGyCs6FkeIQLfL0pSd1uZ7SwhIblWPcokdc5LL6wJYbvZu0kw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlGlsBUiqpbwHnalUjTNkEDGN2utuJLg5QIHCALA9RkDs5ooZK
	7qGms5/YzT48MaKeTCFK1ab0SmIG1q/+lK9kAWEN0CdVExiCtyWFJES+p10j1w==
X-Gm-Gg: AR+sD13DZQUgAjUu2b1jwFJmgiQ4JHGAlUr5XL4lB6a+opjaLrC4Eu5CBIKJVvOnvGl
	9nDO/iop5397gIzEXwb75z9ZYCsPGcWqz3gXcolrmQMymUCc9tqOtT4v/BsvwxhRADb3Eby9nDP
	4AipzKahSaZyOClxceQ+huSPciDUw44fGA2XJsVkUfYAf+LykpUEgRQf4R8H/PJPP4gJrp9ehuc
	4PAsEEfe4VVHWxw3+gOD2lO6lYOpDJOVym/i3Zt3UaZTdE6P/5+XpwwryfZC9P4T6b379perRsx
	s3NJgIQRTHAxsPBe5wC+TbcjnF+6Wr5Kq7/VJFVwZgwrqIOvYPlkN+u6V7+f1drzvB2j5muXRiO
	EcVhcusIZDbBQpCpPc7qr76OIpecwsQvaPiUW4Yz3hY+yRneoMz49GLyKy95umnjdrdD/IWVBjx
	sq+v+99ZgE1OSO7v8XPEG7+vkUbk6NWRpYllA8uLhyssq5F883+cK8vpitNuY0fuEivWBAFZ0mD
	jo/KbhX97OJ/0JlCjrf9UR9noMijHTN0tCrDiNQAWsVsGKzv7q5Isg=
X-Received: by 2002:a05:6000:288d:b0:481:5bce:44b3 with SMTP id ffacd0b85a97d-481607708femr34679018f8f.16.1786966382286;
        Mon, 17 Aug 2026 04:33:02 -0700 (PDT)
Message-ID: <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
Date: Mon, 17 Aug 2026 13:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/17] xen/riscv: extend exception tables with type and
 data fields
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <1eb9050ff6632f91682151471440990bd718ed90.1784560663.git.oleksii.kurochko@gmail.com>
 <be932384-6661-4c92-9137-8f6a9cd54057@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <be932384-6661-4c92-9137-8f6a9cd54057@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1786966383-FCC15034-400428E6/10/73395122804
X-purgate-type: spam
X-purgate-size: 6305



On 8/12/26 4:37 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> @@ -60,6 +68,40 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>       regs->sepc = ex_fixup(ex);
>>   }
>>   
>> +static inline unsigned long regs_get_gpr(struct cpu_user_regs *regs,
>> +                                         unsigned int offset)
>> +{
>> +    /*
>> +     * The GPR number -> offset arithmetic below relies on x0..x31 being
>> +     * laid out at the start of struct cpu_user_regs in architectural
>> +     * order.
>> +     */
>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) !=
>> +                 sizeof(unsigned long));
>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) !=
>> +                 31 * sizeof(unsigned long));
>> +
>> +    if ( unlikely(!offset || (offset > MAX_REG_OFFSET)) )
>> +        return 0;
> 
> And an offset not divisible by sizeof(unsigned long) is okay?

No, it isn't okay. I will apply your comment ...

> 
> Returning 0 as error indicator also feels fragile.

With what I suggested below returning could be just dropped.

> 
>> +    return *(unsigned long *)((unsigned long)regs + offset);
>> +}
>> +
>> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
>> +                                 struct cpu_user_regs *regs)
>> +{
>> +    struct trap_info *trap_info =
>> +        (struct trap_info *)regs_get_gpr(regs, ex->data * sizeof(unsigned long));
> 
> Related to the earlier comment: Simply pass just ex->data here, leaving the
> multiplication to regs_get_gpr()?

... It would be better to move the multiplication inside regs_get_gpr().

Your comment made me think about whether the multiplication is needed at 
all (regardless of where it is done). In other words, ex->data contains 
the register number, so we could just write:

static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
                                   unsigned int num)
{
     /*
      * The GPR number -> offset arithmetic below relies on x0..x31 being
      * laid out at the start of struct cpu_user_regs in architectural 
order.
      */
     BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) != sizeof(unsigned 
long));
     BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) != 31 * 
sizeof(unsigned long));

     ASSERT(num && (num < 32));

     return ((const unsigned long *)regs)[num];
}

Probably, we want to consider this function out of context (for now 
context is that we use it to recieve a pointer to trap_info which can't 
be obviously stored in x0 as it should be always hardwired zero). In 
that case, there is no need to check that num is 0.

So, it probably makes sense to just have:
   ASSERT(num < 32);

ASSERT() is fine here as I don't think that compiler will use incorrect 
number during register allocation.
> 
>> +    BUG_ON(!trap_info);
>> +
>> +    trap_info->sepc = csr_read(CSR_SEPC);
>> +    trap_info->scause = csr_read(CSR_SCAUSE);
>> +    trap_info->stval = csr_read(CSR_STVAL);
> 
> Do you really need to re-read all three registers here? Didn't you read at least
> scause already, in order to make it here in the first place?

Agree, ->scause and ->sepc are already read.


> 
>> --- a/xen/arch/riscv/include/asm/extable.h
>> +++ b/xen/arch/riscv/include/asm/extable.h
>> @@ -3,17 +3,24 @@
>>   #ifndef ASM__RISCV__ASM_EXTABLE_H
>>   #define ASM__RISCV__ASM_EXTABLE_H
>>   
>> +#include <asm/gpr-num.h>
>> +
>> +#define EX_TYPE_FIXUP 0
>> +#define EX_TYPE_TRAP_INFO 1
>> +
>>   #ifdef __ASSEMBLER__
>>   
>> -#define ASM_EXTABLE(insn, fixup) \
>> -    .pushsection .ex_table, "a"; \
>> -    .balign     4;               \
>> -    .word       (insn) - .;      \
>> -    .word       (fixup) - .;     \
>> -    .popsection
>> +#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
>> +    .pushsection .ex_table, "a";                    \
>> +    .balign     4;                                  \
>> +    .long       ((insn) - .);                       \
>> +    .long       ((fixup) - .);                      \
> 
> Why the change from .word to .long? And why the extra pairs of parens?

I don't see any sense now in changing type and of extra pairs of parens.
This part of changes will be reverted.

> 
>> +    .short      (type);                             \
>> +    .short      (data);                             \
> 
> Alongside .word, these then likely want to be .half.

.half will be better if .word is used.

> 
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
>> +    ".long      ((" insn ") - .)\n"                 \
>> +    ".long      ((" fixup ") - .)\n"                \
> 
> Same questions here then.

I will revert these changes too.

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/gpr-num.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef RISCV_GPR_NUM_H
>> +#define RISCV_GPR_NUM_H
>> +
>> +/* GPR ABI names, in register-number order (x0 .. x31). */
>> +#define GPR_ABI_NAMES                   \
>> +    zero, ra, sp, gp, tp, t0, t1, t2,   \
>> +    s0, s1, a0, a1, a2, a3, a4, a5,     \
>> +    a6, a7, s2, s3, s4, s5, s6, s7,     \
>> +    s8, s9, s10, s11, t3, t4, t5, t6
>> +
>> +#ifdef __ASSEMBLER__
>> +
>> +    .equ    .L_gpr_num, 0
>> +    .irp    name, GPR_ABI_NAMES
>> +    .equ    .L_gpr_num_\name, .L_gpr_num
>> +    .equ    .L_gpr_num, .L_gpr_num + 1
>> +    .endr
> 
> So this is emitted no matter whether a .S file actually uses any of the constants.
> Perhaps okayish, but somewhat wasteful.

I can move #include <asm/gpr-num.h> inside "#else /* __ASSEMBLER__ */" 
in asm/extable.h and it will be enough for now. Or just drop declaration 
of .L_gpr_num for assembler code until it will be needed by it.

~ Oleksii

