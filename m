Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54607C5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 16:25:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388354.1629533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtpHP-0004l2-Tf; Tue, 11 Aug 2026 16:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388354.1629533; Tue, 11 Aug 2026 16:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtpHP-0004ku-Qm; Tue, 11 Aug 2026 16:24:43 +0000
Received: by outflank-mailman (input) for mailman id 1388354;
 Tue, 11 Aug 2026 16:24:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtpHO-0004ko-Tw
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 16:24:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtpHO-00CdrT-Ai
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 18:24:42 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7b4c88-bab6-0a2a0a5309dd-0a2a450889fa-36
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 18:24:42 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7b4cca-f659-0a2a45080019-d155dd29cc89-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 18:24:42 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so2718442f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 09:24:42 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4814a5ac75dsm5037573f8f.7.2026.08.11.09.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2026 09:24:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786465482; x=1787070282; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=boonSqRRqTnfOis0nzNcGL4sDeoihRNPKVms6bgDfIw=;
        b=q4dyBf1U8Ta5uza7G8ewz5pLoWJofi0GZaOHx1b1+l1BPVmx4gpMjh2qL/tudnWAMX
         Ir46FEgTKvfmUJAEMUj4Gq+BaH4Y2um+Jt0pP/TeDWzQlNeM93s3Y//sROL4AaKHskFq
         5lVnhi7wT+x3zDHWJjsferxPxGVGHKGnDLcN+4A8tEX58UNQq4NiWUUCBFdR4OH220z1
         7GwCq6sXtAFKmwre0N+snCCjzl5GvuV1NPJ2NipUQtfkpJbS+Min8nZJ2g0ROHtDzqAf
         Wro7/qYX5UEAr/oFeE61EkbnDDekPlXdvomYd30YMBrE6cnGrBDTyolu3KyWl6HJBN89
         Q9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786465482; x=1787070282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boonSqRRqTnfOis0nzNcGL4sDeoihRNPKVms6bgDfIw=;
        b=EsSskRrtJF8EvjXRz+h/2RK2ki9TOROI1r8hbdQm4gYTffp6TLYK5Ulcf0SrYqPh8G
         BM3aw650oFpTwiG2QTqBW4JYMwzwI13Yjyv1CX0MZFt7YcEvVJ/cmQ+zz7XmB9BHuLiQ
         OotVekNn1nQ71GoNx0cKU1COP5wCgcu4cLuuB8WcnOTTtcPekbYsKLtaplXVuSYDjHi9
         av2MA7grUDKO2omhB/LdFhAqdXrpgRyt/g5fjQjtalX4KFwtVBCyJWZ4WITuvH9QoLyp
         YE2zZdfTiDoWElHkfTQy5210k+xVzuknmz7SPpDNY+HVrwL2blYUu16mQ8a1EV9c+3jw
         B+WA==
X-Forwarded-Encrypted: i=1; AHgh+Rrj41fzQBqPHjswFsq6UGPHkIoen5cKTV3nAYvcCEVKjOA95EVukVIXphZf299EikBlV1WqMOPvw5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL5kHLbkPmGxzzrIeKwlRhQ8gIaYD6KWkod5Mx3p00Zz4UiYGW
	YiZ3G6C2Yyq1ggV3stL8/MkVfbSTXp6/gNqbGF8DlUQJ02Bi12ICsuBh
X-Gm-Gg: AR+sD13nLDk3SnUBfv3RTstmQTVmadyu1Rkhg+IsFqrXCkpPpIN+2/O0O2eVW9jiUXZ
	pLo83cZHEwDtHp1eHLQBvcJkMH5FmsO/bvFRDKmSuurCbygNsj0soCeo0Ih1jg/hFYLk7SJkdmp
	BRTBish6B3GGxszFIn+dvu9/Gdw8VHpqxClhYeUKWBMkzdFMM8SNontACPHCIqu59ryAlTM9ldF
	H50AlroxNI4cm4xbNl36G8ogPvSpw26p0PslMEZw101GLyPCIDdPlblgmd2BtwGb4PnSadAolTs
	32QknfmpogIgDFGIqI50dxw2RvsvZUZ64LsoeftRTUBCHIAhD6QDmW6GB5ykKprGbsdsL+amyJN
	4JedG13n1nl9MhUAGeCqXlS6eyEO42fLXPv1PeRkVjMxa08QhJk3heOuQakS3E9hY1cnC1S7ZoY
	hpMApIhRS4tFBpIIPchX5ceFPDwjlvKIXjtRf+5xs+jXoLyqLhKhLU/CKxOSamE3DpJWwDVgInr
	Ve3MH7AKXLUvVt/rgK2zY30UZyOgTv0kIw93pkR0GM=
