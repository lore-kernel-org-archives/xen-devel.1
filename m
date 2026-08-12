Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50356C5CFDB
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388921.1629884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4zE-0001PH-Mc; Wed, 12 Aug 2026 09:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388921.1629884; Wed, 12 Aug 2026 09:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4zE-0001PA-Jp; Wed, 12 Aug 2026 09:11:00 +0000
Received: by outflank-mailman (input) for mailman id 1388921;
 Wed, 12 Aug 2026 09:10:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wu4zD-0001P4-6x
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 09:10:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu4zC-00DcLY-Fn
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 11:10:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c3895-bab6-0a2a0a5309dd-0a2a450ba200-30
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 11:10:58 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c38a2-b7e8-0a2a450b0019-d155dd30a8e5-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 11:10:58 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47db714766aso1144464f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 02:10:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997c998f27sm30577495e9.15.2026.08.12.02.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 02:10:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1786525858; x=1787130658; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDDJEp9uSsv7WptWGlF1JJxk9/apGRujVzFGqdWvcTY=;
        b=YoiSsaF7mMFGkGAP2cXe8AiPYFoASt8rxXsbybELX+uFgrmpEt/Cq9N5te0UHnxBXN
         SlpV2jpH9/kPAWLeF5CTDij0X8OnA2bv1uVuC5H73lxsUxskeUa0p6pQKAsSJ2Smoz2X
         9SZaErt9A+fO4DwqPlPOkRtGSkXUHTmQMC/vUgK4a6H6/f0eWE6rae23k3fRJ+6BPlpL
         DXcNnfukMnwQAerr1O2OoHlhZWPyX5ofV/1/OI8N6W5DRbDf1HbGOWgRYoyPIu1P7wkY
         N05ocfzTJDFmZyptAyz8yyNlZcdNSxCz8PDo/N5KFQtuO684oySoC1WsZ5qZVtBqBGRy
         Jzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786525858; x=1787130658;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDDJEp9uSsv7WptWGlF1JJxk9/apGRujVzFGqdWvcTY=;
        b=TRf+BLB1kOguWwpBT2y0JPOPWG9vizRCZYUyoSbmWySXhRLpwbiIXRiN2KFBDgHOZq
         6saJrzZWmU0IwxALJLShcMRKP3C4lFArNO0hNut/9LoHOT5ZoQczQREzdUXQ0uCcix4K
         Xdoino27Oe8lQnTtkcbCPDvUni5K3ubymqzbwwzGVQhNIwUC5Fw81nxcDarytDPy90NE
         ZdbVf1KBrrHQDqoNa2s8PA1xFRxQhET8r8WCwppZtRdY814C+FpNImKNEqZ9ktJctddb
         N0sLNwXIQGw6y4K/VF1t1K2GRuLxRqIOpQ0wHBa1VkplCGIUz9x3T2aYR+MwCJbhfPns
         6rXA==
X-Forwarded-Encrypted: i=1; AHgh+RpoEWL6uAK7QULh98DeJSIRMnTULhOiUMa9i0m6HxtN6C1pgtQeIgc4Zqs3eCAA3idKSgTPsfO0KdU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJiEVZ9/nVq+bQbfjSv0eXQ8lVluvcgPPwVyVxI/3DH79U7mtP
	yJOOhf7kLSI9WA6A0wCajwRIU5R97bl1ofRcJXbsf4OcLOMfgSHeuVUmDWz/d58RzQ==
