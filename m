Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D929C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 11:21:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412823.1643149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4GMY-0002lS-5v; Wed, 09 Sep 2026 11:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412823.1643149; Wed, 09 Sep 2026 11:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4GMY-0002lL-33; Wed, 09 Sep 2026 11:21:10 +0000
Received: by outflank-mailman (input) for mailman id 1412823;
 Wed, 09 Sep 2026 11:21:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4GMW-0002lF-IQ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 11:21:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4GMV-00D9N0-8V
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:21:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa14119-bab6-0a2a0a5309dd-0a2a450c9dd0-28
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 13:21:07 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa14123-f479-0a2a450c0019-d155da2fc55e-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 13:21:07 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c259e5c22ffso617151166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 04:21:07 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d5497cbsm758024566b.34.2026.09.09.04.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 04:21:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788952867; x=1789557667; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jD5KtwmlQplH54crfONcX5Td6/rkTj5zFBMiTo4IZDY=;
        b=MrkvjmDx8RTTdn3/J5z57vK7sWuUJLvCUBTqemTaUZumpsVE4JkkQLo8frjVhNZMQ2
         p8stFaF6UOKs7xpWPqhhBE4t9GxxhGEMz1oGL8ib6lpCXXHIVqn/Jw2zoi8B80CezmCf
         tANI9q3yfo0tVRxYMt2rFUNk+qJZBBMaq3BQFbo3uusFOSx0RW+WvmSD5KTlAIeju4gt
         eofp1PvrH/nfJlBXEthfhOUCzhWfo0akqY+iaWqEhIzJSZ5/iBkgYkk4sXdY9UB373e2
         VCrzFEwDsgDKv3DPOWEUr8mCQM0DuEZXwhwU9CHQqR90DesngnOwA1I32sQF3l6cv0b0
         hrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952867; x=1789557667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jD5KtwmlQplH54crfONcX5Td6/rkTj5zFBMiTo4IZDY=;
        b=E37WG1ehH/C+D7HsBgeO7M9X5RoSEdNssf7U4KJi6IJydMTtTNunBYwZjWaFfwFmRk
         kbyJ/8afCXKQhIA2MfcvGYiOcVVF3GVbi1kzIiUVoou5aErJG6qzdwNJ9XKYjiMypjES
         w1XqtJ+UFI0o8E9RQz3rg/mzYEt0Ukp1t5EcXpZPBXUjJuWslv9MbTN7UfOKftD+lAXs
         9tSWrJirvix0zwJSfG907ayWGGRWx7hjIH23fHYYXnac2a+X9J6VAz4uEZpllyZ5pNAP
         RMln/Xc6STaBOUH+kLpEojSzKgTBUqspHGhJ8snXmSvFgVQ2GV1zHfzqVN01AMJ++/yt
         Ycsg==
X-Forwarded-Encrypted: i=1; AKwUvBxM8dIgXGsnTdTaJ4rSIyGriU2I6OQ8X2hmITU3hM/TPvtVynVVi3XtwAw2ni5Ooz3zOJXkd0VkByc=@lists.xenproject.org
X-Gm-Message-State: AFuF++nnVFmcNqf4hYnbAHF8UUCfAy0zTgDoeCE2ZcB4Wi8VOci3/O3y
	fwuisB/yRqSM82O8RSRhbVa3ZUNynxT5M3Ki9cTGH1Po0AbE0GqFvYx2
X-Gm-Gg: AYBFou1Guydg+ItM5CpR0Z1F4vHoQPJrcWFM+/qDRu7dQpKf2MMAXWUBp2CGbQtfOH8
	HtPVR7kVqbcyvV30Ixyph/fYL145ztJuaTFH0hO325wtjWr9UHcYAW3R8IQWcpTbF6EC8xxQSST
	GwBwnQzTClVHSUTSopC4kdJHZse1YEmCRjzUR3AsdfTxvnKMI1balLMq8isUQjobJ3sMQEmQXuM
	DenE6qdvW/2GILwI61gZscQpLePp8eBnmWDSDhUSonaEisIt8WqwT1n5rpX7ZoX9XMOoRQ6znrH
	mJJy7Jc/3alQsLA7x/tsGCGtPushR3hAaYOZRqerx8GYaFT+JrcdV7Ik1BEoVACQ4faBbO24sc7
	l0ai+YBmdr3bHPqwFMh1Bhi5Vatkw8iYJNWEiOQYq9pMyZoWhEafdOFxNzwjiAQv1uS0R/ysW9C
	Gms/6bGPq71gOnNRDKNsinR1f1f2VzUtVVYx59jQh4RgicDepNS2iJ9BY5hXWi5ewALqnZ/YKAY
	VKFNucFMH2n4VX7dS+mhoMH27xbF8TwlqDHRA6fN4A=
