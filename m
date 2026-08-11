Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D602AC5CFED
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 14:36:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388297.1629505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtnaI-0004pz-WD; Tue, 11 Aug 2026 14:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388297.1629505; Tue, 11 Aug 2026 14:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtnaI-0004ps-Tb; Tue, 11 Aug 2026 14:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1388297;
 Tue, 11 Aug 2026 14:36:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtnaI-0004pm-3m
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 14:36:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtnaH-00CMhI-GD
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 16:36:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7b3355-bab6-0a2a0a5309dd-0a2a4501afb8-0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:36:05 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7b3355-5984-0a2a45010019-d1558034dd4e-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:36:05 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so31019625e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 07:36:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49977e86b55sm78792885e9.4.2026.08.11.07.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2026 07:36:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458965; x=1787063765; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NweeeWU/d1SpjWCrPg1YLxWa7FbW0YsPsbukU44y9t4=;
        b=jkRO52vSpU58kPCjQ6Zk9quN9m7Q8TPgX/ucJRpXhwtT1qIFOH6Pi9SdCqSRJH27Iu
         Y2eD8LItGQYaExP3Rj1WtxubNrcaRIIadOH/C3JQhQWknJyjQlYG921K10/ked+sqVKb
         mWtMXpWp9VcGtN9wRjBfcMapNDujceLpHc+EGLADaID/lKH/7uvMEQOj8K+OIhCQOtz3
         tZqm0l9xCBVRI4atU6hoskuTsQZ//xY+1FM/XSI9kXNYV/vQ6cpkXQ8lGNiEfckhKlBa
         dKqyS6euACRP88yja+ZsWw6OIpmS8o+OFHAsLQK0EDdUtRJ9wujatpq1FZLXl8Yn/3s/
         H7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458965; x=1787063765;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NweeeWU/d1SpjWCrPg1YLxWa7FbW0YsPsbukU44y9t4=;
        b=EVf2HOKv9Y+hyXENpxrnlEBWIxD6zCd8peffTfq1OJ0pf3ApVlLHBZI2UHHoKymAZQ
         ntMFAcWVvNIQpYd0sFYM3X1Xgvib/N/zdd0LBXuPx4IdLLCWr6Hby1/uGRPKQGEPzCzJ
         jajAZ/z8rXcNiQwly90VolrwgCm16aPPLCdT9TJLu0WFaDe/ksJujzZkMMImNWAZStH/
         Huj4hpCDZChYQ1/bJVQcM1nJd8VGX4ldGXjwhEmRc7vlTfxhMKg4w4D2Kn1e9+95hsXD
         L8pJ1YdMEjd9xqbDKkcqBWQKbvSVkDHX8VHGGlp4lsDrYSmxfCtbr9wASDc2bOFhb0ls
         JC+g==
X-Forwarded-Encrypted: i=1; AHgh+RqMH8eWwhnpjvAFlzW4iR0gFGOAWx/aSjNfBuSicXHxxqcnk/NzCfH+jte7rY7HHfN2fNMQNOhO+c0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3DpRKePAzr6eg2se7qcRAE/+drYvDRTstXBmSaOrDt3FO8Fy7
	XSle6IoMkvZkVAwgoNo9Ut2b34eV65d6WuQAf3qu0GeZHzz9eu66ENB4
X-Gm-Gg: AR+sD11M5YLSIu23KyAAdr7N+9mkuFosyiRVvZbQjyxsylKP1CYTayP99mrC4wEC+B8
	gBTWHUWCU/sr+BDbMYc91IRL1kP1MOkMGPfex3NQ8bXTJ961fv3MKWzQr2ZpJMANPiFr1Uox6vA
	RwBfBp2KpZ0EH4eeCjsq1haitI6dYMtP97tcnSrYOqIfpuk4J2ZknaCDiyzUccGoNDBrDFgeXaM
	M0Rh6ZbKwVEQekvqCCybjh4ncj65aqqx9qE54NkkMYH6WhMHi7hqwUMGwaDQfE7PR72c2LP97u/
	wNyOeVEnpcU6jwDwzPnGfeRNE4SHQ+4WIAPYBwtuJ8KUBs26RRWMfOsvkoL2/SxmrrLRt8CXf9M
	/0LMgBhBZWoCR2+NgftZJ1Bjb7aaKsyuL5rwSd0pisnrU5bZVnHi8wWG+tjHBk+5NJv3Kkq6aXs
	qdu9WfYZ/984WCPOat0OKw3hd4ViUNxOQiOXdXhr13B7s2MSH2LPA7WyuJZ969e2AlBY0xDJgZh
	WpX4/A/QTJoUSz2MOFCrZsU1aNzU8Q5mAl4US969cA=
