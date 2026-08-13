Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB6FC5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 07:16:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389469.1630174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuPfJ-00063C-6O; Thu, 13 Aug 2026 07:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389469.1630174; Thu, 13 Aug 2026 07:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuPfJ-000635-3T; Thu, 13 Aug 2026 07:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1389469;
 Thu, 13 Aug 2026 07:15:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuPfH-00062z-PZ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 07:15:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuPfH-00C86Q-67
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:15:47 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d6f22-2eae-0a2a0a5409dd-0a2a450bbf40-6
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 09:15:47 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d6f22-b7e8-0a2a450b0019-d1558030c903-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 09:15:47 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so2384835e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 00:15:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998212a3a1sm38823815e9.6.2026.08.13.00.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 00:15:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1786605346; x=1787210146; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLelFGhfhRKesr9TWUjL/w6WQht4LGUF6dac6pMJHt0=;
        b=DfgXWkEW3X6HLBDkycQy677dnS76OtiqdfWPKgqScH+QEIh/wFv/79m3tQNce8gNi8
         66YUaaHYyI//GzQzg6Se4KncaO7hleNAq9cPXom6NTMsdIRAxmbbauJ9/A0UtfaHGRnP
         17Q2fAbCJ0KWOVSVU5mLalXKc7ey2rB3yebTcnBd3mskCQAjmKY66+zQIopERt1S1k1f
         t3zhXWMpcWk+3GStPUWL3/GyAos5ELzuES31cAjXvrewEoFql7rf5hXPfTSD/cE38alv
         YGDvK4oUI4IEjV9gpA4QkJE19wz/3cm0lvvopjMNCjnYtOYGMk35TuXV3H5VSn5FcDpe
         tpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786605346; x=1787210146;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLelFGhfhRKesr9TWUjL/w6WQht4LGUF6dac6pMJHt0=;
        b=SlxT99kMB3ezKokGucd/H7Okxf6a9+IKJ2knN9pJtaDoTw9qzP8o4ZdWX59OHMPZMv
         HQ7bKjqO6zb2FDFtvPLrHsa4qDpS+4H5K7J6aKTW8k2nk2OzP8VxiEq2bc4G/X+xg9Tu
         baUV7jzi7oa6O242dn70xWxKZXF0Hu141kEKHsxGE+XZ9ch5fRrBdh9sgmG+Qf2qOFMF
         VdPacmMedTpsRR1lUuQ8JYrynrX/yXPctV04beWzFP3nfpTiJGcvsSR8pctFtyl13Xx4
         i+6TWyPuy+PRXVgChpTZ2i/ygBEEC5Hoe3LOLg0edVZdhW64hiy84waF7ErhBDrYDZgM
         5Tvw==
X-Forwarded-Encrypted: i=1; AHgh+Rprrex1ta/hXjdNpmcl/scqmctyquZuclokhdkM/LpiXfB86S6Kp9yjPwu3qDakGQasYLx/XeYKUb0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd/pTRwCdyAx/6SY7/uY7XxvUo9z4C8bfAaALKB1P+R1RXQvjg
	xL3cfiOnA8yw3s3SwjVyZy/Mobdbk4WWY8cbmnycMC2FSCzFtGrC1CaccQG7GvkuUQ==
X-Gm-Gg: AR+sD10t9p3gNY81yx9jkLnrbGGdUGcBvAxK2sSbx5qejSlTnwVoQTFDBw8ma/DUSGl
	IohxaUAE0/4JC/J4POHSpy2etSgKsGr2IKJ8kfwzdzIy1wSWNRK3E5LndX8CuGhEXVAiNLvNeoz
	y/SC9ig5Rkf+LcA0CQVYgv50qS1eo+GMXhgBnT7/RTXxSNYlJOXdzH/j2VnwnWudl+UZ1FVRQDW
	6S7WCasG1AzfagyXp8uNLqd4mDKkSI4qtn/rLHt/R8UhhahgrHKZZp+zGUyTh778GBKoqCazs3x
	Y5a6hC2duVG+GyRXRnw0M2fF201Osbbik2geGuhzIXakGpc9aCaBIK/j0KpyVNJOIcM8cZ+JauE
	Bu1eRSaIepBZFFuz/tWL80/NYLN9ZAJYOiWN32+pOJCbuqGZxrgztOeTn4nsgt0yraaqARbaTox
	pOx2xJcI4WH8yqEd2nyLvLDGIDSE9VijJDqgUrqKRwY+nomBSEyrCUlmQD/coGRI2+ZopbSKZGS
	RMj88OZ59mT/NgkkQOj9CQ5zMEyhaweW2Bx3Wnc/2/FVESE6+6j+Mb/7Q==
