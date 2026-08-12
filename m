Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034EEC5B572
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 15:31:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389181.1630077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuAuu-0003IG-7D; Wed, 12 Aug 2026 15:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389181.1630077; Wed, 12 Aug 2026 15:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuAuu-0003I9-3a; Wed, 12 Aug 2026 15:30:56 +0000
Received: by outflank-mailman (input) for mailman id 1389181;
 Wed, 12 Aug 2026 15:30:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuAus-0003I3-5c
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 15:30:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuAur-00AUpW-Ey
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 17:30:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c9198-e002-0a2a0a5209dd-0a2a450acf38-42
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 17:30:53 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c91ad-f2d2-0a2a450a0019-d1558033bc49-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 17:30:53 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so9743915e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 08:30:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997c993d80sm59444825e9.12.2026.08.12.08.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 08:30:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1786548653; x=1787153453; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++9KTmKDTg9+8nnz6QZjHaF1GiqpVBV0WUi+TZWe2Fo=;
        b=TqkLfpryVaPCXSTESHGrmo3PJDhc5L5vSmFaD5Qivh03IBgzfZiH3ryjCwrCO2pJq5
         9DwzEGeYRWOxiFwXBOkKkS/1IYTR3ts09EVQ/n9ArCTeyQszGl2/5WqnOBIt1pD8/GOh
         5FPqIR293qTzY1gfbK8s4Lo/hEHZtRsKv+zyLNP0gcwsKJH8BziNTw6KABWxd1kYzrk7
         RH2zCgYa8h89jDCilsNNbMsgr+Bh/ba1bu/xJQW/3cP+gOB/WTiodIV44K8r4oACZH4D
         UXPFiuOFlSF/oTI15plR0vA0G6N7OToVTtBsGnNkaeIOIW43I/+ByhBwspnP0P6x+exQ
         VSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548653; x=1787153453;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++9KTmKDTg9+8nnz6QZjHaF1GiqpVBV0WUi+TZWe2Fo=;
        b=OY4YC3Gay9GRkz8BfemwKCTJijwhOxXRuaEzZc5UWtFAEpCtko6XzpHDdwEJejz8v8
         FlNy9VkGlBCVG3V8jCpGRcbcU91AnaMxGcc7O9s8IpEP/2x+zOlQvQhXZGl79rhUlavN
         xCHfFme2GVaDfVTkTtwt4QHKkRS5u1x4s9p5IFh+A2+/LKRYBTPTKPLe6hedqpOGVPU/
         bur9f0ykTKNO9AHLgGm1jWxqMC1xAH578MfERkgGFolAGx8J6E/ktUqh0aqacfmei5mt
         qJn/VCB7hRScNFPLflXep0lyhMdsulUMjtTu/DCPPdV2GYatN3ytsZLdSarAlINt3vlL
         2lgg==
X-Forwarded-Encrypted: i=1; AHgh+RrjtGGF4ciFDEzyT48zCnWRHQSrseco4irmzUU+L1a0+uDjijy1R2atLC7cniCzIOkuqGmKRz87GLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz5V6WcSYLzDe3jElmYCgdjkDUvEToa++vZpj9Z2d6n2iqagpC
	rsiei5BpZHNUrZNHWo6Yuk7wo4GUMXxoODszh9WjLuPHH3EF2ZW30e1PruX+BEyhGg==
X-Gm-Gg: AR+sD104iyRUQ9fzO+M/DXn1EXA2KK3G4EqJzShsdEX9y6MWA3kbUB3nvCEjgu97oYZ
	9vHUOmTkteYTjGApE6EyxrQpm0JBv2TFX1Px3WgpnsiIDQ9d+KUxFl2cbEc/MItwdlpFtEyK2tw
	GLm/JX6q+/GCdfg6LAXxfDABSu3jHNqvMjxO435WVgK+JJbqJRfbf0SjO0/2gAF52wIJA54xDk7
	VMtvtlgzH0cX3zZhVeudP7gjtq/jd8sQwhxuOgOsv31l2bMJHzT9irB7dmqw8gDIr7PkoQXbwuX
	t9LRUi2zx9p1DR/qoDQD8yjTWgwUqM1QVwmGNH20La3/vvjvr7O1VhO/zxvxkkypCgz//lgjF5u
	HL+zPyAXYQBz9e2PTM0dSJ2pBDN/0U/dSu5ZNzhChUDfR+nf9IMpXbNAghbhtVP98HO8QY9gEZl
	q4Dfb2GUn82YE46HpnP7aCcG3Zqqt1EhnVp6wiGFSvxk8XXkDMmJ1E2P+xwhVVsWHnVTkvfeDkI
	0yhM86oSOmNC+jPdqPb8D1KrgM3zgnu2hy5U/fQTFllxklAPt8FHSpxBMhmz7qO
X-Received: by 2002:a05:600c:8209:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-4997c13dd74mr88790695e9.12.1786548652683;
        Wed, 12 Aug 2026 08:30:52 -0700 (PDT)
Message-ID: <71a226b9-dc03-4a69-beb2-5c4c03b8d09b@suse.com>
Date: Wed, 12 Aug 2026 17:30:50 +0200
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
In-Reply-To: <79cfa875e9dfc14bbcad948c20f4008b03d11f72.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1786548653-4A9D9CFC-449D4E97/0/0
X-purgate-type: clean
X-purgate-size: 5806

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> Introduce riscv_vcpu_unpriv_read() to allow Xen to safely read guest memory
> using HLV/HLVX instructions while reliably capturing trap context.

