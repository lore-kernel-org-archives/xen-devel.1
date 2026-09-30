Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C345CA5FBB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:54:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437301.1656150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBukb-0000SS-7b; Wed, 30 Sep 2026 13:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437301.1656150; Wed, 30 Sep 2026 13:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBukb-0000SL-3I; Wed, 30 Sep 2026 13:53:37 +0000
Received: by outflank-mailman (input) for mailman id 1437301;
 Wed, 30 Sep 2026 13:53:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBukZ-0000SF-9P
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:53:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBukY-00HMRT-4n
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:53:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd1453-2eae-0a2a0a5409dd-0a2a4509cc40-24
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:53:34 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd145d-be1a-0a2a45090019-4a7de18dba25-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:53:34 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so43898825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 06:53:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01e67d0dbsm499605e9.12.2026.09.30.06.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 06:53:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790776413; x=1791381213; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ByiJG+InnZM3zjWe/urMLzwK9bJMSPxlyj27z++Sy8=;
        b=a5sNHnC+kr53uhBVwLnFhmAv8DBWX0nFCXu3lgzHMRmL0gADox0PDxHt5iHgaLnQ3Q
         7m0Ryv8aItIGnB9WgsUs5XO9nLnYDkq36GCoFlBXtCmGNw+4PcK3hGemM6zj8jYmk5W/
         4XWbAGz4mlzLDERcZfHmHbzeiXZGziiyepKExPQNSG32TJgo18zPZTl8YqsNmmDmX2Ql
         /gV7R2fEzpQ8n/H7R1CGx9LquWtEYKd9Y69U42UP04EYiwJ4Bht0C8wrPsE24boYacVS
         LXJ1R0TOPeii5EF4e7R5UCwTGN+4Fbphm6BkGTMxD4rwxyK/S8bZqfrYHUvAKGY0EQN5
         vHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776413; x=1791381213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ByiJG+InnZM3zjWe/urMLzwK9bJMSPxlyj27z++Sy8=;
        b=UXwLDzfALNSoOcJWgPrRxc7rUL18CSXdGZAdKXsOb9I1TVYYczJFjnOgDTBqs/yZ5s
         ETtOjWnjXAqyIAu/eDlmryhdaa8AbcHoIE6MoEogNFfpRmxH/vDga8Ysi0L+MEObLp+s
         U/gnPf896hPjmNGdfrgATBK+B46kpa6s/t+U5e0KA1+4NkpQJShCB+OQ2VmyQOQcmAHp
         52hv6pjMJ3dr6SG6guWh3SRx3OSIROExpDhtTSLCAC2LbkCiwb7MOYMtxaoclEzQQJlY
         OquiU9v9M5wOv+gZVOq9tsq+12v+c4f1s/NOk3/UgF/+ksNySYhf5Ju99OjXpUVXiLOh
         wh+w==
X-Forwarded-Encrypted: i=1; AKwUvBxOPIUv5fg+bgLHM0wYAOKJV6ARNV3bq6+J9bEqWrCVPSW8b0lS/2pON6ACMHtnquwNU72vDEiHAC0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kRJw/5SdL2QHWBZaDLGj3F12PSzgXfawbIUVUcenlaNunGskS+
	LsskBcRiy4fy7PuX9RxiSrB7r/Ic/+Ap2Q+5BQqc1+nC3+Cz1TdTB/C0
X-Gm-Gg: AYBFou0psZIK3RJbBTZGnHfAPjfbxtv5cGR05l234tZyhgpY1QjyYJTAQ4iIMJsu5Q9
	HDazcUI6m2LrmvGE2VueRcd4UtyMLdnigc5TOPSbRDR0trOe7ArQp78G4tCG6xyK+H0VLxka/l+
	Go2egul0GUyo1opPoT/pneN4ZC4iergOlV5lHDFhgdEC4AM5gpDRnxnCSP0bKJGQ9jEv9bIcIbV
	3qqpSx0bCX0+v/eUZy5A5vJ9Z+0d0VPaq/kB9XRAxBLJ6PEnT84LY22djJNxO0SV8oIHaKPy0av
	BYxkLdAS5C+bQlnbP+Sc57jXAIq3U8REZSOANM+9so7i0F7gn+HQXgv7dc1XeX24A8CPBQdwHab
	RJ/VbOlITiMdjkTwR8f6CcQTAOk+P99MJURH9WfHqyIWqpR9+MYfKqvI249Q2Vv/jY2rgcUUp0K
	k1NyMgDnWk9ufbv/jovNTalpe+tDT7ObjxVlsRX7IceVdlhpo+ESmxzmHMT3N7O4aZt2Cb+pDcA
	pr1Ki7gEwlzooHe/5NGhBMvjCW/towZOjynZYz5L9WqM6kKjWyxj0jGpScE
