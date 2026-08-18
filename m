Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2912DC5DF67
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:56:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393594.1632415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEg7-000356-W1; Tue, 18 Aug 2026 07:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393594.1632415; Tue, 18 Aug 2026 07:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEg7-00034z-Rf; Tue, 18 Aug 2026 07:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1393594;
 Tue, 18 Aug 2026 07:56:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwEg6-00034t-UL
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:56:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwEg6-001oVA-Aq
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:56:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a841002-bab6-0a2a0a5309dd-0a2a45078cbc-34
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:56:05 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a841014-b4ea-0a2a45070019-d155dd29e83f-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:56:05 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so2067045f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:56:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b77fa3sm9639633f8f.26.2026.08.18.00.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 00:56:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1787039764; x=1787644564; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXEcZZ29k+TvYgFCA8ciZUZEguthu2ZUBj81fxlkawM=;
        b=Y3VBxJXf3gN0wAz7XUeiPBaWvkBu1K97eWZm4u/3CBY5/Wt+1npLVQ3bX8q3kt6lj1
         iLo46s56w2NrPFMmE5d/sMci+k3TgwADwW7A/ERI/0TXCngT1I9nFX2pnW6mTzI0kuBm
         /ToRdP9/bsfFwx3dFNMZUt1Aq+nRfYZLstt1KEII0PDLAujXajOYbRqnuvGiMD6teuBo
         iIAPRGvn9OOd9jKp4iRU5eX5Yw6tMkg6xxYA4byIilxnnHfpRaWuS52Yx0ubknvGYC00
         ++oe1gaCzNjWbPgKCZHdATH5BfjSq69ea+wMcHyO8hbo9v941timHmd7yTdEzAd04JCx
         ZAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039764; x=1787644564;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zXEcZZ29k+TvYgFCA8ciZUZEguthu2ZUBj81fxlkawM=;
        b=SmSZbhCd+mq0JUMGfL8xJm2/NvX7/r3qmgE1VRqUo6xIe3oxt8T6IGqjuFTE30jOMg
         UWYnPZW5hlHHwl7c9p75/KKN3DC0xxrqBWp3puXwcetlJj8NxEOSEE5ZhEkiodJq+lXz
         KZNfGmwdTNqddJ6Q4x5KU7Km6IaEyvyJUWkNpJfry1hdQs5FoGxD7Fbq+yEMuVw30iBw
         HzaQtV+fualRJ0b8qsFXiAk9m6q0Pr5Xa94mtBQhnLnLvGOdUE6orWVil9MPjBIIQyN+
         DnDkfJrgk1ho1XGdVYJ68TPG/arFo3rdpRwnjI6frAdAMoxG/Mothvu6RdgjtZn93qbQ
         5Iow==
X-Forwarded-Encrypted: i=1; AHgh+RrOKBu6K1ax5ZeuWS1r5oqFpU6Z02woYbCIkBCU+nO5YPQNYkNYEhbR60qRQtR/3Uwu6PTknkMCYMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydBfL1MIAyfzvy8aWYUDhZJIHJG7+2BU7sIoZeACnDzQGESoLT
	nWbG26jmC13p2LyAZk7XN6DEm9cmaQD7CXAh5AITw32Qaigw0xSujvtlzuQ1SEH69A==
X-Gm-Gg: AR+sD10wrEPw1O3AHn1coNZwazEcnWGr1kY1dQcAsx5bMdKY5unBJrb/QG5DCa2v79D
	QhdP//3EipresN77sGizoTsoP0XQtyx7xV3QNoecAkEEGfY4xbTz5t87kJyhfb9ZYkjPyPEHmAP
	YooodAOe8p9QQJ1cZcU2lBszN5r3Kit1WXeV0Vyq8V1uPX7Q7Uu7BdOiab58+0Zinlj28/v48lq
	7OA6wD270oIYXItn2fpYivcC0LrOJCmbs2H7Op56dvOqiJNY933HSniWOYGAtJ2cxGUsYFNXi6g
	5D11yvQ6uWA2SawbsFqjIChH+w/rkfDHpvGiZWlCURwQtxJwU0/o6qROSf8BS0v6fNcrwS509YR
	NDZFXCWb9wvDVx7bpzTtcQXVPDU/xCNaRhB/Uac5nHyRxmY96AUwQWdB9/52SVvXuVzWQQkOKPY
	VbyyEZBTic1xOIO/oPQR8XCs7nOVbedCkBgtzWgLH542OGNpHjDDcxADY1MXr8h15srz/k9/AO4
	LE69CJiV2olYiJ9veGzxeT9HIgQQuQojktiGSQMPtIbqllRsPDX
X-Received: by 2002:a05:6000:410a:b0:47f:8b2c:3d98 with SMTP id ffacd0b85a97d-48160723cd4mr47724056f8f.4.1787039764518;
        Tue, 18 Aug 2026 00:56:04 -0700 (PDT)
