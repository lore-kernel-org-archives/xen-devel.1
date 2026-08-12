Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF0AC5AD5A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 10:05:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388961.1629934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu5pa-0001WQ-7b; Wed, 12 Aug 2026 10:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388961.1629934; Wed, 12 Aug 2026 10:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu5pa-0001WJ-51; Wed, 12 Aug 2026 10:05:06 +0000
Received: by outflank-mailman (input) for mailman id 1388961;
 Wed, 12 Aug 2026 10:05:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wu5pY-0001WD-8Z
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 10:05:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu5pX-00C3gn-LL
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 12:05:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7c4549-8faa-0a2a0a5109dd-0a2a4504d8c8-24
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 12:05:03 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7c454e-b57f-0a2a45040019-d155802ab85e-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 12:05:02 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so8512555e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 03:05:02 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997aa3ebe0sm69339105e9.0.2026.08.12.03.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 03:05:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786529102; x=1787133902; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+bljBm+4VlGqIEjXcnjNEmRLgnVTkLfgoLXsNQ0/UQ=;
        b=leLt8BxCB3VsJyjTD1PywKqZ6d/rxf701Sf/p6/e1TIsshqqTI6KqHNReqLcc8UuSj
         EuqGuRI+T6naTQyWPOTObJG3nzUTMCLNOHZd3A/iMSuB/f2wmOG9PgTvlalzECiFSVxM
         PTVDKLcs/sJHStpkkNKjuasaUywz9h8DPAd+vC8qOpW0JJToiDAXGe7N2ewRM3NUlRSS
         MCb/7JMwMr26ls/FWl5F9jIW9Pzy9PZCYFQ2e04en1aWu0Y74etBTaMSRJZZ4wbEkgcL
         mTJ7VAFcWHupTZJXeNG2Wn6DwZ1+9XD57sVwHDpvGeySP4RWI1FbO5nBt0O+SvhVJFOM
         EcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529102; x=1787133902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+bljBm+4VlGqIEjXcnjNEmRLgnVTkLfgoLXsNQ0/UQ=;
        b=Oe+iZx9wKoD0E30tC4NxwrJdKgxHL4OlMvi7tmmsw9QdebuIozyZFjofXvQFJLtnNw
         4jxQem3UVT1NzJeKWwZnKBf00dgzf5aJC/lD4/1xCnJFk1iGWxdCU7Fi3kY3RHJcCU48
         CT3E3e2RvYdqpxQn64zSv7zgwfC1l1qctjFbeL5z97paDzxFbj3MUAuaDDrIu0jL51dg
         dQrq0mjDj8DD9kDM4rPPIzRBAm3Jd3JZH3cFc6yo9bMOA0CImrlyQbBAWEishxoBpEhC
         ncfyWuFUIZ21kRAE0fzMGojv+aZy/mx976bjLGZNjyND6SIowgjy9AHKUMdXCYKyo8d/
         cvkw==
X-Forwarded-Encrypted: i=1; AHgh+RpaqV4Rhhyrv4sfJafYo46AFADHOw/YEmkhuKyk2YPvCd/E2YZbsf51dkbTaHEolHPgXQx6uzR+OFc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgdGQrxdP1rXbFjOZ90ijWyObWQgIxH4CdbXm9duW94lVyqqXk
	YLb7H1Cf1cQ0a2Y8tko8S3PwUjX7ej6Qcj4NCAU7VbI0Z1bdTR38P5CR
X-Gm-Gg: AR+sD13RanXjXPc1TMXj0b+Tq5h4mzNPoNEX5+ZezMexzPwx8ydxno5Sr4c0mIW35NW
	Y49PpIMuIY8rr/wjGoe9cyWdEtkV7vNRdPEwkPQlsiaPHMGMe0MJAoAhzwVLdE6KxYvT0yviqz1
	c+gcBLdG3ghLjdELtinABa3C8KvXuu2VxRCpARQlGOD+0476Gnw6TmxL3+VY9ttI5r1IGQRn/GA
	mawNURLFIKt1s58RyxQqYLdDJNwQ1HCpRl+ZeqROuWIbWyVVPYu0zXa0KXXprBIn8xdX274mSyI
	+tBkU3aTr0MgyXsWV3qP2PMAzTVl/tEhc9diYqvAV4lZ4sGzjlbrVSnw7r1iUYC1vcgAdGvr6cV
	X0jzwCg20SXhXmSf9Yfpkyj8aer5OAaihctdr3k6IzlngueEOdop3CR+EHrydBPMM5V1ueSL+ek
	RvT71kw9tXyL4AMTvsRP0imgUW4RryiiG4xJZ4Tf+p/qRxvcfrMYRap3/FVPmwbqWd9NHmjtt0l
	iDC1QfbdlrE7ALmQIEK1zfBbrSe62BhxjgGuo7pvV0=
