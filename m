Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F21C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:17:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393632.1632440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwF0S-00086w-H7; Tue, 18 Aug 2026 08:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393632.1632440; Tue, 18 Aug 2026 08:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwF0S-00086p-EG; Tue, 18 Aug 2026 08:17:12 +0000
Received: by outflank-mailman (input) for mailman id 1393632;
 Tue, 18 Aug 2026 08:17:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwF0R-00086j-B3
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:17:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwF0Q-0060oH-HA
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:17:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8414ff-8faa-0a2a0a5109dd-0a2a4502cbae-18
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:17:06 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a841502-6ca4-0a2a45020019-d1558032c9ea-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:17:06 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so28938165e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 01:17:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996188217sm507279205e9.13.2026.08.18.01.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 01:17:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1787041026; x=1787645826; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhipMhwqMcTACvWaNn73WmCch4Fpx+tbx53KKzTxD9Q=;
        b=dYVfV/8gLppSPMJjPlUTgBHa1fVXfPVqHs3O9TVoYMaYdzqmeZv5NY+/2e00GQkpUR
         eFNk8k5VMXT/0TA0lR1hWLT8FcwEtVs4quj/il+F4jOj+bjUjp3dmzvQAbqTyLlHuRJk
         fgZMbuo9NNUI+O6bljg3NPONrSeF9w0DRVkfAV8ei2nH72ShxqLclMG1gaUHlM6J+uCF
         cfY8tMZi95m3V3jGr4JRbi8Mq3PUj2zvckMJfqBsj55uB2YJgiM4FN6UI7Vr46+Pq0NV
         h1AkWm2lHgefPbFPlBKquBfEyQpTguorvHJZEMPGPToxL+I2qEdlva0s/O/UWz0gZ62e
         u6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041026; x=1787645826;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhipMhwqMcTACvWaNn73WmCch4Fpx+tbx53KKzTxD9Q=;
        b=tZ6gAZzJN6b4hUkaF1qMtK7HqD40spv6L4W9IVTQYmZHw89FQAgKPayhh6RQtGjM60
         yesmReroBO5tFjn7OXSTAo6CCx2fqJYGCIB3yxTgv9tHCEg47LccBgGTzbzXdNyJLkeq
         nP7c8w+K3QrBi+qltlKC5dnuYQhsw1/gKU8TaXkUTaRTPdJSTQISx3eY76uZNZZjlBO1
         /aZCxtvc/cgHhju0/lO+6chuPJiWg2XnE5lhLo4XdqRPq1t9jRi6Vbn8/qCmEs7lEATG
         eoLMchD+F70889uRdQGiHJEN2eJXWvmCd/xfYkpku6x9pGbrGyTyTY7qAQjNK2jo1ZmR
         54Ng==
X-Forwarded-Encrypted: i=1; AHgh+RqxSGPvft+Kxl64766ECtoEKos+iTDrLL63x+e1bD/5Bdv/8cSUWFwPEBiIVc+iiKK3TRPbSs9PUPY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw90pPd2uGVHLYNYbn/oTxtygXuVIB8r8zdepJeBJMDjI6Egg6h
	4zGh+vt9HaWQGPFGFdwiyhWodO4rWcP29IStnZNvH7fk7xMqa9AEuGPNby9jfbuTRw==
X-Gm-Gg: AR+sD123EblcHWbu7j0tNG8vFIPedLdCLeR5pZ/fT0L6SgghbculHcHe2UtNlPsgQml
	ByWXGnRLjVM+pNaunS2SugfRWvE2iGDWrXiHTEwvn+5WKgtGcy09YSnsbFjymg4O8OsomOw5x+j
	dYzwPFGPzGzVrNIsc7yuHz96CXNbK3QuB5x8yy857PalsdKB0AOSMdKAGporms8R2SVzvbk5+OT
	g7LcmMGKEAygh5GDy0u38trckJA2wk5/H535nUeMUZ4jD2znA2ygtF7OPQ6kxBHCFgKPVERWo7u
	vB3fIYD6q9U5ay5rma4WLTHzaKz8yxZOu2FUBwxqlSfFBmj5G3QtHY9moMAkDu98UwQALLPcJpg
	4z8iZ8aQv6XDVnC4u+MckuMA8uOLhvNrYckfmYn67Y1Xk84ztw/OVjOaSPyiXHdwglVcdQQnO0H
	v2FkPRl41OQkRDTTcId/Dub9QTcYj6a38XixDgxxNcQK9bXetBiPfSTwkBbvLNYohI/mznTbleo
	NLfIkBoblLA/eoFz62XYXSePzsIr0yyKw3n6Dr0A2Vur4awbyr8
X-Received: by 2002:a05:600c:3485:b0:499:8758:8cb4 with SMTP id 5b1f17b1804b1-49987935eecmr505817515e9.5.1787041025563;
        Tue, 18 Aug 2026 01:17:05 -0700 (PDT)
Message-ID: <2ca3f802-bf93-4714-8a9b-e33ab0c89300@suse.com>
Date: Tue, 18 Aug 2026 10:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/17] xen/riscv: add unprivileged guest memory read
 helper
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <79cfa875e9dfc14bbcad948c20f4008b03d11f72.1784560663.git.oleksii.kurochko@gmail.com>
 <71a226b9-dc03-4a69-beb2-5c4c03b8d09b@suse.com>
 <3c0d33bd-ebab-48df-9ddf-a508e5bed5fe@gmail.com>
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
In-Reply-To: <3c0d33bd-ebab-48df-9ddf-a508e5bed5fe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787041026-67ABD2AC-34359257/0/0
X-purgate-type: clean
X-purgate-size: 5115

