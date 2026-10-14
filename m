Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD2BCC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:43:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449066.1664996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzG0-0000CE-Dv; Wed, 14 Oct 2026 13:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449066.1664996; Wed, 14 Oct 2026 13:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzG0-0000C7-9t; Wed, 14 Oct 2026 13:43:00 +0000
Received: by outflank-mailman (input) for mailman id 1449066;
 Wed, 14 Oct 2026 13:42:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGzFy-0000By-Eh
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:42:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGzFx-00GjWO-Dd
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:42:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf86d5-bab6-0a2a0a5309dd-0a2a450ac41c-32
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:42:57 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf86e0-f2d2-0a2a450a0019-d155802ef0c8-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:42:56 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso9144695e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 06:42:56 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs378609.centertel.pl. [37.47.110.50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de70079e7sm6961579f8f.11.2026.10.14.06.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 06:42:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791985376; x=1792590176; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sb7HbZHmKmSEPYv5vVLskDslIZvepgWW0bExtidSFNM=;
        b=C8jdStkxzCwT6QwoH14UBvqWI0LSsT62wnlfiCrimV+ug7vqRbPB0xh6Q/q6AwSEZx
         aTtcNiqGxlhk517C9sCuFcRMr0gDgJTogPZYKfpFRwDXY4hM3ihTIdcLOTEEHEMaRLJ3
         mBZ4JmmNMC4VPPaxMJwjXhvqFEZuBYbv/w9sRg3idBS4Qtd6yMk1VqICkpFrABfj4d7C
         wchqi83+2HZ8FTWt0GKoEPlPzU25yEexcB5rFKDq6M0Rcs9wSjGNxi1iGms27WRetn5H
         M+q2Mi/0QlRGXzw3JVpbCkiakwvogsSyEm8JZO0XNxhNAwbXSHeR7mqbxCY9jL6/cuj3
         i1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985376; x=1792590176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sb7HbZHmKmSEPYv5vVLskDslIZvepgWW0bExtidSFNM=;
        b=eAJdVr78NlHu+fR0YaPT0Yj64ZQ5gDn/veTsqDjrzCqR222n/IwZ2X4FcI0Xlxx+1+
         mabRNVbEKcRMPnp8WEWun93G5/ruvljZvKRZd+PNis2oQdjXH+IaSTC9bbWbQki4RHch
         oOdWbT0BRYR8bw1QgxU26yoCS1N8+xxoowp9TdOcEJBRHzUyc/Z/aIm2pzIV6DKqZ4Yo
         B26wlejLOsvboUP9KdAAqVkcaLi3uPgqWzSL1xqtAcnORbUH8iJklaWq0nM/lX5BhRmL
         /26jnfikRDJFPITgwx8SmInRmrX0Gnh2plKXk+95+D15EEAjjiIwKDLNBXjiMdzy9kjb
         OCOQ==
X-Gm-Message-State: AFq9FYI/wgbB12gQ5e+wTpu+i6YYAnJM778VdC5GvpDf2yh71Z20k4rn
	HfgzQM5Ieen2FwKXVkwceI3nrv0UgTe79KtsHa18JzVEl6exw5noB01f
X-Gm-Gg: AYBFou3CVa/Nb+zT/0PIHMx3kuisgTbMFUqDyC7p5D35QaKVcV2t7m6RZCwjWEYdhyW
	eMzm4bKMCl2+wEZIGoJnx9kvRNGrtruHEu9g8/JPIESZDROkAm1amYBThMYN9eUeo1rYYDv8WMN
	++9cyKRWHhqUrVQiaDZ/g3sFKZ7nd1O9/lDbMADce9n6qYKVrYD85ygDKJwuyr31lsqAJZE6N1q
	Nhh/L2s5OsZXf9ttMsGY2PD5IjYF7Dhpvgd0Rzv/wC+15qY7bSNDNiEDuJu9z5YSdFdnF+JM1iC
	sgdfxM1KjRq4mE48qZA4LDyZqvskWufxpL7/IKEsXXjSKOsiW8+470wZ8+vKsDAOyic4phpupQO
	PgXkEvPSMTxhj7mE0NUgZWPScZFto8ACV1FYsJso7KbSy9TC8AcOF9f3OaLd8ZOTDM+yqbgYXx4
	Z2K2XdAb5gAuIDlgZ9tL0FfCXW9iMtQDrygOUlPQn9tJ8xoilZKY5x96BpTNusEXggY2ZiZpkmz
	hAmRSqFzq3NeLZyvSg2wqxLTCGKVviiOlQyXQ8=
X-Received: by 2002:a05:600c:8b09:b0:4a1:6f78:842f with SMTP id 5b1f17b1804b1-4a18e4987b8mr331719405e9.11.1791985376245;
        Wed, 14 Oct 2026 06:42:56 -0700 (PDT)
Message-ID: <c0addc90-24d3-4139-9cc4-001cfb745020@gmail.com>
Date: Wed, 14 Oct 2026 15:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/39] xen/riscv: build the target hart index via
 aplic_hart_index()
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <ba71bd0de931eab1205a1139e160f40b72bda421.1790779209.git.oleksii.kurochko@gmail.com>
 <1791277332.8631fc262581453bbf619ec5b2062170.1a11072f6480003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791277332.8631fc262581453bbf619ec5b2062170.1a11072f6480003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791985376-52EDACFC-C2693141/10/73395122804