X-Gm-Gg: AR+sD10Pat53aDNbFxOKzujBp4UHYUnvoaYThBz/X80SrB2jxWMJoxkEHivJkm356nH
	4Usl5NfF0tez6eZxRtvPkk7OZBnZqFrXRRt8QJzN9mhv8ZTCalRh0iU372izYZJM0RiaKeE+ETL
	l8Dy+mws4goQjvfDztoqucz98QXdXbzh4mIlywV4sBryL4ymnJg8QUqUkcmJ71prWNucO1Qng6U
	iTJHM/GP7oVNFHyhRp4oWbbdxTN2fGzpatrNTFSmmCq9C45uHNV4u1cCJDA7v5qG+iNHaVbtwDj
	pDdcNXja1sbWNeJyGxXmg3fgSIN2NQo71z5Z25Cy1IwfojZAQe2Nm8p2A9h0KedD9oOl1KbKHY4
	y9KfAehIKA+550kuKW6FpOTSfaIdngh9V2nhUjP6jkTCkO5R+/f9e0mA6M05P05RQsBTovKrszF
	SoK/p7CrSXSzCYo6I3RWcLsQhaTamoq+fVlbbhK0we+U1/wnws4N7yB9JzUvGjpRoW3A0oP157R
	Hwc51IjtEg2EVdssuyE7+GewhAUb1ioRy72YyNkHxZhJz3fHOUH
X-Received: by 2002:a05:600c:3111:b0:499:51ea:fb59 with SMTP id 5b1f17b1804b1-4997c3f15ebmr33839115e9.4.1786525857495;
        Wed, 12 Aug 2026 02:10:57 -0700 (PDT)
Message-ID: <1415f794-2121-4534-9226-97479aa57623@suse.com>
Date: Wed, 12 Aug 2026 11:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/17] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
In-Reply-To: <4c62661a-f944-4806-824a-e74bcbaea3df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1786525858-ABAD09EA-D696CF80/10/73395122804
X-purgate-type: spam
X-purgate-size: 18216

On 07.08.2026 18:08, Oleksii Kurochko wrote:
> On 8/6/26 4:28 PM, Jan Beulich wrote:
>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>> Guests running under Xen program interrupt routing by writing to APLIC
>>> MMIO registers. Xen must intercept these accesses to enforce interrupt
>>> isolation between domains and to translate guest routing intent into the
>>> underlying physical MSI topology.
>>>
>>> Writes are gated by the domain's authorised interrupt bitmap so that a
>>> guest cannot affect interrupts it does not own. TARGET register writes
>>> additionally require translation of the hart and IMSIC guest-file
>>> indices from virtual to physical, as the APLIC uses these fields
>>> directly to compute the MSI delivery address.
>>>
>>> Delegation (APLIC_SOURCECFG_D) is not yet supported.
>>>
>>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech> # vaplic_mmio_{read,write}
>>
>> For this tag to have any meaning, it should move ahead of the --- above;
>> the explanations ...
>>
>>> The downstream changes related to `vaplic_mmio_{read,write}` were originally
>>> in a separate patch (which was reviewed by Baptiste). However, before
>>> upstreaming, it was decided to merge them into the current patch.
>>> I added `Reviewed-by: Baptiste` in this form for now, but Baptiste will
>>> probably review the remaining changes as well.
>>> Once that happens, I'll simply move the `Reviewed-by` tag up and
>>> remove the `#`.
>>
>> ... here rather explain the restriction on the R-b, not its odd placement.
>>
>>> ---
>>> Changes in v3:
>>
>> As this looks to be recurring - please get versioning of your series right.
>> The series is supposedly v1, but here you give the impression of it being
>> v3. If there really was an earlier v2 posting, why isn't the entire series
>> here v3?
> 
> It is v3 before before it was a part of another patch series connected 
> to dom0less config enablement.
> 
> Would it be better to just write in "Change in v3" that it is moved from 
> another patch series + link to that patch series? Or it will be enough 
> just to drop "Changes in v2 and v1" and just start from v1?

Which part of "never have versions go backwards" was unclear in my earlier
reply?

>>> --- a/xen/arch/riscv/aplic-priv.h
>>> +++ b/xen/arch/riscv/aplic-priv.h
>>> @@ -48,4 +48,6 @@ struct aplic_priv {
>>>    */
>>>   extern unsigned int guest_aplic_num_sources;
>>>   
>>> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu, uint32_t base_val);
>>
>> PLease can you, before submitting, self-review your patches? I'm really
>> getting tired of having to repeatedly point out basic style issues, like
>> the overlong line here.
> 
> Sorry for that, I will write an extra checker for such cases to not miss 
> them.

