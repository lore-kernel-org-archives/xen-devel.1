Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951ECCA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:04:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442081.1659611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEOUo-00005u-Od; Wed, 07 Oct 2026 10:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442081.1659611; Wed, 07 Oct 2026 10:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEOUo-00005n-Lq; Wed, 07 Oct 2026 10:03:34 +0000
Received: by outflank-mailman (input) for mailman id 1442081;
 Wed, 07 Oct 2026 10:03:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEOUn-00005f-Qj
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:03:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEOUl-00HIUO-Qg
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 12:03:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac618a3-8faa-0a2a0a5109dd-0a2a4504b4d6-34
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 12:03:31 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac618f3-b57f-0a2a45040019-d1558030e0f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 12:03:31 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so37257915e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 03:03:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f51beffsm59968245e9.2.2026.10.07.03.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:03:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791367411; x=1791972211; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOGoC8k/+o27Ntp+OuBXBAJ0vJdmg5oYVfJKR3ii81E=;
        b=Lw4kp9te/Y/91DwJzGlsj5ZKX1R6ur8Nfa6rtjpSisJ6Ern46z+TXkov+eCsFBC1pX
         AYAGMZlqL5dnv2y7+uMPUO1UWU4TIwARC7DOB+1DeC1oYGZxl0ltEzRD2NmkQaeFy5FJ
         N5rqPw6EpqQgNf3sxIlsTtvHukI7+/qcCMsH8dGBI6bwr77i81wullSiQegCC1k2Ts4J
         MWau6hCbqUYa54nT+Qr6mlXtYvNOqhFGFpZInEOefW033LUH4ThZ4KPgiShhQxP8H9Zy
         bB5ex0KNBdWk4vBQFYJiyEIJm4VokWTrm/cJ1BWPgp1KXr7l9tg/XpUJrq6gacunENTz
         0xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367411; x=1791972211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yOGoC8k/+o27Ntp+OuBXBAJ0vJdmg5oYVfJKR3ii81E=;
        b=ObHSppOLe7EG5IHVP8cUKns89XyGZlybmHLu5WVP36GagOUvi9Vj15AS0yA043NlFn
         z2PAaJhyf0n/NtDtQZ8oi+XlxpecetGqLfO+O7vnVBX49qEBNccljpFa9fJ+IO3FHdwf
         ZLZqBEPZbo/GxqEwyqAshs+F9BVU2c3oEHxTZjFM3UhUC5ac7Ezd+vfZ0bxqk1hcQdvO
         YbRKkvYHHbY53gt0fou+03T8yQGe07xtfPsixekWcKr28ArLGRa2RhGOvXTWzKLO56V8
         N5MwxyGFYgnVxuaPfPyhMxvhS/GeIH3dT3P5t0q3FYsdxe8l5ztRv6D6h+erDIRlWy0v
         fo8g==
X-Forwarded-Encrypted: i=1; AKwUvBx7AUw2TUUYlYgitH5bTmj6CSOrycaDPagwH/oIofSPdzlQ9/PmcdRRgf+HHiIMLRKTIXgCDr0KEEk=@lists.xenproject.org
X-Gm-Message-State: AFuF++koDz4+kfyyOxMMq66+mDFz6GptkvILiaB1tr5leBuAL8QUekSV
	04aaOM9zhaeC1Xhg+fouC2/LJnR9PwzAW2qWN5JVk4kGAUrD6j7bVxA/
X-Gm-Gg: AYBFou2/vgOQBeVF66jHNuKa8wD6lJ/KcO+OX7MiV3c+BngPiStEOloMUE1vU/ES77L
	4KILHa2BXbN5YHBqiYCNm5xWvkz6JxQMT71zXBV0C9eiVky8hc4IpCdNVLaKuMiRhVf2wHTE1jt
	nZllS2LXqIEfO6RJpMWAX6A+a1IF52r2nMQI2pURXKRW2aSj5tOJOjUFy8WgdvbdEmm+fwiEuif
	d1+gq3ofuQl1QPndcj6fD8IMIlxYDPpMcWKdKNWlYfGXzjOG7vTPoBjNCgc00g6cGRiLS6wBSuD
	AxrC6pR3prTPcuDm22JUxpilu1Y00N0LuAgxB7DUUkGlGaT0NlxifDH4o0bUnLL0N7dwobz6XFE
	6P8uvGlRhoJFqc0t/vr80wNC/1s7pxJOUg5XYuxBBfEcuwCVxIVADEXyuQpClKFT4iSO8c9kwv+
	5n3UIvuWxG/rFzvvIb+JvmI8AajWSdOwlvbwCLZOtgnRdClInzdA/3lmZVzdQlEnZDjg3tXTEOq
	M0YUrQ4y6je5we+rVdMxNoUYRUw53ntLNTmJ7T1LR55r8fNLg==
