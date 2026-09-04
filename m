Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F03C79F82
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 14:55:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408693.1641111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2VJt-0004H8-As; Fri, 04 Sep 2026 14:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408693.1641111; Fri, 04 Sep 2026 14:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2VJt-0004H1-6N; Fri, 04 Sep 2026 14:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1408693;
 Fri, 04 Sep 2026 14:55:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2VJs-0004Gt-DL
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:55:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2VJr-006aIt-QZ
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:55:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9adbae-bab6-0a2a0a5309dd-0a2a4503bd40-32
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:55:07 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9adbcb-fae8-0a2a45030019-d1558029c10c-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:55:07 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso10087395e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 07:55:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf772692dsm88625085e9.10.2026.09.04.07.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 07:55:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788533707; x=1789138507; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuwzGyb+HHz8yRp5cMVQaFYdTbTINKBzSYHX1XH4Jo4=;
        b=b/3KhM56aI4lK0ZirckYTQ1wsR4KRlVcWWqxKxBD7kZBPgwjIdiZYgofqVbWbIUgU9
         jfUzm8JaYOVwj/gIGhsMLpLJGVWSEJrESaUa8Z9Xv8khKAtj0J4NPgqs1t0rV5sBZ36L
         z8UYEOolzMglJrhnmpLUH6U1x/GYhYl2eAIzhHGsJQEVxJWO5b0wXZxPM49Ns0teDPGr
         iZ8u8w+E52gbyhd+wvoGzwpXSk7oPDDuTOMj9K3lftjjhPGxYMfvWyAzLDmebO+9w9gV
         Nv+8ht1VBUr03lsEG7PPcEzDS4U3DD7UG0lQLBZdkMoLS9e6Vq2VZeV6AkkHy+JdgHsZ
         gyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533707; x=1789138507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XuwzGyb+HHz8yRp5cMVQaFYdTbTINKBzSYHX1XH4Jo4=;
        b=FTk2OZdORVl7ge2m7vH0qauOPMIBnhyc1x7Dx5ZvUmudoDlUqMLlnxd9PSeHe7mTLn
         BTlOIfwO4IxHMqDWvunOl+8UAQ6OQ7WlgLzO+5LsfltFNKiSVpOua8RBFnXO1sQOTvpL
         xTSK1t7oJ78JzgmzQJysBNGDqosDdz3Y3MTSNe7KoH7XqhhvPbVDQDIGIdvDYWr7AH8+
         rPUAjNwGWI4QllfJIZZ9/OMrfgCM0yPPH+c9jcEX8SGd6Q7hPsNIkl31O75IfoPfgDXP
         IeRwICR/mRCMvBCQQoAoFmJoqUoAd62826zlTYbUlYSCYo3mhsYyvWZxUAZnzZtJZcnb
         4Xpg==
X-Gm-Message-State: AFuF++lM1gaDaeJkltg7KLaSkLk3WsulYMUDs4gU0H7Z7IfruxZaFLEp
	jaTQcTW1Z4HPRZbtzHc18mrr8t3m/BSybhaI7JTiJqEn6FBc6grp2nAK
X-Gm-Gg: AYBFou3aZ93JKdZuDU4sSQVTAd0jyjPE8xJlcgd8J2WcRKoBvmnd19pzrthS8JV1Ron
	6liQgweyo6vBWecz7HR8alfFApF37OVDtKjYpl5N6+UxW0+0SM20q6fLThqt2BNyejfJloXA2q+
	bvYgQVmz+lj5bZMDmwOqAVoavX40FdQoMV1dumxhT3E3PrYWUK7+ORV3z6WyaDlrzikIjSStrvM
	VTxOwHflCM62t8PyTrt9IFj25IFJsvKihxr+qtf/Mr5mpdS/KtoS4eG4SaRe7VVxvF0J+kgWKy9
	YJYdFRxqUl1P1AsXxYMKhtM23YaiBv6eD95eYlobmv4myc3UdtOqmOxBQDOK/bzVDcci8wZO3/8
	Ro5HhjQbKJTQ9oYVOMElyyD+W0yf9UCTl6XS52vBpNe0kZtQFNLEmL4u0gnCWfM/lO37HPzBiV9
	z/jBvgUSOZOCymXBBY63Be5GDJg9e9S9vuZRNE0UE0pdc5vfYmo0ZglPP6Pq1E9SIskMZKQQfl0
	FJZcVGEMykptTSXj/a+qlZhRhDIOizIM7OntGI=
X-Received: by 2002:a05:600d:848a:b0:49c:ff20:451a with SMTP id 5b1f17b1804b1-49cff20452amr16081905e9.27.1788533706660;
        Fri, 04 Sep 2026 07:55:06 -0700 (PDT)
Message-ID: <91c9abf0-a25f-42d0-9d55-61a9cc62e233@gmail.com>
Date: Fri, 4 Sep 2026 16:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788533707-6C8DD4E9-DD442570/10/73395122804
X-purgate-type: spam
X-purgate-size: 9907