X-Received: by 2002:a5d:64e6:0:b0:47f:e721:1f77 with SMTP id ffacd0b85a97d-4814ad94cb6mr7843857f8f.13.1786465481482;
        Tue, 11 Aug 2026 09:24:41 -0700 (PDT)
Message-ID: <70560c6e-17dd-4524-919b-1dad9c774bee@gmail.com>
Date: Tue, 11 Aug 2026 18:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/17] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
 <57793423-aadd-4786-90fd-2923925b766d@suse.com>
 <4c62661a-f944-4806-824a-e74bcbaea3df@gmail.com>
 <1786440103.8631fc262581453bbf619ec5b2062170.19ff020b5cf000c4f3@vates.tech>
 <2187839d-fef8-4d51-8b98-8c0fb26a9569@gmail.com>
 <1786462177.8631fc262581453bbf619ec5b2062170.19ff17189ea000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786462177.8631fc262581453bbf619ec5b2062170.19ff17189ea000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1786465482-CF35D87B-140528A0/10/73395122804
X-purgate-type: spam
X-purgate-size: 11871



On 8/11/26 5:29 PM, Baptiste Le Duc wrote:
> On 2026-08-11 16:36 +0200, Oleksii Kurochko wrote:
>>
>>
>> On 8/11/26 11:21 AM, Baptiste Le Duc wrote:
>>> On 2026-08-07 18:08:21+02:00, Oleksii Kurochko wrote:
>>>> On 8/6/26 4:28 PM, Jan Beulich wrote:
>>>>
>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>
>>>>> For this tag to have any meaning, it should move ahead of the --- above;
>>>>> the explanations ...
>>>>>
>>>>>
>>>>> ... here rather explain the restriction on the R-b, not its odd placement.
>>>>>
>>>>>
>>>>> As this looks to be recurring - please get versioning of your series right.
>>>>> The series is supposedly v1, but here you give the impression of it being
>>>>> v3. If there really was an earlier v2 posting, why isn't the entire series
>>>>> here v3?
>>>>
>>>> It is v3 before before it was a part of another patch series connected
>>>> to dom0less config enablement.
>>>>
>>>> Would it be better to just write in "Change in v3" that it is moved from
>>>> another patch series + link to that patch series? Or it will be enough
>>>> just to drop "Changes in v2 and v1" and just start from v1?
>>>>
>>>>> PLease can you, before submitting, self-review your patches? I'm really
>>>>> getting tired of having to repeatedly point out basic style issues, like
>>>>> the overlong line here.
>>>>
>>>> Sorry for that, I will write an extra checker for such cases to not miss
>>>> them.
>>>>
>>>>> It extends to the other local variables here, but I'll use these two to
>>>>> try to make my point: I'm struggling to associate the names with the
>>>>> values they are set to. Likely "hxw" is an abbreviation of hart index
>>>>> width, but (a) what's the leading 'l' then and (b) why is there no 'g'
>>>>> in "hhxw"? By using hard to grasp names, you make it hard to actually
>>>>> understand the subsequent expressions, in particular ...
>>>>
>>>> The names it taken directly from AIA spec:
>>>>
>>>> The use of this value and fields HHXS (High Hart Index Shift), LHXS (Low
>>>> Hart Index Shift), HHXW (High Hart Index Width), and LHXW (Low Hart
>>>> Index Width) for determining target addresses for MSIs is described
>>>> later, in Section 4.9.1.
>>>>
>>>> The AIA specification interprets the machine-level hart index as a
>>>> combination of the **group index** (`g`) and the **hart index within the
>>>> group** (`h`), according to the following formulas:
>>>>
>>>> ```
>>>> (1) g = (machine-level hart index >> LHXW) & (2^HHXW − 1)
>>>> (2) h = machine-level hart index & (2^LHXW − 1)
>>>> ```
>>>>
>>>> (In our case, the machine-level hart index is equal to `mhartid`, i.e.
>>>> the hart index.)
>>> Therefore, if I understand correclty, if we take the Hart Index as
>>> defined in the AIA spec, we should have:
>>> Hart Index = (g << LHXW) | h
>>> Is it correct?
>>
>> Yes.
>>
>> But note that in the current version of aplic_hart_field(), hart_id is
>> passed directly, so there is no need to extract h as described in the
>> AIA specification. We only need to concatenate it with the group index
>> that we have already extracted.
>>
>> This is partly because aplic_hart_field() uses only .base_addr, which
>> does not contain hart_index.
>>
>> If we want to follow the AIA specification fully, using its terminology,
>> the code should look something like:
>>
>> static unsigned long aplic_hart_field(unsigned int cpu)
>> {
>>       const struct imsic_config *imsic = imsic_get_config();
>>       const struct imsic_msi *msi = &imsic->msi[cpu];
> Could you please specify how this function will be used and when? It's
> hard for me to understand how imsic->msi[cpu] is filled.

imsic->msi[] is filled during IMSIC initialization in imsic_init(), 
based on the MMIO regset specified in the IMSIC node’s reg property and 
the number of parents specified in the interrupts-extended property. 
This is explained to some extent in the comment above local target_addr 
in aplic_hart_field() (a little further down).

I am not 100% sure that I fully understand the connection between your 
question and the sentence after it, but I planned to write the following 
above the function declaration:


/*
  * The arrangement of IMSIC interrupt files in MMIO space follows a 
topology
  * defined by the RISC-V AIA specification. An IMSIC group is a set of
  * interrupt files (e.g., in a cluster or socket) co-located in memory.
  *
  * The physical address of an outgoing MSI is calculated by bitwise ORing a
  * Base Physical Page Number (Base PPN) with the Group Index (g), the Hart
  * Index (h) and, for a supervisor-level interrupt domain, the Guest Index:
  *
  *   ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | guest ) << 12
  *
  * where Base PPN, HHXS, LHXS, HHXW and LHXW come from the 
{m,s}msiaddrcfg[h]
  * registers of the interrupt domain that sends the MSI:
  *
  * XLEN-1           HHXS+24             LHXS+12          12          0
  * |                |                   |                |           |
  * -------------------------------------------------------------------
  * |xxxx|Group Index|xxxxxxxx|Hart Index|xxxx|Guest Index|     0     |
  * -------------------------------------------------------------------
  *
  * - xxxx: the remaining bits of the Base PPN. The specification 
requires the
  *   Base PPN to have zeros in the positions where the indices are OR-ed.
  * - Group Index (g): placed at bit (HHXS + 24) of the physical address.
  * - Hart Index (h): placed at bit (LHXS + 12) of the physical address.
  * - Guest Index: selects one of the 4 KiB pages right above the hart's own
  *   supervisor-level file, i.e. it starts at bit 12; LHXS must 
therefore be
  *   at least as large as the number of guest index bits.
  * - Bits 11:0: always zero because IMSIC files are 4 KiB page-aligned.
  *
  * For wired interrupts in MSI delivery mode (domaincfg.DM = 1) the APLIC
  * builds that address itself from the "Hart Index" field (bits 31:18) 
of the
  * corresponding target[i] register. That field holds a hart index 
*number*,
  * in which both indices are packed adjacently:
  *
  * 13          lhxw+hhxw   lhxw       0
  * |           |           |          |
  * ------------------------------------
  * |     0     |Group Index|Hart Index|
  * ------------------------------------
  *
  * - lhxw (Low Hart Index Width): the number of bits used for the hart 
number
  *   within a group.
  * - hhxw (High Hart Index Width): the number of bits used for the group
  *   number; the remaining bits of the field must be zero.
  *
  * The Guest Index isn't a part of it: for a supervisor-level interrupt 
domain
  * it has its own field (bits 17:12) in target[i].
  *
  * Because there are "xxxx" gaps (Base PPN bits) between the indices in the
  * physical address (depending on HHXS and LHXS), software must extract the
  * group and hart components separately and pack them into the 
APLIC-defined
  * Hart Index format to ensure correct MSI targeting.
  */

Does it answer your question?

>>       unsigned int lhxs = imsic->guest_index_bits;
>>       unsigned int lhxw = imsic->hart_index_bits;
>>       unsigned int hhxw = imsic->group_index_bits;
>>       unsigned int hhxs =
>>           imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
>>       /*
>>        * msi->base_addr is the base of the MMIO regset this CPU's interrupt
>>        * files live in, and one regset can cover several harts; msi->offset
>>        * selects this CPU's block inside it.  The hart index bits are part of
>>        * that offset, so both indexes have to be derived from the full
>> address.
>>        */
>>       paddr_t target_addr = msi->base_addr + msi->offset;
>>       unsigned long tppn = target_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
>>       unsigned long group_index =
>>           (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
>>           APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
>>       unsigned long hart_index =
>>           (tppn >> APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs)) &
>>           APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
>>
>>       return (group_index << lhxw) | hart_index;
>> }
>>
>> (note that during writing that I found an issue, it should be really
>> passed Xen cpu id, not hartid as msi[] is iterated through Xen cpu id so
>> I've taken that into account when wrote an implementation mentioned above)
>>
>> Generally I think I am okay with both version of how to get hart_index
>> (or pass it by an argument or extract it).
>>
>>>>
>>>> For systems that use IMSIC groups, the IMSIC address layout is defined
>>>> by the following parameters:
>>>>
>>>> * `lhxw` (Low Hart Index Width, or *k*): the number of bits used for the
>>>> hart number within a group.
>>>> * `hhxw` (High Hart Index Width, or *j*): the number of bits used for
>>>> the group number.
>>> Is group number appelation equivalent to group index?
>>>
>>> I think with if what I wrote above is correct, the proper definition for
>>> `hhxw` and `hhxs` should be:
>>> * `hhxw` (High Hart Index Width, or *j*): the number of bits used for
>>> the `Hart Index` field within the physical address.
>>>> * `hhxs` (High Hart Index Shift): the bit offset of the combined
>>>> hart/group index field within the physical address.
>>> * `hhxs` (High Hart Index Shift): the bit offset of the `Hart Index`
>>> field within the physical address.
>>>> To extract the group index, we first shift the address by `hhxs` so that
>>>> the group index bits are aligned, and then apply a mask derived from
>>>> `hhxw` to isolate those bits.
>>>>
>>>> The hardware performs the same operation to extract the hart index from
>>>> the MSI address. However, in our case we already know which hart should
>>>> receive the interrupt (`hartid`), so there is no need to extract the
>>>> hart index from the base address. We only need to recover the group
>>>> index and combine it with `hartid` to construct the value expected by
>>>> the `target` register.
>>>
>>> Why don't we direclty extract the Hart Index as target directly needs it
>>> as explained in the 4.5.16.2 point of the AIA spec:
>>> target[31:18] = Hart Index
>>> target[17:12] = Guest Index
>>> target[10:0] = EEID
>>> It'd be easier as we just have to do shift from HHXS and apply HHXW.
>>
>>   From IMSIC's DT-binding description we have:
>>
>>     XLEN-1            > (HART Index MSB)                  12    0
>>     |                  |                                  |     |
>>     -------------------------------------------------------------
>>     |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
>>     -------------------------------------------------------------
>>
>> If you see there is a set of "xxxxxx" between HART and Group Indexes
> I think I'm missunderstanding the spec, as I wrote before I thought that
> [1] `Hart index` = group_idx << LHXW | hart_idx_within_the_group so,
> does the Hart Index in the schema refer to hart_idx_within_the_group or
> to [1]? The naming makes me a bit confuse.

Could you please check my comment above and if it doesn't provide answer 
to your questions I will try to explain it differently.


>> that is the reason why we have to extract HART and Group Index
>> separately as when h/w will work with target register it doesn't know
>> about "xxxxx" at all so from h/w point of view target's register hart
>> field looks like |Group Index|Hart Index|. In other words, h/w will do
>> the following with TARGET's hart index field:
>>       group_idx = hart_idx >> lhxw;
>>       hart_idx &= APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
>>
>> and then embed group_idx and hart_idx into the structure above.
>>
>> Does it make sense?
>>
~ Oleksii

