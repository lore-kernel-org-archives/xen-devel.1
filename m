Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2EFCA5FFF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 08:21:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442025.1659539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEMu5-0007QQ-66; Wed, 07 Oct 2026 08:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442025.1659539; Wed, 07 Oct 2026 08:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEMu5-0007QJ-3K; Wed, 07 Oct 2026 08:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1442025;
 Wed, 07 Oct 2026 08:21:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11573f8520003f66@swg.vates.tech>)
 id 1xEMu3-0007QD-5o
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 08:21:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEMu1-00GvLM-Oc
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:21:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11573f8520003f66@swg.vates.tech>)
 id 6ac600fc-e002-0a2a0a5209dd-0a2a4505c4b0-34
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:21:29 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11573f8520003f66@swg.vates.tech>)
 id 6ac60108-4cb1-0a2a45050019-b9ff1c128a35-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:21:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a11573f8520003f66.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 08:21:24 +0000
Received: from [192.168.1.17] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7D059823E5
 for <xen-devel@lists.xenproject.org>; Wed,  7 Oct 2026 10:21:23 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=4pLwyzQQFJGhtYUNy17q8KGyMjzeB42hdIs0/iMhWPM=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=RTjJPE+9aTEzdtuK5d5oY/UMd3+LbB2O2rAHdaylBFtiLLJZZDQDhF5PoRCOCEQvDXop4ysB5
 /NoafheKI6Q5PZN7MePdNnsVyJTCCvQBMKNqAPaPqIf+0fEjkcKZmwRb6AMJsrH8Xq7VDivfzFU
 GqH96oAkfiPudAcbl7d1i958tFcXmZgnupt2ojFSBRugms2i3OeFAIvZPB9agryi/JrpXlPfOX7
 ENeYda/wdfOBxiIRRCmVZvKkUG1Ro9TZVCh+N+b9p5CYPDkBZtfgULVHXsqveHemOyjxZMTpCeI
 4Gn37OL7Cq2zaRUAMM/HVOJ2QYRYJLbnGqgnSOI5FwhQ==
X-Zone-Loop: fdcbe07ba325e44e47c8a3d60219734b7c28015dbdc2
x-campaign-type: default
x-transaction-id: 377ae544-48bf-4437-8a6a-02b8e5b05ef4
x-swg-uid: 01-38b5aa80-e042-423f-ad45-41a057740fe5
X-Mailer: Sweego
Message-ID:
 <1791361284.8631fc262581453bbf619ec5b2062170.1a11573f8520003f66@vates.tech>
x-swg-bid: 1791361284.8631fc262581453bbf619ec5b2062170.1a11573f8520003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 7 Oct 2026 10:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: xen-devel@lists.xenproject.org
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
 <1791327013.8631fc262581453bbf619ec5b2062170.1a113690c000003f66@vates.tech>
Content-Language: en-US
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
In-Reply-To: <1791327013.8631fc262581453bbf619ec5b2062170.1a113690c000003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791361283560
X-purgate-ID: tlsNG-c201ff/1791361289-F54AC2A1-133829DC/0/0
X-purgate-type: clean
X-purgate-size: 8317

On 10/7/26 00:50, Teddy Astie wrote:
> Le 05/10/2026 à 18:02, Baptiste Le Duc a écrit :
>> A RISC-V implementation can manage the PTE A/D bits in one of two ways:
>>      1) Update the 'A' and 'D' PTE bits in hardware (ratified as Svadu).
>>      2) Generate a page fault when 'A' and/or 'D' is clear, so that 
>> software
>>         can set them (ratified as Svade).
>>
>> p2m_set_pte_flags() presets A/D in G-stage PTEs only when the device 
>> tree
>> advertises Svade. Platforms that use scheme (2) without advertising 
>> Svade,
>> such as the HiFive Premier P550, then hit guest-page faults that Xen 
>> does
>> not handle.
>
> I second what Jan said (this is likely a firmware bug, given that the 
> enumerated behavior is not consistent with the specification, as 
> existence of Svadu/Svade alters observable behavior).
>
Thanks, agreed on both points.

I'll reword the commit message: it shouldn't imply that Svade in the DT 
means faults will occur, since with Svadu also present that depends on 
henvcfg.ADUE.

On the firmware-bug point: I don't think the P550 is really inconsistent 
with the spec. Svade and Svadu didn't exist when the P550 core was 
designed. They were only ratified later, to name the two behaviors that 
already existed in the wild. Before that, the privileged spec just 
allowed either: hardware updating A/D, or raising a page fault. The P550 
implements the second, and there was no extension it could advertise for 
it.
Therefore, the DT lacks svade because the extension didn't exist when 
the platform description was written, not because the vendor 
misdescribed anything.

I agree that, where Svadu is available, Xen should ideally configure a 
consistent scheme (ADUE=1) and use ADUE=0 only for specific needs such 
as dirty tracking. But Xen doesn't support Svadu today, so that is a 
separate piece of work which I'd prefer to do later.

In the meantime, presetting A/D in the G-stage PTEs is the only way to 
avoid the faults on hardware like the P550, and it is harmless on 
hardware that updates A/D itself.

For v6 I'll keep the unconditional preset and reword the commit message 
to say this, what do you think?

