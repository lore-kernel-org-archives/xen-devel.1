Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4796C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 13:44:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412056.1642536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3w7a-0005kV-3a; Tue, 08 Sep 2026 13:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412056.1642536; Tue, 08 Sep 2026 13:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3w7a-0005kO-0X; Tue, 08 Sep 2026 13:44:22 +0000
Received: by outflank-mailman (input) for mailman id 1412056;
 Tue, 08 Sep 2026 13:44:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3w7Y-0005kF-86
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 13:44:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3w7X-0091en-0o
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:44:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa01129-8faa-0a2a0a5109dd-0a2a450a83dc-10
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:44:13 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa0112d-f2d2-0a2a450a0019-d155802ce1c7-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:44:13 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso25320195e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 06:44:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d03543064sm302982865e9.13.2026.09.08.06.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 06:44:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788875053; x=1789479853; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jkSMrQgpk18fZwC2aPVLtuqV8lZqxCdCFIjkgd3VC04=;
        b=HxxFFlOfiTOUAV7RPB0T/ghvKCbHvF07SvNOuFvFQuKS43xo7G5zp2tOeVZn1PivdX
         doxWRq5Mg8zJy6wkXGnW8I8Eq0ieDlAZyYcosx3f1+crPFeoSWZvmCvSIjxSN0YNV/5M
         GGKwZ9hpOc239iD113If7PLh0Njff2ZIQFERCrs0bTHyuz5TFKE13PAYSh5G1ax7IMJI
         C7xIVtNQz4aCcHEuihtKk3mI5EH3z+jcyIPSTdi8yG5t/DVBj4EIoocnlwmD0M/OwG7W
         obr+BB50Q1dcZPS/kaPJp/1F9OHM0DX6Jd9NjX4Hqgk5FwaLizFYaMfP0c/G89ZIJSVA
         fXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875053; x=1789479853;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkSMrQgpk18fZwC2aPVLtuqV8lZqxCdCFIjkgd3VC04=;
        b=Seuf0RFFI3ZxbxLthGcsUGlIn+8rD8wpJ2blhtSidiQopjD7/U45ZCGhblgXzaiJKD
         V0KHy2Bg9PGh64tNoyMy14CCOzfWdUdUe6jsbe00tGCuxEoVGtclrhpfdKsRmSCDQxb/
         hRId5AR6qSwtMpQZBgA7gSAzjk2RVyI29yqhnHehMd3g9E7E79VPxHT8mit2LFcNO4ZR
         Gl6twwlJ7aHlZ/148OK6NhoLM6MkcDwGLPrHeGcV4a51sj6mrstSW1KgKBiC5yOGCH/j
         yfvlfgse2GA7swdps3uKOGiq2VbErcsrbLWB6wSIzIJciDxY1gb/iTebjURrVZPe/O7p
         RSMw==
X-Forwarded-Encrypted: i=1; AKwUvBzP+yCLzenv1Hvqcg5eAFz4qKLnFRNMsCGGlRwmiMwFJ/8H0qpqtHABDQvpDYPHtD+VlMDb/yUybkI=@lists.xenproject.org
X-Gm-Message-State: AFuF++nJaHJo8qRY3btRJ5TYzoa6buPUtm0Bdc4BDqvhjsbbM6+q60b0
	jTJIPaxxdtL8HI3fMm3HyezPbfKfSjJyEt/0YnolJlG32okuCUHZ2FyL3DRruZg8Pw==