X-Received: by 2002:a05:600c:4e4c:b0:499:726c:50e with SMTP id 5b1f17b1804b1-499821f9223mr42700255e9.14.1786605346428;
        Thu, 13 Aug 2026 00:15:46 -0700 (PDT)
Message-ID: <7a2e46da-5b1f-448e-aba3-7eefe0a61950@suse.com>
Date: Thu, 13 Aug 2026 09:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/17] xen/riscv: add guest load emulation for trapped
 MMIO accesses
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
 <9b18a20367754605efd6a6b5bf09d4483d9c3ab2.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9b18a20367754605efd6a6b5bf09d4483d9c3ab2.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1786605347-1A4DB9EA-D2945707/0/0
X-purgate-type: clean
X-purgate-size: 9446

On 29.07.2026 15:40, Oleksii Kurochko wrote:
> Introduce emulate_load() to decode and emulate guest load instructions
> that fault due to MMIO accesses. This provides the basic infrastructure
> required for MMIO emulation on RISC-V.
> 
> The instruction decode (decode_trapped_insn() and the mask/match chain
> for standard and compressed load encodings) is adapted from Linux's KVM
> RISC-V implementation. The completion path differs from KVM's,
> since Xen dispatches MMIO synchronously to an in-hypervisor handler via
> try_handle_mmio() and has no userspace exit/return step equivalent to
> KVM's kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
> split.
> 
> A fault taken while re-reading the trapped instruction is handled
> depending on the faulting translation stage:
>  - A VS-stage fault is the guest's own fault (e.g. it modified its page
>    tables from another vCPU) and, as in KVM, is redirected to the
>    guest's trap vector, with the cause remapped to
>    CAUSE_FETCH_PAGE_FAULT since HLVX reports execute-permission failures
>    as load faults.
>  - A G-stage fault would mean the P2M mapping of the instruction page
>    disappeared after the instruction was fetched. KVM must handle this
>    by resuming the guest and retrying, as Linux MM can invalidate
>    G-stage mappings at any time. Xen does not remove P2M mappings of a
>    running domain at the moment, so this case is asserted unreachable with
>    BUG_ON(); it will need to be revisited once such removal is implemented.

I don't see why this cannot be implemented correctly right away. The behavior
should be that of an access to unpopulated space on bare hardware, whatever
that behavior is on RISC-V.

> @@ -13,6 +14,11 @@ struct trap_info {
>      register_t stval;
>  };
>  
> +static inline bool is_load_guest_page_fault(unsigned long scause)
> +{
> +    return (scause == CAUSE_LOAD_GUEST_PAGE_FAULT);
> +}

Is something like this really a useful wrapper to have? It doesn't really
shorten anything, nor does (imo) it aid readability.

> @@ -191,6 +193,11 @@ static void timer_interrupt(void)
>      raise_softirq(TIMER_SOFTIRQ);
>  }
>  
> +static always_inline void advance_pc(struct cpu_user_regs *regs, int step)

