Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF60C982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 12:12:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427402.1650099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cso-00056A-5Z; Mon, 21 Sep 2026 12:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427402.1650099; Mon, 21 Sep 2026 12:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cso-000563-2Z; Mon, 21 Sep 2026 12:12:30 +0000
Received: by outflank-mailman (input) for mailman id 1427402;
 Mon, 21 Sep 2026 12:12:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8csn-00055e-0T
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:12:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8csm-00CN3C-DY
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:12:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab11f1e-bab6-0a2a0a5309dd-0a2a450bc24c-22
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:12:24 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab11f28-b7e8-0a2a450b0019-4a7de18d83c3-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:12:24 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b965f447cso24210555e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 05:12:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd10d21asm278602195e9.12.2026.09.21.05.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 05:12:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1789992744; x=1790597544; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1icWTVR4aykELK2fSXaTK/2jheqnZdDIm5jSa+FsCB4=;
        b=ekR9soY4+xWfP4y/qt3kCZf4SeYOGrLIdPC4i5xao6wUz8gLT4qytMBOPMophkXTyX
         0BAbEX50OfxZ4AAehXO+7nF8neB7PR9fSkAk9Z3Ej+qyIOrz/oxmlhmZFldORDyhSeWq
         nb+uU7X/63l/qmnZ5+63JUEwS60aue6+46HsdHDHUW0mB4d3gc4nMl/vtMdEes+H13Gf
         Avo64GuI8BsiQVTxsa45llPAlNkz2owA6uqQUGYSw2VEbN8M+sGQatTPrk3aXw6bE7qi
         +24ahR0f51xNl/n6Xbk2V5FAmmX2aD6mOZlr4pBse1QLcJpJ8cs1If7550FBoLp8Cvxt
         QyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992744; x=1790597544;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1icWTVR4aykELK2fSXaTK/2jheqnZdDIm5jSa+FsCB4=;
        b=HFB11JwySPdgYwPY0/Z9K1gFI5NdfZe+t5uQ4A99SFhskO2wUF+YJHOBmodHOjHi3C
         foIonvln8yvzA7nb32UeRDr6C602nAAxixUAuz8lQx2P1pAkbcm3a3AQjNz2ySMadmRP
         RpVQ4NtCURDwJ4hutxhSXvbMRIYSozIRJY/algxsLnBjE8/NSlRQxxrPrnc3liihOHim
         B2oPU4vltMFv3e+7MnzX28+BlMe8VN96BH+NT8Cjh5j1MUV8R4fY3aohdY7j/J2zHUzX
         fWqDMv3CSUhEPB0/ALECap2OhRaYbQsGk9Xa1Fbkhmc5qXgHtp6eTGJOYxpurbEqtl+z
         Q54Q==
X-Forwarded-Encrypted: i=1; AKwUvByfTp0zhIV+rM4seQuX4itmy68b8OFhekfF/ZGjq1IxvVgigub7G+ua1J8eS5V8CEqEuF5k66yzrTg=@lists.xenproject.org
X-Gm-Message-State: AFuF++nOfED5EIkG65t3gEZcgr38nSMJaSOOycesq259DYy3pmNtVhPP
	pjutKa4dD2CW9V3bbbIaf6QlLoMTkqRQrKNj1XssEBFIxIPYAW8SbgO0DfnKm1Acbw==