X-Received: by 2002:a05:600c:45d2:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-49978485532mr59518495e9.18.1786458964685;
        Tue, 11 Aug 2026 07:36:04 -0700 (PDT)
Message-ID: <2187839d-fef8-4d51-8b98-8c0fb26a9569@gmail.com>
Date: Tue, 11 Aug 2026 16:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
In-Reply-To: <1786440103.8631fc262581453bbf619ec5b2062170.19ff020b5cf000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1786458965-C475B757-96AE7052/10/73395122804
X-purgate-type: spam
X-purgate-size: 7789



On 8/11/26 11:21 AM, Baptiste Le Duc wrote:
> On 2026-08-07 18:08:21+02:00, Oleksii Kurochko wrote:
>> On 8/6/26 4:28 PM, Jan Beulich wrote:
>>
>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>
>>> For this tag to have any meaning, it should move ahead of the --- above;
>>> the explanations ...
>>>
>>>
>>> ... here rather explain the restriction on the R-b, not its odd placement.
>>>
>>>
>>> As this looks to be recurring - please get versioning of your series right.
>>> The series is supposedly v1, but here you give the impression of it being
>>> v3. If there really was an earlier v2 posting, why isn't the entire series
>>> here v3?
>>
>> It is v3 before before it was a part of another patch series connected
>> to dom0less config enablement.
>>
>> Would it be better to just write in "Change in v3" that it is moved from
>> another patch series + link to that patch series? Or it will be enough
>> just to drop "Changes in v2 and v1" and just start from v1?
>>
>>> PLease can you, before submitting, self-review your patches? I'm really
>>> getting tired of having to repeatedly point out basic style issues, like
>>> the overlong line here.
>>
>> Sorry for that, I will write an extra checker for such cases to not miss
>> them.
>>
>>> It extends to the other local variables here, but I'll use these two to
>>> try to make my point: I'm struggling to associate the names with the
>>> values they are set to. Likely "hxw" is an abbreviation of hart index
>>> width, but (a) what's the leading 'l' then and (b) why is there no 'g'
>>> in "hhxw"? By using hard to grasp names, you make it hard to actually
>>> understand the subsequent expressions, in particular ...
>>
>> The names it taken directly from AIA spec:
>>
>> The use of this value and fields HHXS (High Hart Index Shift), LHXS (Low
>> Hart Index Shift), HHXW (High Hart Index Width), and LHXW (Low Hart
>> Index Width) for determining target addresses for MSIs is described
>> later, in Section 4.9.1.
>>
>> The AIA specification interprets the machine-level hart index as a
>> combination of the **group index** (`g`) and the **hart index within the
>> group** (`h`), according to the following formulas:
>>
>> ```
>> (1) g = (machine-level hart index >> LHXW) & (2^HHXW − 1)
>> (2) h = machine-level hart index & (2^LHXW − 1)
>> ```
>>
>> (In our case, the machine-level hart index is equal to `mhartid`, i.e.
>> the hart index.)
> Therefore, if I understand correclty, if we take the Hart Index as
> defined in the AIA spec, we should have:
> Hart Index = (g << LHXW) | h
> Is it correct?

Yes.

But note that in the current version of aplic_hart_field(), hart_id is 
passed directly, so there is no need to extract h as described in the 
AIA specification. We only need to concatenate it with the group index 
that we have already extracted.

