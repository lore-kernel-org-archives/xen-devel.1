Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40494C79F80
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 08:26:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407983.1640741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PFo-0002lq-NE; Fri, 04 Sep 2026 08:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407983.1640741; Fri, 04 Sep 2026 08:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PFo-0002lf-KF; Fri, 04 Sep 2026 08:26:32 +0000
Received: by outflank-mailman (input) for mailman id 1407983;
 Fri, 04 Sep 2026 08:26:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2PFn-0002ki-6i
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:26:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2PFm-00CrgA-JY
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:26:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3@swg.vates.tech>)
 id 6a9a80af-e002-0a2a0a5209dd-0a2a4509e954-40
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:26:30 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3@swg.vates.tech>)
 id 6a9a80af-be1a-0a2a45090019-b9ff1c22a197-5
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:26:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06b86a349000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 08:26:20 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1E2CA802F6;
 Fri,  4 Sep 2026 10:26:20 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Di0Hawg+axQGrdxpJjlorhfH9iHXCw0a3L3zGg16D5M=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=j7pVqSthkSsKyAbyaeL/BzNxnJy2406IhTvqAvOuewgEVQ7ma82g0yXIJ1AK6PRynpZvcmQ4Y
 m7enuhMtLMp/9Vv1+hgos9vYj7HiZRJLqvDHVdknK8VW5e7Gvm/KfqPr5umSGfZm1eBLuXLMIao
 dUt0FR5PsbJevm/FT1FpFM0Nr4LEXk5+LwCG1zlWE5vQfJ4H29SGTFF7d7y4AM0onYqWGMcqvPk
 aCmJFEXltg2FsiJlTa/x+NmbE684l40JhFVp4woe423piSQaJhSc3iYTf+BghF/WBWeVPYJXLh+
 RHJ+UvSiBrE8/VwWBa4C4abyMhRSOyCI2NDCqDWX1+zw==
X-Zone-Loop: 0af76f2ff1590b9067b226c1d5a1b4b8664331a4a767
x-campaign-type: default
x-transaction-id: 4b26a73b-cc9d-42a5-afd9-5d597bfbaf58
x-swg-uid: 01-349004eb-7d2f-44b1-988d-01703f3dd11e
X-Mailer: Sweego
Message-ID:
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3@vates.tech>
x-swg-bid: 1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
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
In-Reply-To: <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 04 Sep 2026 10:26:10 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788510379; l=7001;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=xED3kTXU4/307Oa7PqWkBMB5xhiN8U/7lWdPmOMMBf8=;
 b=hCzdKGJnKwSAAsO81lcMz+VMEnw6CVK/0VdSvehLiZp9ZSfnjqXExVKOkJgt7Tx2OufEO9SRy
 2h1rxW3EXqVDjo3X7iKOa6+vcU7pKEc9ZwbbketV4NcWOHzuvygvSqF
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788510380325
X-purgate-ID: tlsNG-bad1c0/1788510390-FDA6E034-9F1AA250/10/73395122804
X-purgate-type: spam
X-purgate-size: 7001

As I understand it, a generation wrap doesn't retire a single VMID, it
resets next_vmid to 1, which makes every VMID in 1..max_vmid reusable
again in the new generation. We do a full (local) flush at that point to
avoid two different vCPUs ending up with the same VMID valid at once,
across generations.

If this is correct, doing a full flush there also throws away entries
for the current vCPU that a local HFENCE.GVMA(vmid) per retired VMID
could have preserved. A local-flush-per-VMID approach could also
reduce how often we need a full flush at all.

Is there a reason we don't do local flushing instead? I see x86 and KVM
use the same flush-all design on wrap, so I assume there's a reason I'm
missing, I'd like to understand it.

Thanks in advance.

