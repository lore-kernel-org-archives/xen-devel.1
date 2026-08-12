Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23F2C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 14:37:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389147.1630067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuA5C-0002tP-GS; Wed, 12 Aug 2026 14:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389147.1630067; Wed, 12 Aug 2026 14:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuA5C-0002tI-DL; Wed, 12 Aug 2026 14:37:30 +0000
Received: by outflank-mailman (input) for mailman id 1389147;
 Wed, 12 Aug 2026 14:37:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuA5B-0002tC-7Q
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 14:37:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuA59-007Om6-Ut
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 16:37:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c851f-8faa-0a2a0a5109dd-0a2a450b8c12-16
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:37:27 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c8527-b7e8-0a2a450b0019-d155802af12d-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:37:27 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so10648335e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 07:37:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150c08dd7sm7363418f8f.16.2026.08.12.07.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 07:37:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1786545447; x=1787150247; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoMFEZzeboMnsiJyElZO3eCGf2lVPNl1wbVF7BLiQ+I=;
        b=G2EXAdO+zzb5vFIScqAOGowh+lUtk7A2tqh1tNtg1OsVh4EM+BAcz1DGUoaJ920+LQ
         /qp1ON2S6nVB62yNRIU4gbCLCCgmjRYPpIEaNiNG3sup7czOKhN5ZXIocYqnJip4tyeX
         WpDJFdhc25saawHZb09bHV0X+PuyK0ZBmnUJZzYpKDuVYMrLhaUqLAzzDgtJRxF3eZL9
         C+aqZ6u4IPx96m3XZVKc/2BD+H6w45J2MYPPPkQsEXZjJYCd5+Cdo3oLUyXEN20KKPqc
         CeFYH2W7jExuK8N3BR9IJi14aAzMc2QLUQH5S1/P/gVJsexpY9+n105kx3ItuAYyYcDt
         igVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786545447; x=1787150247;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KoMFEZzeboMnsiJyElZO3eCGf2lVPNl1wbVF7BLiQ+I=;
        b=nw8J36yTTRVgGAaDsEot3bl7zIwvEciu0Cnc61kZeAckdLqb/TS92vNIiweSHVWHWM
         l4my5m9qk1PvxEt009L/IiAuJaoHRzQ83hIrhpb6nw/ESf8lCazaunsB8O92Eocp06W8
         dMds/2iDgo4sFuE6zOFufcREfK/DcYk6AiLBLIm6SM3/XhxWRvYBpahvMFeK9dR/SQuC
         cvXWlTLcslAWyWGZm76IAb1T3SsQ5UQPRb7R8dsPRq9bLiQXZSGJFheUHF8M7YIsY0K1
         RuqSLvIRBbj2pY96p+YmodK2zSXLeSA1Y7JD26Az8fzKurjRKua9LEofYNCeosfqZcC8
         KuYQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3NtK5p8UHkXDRTJFfE3S/H03ilaAp2jlNGrYR7vwkhlqA/tT+EyRFzn6zjy8PGOhQV/PQPQiK+ag=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWz14fvfo7LxNG8zxXCixoQVtWa8oWxdlxFZL9W6yEEvn8PEWR
	2YG8s2h0p52SgU1LBZ5JTmj+BTYzInvv4cwu3HkA+Ai0z9wAACx9NOM4nZsHBS8tQw==
X-Gm-Gg: AR+sD1262BqfSAhWVlc/i6bTLxnpjiJyD0q0AWzJtMEl4CJTaTRIlWGD+u9r2jfhptK
	m3POlPNS0WfuohEE/6piv3ECWm05CJprndUGqbRZq++paoB6kBxcNoVREOMmiZrrS6YL/722PNu
	erfXljqrnPOkRAx+fgR47O7KghDCZNZq22rGyKp+FJbDvb5yLlMFxtrclUdQF6zAVBOX0mB2CZD
	XPLF+45kh+TppzMwpKf956LtKhEbQY6ibiWM0NZgjQNRhKPo98QxFotmbXgVd+KNApjFa+tAsID
	EVEY54N0L3jy9RmA8z5dt79Pel1LfC22y6fBb8dsTj+aTmcQ1jgkTgATP4aOQgX8ESPAeSPldpU
	3TQtxCrfKMpEewmIDRlIypTIGSvVdqfGgvxABljVEAm8vb0JrT06WNX/4x8HESAskl9mcAeaSNb
	jWTsblKdkh4aP7TMcFMOpddEfSzjLW52Te8DM/Sg5SBer7JeWmo9Fx27r+A5C8bnV7qCvYBeMOZ
	pRQKC1gBZChiyxSs/NTc0NStaE/iDPrjwFhC8pmPSg39o7u2IKZV7ATqpRjenw=