On 17.08.2026 17:36, Oleksii Kurochko wrote:
> On 8/12/26 5:30 PM, Jan Beulich wrote:
>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>> Introduce riscv_vcpu_unpriv_read() to allow Xen to safely read guest memory
>>> using HLV/HLVX instructions while reliably capturing trap context.
>>
>> Both for the title and the function name: How does "unprivileged" matter here?
> 
> Unprivileged because HLV/HLVX reads guest memory as if it were accessed 
> from a less-privileged (guest) context, rather than by the hypervisor in 
> HS mode.
> 
> I think I am okay generally to drop "unpriv..." from the function name.
> 
>> The same functions would be use for reading Dom0's memory, wouldn't they?
> 
> Yes, I don't see any issue to let this function to read DomO's memory 
> too. But Dom0 could be counted as "unprivileged" too as it is executed 
> in VS-mode which is less-privileged then HS-mode.

Well, you need to properly distinguish the different cases of "unprivileged"
when writing titles / descriptions. The way you put it in your reply above
("less-privileged (guest)") is sufficiently unambiguous, but what you have
in the title ("unprivileged guest") clearly is a synonym for "DomU".

In the end, as you confirm, "guest" alone is all that's needed here to know
what is being talked about. (That said: We often distinguish "guest" and
"domain", with the former meaning DomU but the latter meaning all domains,
including Dom0 and service domains. Yet for the purpose here I think "guest"
is good to use, not matter that all kinds of domains are meant.)

>>> +    if ( read_insn )
>>> +    {
>>> +        asm volatile ( "\n"
>>> +            "1:\n"
>>> +            "   hlvx.hu %[val], (%[addr])\n"
>>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
>>> +            "   andi %[tmp], %[val], 3\n"
>>> +            "   addi %[tmp], %[tmp], -3\n"
>>> +            "   bne %[tmp], zero, 3f\n"
>>> +            "   addi %[addr], %[addr], 2\n"
>>> +            "\n"
>>> +            "2:\n"
>>> +            "   hlvx.hu %[tmp], (%[addr])\n"
>>> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
>>> +            "   sll %[tmp], %[tmp], 16\n"
>>> +            "   add %[val], %[val], %[tmp]\n"
>>> +            "3:\n"
>>> +        : [val] "=&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr)
>>> +        : [ti] "r" (trap) : "memory" );
>>
>> You want to tell the compiler that *trap is written. Instead I don't see
>> why a memory clobber would be needed: You access a different address space,
>> i.e. nothing the compiler can make any assumptions about.
> 
> memory clobber tells the compiler that the assembly code performs memory 
> reads or writes to items other than those listed in the input and output 
> operands and so I don't tell here that *trap will be changed.
> 
> Why this understanding is wrong?

You can (ab)use "memory" for that purpose, but why would you when you can
properly express the operand? All that achieves is the compiler possibly
having to emit less efficient code.

> Alternative, I think, could be:
>          : [val] "+r" (val), "+m" (*trap)
>          : [addr] "r" (guest_addr), [ti] "r" (trap) );
> And then memory clobber could be dropped.
> 
> 
> 
>>
>> You also need to take precautions for not returning an uninitialized "val".
>> I think the variable wants initializing (perhaps to ~0) and "+r" wants
>> using as constraint. (Afaik & isn't necessary to use together with +.)
> 
> I agree with '+' if we will initialize val with some value.
> 
> Regarding, '&' my understanding is that I have to use it always when

When what exactly? If an operand is both input and output, how could the
compiler re-use the (generally) register for any further purpose? '&'
indicates to the compiler that it may not use the register used for an
output to hold some input's value, as that value may be lost by the time
the input is actually consumed.

>>> +        /*
>>> +         * Although HLVX instructions' explicit memory accesses require execute
>>> +         * permissions, they still raise the same exceptions as other load
>>> +         * instructions, rather than raising fetch exceptions instead.
>>> +         */
>>> +        if ( trap->scause == CAUSE_LOAD_PAGE_FAULT )
>>> +            trap->scause = CAUSE_FETCH_PAGE_FAULT;
>>> +    }
>>> +    else
>>> +    {
>>> +        asm volatile ( "\n"
>>> +            "1:\n"
>>> +#ifdef CONFIG_RISCV_64
>>> +            "hlv.d %[val], (%[addr])\n"
>>> +#else
>>> +            "hlv.w %[val], (%[addr])\n"
>>> +#endif
>>
>> Once again please use enough care that RV128 would at least obviously fail to
>> build, rather than building something which then doesn't work.
> 
> Sure, I will do the following:
> 
> #if defined(CONFIG_RISCV_64)
>              "hlv.d %[val], (%[addr])\n"
> #elif defined(CONFIG_RISCV_32)
>              "hlv.w %[val], (%[addr])\n"
> #else
>               #error "unsupported RISC-V variant: no hlv for a machine word"
> #endif

And that, as before, without indenting #, please.

Jan