X-Received: by 2002:a05:600c:3e1b:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-4a01aff61d5mr27095935e9.25.1790776413497;
        Wed, 30 Sep 2026 06:53:33 -0700 (PDT)
Message-ID: <3419a5a5-fcb9-4222-9045-1acdd9609021@gmail.com>
Date: Wed, 30 Sep 2026 15:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/riscv: fix A/D bit handling in G-stage
 mappings
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee0340f9000b504@vates.tech>
 <c2d30da2-6844-4df2-9029-238f5ce25838@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c2d30da2-6844-4df2-9029-238f5ce25838@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790776414-3AAD8034-91A22907/10/73395122804
X-purgate-type: spam
X-purgate-size: 6859



On 9/30/26 2:20 PM, Jan Beulich wrote:
> On 29.09.2026 18:32, Baptiste Le Duc wrote:
>> @@ -500,6 +502,45 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
>>       }
>>   }
>>   
>> +/*
>> + * Svade and Svadu extensions represent two schemes for managing the PTE A/D
>> + * bits. When the PTE A/D bits need to be set, the Svade extension indicates
>> + * that a page fault will be raised. In contrast, the Svadu extension supports
>> + * hardware updating of the PTE A/D bits.
>> + *
>> + * There are 4 possible combinations of these extensions in the device tree.
>> + * The default hardware behavior for each is:
>> + *
>> + * 1) Neither Svade nor Svadu present in DT => It is technically unknown
>> + *    whether the platform uses Svade or Svadu. Xen should be prepared to
>> + *    handle either hardware updating of the PTE A/D bits or page faults when
>> + *    they need updating.
>> + *
>> + * 2) Only Svade present in DT => Xen must assume Svade to be always enabled.
>> + *
>> + * 3) Only Svadu present in DT => Xen must assume Svadu to be always enabled.
>> + *
>> + * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned off
>> + *    at boot time, so it presets the A/D bits. To use Svadu, the supervisor
>> + *    must explicitly enable it using the SBI FWFT extension.
>> + *
>> + * The Svade extension is mandatory and the Svadu extension is optional in the
>> + * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
>> + * option 3. Platforms aware of the profile can choose option 4, and Xen won't
>> + * get the benefit of Svadu until the SBI FWFT extension is available.
>> + */
>> +static void __init riscv_resolve_ad_scheme(void)
>> +{
>> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
>> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
>> +
>> +    if ( svadu && svade )
>> +        if ( sbi_probe_extension(SBI_EXT_FWFT) <= 0 )
> 
> Such successive if()s want folding.
> 
>> +            printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
>> +                XENLOG_WARNING "RISC-V: Defaulting to software A/D updates (Svade).\n"
>> +                XENLOG_WARNING "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");
> 
> Nit: Indentation, and no full stop at the end of log messages please.
> 
> Overall - what use is this? Nothing will be logged if FWFT is present, yet
> there's no real use of the extension. I.e. even in that case you default
> to svade. Further, removing svadu from DT doesn't alter hardware behavior.
> How can that be a useful suggestion?

Oh, right, that what I missed when suggested that to just remove from 
DT... It won't really affect the hardware behavior.

Then it will be easy just to drop this function and set A/D uncondtionally.

> 
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -586,42 +586,24 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
>>   
>>   static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
>>   {
>> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
>> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
>> +
>>       e->pte &= ~PTE_ACCESS_MASK;
>>   
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
>> -     *
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
>> +     * A RISC-V implementation can choose to either:
>> +     * 1) Update 'A' and 'D' PTE bits in hardware.
>> +     * 2) Generate page fault when 'A' and/or 'D' PTE bits are not set so that
>> +     *    software can update these bits.
>>        *
>> -     *       To support the more general case and the optimizations mentioned
>> -     *       above, it would be better to stop setting the A/D bits here and
>> -     *       instead handle page faults that occur due to unset A/D bits.
>> +     * Xen supports both options mentioned above: unless the platform guarantees
>> +     * (1), i.e. only Svadu is present, set 'A' and 'D' so that (2) never
>> +     * faults.
>>        */
>> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>> +    if ( !svadu || svade )
>>           e->pte |= PTE_ACCESSED | PTE_DIRTY;
> 
> I may have asked this already when the original conditional was introduced:
> What use is it to leave A and D clear, when we don't otherwise consume the
> bits? This way hardware has to issue more (atomic) writes, i.e. performance
> suffers for no gain.

It will be done only once, won't it? After that, if the A/D bits aren't 
cleared, there shouldn't be any performance impact, so it will basically 
behave the same as setting the A/D bits in software.

The idea was that, if Svadu is available, it should be the hardware's 
job to set the A/D bits. That way, when the A/D bits eventually start 
being used for some purpose in Xen, we won't miss an unconditional write 
of the A/D bits when Svadu is available.

If you think it's enough to just have the A/D bits set unconditionally, 
I'm okay with that, and we can go that way.

~ Oleksii

