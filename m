Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E199C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:47:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374906.1622247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok1u-0000vG-JS; Tue, 28 Jul 2026 15:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374906.1622247; Tue, 28 Jul 2026 15:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok1u-0000v9-Gf; Tue, 28 Jul 2026 15:47:42 +0000
Received: by outflank-mailman (input) for mailman id 1374906;
 Tue, 28 Jul 2026 15:47:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wok1s-0000qC-P6
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:47:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wok1s-007bE2-5R
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:47:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a68cf02-2eae-0a2a0a5409dd-0a2a4501aad6-48
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:47:40 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a68cf1b-5984-0a2a45010019-d1558035c59f-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:47:40 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4954c0833b4so29972615e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:47:40 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b388d5b4sm225948115e9.3.2026.07.28.08.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 08:47:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785253659; x=1785858459; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGVeiZJgiOerc6G0bvosshOkdn1rvNx/25/6z5ZKalI=;
        b=JuJoDQKT+1Z2zH9ciNDotRoEIZcygf+ppM9+OUgpQQ0Kspwlr9Mmq2fcieYbrD0/9I
         /xkcnh+QYALV0sXURBVH9d/aayTXKP3wt4NXyRwO0p/GNmyB6J+WdDp+7HjUiXDcPWCh
         Lbb8gMZWLhdq8Xu0Dj9g4idmK/j95UV+bT4hu4+qWXXlPDC+3RkNYicxrTJ98Uuewdrg
         UoSOuLAJay99YZo6o+7+x9q65jh9CVtBQDZy73Tl2r7DJHywOGuU4oubtdg89ke7UiCQ
         3F95SXxqzmnp6ZURxGfZeHG855pXG//deqF873ZgMig0zEEdpzOKJ7nZyuxp6QGOM9pG
         awaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253659; x=1785858459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGVeiZJgiOerc6G0bvosshOkdn1rvNx/25/6z5ZKalI=;
        b=TNWdA2pKIJF5wNjYEawqLhL2Gmss+Cb5U1QLklq776MxR0s+gabvAUnFy2Z8iSLJEN
         Xwx4HrxlVn93Q2Vi745fgdN3GPhYtyFiPJ83HDwZJqEOCDAiH9sTVkX1plPfulDj5RCG
         4RxAiEvvB8SSu93D9SNxxL1pJW40rwO2KYUG3rbJk+MHum0NE/tbRyYxRWRSj6Mpli4x
         xoJExm04Zz0KTB+ffpiWfc8jdaKr0mwf88WSwjwQI5ETqC7U/HM4+/5HgLcbhlRtFIjX
         gpxsmPf3VvKQtifh3ApTOMQcCrPcL6625OAcNiCpq142MX9dMGdqgX0XZR0v86KV6J9h
         03hA==
X-Forwarded-Encrypted: i=1; AHgh+RrUj0z2GXnqsk3IAUrZFB5XIOQZfWXIiPOWdd/LCDTTPEZWFYM2iaQPh+midKv/nMPNw/9HBImZky8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhZaJDbKKRSRyumkEZMcoadR3Nq9K697VSMHPhbV9GbeFTzayP
	bNSiV1A3GLkXZSJAEb1oe9K1EK0BDURJB7cXYRfo277unXB8lT/NlhvO
X-Gm-Gg: AR+sD11XKe1UmxFXA/5cqihz4oMZwdY0JPzcNA/DF843XhH/oojnu2JuOQIQMDtA2BS
	Jh0mD7/5TzORIZ7K0qn8HLs8wdg5aCk1q5KxB71Ry5IvAcnhpXdzQGJnZ522CJdxa03ninCktOr
	nKgFezjjSilKsuPzWeGICkh/Xt+cH7ahV+kcvHPWdgDu1u5w9T1pNwFIAPSkAUO/gBU6LxGBFcY
	7XM4cNac9Gvp5k1OfaVxdmUXWPjs3fLkchrTwX9qdnsMnjqBeGiY11htnRauR/Kjug0/urUbN2z
	qtm0nIbHkw9U8P0NM1HJoTVvS9w/52GnWI+yG5W2+QrctB2wzA5RC4vhMaFHMKfUklU1AMcF6SY
	ozPLpfbrYVVHWuK1lMaKsCLHaUtsd2S/VohGqqls6vvzJLqJuIKHWwln3bOPCSrLeTQK7z+sO7k
	7J/rFgBSGdCR7y/IYVun2Kzg2fIv/9mTIzAWJIKwsT2i2EDF0bmzG95DOt
X-Received: by 2002:a05:600c:5253:b0:495:7287:293f with SMTP id 5b1f17b1804b1-496c6580206mr33873095e9.35.1785253659552;
        Tue, 28 Jul 2026 08:47:39 -0700 (PDT)
Message-ID: <1e6d2cc4-4bf0-4035-b6fa-52bd111f03fd@gmail.com>
Date: Tue, 28 Jul 2026 17:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/23] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <9f5d1005611daa4ba9e4324950fcfe10adbebc32.1784559209.git.oleksii.kurochko@gmail.com>
 <d329d1c0-59b1-4aa8-b72d-5aad3e310f07@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d329d1c0-59b1-4aa8-b72d-5aad3e310f07@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1785253660-C5341757-2198CAA0/10/73395122804
X-purgate-type: spam
X-purgate-size: 3350



On 7/22/26 9:25 AM, Jan Beulich wrote:
> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>> Introduce build_guest_isa_str() to generate the riscv,isa string to be
>> passed to the guest via the Device Tree riscv,isa property.
>>
>> Introduce the per-domain guest ISA bitmap, populated during domain
>> creation by calling init_guest_isa().
>>
>> Introduce struct riscv_isa_ext_entry with a new guest_supported field
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

> 
> But see below.
> 
>> ---
>> Changes in v6:
>> - build_guest_isa_str() now takes a `const struct domain *d` instead of a
>>    raw `const unsigned long *isa_bitmap`, to leave room for using more than
>>    just the bitmap in the future.
>> - Compute the guest-visible ISA bitmap once at boot, into a new
>>    __ro_after_init `guest_isa` bitmap (compute_guest_isa(), called at the
>>    end of riscv_fill_hwcap()), instead of re-deriving it from
>>    riscv_isa_ext[] on every domain creation in init_guest_isa(). All guests
>>    currently get the same extension set, so this avoids repeating
>>    identical work per domain; will need revisiting if/when per-domain ISA
>>    policy is introduced.
>> - struct arch_domain's `isa` field is now `const unsigned long *isa`
>>    instead of an embedded bitmap; init_guest_isa() just points it at the
>>    shared `guest_isa` bitmap rather than copying bits into a per-domain
>>    array.
>> - Mark riscv_isa_ext[] __initconstrel, since its entries hold name pointers
>>    and the need for relocations requires that the compiler emit the data to
>>    a writable section.
>> - Make build_guest_isa_str() __init as it is called during make_cpus_node()
>>    which is used only (at least, for now) in build time of domain.
> 
> This last item is confusing. For one as there's no call site being added here
> in the first place. 

Agree, I have to put that actual call happens in the follow up commit.

And then - why would the string need re-calculating when
> the bitmap is calculated once at start of day?

It isn't re-calculated per call site, only once per domain build. But 
you're right that today that's still redundant work: the bitmap is 
shared, so every domain gets the same string. I kept the generation in 
make_cpus_node() because the string is consumed there and thrown away, 
and because per-domain ISA policy would put us back to building it per 
domain anyway.

~ Oleksii