X-Received: by 2002:a17:907:3f8b:b0:c28:e01d:1d10 with SMTP id a640c23a62f3a-c28e01d2ae8mr928314966b.49.1788952866479;
        Wed, 09 Sep 2026 04:21:06 -0700 (PDT)
Message-ID: <09c883b1-38fd-423c-b516-d39865729e18@gmail.com>
Date: Wed, 9 Sep 2026 13:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/39] xen/riscv: extend exception tables with type and
 data fields
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
 <8aef9dfabe1d485abe4c48fd7499e09dbd8e0c27.1787838835.git.oleksii.kurochko@gmail.com>
 <39841f44-2b18-4368-a9f8-7c0db307ff6d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <39841f44-2b18-4368-a9f8-7c0db307ff6d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788952867-008CDA5B-40046B79/10/73395122804
X-purgate-type: spam
X-purgate-size: 10616



On 9/8/26 3:44 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> @@ -59,7 +67,49 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>       regs->sepc = ex_fixup(ex);
>>   }
>>   
>> -bool fixup_exception(struct cpu_user_regs *regs)
>> +#define CHECK_GPR_INDEX(num, name)                      \
>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, name)   \
>> +                 != (num) * sizeof(unsigned long));
> 
> Nit: Placement of the !=. Also there should be no semicolon here; it wants
> to ...
> 
>> +static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>> +                                  unsigned int num)
>> +{
>> +    /*
>> +     * The GPR number -> struct index mapping below relies on x0..x31 being
>> +     * laid out at the start of struct cpu_user_regs in architectural order,
>> +     * matching the register numbers GPR_LIST() hands to the assembler.
>> +     */
>> +    GPR_LIST(CHECK_GPR_INDEX)
> 
> ... appear here instead, for this to actually look like a statement.

I will apply that.

> 
>> +    ASSERT(num < 32);
>> +
>> +    return ((const unsigned long *)regs)[num];
> 
> What about release builds? You'd happily overrun the array there. Maybe
> (ab)use array_index_nospec() here?

num is coming not from guest, not from calculation in runtume, it is 
generated by assembler at the build time. So it should be always correct.

So just having the following looks okay to me:

static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
                                   unsigned int num)
{
#define CHECK_GPR_INDEX(num, name) \
     BUILD_BUG_ON(offsetof(struct cpu_user_regs, name) != \
                  (num) * sizeof(unsigned long))

#define GPR_CASE(nr, name) case nr: return regs->name;

     /*
      * The GPR number -> struct index mapping below relies on x0..x31 being
      * laid out at the start of struct cpu_user_regs in architectural 
order,
      * matching the register numbers GPR_LIST() hands to the assembler.
      */
     GPR_LIST(CHECK_GPR_INDEX);

#undef CHECK_GPR_INDEX

     switch ( num )
     {
     GPR_LIST(GPR_CASE)
     }

#undef GPR_CASE

     ASSERT_UNREACHABLE();

     return 0;
}

Any thoughts on that regard?
  >> +}
>> +
>> +#undef CHECK_GPR_INDEX
> 
> If the sole use of the macro is in a single function, it wants #define-ing
> (and #undef-ing) there, not outside of it.
> 

I will move inside.

>> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
>> +                                 struct cpu_user_regs *regs,
>> +                                 unsigned long cause)
>> +{
>> +    struct trap_info *trap_info =
>> +        (struct trap_info *)regs_get_gpr(regs, ex->data);
>> +
>> +    BUG_ON(!trap_info);
> 
> This feels extremely weak. As you're fetching from a GPR, the majority of
> possible values stored in GPRs is going to be invalid, not just NULL. And
> while the accesses below would trap on NULL anyway, whether other bogus
> values would trap is pretty hard to predict. If trap_info is expected to
> always live on the stack, why not check for that (perhaps also check that
> the low few bits are clear)?
> 

Considering the nature if how trap_info is filled I think we could just 
drop BUG_ON(), it is guaranteed by compilation that trap_info will be 
correct.

I think it could be also hard to force trap_info be always allocated on 
the stack.

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
> 
> This doesn't need to be wrapped across lines, does it?

Oh, really, it could be one line.

> 
>> +#define ASM_EXTABLE_TRAP_INFO(insn, fixup, data)                    \
>> +    DEFINE_ASM_GPR_NUMS                                             \
>> +    ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_TRAP_INFO),  \
>> +                    EX_TRAP_INFO_REG(data))
> 
> There's no visible statement separator between DEFINE_ASM_GPR_NUMS and
> ASM_EXTABLE_RAW(), which only works because DEFINE_ASM_GPR_NUMS appends
> a separator also at the very end of its expansion. I think that better
> would be changed, such that at use sites such as this one a separator
> becomes mandatory.

