Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ACAC79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 13:30:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414712.1644451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4eqi-0007DF-KU; Thu, 10 Sep 2026 13:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414712.1644451; Thu, 10 Sep 2026 13:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4eqi-0007D8-Gj; Thu, 10 Sep 2026 13:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1414712;
 Thu, 10 Sep 2026 13:29:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4eqh-0007Cx-CV
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 13:29:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4eqg-00B4RP-Lq
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 15:29:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2b0c9-2eae-0a2a0a5409dd-0a2a4509b364-32
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 15:29:54 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2b0d2-be1a-0a2a45090019-d155dd2bd592-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 15:29:54 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-482f2ee53e7so5148686f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 06:29:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26bf2bb2sm68801975e9.7.2026.09.10.06.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 06:29:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1789046994; x=1789651794; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQzlotH8RSl1oZvrHVuTRmSM7NYL34T0EVMKrkHQb7g=;
        b=VZYdUDwdXEWxc+PufMbjsu648dZYjMXcpZRPCaBBgkqh0QArVExn9WZKLniBQmI1w3
         sqPL0901LtYeVEHfFnTvJtQSn5K4DBOqlvPSwy13uBQJIVHJjvvUBtNPJwWRMrIncI66
         QZUxL7ECl3jCXI/K6xADg4wg1QGak0tvcYgOPftt2SOEo49XCClf+VIFeO0yZeaCZfK3
         gdi1p4moY8oWmiEfQfdL/AGKOgf/WlHKoMleiF9bh9gYhEmY8T36LjjLN8MMGRRTnoAf
         Zdh9t5Ck2mYS3gzoWzUipTg89/WT58BWz9gRhyDiE4mUirsZ7YrixrifS7CkJWXZQxxm
         g6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046994; x=1789651794;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AQzlotH8RSl1oZvrHVuTRmSM7NYL34T0EVMKrkHQb7g=;
        b=JYnbmq0vFGHgqQy9qYE7Cdqew2pqO8L8ki9z9MC6tmluW8tOO/qmgQMM961Kntug03
         Q6O/j2v28GezLOr5H5z7sDs/K5lh61liPvbPHglfwcw0V0HnUiSdXEfBxM5Tkoh+sA+B
         fB2PhfJM01RuqF9PhyFHxEx8dON4xyy1DEHh/X9RPtITxzIef+IaYTb58NI8nViKQ7m9
         Lq34KbiCmraqIV5BcwJkskB7eM7EGo6FZtrhApYygavS2hfK3qCrZ8rA/G8lT6TvEj3h
         J5KqdxoiMUqOEW/Q65uTrs3ropCcboA2eM3Ypx/j7G5D73tBm30ieyufwN8B5n4IeY2m
         f75A==
X-Forwarded-Encrypted: i=1; AKwUvBzWIJ0fsBMBFayUpSmwRrxz92Ujl1UL6FSenQ18MuE4wJ2XHheOzS6SgY2Xbe4Nvaj1jh+1lgenKqo=@lists.xenproject.org
X-Gm-Message-State: AFuF++n/tNX9MD0s1VCxhJLyaVPoG8XZVy6/4Wtd5YnYsh1opraj8ADH
	UNDxEZp/ODc+hNjHxtVrHYq/UYqqVZPZ36PHPlbiedkx2GCDlJlsK3aMsLAuHDKHfw==
X-Gm-Gg: AYBFou0nzaqPL6aaz1JmEHuFUIK56Yn1FciyYeqsnrzFCDXga4eS0koxB2Ahwy63tkF
	5WqpMfHkP5M2uWvJWTWGG++7zjb8aba5R4HsVIhK0NLTAHZXZRHhRUdbVrRojRQf/Qlbs23djy2
	pMfZs6n+vEvMDQhG2SZ0czUyyEk6uHZEERM7WZ3QS9jq+5Eq8wEVJrkDsmsrH7S1uEAg8/X6nyo
	Xx3jqLyIPmXDbbSyanUWqsmw6X21G99q5m5syGJVve9FdNlt9/OCFazhX6KhBEJYw1H/Nrmq6eA
	j0gUR730xt5IvY3EMWotzEa5ydEtbgLkyyi9y9jwqGBvTX3pirMiPYlWfgW6UVSgz668PqWlSd/
	q3F5zIC33O+yEkezOUk7KxJqmxb35zBSQIgyb+39JeT16uwX/n7CnR8+gv1v5M3QTj5aqlU+xhC
	aNX9QOdL7OtkUmaJd0S9U13fWXuvFbmvP6SLMES7CKedde4A0KksJO1F1AR/sFrdwSQh1605RKj
	Ls1XdM+lpVUk36pEtg3QPZaSDeWk5Miq+K1EnEu3wR125RyC4luz4wObAxZmug=
