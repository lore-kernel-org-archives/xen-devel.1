Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75009C624D4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 07:27:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406456.1639739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21rF-0005VM-IN; Thu, 03 Sep 2026 07:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406456.1639739; Thu, 03 Sep 2026 07:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21rF-0005VF-Er; Thu, 03 Sep 2026 07:27:37 +0000
Received: by outflank-mailman (input) for mailman id 1406456;
 Thu, 03 Sep 2026 07:27:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x21rD-0005Uv-4i
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 07:27:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x21rC-001NP4-Hf
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:27:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a99215e-8faa-0a2a0a5109dd-0a2a450ae2c0-40
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:27:34 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a992166-f2d2-0a2a450a0019-d155802ce9ad-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:27:34 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49cd77e0f95so20260895e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:27:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5f912esm48581415e9.4.2026.09.03.00.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 00:27:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788420454; x=1789025254; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBzWT83iUB/mf/uHu+DdqAJYHl0MdlxSCdvYVjop80o=;
        b=nqmqxkgCSKgQkUUzqrQNtoW7dDfNzCF3/QrWF+LbnT6NIsTl8FBQafHztI+xPyi12r
         ToyUWDy6zzBZ8ZaaDDa7zXvf1jXRmqaadG4craz6wF3JhOXxwyxjWjirrswEVzqA5fYa
         afow0ex8QL/u5IbkpBbpM3v5ZJ7dRAmHlaYxhe2hd0sSyNmRZA4TOzn9F7IS+YlVfTY1
         0Qn6p6EMNzF2hS6ov5IPbapytOYFa6Rm4J0siJc3TcAr7duwqj7x3iXBupxtP6RkQfId
         XWSZxfWfMQVWMckQBrk8B6QDxt89TmOcp9njS4i8BpdpSC/nZ1fcFY7fQZekckNsLDrI
         mG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420454; x=1789025254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBzWT83iUB/mf/uHu+DdqAJYHl0MdlxSCdvYVjop80o=;
        b=qxqFjXhFBUwTbxvsqgCbrtEN+nMe52DCtV4nwF8SDdJnyUSaXGKRa1DeUYlLlC+MVi
         xCLhiQxPgJ/pIm4KCKJ3+nTZAnVDAjMdCCMSd1QlBTsHJE8WV6BfxJb5drV23r6dVbFy
         rRj2/TIKn8Bz6zjw3gR5eJXDY0MsIAjM+IXcks86BfUr/9wSp7SGZ6ec2YUBYXZkVGRc
         btYzoxQgCVcBATWn6LyrVdTYyUtGCbVsOX6FxI3s7IWas+3A2KxiS6w50oQOzXbSjIoX
         7A0M3NpLbmmGDdQrp5fL+KYGwGF8gSWgSW6Ne9VVLij3O4qLOt6S705GEtwtx5bBbhy5
         i70Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuNUg6MF1KovG/3Jg2iaXqHswn4HX7uyRss4EYb+eRHOBmtOl+tga37L0XgFwBQ0v/15CJyqrLPjc=@lists.xenproject.org
X-Gm-Message-State: AFuF++mxjRnYqZlWRk3QaI63qxiIZTs+3SatQ/H0bpEugLzoJehlY+ZU
	YttmhRjqX43snow6Zryb6XtbaeA9NT/bNw7GOCQSCWTR8iHBh6lDxe7H
X-Gm-Gg: AYBFou3EyoLiSXWsVue9rIj9Cn97WIEsqcOFBy+hEOw2VAVO4//RCAaZHmyovW7fb4T
	GfV15+qzEwSBjQJ4S1JpneuBwrDhwgTyN9cLu1h03Tfi5268BNLpfiKw7cX9/VwVBPj/nXSpJ39
	D8yERJ+4TD7fAqaGOkzXfS7t/1Jdc1k8k+nU/vo6HtVYdnO3QzxuZfCaAYmSsEeDk4U+okJK1Qr
	067JGHtkNG5hkQvA1LuzEFPCEKyavo3S5D74s4sMJkWkQlOZhUCZCPqyHfDY1xeSLO5Etkgt5te
	plr2QlrWWAzklOUqhLxj3UW861r0Bzp+HZ9hSfTxtMXiO29QhN4MUDXgYkwqa9NlfzdMiIBUb8P
	D2jIAXSZ7MQK9fbt1/0D11agaJxQFl/49hXRbqnHCAaHHAkubBHTAZsQjlgW3T5KwALsXtMxXp0
	W83vQGdFT5akANWotUCah/rIFG8uYj4yp5DJA6GfMUYwmCA4hCcM6nz3xPZwvJ4GoeFP5L6ltWp
	GLHiR37B4vNVScq8BkmRP4DHlDbilrD9FmgzRhuloVyerKe4FBN
