Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0D9EDF158
	for <xen-devel@archiver.kernel.org>; Fri, 13 Feb 2026 12:54:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1230865.1536262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqsgo-0001p2-Au; Fri, 13 Feb 2026 12:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230865.1536262; Fri, 13 Feb 2026 12:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqsgo-0001ov-81; Fri, 13 Feb 2026 12:54:30 +0000
Received: by outflank-mailman (input) for mailman id 1230865;
 Fri, 13 Feb 2026 12:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqsgm-0001op-KK
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 12:54:28 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2088d2b5-08db-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 13:54:26 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso7040435e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 04:54:26 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d930902sm229657365e9.15.2026.02.13.04.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 04:54:24 -0800 (PST)
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
X-Inumbo-ID: 2088d2b5-08db-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770987265; x=1771592065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWPLolIDpws5dRWyP31Bfk5fVjB1I9uQbJE2pAeobF4=;
        b=foJ0Uck8foiNcCvIYG3nPc8cb84F01InG/l5zrcek4MZx+1pz5IH+GkOO9tSnvMYKP
         jx8QLx7ezidjHcgKxQYlCqDIHr84V8u1yJox0ZuIrRuHV3XIw3neBouTlFlvcufSmg+l
         y9kVmwIxAECjQUw4oykrBg10fw1sXodRrJ/zS2FxNBXuDihVF6zy/mWFwVDFGlnOiZcQ
         PIIoLMJWv84LOju1d2w3bNnCVVns0FTMHZJx0WrIyNFaU4fBt6YPGoPVlCoGOHOjTIix
         nHlxOE34V3jNmSdjfkoJU1MonNQKNiXrRsfZAo3vXoUNrVkdWY5nczKB84hbGjmyRnfl
         TYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770987265; x=1771592065;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWPLolIDpws5dRWyP31Bfk5fVjB1I9uQbJE2pAeobF4=;
        b=GcwWrIeI/im+6yoQH0fRv6QHdVzwzokvCpX43z9WVViBPC1mkjCbjr3mYoBtPHPIHm
         aNExJsuAzy+QVL/2Ogp3+yRiwiGdYLiZARDd6aXIkrczgAxsoQJJUAghRz+v3RIsNmkm
         48Uxeg2eh6lqURdopezXcVf0OCgAGt8UtVk7+iP24FMHckFzKzCnPkiXDlxY5l1mC1/W
         AdWbGwHvZor11aAm8GCJ3PppTnrwQSYAsT4D5OM2rH2ZPTMlP+YMvYpcQ22AzTuNaBC9
         OWPGlrSk++GCYBRm15/uHwPhzuiZ+f3YKXROjexa0a3/z00lVQqzHgzO2PVs3/pm/ykT
         hmgg==
X-Forwarded-Encrypted: i=1; AJvYcCX7xIdYMThd6CfufF3ctK/rG/ROhbm8cEXWEsGfsyWr8n/UuPZqZvHGep8nAMqUUYJM07hn+97zUGU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWJo+UENONwmLU8BnsLezwDX/42QGFinKRNdiao+c9b1xNeduk
	l3U5q2o7L7/YCblCwUw63cFmzfSBYxC9eCcI6wOTQ+Tf4Zw/8uUaehLN
X-Gm-Gg: AZuq6aKE4ApzE/CWBrG+TtBDChzrkwdciBVJCThiIvw2Hf8UjyXR4eGhFBFPVEJ0Fz3
	HKyPrTP04Gj4M6mT/pojzWBp4qttrQWzVF+PNwclIyvXFo/AsshVrYOB8wFagjiRM+NLW2BZwWD
	B7bybjPNV1t2j0/fgDJ4nYkF+i9dKQ7CtfS4AukUo1IPQVNOKzcHR9g8ZPw26wFjF6nj1Q69m6e
	rK6jZsn7HKxB4Vb241tcHSLMOEZzs1GnfaHGgTj0SGINELYCUnhHcehK6CajRthNTQzAaQjKDPj
	AztF/47Zq04E6BnEro+IM89eOU3G8wVQRZByp4KEiyMMN/uMGU3blK+BqI1iaEDURKlcpcf0k5K
	yQtKjp8uI3KvFmSezqzOu/a+5yfUArDFCd9sGhSK+H+fup9E1zRXBg5W10PqxKgms7rtQeiDwFo
	xdcN4z4J5hGEiZbBkyGzgMlRf/bRyhNvZc6ennnUQHwWmup7PznOwMGmsvA+jMMk7kUn9QUnakv
	xc=