X-Received: by 2002:a05:600c:c494:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49d028683f3mr340296735e9.13.1789046993657;
        Thu, 10 Sep 2026 06:29:53 -0700 (PDT)
Message-ID: <2eb325d0-8f53-4790-889d-d68a03da0784@suse.com>
Date: Thu, 10 Sep 2026 15:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
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
 <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1789046994-BC4CB034-9FF41868/0/0
X-purgate-type: clean
X-purgate-size: 7114

On 27.08.2026 17:20, Oleksii Kurochko wrote:
> +static void ctxt_switch_from(struct vcpu *p)
> +{
> +    /*
> +     * When the idle VCPU is running, Xen will always stay in hypervisor
> +     * mode.
> +     * Therefore we don't need to save the context of an idle VCPU.
> +     */
> +    if ( is_idle_vcpu(p) )
> +        return;
> +
> +    p2m_ctxt_switch_from(p);
> +
> +    vtimer_ctxt_switch_from(p);
> +
> +    save_csr_regs(p);
> +}
> +
> +static void ctxt_switch_to(struct vcpu *n)
> +{
> +    /*
> +     * When the idle VCPU is running, Xen will always stay in hypervisor
> +     * mode.
> +     * Therefore we don't need to restore the context of an idle VCPU.
> +     */
> +    if ( is_idle_vcpu(n) )
> +        return;
> +
> +    /*
> +     * If this vCPU last ran on a different pCPU, invalidate its VMID so
> +     * vmid_handle_vmenter() assigns a fresh one from the current pCPU's pool.
> +     * Without this, two pCPUs could independently assign the same
> +     * (generation, vmid) pair, generation counters start at the same value
> +     * on all pCPUs and increment independently, causing TLB contamination.
> +     */
> +    if ( n->arch.last_cpu != smp_processor_id() )
> +        vmid_flush_vcpu(n);

I wonder why you need this, when we don't have anything similar in x86/HVM
(and at the first glance Arm doesn't have anything similar either).

> +    vtimer_ctxt_switch_to(n);
> +
> +    restore_csr_regs(n);
> +
> +    p2m_ctxt_switch_to(n);
> +}

In the absenmce of a comment towards the need for this specific order I'd
expect these three calls to be ordered the opposite of their counterparts
in ctxt_switch_from().

> +static void schedule_tail(struct vcpu *prev)
> +{
> +    unsigned int cpu = smp_processor_id();
> +
> +    ASSERT(prev != current);
> +
> +    ctxt_switch_from(prev);
> +
> +    /*
> +     * Mark this CPU in next domain's dirty cpumasks before calling
> +     * ctxt_switch_to(). This avoids a race on things like p2m flushing,
> +     * which is synchronised on that function.
> +     */
> +    if ( prev->domain != current->domain )
> +    {
> +        cpumask_set_cpu(cpu, current->domain->dirty_cpumask);
> +
> +        /*
> +         * Once this hart drops out of prev's dirty_cpumask it stops being a
> +         * target of p2m_tlb_flush(), while its TLB may still hold G-stage
> +         * translations of prev's domain: neither the vCPU which just ran nor
> +         * any other vCPU of that domain which ran here earlier has had its
> +         * VMID invalidated. Move the hart to a new VMID generation so that
> +         * none of them can be reached again.
> +         *
> +         * Switching away from the idle vCPU needs no bump: the idle domain
> +         * has no p2m of its own, and whatever G-stage entries this hart may
> +         * still hold (or speculatively create while HGATP keeps pointing at
> +         * the last guest's p2m) are tagged with a VMID which was already made
> +         * stale when that guest was switched out. Skipping the bump here also
> +         * avoids burning a generation on every pass through idle.
> +         */
> +        if ( !is_idle_vcpu(prev) )
> +            vmid_flush_hart();
> +
> +        cpumask_clear_cpu(cpu, prev->domain->dirty_cpumask);
> +    }
> +    write_atomic(&current->dirty_cpu, cpu);
> +
> +    ctxt_switch_to(current);
> +
> +    write_atomic(&prev->dirty_cpu, VCPU_CPU_CLEAN);
> +
> +    current->arch.last_cpu = cpu;
> +
> +    /*
> +     * sched_context_switched() internally uses a spinlock,
> +     * which requires interrupts to be enabled.
> +     */
> +    local_irq_enable();
> +
> +    sched_context_switched(prev, current);
> +}
> +
> +void context_switch(struct vcpu *prev, struct vcpu *next)
> +{
> +    ASSERT(local_irq_is_enabled());
> +    ASSERT(prev != next);
> +    ASSERT(!vcpu_cpu_dirty(next));
> +
> +    local_irq_disable();
> +
> +    set_current(next);
> +
> +    prev = __context_switch(prev, next);
> +
> +    schedule_tail(prev);
> +}

__context_switch() switches stacks, which can easily collide with code the
compiler has emitted. For example, the call to schedule_tail() may not be
a tail call, and context_switch()'s return address may have been spilled
to the stack (or into one of the s<N> registers). There's a reason Arm and
x86 have reset_stack_and_jump().

> --- a/xen/arch/riscv/entry.S
> +++ b/xen/arch/riscv/entry.S
> @@ -99,3 +99,47 @@ restore_registers:
>  
>          sret
>  END(handle_trap)
> +
> +/*
> + * struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next)
> + *
> + * This is called on prev's stack, and returns on next's.

With ra being switched it may also return to other than the caller. If
that's really intended, I think it also needs calling out here.

> + * a0 - prev
> + * a1 - next
> + *
> + * Returns prev in a0
> + */
> +FUNC(__context_switch)
> +        REG_S   s0, VCPU_XEN_SAVED_CONTEXT_S0(a0)
> +        REG_S   s1, VCPU_XEN_SAVED_CONTEXT_S1(a0)
> +        REG_S   s2, VCPU_XEN_SAVED_CONTEXT_S2(a0)
> +        REG_S   s3, VCPU_XEN_SAVED_CONTEXT_S3(a0)
> +        REG_S   s4, VCPU_XEN_SAVED_CONTEXT_S4(a0)
> +        REG_S   s5, VCPU_XEN_SAVED_CONTEXT_S5(a0)
> +        REG_S   s6, VCPU_XEN_SAVED_CONTEXT_S6(a0)
> +        REG_S   s7, VCPU_XEN_SAVED_CONTEXT_S7(a0)
> +        REG_S   s8, VCPU_XEN_SAVED_CONTEXT_S8(a0)
> +        REG_S   s9, VCPU_XEN_SAVED_CONTEXT_S9(a0)
> +        REG_S   s10, VCPU_XEN_SAVED_CONTEXT_S10(a0)
> +        REG_S   s11, VCPU_XEN_SAVED_CONTEXT_S11(a0)
> +        REG_S   sp, VCPU_XEN_SAVED_CONTEXT_SP(a0)
> +        REG_S   ra, VCPU_XEN_SAVED_CONTEXT_RA(a0)
> +
> +        REG_L   s0, VCPU_XEN_SAVED_CONTEXT_S0(a1)
> +        REG_L   s1, VCPU_XEN_SAVED_CONTEXT_S1(a1)
> +        REG_L   s2, VCPU_XEN_SAVED_CONTEXT_S2(a1)
> +        REG_L   s3, VCPU_XEN_SAVED_CONTEXT_S3(a1)
> +        REG_L   s4, VCPU_XEN_SAVED_CONTEXT_S4(a1)
> +        REG_L   s5, VCPU_XEN_SAVED_CONTEXT_S5(a1)
> +        REG_L   s6, VCPU_XEN_SAVED_CONTEXT_S6(a1)
> +        REG_L   s7, VCPU_XEN_SAVED_CONTEXT_S7(a1)
> +        REG_L   s8, VCPU_XEN_SAVED_CONTEXT_S8(a1)
> +        REG_L   s9, VCPU_XEN_SAVED_CONTEXT_S9(a1)
> +        REG_L   s10, VCPU_XEN_SAVED_CONTEXT_S10(a1)
> +        REG_L   s11, VCPU_XEN_SAVED_CONTEXT_S11(a1)
> +        REG_L   sp, VCPU_XEN_SAVED_CONTEXT_SP(a1)
> +        REG_L   ra, VCPU_XEN_SAVED_CONTEXT_RA(a1)
> +
> +        ret
> +END(__context_switch)

What about gp and tp?

> --- a/xen/arch/riscv/include/asm/system.h
> +++ b/xen/arch/riscv/include/asm/system.h
> @@ -76,6 +76,10 @@ static inline bool local_irq_is_enabled(void)
>  
>  #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
>  
> +struct vcpu;

I don't think this is needed, as ...

> +struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);

... parsing of the return type will make the struct known (before
parameters are parsed).

Also - can't next be pointer-to-const?

Jan