X-Received: by 2002:a05:600c:64c6:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a180455e85mr26206385e9.28.1791367410728;
        Wed, 07 Oct 2026 03:03:30 -0700 (PDT)
Message-ID: <4a0b0d62-c312-43c1-908a-fcff7c081149@gmail.com>
Date: Wed, 7 Oct 2026 12:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
 <793b6d0d-68ca-4f9d-8ca5-c37f2c013478@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <793b6d0d-68ca-4f9d-8ca5-c37f2c013478@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791367411-C3CC7B50-BD3B2A75/10/73395122804
X-purgate-type: spam
X-purgate-size: 8534



On 10/6/26 5:20 PM, Jan Beulich wrote:
> On 05.10.2026 18:00, Baptiste Le Duc wrote:
>> A RISC-V implementation can manage the PTE A/D bits in one of two ways:
>>      1) Update the 'A' and 'D' PTE bits in hardware (ratified as Svadu).
>>      2) Generate a page fault when 'A' and/or 'D' is clear, so that software
>>         can set them (ratified as Svade).
>>
>> p2m_set_pte_flags() presets A/D in G-stage PTEs only when the device tree
>> advertises Svade.

According to the code it seems like it is setting A/D bits always 
independently on what is DT file.  Baptiste, am I missing something?

  Platforms that use scheme (2) without advertising Svade,
>> such as the HiFive Premier P550, then hit guest-page faults that Xen does
>> not handle.
> 
> Is that a quirk then (to avoid the word "bug")? Since it's all DT that
> conveys available ISA information, why can't the DT for those systems
> simply be fixed? Depending on the answer here I might question the
> presence of the Fixes: tag below.

I think it can at some point. Let me clarify why "at some point"...

So how the things are working now:

OpenSBI detects the available ISA extensions in two steps:
1. It parses the CPU nodes in the DTB. If a node has the 
riscv,isa-extensions property, OpenSBI uses it; otherwise it falls back 
to riscv,isa. riscv,isa-extensions describes the same extensions as 
riscv,isa, but as a list of strings, which makes it easier to parse. 
 From this, OpenSBI builds a per-hart bitmap of available extensions 
(basically what we do in Xen). (Platform-specific code can also add 
extensions to the bitmap at this step.)
2. It then probes a small, fixed set of extensions (Sstc, Smaia, 
Sscofpmf, Smstateen, Ssstateen, Smcntrpmf, Sdtrig) by reading a CSR that 
the extension introduces and checking whether the access traps. This is 
similar to what we do for Sstc in Xen.

Step 2 only adds extensions to the bitmap. It does not check or clear 
the extensions that came from the DT; the only exception is Zicntr, 
which is detected purely by probing. So for extensions such as 
Svade/Svadu, which have no CSR to probe, the DT is the only source of truth.
Now, what OpenSBI does with Svade/Svadu specifically. First, it disables 
hardware A/D updating by default, i.e. it clears menvcfg.ADUE:

Now, what OpenSBI does with Svade/Svadu specifically. First, it disables 
hardware A/D updating by default, i.e. it clears menvcfg.ADUE:

   /* Disable HW A/D updating by default */
   menvcfg_val &= ~ENVCFG_ADUE;

Then it sets ADUE again, depending on which extensions are listed in the 
DTB:

   /*
    * Assume only Svadu is supported when it is the only extension
    * present in the ISA string. Svade is assumed when neither are
    * present. When both are present we must default to Svade (see
    * the zero reset value of FWFT.PTE_AD_HW_UPDATING).
    */
   if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
	__set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);

So all OpenSBI does is set or clear menvcfg.ADUE based on what is 
mentined in DTB.

