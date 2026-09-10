Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F16C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 06:38:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413969.1643835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4YQR-0005Nc-Cg; Thu, 10 Sep 2026 06:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413969.1643835; Thu, 10 Sep 2026 06:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4YQR-0005NV-9m; Thu, 10 Sep 2026 06:38:23 +0000
Received: by outflank-mailman (input) for mailman id 1413969;
 Thu, 10 Sep 2026 06:38:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4YQP-0005NP-N2
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 06:38:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4YQP-004LiJ-3T
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 08:38:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa25053-bab6-0a2a0a5309dd-0a2a45098d2e-10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:38:16 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa25057-be1a-0a2a45090019-d155dd2bc81d-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:38:16 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4859b45abadso626043f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 23:38:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm41005570f8f.17.2026.09.09.23.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 23:38:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1789022295; x=1789627095; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NX0OxbB28DbZIwihOdfCW5vty+HHgQZ6fPgsUPCvWg=;
        b=R7rHPkKYYN6r+VW7kcfBDnEFm6hoC8yglGw2279WuzM9VuFeqNHVnAaaylAWNxLsqH
         EhIqQPHZF+0PHOiOl/AVsWRfMR4hz/m3NoCv5QfLjC57PN+7B6evB5q4ypQontYV2v4t
         gkDGjfYvrAuCNFczrM9YnEh42DDWCaVKdhZbHHfPEaaWLsY4KY/1+CaCwrzxfwqhmGyC
         O6PYdxjXzdZQerLN+0Y5BM/0YBzWRi/KQJ3X0qGd07xntHgJV5ZcONSExQztaK3EQR2C
         0pJ7H8R+cbV+G6TMd9xgPHkpsape4gU9aXusPMiC0nzWMDELhIy8+jCXWtXLx5D9sgjM
         zkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022295; x=1789627095;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NX0OxbB28DbZIwihOdfCW5vty+HHgQZ6fPgsUPCvWg=;
        b=oJF3rqXPuogABsSDdtMnG1xZ5aP4zurypZFj6kJXf9r5+cdQj3C8wmO3w3kobJUR3z
         bVSXokn7aDa/8FV+1L2r83fgXcmEEDDiwLDA2EVjh+jzKV1qLeDMdqV3ZzqSGGaPbkaW
         2Id0qjUR32ofvU2eu2Wfl2Zk+sinm9WqDpR3O76i9H2HLQKgX6/H0YsU5hg4VqjYAtdO
         atAa7D7NYf/YmwMq2Rq3n1UW8k0lrl25WClgvVhXJ/iw4YiUKVwy8AwiPbUQCSSaOBqz
         Wqy5KwzJHxz330PFKdzGxXSTeMUQtyITbit+LNUjRGeVHLzM/fDgadpurUoxWOdh81fl
         XBMw==
X-Forwarded-Encrypted: i=1; AKwUvBxsLiSp2CIvxgT6QIAUUevOhKxqzoeZdM4AqgwAqtKHu6jtBAa2GeFivxYIVHXOGPbQHgddDE93Wcc=@lists.xenproject.org
X-Gm-Message-State: AFuF++k9AXyFhK2S7vg0F0EIFtSiJncUm8EfwO/WX3sMrklFEka+ufe8
	h3qz581zFjyzG17GpyXxXcSz+P49RcM7uPKs36cyD3FovfnTqbe7m0aat+oAyQY8UQ==
X-Gm-Gg: AYBFou2Qw7LDO/JQIkB2PLJtL3a0yz+eXi8UEYFb43uGY7nBePsbxNEz3j4frFGUAK8
	k/6xh8XU6qLsa/Va23JgIx6SJwZdNaQBkwnX9VBae+MKn1kZE4pLVtUnvTQb8+7OTDzGIUpyqOW
	mFVP2g04aeoh0NnKwtO+9X0gitYfZmr0MSrp/ysWsnW+4XzkF5Og66z+wYwbnQpzZyzqzRWCzc6
	Z2BYM4ur+scSe7BRXbixa87rFQ2L+JxMpRLLlsvibd4NT6eyuAkOJalMPg41KPdh2VLgFeT+Dsz
	jszuX3isSDlnToETlw70iN+Ls3R24Bb3qmJYwSfXBxcDEPx3Hqvy7UaOY2p1My16j72NGZYWrj+
	HvPdEcd3vBT4EP1S3b9vz6A7hFmdKukahe0kk0dUDk4wzuz/U7mSQcuBCBswtssGn1lRg3sD+xt
	izmDWxpES9S98uMW93JxX6MHFd57TWkSJxEW03Zpi7Rd6BVtm5Fwg0VTMNXLrnyRconfS4h3pFX
	7sHwEo1qrel8ozyaVqGChpl5NqhqhG4kBnaVeWDPV3tD0wcHmXo6EZFS/MIZUoV1ERWmYC4VA==
X-Received: by 2002:a05:6000:420b:b0:485:ac3b:4a79 with SMTP id ffacd0b85a97d-485ac3b4b63mr9046278f8f.43.1789022295471;
        Wed, 09 Sep 2026 23:38:15 -0700 (PDT)
Message-ID: <e91e5b49-b6b6-429f-a1b2-b9e555e19f92@suse.com>
Date: Thu, 10 Sep 2026 08:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/39] xen/riscv: add guest page fault handling stub
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
 <42e37df518f1eda9579264b4bae9db3521e1042a.1787838835.git.oleksii.kurochko@gmail.com>
 <35aecc68-d16e-4350-9aca-101de2b21c1f@suse.com>
 <19aae90d-bd5b-4637-828c-bb5164ba4191@gmail.com>
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
In-Reply-To: <19aae90d-bd5b-4637-828c-bb5164ba4191@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1789022296-3B2DC034-15BE0AA9/0/0
X-purgate-type: clean
X-purgate-size: 5707