On 9/4/26 10:26 AM, Baptiste Le Duc wrote:
> As I understand it, a generation wrap doesn't retire a single VMID, it
> resets next_vmid to 1, which makes every VMID in 1..max_vmid reusable
> again in the new generation. We do a full (local) flush at that point to
> avoid two different vCPUs ending up with the same VMID valid at once,
> across generations.
> 
> If this is correct, doing a full flush there also throws away entries
> for the current vCPU that a local HFENCE.GVMA(vmid) per retired VMID

We are doing flushed for the pCPU on which a vCPU is ran.

> could have preserved. A local-flush-per-VMID approach could also
> reduce how often we need a full flush at all.
> 
> Is there a reason we don't do local flushing instead? I see x86 and KVM
> use the same flush-all design on wrap, so I assume there's a reason I'm
> missing, I'd like to understand it.

What do you mean here by "local flushing instead"? We are doing local flush:

     if ( unlikely(need_flush) )
         local_hfence_gvma_all();

Do you mean why we don't do hfence_gvma only for specific VMID?

A vCPU's VMID is valid only while vmid->generation == data->generation 
(vmid.c:141). Bumping the generation invalidates every vCPU's VMID on 
this hart simultaneously, so every G-stage entry in the TLB (whatever 
number it is tagged with) belongs to a (vcpu, vmid) binding that can 
never be consulted again. Each of those vCPUs will be handed a fresh 
number on its next vmenter before it can run.

That includes the current vCPU, which is the case you're worried about. 
At the wrap it is being assigned VMID 1, not its previous number, so its 
old entries are unreachable regardless of whether we flush them. 
hfence.gvma per retired VMID would preserve them physically but not 
usefully [A concrete example. vCPU A is running on the hart with 
VMID=100 in generation G; the TLB holds G-stage entries tagged VMID=100. 
A wrap occurs: the generation becomes G+1, next_vmid is reset to 1, and 
A is assigned VMID=1 (vmid.c:154). From that moment on, the hardware 
looks up translations for A under the tag VMID=1. The entries tagged 100 
will no longer match anything: A isn't 100 any more, and no one else 
will be handed 100 until the next wrap.
So A loses its warm entries not because we did an hfence.gvma, but 
because it was renumbered. The flush has nothing to do with it. It 
merely discards what has already become unreachable.]; they'd just 
occupy TLB capacity until natural eviction. Preserving them would 
require a different allocator that keeps a vCPU's number stable across a 
rollover (Linux/KVM-arm64 style, with an active/reserved set pinning 
live ASIDs), not a different flush granularity.

So x86's hvm_asid_handle_vmenter() and KVM's equivalent aren't doing 
this out of inertia — with a round-robin generation allocator, the full 
flush is free of useful collateral damage and strictly cheaper than the 
alternative. Preserving entries across a rollover is a real 
optimisation, but it's an allocator change, and IMO worth doing only if 
profiling shows the wrap flush matters.

> 
>> H/VS CSRs, virtual timer and P2M context, and __context_switch() in assembly,
>> which switches Xen's own callee-saved state (and thereby the stack) from
>> prev to next. Virtual interrupt controller context switch will be
>> introduced later.
>>
>> Add offsets of struct arch_vcpu's xen_saved_context to asm-offsets.c for
>> use by __context_switch().
>>
>> henvcfg and htimedelta are 64-bit on both RV32 and RV64, so store them as
>> uint64_t and use csr_{read,write}64() instead of open-coding accesses to
>> the high halves.
>>
>> A hart which drops out of a domain's dirty_cpumask stops being a target
>> of p2m_tlb_flush() while its TLB may still hold G-stage translations of
>> that domain, and neither the vCPU which just ran nor any other vCPU of
>> that domain which ran there earlier has had its VMID invalidated. Move
>> the hart to a new VMID generation at that point: a VMID number is never
>> re-used until a full local flush has happened, hence none of those
>> translations can be reached again.
>>
>> Claim the VMID in p2m_ctxt_switch_to() rather than at the next guest
>> entry. VMIDs are a per-hart resource, so the (generation, vmid) pair a
>> migrating vCPU brings from another hart is meaningless here and may even
>> match this hart's current generation, leaving the vCPU under a VMID owned
>> by another domain. ctxt_switch_to() invalidates that pair, but claiming a
>> replacement only on guest entry is too late: p2m_ctxt_switch_to() has by
>> then already made HGATP live, and speculation can populate G-stage entries
>> of the incoming domain under the stale VMID. The local flush for a wrapped
>> generation moves along with the claim.
>>
>> That leaves p2m_handle_vmenter() with nothing to do, so drop it together
>> with its call from check_for_pcpu_work(). A VMID can only be invalidated
>> while its vCPU isn't running: vmid_flush_vcpu() is called for the vCPU
>> being switched in, and vmid_flush_hart() runs either from schedule_tail(),
>> ahead of ctxt_switch_to(), or from the wrap path of vmid_handle_vmenter()
>> itself. A P2M change on another hart doesn't invalidate it either, as
>> p2m_tlb_flush() drops the stale entries directly with
>> sbi_remote_hfence_gvma() instead of retiring the VMIDs which tag them. A
>> guest therefore always runs under the VMID claimed on its way in, and
>> there is nothing left for a guest entry hook to notice.
>>
>> p2m_handle_vmenter() also skipped the HGATP write when the VMID it claimed
>> was unchanged. That isn't carried over: HGATP holds the G-stage root as
>> well, and skipping the write is only correct where that root is already
>> the incoming domain's. On the guest entry path it is, on the context
>> switch path it is not.
>>
>> While at it, fix the inclusion order of headers in asm-offsets.c: Xen's
>> headers go first, then arch specific ones.
> This could have a dedicated patch no?