X-Received: by 2002:a05:600c:6305:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-4997c0d7658mr40977495e9.4.1786529102063;
        Wed, 12 Aug 2026 03:05:02 -0700 (PDT)
Message-ID: <69c57858-221c-4abc-8989-a7828353dc0f@gmail.com>
Date: Wed, 12 Aug 2026 12:05:00 +0200
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
 <70560c6e-17dd-4524-919b-1dad9c774bee@gmail.com>
 <1786528043.8631fc262581453bbf619ec5b2062170.19ff55e8fe5000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786528043.8631fc262581453bbf619ec5b2062170.19ff55e8fe5000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1786529102-C06DAB50-D64F81D2/10/73395122804
X-purgate-type: spam
X-purgate-size: 8044



On 8/12/26 11:47 AM, Baptiste Le Duc wrote:
> On 2026-08-11 18:24 +0200, Oleksii Kurochko wrote:
>>
>>
>> On 8/11/26 5:29 PM, Baptiste Le Duc wrote:
>>> On 2026-08-11 16:36 +0200, Oleksii Kurochko wrote:
>>>>
>>>>
>>>> On 8/11/26 11:21 AM, Baptiste Le Duc wrote:
>>>>> On 2026-08-07 18:08:21+02:00, Oleksii Kurochko wrote:
>>>>>> On 8/6/26 4:28 PM, Jan Beulich wrote:
>>>>>>
>>>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>>>
>>>>>>> For this tag to have any meaning, it should move ahead of the --- above;
>>>>>>> the explanations ...
>>>>>>>
>>>>>>>
>>>>>>> ... here rather explain the restriction on the R-b, not its odd placement.
>>>>>>>
>>>>>>>
>>>>>>> As this looks to be recurring - please get versioning of your series right.
>>>>>>> The series is supposedly v1, but here you give the impression of it being
>>>>>>> v3. If there really was an earlier v2 posting, why isn't the entire series
>>>>>>> here v3?
>>>>>>
>>>>>> It is v3 before before it was a part of another patch series connected
>>>>>> to dom0less config enablement.
>>>>>>
>>>>>> Would it be better to just write in "Change in v3" that it is moved from
>>>>>> another patch series + link to that patch series? Or it will be enough
>>>>>> just to drop "Changes in v2 and v1" and just start from v1?
>>>>>>
>>>>>>> PLease can you, before submitting, self-review your patches? I'm really
>>>>>>> getting tired of having to repeatedly point out basic style issues, like
>>>>>>> the overlong line here.
>>>>>>
>>>>>> Sorry for that, I will write an extra checker for such cases to not miss
>>>>>> them.
>>>>>>
>>>>>>> It extends to the other local variables here, but I'll use these two to
>>>>>>> try to make my point: I'm struggling to associate the names with the
>>>>>>> values they are set to. Likely "hxw" is an abbreviation of hart index
>>>>>>> width, but (a) what's the leading 'l' then and (b) why is there no 'g'
>>>>>>> in "hhxw"? By using hard to grasp names, you make it hard to actually
>>>>>>> understand the subsequent expressions, in particular ...
>>>>>>
>>>>>> The names it taken directly from AIA spec:
>>>>>>
>>>>>> The use of this value and fields HHXS (High Hart Index Shift), LHXS (Low
>>>>>> Hart Index Shift), HHXW (High Hart Index Width), and LHXW (Low Hart
>>>>>> Index Width) for determining target addresses for MSIs is described
>>>>>> later, in Section 4.9.1.
>>>>>>
>>>>>> The AIA specification interprets the machine-level hart index as a
>>>>>> combination of the **group index** (`g`) and the **hart index within the
>>>>>> group** (`h`), according to the following formulas:
>>>>>>
>>>>>> ```
>>>>>> (1) g = (machine-level hart index >> LHXW) & (2^HHXW − 1)
>>>>>> (2) h = machine-level hart index & (2^LHXW − 1)
>>>>>> ```
>>>>>>
>>>>>> (In our case, the machine-level hart index is equal to `mhartid`, i.e.
>>>>>> the hart index.)
>>>>> Therefore, if I understand correclty, if we take the Hart Index as
>>>>> defined in the AIA spec, we should have:
>>>>> Hart Index = (g << LHXW) | h
>>>>> Is it correct?
>>>>
>>>> Yes.
>>>>
>>>> But note that in the current version of aplic_hart_field(), hart_id is
>>>> passed directly, so there is no need to extract h as described in the
>>>> AIA specification. We only need to concatenate it with the group index
>>>> that we have already extracted.
>>>>
>>>> This is partly because aplic_hart_field() uses only .base_addr, which
>>>> does not contain hart_index.
>>>>
>>>> If we want to follow the AIA specification fully, using its terminology,
>>>> the code should look something like:
>>>>
>>>> static unsigned long aplic_hart_field(unsigned int cpu)
>>>> {
>>>>        const struct imsic_config *imsic = imsic_get_config();
>>>>        const struct imsic_msi *msi = &imsic->msi[cpu];
>>> Could you please specify how this function will be used and when? It's
>>> hard for me to understand how imsic->msi[cpu] is filled.
>>
>> imsic->msi[] is filled during IMSIC initialization in imsic_init(),
>> based on the MMIO regset specified in the IMSIC node’s reg property and
>> the number of parents specified in the interrupts-extended property.
>> This is explained to some extent in the comment above local target_addr
>> in aplic_hart_field() (a little further down).
>>
>> I am not 100% sure that I fully understand the connection between your
>> question and the sentence after it, but I planned to write the following
>> above the function declaration:
>>
>>
>> /*
>>    * The arrangement of IMSIC interrupt files in MMIO space follows a
>> topology
>>    * defined by the RISC-V AIA specification. An IMSIC group is a set of
>>    * interrupt files (e.g., in a cluster or socket) co-located in memory.
>>    *
>>    * The physical address of an outgoing MSI is calculated by bitwise ORing a
>>    * Base Physical Page Number (Base PPN) with the Group Index (g), the Hart
>>    * Index (h) and, for a supervisor-level interrupt domain, the Guest Index:
>>    *
>>    *   ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | guest ) << 12
>>    *
>>    * where Base PPN, HHXS, LHXS, HHXW and LHXW come from the
>> {m,s}msiaddrcfg[h]
>>    * registers of the interrupt domain that sends the MSI:
>>    *
>>    * XLEN-1           HHXS+24             LHXS+12          12          0
>>    * |                |                   |                |           |
>>    * -------------------------------------------------------------------
>>    * |xxxx|Group Index|xxxxxxxx|Hart Index|xxxx|Guest Index|     0     |
>>    * -------------------------------------------------------------------
>>    *
>>    * - xxxx: the remaining bits of the Base PPN. The specification
>> requires the
>>    *   Base PPN to have zeros in the positions where the indices are OR-ed.
>>    * - Group Index (g): placed at bit (HHXS + 24) of the physical address.
>>    * - Hart Index (h): placed at bit (LHXS + 12) of the physical address.
>>    * - Guest Index: selects one of the 4 KiB pages right above the hart's own
>>    *   supervisor-level file, i.e. it starts at bit 12; LHXS must
>> therefore be
>>    *   at least as large as the number of guest index bits.
> 
> I think the name `Hart Index` is confusing here. In fact, you previously
> confirmed it refers to target[i] bits 31:18, i.e. the packed number
> (g << LHXW) | h, but here you say `Hart Index` is equivalent to h, which
> makes no sense.
> 
> I know this diagram came from Linux (Anup Patel, Nov 2022,

Not really, this diagram was created from scratch. I think you are 
referring to that one in struct imsic_config but the idea is the same 
and the comment in struct imsic_config should be fixed too. I will 
re-use what we agreed here.

> https://lore.kernel.org/all/20240307140307.646078-3-apatel@ventanamicro.com/),
> where "HART Index" is simply the name of the riscv,hart-index-bits DT
> property. Linux's own APLIC driver then reuses a single hart_index
> variable for h and for (g << LHXW) | h in consecutive lines, without a
> comment, which is confusing - if I understand correctly, obviously :)
> 
> I think this diagram could be better aligned with the AIA spec:
> 
>      * XLEN-1       HHXS+24          LHXS+12          12          0
>      * |            |                |                |           |
>      * ------------------------------------------------------------
>      * |xxxx|   g   |xxxxxxxx|   h   |xxxx|Guest Index|     0     |
>      * ------------------------------------------------------------
>      *
>      * - g: group number
>      * - h: hart number relative to the group
>      * - xxxx: remaining Base PPN bits; each gap may be zero-width.
> 
> What do you think? It would allow us to keep a single meaning for the
> `Hart Index` field, the same one as target[i] bits 31:18 i.e. (g <<
> LHXW) | h.

I agree g and h better describes AIA spec and probably will be easier to 
do a grep in AIA spec.

Thanks.

~ Oleksii

