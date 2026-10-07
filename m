Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0555BCA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 08:04:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442016.1659529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEMdO-0004WK-O9; Wed, 07 Oct 2026 08:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442016.1659529; Wed, 07 Oct 2026 08:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEMdO-0004WD-LU; Wed, 07 Oct 2026 08:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1442016;
 Wed, 07 Oct 2026 08:04:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEMdN-0004W6-JT
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 08:04:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEMdN-00BgAJ-0E
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:04:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac5fcf1-2eae-0a2a0a5409dd-0a2a4505e886-48
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:04:16 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac5fd00-4cb1-0a2a45050019-d1558029d44d-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:04:16 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a02667ccebso12321325e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 01:04:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f4480a4sm37883315e9.0.2026.10.07.01.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 01:04:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1791360256; x=1791965056; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFvLNkFrmQ9GmESvDDrjahsnp3/aj+8+4G1fgvZAmw4=;
        b=FQUN30/nev7yU0hynJjgvyvq3OOf8VWnDYMs8AtEbqqourIm+5qjDksG8HdS0JyavA
         qmPtFd0JAgz2YMPBMpA6l0GVZBwrw1BToekg/lCmA9vpmGUWGsiIHzdCp39f778URf6f
         eiI62Kz9Ep8nV+2LlFYIFtA0Y3QRXRb03Di909ICfhJGn4bdzaTiwNIQtUQseVJMiUBi
         3Yt4GctuE3VoQObiTy8eQw8OfggZ/JVDW/JhhkUF4kFldV+sPb8/9HJO9mp1Gvy5w3ll
         dQ4U6p4yQdTmn9nzKcmd3eUIGD+k5eFPzFOiuFKKxPnu+NfyK7BiMP+Wvc8B8DDzlb0J
         AuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791360256; x=1791965056;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFvLNkFrmQ9GmESvDDrjahsnp3/aj+8+4G1fgvZAmw4=;
        b=kRnXbwdT8co/LvWlMlszTumwhVGkBNyCK9DwMF97gGfTayi9GEA/gadbbyr/LkOc8A
         kxQ7d4LqixfIn+obzXGyZ3K6kPeHFYBJzLSpzzxFmx4yvDo762/ni79lvFfS1XcQP+fa
         Waox0NEYfOms2Y9Mvd2fTuSg9UnKIrVwNTMkf3Tw0EfGSEURjVtrJIedoKOnzI7F6dYH
         eZTOR8gb4zIeYPBoloZZi0TjJi3BuBTAAfj3ulnrB81dZFfiySL6iNwsGWbuken9eNRW
         P1UjaGFJ4E5uc235CpGE+2M7PCNQtWZj1/83fxMaGIZDvh5z+7DT4ftK9lGxqXDmhv8g
         uZCw==
X-Gm-Message-State: AFuF++m18bUv1xApQjS0tM4VIkJDTsgb4vTUmaOfpdPSOlNTDMUBAX9a
	dXnetRXaWXZEY3WO/22f4YUj7v/4KPrYRKeKf9q+sK5KXSKw2Qos1Te/jZ5SrG5qyQ==
X-Gm-Gg: AYBFou1/UYy5v5ScJWOgytkNROLeFin5Ub/81iq+w3W5as5L+huZWSpeMo3gu9i818s
	i0yZcYNuj5iat7SQ4Mt9U0sUYSXKPslniV7GhfMemInI/w4Pt9D4wMZo+jFDf+xhWh6MKmzkQsx
	ftSog9bwBZvEDaUmX9uOeR7NMmx6vKbZtwkrZSauXHHyXENJhuhqG3x6wDfS9DcCZ06OjYxDdJA
	zxrDyAsW/5CV4JSldy3SP5yAI+nQP9VoQITRIAWdeYMPkQczeH5Lp+p2aUUxaX4/nY2/xkDS0gj
	LpYgbT34m5PIEA990JiVQUpj9i4C9THC1Q0X/47mU1p2FlrdrXyMtFm8yldR0+UkROESV/vXhAz
	7hUXZod42YPlRoUpxv0a2mpQMkeiH5C6iXyktXoUt5ZewxW58gd7t1IjMUNyR0+QnDrX/+N6JPH
	YDB+zVuyD8SZ5fiohdkcwS85qhryaChRuHu5tmAjV4ySEr6+4uWA7HH/wjkJy4/WpSXSTl6s9Qn
	fuF4xRH3sN/3J/aE5NUYAkT21Fa7+UFI5Vb1A/bFmCpT1Lab2f7EADA8kc4b4W3H8UYcFT8pg==
