Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9A5C79F89
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 08:17:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410649.1641441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3UXw-00058f-Jo; Mon, 07 Sep 2026 08:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410649.1641441; Mon, 07 Sep 2026 08:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3UXw-00058Y-H6; Mon, 07 Sep 2026 08:17:44 +0000
Received: by outflank-mailman (input) for mailman id 1410649;
 Mon, 07 Sep 2026 08:17:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3UXv-00058S-8X
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:17:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3UXu-00C5Nt-EC
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 10:17:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e7323-8faa-0a2a0a5109dd-0a2a450587ba-18
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:17:42 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e7326-4cb1-0a2a45050019-d155802caca8-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:17:42 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-495590dde14so46406695e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 01:17:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee6158e9sm376679445e9.12.2026.09.07.01.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 01:17:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1788769062; x=1789373862; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vXrpa2vGTgtGlYpl9YYOGu5SXAWi1wkcb5Ol8iXcrw=;
        b=KeZP2G7OYI/UN0YryRQbHq/As9ppzcGjlVVDFmc3rZxX6oGI829saw/SQ9j1PgKRwu
         66OHVKgPZpKJuse4LC3qkgXVTTlv0T7R6hIF81R20uibEiIWwKwoGZ0k7Vrry4MCvRgY
         4xMCaPYeEvrJi60dM3Uot3JBD3drlw9U/AoQZfiqalw8DlzZPW2GUFvTHVUKxA1CsFBS
         JjDnc9tpg853VnkpcRY+MC2LsZ/YKraIAgTOjHUhpuhLfmaHrZeKeGDH85RmnUjyOSo5
         h6zcyPgZrsK7M8zTmZS5diRz/RwLcPUWzhSQbXotz+oGio47JifGrDitYvI908GRoM94
         Af9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769062; x=1789373862;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vXrpa2vGTgtGlYpl9YYOGu5SXAWi1wkcb5Ol8iXcrw=;
        b=pcxKbGz43H5HupWGWRXuOo2y7OJQ0tQtMCBT1PR+7rFPrNOFKprFZ8HGnHwkJO4+sr
         j1AxtLO8vkA09fUxqlbOtEDY1X1Ez/WuNwhd+GXyDtPAw5OzCh4icoJFIlXDOBlqdciS
         1eOSpk5p9KLU8+AstCLEr5i85EyrL3tkmKpbSebz2s/qj8PFVR1xAQ465ihu3KvrjW2x
         eDCmLB9s8P3f5UFqbI1794TLE/0CIDVuAsg71UtpsbNnnm0JptFOolFsHXDRZcMBvWIX
         GWEmjP8EuicmsBXH019TgvnzvFA0tpxPeobfaB7CpoostH/N4X0W4ElUdptbPjl8n3LZ
         WUfg==
X-Gm-Message-State: AFuF++mLEV8krhRA3U/1Vby50jMQY/RynHWpXj7RZ7aawfAyqELSxVRB
	3t4awjnBLFPKjcS8HAzGR4Ia/Dpi5dWdKn5kPk0/9qE/++sducPRFBeGsEAdUtJNLw==
X-Gm-Gg: AYBFou1T6q3I/kgues17uQ+81LZd6/xz8ox5Hh6d1Xz/5C6SyeFx+5WQfOsU8/41Y0a
	y0i8FSDfPnJZt3Fwq/sTovXjEooC8FkNCxWzjgJjzVtIMlHCLsUnbq1IzOGVMWgzRtszamz6uUc
	MuyoGUhSNYsvsG1pBdgZneNSfTuGqDUR/u8PQEEXp7GLdpq/3vdiDgxWT/So5jtLp+6awwBtN/C
	7opT16rfAYEZVhk58fjknEROQmC/8toynYKzKOcLtXPiz0jXmrsBV7zTca8JrW+EoXsxSeugwOd
	xTvm0J8l7ZKdih4DE1UFPpk1vdEF18RRCmgKNpPkPco2CGyqlPP2ypmMQNDni8o5VXiXKlMyCNw
	Q+4/GA5Q6/pmdYmDb4QXcESRFnjbC6CbSWwed8oiNT9Vxb6OlDW8UpwE4nTrxF2XWbBqz78qV16
	cp8iY9i6nKSn49/Tj29DqJ8iUOZePWcBxCF2v88UdUuQd/Vl6zOeUQe7FmwKmUCviEooyB02UKM
	eYnjQCHMYic+WD2AsaxrWCP4gZOO30KaXw2IsKnivDr0SDpsmFR
