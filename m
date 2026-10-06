Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E21CA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 16:50:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441668.1659252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE8Mz-0000sB-LJ; Tue, 06 Oct 2026 16:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441668.1659252; Tue, 06 Oct 2026 16:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE8Mz-0000s4-HE; Tue, 06 Oct 2026 16:50:25 +0000
Received: by outflank-mailman (input) for mailman id 1441668;
 Tue, 06 Oct 2026 16:50:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE8Mx-0000ry-Hh
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 16:50:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE8Mw-00CmhJ-Uo
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 18:50:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1121f8fef0003f66@swg.vates.tech>)
 id 6ac526c6-e002-0a2a0a5209dd-0a2a450c8dcc-10
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 18:50:22 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1121f8fef0003f66@swg.vates.tech>)
 id 6ac526ce-f479-0a2a450c0019-b9ff1c229fdd-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 18:50:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1121f8fef0003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 06 Oct 2026 16:50:20 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C33AC815DF;
 Tue,  6 Oct 2026 18:50:19 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=vn/ztMCm5Fq2N8IKmY15sghlrFHXYcj5dL4MPJfS2P0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=LiJZMmIJO5hwLadBl29/b9rP8WBztZPs14gPSzpYOVixYaq+OQ9jYpO/oIM4ndNtmvaH1GlUd
 h7VXjSAMLe/ACOhBXd27BkrzsPX5ftPrv4dyNadcz8uqs0W1xm4YVYuC53eZp13ghzMTOVlYo8R
 21cN2sLtubhohEMUmvtbh1TtGwPcf1i8EMBY7SX4NoT9rEevBStf9vKUnxxBXVfAsl8x4p+oZct
 GFsCwTojha/699FLIV6NSSjd6FYALDgD5ZxH2gGLnc4E9NYG4VzrbmcRwnYgKvK8ALLZiupbIFs
 1H72+GupcEo+HHNcvyVwEOUht2Ywm3ZYQuw+qQXtcu2Q==
X-Zone-Loop: 4d18deb9cafb8a90c87939600601a44ef3a50c0f8371
x-campaign-type: default
x-transaction-id: c4cc5cb9-c3c4-4279-a252-0ccc25984fd9
x-swg-uid: 01-1aedab40-09cf-4d89-b452-08d5793c3d7d
X-Mailer: Sweego
Message-ID:
 <1791305420.8631fc262581453bbf619ec5b2062170.1a1121f8fef0003f66@vates.tech>
x-swg-bid: 1791305420.8631fc262581453bbf619ec5b2062170.1a1121f8fef0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 11/39] xen/riscv: implement vCPU context switching
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <6e539cc5ded7f62c4347781785af714840893184.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <6e539cc5ded7f62c4347781785af714840893184.1790779209.git.oleksii.kurochko@gmail.com>
Date: Tue, 06 Oct 2026 18:50:11 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791305414; l=21865;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=6R81etp+Jo0MWLwbpamHWMogUBgnfS+wgP0PV7zSYCw=;
 b=KSDElkRgP9p/7VbqNtMoaToE2LQ1g33oFNEHQl7SlP9dXiwZ4szqU37rvkkbSeczze2JhQmAD
 nhrtVTBkRmWA3ytjzsA/hFsgskzz1n86dw18Xx9JjzP/d6uvmVI2oeL
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791305420015
X-purgate-ID: tlsNG-d25034/1791305422-50D3CA5B-27C65D80/10/73395122804
X-purgate-type: spam
X-purgate-size: 21865