It could but considering that it is pretty small fix I think it could be 
part of this patch. If you are insisting on moving that to separate 
patch I will happy to do that.

>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>> index ec327a5e8a..91a46d630f 100644
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -11,9 +11,11 @@
>>   #include <asm/bitops.h>
>>   #include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>> +#include <asm/current.h>
>>   #include <asm/intc.h>
>>   #include <asm/mmio.h>
>>   #include <asm/riscv_encoding.h>
>> +#include <asm/vmid.h>
>>   #include <asm/vtimer.h>
>>   
>>   struct csr_masks {
>> @@ -158,6 +160,8 @@ int arch_vcpu_create(struct vcpu *v)
>>       if ( is_idle_vcpu(v) )
>>           return 0;
>>   
>> +    v->arch.last_cpu = NR_CPUS;
>> +
>>       vcpu_csr_init(v);
>>   
>>       if ( (rc = vcpu_vtimer_init(v)) )
>> @@ -329,6 +333,169 @@ int arch_domain_create(struct domain *d,
>>       return rc;
>>   }
>>   
>> +static void save_csr_regs(struct vcpu *vcpu)
>> +{
>> +    /*
>> +     * There is no need to save these CSRs as only hypervisor writes them in
>> +     * restore_csr_regs() and guest can't access them so they shouldn't be
>> +     * stored here. Keep them commented here just for symmetry with the
>> +     * restore CSRs register part.
>> +     *
>> +     * vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
>> +     * vcpu->arch.hideleg = csr_read(CSR_HIDELEG);
>> +     * vcpu->arch.henvcfg = csr_read64(CSR_HENVCFG);
>> +     * vcpu->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
>> +     * vcpu->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
>> +     *
>> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +     *     vcpu->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
>> +     */
>> +
>> +    vcpu->arch.hvip = csr_read(CSR_HVIP);
>> +
>> +    vcpu->arch.vsstatus = csr_read(CSR_VSSTATUS);
>> +    vcpu->arch.vsie = csr_read(CSR_VSIE);
> 
> 
>> +    vcpu->arch.vstvec = csr_read(CSR_VSTVEC);
>> +    vcpu->arch.vsscratch = csr_read(CSR_VSSCRATCH);
>> +    vcpu->arch.vscause = csr_read(CSR_VSCAUSE);
>> +    vcpu->arch.vstval = csr_read(CSR_VSTVAL);
>> +    vcpu->arch.vsepc = csr_read(CSR_VSEPC);
>> +}
>> +
>> +static void restore_csr_regs(struct vcpu *vcpu)
>> +{
>> +    csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
>> +    csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
>> +    csr_write(CSR_HVIP, vcpu->arch.hvip);
>> +    csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
>> +    csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
>> +    csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +        csr_write(CSR_HSTATEEN0, vcpu->arch.hstateen0);
>> +
>> +    csr_write(CSR_VSSTATUS, vcpu->arch.vsstatus);
>> +    csr_write(CSR_VSIE, vcpu->arch.vsie);
> 
> 
>> +    csr_write(CSR_VSTVEC, vcpu->arch.vstvec);
>> +    csr_write(CSR_VSSCRATCH, vcpu->arch.vsscratch);
>> +    csr_write(CSR_VSCAUSE, vcpu->arch.vscause);
>> +    csr_write(CSR_VSTVAL, vcpu->arch.vstval);
>> +    csr_write(CSR_VSEPC, vcpu->arch.vsepc);
>> +}
>> +
>> +static void ctxt_switch_from(struct vcpu *p)
> Is it expected to have diverse names for the vcpu arg? Above it's vcpu,
> here it's p (I assume it's for `previous` but I think the _from alone is
> enough to understand) and below it's n. Shouldn't be better to keep the same name?

Above should be used n. It is what usually is used in Xen in such cases. 
vcpu isn't the best one name in general as it should be v. But for these 
functions I will use n and p correspondignly.

Thanks for noticing that.

~ Oleksii