I will do the following then:

  #define ASM_EXTABLE_TRAP_INFO(insn, fixup, data)                    \
-    DEFINE_ASM_GPR_NUMS                                             \
+    DEFINE_ASM_GPR_NUMS "\n"                                        \
      ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_TRAP_INFO),  \
                      EX_TRAP_INFO_REG(data))

diff --git a/xen/arch/riscv/include/asm/gpr-num.h 
b/xen/arch/riscv/include/asm/gpr-num.h
index 3b97a72e6c30..d497bd501e87 100644
--- a/xen/arch/riscv/include/asm/gpr-num.h
+++ b/xen/arch/riscv/include/asm/gpr-num.h
@@ -23,13 +23,19 @@

  #ifdef __ASSEMBLER__

-#define GPR_NUM_EQU(num, name)  .equ .L_gpr_num_##name, num;
+/*
+ * The separator is emitted ahead of each entry rather than after it, 
so that
+ * the expansion doesn't end with one: whatever follows a use of the 
list has
+ * to supply its own separator, instead of silently relying on a 
trailing one.
+ */
+#define GPR_NUM_EQU(num, name)  ; .equ .L_gpr_num_##name, num
  GPR_LIST(GPR_NUM_EQU)
  #undef GPR_NUM_EQU

  #else /* __ASSEMBLER__ */

-#define GPR_NUM_EQU(num, name)  ".equ .L_gpr_num_" #name ", " #num "\n"
+/* See the comment ahead of the __ASSEMBLER__ flavour above. */
+#define GPR_NUM_EQU(num, name)  "\n.equ .L_gpr_num_" #name ", " #num
  #define DEFINE_ASM_GPR_NUMS     GPR_LIST(GPR_NUM_EQU)

> 
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
>> + * program should continue,
> 
> "... in case of a fault, ..."

Applied.

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/gpr-num.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef RISCV_GPR_NUM_H
>> +#define RISCV_GPR_NUM_H
>> +
>> +/*
>> + * GPRs by ABI name, together with their register number (x0 .. x31).
>> + *
>> + * This is the single source of truth for the mapping:
> 
> True until here, but ...
> 
>> it generates the
>> + * .L_gpr_num_<name> assembler symbols
> 
> ... no, it doesn't. It's ...

I will update the comment to:
/*
  * GPRs by ABI name, together with their register number (x0 .. x31).
  *
  * This is the single source of truth for the mapping; users expand it with
  * their own per-register macro. Among them, struct cpu_user_regs is 
checked
  * against this list at build time (see regs_get_gpr()), so neither 
list can
  * be changed without the other.
  */
#define GPR_LIST(x)                                 \
     ...

and then ...

> 
>> used to turn a register name emitted
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
> 
> ... this construct which does. This is relevant to separate, since
> GPR_LIST() is also used elsewhere.
> 

... here:

/*
  * Generate the .L_gpr_num_<name> assembler symbols, used to turn a 
register
  * name emitted by the compiler into a register number.
  *
  * The separator is emitted ahead of each entry rather than after it, 
so that


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
>> + * register-number order:
> 
> I understand that the order need retaining. But why would it being at the
> start of the struct be (overly) relevant? You could use the "zero" field
> as the anchor for calculations.

You're right.

The placement requirement comes only from REG_PTR() computing a byte 
offset from the struct base. Anchoring it on ->zero instead removes the 
need for the block to sit at the start:

#define REG_PTR(insn, pos, regs) \
     (&(regs)->zero + (REG_OFFSET(insn, pos) / REGBYTES))

I'll do that and reword the comment to state the actual invariants: the 
x0..x31 fields have to stay contiguous and in ascending register-number 
order, and ->zero has to read as 0.

Thanks.

~ Oleksii

