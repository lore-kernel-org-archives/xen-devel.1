Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63605606A31F
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IO0o7xfo
Received: from list by lists.xenproject.org with outflank-mailman.1461277.1672266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK8C-0001Pl-EB; Mon, 26 Oct 2026 12:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461277.1672266; Mon, 26 Oct 2026 12:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK8C-0001Pd-AJ; Mon, 26 Oct 2026 12:48:52 +0000
Received: by outflank-mailman (input) for mailman id 1461277;
 Mon, 26 Oct 2026 12:48:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1xLK8B-0001PW-6z
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:48:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLK8A-004TSc-Cc
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:48:50 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6adf4c2c-bab6-0a2a0a5309dd-0a2a4507a068-24
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:48:50 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6adf4c31-b4ea-0a2a45070019-d155dd31e0d4-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:48:49 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1666298f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 05:48:49 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.102.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecdd5b3sm16198035f8f.53.2026.10.26.05.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:48:48 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793018929; x=1793623729; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VhOZNQNujrPuv3qbMef5fbbVAHZBux3NnjGIV32TQHQ=;
        b=IO0o7xfoE1++JICzsD16v6GzdBIfUgfHrKqrbo5ndOgdxaC9itwOvyybNnweyya+XV
         YXAQnw24BTPQxF58rfDoxPXGxth8OGjV0Lzup2rkqZaF+Heb/Zcb9gQ8E0Nb0vvnDnSE
         cPk2coJLgY7rFeLru6JTEIkAx+W+xOHd0jOo0k2TYsUBLufGUZPnS78QADwhsy3fFnWb
         cxiMwQvYuUIep03UYK3QM+dc+4p2bD9FxdhG4P5nSb9xBoeJXWAf2SBNHRHkf/1n3uXb
         w4uTJ3XNJzmZv6g94AtF8kgDnPZdjfWfjeOxOO00poj1cRAGYxjWBEKaTn9nccCOEWxk
         j5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018929; x=1793623729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhOZNQNujrPuv3qbMef5fbbVAHZBux3NnjGIV32TQHQ=;
        b=n7O0uzEgTvz5e8I3XpkfrTFkpnH+n3uOtZ84pzlItuTRSr5JRr+YQNxhm+IFTghYwY
         mxkU3GIx8/5l03SCIouk6O9dDZhWrk2qrc1Tlmi6mTR4HJUL5oKeQ8JFzn9B4JnxPYk6
         uSTBJJvHn57KZSlc/1Kml5BX2l+obVN3exQJXE6O3wqvWO8oxRyyUyds4o1SV1+0Us01
         2ooJ0cPg8z0bbJ7mN/L5lkxk8hguIz8Yt8gcY8xcIC7GVKbOUw4SCxKZZwfi1i9G9+/7
         N/SquhK+2CnSOpr7Q5hWjjDS1yFtDiVPrAhFxqTj2SUrPywoCmkVO4OYWCSRvzcgQObd
         1nsw==
X-Forwarded-Encrypted: i=1; AKwUvBzu52TjZpUasBZlAH53OktDR7/ElgilvQllmDIcsmSwG2jn6q/7dqCCNi3UitkPThUUw0kBDacyIrw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLHzCCLMrqKZibVNFVGvrvJBryyz3bc0uAtqzMDwH4Dc74SFzuW
	S74ldSVLv4co2Cb6IRY9WsY6mApoXyYNS3Ew1khGSHJm24HJ05IdVa8E
X-Gm-Gg: AYBFou3G1oxES/r0FXghZIGH1BYrsDtx7WplHlt3fR51W4KV5v9iv0c49/oKRTIQ8mZ
	/6GZzr0xyqW1jdQv5jlgtSuSgr2vh0dHVViU5a7xDsry04bORrpN0BdTQGw1KQu4lL/Ml0SwYBf
	CnnI9t6Zp1Pz1+9GUlRW7/YsmzKJr9n2M5/eXWaPqHhcxmLAy149Zh4+vhR/E/GgxI56imX/liZ
	SZp/odneLvU8pVj7Pj7+7jDzrBKFtgPvCDE9ZHFyMxcFjmBSNZcNvIAr5FDUYaatopDBc6nmHbL
	Sq4MDHc2h/0soyGWAZ2RbQF53qnIgSQdvA5TPrpngaOW24kIMBl9Xl2JbbWtVUb3F/eoXS9jojG
	mnsZU5o/KOhb2UMkbDMl2+St/DaCannP/nFwrixhqUfWaeJ0Y1HRmfGkJ4qFNXsrFIQTOu1zSus
	M+uTOCUZrmVTTLc7uNxjExbBRhn1CNQWzB+RE4pqfNFxyYZLNURpEEHJYHasyb2Y8NrisHLlshI
	b8c7ZBfrgTAJqJ2nug7vOfStb4QBdOBAkxd35U+j1DRu7Mi5i+JyN7euqpSbFE=