So, to answer your original question: yes, this can be fixed just by 
updating the DTS. OpenSBI will then configure menvcfg.ADUE according to 
the extensions listed there. Note that the logic above is from OpenSBI 
v1.9. Versions v1.5–v1.8 behave the same when the DT lists only svadu, 
only svade, or both. When neither is listed, they leave ADUE unchanged 
instead of clearing it. Versions before v1.5 don't handle Svade/Svadu at 
all.

But IIRC such approach was suggested in one of vX and it was rejected 
because we can't in Xen be sure that passed DTB is correct and 
corresponds to how real h/w is configured as specifically with ADUE bit 
in menvcfg we can't read it in HS-mode as an exception will occur as it 
is M-mode register. So we have to trust that OpenSBI (or other firmware 
will configure the A/D update scheme according to what is mentioned in DTS).

So then basically the question is do we want to rely on that how OpenSBI 
configures h/w?

It seems like it could be fine. For example, without support for the 
FWFT extension, we can't access or change the menvcfg bit anyway. The 
FWFT extension was ratified in 2025, so we have to trust OpenSBI anyway 
(or introduce our own extension or port the FWFT extension to an earlier 
OpenSBI version) before FWFT is started to be available.

With this explanation would you (Jan) be okay to go with just providing 
proper DTS?

> 
>> Always preset A/D in G-stage PTEs so scheme (2) never faults. This is
>> harmless with (1): software just does what hardware would have done on
>> first access.
>>
>> Drop the TODO suggesting to handle A/D faults: only Svade raises them, so
> 
> This contradicts the earlier paragraph, where you say that page faults can
> also occur without Svade.
> 
>> it would not work on Svadu. Dirty/access tracking can restrict the RWX
>> permissions of p2m entries, as x86 and Arm do.
> 
> I'm also not convinced that this is what the TODO was after. Oleksii would
> be able to clarify, I suppose.

I think the TODO below in the code should be added back, as it indicates 
that something needs to be changed if (or when) we decide to support 
tracking of the A/D bits.

~ Oleksii

> 
>> Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -591,38 +591,16 @@ static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
>>       e->pte |= PTE_USER;
>>   
>>       /*
>> -     * Two schemes to manage the A and D bits are defined:
>> -     *   • The Svade extension: when a virtual page is accessed and the A bit
>> -     *     is clear, or is written and the D bit is clear, a page-fault
>> -     *     exception is raised.
>> -     *   • When the Svade extension is not implemented, the following scheme
>> -     *     applies.
>> -     *     When a virtual page is accessed and the A bit is clear, the PTE is
>> -     *     updated to set the A bit. When the virtual page is written and the
>> -     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
>> -     *     address translation is in use and is not Bare, the G-stage virtual
>> -     *     pages may be accessed or written by implicit accesses to VS-level
>> -     *     memory management data structures, such as page tables.
>> -     * Thereby to avoid a page-fault in case of Svade is available, it is
>> -     * necessary to set A and D bits.
>> +     * A RISC-V implementation can either:
>> +     * 1) Update the 'A' and 'D' PTE bits in hardware.
>> +     * 2) Generate a page fault when 'A' and/or 'D' is clear, so that
>> +     *    software can set them.
>>        *
>> -     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
>> -     *       delegates page faults to a lower privilege mode and so OpenSBI
>> -     *       isn't expect to handle page-faults occured in lower modes.
>> -     *       By setting the A/D bits here, page faults that would otherwise
>> -     *       be generated due to unset A/D bits will not occur in Xen.
>> -     *
>> -     *       Currently, Xen on RISC-V does not make use of the information
>> -     *       that could be obtained from handling such page faults, which
>> -     *       could otherwise be useful for several use cases such as demand
>> -     *       paging, cache-flushing optimizations, memory access tracking,etc.
>> -     *
>> -     *       To support the more general case and the optimizations mentioned
>> -     *       above, it would be better to stop setting the A/D bits here and
>> -     *       instead handle page faults that occur due to unset A/D bits.
>> +     * Xen supports both, so set 'A' and 'D' up front to avoid the faults
>> +     * of (2). This is harmless with (1): software just does what hardware
>> +     * would have done on first access.
> 
> "Xen supports both" to me means it suitably handles the page faults resulting
> with Svade. May I suggest "To support both, set ..."?
> 
>>        */
>> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>> -        e->pte |= PTE_ACCESSED | PTE_DIRTY;
>> +    e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>   
>>       switch ( t )
>>       {
>>
> 