> Implement context_switch() and the helpers it needs: save/restore of
> H/VS CSRs, virtual timer and P2M context, and __context_switch() in
> assembly, which switches Xen's own callee-saved state (and thereby the
> stack) from prev to next. The virtual interrupt controller state isn't
> switched here.
> 
> Add offsets of struct arch_vcpu's xen_saved_context to asm-offsets.c for
> use by __context_switch().
> 
> henvcfg, htimedelta and vsie are 64-bit on both RV32 and RV64, so store
> them as uint64_t and access them with csr_{read,write}64(). For that
> purpose introduce csr_read64().
> 
> The VMID has to be claimed on the context switch rather than on guest
> entry: once p2m_ctxt_switch_to() writes HGATP, speculation can populate
> G-stage entries under whatever VMID is written there. This is done by
> p2m_vmid_switch_to(), called right before the HGATP write:
> 
>  - VMIDs are a per-hart resource, so the (generation, vmid) pair of a
>    vCPU which last ran on another hart is invalidated before a VMID is
>    claimed for it. The local flush for a wrapped generation moves along
>    with the claim.
>  - Nothing is switched in for the idle vCPU, so HGATP keeps pointing at
>    the p2m of the domain which ran on the hart last. Track that domain
>    per hart (hgatp_owner) and keep the hart in its dirty_cpumask until a
>    vCPU of another domain is switched in: p2m_tlb_flush() then goes on
>    reaching the hart, and a domain which idles between two runs on the
>    same hart keeps its VMIDs.
>  - When the owner changes, the hart leaves the old owner's dirty_cpumask
>    while its TLB may still hold that domain's G-stage translations, so it
>    is moved to a new VMID generation, which makes none of them reachable
>    again. It joins the new owner's dirty_cpumask before HGATP is written;
>    a full barrier there, paired with one in p2m_tlb_flush(), guarantees
>    that a concurrent P2M change either reaches the hart with an
>    HFENCE.GVMA or is visible to it before it walks the p2m.
> 
> That leaves p2m_handle_vmenter() with nothing to do, so drop it together
> with its call from check_for_pcpu_work(): a VMID is only ever invalidated
> while its vCPU isn't running, and p2m_tlb_flush() drops stale entries
> with a remote HFENCE.GVMA rather than by retiring VMIDs. Unlike
> p2m_handle_vmenter(), HGATP is written unconditionally, as it holds the
> G-stage root too, which on a context switch belongs to another domain.
> 
> While at it, fix the inclusion order of headers in asm-offsets.c: Xen's
> headers go first, then arch specific ones.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>  - Update the commit message.
>  - Introduce csr_read64(), as vsie is 64-bit on RV32 too, i.e. has to be
>    accessed as the vsie/vsieh pair there.
>  - Make vsie declared as uint64_t instead of register_t.
>  - Rename the parameter of save_csr_regs() to p and of restore_csr_regs()
>    to n, to match their callers ctxt_switch_from()/ctxt_switch_to() and the
>    rest of the context switch helpers (p2m_ctxt_switch_{from,to}(),
>    vtimer_ctxt_switch_{from,to}()).
>  - s/save_csr_regs/csr_regs_ctxt_switch_from/
>  - s/restore_csr_regs/csr_regs_ctxt_switch_to/
>  - Drop the forward declaration of struct vcpu in <asm/system.h>: the
>    return type of __context_switch() already declares the tag at file
>    scope.
>  - Make the next parameter of __context_switch() pointer-to-const, as
>    next's saved context is only read.
>  - Extend the comment above __context_switch(): as ra is switched too, it
>    doesn't return to its caller, but to where next last called it from
>    (next's own context_switch(), or continue_new_vcpu() for a vCPU which
>    has never run).
>  - Call vtimer_ctxt_switch_to() after csr_regs_ctxt_switch_to(), so that
>    ctxt_switch_to() restores state in the reverse order of
>    ctxt_switch_from() saving it.
>  - Rework p2m's VMID handling in the context switch: track the domain
>    whose p2m HGATP points at in a per-CPU hgatp_owner, so a pass through
>    idle no longer drops the hart from that domain's dirty_cpumask nor
>    burns a VMID generation; move the dirty_cpumask update and the
>    invalidation of a VMID brought from another hart from schedule_tail()
>    and ctxt_switch_to() to p2m_ctxt_switch_to(), next to the VMID claim;
>    add the barriers ordering the dirty_cpumask update against
>    p2m_tlb_flush().
>  - Initialise arch_vcpu.last_cpu to CPU_NONE instead of NR_CPUS.
>  - Mark prev's dirty_cpu clean before ctxt_switch_to() and set current's
>    after it.
> ---
> Changes in v2:
>  - New patch.
> ---
> ---
>  xen/arch/riscv/domain.c              | 127 ++++++++++++++++++++++
>  xen/arch/riscv/entry.S               |  48 ++++++++
>  xen/arch/riscv/include/asm/csr.h     |  13 +++
>  xen/arch/riscv/include/asm/domain.h  |  15 ++-
>  xen/arch/riscv/include/asm/p2m.h     |   1 -
>  xen/arch/riscv/include/asm/system.h  |   2 +
>  xen/arch/riscv/p2m.c                 | 157 ++++++++++++++++++---------
>  xen/arch/riscv/riscv64/asm-offsets.c |  19 +++-
>  xen/arch/riscv/stubs.c               |   5 -
>  xen/arch/riscv/traps.c               |   2 -
>  10 files changed, 330 insertions(+), 59 deletions(-)
>
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index fd62296356..f80643e2d8 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -11,6 +11,7 @@
>  #include <asm/bitops.h>
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
> +#include <asm/current.h>
>  #include <asm/intc.h>
>  #include <asm/mmio.h>
>  #include <asm/riscv_encoding.h>
> @@ -152,6 +153,8 @@ int arch_vcpu_create(struct vcpu *v)
>      if ( is_idle_vcpu(v) )
>          return 0;
>  
> +    v->arch.last_cpu = CPU_NONE;
> +
>      vcpu_csr_init(v);
>  
>      if ( (rc = vcpu_vtimer_init(v)) )
> @@ -323,6 +326,130 @@ int arch_domain_create(struct domain *d,
>      return rc;
>  }
>  
> +static void csr_regs_ctxt_switch_from(struct vcpu *p)
> +{
> +    /*
> +     * There is no need to save these CSRs as only hypervisor writes them in
> +     * csr_regs_ctxt_switch_to() and guest can't access them so they shouldn't
> +     * be stored here. Keep them commented here just for symmetry with the
> +     * restore CSRs register part.
> +     *
> +     * p->arch.hedeleg = csr_read(CSR_HEDELEG);
> +     * p->arch.hideleg = csr_read(CSR_HIDELEG);
> +     * p->arch.henvcfg = csr_read64(CSR_HENVCFG);
> +     * p->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
> +     * p->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
> +     *
> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +     *     p->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
> +     */
> +
> +    p->arch.hvip = csr_read(CSR_HVIP);
> +
> +    p->arch.vsstatus = csr_read(CSR_VSSTATUS);
> +    p->arch.vsie = csr_read64(CSR_VSIE);
> +    p->arch.vstvec = csr_read(CSR_VSTVEC);
> +    p->arch.vsscratch = csr_read(CSR_VSSCRATCH);
> +    p->arch.vscause = csr_read(CSR_VSCAUSE);
> +    p->arch.vstval = csr_read(CSR_VSTVAL);
> +    p->arch.vsepc = csr_read(CSR_VSEPC);
> +}
> +
> +static void csr_regs_ctxt_switch_to(struct vcpu *n)
> +{
> +    csr_write(CSR_HEDELEG, n->arch.hedeleg);
> +    csr_write(CSR_HIDELEG, n->arch.hideleg);
> +    csr_write(CSR_HVIP, n->arch.hvip);
> +    csr_write64(CSR_HENVCFG, n->arch.henvcfg);
> +    csr_write(CSR_HCOUNTEREN, n->arch.hcounteren);
> +    csr_write64(CSR_HTIMEDELTA, n->arch.htimedelta);
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +        csr_write(CSR_HSTATEEN0, n->arch.hstateen0);
> +
> +    csr_write(CSR_VSSTATUS, n->arch.vsstatus);
> +    csr_write64(CSR_VSIE, n->arch.vsie);
> +    csr_write(CSR_VSTVEC, n->arch.vstvec);
> +    csr_write(CSR_VSSCRATCH, n->arch.vsscratch);
> +    csr_write(CSR_VSCAUSE, n->arch.vscause);
> +    csr_write(CSR_VSTVAL, n->arch.vstval);
> +    csr_write(CSR_VSEPC, n->arch.vsepc);
> +}
> +
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
> +    csr_regs_ctxt_switch_from(p);
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
> +    csr_regs_ctxt_switch_to(n);
> +
> +    vtimer_ctxt_switch_to(n);
> +
> +    p2m_ctxt_switch_to(n);
> +}
> +
> +static void schedule_tail(struct vcpu *prev)
> +{
> +    unsigned int cpu = smp_processor_id();
> +
> +    ASSERT(prev != current);
> +
> +    ctxt_switch_from(prev);
> +
> +    write_atomic(&prev->dirty_cpu, VCPU_CPU_CLEAN);
> +
> +    ctxt_switch_to(current);
> +
> +    write_atomic(&current->dirty_cpu, cpu);
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
> +
>  static void __init __maybe_unused build_assertions(void)
>  {
>      /*
> diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
> index 202a35fb03..017fbb0626 100644
> --- a/xen/arch/riscv/entry.S
> +++ b/xen/arch/riscv/entry.S
> @@ -99,3 +99,51 @@ restore_registers:
>  
>          sret
>  END(handle_trap)
> +
> +/*
> + * struct vcpu *__context_switch(struct vcpu *prev, const struct vcpu *next)
> + *
> + * This is called on prev's stack, and returns on next's. As ra is
> + * switched too, it doesn't return to its caller: it returns to where
> + * next last called it from, i.e. into next's own context_switch(), or,
> + * for a vCPU which has never run, to continue_new_vcpu() with an empty
> + * stack.
> + *
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
> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
> index a5cb24c863..aad82c6a6d 100644
> --- a/xen/arch/riscv/include/asm/csr.h
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -40,6 +40,13 @@
>      csr_write(csr ## H, v_ >> 32);  \
>  })
>  
> +#define csr_read64(csr)                 \
> +({                                      \
> +    uint64_t v_ = csr_read(csr ## H);   \
This violates Misra 20.12 rule (docs/misra/rules.rst) as we use macro
parameter `csr` as an operand of ##, while it could be expanded as a
macro (e.g. csr_read64(CSR_HENVCFG)).
> +                                        \
> +    (v_ << 32) | csr_read(csr);         \
> +})
> +
>  /*
>   * The two halves are read by separate instructions, so a CSR which hardware
>   * increments can carry from the low half into the high one in between,
> @@ -72,6 +79,12 @@
>      (void)csr ## H;                 \
>      csr_read(csr);                  \
>  })
> +
> +#define csr_read64(csr)             \
> +({                                  \
> +    (void)csr ## H;                 \
Same as above.
> +    csr_read(csr);                  \
> +})
>  #endif
>  
>  #define csr_swap(csr, val)                                      \
> diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
> index 15e8fa1968..77ad888a2d 100644
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -29,6 +29,11 @@ struct arch_vcpu_io {
>  struct arch_vcpu {
>      struct vcpu_vmid vmid;
>  
> +    /*
> +     * The last CPU this vCPU ran on. Initialised to CPU_NONE.
> +     */
> +    unsigned int last_cpu;
> +
>      /*
>       * Callee saved registers for Xen's state used to switch from
>       * prev's stack to the next's stack during context switch.
> @@ -60,11 +65,19 @@ struct arch_vcpu {
>      register_t hcounteren;
>      register_t hedeleg;
>      register_t hideleg;
> -    register_t henvcfg;
> +    uint64_t   henvcfg;
>      register_t hstateen0;
> +    uint64_t   htimedelta;
>      register_t hvip;
>  
>      register_t vsatp;
> +    register_t vscause;
> +    register_t vsepc;
> +    uint64_t   vsie;
> +    register_t vsscratch;
> +    register_t vsstatus;
> +    register_t vstval;
> +    register_t vstvec;
>  
>      /*
>       * VCPU interrupts
> diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
> index 0d1dace1a0..9edf78377e 100644
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -262,7 +262,6 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>  
>  void p2m_ctxt_switch_from(struct vcpu *p);
>  void p2m_ctxt_switch_to(struct vcpu *n);
> -void p2m_handle_vmenter(void);
>  
>  #endif /* ASM__RISCV__P2M_H */
>  
> diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
> index f33af64fd2..d350b9c959 100644
> --- a/xen/arch/riscv/include/asm/system.h
> +++ b/xen/arch/riscv/include/asm/system.h
> @@ -76,6 +76,8 @@ static inline bool local_irq_is_enabled(void)
>  
>  #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
>  
> +struct vcpu *__context_switch(struct vcpu *prev, const struct vcpu *next);
> +
>  #endif /* __ASSEMBLER__ */
>  
>  #endif /* ASM__RISCV__SYSTEM_H */
> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> index de25607247..02e7f6364f 100644
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -243,6 +243,15 @@ static void p2m_tlb_flush(struct p2m_domain *p2m)
>  
>      p2m->need_flush = false;
>  
> +    /*
> +     * Order the p2m updates above against the read of dirty_cpumask below,
> +     * pairing with the barrier in p2m_vmid_switch_to(). Either that hart is
> +     * seen here and gets an HFENCE.GVMA, or it adds itself to the mask
> +     * afterwards, in which case it starts walking this p2m only once the
> +     * updates are visible to it.
> +     */
> +    smp_mb();
> +
>      sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
>  }
>  
> @@ -1504,16 +1513,110 @@ void p2m_ctxt_switch_from(struct vcpu *p)
>       * VMID, world-switch code should zero vsatp, then swap hgatp, then
>       * finally write the new vsatp value what will be done in
>       * p2m_ctxt_switch_to().
> -     * Note, that also HGATP update could happen in p2m_handle_vmenter().
>       */
>      p->arch.vsatp = csr_swap(CSR_VSATP, 0);
>  
>      /*
> -     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
> -     * or/and in p2m_handle_vmenter().
> +     * Nothing to do with HGATP as it will be updated in
> +     * p2m_ctxt_switch_to().
>       */
>  }
>  
> +/*
> + * Domain whose p2m this hart's HGATP points at. ctxt_switch_to() bails out
> + * early for the idle vCPU, so HGATP survives a pass through idle and keeps
> + * pointing at the domain which ran here last. That domain, rather than the
> + * one the scheduler switched away from, is what owns this hart's G-stage
> + * translations. The hart also keeps its place in the owner's dirty_cpumask:
> + * p2m_tlb_flush() goes on reaching it, and a domain which idles between two
> + * runs on the same hart keeps its VMIDs.
> + *
> + * TODO: nothing resets hgatp_owner when its domain is destroyed, so a hart
> + *       which stays idle from the domain's last run until it is freed is
> + *       left with a dangling pointer. Once domain_relinquish_resources()
> + *       tears down the p2m, it has to reset hgatp_owner of every hart still
> + *       pointing at the domain (cmpxchg() against d), i.e. before the RCU
> + *       grace period of domain_destroy() and so before the domain is freed.
> + */
> +static DEFINE_PER_CPU(struct domain *, hgatp_owner);
> +
> +/*
> + * Update this hart's place in the dirty_cpumask of the domains involved and
> + * claim a VMID for n. Must be called before HGATP is pointed at n's p2m, as
> + * it is written with the VMID claimed here.
> + */
> +static void p2m_vmid_switch_to(struct vcpu *n)
> +{
> +    unsigned int cpu = smp_processor_id();
> +    struct domain *owner = this_cpu(hgatp_owner);
> +    bool need_flush;
> +
> +    ASSERT(!is_idle_vcpu(n));
> +
> +    if ( owner != n->domain )
> +    {
> +        /*
> +         * Once this hart drops out of the owner's dirty_cpumask it stops
> +         * being a target of p2m_tlb_flush(), while its TLB may still hold
> +         * G-stage translations of that domain: none of the vCPUs of that
> +         * domain which ran here has had its VMID invalidated. Move the hart
> +         * to a new VMID generation so that none of them can be reached
> +         * again.
> +         *
> +         * This has to precede the VMID claim below, so that n gets a VMID of
> +         * the new generation.
> +         */
> +        if ( owner )
> +        {
> +            vmid_flush_hart();
> +
> +            cpumask_clear_cpu(cpu, owner->dirty_cpumask);
> +        }
> +
> +        /*
> +         * Mark this hart in the incoming domain's dirty_cpumask before HGATP
> +         * is pointed at its p2m: from that write on the hart may cache the
> +         * p2m's translations, so p2m_tlb_flush() must already reach it.
> +         */
> +        cpumask_set_cpu(cpu, n->domain->dirty_cpumask);
> +
> +        /*
> +         * Pairs with the barrier in p2m_tlb_flush(). cpumask_set_cpu() is an
> +         * unordered AMO on RISC-V, so without this a concurrent flusher could
> +         * read the mask without this hart in it while this hart is already
> +         * walking the p2m it is about to be pointed at.
> +         */
> +        smp_mb();
> +
> +        this_cpu(hgatp_owner) = n->domain;
> +    }
> +
> +    /*
> +     * A VMID is meaningful only on the hart whose pool issued it: generations
> +     * are per-hart counters which all start at 1 and advance independently,
> +     * so the pair a vCPU brings from another hart may match this hart's
> +     * generation by coincidence, leaving the vCPU under a VMID which is live
> +     * here for someone else.
> +     */
So if I understand correctly, we are setting generation to 0 to mark the
vCPU that it is coming from other hart right?
Nit: If it's the case I may simplify the comment to:
      /*
       * VMIDs and generations are per hart, so a pair issued on another hart
       * may match this hart's generation by coincidence. Reset the generation
       * to 0, which no hart ever uses, so that a fresh VMID is claimed from
       * this hart's pool.
       */

> +    if ( n->arch.last_cpu != cpu )
> +        vmid_flush_vcpu(n);
>
Nit: I had to read this a couple of times to get why the guest entry is too
late. "makes HGATP live" doesn't say what happens once it is: if it's
because of speculation filling the TLB with G-stage entries tagged with
the VMID in HGATP, like you explained in the commit message then it may
worth spell out:

      /*
       * Claim the VMID before the caller writes HGATP rather than on guest
       * entry: from that write on, speculation may fill the TLB with this
       * domain's G-stage entries tagged with that VMID. A stale VMID may
       * already have been re-issued to a vCPU of another domain, which would
       * then hit these entries.
       */

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