X-Received: by 2002:a05:6000:29d6:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-48e3eb75c4cmr7596099f8f.20.1793018929268;
        Mon, 26 Oct 2026 05:48:49 -0700 (PDT)
Message-ID: <ce7f966b-ab99-4924-a327-3e5d6da86320@gmail.com>
Date: Mon, 26 Oct 2026 15:48:45 +0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/desc: build boot GDT descriptors with a macro
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech
References: <20261020135722.45714-1-frn1furkan10@gmail.com>
 <0ee66940-5e5b-407e-81fe-de0e47842bbf@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <0ee66940-5e5b-407e-81fe-de0e47842bbf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793018929-35EC6AE4-1B55349B/0/0
X-purgate-type: clean
X-purgate-size: 6284
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/26/26 15:27, Andrew Cooper wrote:
> On 20/10/2026 2:57 pm, Furkan Caliskan wrote:
>> The raw 64-bit constants in boot_gdt[] and boot_compat_gdt[] hide what
>> each descriptor actually is.  Replace them with a GDTE() macro, modelled
>> on Linux's GDT_ENTRY_INIT(), plus named GDTE_FLAGS_* constants and a
>> GDTE_FLAT() helper for flat segments.
>>
>> No functional change.
>>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>> ---
>>  xen/arch/x86/desc.c | 61 +++++++++++++++++++++++++++++++++++----------
>>  1 file changed, 48 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/arch/x86/desc.c b/xen/arch/x86/desc.c
>> index 9f63928154..647affb6a3 100644
>> --- a/xen/arch/x86/desc.c
>> +++ b/xen/arch/x86/desc.c
>> @@ -27,32 +27,67 @@
>>  
>>  #define SEL2GDT(sel) (((sel) >> 3) - FIRST_RESERVED_GDT_ENTRY)
>>  
>> +/*
>> + * Expands to a brace-enclosed initializer for seg_desc_t; only use it
>> + * inside an initializer list.
>> + *
>> + * flags: bit layout matches its position in the descriptor's high dword
>> + *   bits 0-3   : type
>> + *   bit  4     : s     (0 = system, 1 = code/data)
>> + *   bits 5-6   : dpl
>> + *   bit  7     : p     (present)
>> + *   bit  12    : avl
>> + *   bit  13    : l     (64-bit code segment)
>> + *   bit  14    : d/b
>> + *   bit  15    : g     (granularity: 0 = byte, 1 = 4KiB)
>> + */
>> +#define GDTE(flags, base, limit)                                        \
>> +    { (((uint64_t)(limit) & 0x0ffffULL)            |                    \
>> +       (((uint64_t)(base)  & 0x0ffffffULL)  << 16) |                    \
>> +       (((uint64_t)(flags) & 0x0ffULL)      << 40) |                    \
>> +       (((uint64_t)(limit) & 0xf0000ULL)    << 32) |                    \
>> +       (((uint64_t)(flags) & 0xf000ULL)     << 40) |                    \
>> +       (((uint64_t)(base)  & 0xff000000ULL) << 32)) }
>> +
>> +/* Common flag combinations (same values Linux uses for equivalent segments) */
>> +#define GDTE_FLAGS_RING0_CS64   0xa09b   /* P DPL0 S code  RX A, L, G */
>> +#define GDTE_FLAGS_RING0_DS32   0xc093   /* P DPL0 S data  RW A,    G */
>> +#define GDTE_FLAGS_RING1_CS32   0xc0bb   /* P DPL1 S code  RX A,    G */
>> +#define GDTE_FLAGS_RING1_DS32   0xc0b3   /* P DPL1 S data  RW A,    G */
>> +#define GDTE_FLAGS_RING3_CS32   0xc0fb   /* P DPL3 S code  RX A,    G */
>> +#define GDTE_FLAGS_RING3_DS32   0xc0f3   /* P DPL3 S data  RW A,    G */
>> +#define GDTE_FLAGS_RING3_CS64   0xa0fb   /* P DPL3 S code  RX A, L, G */
>> +#define GDTE_FLAGS_PERCPU       0x0091   /* P DPL0 S data  RO A       */
>> +
>> +/* Xen maps every flat segment across all of memory. */
>> +#define GDTE_FLAT(flags) GDTE(flags, 0, 0xfffff)
>> +
>>  __section(".data.page_aligned") __aligned(PAGE_SIZE)
>>  seg_desc_t boot_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
>>  {
>>      /* 0xe008 - Ring 0 code, 64bit mode */
>> -    [SEL2GDT(__HYPERVISOR_CS)] =      { 0x00af9b000000ffff },
>> +    [SEL2GDT(__HYPERVISOR_CS)] =      GDTE_FLAT(GDTE_FLAGS_RING0_CS64),
>>  
>>      /* 0xe010 - Ring 0 data */
>> -    [SEL2GDT(__HYPERVISOR_DS32)] =    { 0x00cf93000000ffff },
>> +    [SEL2GDT(__HYPERVISOR_DS32)] =    GDTE_FLAT(GDTE_FLAGS_RING0_DS32),
>>  
>>      /* 0xe018 - reserved */
>>  
>>      /* 0xe023 - Ring 3 code, compatibility */
>> -    [SEL2GDT(FLAT_RING3_CS32)] =      { 0x00cffb000000ffff },
>> +    [SEL2GDT(FLAT_RING3_CS32)] =      GDTE_FLAT(GDTE_FLAGS_RING3_CS32),
>>  
>>      /* 0xe02b - Ring 3 data */
>> -    [SEL2GDT(FLAT_RING3_DS32)] =      { 0x00cff3000000ffff },
>> +    [SEL2GDT(FLAT_RING3_DS32)] =      GDTE_FLAT(GDTE_FLAGS_RING3_DS32),
>>  
>>      /* 0xe033 - Ring 3 code, 64-bit mode */
>> -    [SEL2GDT(FLAT_RING3_CS64)] =      { 0x00affb000000ffff },
>> +    [SEL2GDT(FLAT_RING3_CS64)] =      GDTE_FLAT(GDTE_FLAGS_RING3_CS64),
>>  
>>      /* 0xe038 - reserved */
>>      /* 0xe040 - TSS */
>>      /* 0xe050 - LDT */
>>  
>>      /* 0xe060 - per-CPU entry (limit == cpu) */
>> -    [SEL2GDT(PER_CPU_SELECTOR)] =     { 0x0000910000000000 },
>> +    [SEL2GDT(PER_CPU_SELECTOR)] =     GDTE(GDTE_FLAGS_PERCPU, 0, 0),
>>  };
>>  
>>  #ifdef CONFIG_PV32
>> @@ -60,29 +95,29 @@ __section(".data.page_aligned") __aligned(PAGE_SIZE)
>>  seg_desc_t boot_compat_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
>>  {
>>      /* 0xe008 - Ring 0 code, 64bit mode */
>> -    [SEL2GDT(__HYPERVISOR_CS)] =      { 0x00af9b000000ffff },
>> +    [SEL2GDT(__HYPERVISOR_CS)] =      GDTE_FLAT(GDTE_FLAGS_RING0_CS64),
>>  
>>      /* 0xe010 - Ring 0 data */
>> -    [SEL2GDT(__HYPERVISOR_DS32)] =    { 0x00cf93000000ffff },
>> +    [SEL2GDT(__HYPERVISOR_DS32)] =    GDTE_FLAT(GDTE_FLAGS_RING0_DS32),
>>  
>>      /* 0xe019 - Ring 1 code, compatibility */
>> -    [SEL2GDT(FLAT_COMPAT_RING1_CS)] = { 0x00cfbb000000ffff },
>> +    [SEL2GDT(FLAT_COMPAT_RING1_CS)] = GDTE_FLAT(GDTE_FLAGS_RING1_CS32),
>>  
>>      /* 0xe021 - Ring 1 data */
>> -    [SEL2GDT(FLAT_COMPAT_RING1_DS)] = { 0x00cfb3000000ffff },
>> +    [SEL2GDT(FLAT_COMPAT_RING1_DS)] = GDTE_FLAT(GDTE_FLAGS_RING1_DS32),
>>  
>>      /* 0xe02b - Ring 3 code, compatibility */
>> -    [SEL2GDT(FLAT_COMPAT_RING3_CS)] = { 0x00cffb000000ffff },
>> +    [SEL2GDT(FLAT_COMPAT_RING3_CS)] = GDTE_FLAT(GDTE_FLAGS_RING3_CS32),
>>  
>>      /* 0xe033 - Ring 3 data */
>> -    [SEL2GDT(FLAT_COMPAT_RING3_DS)] = { 0x00cff3000000ffff },
>> +    [SEL2GDT(FLAT_COMPAT_RING3_DS)] = GDTE_FLAT(GDTE_FLAGS_RING3_DS32),
>>  
>>      /* 0xe038 - reserved */
>>      /* 0xe040 - TSS */
>>      /* 0xe050 - LDT */
>>  
>>      /* 0xe060 - per-CPU entry (limit == cpu) */
>> -    [SEL2GDT(PER_CPU_SELECTOR)] =     { 0x0000910000000000 },
>> +    [SEL2GDT(PER_CPU_SELECTOR)] =     GDTE(GDTE_FLAGS_PERCPU, 0, 0),
>>  };
>>  #endif
>>  
> 
> I don't see this as an improvement.  All you're doing is putting a layer
> of indirection, and moving the attributes away the comment explaining
> what they are, and the attributes are still raw.
> 
> If you really want to macro this up, then at least use INIT_GDTE_SYM()
> from XTF or MiniOS.  That way you get things in a legible form at the end.
> 
> ~Andrew

Fair point. I'll fix it in v2.

Thanks,
Furkan


