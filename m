Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB81C5DF81
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:14:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393786.1632602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFtX-0000dB-QO; Tue, 18 Aug 2026 09:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393786.1632602; Tue, 18 Aug 2026 09:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFtX-0000d4-NR; Tue, 18 Aug 2026 09:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1393786;
 Tue, 18 Aug 2026 09:14:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwFtW-0000cy-CG
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:14:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFtV-00GLLd-Hl
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:14:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a84224f-2eae-0a2a0a5409dd-0a2a4503ab3e-46
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:14:05 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a84225d-fae8-0a2a45030019-d155802add57-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:14:05 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so47178335e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 02:14:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b783basm10776066f8f.30.2026.08.18.02.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 02:14:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787044445; x=1787649245; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNxttgFqZ62Mks/7jNp/0G7ERYuZ5YR2vKGntiN4L3g=;
        b=EerxsRaYOTIJhnR7kAqclycIqQmetxDNdIlr4BgDs5yJPS0a2fhE1Qusd7kNlgCaB7
         EcP0FAv8xSm9h0nKoUQ9xbERC3BQ04TZwrfn88F5OsjI3eB0p/FThKIvGckDBl7li86N
         lIMCvsnogMu7v1EXykscnrvHv5XHJ6vOxOkp13qamc+H//czuui8daMCbk2RhPrWvEfY
         Gm5k/4wbzzKMTSXxugOf0raTgbJnplADNkaytGVsNfNCAs1QnCTmgCpaG0L/BQ76x7re
         ED8aBGLJGXg7+LE0FxIiqTto+64WOZJxMchEgX2juQygx8328laXe7IBzWrmVoSFpOj9
         6Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044445; x=1787649245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNxttgFqZ62Mks/7jNp/0G7ERYuZ5YR2vKGntiN4L3g=;
        b=i210aSbwcuXFNmUxGfDgyJkB57HwZJSQZAOfMLTLL8c9w9WjTmfTshT5UmGdMhDzsi
         IVzTGtDXc9/1eCokPoWNQVBlxrrCWhgWGX/9epYJ+sUuqpp/NCnmBGPmIw6/6kKWg0/5
         /vutws+LyAend4RH+yDA7wuFa3YxdxawYsCaYn822nS/njbGvr5a4iJkbR6HTL+7VZ5i
         5goWH7rTS2WBmds2msP8dbHFJwNWwrDCSajmwfZmqyDegg+flXO0tWW25bn7e+Y2F/yZ
         LAqZxPoMjaOg9y6H7YvvBYPkvE0k03VLgWf/mj++nWNO1D4SzpiTL/mei1+aOE3Qn8Kc
         hqsA==
X-Forwarded-Encrypted: i=1; AHgh+RqDEN96K1u9AsyBUPn7Ib4G+2NK+3mUoKHSxXg8bET7Fi5+RowUmFc5UmMF+/o8quFw40Sbvhvo7JE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhOziQzatE/kg4XDE6kxVCzwPXmSP8ewtSQ8Vo7xzxySKmh2uN
	rKDSsnNrUthscf7TURei3xtWHY4PkuInDB3Z8dDkjWseNjFxYzUm9zU2
X-Gm-Gg: AR+sD12SzLg6gJlL5Vx10VWLXybkm5oHH3EXE6Pe5y4xrf4TtBqIZq7pEcx5u80xJ5h
	jBOeGgEdFHpTtutQBEoEP38IBFVgHupOAefQRAipVQcrvNb2yzLTUEsmn7fbkTUs0fQp3uEIBSk
	tD2f7T5dUQ+pBb/mbFMSu3V+QnxybcNG7/7ji8mkJP20atv2VYm1NCSh2UKboKkaizv7DdLf7mu
	E0LlIMKkrnkSFG+vWqgYfelLTkbi7CTwkLJOnEk0HDzql3WZ2ltORAs3++zyZXFsh/jtWZwXhqM
	5YGxT4YrUJ76iS6yC/AvvGxA0uM0+HmX7JSrYwQlxmsh7fgS0W16FJs3tA6F1dJn5kn36WzCdYR
	9sFOIdK7utdAtgIghlYasBP+5DY3WeElrpNw9slXtUlfwDl+kajkPlwhHzkwwlhXJ8jULUxyGwr
	fU0fb/HbCFFe+wWCMspAZvm8j+59Fj3VbHm3BUOh3BrsIA2ThgfBamN245Yl+NglkLFZf0fH5NT
	IuWh+WXNL1oh0jjOPy+nOnPLIOfZReqmi9DM26YTq0eR5CeCpBVWw==
