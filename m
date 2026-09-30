Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB99FCA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:03:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437335.1656202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuuO-0004b4-95; Wed, 30 Sep 2026 14:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437335.1656202; Wed, 30 Sep 2026 14:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuuO-0004ax-5z; Wed, 30 Sep 2026 14:03:44 +0000
Received: by outflank-mailman (input) for mailman id 1437335;
 Wed, 30 Sep 2026 14:03:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBuuM-0004St-Pc
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:03:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBuuL-009w7s-Pt
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:03:41 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd16af-e002-0a2a0a5209dd-0a2a45038aec-36
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:03:41 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd16bd-fae8-0a2a45030019-4a7de18cd74c-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:03:41 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccf3ca626so33346915e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:03:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01e662383sm1532005e9.12.2026.09.30.07.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 07:03:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790777021; x=1791381821; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3nhmLWinXVPm1SREsowJqvf9TDGNyN9+LU/+s41ra4=;
        b=ldYY7BzRlxECnxwWJGX+2wzyaHmRGytjPWwnT2jdhYIhLmRUtw9eI9aKKVv3lpsEZC
         83SlnW8BajWCymRUX7ESm6nL49SujgvS66c6xkT+ovMvVmPcl2T9SGFux1ydeebQ9Hv+
         QzzWGvxv+nn5AJ30QzDuoniIPfX5UArbhQp0wNKPRvEudftGH7rWYUu9DQb/w6vmJWBB
         30aSo97Z21FiFZRT9D/fZhEglJxGonfBXP2Fmr86dgsJgsAZShiDcRtDnjqUW6M24Mtn
         cBxPwS6ogPVVqhQ0ivmDIGu7hY0a17JStd/fSORrFe0iRn3JooQitECW7X3QZl7nFXts
         LsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777021; x=1791381821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3nhmLWinXVPm1SREsowJqvf9TDGNyN9+LU/+s41ra4=;
        b=tilBZFiz6trXdS3A1p7bmDdIAeSymu2jtLO5Wfa3jX6HsRQguaWsHVwk8aEu+Fouxy
         MK4eCnMZ7CuuAWtQdGxhToersU8y4+aLhPEzA/VReO5w+w4Ve8sj5hFeK28w8ZOO7bZj
         CBhDLVdIV1JNs8kvfm/PDftJp9UiySFTf8IDLRnWvKDReOS9QzLMKC7DtHrur8Q+OJ8B
         fFsdTCTpXJwSn7kFcubGEIHCLnW3Sbc8Q/RLfZl6M3jWnShO8VrLWYPVqRPW/pzoqN4+
         fF1hIYaS2hufRYpCB4Km4HA2Li+g8Jkf0x0u90snYPX8BJWJlylf0DGZ1zTnAVeojsRD
         v0Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwDS2d1zS7eaFMA2selukOOWqAf2hRRas8HVzHwiwA4a1hq7L2HVB6ZW814LGOKWyTO6eu/8p54r8I=@lists.xenproject.org
X-Gm-Message-State: AFuF++nRBeC+EoYQC26dMX9rHY59GMgSNw1V78/qi1YeIhwTv8Fe7wlr
	+UYBWEBlkCaxvOLdeX4YpSWtn3n6WpLAW/BkgvSlnMjC51WCUXwROQ9H
X-Gm-Gg: AYBFou2AoJIVqBK2yf7deNr/0cTI6GVlM0uBUcDFMGKJc8dc2zxo6LnTRDAXpFOURhE
	a1yb2ilMKKd8x3XqQ7oBCV4WuRBPBvQIp8GTCPSjPSjwRrt4VQTgJt/XpQjrla0OFNo61QT3c62
	GI1ZgjmnqQdy5nD1NL34ue4yqEnxpD2/y27n6z0rjPDOD+Nst78p/Rj2+N7IFeZMAK/YD5ZMLZL
	U/TsqmSpyLruGMSjxxFunoA5aAAwC6bi6OcP8KqMwvYkkIdAxkcXz9lRmM8YX/ncNTW2dMte+56
	1Oaoki+AXUY0WbRiSW+unQ579VHlXK1uEm8F4wI8niTSq8/SIOOv3Q5NF2/meFTeOBQCVargc+c
	MZDLuXBUx48/gdpOHSvNHSpfY9VKstTKz89o6N1FN87zG/KQSzEielnTOwQtn8wqKIViRDb7+zQ
	TybqWv0cKKvxlJXqLnIARTLas/z0FxU1XFQL7zr+IcWyNiPYz98e80ccvLjrL4T3uB0iOrBxK8H
	etMGe7ABhBxtbi4ro1cbp5jyoFtNWxizQ/64A9H5TTRp6i1PBdJmCxnwQrM