Message-ID: <b8b794ec-c86a-4a82-9d3a-b3ffcaa802f3@suse.com>
Date: Tue, 18 Aug 2026 09:56:02 +0200
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
 <be932384-6661-4c92-9137-8f6a9cd54057@suse.com>
 <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
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
In-Reply-To: <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787039765-352CCAE4-189113E2/0/0
X-purgate-type: clean
X-purgate-size: 4888

On 17.08.2026 13:33, Oleksii Kurochko wrote:
> On 8/12/26 4:37 PM, Jan Beulich wrote:
>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>> @@ -60,6 +68,40 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>>       regs->sepc = ex_fixup(ex);
>>>   }
>>>   
>>> +static inline unsigned long regs_get_gpr(struct cpu_user_regs *regs,
>>> +                                         unsigned int offset)
>>> +{
>>> +    /*
>>> +     * The GPR number -> offset arithmetic below relies on x0..x31 being
>>> +     * laid out at the start of struct cpu_user_regs in architectural
>>> +     * order.
>>> +     */
>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) !=
>>> +                 sizeof(unsigned long));
>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) !=
>>> +                 31 * sizeof(unsigned long));
>>> +
>>> +    if ( unlikely(!offset || (offset > MAX_REG_OFFSET)) )
>>> +        return 0;
>>
>> And an offset not divisible by sizeof(unsigned long) is okay?
> 
> No, it isn't okay. I will apply your comment ...
> 
>>
>> Returning 0 as error indicator also feels fragile.
> 
> With what I suggested below returning could be just dropped.
> 
>>
>>> +    return *(unsigned long *)((unsigned long)regs + offset);
>>> +}
>>> +
>>> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
>>> +                                 struct cpu_user_regs *regs)
>>> +{
>>> +    struct trap_info *trap_info =
>>> +        (struct trap_info *)regs_get_gpr(regs, ex->data * sizeof(unsigned long));
>>
>> Related to the earlier comment: Simply pass just ex->data here, leaving the
>> multiplication to regs_get_gpr()?
> 
> ... It would be better to move the multiplication inside regs_get_gpr().
> 
> Your comment made me think about whether the multiplication is needed at 
> all (regardless of where it is done). In other words, ex->data contains 
> the register number, so we could just write:
> 
> static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>                                    unsigned int num)
> {
>      /*
>       * The GPR number -> offset arithmetic below relies on x0..x31 being
>       * laid out at the start of struct cpu_user_regs in architectural 
> order.
>       */
>      BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) != sizeof(unsigned 
> long));
>      BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) != 31 * 
> sizeof(unsigned long));
> 
>      ASSERT(num && (num < 32));
> 
>      return ((const unsigned long *)regs)[num];
> }
> 
> Probably, we want to consider this function out of context (for now 
> context is that we use it to recieve a pointer to trap_info which can't 
> be obviously stored in x0 as it should be always hardwired zero). In 
> that case, there is no need to check that num is 0.
> 
> So, it probably makes sense to just have:
>    ASSERT(num < 32);
> 
> ASSERT() is fine here as I don't think that compiler will use incorrect 
> number during register allocation.

I agree.

However, the x0 aspect is still odd. Why again is it that struct cpu_user_regs
has a field for it, when the register value is always 0? (And tangentially,
what's the pregs field there, and what is stack_cpu_regs?)

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/gpr-num.h
>>> @@ -0,0 +1,33 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef RISCV_GPR_NUM_H
>>> +#define RISCV_GPR_NUM_H
>>> +
>>> +/* GPR ABI names, in register-number order (x0 .. x31). */
>>> +#define GPR_ABI_NAMES                   \
>>> +    zero, ra, sp, gp, tp, t0, t1, t2,   \
>>> +    s0, s1, a0, a1, a2, a3, a4, a5,     \
>>> +    a6, a7, s2, s3, s4, s5, s6, s7,     \
>>> +    s8, s9, s10, s11, t3, t4, t5, t6

Having looked at struct cpu_user_regs for the response above: How is this
macro intended to be kept in sync with struct cpu_user_regs? Yes, the ABI
isn't going to change, but (a) still and (b) if later another ABI was
introduced, names here and fields there could still easily diverge.

>>> +#ifdef __ASSEMBLER__
>>> +
>>> +    .equ    .L_gpr_num, 0
>>> +    .irp    name, GPR_ABI_NAMES
>>> +    .equ    .L_gpr_num_\name, .L_gpr_num
>>> +    .equ    .L_gpr_num, .L_gpr_num + 1
>>> +    .endr
>>
>> So this is emitted no matter whether a .S file actually uses any of the constants.
>> Perhaps okayish, but somewhat wasteful.
> 
> I can move #include <asm/gpr-num.h> inside "#else /* __ASSEMBLER__ */" 
> in asm/extable.h and it will be enough for now. Or just drop declaration 
> of .L_gpr_num for assembler code until it will be needed by it.

How would either of these address the remark I made? Not every .S file
including asm/extable.h will need these constants. Imo this new file wants
strictly only including by files which actually need .L_gpr_num_*.

Jan