X-Received: by 2002:a05:600c:3485:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49ce5842b7bmr228116275e9.13.1788420453732;
        Thu, 03 Sep 2026 00:27:33 -0700 (PDT)
Message-ID: <01616191-99a5-48cd-9c3b-e6c00301ec67@gmail.com>
Date: Thu, 3 Sep 2026 09:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/20] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <2eb660bd05c6bf5946a7eae09406266db0c5108f.1787836900.git.oleksii.kurochko@gmail.com>
 <8520ca5b-d7d6-4e5c-a6f3-2969762fadd3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8520ca5b-d7d6-4e5c-a6f3-2969762fadd3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1788420454-5A7DACFC-525C252F/10/73395122804
X-purgate-type: spam
X-purgate-size: 3852



On 9/2/26 4:58 PM, Jan Beulich wrote:
> On 27.08.2026 17:18, Oleksii Kurochko wrote:
>> Introduce build_guest_isa_str() to generate the riscv,isa string to be
>> passed to the guest via the Device Tree riscv,isa property.
>>
>> Introduce the per-domain guest ISA bitmap, populated during domain
>> creation by calling init_guest_isa().
>>
>> Introduce struct riscv_isa_ext_entry with a new guest_flags field
>> to filter out ISA extensions that should not be exposed to guests:
>>
>> - f/d/q/v: FPU and vector context save/restore are not yet implemented
>>    for guests.
>> - Z*inx are not exposed either: they aren't in riscv_isa_ext[], so they
>>    can never be set in riscv_isa and thus never reach a guest, and no
>>    current hardware/guest-OS advertises or expects them. Supporting them
>>    would be cheaper than F/D/Q (FP values stay in integer registers Xen
>>    already context-switches), but is left as future work.
>> - h: Nested virtualisation is not supported.
>> - sstc: Xen owns the supervisor timer; guests must use SBI.
>> - svade: Xen manages hardware A/D bit updates in stage-2 page tables.
>> - svpbmt: Page-based memory types are not yet wired up in stage-2 code.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> In principle
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> Nevertheless I again have something for you to further consider:
> 
>> @@ -34,9 +36,64 @@ struct riscv_isa_ext_data {
>>       .name = #ext_name,                          \
>>   }
>>   
>> +/*
>> + * Which guests an extension may be handed out to, by guest XLEN.
>> + *
>> + * These flags express Xen's policy, not the ISA's rules: extensions which
>> + * are architecturally tied to one XLEN (Zilsd on RV32, say) need no special
>> + * treatment here, as they can only ever appear in the "riscv,isa" of a host
>> + * of that XLEN, and guest_isa is masked against the host ISA bitmap anyway.
>> + * They are only of use for extensions Xen chooses not to expose to guests of
>> + * a given width despite the hardware implementing them.
>> + */
>> +#define RISCV_ISA_EXT_GUEST_NONE 0
>> +#define RISCV_ISA_EXT_GUEST_RV32 (1U << 0)
>> +#define RISCV_ISA_EXT_GUEST_RV64 (1U << 1)
>> +#define RISCV_ISA_EXT_GUEST_ANY  (RISCV_ISA_EXT_GUEST_RV32 | \
>> +                                  RISCV_ISA_EXT_GUEST_RV64)
>> +
>> +/*
>> + * Guests are of the same width as Xen itself for the time being; once guest
>> + * XLEN can differ from host XLEN (hstatus.VSXL), this becomes a per-domain
>> + * property, just as guest_isa below does.
>> + */
>> +#if defined(CONFIG_RISCV_32)
>> +#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV32
>> +#elif defined(CONFIG_RISCV_64)
>> +#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV64
>> +#else
>> +# error "Unsupported RISC-V bitness"
>> +#endif
>> +
>> +struct riscv_isa_ext_entry {
>> +    unsigned int id;
>> +    const char *name;
>> +    unsigned int guest_flags;
>> +};
>> +
>> +#define RISCV_ISA_EXT_ENTRY(ext_name, guest_flgs)       \
>> +{                                                       \
>> +    .id          = RISCV_ISA_EXT_ ## ext_name,          \
>> +    .name        = #ext_name,                           \
>> +    .guest_flags = guest_flgs,                          \
> 
> As you're using token concatenation here already anyway, why not
> 
>      .guest_flags = RISCV_ISA_EXT_GUEST_ ## guest_flgs,     \
> 
> helping the use sites quite a bit? (Whether guest_flgs [then] is
> a good parameter name is a separate question.)

Good point. I will use token concatenation.

Regarding parameter name I have several options in mind: guests or 
guest_xlens.

I prefer 'guests' at the moment but I am open to adjust to better naming 
before sending v9.

~ Oleksii