X-Gm-Gg: AYBFou0xQUEV5YE5cYkjYx4exlySfXMUMcXep9jck9z+bB5s+iVnqMBbbA3HkJRdga/
	wTgVDs+6P6WfLVrgEQ40Nb38vp/I3jpAnrYiaVYgaBP32+rUwJ/P9gpPQqXm5lOsBSiBldhwYiR
	zI7ngRcizL2OenjCku0MQgboN4yyb27hT7SS/yfRYWFVN8wYkN4gKe4OlZd1BRpjWCO4WVpyMsm
	NO8V0vQEFOpg2dXt+7E/BGm1LIyakRcnYTQog6Jap1KJmTXQGr1YUormolVgrtn4mJ6nsxv5xgL
	X7dcRrCGct/eDYfUChcoANjTFhJQuNgJbC4kVzQ1FUscPyzO/GSqcyU9V95MbOnMZH/tEDaq025
	0vfYaoRdt07CUeJ3TnqgAP4GtIV8PYODyY1TkwhRLkkDyGwbZyjczupjYZ+bHsDhRYQRFjtZ3YN
	LmFWh1+EcvQNQopTJR5qc4qVx/sAHpqJzjYfjqR40CkzaAAQ3PBqY0uVCF/UCXz3NDUmlIUczYR
	4h6jf1Qhnklc27fw/hM+40plLODadRyZQ/Rq1feCnbZZxzVN475kePBWTK1HvE=
X-Received: by 2002:a05:600c:4fc9:b0:49c:fc6e:8cb9 with SMTP id 5b1f17b1804b1-49cfc6e8e1emr259560385e9.29.1788875053057;
        Tue, 08 Sep 2026 06:44:13 -0700 (PDT)
Message-ID: <39841f44-2b18-4368-a9f8-7c0db307ff6d@suse.com>
Date: Tue, 8 Sep 2026 15:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/39] xen/riscv: extend exception tables with type and
 data fields
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <8aef9dfabe1d485abe4c48fd7499e09dbd8e0c27.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1788875053-504CFCFC-D4C222CD/0/0
X-purgate-type: clean
X-purgate-size: 6373

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> @@ -59,7 +67,49 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>      regs->sepc = ex_fixup(ex);
>  }
>  
> -bool fixup_exception(struct cpu_user_regs *regs)
> +#define CHECK_GPR_INDEX(num, name)                      \
> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, name)   \
> +                 != (num) * sizeof(unsigned long));

Nit: Placement of the !=. Also there should be no semicolon here; it wants
to ...

> +static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
> +                                  unsigned int num)
> +{
> +    /*
> +     * The GPR number -> struct index mapping below relies on x0..x31 being
> +     * laid out at the start of struct cpu_user_regs in architectural order,
> +     * matching the register numbers GPR_LIST() hands to the assembler.
> +     */
> +    GPR_LIST(CHECK_GPR_INDEX)

... appear here instead, for this to actually look like a statement.

> +    ASSERT(num < 32);
> +
> +    return ((const unsigned long *)regs)[num];

What about release builds? You'd happily overrun the array there. Maybe
(ab)use array_index_nospec() here?

> +}
> +
> +#undef CHECK_GPR_INDEX

If the sole use of the macro is in a single function, it wants #define-ing
(and #undef-ing) there, not outside of it.

> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
> +                                 struct cpu_user_regs *regs,
> +                                 unsigned long cause)
> +{
> +    struct trap_info *trap_info =
> +        (struct trap_info *)regs_get_gpr(regs, ex->data);
> +
> +    BUG_ON(!trap_info);

This feels extremely weak. As you're fetching from a GPR, the majority of
possible values stored in GPRs is going to be invalid, not just NULL. And
while the accesses below would trap on NULL anyway, whether other bogus
values would trap is pretty hard to predict. If trap_info is expected to
always live on the stack, why not check for that (perhaps also check that
the low few bits are clear)?

> @@ -23,20 +30,36 @@
>  
>  struct cpu_user_regs;
>  
> -#define ASM_EXTABLE(insn, fixup)      \
> -    ".pushsection .ex_table, \"a\"\n" \
> -    ".balign    4\n"                  \
> -    ".word      (" #insn " - .)\n"    \
> -    ".word      (" #fixup " - .)\n"   \
> +#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
> +    ".pushsection .ex_table, \"a\"\n"               \
> +    ".balign    4\n"                                \
> +    ".word      (" insn ") - .\n"                   \
> +    ".word      (" fixup ") - .\n"                  \
> +    ".half      (" type ")\n"                       \
> +    ".half      (" data ")\n"                       \
>      ".popsection\n"
>  
> +#define ASM_EXTABLE(insn, fixup)    \
> +    ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_FIXUP), "0")
> +
> +#define EX_TRAP_INFO_REG(gpr)   \
> +    "(.L_gpr_num_" #gpr ")"