X-Received: by 2002:a05:600c:8b6b:b0:499:8f9f:e9ee with SMTP id 5b1f17b1804b1-4998f9febbdmr426485635e9.7.1787044444570;
        Tue, 18 Aug 2026 02:14:04 -0700 (PDT)
Message-ID: <4a707c58-2225-477f-936e-9f99ae616c44@gmail.com>
Date: Tue, 18 Aug 2026 11:14:02 +0200
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
 <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
 <b8b794ec-c86a-4a82-9d3a-b3ffcaa802f3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b8b794ec-c86a-4a82-9d3a-b3ffcaa802f3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787044445-6C2E04E9-364AC3A5/10/73395122804
X-purgate-type: spam
X-purgate-size: 7423



On 8/18/26 9:56 AM, Jan Beulich wrote:
> On 17.08.2026 13:33, Oleksii Kurochko wrote:
>> On 8/12/26 4:37 PM, Jan Beulich wrote:
>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>> @@ -60,6 +68,40 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>>>        regs->sepc = ex_fixup(ex);
>>>>    }
>>>>    
>>>> +static inline unsigned long regs_get_gpr(struct cpu_user_regs *regs,
>>>> +                                         unsigned int offset)
>>>> +{
>>>> +    /*
>>>> +     * The GPR number -> offset arithmetic below relies on x0..x31 being
>>>> +     * laid out at the start of struct cpu_user_regs in architectural
>>>> +     * order.
>>>> +     */
>>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) !=
>>>> +                 sizeof(unsigned long));
>>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) !=
>>>> +                 31 * sizeof(unsigned long));
>>>> +
>>>> +    if ( unlikely(!offset || (offset > MAX_REG_OFFSET)) )
>>>> +        return 0;
>>>
>>> And an offset not divisible by sizeof(unsigned long) is okay?
>>
>> No, it isn't okay. I will apply your comment ...
>>
>>>
>>> Returning 0 as error indicator also feels fragile.
>>
>> With what I suggested below returning could be just dropped.
>>
>>>
>>>> +    return *(unsigned long *)((unsigned long)regs + offset);
>>>> +}
>>>> +
>>>> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
>>>> +                                 struct cpu_user_regs *regs)
>>>> +{
>>>> +    struct trap_info *trap_info =
>>>> +        (struct trap_info *)regs_get_gpr(regs, ex->data * sizeof(unsigned long));
>>>
>>> Related to the earlier comment: Simply pass just ex->data here, leaving the
>>> multiplication to regs_get_gpr()?
>>
>> ... It would be better to move the multiplication inside regs_get_gpr().
>>
>> Your comment made me think about whether the multiplication is needed at
>> all (regardless of where it is done). In other words, ex->data contains
>> the register number, so we could just write:
>>
>> static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>>                                     unsigned int num)
>> {
>>       /*
>>        * The GPR number -> offset arithmetic below relies on x0..x31 being
>>        * laid out at the start of struct cpu_user_regs in architectural
>> order.
>>        */
>>       BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) != sizeof(unsigned
>> long));
>>       BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) != 31 *
>> sizeof(unsigned long));
>>
>>       ASSERT(num && (num < 32));
>>
>>       return ((const unsigned long *)regs)[num];
>> }
>>
>> Probably, we want to consider this function out of context (for now
>> context is that we use it to recieve a pointer to trap_info which can't
>> be obviously stored in x0 as it should be always hardwired zero). In
>> that case, there is no need to check that num is 0.
>>
>> So, it probably makes sense to just have:
>>     ASSERT(num < 32);
>>
>> ASSERT() is fine here as I don't think that compiler will use incorrect
>> number during register allocation.
> 
> I agree.
> 
> However, the x0 aspect is still odd. Why again is it that struct cpu_user_regs
> has a field for it, when the register value is always 0? 

zero field isn't there to hold a value, it's there so the first 32 slots 
form an x0..x31 array indexed by GPR number. It is useful for SET_RD() 
implementation, for example.