See my earlier remark regarding always_inline. Also - why plain int? Are
there (going to be) cases where PC is moved backwards (in which case
"advance" isn't suitable naming)?

> +{
> +    regs->sepc += step;
> +}
> +
>  static always_inline unsigned long get_faulting_gpa(void)
>  {
>      /*
> @@ -210,9 +217,162 @@ static always_inline unsigned long get_faulting_gpa(void)
>      return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
>  }
>  
> +/*
> + * Determine the trapped instruction which caused a guest MMIO trap.
> + *
> + * Returns true if the trap was redirected to the guest, in which case
> + * the caller must stop emulation and return success. Otherwise *insn
> + * and *insn_len are filled in and the caller should continue decoding.
> + */
> +static bool decode_trapped_insn(unsigned long htinst, unsigned long *insn,
> +                                unsigned int *insn_len)
> +{
> +    if ( htinst & 0x1 )
> +    {
> +        /*
> +         * Bit[0] == 1 implies trapped instruction value is
> +         * transformed instruction or custom instruction.
> +         */
> +        *insn = htinst | INSN_16BIT_MASK;
> +        *insn_len = (htinst & BIT(1, UL)) ? INSN_LEN(*insn) : 2;

In the if() you don't use BIT(), while here you do. Please be consistent.

Why the use of INSN_LEN(), when due to the earlier assignment it'll always
yield 4 here?

Finally, how would the caller know whether it looks at a transformed insn
or (as fetched below) a "normal" one?

> +    }
> +    else
> +    {
> +        struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);

Pointer-to-const.

> +        struct trap_info utrap = { 0 };

Just {} please.

> +        /*
> +         * Bit[0] == 0 implies trapped instruction value is
> +         * zero or special value.
> +         */

How come you get away without dealing with pseudoinsns? The insn pointed at
by regs->sepc is of no interest for faults caused by implicit memory accesses
originating from VS-stage address translation.

> +        *insn = riscv_vcpu_unpriv_read(true, regs->sepc, &utrap);
> +        if ( utrap.scause )
> +        {
> +            /*
> +             * A G-stage fault here would mean the P2M mapping of the page
> +             * containing the trapped instruction disappeared after it was
> +             * fetched.

Does it? What about, again, faults from VS-stage address translation while
hardware was trying to fetch an insn? That is ...

> Nothing removes P2M mappings of a running domain yet,
> +             * so this cannot happen.

... the necessary P2M mapping may never have been there.

> +             * TODO: Revisit once P2M mappings can be removed at runtime.
> +             */
> +            BUG_ON(is_load_guest_page_fault(utrap.scause));
> +
> +            utrap.sepc = regs->sepc;
> +            utrap.stval = utrap.sepc;

How do you know the fault was at .sepc? A 32-bit insn crossing a page boundary
(implying the C extension is available) may well fault only on its higher half.

> +            riscv_vcpu_trap_redirect(&utrap);
> +
> +            return true;
> +        }
> +
> +        *insn_len = INSN_LEN(*insn);
> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * Check alignment and dispatch a decoded MMIO access to a registered
> + * handler. On success (0), info->data holds the read value for loads.
> + */
> +static int do_mmio(mmio_info_t *info, unsigned long fault_addr,
> +                   unsigned int len)
> +{
> +    /* Fault address should be aligned to length of MMIO */
> +    if ( fault_addr & (len - 1) )
> +        return -EIO;
> +
> +    info->gpa = fault_addr;
> +    info->len = len;
> +
> +    switch ( try_handle_mmio(info) )
> +    {
> +    case IO_HANDLED:
> +        return 0;
> +    case IO_ABORT:
> +        return -EIO;
> +    default:
> +        return -EOPNOTSUPP;
> +    }
> +}

And there's no indication of "retry needed", e.g. when something changed
between find_mmio_handler() and handle_{read,write}()?

Also, nit: Blank lines please between non-fall-through case blocks.

>  static int emulate_load(unsigned long fault_addr, unsigned long htinst)
>  {
> -    return -EOPNOTSUPP;
> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
> +    mmio_info_t info = { .is_write = false };
> +    unsigned long insn;
> +    unsigned int shift = 0, len, insn_len;
> +    bool is_unsigned = false;
> +    int rc;
> +
> +    if ( decode_trapped_insn(htinst, &insn, &insn_len) )
> +        return 0;
> +
> +    /* Decode length of MMIO and whether it is a sign- or zero-extending load */
> +    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
> +        len = 1;
> +    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
> +    {
> +        len = 1;
> +        is_unsigned = true;
> +    }
> +    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
> +        len = 2;
> +    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
> +    {
> +        len = 2;
> +        is_unsigned = true;
> +    }
> +    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
> +        len = 4;

Already up to here this demonstrates a weakness of the INSN_MASK_*
set of #define-s (which I similarly observe in binutils, and I expect it
all has the same questionable origin). All INSN_MASK_L* and INSN_MASK_FL*
(also INSN_MASK_S* and INSN_MASK_FS*) are identical, allowing for a nice
switch() to be used here in principle. That said, with access width
nicely encoded in FUNCT3, it's not even clear whether a switch() would
end up being needed / efficient.

Otoh none of these masks cover the pseudoinsns that htinst may supply.

Further, what about A-extension insns? Some (if not all) of them can
plausibly be used on MMIO, I think.

> +#ifndef CONFIG_RISCV_32
> +    else if ( (insn & INSN_MASK_LWU) == INSN_MATCH_LWU )

First: Better use IS_ENABLED() in favor of #if{,n}def, whenever possible.
And then this depends not only on CONFIG_RISCV_32, but also on guest
bitness.

> +    {
> +        len = 4;
> +        is_unsigned = true;
> +    }
> +#endif
> +    else if ( (insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW )
> +    {
> +        len = 4;
> +        insn = RVC_RS2S(insn) << SH_RD;
> +    }
> +    else if ( (insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
> +              RV_X(insn, SH_RD, 5) )
> +        len = 4;
> +#ifndef CONFIG_RISCV_32
> +    else if ( (insn & INSN_MASK_LD) == INSN_MATCH_LD )
> +        len = 8;
> +    else if ( (insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD )
> +    {
> +        len = 8;
> +        insn = RVC_RS2S(insn) << SH_RD;
> +    }
> +    else if ( (insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
> +              RV_X(insn, SH_RD, 5) )
> +        len = 8;
> +#endif
> +    else
> +        return -EOPNOTSUPP;

Because you don't permit F/D/Q for guests (yet), FL* and FS* aren't
covered, I expect? I wonder how easy it is going to be to spot the places
needing adjustment once support is to be added. Same perhaps for Zilsd in
RV32 guests.

Jan