> H/VS CSRs, virtual timer and P2M context, and __context_switch() in assembly,
> which switches Xen's own callee-saved state (and thereby the stack) from
> prev to next. Virtual interrupt controller context switch will be
> introduced later.
> 
> Add offsets of struct arch_vcpu's xen_saved_context to asm-offsets.c for
> use by __context_switch().
> 
> henvcfg and htimedelta are 64-bit on both RV32 and RV64, so store them as
> uint64_t and use csr_{read,write}64() instead of open-coding accesses to
> the high halves.
> 
> A hart which drops out of a domain's dirty_cpumask stops being a target
> of p2m_tlb_flush() while its TLB may still hold G-stage translations of
> that domain, and neither the vCPU which just ran nor any other vCPU of
> that domain which ran there earlier has had its VMID invalidated. Move
> the hart to a new VMID generation at that point: a VMID number is never
> re-used until a full local flush has happened, hence none of those
> translations can be reached again.
> 
> Claim the VMID in p2m_ctxt_switch_to() rather than at the next guest
> entry. VMIDs are a per-hart resource, so the (generation, vmid) pair a
> migrating vCPU brings from another hart is meaningless here and may even
> match this hart's current generation, leaving the vCPU under a VMID owned
> by another domain. ctxt_switch_to() invalidates that pair, but claiming a
> replacement only on guest entry is too late: p2m_ctxt_switch_to() has by
> then already made HGATP live, and speculation can populate G-stage entries
> of the incoming domain under the stale VMID. The local flush for a wrapped
> generation moves along with the claim.
> 
> That leaves p2m_handle_vmenter() with nothing to do, so drop it together
> with its call from check_for_pcpu_work(). A VMID can only be invalidated
> while its vCPU isn't running: vmid_flush_vcpu() is called for the vCPU
> being switched in, and vmid_flush_hart() runs either from schedule_tail(),
> ahead of ctxt_switch_to(), or from the wrap path of vmid_handle_vmenter()
> itself. A P2M change on another hart doesn't invalidate it either, as
> p2m_tlb_flush() drops the stale entries directly with
> sbi_remote_hfence_gvma() instead of retiring the VMIDs which tag them. A
> guest therefore always runs under the VMID claimed on its way in, and
> there is nothing left for a guest entry hook to notice.
> 
> p2m_handle_vmenter() also skipped the HGATP write when the VMID it claimed
> was unchanged. That isn't carried over: HGATP holds the G-stage root as
> well, and skipping the write is only correct where that root is already
> the incoming domain's. On the guest entry path it is, on the context
> switch path it is not.
> 
> While at it, fix the inclusion order of headers in asm-offsets.c: Xen's
> headers go first, then arch specific ones.
This could have a dedicated patch no?
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index ec327a5e8a..91a46d630f 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -11,9 +11,11 @@
>  #include <asm/bitops.h>
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
> +#include <asm/current.h>
>  #include <asm/intc.h>
>  #include <asm/mmio.h>
>  #include <asm/riscv_encoding.h>
> +#include <asm/vmid.h>
>  #include <asm/vtimer.h>
>  
>  struct csr_masks {
> @@ -158,6 +160,8 @@ int arch_vcpu_create(struct vcpu *v)
>      if ( is_idle_vcpu(v) )
>          return 0;
>  
> +    v->arch.last_cpu = NR_CPUS;
> +
>      vcpu_csr_init(v);
>  
>      if ( (rc = vcpu_vtimer_init(v)) )
> @@ -329,6 +333,169 @@ int arch_domain_create(struct domain *d,
>      return rc;
>  }
>  
> +static void save_csr_regs(struct vcpu *vcpu)
> +{
> +    /*
> +     * There is no need to save these CSRs as only hypervisor writes them in
> +     * restore_csr_regs() and guest can't access them so they shouldn't be
> +     * stored here. Keep them commented here just for symmetry with the
> +     * restore CSRs register part.
> +     *
> +     * vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
> +     * vcpu->arch.hideleg = csr_read(CSR_HIDELEG);
> +     * vcpu->arch.henvcfg = csr_read64(CSR_HENVCFG);
> +     * vcpu->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
> +     * vcpu->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
> +     *
> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +     *     vcpu->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
> +     */
> +
> +    vcpu->arch.hvip = csr_read(CSR_HVIP);
> +
> +    vcpu->arch.vsstatus = csr_read(CSR_VSSTATUS);
> +    vcpu->arch.vsie = csr_read(CSR_VSIE);


> +    vcpu->arch.vstvec = csr_read(CSR_VSTVEC);
> +    vcpu->arch.vsscratch = csr_read(CSR_VSSCRATCH);
> +    vcpu->arch.vscause = csr_read(CSR_VSCAUSE);
> +    vcpu->arch.vstval = csr_read(CSR_VSTVAL);
> +    vcpu->arch.vsepc = csr_read(CSR_VSEPC);
> +}
> +
> +static void restore_csr_regs(struct vcpu *vcpu)
> +{
> +    csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
> +    csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
> +    csr_write(CSR_HVIP, vcpu->arch.hvip);
> +    csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
> +    csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
> +    csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +        csr_write(CSR_HSTATEEN0, vcpu->arch.hstateen0);
> +
> +    csr_write(CSR_VSSTATUS, vcpu->arch.vsstatus);
> +    csr_write(CSR_VSIE, vcpu->arch.vsie);


> +    csr_write(CSR_VSTVEC, vcpu->arch.vstvec);
> +    csr_write(CSR_VSSCRATCH, vcpu->arch.vsscratch);
> +    csr_write(CSR_VSCAUSE, vcpu->arch.vscause);
> +    csr_write(CSR_VSTVAL, vcpu->arch.vstval);
> +    csr_write(CSR_VSEPC, vcpu->arch.vsepc);
> +}
> +
> +static void ctxt_switch_from(struct vcpu *p)
Is it expected to have diverse names for the vcpu arg? Above it's vcpu,
here it's p (I assume it's for `previous` but I think the _from alone is
enough to understand) and below it's n. Shouldn't be better to keep the same name?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