> (And tangentially,
> what's the pregs field there, and what is stack_cpu_regs?)

It is rudiment, I don't use it anymore.

I will drop it in separate patch.

> 
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/include/asm/gpr-num.h
>>>> @@ -0,0 +1,33 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +#ifndef RISCV_GPR_NUM_H
>>>> +#define RISCV_GPR_NUM_H
>>>> +
>>>> +/* GPR ABI names, in register-number order (x0 .. x31). */
>>>> +#define GPR_ABI_NAMES                   \
>>>> +    zero, ra, sp, gp, tp, t0, t1, t2,   \
>>>> +    s0, s1, a0, a1, a2, a3, a4, a5,     \
>>>> +    a6, a7, s2, s3, s4, s5, s6, s7,     \
>>>> +    s8, s9, s10, s11, t3, t4, t5, t6
> 
> Having looked at struct cpu_user_regs for the response above: How is this
> macro intended to be kept in sync with struct cpu_user_regs? Yes, the ABI
> isn't going to change, but (a) still and (b) if later another ABI was
> introduced, names here and fields there could still easily diverge.

Yes, this macro should be in sync with struct cpu_user_regs too.

Then it is needed to turn GPR_ABI_NAMES into a numbered X-macro list and 
generate everything from it:


/* asm/gpr-num.h */
/*
  * GPRs in register-number order (x0 .. x31), by ABI name.  Single 
source of
  * truth: generates the .L_gpr_num_* assembler symbols, and is 
cross-checked
  * against struct cpu_user_regs at build time (see regs_get_gpr()).
  */
#define GPR_LIST(x)                                 \
     x(0,  zero) x(1,  ra)  x(2,  sp)  x(3,  gp)     \
     x(4,  tp)   x(5,  t0)  x(6,  t1)  x(7,  t2)     \
     x(8,  s0)   x(9,  s1)  x(10, a0)  x(11, a1)     \
     x(12, a2)   x(13, a3)  x(14, a4)  x(15, a5)     \
     x(16, a6)   x(17, a7)  x(18, s2)  x(19, s3)     \
     x(20, s4)   x(21, s5)  x(22, s6)  x(23, s7)     \
     x(24, s8)   x(25, s9)  x(26, s10) x(27, s11)    \
     x(28, t3)   x(29, t4)  x(30, t5)  x(31, t6)

#ifdef __ASSEMBLER__

#define GPR_NUM_EQU(num, name)  .equ .L_gpr_num_##name, num;
GPR_LIST(GPR_NUM_EQU)

#else /* __ASSEMBLER__ */

#define GPR_NUM_EQU(num, name)  "   .equ .L_gpr_num_" #name ", " #num "\n"
#define DEFINE_ASM_GPR_NUMS     GPR_LIST(GPR_NUM_EQU)

#endif

and then also:


/* extable.c, replacing the two existing BUILD_BUG_ONs */
#define CHECK_GPR_OFFSET(num, name)                     \
     BUILD_BUG_ON(offsetof(struct cpu_user_regs, name)   \
                  != (num) * sizeof(unsigned long));

static inline unsigned long regs_get_gpr(struct cpu_user_regs *regs,
                                          unsigned int offset)
{
     /* GPR number N must be field N of struct cpu_user_regs. */
     GPR_LIST(CHECK_GPR_OFFSET)
     ...
}

> 
>>>> +#ifdef __ASSEMBLER__
>>>> +
>>>> +    .equ    .L_gpr_num, 0
>>>> +    .irp    name, GPR_ABI_NAMES
>>>> +    .equ    .L_gpr_num_\name, .L_gpr_num
>>>> +    .equ    .L_gpr_num, .L_gpr_num + 1
>>>> +    .endr
>>>
>>> So this is emitted no matter whether a .S file actually uses any of the constants.
>>> Perhaps okayish, but somewhat wasteful.
>>
>> I can move #include <asm/gpr-num.h> inside "#else /* __ASSEMBLER__ */"
>> in asm/extable.h and it will be enough for now. Or just drop declaration
>> of .L_gpr_num for assembler code until it will be needed by it.
> 
> How would either of these address the remark I made? Not every .S file
> including asm/extable.h will need these constants. Imo this new file wants
> strictly only including by files which actually need .L_gpr_num_*.

Oh, now I got your idea. There is no need to icnlude asm/gpr-num.h 
inside <asm/extable.h>. It seems to me then it will be better to follow 
the way which was intrdouced originally just have asm/gpr-num.h included 
at the top of asm/extable.h, this is not a big price for .S file which 
including asm/extrable.h and doesn't really need asm/gpr-num.h.

~ Oleksii