This doesn't need to be wrapped across lines, does it?

> +#define ASM_EXTABLE_TRAP_INFO(insn, fixup, data)                    \
> +    DEFINE_ASM_GPR_NUMS                                             \
> +    ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_TRAP_INFO),  \
> +                    EX_TRAP_INFO_REG(data))

There's no visible statement separator between DEFINE_ASM_GPR_NUMS and
ASM_EXTABLE_RAW(), which only works because DEFINE_ASM_GPR_NUMS appends
a separator also at the very end of its expansion. I think that better
would be changed, such that at use sites such as this one a separator
becomes mandatory.

>  /*
> - * The exception table consists of pairs of relative offsets: the first
> - * is the relative offset to an instruction that is allowed to fault,
> - * and the second is the relative offset at which the program should
> - * continue. No general-purpose registers are modified by the exception
> - * handling mechanism itself, so it is up to the fixup code to handle
> - * any necessary state cleanup.
> + * Each exception table entry consists of two relative offsets and a
> + * handler description: `insn` is the relative offset to an instruction
> + * that is allowed to fault, `fixup` is the relative offset at which the
> + * program should continue,

"... in case of a fault, ..."

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/gpr-num.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef RISCV_GPR_NUM_H
> +#define RISCV_GPR_NUM_H
> +
> +/*
> + * GPRs by ABI name, together with their register number (x0 .. x31).
> + *
> + * This is the single source of truth for the mapping:

True until here, but ...

> it generates the
> + * .L_gpr_num_<name> assembler symbols

... no, it doesn't. It's ...

> used to turn a register name emitted
> + * by the compiler into a register number, and struct cpu_user_regs is
> + * checked against it at build time (see regs_get_gpr()). Neither list can
> + * therefore be changed without the other.
> + */
> +#define GPR_LIST(x)                                 \
> +    x(0,  zero) x(1,  ra)  x(2,  sp)  x(3,  gp)     \
> +    x(4,  tp)   x(5,  t0)  x(6,  t1)  x(7,  t2)     \
> +    x(8,  s0)   x(9,  s1)  x(10, a0)  x(11, a1)     \
> +    x(12, a2)   x(13, a3)  x(14, a4)  x(15, a5)     \
> +    x(16, a6)   x(17, a7)  x(18, s2)  x(19, s3)     \
> +    x(20, s4)   x(21, s5)  x(22, s6)  x(23, s7)     \
> +    x(24, s8)   x(25, s9)  x(26, s10) x(27, s11)    \
> +    x(28, t3)   x(29, t4)  x(30, t5)  x(31, t6)
> +
> +#ifdef __ASSEMBLER__
> +
> +#define GPR_NUM_EQU(num, name)  .equ .L_gpr_num_##name, num;
> +GPR_LIST(GPR_NUM_EQU)
> +#undef GPR_NUM_EQU

... this construct which does. This is relevant to separate, since
GPR_LIST() is also used elsewhere.

> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -12,7 +12,19 @@
>  
>  #ifndef __ASSEMBLER__
>  
> -/* On stack VCPU state */
> +/*
> + * On stack VCPU state.
> + *
> + * x0..x31 must remain at the start of this structure, in architectural
> + * register-number order:

I understand that the order need retaining. But why would it being at the
start of the struct be (overly) relevant? You could use the "zero" field
as the anchor for calculations.

Jan