X-Received: by 2002:a05:600c:3110:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-4a01b00d761mr25495085e9.14.1790777020857;
        Wed, 30 Sep 2026 07:03:40 -0700 (PDT)
Message-ID: <4754398e-4239-461d-98c1-1dc5e26b811a@gmail.com>
Date: Wed, 30 Sep 2026 16:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/riscv: fix A/D bit handling in G-stage
 mappings
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504@vates.tech>
 <c2d30da2-6844-4df2-9029-238f5ce25838@suse.com>
 <3419a5a5-fcb9-4222-9045-1acdd9609021@gmail.com>
 <2e6f8a8e-7b02-41b4-812a-fa71c48ac48c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2e6f8a8e-7b02-41b4-812a-fa71c48ac48c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790777021-6CADC4E9-DD703100/10/73395122804
X-purgate-type: spam
X-purgate-size: 4608



On 9/30/26 3:58 PM, Jan Beulich wrote:
> On 30.09.2026 15:53, Oleksii Kurochko wrote:
>> On 9/30/26 2:20 PM, Jan Beulich wrote:
>>> On 29.09.2026 18:32, Baptiste Le Duc wrote:
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -586,42 +586,24 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
>>>>    
>>>>    static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
>>>>    {
>>>> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
>>>> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
>>>> +
>>>>        e->pte &= ~PTE_ACCESS_MASK;
>>>>    
>>>>        e->pte |= PTE_USER;
>>>>    
>>>>        /*
>>>> -     * Two schemes to manage the A and D bits are defined:
>>>> -     *   • The Svade extension: when a virtual page is accessed and the A bit
>>>> -     *     is clear, or is written and the D bit is clear, a page-fault
>>>> -     *     exception is raised.
>>>> -     *   • When the Svade extension is not implemented, the following scheme
>>>> -     *     applies.
>>>> -     *     When a virtual page is accessed and the A bit is clear, the PTE is
>>>> -     *     updated to set the A bit. When the virtual page is written and the
>>>> -     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
>>>> -     *     address translation is in use and is not Bare, the G-stage virtual
>>>> -     *     pages may be accessed or written by implicit accesses to VS-level
>>>> -     *     memory management data structures, such as page tables.
>>>> -     * Thereby to avoid a page-fault in case of Svade is available, it is
>>>> -     * necessary to set A and D bits.
>>>> -     *
>>>> -     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
>>>> -     *       delegates page faults to a lower privilege mode and so OpenSBI
>>>> -     *       isn't expect to handle page-faults occured in lower modes.
>>>> -     *       By setting the A/D bits here, page faults that would otherwise
>>>> -     *       be generated due to unset A/D bits will not occur in Xen.
>>>> -     *
>>>> -     *       Currently, Xen on RISC-V does not make use of the information
>>>> -     *       that could be obtained from handling such page faults, which
>>>> -     *       could otherwise be useful for several use cases such as demand
>>>> -     *       paging, cache-flushing optimizations, memory access tracking,etc.
>>>> +     * A RISC-V implementation can choose to either:
>>>> +     * 1) Update 'A' and 'D' PTE bits in hardware.
>>>> +     * 2) Generate page fault when 'A' and/or 'D' PTE bits are not set so that
>>>> +     *    software can update these bits.
>>>>         *
>>>> -     *       To support the more general case and the optimizations mentioned
>>>> -     *       above, it would be better to stop setting the A/D bits here and
>>>> -     *       instead handle page faults that occur due to unset A/D bits.
>>>> +     * Xen supports both options mentioned above: unless the platform guarantees
>>>> +     * (1), i.e. only Svadu is present, set 'A' and 'D' so that (2) never
>>>> +     * faults.
>>>>         */
>>>> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>>> +    if ( !svadu || svade )
>>>>            e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>
>>> I may have asked this already when the original conditional was introduced:
>>> What use is it to leave A and D clear, when we don't otherwise consume the
>>> bits? This way hardware has to issue more (atomic) writes, i.e. performance
>>> suffers for no gain.
>>
>> It will be done only once, won't it? After that, if the A/D bits aren't
>> cleared, there shouldn't be any performance impact, so it will basically
>> behave the same as setting the A/D bits in software.
>>
>> The idea was that, if Svadu is available, it should be the hardware's
>> job to set the A/D bits. That way, when the A/D bits eventually start
>> being used for some purpose in Xen, we won't miss an unconditional write
>> of the A/D bits when Svadu is available.
>>
>> If you think it's enough to just have the A/D bits set unconditionally,
>> I'm okay with that, and we can go that way.
> 
> I think starting simple (i.e. unconditional) here is the way to go. Making
> the setting of one or both flags conditional can be left to whenever that
> would become a necessity. Note that on x86 we haven't seen a need in all
> the time (for Xen's own page tables that is).

Okay, then lets set them unconditionally for now.

~ Oleksii