X-Received: by 2002:a05:600c:1990:b0:499:48bb:417e with SMTP id 5b1f17b1804b1-4997c0fe4ebmr62491525e9.2.1786545447330;
        Wed, 12 Aug 2026 07:37:27 -0700 (PDT)
Message-ID: <be932384-6661-4c92-9137-8f6a9cd54057@suse.com>
Date: Wed, 12 Aug 2026 16:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/17] xen/riscv: extend exception tables with type and
 data fields
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <1eb9050ff6632f91682151471440990bd718ed90.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1786545447-A88C99EA-53675707/0/0
X-purgate-type: clean
X-purgate-size: 4227

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> @@ -60,6 +68,40 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>      regs->sepc = ex_fixup(ex);
>  }
>  
> +static inline unsigned long regs_get_gpr(struct cpu_user_regs *regs,
> +                                         unsigned int offset)
> +{
> +    /*
> +     * The GPR number -> offset arithmetic below relies on x0..x31 being
> +     * laid out at the start of struct cpu_user_regs in architectural
> +     * order.
> +     */
> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) !=
> +                 sizeof(unsigned long));
> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) !=
> +                 31 * sizeof(unsigned long));
> +
> +    if ( unlikely(!offset || (offset > MAX_REG_OFFSET)) )
> +        return 0;

And an offset not divisible by sizeof(unsigned long) is okay?

Returning 0 as error indicator also feels fragile.

> +    return *(unsigned long *)((unsigned long)regs + offset);
> +}
> +
> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
> +                                 struct cpu_user_regs *regs)
> +{
> +    struct trap_info *trap_info =
> +        (struct trap_info *)regs_get_gpr(regs, ex->data * sizeof(unsigned long));

Related to the earlier comment: Simply pass just ex->data here, leaving the
multiplication to regs_get_gpr()?

> +    BUG_ON(!trap_info);
> +
> +    trap_info->sepc = csr_read(CSR_SEPC);
> +    trap_info->scause = csr_read(CSR_SCAUSE);
> +    trap_info->stval = csr_read(CSR_STVAL);

Do you really need to re-read all three registers here? Didn't you read at least
scause already, in order to make it here in the first place?

> --- a/xen/arch/riscv/include/asm/extable.h
> +++ b/xen/arch/riscv/include/asm/extable.h
> @@ -3,17 +3,24 @@
>  #ifndef ASM__RISCV__ASM_EXTABLE_H
>  #define ASM__RISCV__ASM_EXTABLE_H
>  
> +#include <asm/gpr-num.h>
> +
> +#define EX_TYPE_FIXUP 0
> +#define EX_TYPE_TRAP_INFO 1
> +
>  #ifdef __ASSEMBLER__
>  
> -#define ASM_EXTABLE(insn, fixup) \
> -    .pushsection .ex_table, "a"; \
> -    .balign     4;               \
> -    .word       (insn) - .;      \
> -    .word       (fixup) - .;     \
> -    .popsection
> +#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
> +    .pushsection .ex_table, "a";                    \
> +    .balign     4;                                  \
> +    .long       ((insn) - .);                       \
> +    .long       ((fixup) - .);                      \

Why the change from .word to .long? And why the extra pairs of parens?

> +    .short      (type);                             \
> +    .short      (data);                             \

Alongside .word, these then likely want to be .half.

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
> +    ".long      ((" insn ") - .)\n"                 \
> +    ".long      ((" fixup ") - .)\n"                \

Same questions here then.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/gpr-num.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef RISCV_GPR_NUM_H
> +#define RISCV_GPR_NUM_H
> +
> +/* GPR ABI names, in register-number order (x0 .. x31). */
> +#define GPR_ABI_NAMES                   \
> +    zero, ra, sp, gp, tp, t0, t1, t2,   \
> +    s0, s1, a0, a1, a2, a3, a4, a5,     \
> +    a6, a7, s2, s3, s4, s5, s6, s7,     \
> +    s8, s9, s10, s11, t3, t4, t5, t6
> +
> +#ifdef __ASSEMBLER__
> +
> +    .equ    .L_gpr_num, 0
> +    .irp    name, GPR_ABI_NAMES
> +    .equ    .L_gpr_num_\name, .L_gpr_num
> +    .equ    .L_gpr_num, .L_gpr_num + 1
> +    .endr

So this is emitted no matter whether a .S file actually uses any of the constants.
Perhaps okayish, but somewhat wasteful.

Jan