X-Gm-Gg: AYBFou2qzhtFa02mWfk71U4o6CiW2r5mHZsCiGk94h7/vmexOT+vlOQGcBnjz7dQ1ng
	3smTLPdJTPh5OWDZPQxmlCBwX4EL5E6RZpVC5TaxwHz9xBPnBO5jg5zsnQH/pVJyjy9iGX/TCAu
	bqheA4cX++YrJrLaG1jaMtUZCHtXOIAvLJvOEne/885Zbbhbg6We2RtReV91TM+Xq7STS3wp4wQ
	z3zQ01IujyjJ4Y1deHNl9PbX++H6+2UrDzIN6KF9B3hdZddqX69CHZH/08z6czQfTPczhGqz2mT
	h3Vb0X2gFGqbfoJUhdelqmeokafXmzk4IoAZnFJiHxCPoHBtWN90SdC+XloNQeZAJAO4vPEuhEF
	aJo6gTu9Q6G9zkD74mPyHB//xFWLJslUTgr0AgqC6eOD3g9tS2STDSDRFcqSwtdI8XEybRmjcwt
	MrgMEgH0AdTW7G5g6CHNrKjamblFU2s1i7KZVBuuWyfa93mbQwDHwXuP4ZFyafNeiLXUFktpvL7
	MWFQYo2Wax8TBFuG+rUoTIknx737/aq17edlXPg0tXSLHxD/jctp1fLKxZ7QQ==
X-Received: by 2002:a05:600c:1d25:b0:49f:d753:3de9 with SMTP id 5b1f17b1804b1-49fd7533df5mr9117195e9.33.1789992743901;
        Mon, 21 Sep 2026 05:12:23 -0700 (PDT)
Message-ID: <8dbc4ba6-bf92-4e9f-b4b6-7286d5a96443@suse.com>
Date: Mon, 21 Sep 2026 14:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/39] xen/riscv: implement continue_new_vcpu()
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
 <a282887cc08cd9b05f59d46cab9377915e83c61d.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a282887cc08cd9b05f59d46cab9377915e83c61d.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789992744-1A2C49EA-84EE93AE/0/0
X-purgate-type: clean
X-purgate-size: 6208

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> continue_new_vcpu() is the arch hook invoked the first time a freshly
> created vCPU is scheduled. Implement both cases it has to cover:
>  - for the idle vCPU, switch to its own stack and jump to idle_loop();
>  - for a guest vCPU, restore hstatus and enter the guest through the new
>    return_to_new_vcpu() path in entry.S, which loads sepc, passes the
>    hart id in a0 and the DTB address in a1 as expected by the RISC-V
>    boot protocol, sets sstatus.SPP and executes sret.

Is this a requirement for all CPUs, or just for the boot one? (I can't
quite see why secondary processors would need passing a DTB address.)

> Interrupts have to stay disabled across the restore. The trap entry
> logic implicitly clears hstatus.SPV, so an interrupt taken between the
> write of hstatus and sret would make sret return to HS-mode instead of
> VS-mode, and restoring SPV afterwards is non-trivial. Instead interrupts
> are simply kept off and sstatus.SPIE is set, so that SIE is restored from
> SPIE once sret has been executed.

As written this reads as if the guest would be responsible for doing this.
Isn't it rather SRET itself which does this?

> Also, it follows what hardware will do
> with real CPU which is also started with interrupts disabled.

Further up, aiui, you talk about the host's interrupt state. How vCPU-s
are started, however, is virtual interrupt state. Mixing both isn't
very helpful.

> Introduce get_cpu_info() and reset_stack_and_jump() in asm/current.h,
> needed by the above. get_cpu_info() is a macro rather than a static
> inline because asm/current.h is pulled in by <xen/percpu.h> before
> this_cpu() is defined and before <xen/sched.h> completes struct vcpu.

This is odd, given the similarity to Arm. They get away without using
"current", and hence without using this_cpu().

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -8,10 +8,13 @@
>  #include <xen/smp.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/aia.h>
> +#include <asm/aplic.h>
>  #include <asm/bitops.h>
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/current.h>
> +#include <asm/imsic.h>
>  #include <asm/intc.h>
>  #include <asm/mmio.h>
>  #include <asm/riscv_encoding.h>

What makes these additions necessary here?

> @@ -140,9 +143,43 @@ static void vcpu_csr_init(struct vcpu *v)
>      v->arch.hie = MIP_SGEIP;
>  }
>  
> +static void schedule_tail(struct vcpu *prev);
> +static void noreturn idle_loop(void);
> +void noreturn return_to_new_vcpu(void);

