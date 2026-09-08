Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D082AC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 09:06:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411198.1641897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3rmm-0002Hd-0r; Tue, 08 Sep 2026 09:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411198.1641897; Tue, 08 Sep 2026 09:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3rml-0002HW-U9; Tue, 08 Sep 2026 09:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1411198;
 Tue, 08 Sep 2026 09:06:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3rml-0002HO-2A
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 09:06:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3rmk-00FlME-BN
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 11:06:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fd01a-2eae-0a2a0a5409dd-0a2a4507a2a0-2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:06:34 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fd01a-b4ea-0a2a45070019-4a7de48caab0-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:06:34 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254f9c60d5so65885866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 02:06:34 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d4aa01dsm582950966b.15.2026.09.08.02.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 02:06:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788858394; x=1789463194; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3AHP7sy+fgkGxbPk/SmQ3YaMHYxTwvN7LycOYk7SzX0=;
        b=JAdBmaC1j4Ef8cuRoh3lZRgKrXxJHbCJmUh6S7wVpdobuGkiACEN99IfCAySdPFN2D
         /OYSYm8fPlEGb1zW76Zgz6RSBS+u0PHTd6oIhisa7q3ve1MBYtP9U3kzQ9ojGZZ6Hp+s
         dek4O14FK/XNrduXsAEIgOSFoHcGi8pn1mMsCkVO9dW1bMPgLs4lX9zu8swet1KKrrh9
         Mb43lSb+wtIcq4OpOw6QzTV5f7mO7pugyN8LTlI2vkjKjJQ0t9/Zy15oftYo1hIqjFOw
         KXU9Sc0ai5zfPGi6a/kz9xwFyhOp+EfN1m/1STcPzo4RbwgKybSUKBoeheQhZZ2K8Jvc
         0U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858394; x=1789463194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AHP7sy+fgkGxbPk/SmQ3YaMHYxTwvN7LycOYk7SzX0=;
        b=oV46Q6PH72gAZgOenzoS4V/YNP4FBM1LrUi0To7zICG3+YC77DZ7GwYMuRTT5K0rtB
         XRCsrcEPQYjtVSOdzJYlDujqeFNqmEuYxdAPLvnQGzpIouDu1luCO7aeOEEcwoFNfRon
         YRjiuIGrDLDJOncqQM9RxA1RFYt2+0O8GaJCp7R3E2NZgIMl7KOrhSgQL+e7bxnqGTUM
         HD9BARVfgm53FG+yQxNZJP/vCr/JCHBBJLzxLITaoSXq4jrIQ1iYOifRUU7/HOP2Q3IC
         0XUHzLjmLgjcKP1QTSTEZ6LuXfyP8+lIw4V7hM1Gk4/AwbdSuiEcMR5v9ZRHNBGkU26L
         cXWA==
X-Gm-Message-State: AFuF++nm9xwOH2iPvPDOmWjB2OJRiFmcMjKQ58bm4GnjVvcXg12cPDDD
	QFMwH0Cwj9nfJLNI03nnduU7nZJOCBy/B9o/2KNThCXPKYLv08UQTZRU
X-Gm-Gg: AYBFou2Z19zUmYisDKp+QWs0bBXDARJBYRSBNBURDLZnCruW7Xy+jM3LDtlzr6uk6JM
	hlvGJS6e5BCAoDu9myPYM3cYU/qxYLI5B2XU9GvV8x1sjksl4jvZYH3yKjqG6U2A2EDCCCHAbY4
	hdS/+N+x590ZqaA7UysHChfxJEu21uHJz+TFLp/mSHtfeAtDcbjbxl/TZ+jfH5iIoGRG/IvSpWR
	DbI+bkViB9FkoHBDoaV5Eok23uvfWCJa1hMfbrl0JdL6inf7EyFO+tBFeFcJbU4K23EXVeZkMUg
	Ce1t9oac8kpJK1qADItp1apEMDMFRQkR0sFalEUwnCoESYyyDJ6YykXq39lcPfR2cWMs6zDKxSp
	dr5E2P5ZqWs4DbNq9/dYb9Za5Y/GWduWZUwtz9IMBcIVEn5AqTjbI9TV2UoHH4PUTT2ha0kVNeL
	h1iLrjL7hUjIYqadJYamFVOrHK/S2loHlY2GrtYZsVQ+o6WZt19gGRWdlvrdJyubCv+K7EuRK8o
	JtgScndc/UbDDt9TA4jndI=