X-purgate-type: spam
X-purgate-size: 7634



On 10/6/26 11:02 AM, Baptiste Le Duc wrote:
>> aplic_set_irq_affinity() open-coded the packing of the group and hart
>> indices into the target register, and got two things wrong along the
>> way:
>>
>>   - imsic_config.msi[] is indexed by logical CPU id, but the index was
>>     run through cpuid_to_hartid() first. On any platform where the two
>>     spaces differ this picks another CPU's interrupt file, or reads past
>>     the array;
>>
>>   - the same hart id was then used verbatim as the low hart index, and
>>     the group index was derived from msi[].base_addr alone. The hart
>>     index bits live in msi[].offset, the base address only covers the
>>     MMIO regset, which may hold the files of several harts. Both indices
>>     have to come out of base_addr + offset.
>>
>> aplic_hart_index() already extracts them that way, and is what the vAPLIC
>> target path uses, so call it here as well and insert the result with
>> MASK_INSR(APLIC_TARGET_HART_IDX) instead of a bare shift, which keeps the
>> value from spilling out of the 14-bit field. This drops the last in-tree
>> duplicate of the AIA hart index formula, and with it the last user of
>> APLIC_TARGET_HART_IDX_SHIFT, which is removed.
>>
>> desc->irq is used as the EIID as is. Assert that it is a valid APLIC
>> source, which also guarantees that it fits the EIID field.
>>
>> No functional change on a single-group platform whose hart ids match
>> their CPU ids and whose IMSIC regset holds one file per hart.
>>
> Nit: The message is hard to follow because it describes the old code and
> its bugs in the same sentences, so you never see a plain picture of what
> the code did before. I would propose this:
>      ```
>      aplic_set_irq_affinity() computes the target register value by hand:
> 
>          cpu         = cpuid_to_hartid(<cpu picked from mask>);
>          group_index = <bits taken from msi[cpu].base_addr>;
>          hart_index  = cpu;
> 
>      This is wrong in three ways:
> 
>      - msi[] is indexed by logical CPU id, not by hart id. When the two
>        differ, the wrong CPU's interrupt file is used, or msi[] is read
>        out of bounds.
> 
>      - The hart id is used as the low hart index. The AIA spec defines
>        the low hart index as bits of the IMSIC interrupt file address,
>        and the two are not guaranteed to be equal.
> 
>      - The group index is taken from msi[].base_addr only. base_addr is
>        the start of the IMSIC MMIO region, which may hold the interrupt
>        files of several harts; the file of this CPU is at base_addr +
>        msi[].offset, and both indexes must be extracted from that
>        address.
> 
>      aplic_hart_index() already does this correctly and is used by the
>      vAPLIC target path. Use it here as well, and insert the result with
>      MASK_INSR(APLIC_TARGET_HART_IDX) rather than a plain shift, so it
>      cannot overflow the 14-bit field. APLIC_TARGET_HART_IDX_SHIFT has no
>      users left and is removed.
> 
>      desc->irq is written as the EIID unchanged. Assert that it is a
>      valid APLIC source number, which also ensures it fits in the EIID
>      field.
> 
>      No functional change on platforms with a single group, hart ids
>      equal to CPU ids, and one interrupt file per IMSIC MMIO region.
>      ```