X-Received: by 2002:a05:600c:4ecb:b0:49f:ff7b:f056 with SMTP id 5b1f17b1804b1-4a180409410mr18598795e9.9.1791360254656;
        Wed, 07 Oct 2026 01:04:14 -0700 (PDT)
Message-ID: <2d5f2558-e4f7-43d5-888c-36727519270d@suse.com>
Date: Wed, 7 Oct 2026 10:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/39] xen/riscv: implement vCPU context switching
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
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
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <6e539cc5ded7f62c4347781785af714840893184.1790779209.git.oleksii.kurochko@gmail.com>
 <1791305420.8631fc262581453bbf619ec5b2062170.1a1121f8fef0003f66@vates.tech>
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
In-Reply-To: <1791305420.8631fc262581453bbf619ec5b2062170.1a1121f8fef0003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791360256-F64B42A1-52A83C43/10/78276251493
X-purgate-type: spam
X-purgate-size: 13836

On 06.10.2026 18:50, Baptiste Le Duc wrote:
>> Implement context_switch() and the helpers it needs: save/restore of
>> H/VS CSRs, virtual timer and P2M context, and __context_switch() in
>> assembly, which switches Xen's own callee-saved state (and thereby the
>> stack) from prev to next. The virtual interrupt controller state isn't
>> switched here.
>>
>> Add offsets of struct arch_vcpu's xen_saved_context to asm-offsets.c for
>> use by __context_switch().
>>
>> henvcfg, htimedelta and vsie are 64-bit on both RV32 and RV64, so store
>> them as uint64_t and access them with csr_{read,write}64(). For that
>> purpose introduce csr_read64().
>>
>> The VMID has to be claimed on the context switch rather than on guest
>> entry: once p2m_ctxt_switch_to() writes HGATP, speculation can populate
>> G-stage entries under whatever VMID is written there. This is done by
>> p2m_vmid_switch_to(), called right before the HGATP write:
>>
>>  - VMIDs are a per-hart resource, so the (generation, vmid) pair of a
>>    vCPU which last ran on another hart is invalidated before a VMID is
>>    claimed for it. The local flush for a wrapped generation moves along
>>    with the claim.
>>  - Nothing is switched in for the idle vCPU, so HGATP keeps pointing at
>>    the p2m of the domain which ran on the hart last. Track that domain
>>    per hart (hgatp_owner) and keep the hart in its dirty_cpumask until a
>>    vCPU of another domain is switched in: p2m_tlb_flush() then goes on
>>    reaching the hart, and a domain which idles between two runs on the
>>    same hart keeps its VMIDs.
>>  - When the owner changes, the hart leaves the old owner's dirty_cpumask
>>    while its TLB may still hold that domain's G-stage translations, so it
>>    is moved to a new VMID generation, which makes none of them reachable
>>    again. It joins the new owner's dirty_cpumask before HGATP is written;
>>    a full barrier there, paired with one in p2m_tlb_flush(), guarantees
>>    that a concurrent P2M change either reaches the hart with an
>>    HFENCE.GVMA or is visible to it before it walks the p2m.
>>
>> That leaves p2m_handle_vmenter() with nothing to do, so drop it together
>> with its call from check_for_pcpu_work(): a VMID is only ever invalidated
>> while its vCPU isn't running, and p2m_tlb_flush() drops stale entries
>> with a remote HFENCE.GVMA rather than by retiring VMIDs. Unlike
>> p2m_handle_vmenter(), HGATP is written unconditionally, as it holds the
>> G-stage root too, which on a context switch belongs to another domain.
>>
>> While at it, fix the inclusion order of headers in asm-offsets.c: Xen's
>> headers go first, then arch specific ones.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>>  - Update the commit message.
>>  - Introduce csr_read64(), as vsie is 64-bit on RV32 too, i.e. has to be
>>    accessed as the vsie/vsieh pair there.
>>  - Make vsie declared as uint64_t instead of register_t.
>>  - Rename the parameter of save_csr_regs() to p and of restore_csr_regs()
>>    to n, to match their callers ctxt_switch_from()/ctxt_switch_to() and the
>>    rest of the context switch helpers (p2m_ctxt_switch_{from,to}(),
>>    vtimer_ctxt_switch_{from,to}()).
>>  - s/save_csr_regs/csr_regs_ctxt_switch_from/
>>  - s/restore_csr_regs/csr_regs_ctxt_switch_to/
>>  - Drop the forward declaration of struct vcpu in <asm/system.h>: the
>>    return type of __context_switch() already declares the tag at file
>>    scope.
>>  - Make the next parameter of __context_switch() pointer-to-const, as
>>    next's saved context is only read.
>>  - Extend the comment above __context_switch(): as ra is switched too, it
>>    doesn't return to its caller, but to where next last called it from
>>    (next's own context_switch(), or continue_new_vcpu() for a vCPU which
>>    has never run).
>>  - Call vtimer_ctxt_switch_to() after csr_regs_ctxt_switch_to(), so that
>>    ctxt_switch_to() restores state in the reverse order of
>>    ctxt_switch_from() saving it.
>>  - Rework p2m's VMID handling in the context switch: track the domain
>>    whose p2m HGATP points at in a per-CPU hgatp_owner, so a pass through
>>    idle no longer drops the hart from that domain's dirty_cpumask nor
>>    burns a VMID generation; move the dirty_cpumask update and the
>>    invalidation of a VMID brought from another hart from schedule_tail()
>>    and ctxt_switch_to() to p2m_ctxt_switch_to(), next to the VMID claim;
>>    add the barriers ordering the dirty_cpumask update against
>>    p2m_tlb_flush().
>>  - Initialise arch_vcpu.last_cpu to CPU_NONE instead of NR_CPUS.
>>  - Mark prev's dirty_cpu clean before ctxt_switch_to() and set current's
>>    after it.
>> ---
>> Changes in v2:
>>  - New patch.
>> ---
>> ---
>>  xen/arch/riscv/domain.c              | 127 ++++++++++++++++++++++
>>  xen/arch/riscv/entry.S               |  48 ++++++++
>>  xen/arch/riscv/include/asm/csr.h     |  13 +++
>>  xen/arch/riscv/include/asm/domain.h  |  15 ++-
>>  xen/arch/riscv/include/asm/p2m.h     |   1 -
>>  xen/arch/riscv/include/asm/system.h  |   2 +
>>  xen/arch/riscv/p2m.c                 | 157 ++++++++++++++++++---------
>>  xen/arch/riscv/riscv64/asm-offsets.c |  19 +++-
>>  xen/arch/riscv/stubs.c               |   5 -
>>  xen/arch/riscv/traps.c               |   2 -
>>  10 files changed, 330 insertions(+), 59 deletions(-)
>>
>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>> index fd62296356..f80643e2d8 100644
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -11,6 +11,7 @@
>>  #include <asm/bitops.h>
>>  #include <asm/cpufeature.h>
>>  #include <asm/csr.h>
>> +#include <asm/current.h>
>>  #include <asm/intc.h>
>>  #include <asm/mmio.h>
>>  #include <asm/riscv_encoding.h>
>> @@ -152,6 +153,8 @@ int arch_vcpu_create(struct vcpu *v)
>>      if ( is_idle_vcpu(v) )
>>          return 0;
>>  
>> +    v->arch.last_cpu = CPU_NONE;
>> +
>>      vcpu_csr_init(v);
>>  
>>      if ( (rc = vcpu_vtimer_init(v)) )
>> @@ -323,6 +326,130 @@ int arch_domain_create(struct domain *d,
>>      return rc;
>>  }
>>  
>> +static void csr_regs_ctxt_switch_from(struct vcpu *p)
>> +{
>> +    /*
>> +     * There is no need to save these CSRs as only hypervisor writes them in
>> +     * csr_regs_ctxt_switch_to() and guest can't access them so they shouldn't
>> +     * be stored here. Keep them commented here just for symmetry with the
>> +     * restore CSRs register part.
>> +     *
>> +     * p->arch.hedeleg = csr_read(CSR_HEDELEG);
>> +     * p->arch.hideleg = csr_read(CSR_HIDELEG);
>> +     * p->arch.henvcfg = csr_read64(CSR_HENVCFG);
>> +     * p->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
>> +     * p->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
>> +     *
>> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +     *     p->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
>> +     */
>> +
>> +    p->arch.hvip = csr_read(CSR_HVIP);
>> +
>> +    p->arch.vsstatus = csr_read(CSR_VSSTATUS);
>> +    p->arch.vsie = csr_read64(CSR_VSIE);
>> +    p->arch.vstvec = csr_read(CSR_VSTVEC);
>> +    p->arch.vsscratch = csr_read(CSR_VSSCRATCH);
>> +    p->arch.vscause = csr_read(CSR_VSCAUSE);
>> +    p->arch.vstval = csr_read(CSR_VSTVAL);
>> +    p->arch.vsepc = csr_read(CSR_VSEPC);
>> +}
>> +
>> +static void csr_regs_ctxt_switch_to(struct vcpu *n)
>> +{
>> +    csr_write(CSR_HEDELEG, n->arch.hedeleg);
>> +    csr_write(CSR_HIDELEG, n->arch.hideleg);
>> +    csr_write(CSR_HVIP, n->arch.hvip);
>> +    csr_write64(CSR_HENVCFG, n->arch.henvcfg);
>> +    csr_write(CSR_HCOUNTEREN, n->arch.hcounteren);
>> +    csr_write64(CSR_HTIMEDELTA, n->arch.htimedelta);
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +        csr_write(CSR_HSTATEEN0, n->arch.hstateen0);
>> +
>> +    csr_write(CSR_VSSTATUS, n->arch.vsstatus);
>> +    csr_write64(CSR_VSIE, n->arch.vsie);
>> +    csr_write(CSR_VSTVEC, n->arch.vstvec);
>> +    csr_write(CSR_VSSCRATCH, n->arch.vsscratch);
>> +    csr_write(CSR_VSCAUSE, n->arch.vscause);
>> +    csr_write(CSR_VSTVAL, n->arch.vstval);
>> +    csr_write(CSR_VSEPC, n->arch.vsepc);
>> +}
>> +
>> +static void ctxt_switch_from(struct vcpu *p)
>> +{
>> +    /*
>> +     * When the idle VCPU is running, Xen will always stay in hypervisor
>> +     * mode.
>> +     * Therefore we don't need to save the context of an idle VCPU.
>> +     */
>> +    if ( is_idle_vcpu(p) )
>> +        return;
>> +
>> +    p2m_ctxt_switch_from(p);
>> +
>> +    vtimer_ctxt_switch_from(p);
>> +
>> +    csr_regs_ctxt_switch_from(p);
>> +}
>> +
>> +static void ctxt_switch_to(struct vcpu *n)
>> +{
>> +    /*
>> +     * When the idle VCPU is running, Xen will always stay in hypervisor
>> +     * mode.
>> +     * Therefore we don't need to restore the context of an idle VCPU.
>> +     */
>> +    if ( is_idle_vcpu(n) )
>> +        return;
>> +
>> +    csr_regs_ctxt_switch_to(n);
>> +
>> +    vtimer_ctxt_switch_to(n);
>> +
>> +    p2m_ctxt_switch_to(n);
>> +}
>> +
>> +static void schedule_tail(struct vcpu *prev)
>> +{
>> +    unsigned int cpu = smp_processor_id();
>> +
>> +    ASSERT(prev != current);
>> +
>> +    ctxt_switch_from(prev);
>> +
>> +    write_atomic(&prev->dirty_cpu, VCPU_CPU_CLEAN);
>> +
>> +    ctxt_switch_to(current);
>> +
>> +    write_atomic(&current->dirty_cpu, cpu);
>> +
>> +    current->arch.last_cpu = cpu;
>> +
>> +    /*
>> +     * sched_context_switched() internally uses a spinlock,
>> +     * which requires interrupts to be enabled.
>> +     */
>> +    local_irq_enable();
>> +
>> +    sched_context_switched(prev, current);
>> +}
>> +
>> +void context_switch(struct vcpu *prev, struct vcpu *next)
>> +{
>> +    ASSERT(local_irq_is_enabled());
>> +    ASSERT(prev != next);
>> +    ASSERT(!vcpu_cpu_dirty(next));
>> +
>> +    local_irq_disable();
>> +
>> +    set_current(next);
>> +
>> +    prev = __context_switch(prev, next);
>> +
>> +    schedule_tail(prev);
>> +}
>> +
>>  static void __init __maybe_unused build_assertions(void)
>>  {
>>      /*
>> diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
>> index 202a35fb03..017fbb0626 100644
>> --- a/xen/arch/riscv/entry.S
>> +++ b/xen/arch/riscv/entry.S
>> @@ -99,3 +99,51 @@ restore_registers:
>>  
>>          sret
>>  END(handle_trap)
>> +
>> +/*
>> + * struct vcpu *__context_switch(struct vcpu *prev, const struct vcpu *next)
>> + *
>> + * This is called on prev's stack, and returns on next's. As ra is
>> + * switched too, it doesn't return to its caller: it returns to where
>> + * next last called it from, i.e. into next's own context_switch(), or,
>> + * for a vCPU which has never run, to continue_new_vcpu() with an empty
>> + * stack.
>> + *
>> + * a0 - prev
>> + * a1 - next
>> + *
>> + * Returns prev in a0
>> + */
>> +FUNC(__context_switch)
>> +        REG_S   s0, VCPU_XEN_SAVED_CONTEXT_S0(a0)
>> +        REG_S   s1, VCPU_XEN_SAVED_CONTEXT_S1(a0)
>> +        REG_S   s2, VCPU_XEN_SAVED_CONTEXT_S2(a0)
>> +        REG_S   s3, VCPU_XEN_SAVED_CONTEXT_S3(a0)
>> +        REG_S   s4, VCPU_XEN_SAVED_CONTEXT_S4(a0)
>> +        REG_S   s5, VCPU_XEN_SAVED_CONTEXT_S5(a0)
>> +        REG_S   s6, VCPU_XEN_SAVED_CONTEXT_S6(a0)
>> +        REG_S   s7, VCPU_XEN_SAVED_CONTEXT_S7(a0)
>> +        REG_S   s8, VCPU_XEN_SAVED_CONTEXT_S8(a0)
>> +        REG_S   s9, VCPU_XEN_SAVED_CONTEXT_S9(a0)
>> +        REG_S   s10, VCPU_XEN_SAVED_CONTEXT_S10(a0)
>> +        REG_S   s11, VCPU_XEN_SAVED_CONTEXT_S11(a0)
>> +        REG_S   sp, VCPU_XEN_SAVED_CONTEXT_SP(a0)
>> +        REG_S   ra, VCPU_XEN_SAVED_CONTEXT_RA(a0)
>> +
>> +        REG_L   s0, VCPU_XEN_SAVED_CONTEXT_S0(a1)
>> +        REG_L   s1, VCPU_XEN_SAVED_CONTEXT_S1(a1)
>> +        REG_L   s2, VCPU_XEN_SAVED_CONTEXT_S2(a1)
>> +        REG_L   s3, VCPU_XEN_SAVED_CONTEXT_S3(a1)
>> +        REG_L   s4, VCPU_XEN_SAVED_CONTEXT_S4(a1)
>> +        REG_L   s5, VCPU_XEN_SAVED_CONTEXT_S5(a1)
>> +        REG_L   s6, VCPU_XEN_SAVED_CONTEXT_S6(a1)
>> +        REG_L   s7, VCPU_XEN_SAVED_CONTEXT_S7(a1)
>> +        REG_L   s8, VCPU_XEN_SAVED_CONTEXT_S8(a1)
>> +        REG_L   s9, VCPU_XEN_SAVED_CONTEXT_S9(a1)
>> +        REG_L   s10, VCPU_XEN_SAVED_CONTEXT_S10(a1)
>> +        REG_L   s11, VCPU_XEN_SAVED_CONTEXT_S11(a1)
>> +        REG_L   sp, VCPU_XEN_SAVED_CONTEXT_SP(a1)
>> +        REG_L   ra, VCPU_XEN_SAVED_CONTEXT_RA(a1)
>> +
>> +        ret
>> +END(__context_switch)

First: None of the reply context above is relevant in your reply. Why
did you keep it? As indicated before, this way you make every reader
scroll through many lines, until they would finally find the first
piece of the actual reply. (I've deliberately kept it all, to show
the percentage of the overall reply that this occupied.)

>> --- a/xen/arch/riscv/include/asm/csr.h
>> +++ b/xen/arch/riscv/include/asm/csr.h
>> @@ -40,6 +40,13 @@
>>      csr_write(csr ## H, v_ >> 32);  \
>>  })
>>  
>> +#define csr_read64(csr)                 \
>> +({                                      \
>> +    uint64_t v_ = csr_read(csr ## H);   \
> This violates Misra 20.12 rule (docs/misra/rules.rst) as we use macro
> parameter `csr` as an operand of ##, while it could be expanded as a
> macro (e.g. csr_read64(CSR_HENVCFG)).

Yes. But: You say nothing as to a possible (and plausible) different
way of coding this. Imo the best way to deal with this is by a
deviation (iirc we already have a few), yet I don't think we're going
to add deviations for RISC-V until we actually are about to routinely
scan the code.

Jan