>>
>> Always preset A/D in G-stage PTEs so scheme (2) never faults. This is
>> harmless with (1): software just does what hardware would have done on
>> first access.
>>
>> Drop the TODO suggesting to handle A/D faults: only Svade raises 
>> them, so
>> it would not work on Svadu. Dirty/access tracking can restrict the RWX
>> permissions of p2m entries, as x86 and Arm do.
> Yet, existence of Svade alone doesn't mandate the actual behavior, it 
> is also dependant on the value of ADUE bit in configuration registers.
>
> Ideally (in cases we can) we would want to configure hardware to 
> follow a consistent scheme (with the one that updates A/D with 
> hardware i.e ADUE=1, as it's consistent to without Svade) and only 
> consider the ADUE=0 behavior for specific needs like dirty tracking.
>
>> > Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and 
> support PBMT configuration")
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>> Changes since v4:
>> - restore svade and update the commit message accordingly.
>> - rebase on top of staging.
>> ---
>> Changes since v3:
>> - always preset A/D bits in G-stage mappings instead of keying off 
>> the DT:
>>    it may not reflect what the hardware actually does.
>> - change commit title/message.
>> - drop svade as it is now-unused.
>> ---
>> Changes since v2:
>> - change commit title.
>> - preset A/D bits in p2m_set_pte_flags() if (!svadu || svade), 
>> instead of
>> setting RISCV_ISA_EXT_svade in the riscv_isa bitmap for cases 1, 2 
>> and 4.
>> - riscv_resolve_ad_scheme() now only warns when both Svade and Svadu are
>> present and SBI FWFT is missing; drop the dead 'svadu && svade' operand.
>> - repeat XENLOG_WARNING on each line of the warning.
>> - drop ASSERT(svade != svadu) from p2m_set_pte_flags().
>> - only add the sbi_probe_extension() declaration to sbi.h.
>> - rework the comment in p2m_set_pte_flags().
>> ---
>> Changes since v1:
>> - change commit title
>> - expose RISCV_ISA_EXT_svadu so the two extensions can be told apart.
>> - move the Svade/Svadu resolution to a new riscv_resolve_ad_scheme(),
>>    called once from riscv_fill_hwcap().
>> - expose sbi_probe_extension() (was static) to probe for SBI FWFT.
>> - stop presetting A/D bits unconditionally in p2m_set_permission(), 
>> do it
>>    only when Svade is present.
>> ---
>>   xen/arch/riscv/p2m.c | 38 ++++++++------------------------------
>>   1 file changed, 8 insertions(+), 30 deletions(-)
>>
>> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
>> index f7b380b90a..14cae7dcd7 100644
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -591,38 +591,16 @@ static void p2m_set_pte_flags(pte_t *e, 
>> p2m_type_t t)
>>       e->pte |= PTE_USER;
>>         /*
>> -     * Two schemes to manage the A and D bits are defined:
>> -     *   • The Svade extension: when a virtual page is accessed and 
>> the A bit
>> -     *     is clear, or is written and the D bit is clear, a page-fault
>> -     *     exception is raised.
>> -     *   • When the Svade extension is not implemented, the 
>> following scheme
>> -     *     applies.
>> -     *     When a virtual page is accessed and the A bit is clear, 
>> the PTE is
>> -     *     updated to set the A bit. When the virtual page is 
>> written and the
>> -     *     D bit is clear, the PTE is updated to set the D bit. When 
>> G-stage
>> -     *     address translation is in use and is not Bare, the 
>> G-stage virtual
>> -     *     pages may be accessed or written by implicit accesses to 
>> VS-level
>> -     *     memory management data structures, such as page tables.
>> -     * Thereby to avoid a page-fault in case of Svade is available, 
>> it is
>> -     * necessary to set A and D bits.
>> +     * A RISC-V implementation can either:
>> +     * 1) Update the 'A' and 'D' PTE bits in hardware.
>> +     * 2) Generate a page fault when 'A' and/or 'D' is clear, so that
>> +     *    software can set them.
>
>
>
>>        *
>> -     * TODO: For now, it’s fine to simply set the A/D bits, since 
>> OpenSBI
>> -     *       delegates page faults to a lower privilege mode and so 
>> OpenSBI
>> -     *       isn't expect to handle page-faults occured in lower modes.
>> -     *       By setting the A/D bits here, page faults that would 
>> otherwise
>> -     *       be generated due to unset A/D bits will not occur in Xen.
>> -     *
>> -     *       Currently, Xen on RISC-V does not make use of the 
>> information
>> -     *       that could be obtained from handling such page faults, 
>> which
>> -     *       could otherwise be useful for several use cases such as 
>> demand
>> -     *       paging, cache-flushing optimizations, memory access 
>> tracking,etc.
>> -     *
>> -     *       To support the more general case and the optimizations 
>> mentioned
>> -     *       above, it would be better to stop setting the A/D bits 
>> here and
>> -     *       instead handle page faults that occur due to unset A/D 
>> bits.
>> +     * Xen supports both, so set 'A' and 'D' up front to avoid the 
>> faults
>> +     * of (2). This is harmless with (1): software just does what 
>> hardware
>> +     * would have done on first access.
>>        */
>> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>> -        e->pte |= PTE_ACCESSED | PTE_DIRTY;
>> +    e->pte |= PTE_ACCESSED | PTE_DIRTY;
>
> On the code change itself, it looks good to me, as we don't make use 
> of A/D bit anyway (and in case we would need to, we would need to 
> clear them anyway).
>
>>         switch ( t )
>>       {
>>
>