X-Received: by 2002:a17:907:3e0c:b0:c25:f7db:4bef with SMTP id a640c23a62f3a-c2904519fdamr282291266b.21.1788858393517;
        Tue, 08 Sep 2026 02:06:33 -0700 (PDT)
Message-ID: <02fad9cd-e721-485c-b84e-2dc563c49d1f@gmail.com>
Date: Tue, 8 Sep 2026 11:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3@vates.tech>
 <91c9abf0-a25f-42d0-9d55-61a9cc62e233@gmail.com>
 <c2dee5df-f360-4eba-85e5-02d9f0948aa9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c2dee5df-f360-4eba-85e5-02d9f0948aa9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788858394-A60C5AE4-34AFF76F/10/73395122804
X-purgate-type: spam
X-purgate-size: 10508



On 9/7/26 10:17 AM, Jan Beulich wrote:
> On 04.09.2026 16:55, Oleksii Kurochko wrote:
>>
>>
>> On 9/4/26 10:26 AM, Baptiste Le Duc wrote:
>>> As I understand it, a generation wrap doesn't retire a single VMID, it
>>> resets next_vmid to 1, which makes every VMID in 1..max_vmid reusable
>>> again in the new generation. We do a full (local) flush at that point to
>>> avoid two different vCPUs ending up with the same VMID valid at once,
>>> across generations.
>>>
>>> If this is correct, doing a full flush there also throws away entries
>>> for the current vCPU that a local HFENCE.GVMA(vmid) per retired VMID
>>
>> We are doing flushed for the pCPU on which a vCPU is ran.
>>
>>> could have preserved. A local-flush-per-VMID approach could also
>>> reduce how often we need a full flush at all.
>>>
>>> Is there a reason we don't do local flushing instead? I see x86 and KVM
>>> use the same flush-all design on wrap, so I assume there's a reason I'm
>>> missing, I'd like to understand it.
>>
>> What do you mean here by "local flushing instead"? We are doing local flush:
>>
>>       if ( unlikely(need_flush) )
>>           local_hfence_gvma_all();
>>
>> Do you mean why we don't do hfence_gvma only for specific VMID?
>>
>> A vCPU's VMID is valid only while vmid->generation == data->generation
>> (vmid.c:141). Bumping the generation invalidates every vCPU's VMID on
>> this hart simultaneously, so every G-stage entry in the TLB (whatever
>> number it is tagged with) belongs to a (vcpu, vmid) binding that can
>> never be consulted again. Each of those vCPUs will be handed a fresh
>> number on its next vmenter before it can run.
>>
>> That includes the current vCPU, which is the case you're worried about.
>> At the wrap it is being assigned VMID 1, not its previous number, so its
>> old entries are unreachable regardless of whether we flush them.
>> hfence.gvma per retired VMID would preserve them physically but not
>> usefully [A concrete example. vCPU A is running on the hart with
>> VMID=100 in generation G; the TLB holds G-stage entries tagged VMID=100.
>> A wrap occurs: the generation becomes G+1, next_vmid is reset to 1, and
>> A is assigned VMID=1 (vmid.c:154). From that moment on, the hardware
>> looks up translations for A under the tag VMID=1. The entries tagged 100
>> will no longer match anything: A isn't 100 any more, and no one else
>> will be handed 100 until the next wrap.
>> So A loses its warm entries not because we did an hfence.gvma, but
>> because it was renumbered. The flush has nothing to do with it. It
>> merely discards what has already become unreachable.]; they'd just
>> occupy TLB capacity until natural eviction. Preserving them would
>> require a different allocator that keeps a vCPU's number stable across a
>> rollover (Linux/KVM-arm64 style, with an active/reserved set pinning
>> live ASIDs), not a different flush granularity.
>>
>> So x86's hvm_asid_handle_vmenter() and KVM's equivalent aren't doing
>> this out of inertia — with a round-robin generation allocator, the full
>> flush is free of useful collateral damage and strictly cheaper than the
>> alternative. Preserving entries across a rollover is a real
>> optimisation, but it's an allocator change, and IMO worth doing only if
>> profiling shows the wrap flush matters.
>>
>>>
>>>> H/VS CSRs, virtual timer and P2M context, and __context_switch() in assembly,
>>>> which switches Xen's own callee-saved state (and thereby the stack) from
>>>> prev to next. Virtual interrupt controller context switch will be
>>>> introduced later.
>>>>
>>>> Add offsets of struct arch_vcpu's xen_saved_context to asm-offsets.c for
>>>> use by __context_switch().
>>>>
>>>> henvcfg and htimedelta are 64-bit on both RV32 and RV64, so store them as
>>>> uint64_t and use csr_{read,write}64() instead of open-coding accesses to
>>>> the high halves.
>>>>
>>>> A hart which drops out of a domain's dirty_cpumask stops being a target
>>>> of p2m_tlb_flush() while its TLB may still hold G-stage translations of
>>>> that domain, and neither the vCPU which just ran nor any other vCPU of
>>>> that domain which ran there earlier has had its VMID invalidated. Move
>>>> the hart to a new VMID generation at that point: a VMID number is never
>>>> re-used until a full local flush has happened, hence none of those
>>>> translations can be reached again.
>>>>
>>>> Claim the VMID in p2m_ctxt_switch_to() rather than at the next guest
>>>> entry. VMIDs are a per-hart resource, so the (generation, vmid) pair a
>>>> migrating vCPU brings from another hart is meaningless here and may even
>>>> match this hart's current generation, leaving the vCPU under a VMID owned
>>>> by another domain. ctxt_switch_to() invalidates that pair, but claiming a
>>>> replacement only on guest entry is too late: p2m_ctxt_switch_to() has by
>>>> then already made HGATP live, and speculation can populate G-stage entries
>>>> of the incoming domain under the stale VMID. The local flush for a wrapped
>>>> generation moves along with the claim.
>>>>
>>>> That leaves p2m_handle_vmenter() with nothing to do, so drop it together
>>>> with its call from check_for_pcpu_work(). A VMID can only be invalidated
>>>> while its vCPU isn't running: vmid_flush_vcpu() is called for the vCPU
>>>> being switched in, and vmid_flush_hart() runs either from schedule_tail(),
>>>> ahead of ctxt_switch_to(), or from the wrap path of vmid_handle_vmenter()
>>>> itself. A P2M change on another hart doesn't invalidate it either, as
>>>> p2m_tlb_flush() drops the stale entries directly with
>>>> sbi_remote_hfence_gvma() instead of retiring the VMIDs which tag them. A
>>>> guest therefore always runs under the VMID claimed on its way in, and
>>>> there is nothing left for a guest entry hook to notice.
>>>>
>>>> p2m_handle_vmenter() also skipped the HGATP write when the VMID it claimed
>>>> was unchanged. That isn't carried over: HGATP holds the G-stage root as
>>>> well, and skipping the write is only correct where that root is already
>>>> the incoming domain's. On the guest entry path it is, on the context
>>>> switch path it is not.
>>>>
>>>> While at it, fix the inclusion order of headers in asm-offsets.c: Xen's
>>>> headers go first, then arch specific ones.
>>> This could have a dedicated patch no?
>>
>> It could but considering that it is pretty small fix I think it could be
>> part of this patch. If you are insisting on moving that to separate
>> patch I will happy to do that.
>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>
>>>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>>>> index ec327a5e8a..91a46d630f 100644
>>>> --- a/xen/arch/riscv/domain.c
>>>> +++ b/xen/arch/riscv/domain.c
>>>> @@ -11,9 +11,11 @@
>>>>    #include <asm/bitops.h>
>>>>    #include <asm/cpufeature.h>
>>>>    #include <asm/csr.h>
>>>> +#include <asm/current.h>
>>>>    #include <asm/intc.h>
>>>>    #include <asm/mmio.h>
>>>>    #include <asm/riscv_encoding.h>
>>>> +#include <asm/vmid.h>
>>>>    #include <asm/vtimer.h>
>>>>    
>>>>    struct csr_masks {
>>>> @@ -158,6 +160,8 @@ int arch_vcpu_create(struct vcpu *v)
>>>>        if ( is_idle_vcpu(v) )
>>>>            return 0;
>>>>    
>>>> +    v->arch.last_cpu = NR_CPUS;
>>>> +
>>>>        vcpu_csr_init(v);
>>>>    
>>>>        if ( (rc = vcpu_vtimer_init(v)) )
>>>> @@ -329,6 +333,169 @@ int arch_domain_create(struct domain *d,
>>>>        return rc;
>>>>    }
>>>>    
>>>> +static void save_csr_regs(struct vcpu *vcpu)
>>>> +{
>>>> +    /*
>>>> +     * There is no need to save these CSRs as only hypervisor writes them in
>>>> +     * restore_csr_regs() and guest can't access them so they shouldn't be
>>>> +     * stored here. Keep them commented here just for symmetry with the
>>>> +     * restore CSRs register part.
>>>> +     *
>>>> +     * vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
>>>> +     * vcpu->arch.hideleg = csr_read(CSR_HIDELEG);
>>>> +     * vcpu->arch.henvcfg = csr_read64(CSR_HENVCFG);
>>>> +     * vcpu->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
>>>> +     * vcpu->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
>>>> +     *
>>>> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>>>> +     *     vcpu->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
>>>> +     */
>>>> +
>>>> +    vcpu->arch.hvip = csr_read(CSR_HVIP);
>>>> +
>>>> +    vcpu->arch.vsstatus = csr_read(CSR_VSSTATUS);
>>>> +    vcpu->arch.vsie = csr_read(CSR_VSIE);
>>>
>>>
>>>> +    vcpu->arch.vstvec = csr_read(CSR_VSTVEC);
>>>> +    vcpu->arch.vsscratch = csr_read(CSR_VSSCRATCH);
>>>> +    vcpu->arch.vscause = csr_read(CSR_VSCAUSE);
>>>> +    vcpu->arch.vstval = csr_read(CSR_VSTVAL);
>>>> +    vcpu->arch.vsepc = csr_read(CSR_VSEPC);
>>>> +}
>>>> +
>>>> +static void restore_csr_regs(struct vcpu *vcpu)
>>>> +{
>>>> +    csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
>>>> +    csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
>>>> +    csr_write(CSR_HVIP, vcpu->arch.hvip);
>>>> +    csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
>>>> +    csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
>>>> +    csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
>>>> +
>>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>>>> +        csr_write(CSR_HSTATEEN0, vcpu->arch.hstateen0);
>>>> +
>>>> +    csr_write(CSR_VSSTATUS, vcpu->arch.vsstatus);
>>>> +    csr_write(CSR_VSIE, vcpu->arch.vsie);
>>>
>>>
>>>> +    csr_write(CSR_VSTVEC, vcpu->arch.vstvec);
>>>> +    csr_write(CSR_VSSCRATCH, vcpu->arch.vsscratch);
>>>> +    csr_write(CSR_VSCAUSE, vcpu->arch.vscause);
>>>> +    csr_write(CSR_VSTVAL, vcpu->arch.vstval);
>>>> +    csr_write(CSR_VSEPC, vcpu->arch.vsepc);
>>>> +}
>>>> +
>>>> +static void ctxt_switch_from(struct vcpu *p)
>>> Is it expected to have diverse names for the vcpu arg? Above it's vcpu,
>>> here it's p (I assume it's for `previous` but I think the _from alone is
>>> enough to understand) and below it's n. Shouldn't be better to keep the same name?
>>
>> Above should be used n.
> 
> Why would that be? n in such contexts stands for "next", while here
> it can only be "previous".

Sorry for confusion.

I meant for restore_csr_regs() and correpondingly p for save_csr_regs().

I will also renaim the function to cxt_switch_to/from style.

~ Oleksii