On 09.09.2026 17:09, Oleksii Kurochko wrote:
> On 9/8/26 4:10 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/emulate.c
>>> @@ -0,0 +1,179 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +/*
>>> + * RISC-V instruction emulation for trapped guest accesses
>>> + */
>>> +
>>> +#include <xen/bug.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/types.h>
>>> +
>>> +#include <asm/csr.h>
>>> +#include <asm/current.h>
>>> +#include <asm/emulate.h>
>>> +#include <asm/riscv_encoding.h>
>>> +#include <asm/traps.h>
>>> +
>>> +/*
>>> + * The hardware-reported details of a guest page fault, gathered once by
>>> + * handle_guest_page_fault() and passed down to the emulation of the faulted
>>> + * access.
>>> + */
>>> +struct guest_fault {
>>> +    /* The guest register state as saved on entry to do_trap(). */
>>> +    struct cpu_user_regs *regs;
>>
>> If the comment was true, this could be pointer-to-const.
> 
> I think it can't be pointer-to-const as emulate_load/store functions 
> wants to change PC register after MMIO access emulation is finished to 
> not trap again.

Of course, hence how I started the sentence.

>>> +    /* scause: a fetch, a load or a store/AMO guest page fault. */
>>> +    unsigned long cause;
>>> +    /*
>>> +     * htinst: the trapped instruction in its transformed form, or one of the
>>> +     * special values (zero, or a pseudoinstruction).
>>> +     */
>>> +    unsigned long htinst;
>>> +    /* htval: as written by hardware; see resolve_faulting_gpa(). */
>>> +    unsigned long htval;
>>> +    /* stval: the guest virtual address of the faulting access. */
>>> +    unsigned long stval;
>>> +    /* The faulting guest physical address, filled by resolve_faulting_gpa(). */
>>> +    paddr_t gpa;
>>> +};
>>> +
>>> +/*
>>> + * Is @htinst one of the pseudoinstructions reported for a guest page fault
>>> + * taken on an implicit memory access done for VS-stage address translation?
>>> + *
>>> + * All four values are recognized regardless of the hypervisor's XLEN: the
>>> + * width they encode is that of a VS-stage PTE, i.e. it follows the guest's
>>> + * paging mode (4 bytes for Sv32, 8 otherwise). On RV32 the 64-bit forms
>>> + * simply never occur.
>>> + */
>>> +static bool htinst_is_pseudo(unsigned long htinst)
>>> +{
>>> +    switch ( htinst )
>>> +    {
>>> +    case INSN_PSEUDO_VS_LOAD32:
>>> +    case INSN_PSEUDO_VS_STORE32:
>>> +    case INSN_PSEUDO_VS_LOAD64:
>>> +    case INSN_PSEUDO_VS_STORE64:
>>> +        return true;
>>> +
>>> +    default:
>>> +        return false;
>>> +    }
>>> +}
>>
>> This feels fragile. New pseudo-insns can appear at any time. If the value as
>> a whole is non-zero, aiui the low two bits being zero indicate a pseudo-insn.
>> In which case enumerating pseudo-insns we are currently aware of isn't
>> necessary.
> 
> I will write it simpler	 then:
> 
> /*
>   * Is @htinst one of the special pseudoinstruction values, reported for 
> a guest
>   * page fault taken on an implicit memory access done for VS-stage address
>   * translation?
>   *
>   * It is enough to check only bits[1:0] as according to the spec:
>   *
>   * The value is one of the special pseudoinstructions defined later, all of
>   * which have bits 1:0 equal to 00.
>   */
> static bool htinst_is_pseudo(unsigned long htinst)
> {
>      return htinst && ((htinst & 3) == 0);
> }

And preferably

     return htinst && !(htinst & 3);

to be self-consistent.

>>> +    /*
>>> +     * A guest-page fault may arise due to an implicit memory access during
>>> +     * first-stage (VS-stage) address translation, in which case a guest
>>> +     * physical address written to htval is that of the implicit memory
>>> +     * access that faulted - for example, the address of a VS-level page
>>> +     * table entry that could not be read. (The guest physical address
>>> +     * corresponding to the original virtual address is unknown when
>>> +     * VS-stage translation fails to complete)
>>> +     *
>>> +     * In such cases htinst reports one of the pseudoinstructions recognized
>>> +     * by htinst_is_pseudo(), and the fault requires separate handling (since
>>> +     * G-stage translation failed on an unpopulated/unmapped guest physical
>>> +     * address during a hardware page-table walk). To match bare hardware
>>> +     * behavior, we must inject an access fault of the ORIGINAL access type
>>> +     * (Instruction, Load, or Store/AMO) that initiated the address
>>> +     * translation.
>>> +     */
>>> +    if ( htinst_is_pseudo(gf.htinst) )
>>> +    {
>>> +        inject_access_fault(&gf);
>>> +
>>> +        return;
>>> +    }
>>
>> I.e. you imply that guests won't put their page tables in MMIO? That's
>> fragile imo; I have seen OSes to use video frame buffers for all kinds
>> of (transient) purposes, for example.
> 
> I think it is okay for now and if it will a real use case then an update 
> of this code will be needed.

May I then ask that you leave a remark (maybe even fixme) to this effect?

>>> +    resolve_faulting_gpa(&gf);
>>
>> Since the function is only a stub right now - how is one to tell whether
>> this indeed can never fail?
> 
> It can't be tell. But what is wrong if it could fail? (Actually with 
> current implementation introduced in later patches you can find it can 
> fail if a necessary extension or software page walk isn't introduced).

Well, quite obviously if it can fail, its return value would need checking
here.

Jan