X-Received: by 2002:a05:600c:860b:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49cf7fe62e9mr438063175e9.1.1788769061691;
        Mon, 07 Sep 2026 01:17:41 -0700 (PDT)
Message-ID: <c2dee5df-f360-4eba-85e5-02d9f0948aa9@suse.com>
Date: Mon, 7 Sep 2026 10:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <91c9abf0-a25f-42d0-9d55-61a9cc62e233@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1788769062-F46A52A1-3939C5D7/10/73395122804
X-purgate-type: spam
X-purgate-size: 10100

On 04.09.2026 16:55, Oleksii Kurochko wrote:
> 
> 
> On 9/4/26 10:26 AM, Baptiste Le Duc wrote:
>> As I understand it, a generation wrap doesn't retire a single VMID, it
>> resets next_vmid to 1, which makes every VMID in 1..max_vmid reusable
>> again in the new generation. We do a full (local) flush at that point to
>> avoid two different vCPUs ending up with the same VMID valid at once,
>> across generations.
>>
>> If this is correct, doing a full flush there also throws away entries
>> for the current vCPU that a local HFENCE.GVMA(vmid) per retired VMID
> 
> We are doing flushed for the pCPU on which a vCPU is ran.
> 
>> could have preserved. A local-flush-per-VMID approach could also
>> reduce how often we need a full flush at all.
>>
>> Is there a reason we don't do local flushing instead? I see x86 and KVM
>> use the same flush-all design on wrap, so I assume there's a reason I'm
>> missing, I'd like to understand it.
> 
> What do you mean here by "local flushing instead"? We are doing local flush:
> 
>      if ( unlikely(need_flush) )
>          local_hfence_gvma_all();
> 
> Do you mean why we don't do hfence_gvma only for specific VMID?
> 
> A vCPU's VMID is valid only while vmid->generation == data->generation 
> (vmid.c:141). Bumping the generation invalidates every vCPU's VMID on 
> this hart simultaneously, so every G-stage entry in the TLB (whatever 
> number it is tagged with) belongs to a (vcpu, vmid) binding that can 
> never be consulted again. Each of those vCPUs will be handed a fresh 
> number on its next vmenter before it can run.
> 
> That includes the current vCPU, which is the case you're worried about. 
> At the wrap it is being assigned VMID 1, not its previous number, so its 
> old entries are unreachable regardless of whether we flush them. 
> hfence.gvma per retired VMID would preserve them physically but not 
> usefully [A concrete example. vCPU A is running on the hart with 
> VMID=100 in generation G; the TLB holds G-stage entries tagged VMID=100. 
> A wrap occurs: the generation becomes G+1, next_vmid is reset to 1, and 
> A is assigned VMID=1 (vmid.c:154). From that moment on, the hardware 
> looks up translations for A under the tag VMID=1. The entries tagged 100 
> will no longer match anything: A isn't 100 any more, and no one else 
> will be handed 100 until the next wrap.
> So A loses its warm entries not because we did an hfence.gvma, but 
> because it was renumbered. The flush has nothing to do with it. It 
> merely discards what has already become unreachable.]; they'd just 
> occupy TLB capacity until natural eviction. Preserving them would 
> require a different allocator that keeps a vCPU's number stable across a 
> rollover (Linux/KVM-arm64 style, with an active/reserved set pinning 
> live ASIDs), not a different flush granularity.
> 
> So x86's hvm_asid_handle_vmenter() and KVM's equivalent aren't doing 
> this out of inertia — with a round-robin generation allocator, the full 
> flush is free of useful collateral damage and strictly cheaper than the 
> alternative. Preserving entries across a rollover is a real 
> optimisation, but it's an allocator change, and IMO worth doing only if 
> profiling shows the wrap flush matters.
> 
>>
>>> H/VS CSRs, virtual timer and P2M context, and __context_switch() in assembly,
>>> which switches Xen's own callee-saved state (and thereby the stack) from
>>> prev to next. Virtual interrupt controller context switch will be
>>> introduced later.
>>>
>>> Add offsets of struct arch_vcpu's xen_saved_context to asm-offsets.c for
>>> use by __context_switch().
>>>
>>> henvcfg and htimedelta are 64-bit on both RV32 and RV64, so store them as
>>> uint64_t and use csr_{read,write}64() instead of open-coding accesses to
>>> the high halves.
>>>
>>> A hart which drops out of a domain's dirty_cpumask stops being a target
>>> of p2m_tlb_flush() while its TLB may still hold G-stage translations of
>>> that domain, and neither the vCPU which just ran nor any other vCPU of
>>> that domain which ran there earlier has had its VMID invalidated. Move
>>> the hart to a new VMID generation at that point: a VMID number is never
>>> re-used until a full local flush has happened, hence none of those
>>> translations can be reached again.
>>>
>>> Claim the VMID in p2m_ctxt_switch_to() rather than at the next guest
>>> entry. VMIDs are a per-hart resource, so the (generation, vmid) pair a
>>> migrating vCPU brings from another hart is meaningless here and may even
>>> match this hart's current generation, leaving the vCPU under a VMID owned
>>> by another domain. ctxt_switch_to() invalidates that pair, but claiming a
>>> replacement only on guest entry is too late: p2m_ctxt_switch_to() has by
>>> then already made HGATP live, and speculation can populate G-stage entries
>>> of the incoming domain under the stale VMID. The local flush for a wrapped
>>> generation moves along with the claim.
>>>
>>> That leaves p2m_handle_vmenter() with nothing to do, so drop it together
>>> with its call from check_for_pcpu_work(). A VMID can only be invalidated
>>> while its vCPU isn't running: vmid_flush_vcpu() is called for the vCPU
>>> being switched in, and vmid_flush_hart() runs either from schedule_tail(),
>>> ahead of ctxt_switch_to(), or from the wrap path of vmid_handle_vmenter()
>>> itself. A P2M change on another hart doesn't invalidate it either, as
>>> p2m_tlb_flush() drops the stale entries directly with
>>> sbi_remote_hfence_gvma() instead of retiring the VMIDs which tag them. A
>>> guest therefore always runs under the VMID claimed on its way in, and
>>> there is nothing left for a guest entry hook to notice.
>>>
>>> p2m_handle_vmenter() also skipped the HGATP write when the VMID it claimed
>>> was unchanged. That isn't carried over: HGATP holds the G-stage root as
>>> well, and skipping the write is only correct where that root is already
>>> the incoming domain's. On the guest entry path it is, on the context
>>> switch path it is not.
>>>
>>> While at it, fix the inclusion order of headers in asm-offsets.c: Xen's
>>> headers go first, then arch specific ones.
>> This could have a dedicated patch no?
> 
> It could but considering that it is pretty small fix I think it could be 
> part of this patch. If you are insisting on moving that to separate 
> patch I will happy to do that.
> 
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>>> index ec327a5e8a..91a46d630f 100644
>>> --- a/xen/arch/riscv/domain.c
>>> +++ b/xen/arch/riscv/domain.c
>>> @@ -11,9 +11,11 @@
>>>   #include <asm/bitops.h>
>>>   #include <asm/cpufeature.h>
>>>   #include <asm/csr.h>
>>> +#include <asm/current.h>
>>>   #include <asm/intc.h>
>>>   #include <asm/mmio.h>
>>>   #include <asm/riscv_encoding.h>
>>> +#include <asm/vmid.h>
>>>   #include <asm/vtimer.h>
>>>   
>>>   struct csr_masks {
>>> @@ -158,6 +160,8 @@ int arch_vcpu_create(struct vcpu *v)
>>>       if ( is_idle_vcpu(v) )
>>>           return 0;
>>>   
>>> +    v->arch.last_cpu = NR_CPUS;
>>> +
>>>       vcpu_csr_init(v);
>>>   
>>>       if ( (rc = vcpu_vtimer_init(v)) )
>>> @@ -329,6 +333,169 @@ int arch_domain_create(struct domain *d,
>>>       return rc;
>>>   }
>>>   
>>> +static void save_csr_regs(struct vcpu *vcpu)
>>> +{
>>> +    /*
>>> +     * There is no need to save these CSRs as only hypervisor writes them in
>>> +     * restore_csr_regs() and guest can't access them so they shouldn't be
>>> +     * stored here. Keep them commented here just for symmetry with the
>>> +     * restore CSRs register part.
>>> +     *
>>> +     * vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
>>> +     * vcpu->arch.hideleg = csr_read(CSR_HIDELEG);
>>> +     * vcpu->arch.henvcfg = csr_read64(CSR_HENVCFG);
>>> +     * vcpu->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
>>> +     * vcpu->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
>>> +     *
>>> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>>> +     *     vcpu->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
>>> +     */
>>> +
>>> +    vcpu->arch.hvip = csr_read(CSR_HVIP);
>>> +
>>> +    vcpu->arch.vsstatus = csr_read(CSR_VSSTATUS);
>>> +    vcpu->arch.vsie = csr_read(CSR_VSIE);
>>
>>
>>> +    vcpu->arch.vstvec = csr_read(CSR_VSTVEC);
>>> +    vcpu->arch.vsscratch = csr_read(CSR_VSSCRATCH);
>>> +    vcpu->arch.vscause = csr_read(CSR_VSCAUSE);
>>> +    vcpu->arch.vstval = csr_read(CSR_VSTVAL);
>>> +    vcpu->arch.vsepc = csr_read(CSR_VSEPC);
>>> +}
>>> +
>>> +static void restore_csr_regs(struct vcpu *vcpu)
>>> +{
>>> +    csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
>>> +    csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
>>> +    csr_write(CSR_HVIP, vcpu->arch.hvip);
>>> +    csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
>>> +    csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
>>> +    csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
>>> +
>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>>> +        csr_write(CSR_HSTATEEN0, vcpu->arch.hstateen0);
>>> +
>>> +    csr_write(CSR_VSSTATUS, vcpu->arch.vsstatus);
>>> +    csr_write(CSR_VSIE, vcpu->arch.vsie);
>>
>>
>>> +    csr_write(CSR_VSTVEC, vcpu->arch.vstvec);
>>> +    csr_write(CSR_VSSCRATCH, vcpu->arch.vsscratch);
>>> +    csr_write(CSR_VSCAUSE, vcpu->arch.vscause);
>>> +    csr_write(CSR_VSTVAL, vcpu->arch.vstval);
>>> +    csr_write(CSR_VSEPC, vcpu->arch.vsepc);
>>> +}
>>> +
>>> +static void ctxt_switch_from(struct vcpu *p)
>> Is it expected to have diverse names for the vcpu arg? Above it's vcpu,
>> here it's p (I assume it's for `previous` but I think the _from alone is
>> enough to understand) and below it's n. Shouldn't be better to keep the same name?
> 
> Above should be used n.

Why would that be? n in such contexts stands for "next", while here
it can only be "previous".

Jan