X-Received: by 2002:a05:600c:1907:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-48373a79afbmr29141955e9.35.1770987265247;
        Fri, 13 Feb 2026 04:54:25 -0800 (PST)
Message-ID: <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
Date: Fri, 13 Feb 2026 13:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
 <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
Content-Language: en-US
In-Reply-To: <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/12/26 5:39 PM, Jan Beulich wrote:
> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -44,6 +44,9 @@
>>   #define P2M_LEVEL_MASK(p2m, lvl) \
>>       (P2M_TABLE_OFFSET(p2m, lvl) << P2M_GFN_LEVEL_SHIFT(lvl))
>>   
>> +/* Holds the bit size of IPAs in p2m tables */
>> +extern unsigned int p2m_ipa_bits;
> Hmm, I can spot a declaration and ...
>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -51,6 +51,12 @@ static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
>>       .name = "Bare",
>>   };
>>   
>> +/*
>> + * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
>> + * restricted by external entity (e.g. IOMMU).
>> + */
>> +unsigned int __read_mostly p2m_ipa_bits = PADDR_BITS;
> ... a definition, but neither a use nor a place where the variable would
> be set. Hmm, yes, I see common/device-tree/domain-build.c uses it. Then
> the following questions arise:
> - What does "ipa" stand for? Is this a term sensible in RISC-V context at
>    all?

IPA stands for GPA. (maybe it would better to rename the in common code to gpa too).
It was used as common code uses p2m_ipa_bits.

Yes, I miss to set p2m_ipa_bits properly in p2m_init() where G-stage MMU mode is set.

> Judging from the comment at the decl, isn't it PPN width (plus
>    PAGE_SHIFT) that it describes?

It is PPN width + PAGE_SHIFT what is equal to PADDR_BITS (44bit PPN + 12 bit PAGE_SHIFT).

> - With there not being anyone writing to the variable, why is it not
>    const (or even a #define), or at the very least __ro_after_init?
> And no, "Arm has it like this" doesn't count as an answer. Considering
> all the review comments you've got so far you should know by now that you
> shouldn't copy things blindly.

It was added because of the usage in common/device-tree/domain-build.c.

It was done in the same way as it is also possible that an IOMMU shares the P2M page
tables with the CPU's G-stage(stage-2) translation, so GPA size must not exceed what
the IOMMU can handle (or G-stage address limitation if it is smaller then IOMMU's).

(a) It could be that MMU uses Sv57, IOMMU uses Sv39, so in this case if IOMMU and MMU
shares G-stae page tables it is necessary to respect guest address limitation.

But considering that according to RISC-V IOMMU spec ... :
   The IOMMU must support all the virtual memory extensions that are supported by
   any of the harts in the system.
... (a) isn't real issue as we could always program IOMMU to use the same as MMU mode
and then p2m_ipa_bits __ro_after_init should work well. It can't be const as I mentioned
above I missed to initialize it properly in p2m_init() code. (It is also a case for RISC-V
that IOMMU could use x4 mode, so MMU uses Sv57 and IOMMU uses Sv57x4.)

>> --- a/xen/include/public/arch-riscv.h
>> +++ b/xen/include/public/arch-riscv.h
>> @@ -50,6 +50,14 @@ typedef uint64_t xen_ulong_t;
>>   
>>   #if defined(__XEN__) || defined(__XEN_TOOLS__)
>>   
>> +#define GUEST_RAM_BANKS   1
>> +
>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>> +
>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
> Hmm, does RISC-V really want to go with compile-time constants here?

It is needed for allocate_memory() for guest domains, so it is expected
to be compile-time constant with the current code of common dom0less
approach.

It represents the start of RAM address for DomU and the maximum RAM size
(the actual size will be calculated based on what is mentioned in DomU node
in dts) and then will be used to generate memory node for DomU (GUEST_RAM0_BASE
as RAM start address and min(GUEST_RAM0_SIZE, dts->domU->memory->size) as a
RAM size).

>   And
> if so, why would guests be limited to just 2 Gb?

It is enough for guest domain I am using in dom0less mode.

> That may more efficiently
> be RV32 guests then, with perhaps just an RV32 hypervisor.

I  didn't get this point. Could you please explain differently what do you
mean?

~ Oleksii