Well, if there was a checker, many more people would like to use it.

>>> @@ -38,6 +39,60 @@ static struct intc_info __ro_after_init aplic_info = {
>>>       .hw_variant = INTC_APLIC,
>>>   };
>>>   
>>> +static unsigned long aplic_hart_field(unsigned long hartid)
>>> +{
>>> +    const struct imsic_config *imsic = imsic_get_config();
>>> +    unsigned int lhxw = imsic->hart_index_bits;
>>> +    unsigned int hhxw = imsic->group_index_bits;
>>
>> It extends to the other local variables here, but I'll use these two to
>> try to make my point: I'm struggling to associate the names with the
>> values they are set to. Likely "hxw" is an abbreviation of hart index
>> width, but (a) what's the leading 'l' then and (b) why is there no 'g'
>> in "hhxw"? By using hard to grasp names, you make it hard to actually
>> understand the subsequent expressions, in particular ...
> 
> The names it taken directly from AIA spec:
> 
> The use of this value and fields HHXS (High Hart Index Shift), LHXS (Low 
> Hart Index Shift), HHXW (High Hart Index Width), and LHXW (Low Hart 
> Index Width) for determining target addresses for MSIs is described 
> later, in Section 4.9.1.
> 
> The AIA specification interprets the machine-level hart index as a 
> combination of the **group index** (`g`) and the **hart index within the 
> group** (`h`), according to the following formulas:
> 
> ```
> (1) g = (machine-level hart index >> LHXW) & (2^HHXW − 1)
> (2) h = machine-level hart index & (2^LHXW − 1)
> ```
> 
> (In our case, the machine-level hart index is equal to `mhartid`, i.e. 
> the hart index.)
> 
> For systems that use IMSIC groups, the IMSIC address layout is defined 
> by the following parameters:
> 
> * `lhxw` (Low Hart Index Width, or *k*): the number of bits used for the 
> hart number within a group.
> * `hhxw` (High Hart Index Width, or *j*): the number of bits used for 
> the group number.
> * `hhxs` (High Hart Index Shift): the bit offset of the combined 
> hart/group index field within the physical address.
> 
> To extract the group index, we first shift the address by `hhxs` so that 
> the group index bits are aligned, and then apply a mask derived from 
> `hhxw` to isolate those bits.
> 
> The hardware performs the same operation to extract the hart index from 
> the MSI address. However, in our case we already know which hart should 
> receive the interrupt (`hartid`), so there is no need to extract the 
> hart index from the base address. We only need to recover the group 
> index and combine it with `hartid` to construct the value expected by 
> the `target` register.
> 
>>
>>> +    unsigned int hhxs =
>>> +        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
>>> +    unsigned long tppn =
>>> +        imsic->msi[hartid].base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
>>> +    unsigned long group_index =
>>> +        (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
>>> +        APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
>>> +
>>> +    return (group_index << lhxw) | hartid;
>>
>> ... these last two. As it stands, they may be easier to understand if
>> you didn't have the local variables at all, despite them then getting
>> textually longer.
> 
> With the explanation above, do the variable names make sense?

Yes and ...

> To be closer to AIA spec I think it would be better to rename 
> group_index to g and hart_id to h. Does it make sense to you?

... yes. Question is whether you want to help readers who aren't that
familiar with the AIA spec. If so, maybe add [brief] comments making 
clear what the names say? E.g.

    /* High Hart Index Shift */
    unsigned int hhxs =
        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;

>>> --- a/xen/arch/riscv/include/asm/aplic.h
>>> +++ b/xen/arch/riscv/include/asm/aplic.h
>>> @@ -28,6 +28,8 @@
>>>   #define APLIC_DOMAINCFG_BE      BIT(0, U)
>>>   
>>>   /* sourcecfg register fields */
>>> +#define APLIC_SOURCECFG_D       BIT(10, U)
>>
>> As to the comment - this indeed looks to be a field, but ...
>>
>>>   #define APLIC_SOURCECFG_SM_INACTIVE     0x0
>>>   #define APLIC_SOURCECFG_SM_DETACH       0x1
>>>   #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
>>
>> ... these look to be values of some other field which isn't described. Please
>> may I (again) ask that definitions are their commentary at the very least not
>> misguide readers?
> 
> Thanks for pointing this out. You're right, the comment is misleading as 
> written. APLIC_SOURCECFG_D is a field, whereas the APLIC_SOURCECFG_SM_* 
> definitions are values for the source mode (SM) field, and the comment 
> doesn't make that distinction.
> 
> I'll update the comments to describe the fields more accurately:
> 
> #define APLIC_SOURCECFG_BASE            0x0004
> #define APLIC_SOURCECFG_LAST            0x0ffc
> /*
>   * sourcecfg[] register fields:
>   *  - bit 10 (D) selects the layout of the remaining bits;
>   *  - D = 1: bits [9:0] hold the Child Index, i.e. the source is delegated
>   *           to a child domain (unsupported by Xen);
>   *  - D = 0: bits [2:0] hold the source mode SM (WARL).
>   */
> #define  APLIC_SOURCECFG_D              BIT(10, U)
> /* SM field values (0x2 and 0x3 are reserved): */
> #define   APLIC_SOURCECFG_SM_INACTIVE   0x0
> #define   APLIC_SOURCECFG_SM_DETACH     0x1
> #define   APLIC_SOURCECFG_SM_EDGE_RISE  0x4
> #define   APLIC_SOURCECFG_SM_EDGE_FALL  0x5
> #define   APLIC_SOURCECFG_SM_LEVEL_HIGH 0x6
> #define   APLIC_SOURCECFG_SM_LEVEL_LOW  0x7
> 
> Does it look better? Probably there is not sense for two extra spaces 
> for APLIC_SOURCECFG_SM_*. I want to show by such identation that it is 
> values for SM field of APLIC_SOURCECFG.

Which is fine. All you need to add then is a field definition for the SM
field. Then the extra padding blank will also start to make sense.

>>> --- a/xen/arch/riscv/include/asm/imsic.h
>>> +++ b/xen/arch/riscv/include/asm/imsic.h
>>> @@ -40,6 +40,16 @@ struct imsic_config {
>>>       /* Base address */
>>>       paddr_t base_addr;
>>>   
>>> +    /*
>>> +     * MSI Target Address Scheme
>>> +     *
>>> +     * XLEN-1                                                12     0
>>> +     * |                                                     |     |
>>> +     * -------------------------------------------------------------
>>> +     * |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
>>> +     * -------------------------------------------------------------
>>> +     */
>>
>> And the xxx-es in here mean what exactly? Don't care? Some other, unrelated
>> values? Yet something else?
> 
>   The `x` bits denote address bits that are constant across all IMSIC 
> interrupt files. They are not used to encode the group, HART, or guest 
> index; instead, they correspond to the fixed portion of the IMSIC 
> address determined by the platform's memory map.
> 
> For example, consider the IMSIC DT binding:
> 
>      interrupt-controller@28000000 {
>        compatible = "qemu,imsics", "riscv,imsics";
>        interrupts-extended = <&cpu1_intc 9>,
>                              <&cpu2_intc 9>,
>                              <&cpu3_intc 9>,
>                              <&cpu4_intc 9>;
>        reg = <0x28000000 0x2000>, /* Group0 IMSICs */
>              <0x29000000 0x2000>; /* Group1 IMSICs */
>        interrupt-controller;
>        #interrupt-cells = <0>;
>        msi-controller;
>        #msi-cells = <0>;
>        riscv,num-ids = <127>;
>        riscv,group-index-bits = <1>;
>        riscv,group-index-shift = <24>;
>      };
> 
> 
> Here, `hart_index_bits = 2` (4 CPUs) and `guest_index_bits = 0`, so the 
> address layout becomes:
> 
> 31          25 24 23         14 13 12 11          0
> +-------------+-+-------------+-----+-------------+
> | constant    |G|  constant   |HART |    zeros    |
> +-------------+-+-------------+-----+-------------+
> 
> 
> I can update the comment to say:
> "x denotes bits that are constant across all interrupt file addresses."
> 
> or, if you think it's clearer: "x denotes bits whose values are 
> platform-defined and common to all interrupt file addresses."
> 
> Does it make sense any of suggested options?

Either comment is fine imo. What I'd like to suggest is to not use 'x' then,
but e.g. 'c'.

>>> --- a/xen/arch/riscv/vaplic.c
>>> +++ b/xen/arch/riscv/vaplic.c
>>> @@ -17,6 +17,7 @@
>>>   #include <asm/aia.h>
>>>   #include <asm/imsic.h>
>>>   #include <asm/intc.h>
>>> +#include <asm/mmio.h>
>>>   #include <asm/vaplic.h>
>>>   
>>>   #include "aplic-priv.h"
>>> @@ -27,6 +28,256 @@ unsigned int __ro_after_init guest_aplic_num_sources;
>>>   
>>>   #define FDT_VAPLIC_INT_CELLS 2
>>>   
>>> +#define AUTH_IRQ_BIT(d, irqn) ( \
>>> +    ((irqn) < (d)->arch.vintc->nr_virqs) && \
>>> +    test_bit(irqn, (d)->arch.vintc->used_irqs) )
>>
>> Nit: Indentation.
> 
> I will use the following indentation:
> 
> ... (((irqn) < (d)->arch.vintc->nr_virqs) && \
>       test_bit(irqn, (d)->arch.vintc->used_irqs))

Which as written still doesn't look right. What I can't tell is whether
that's merely because of the use of "...".

Of the three opening prarens on the first line, two have their closing
counterparts on the same line. There's thus one pending closing paren,
meaning there should be one extra indenting blank.

>>> +/*
>>> + * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
>>> + * a 32-bit word index into the allocated_irqs bitmap.  Each word covers 32
>>> + * interrupt sources.  For SOURCECFG and TARGET groups the same division also
>>> + * yields the interrupt number directly, because those arrays store one 32-bit
>>> + * register per source.
>>> + */
>>> +#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
>>> +
>>> +static inline uint32_t generate_auth_mask(const struct domain *d,
>>> +                                          unsigned int word_idx)
>>> +{
>>> +    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
>>> +
>>> +    if ( word_idx >= DIV_ROUND_UP(d->arch.vintc->nr_virqs,
>>> +                                  sizeof(uint32_t) * BITS_PER_BYTE) )
>>> +    {
>>> +        dprintk(XENLOG_DEBUG, "incorrect word_idx(%u) is passed\n", word_idx);
>>
>> Is this really meant to stay?
> 
> For debug purpose it could be useful, so I prefer to have it with 
> changing it to gprintk(XENLOG_DEBUG, ...) to understand which domain is 
> trying to access something wrong.

gdprintk() implies you're on the vCPU that's the subject of the operation.
If that's always the case here, the function parameter wants to reflect
that as far as possible: "currd" instead of "d".

>>> +        return 0U;
>>> +    }
>>> +
>>> +    return (uint32_t)(d->arch.vintc->used_irqs[first_bit / BITS_PER_LONG] >>
>>> +                      (first_bit % BITS_PER_LONG));
>>
>> I don't quite understand the need for the cast.
> 
> Functionally it isn't need but it documents that it is expected that 
> translation from unsinged long  to uint32_t will happen. I will drop the 
> cast.

Thanks. If you really wanted such doc, casts would need adding in many
more places across the code base.

>>> +        if ( !target_vcpu )
>>> +        {
>>> +            dprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
>>> +
>>> +            /* Ignore such writings */
>>> +            return 0;
>>> +        }
>>> +
>>> +        value = aplic_msi_target_gen(target_vcpu, value);
>>> +
>>> +        break;
>>> +    }
>>> +
>>> +    case APLIC_SETIPNUM:
>>> +    case APLIC_SETIPNUM_LE:
>>> +    case APLIC_CLRIPNUM:
>>> +    case APLIC_SETIENUM:
>>> +    case APLIC_CLRIENUM:
>>> +        if ( !value || !AUTH_IRQ_BIT(d, value) )
>>> +            return 0;
>>> +
>>> +        break;
>>> +
>>> +    case APLIC_DOMAINCFG:
>>> +    {
>>> +        struct vaplic *vaplic = to_vaplic(v->domain);
>>> +
>>> +        /*
>>> +         * The domaincfg register has this format:
>>> +         * bits 31:24 read-only 0x80
>>> +         * bit 8      IE
>>> +         * bit 7      read-only 0
>>> +         * bit 2      DM (WARL)
>>> +         * bit 0      BE (WARL)
>>> +         *
>>> +         * The most interesting bit for us is IE(Interrupt Enable) bit.
>>> +         * At the moment, at least, Linux doesn't use domaincfg.IE bit to
>>> +         * disable interrupts globally, but if one day someone will use it
>>> +         * then extra actions should be done.
>>> +         *
>>> +         * Only DM (bit 2) and IE (bit 8) are writable here. They are assigned
>>> +         * (not OR-ed) so that a write of 0 can also clear them (WARL), and the
>>> +         * read-only high byte (0x80) is always kept set on read-back.
>>> +         */
>>> +        if ( value & ~(APLIC_DOMAINCFG_RO | APLIC_DOMAINCFG_DM |
>>> +                       APLIC_DOMAINCFG_IE) )
>>> +            printk_once("%s: Ignore writes to non-writable domaincfg bits as "
>>> +                        "they are set by aplic during initialization in Xen\n",
>>> +                        __func__);
>>> +
>>> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
>>> +                                 (value & (APLIC_DOMAINCFG_DM |
>>> +                                           APLIC_DOMAINCFG_IE));
>>> +
>>> +        return 0;
>>> +    }
>>> +
>>> +    default:
>>> +        goto fail;
>>
>> Instead of this goto, I think you simply want to move the label here.
>> That'll also make the function more similar to its load counterpart.
> 
> Good point. I am curious how fail label should be aligned:
> 
>      default:
>   fail:
>          gdprintk(XENLOG_WARNING,
>                   "Unhandled APLIC write at offset %#x (value %#x)\n", 
> offset,
>                   value);
> 
>          return rc;
>      }
> 
> or default:
>      fail:
> 
> ?

Neither. Labels inside switch() should be indented to same as the
case labels there.

>>> @@ -105,6 +356,50 @@ static const struct vintc_init_ops __initconstrel init_ops = {
>>>       .make_domu_dt_node = vaplic_make_domu_dt_node,
>>>   };
>>>   
>>> +static enum io_state cf_check vaplic_mmio_read(struct vcpu *v, mmio_info_t *info,
>>> +                                               register_t *r)
>>> +{
>>> +    uint32_t data = 0;
>>> +
>>> +    if ( info->len != sizeof(uint32_t) ||
>>> +         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
>>> +    {
>>> +        gdprintk(XENLOG_DEBUG,
>>> +                 "VAPLIC: unaligned/wrong-width read gpa=%"PRIpaddr" len=%u\n",
>>> +                 info->gpa, info->len);
>>
>> You have v passed in here, but you'd log current. If passing in v is
>> necessary (i.e. here or elsewhere it may be other than current), then you
>> need to either ASSERT(v == current) at the top of the funciton or otherwise
>> handle v != current correctly.
> 
> It makes sense. I will add ASSERT(v == current) here and for 
> vaplic_mmio_write().

And then further rename the parameter to "curr", please.

Jan