For this last one: asmlinkage?

>  static void continue_new_vcpu(struct vcpu *prev)
>  {
> -    BUG_ON("unimplemented\n");
> +    schedule_tail(prev);
> +
> +    if ( is_idle_vcpu(current) )
> +        reset_stack_and_jump(idle_loop);
> +    else

This is the kind of "else" which I consider particularly confusing: It
suggests that the if() body can actually be exited at the bottom, when
(by the name "reset_stack_and_jump") it hopefully cannot.

> +    {
> +        /*
> +         * During a context switch to a new vCPU, interrupts must be disabled
> +         * to guarantee that the vCPU's CSR state can be safely restored into
> +         * the hart without being clobbered by an interrupt trap.
> +         *
> +         * For example, when return_to_new_vcpu() finishes, it executes sret.
> +         * At that point, the hart checks hstatus.SPV=1 and sstatus.SPP=1 in
> +         * order to return from HS-mode into VS-mode. If an interrupt were to
> +         * arrive before sret, the trap entry logic would implicitly clear
> +         * hstatus.SPV to 0. Correctly restoring it afterwards is non-trivial,
> +         * and if left as 0, sret would incorrectly return to HS-mode instead
> +         * of VS-mode.
> +         *
> +         * To avoid this, interrupts are kept disabled during the restore.
> +         * Additionally, setting sstatus.SPIE=1 ensures that after sret is
> +         * executed (as sstatus.SIE will be loaded from SPIE), HS-mode will
> +         * continue to receive interrupts normally.
> +         */
> +        local_irq_disable();
> +        csr_set(CSR_SSTATUS, SSTATUS_SPIE);
> +
> +        csr_write(CSR_HSTATUS, vcpu_guest_cpu_user_regs(current)->hstatus);
> +
> +        reset_stack_and_jump(return_to_new_vcpu);

What are the criteria by which you split CSR accesses between doing some here
and some in return_to_new_vcpu()? In particular you set sstatus.SPIE here but
sstatus.SPP there, when both could - I think - be done with a single CSR
access.

> --- a/xen/arch/riscv/entry.S
> +++ b/xen/arch/riscv/entry.S
> @@ -143,3 +143,26 @@ FUNC(__context_switch)
>  
>          ret
>  END(__context_switch)
> +
> +/* t0 is used as a temporary reg and is clobbered to oblivion */
> +FUNC(return_to_new_vcpu)
> +        /* Swap tp with sscratch */
> +        csrrw   tp, CSR_SSCRATCH, tp

What is this about? I'm not aware of any counterpart code, yet all on its
own this I can't see it being overly useful.

> +        /* Set vCPU registers */
> +        REG_L   t0, CPU_USER_REGS_SEPC(sp)
> +        csrw    sepc, t0
> +
> +        /* Hartid goes to a0 */
> +        REG_L   a0, CPU_USER_REGS_A0(sp)
> +
> +        /* DTB goes to a1 */
> +        REG_L   a1, CPU_USER_REGS_A1(sp)

The fields loaded are merely .a0 and .a1 of the register struct. There's
nothing here making sure (all on its own) that what is loaded is what is
said by the comments. If e.g. the first comment was /* .a0 holds the
hart id */ or some such to remind readers what is being loaded without
giving the impression that the correct value is _established_ here, that
may be better.

> +        /* Set guest mode to supervisor */
> +        li      t0, SSTATUS_SPP
> +        csrs    CSR_SSTATUS, t0
> +
> +        /* Enter guest */
> +        sret
> +END(return_to_new_vcpu)

Aiui SRET does not switch stacks. Shouldn't you therefore clear sp here?
And perhaps also other GPRs, not the least ra? Exposing hypervisor
register values to guests is, well, a bit of a problem.

Jan