Thanks, that reads much better. I'll take it.

>> Fixes: d4676a1398bc ("xen/riscv: implementation of aplic and imsic operations")
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>>   - s/aplic_hart_field/aplic_hart_index/ (in the subject too) following the
>>     rename of the helper in "xen/riscv: implement virtual APLIC MMIO
>>     emulation".
>>   - Don't mask desc->irq with APLIC_TARGET_EIID. Instead, bound it by
>>     the APLIC source range rather than NR_IRQS, which will also have to
>>     cover device MSIs: add a BUILD_BUG_ON() that ARRAY_SIZE(target) fits
>>     the EIID field and an ASSERT() that desc->irq is a valid APLIC source
>>     (1..num_irqs), which also covers the target[desc->irq - 1] index.
>> ---
>> Changes in v2:
>>   - New patch.
>> ---
>> ---
>>   xen/arch/riscv/aplic.c             | 33 ++++++++++--------------------
>>   xen/arch/riscv/include/asm/aplic.h |  1 -
>>   2 files changed, 11 insertions(+), 23 deletions(-)
>>
>> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
>> index febc451760..62bbcc9afa 100644
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -335,9 +335,7 @@ static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
>>   static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
>>   {
>>       unsigned int cpu;
>> -    uint64_t group_index, base_ppn;
>> -    uint32_t hhxw, lhxw, hhxs, value;
>> -    const struct imsic_config *imsic = aplic.imsic_cfg;
>> +    uint32_t value;
>>   
>>       /*
>>        * TODO: Currently, APLIC is supported only with MSI interrupts.
>> @@ -350,27 +348,18 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>>   
>>       ASSERT(spin_is_locked(&desc->lock));
>>   
>> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>> -    hhxw = imsic->group_index_bits;
>> -    lhxw = imsic->hart_index_bits;
>> +    cpu = aplic_get_cpu_from_mask(mask);
>> +
>>       /*
>> -     * Although this variable is used only once in the calculation of
>> -     * group_index, and it might seem that hhxs could be defined as:
>> -     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
>> -     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
>> -     * when calculating the group index.
>> -     * It was done intentionally this way to follow the formula from
>> -     * the AIA specification for calculating the MSI address.
>> +     * desc->irq is used as the EIID as-is, which is only valid for APLIC
>> +     * sources: they are numbered 1..num_irqs, with at most ARRAY_SIZE(target).
>>        */
>> -    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>> -    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>> -
>> -    /* Update hart and EEID in the target register */
>> -    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
>> -                  (BIT(hhxw, UL) - 1);
>> -    value = desc->irq;
>> -    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
>> -    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
>> +    BUILD_BUG_ON(ARRAY_SIZE(aplic.regs->target) >
>> +                 MASK_EXTR(~0U, APLIC_TARGET_EIID));
> Shouldn't this function belong to aplic_init() or at least in a __init
> function? Moreover, this check is only relevant in case of MSI delivery
> mode but I agree it worth checking as we couldn't know at build time in
> which delivery we would be.
> 

BUILD_BUG_ON() is evaluated at build time only, so there's no run-time
cost wherever it is placed, and an __init function wouldn't buy anything.
I'd rather keep it here, next to the ASSERT() (ASSERT(desc->irq && 
desc->irq <= aplic_info.num_irqs);) and the code relying on
both: together they are what allows desc->irq to be used as the EIID
without masking it. This function is MSI-only anyway (see the ASSERT()
on domaincfg.DM above), so the check already sits in an MSI-only
context, whereas moving it, for example, after the msi-parent check in 
aplic_init() would make it look conditional on the delivery mode, which 
it can't be.

Thanks.

~ Oleksii