Both for the title and the function name: How does "unprivileged" matter here?
The same functions would be use for reading Dom0's memory, wouldn't they?

> @@ -114,3 +115,93 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
>      return copy_guest(buf, gpa, len, GPA_INFO(d),
>                        COPY_to_guest | COPY_gpa);
>  }
> +
> +/*
> + * Read machine word from Guest memory
> + *
> + * @read_insn: Flag representing whether we are reading instruction
> + * @guest_addr: Guest address to read
> + * @trap: Output pointer to trap details
> + *
> + * The hlv/hlvx instructions translate guest_addr through the live
> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
> + * space of the currently running vCPU.
> + */
> +unsigned long riscv_vcpu_unpriv_read(bool read_insn,
> +                                     unsigned long guest_addr,

Personally for such a function I'd expect the address to be the main (first)
parameter.

> +                                     struct trap_info *trap)
> +{
> +    unsigned long val, tmp;
> +    unsigned long flags, old_hstatus;
> +
> +    /*
> +     * As hstatus is going to be changed we don't want an interrupt to occur
> +     * with guest's hstatus register.
> +     */

I don't think "guest's hstatus register" is something real. hstatus is
entirely the hypervisor's register, controlling the guest.

> +    local_irq_save(flags);
> +
> +    /*
> +     * The hypervisor virtual-machine load and store instructions are valid
> +     * only in M-mode or HS-mode, or in U-mode when hstatus.HU=1. Each
> +     * instruction performs an explicit memory access as though V=1; i.e.,
> +     * with the address translation and protection, and the endianness,
> +     * that apply to memory accesses in either VS-mode or VU-mode.
> +     * Field SPVP of hstatus controls the privilege level of the access.
> +     * The explicit memory access is done as though in VU-mode when SPVP=0,
> +     * and as though in VS-mode when SPVP=1.
> +     *
> +     * So it is necessary to restore vCPU's hstatus before execution of
> +     * hlv* instruction.
> +     */
> +    old_hstatus = csr_swap(CSR_HSTATUS,
> +                           vcpu_guest_cpu_user_regs(current)->hstatus);

As you're limiting use of the function to the current vCPU, why would hstatus
need fiddling with? The fields of interest aren't being altered between exit
from guest and making it here, are they?

Without that IRQs also wouldn't need turning off (what about NMIs, btw, once
supported on Xen?), which would help real-time use cases (latency here can
otherwise be affected by guests, by wait of forcing exceptions to be raised).

> +    if ( read_insn )
> +    {
> +        asm volatile ( "\n"
> +            "1:\n"
> +            "   hlvx.hu %[val], (%[addr])\n"
> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])

Imo labels used for extable entries would better live on the same line as
the insn they mark.

> +            "   andi %[tmp], %[val], 3\n"
> +            "   addi %[tmp], %[tmp], -3\n"
> +            "   bne %[tmp], zero, 3f\n"

Use BNEZ?

> +            "   addi %[addr], %[addr], 2\n"
> +            "\n"
> +            "2:\n"
> +            "   hlvx.hu %[tmp], (%[addr])\n"
> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
> +            "   sll %[tmp], %[tmp], 16\n"
> +            "   add %[val], %[val], %[tmp]\n"

May I suggest OR instead of ADD?

> +            "3:\n"

If this is an insn wider than 32 bits, you won't have fetched all of it.
I think you want to at least add a comment here indicating that e.g. it's
the callers responsibility to deal with that. (How they would do that is
entirely unclear to me, as they can't simply invoke this function again
passing guest_addr + 4.)

> +        : [val] "=&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr)
> +        : [ti] "r" (trap) : "memory" );

You want to tell the compiler that *trap is written. Instead I don't see
why a memory clobber would be needed: You access a different address space,
i.e. nothing the compiler can make any assumptions about.

You also need to take precautions for not returning an uninitialized "val".
I think the variable wants initializing (perhaps to ~0) and "+r" wants
using as constraint. (Afaik & isn't necessary to use together with +.)

> +        /*
> +         * Although HLVX instructions' explicit memory accesses require execute
> +         * permissions, they still raise the same exceptions as other load
> +         * instructions, rather than raising fetch exceptions instead.
> +         */
> +        if ( trap->scause == CAUSE_LOAD_PAGE_FAULT )
> +            trap->scause = CAUSE_FETCH_PAGE_FAULT;
> +    }
> +    else
> +    {
> +        asm volatile ( "\n"
> +            "1:\n"
> +#ifdef CONFIG_RISCV_64
> +            "hlv.d %[val], (%[addr])\n"
> +#else
> +            "hlv.w %[val], (%[addr])\n"
> +#endif

Once again please use enough care that RV128 would at least obviously fail to
build, rather than building something which then doesn't work.

> +            "2:\n"
> +            ASM_EXTABLE_TRAP_INFO(1b, 2b, %[ti])
> +        : [val] "=&r" (val)
> +        : [addr] "r" (guest_addr), [ti] "r" (trap) : "memory" );
> +    }
> +
> +    csr_write(CSR_HSTATUS, old_hstatus);
> +
> +    local_irq_restore(flags);
> +
> +    return val;
> +}
For both reads and fetches - are there no alignment constraints at all on the
incoming guest_addr?

Jan