This is partly because aplic_hart_field() uses only .base_addr, which 
does not contain hart_index.

If we want to follow the AIA specification fully, using its terminology, 
the code should look something like:

static unsigned long aplic_hart_field(unsigned int cpu)
{
     const struct imsic_config *imsic = imsic_get_config();
     const struct imsic_msi *msi = &imsic->msi[cpu];
     unsigned int lhxs = imsic->guest_index_bits;
     unsigned int lhxw = imsic->hart_index_bits;
     unsigned int hhxw = imsic->group_index_bits;
     unsigned int hhxs =
         imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
     /*
      * msi->base_addr is the base of the MMIO regset this CPU's interrupt
      * files live in, and one regset can cover several harts; msi->offset
      * selects this CPU's block inside it.  The hart index bits are part of
      * that offset, so both indexes have to be derived from the full 
address.
      */
     paddr_t target_addr = msi->base_addr + msi->offset;
     unsigned long tppn = target_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
     unsigned long group_index =
         (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
         APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
     unsigned long hart_index =
         (tppn >> APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs)) &
         APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);

     return (group_index << lhxw) | hart_index;
}

(note that during writing that I found an issue, it should be really 
passed Xen cpu id, not hartid as msi[] is iterated through Xen cpu id so 
I've taken that into account when wrote an implementation mentioned above)

Generally I think I am okay with both version of how to get hart_index 
(or pass it by an argument or extract it).

>>
>> For systems that use IMSIC groups, the IMSIC address layout is defined
>> by the following parameters:
>>
>> * `lhxw` (Low Hart Index Width, or *k*): the number of bits used for the
>> hart number within a group.
>> * `hhxw` (High Hart Index Width, or *j*): the number of bits used for
>> the group number.
> Is group number appelation equivalent to group index?
> 
> I think with if what I wrote above is correct, the proper definition for
> `hhxw` and `hhxs` should be:
> * `hhxw` (High Hart Index Width, or *j*): the number of bits used for
> the `Hart Index` field within the physical address.
>> * `hhxs` (High Hart Index Shift): the bit offset of the combined
>> hart/group index field within the physical address.
> * `hhxs` (High Hart Index Shift): the bit offset of the `Hart Index`
> field within the physical address.
>> To extract the group index, we first shift the address by `hhxs` so that
>> the group index bits are aligned, and then apply a mask derived from
>> `hhxw` to isolate those bits.
>>
>> The hardware performs the same operation to extract the hart index from
>> the MSI address. However, in our case we already know which hart should
>> receive the interrupt (`hartid`), so there is no need to extract the
>> hart index from the base address. We only need to recover the group
>> index and combine it with `hartid` to construct the value expected by
>> the `target` register.
> 
> Why don't we direclty extract the Hart Index as target directly needs it
> as explained in the 4.5.16.2 point of the AIA spec:
> target[31:18] = Hart Index
> target[17:12] = Guest Index
> target[10:0] = EEID
> It'd be easier as we just have to do shift from HHXS and apply HHXW.

 From IMSIC's DT-binding description we have:

   XLEN-1            > (HART Index MSB)                  12    0
   |                  |                                  |     |
   -------------------------------------------------------------
   |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
   -------------------------------------------------------------

If you see there is a set of "xxxxxx" between HART and Group Indexes 
that is the reason why we have to extract HART and Group Index 
separately as when h/w will work with target register it doesn't know 
about "xxxxx" at all so from h/w point of view target's register hart 
field looks like |Group Index|Hart Index|. In other words, h/w will do
the following with TARGET's hart index field:
     group_idx = hart_idx >> lhxw;
     hart_idx &= APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);

and then embed group_idx and hart_idx into the structure above.

Does it make sense?

> 
> I will try to draw some schema to make the AIA spec more explicit. Maybe
> it could be part of this series, I don't know what is the xen policy
> about diagram and stuff like that. Do you know more about that?

Unfortunately, no, I don't.

> In order 
> to not do a job with no needed at all.
> 

IMO, it is enough only AIA spec here to understand. At least, it is 
clear to me.

~ Oleksii

