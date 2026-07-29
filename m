Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75184C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 11:03:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375498.1622637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp23p-0001ph-Hc; Wed, 29 Jul 2026 11:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375498.1622637; Wed, 29 Jul 2026 11:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp23p-0001pa-Ed; Wed, 29 Jul 2026 11:02:53 +0000
Received: by outflank-mailman (input) for mailman id 1375498;
 Wed, 29 Jul 2026 11:02:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp23n-0001pU-R4
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 11:02:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp23m-007bfs-4F
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:02:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a69ddd5-2eae-0a2a0a5409dd-0a2a4504a2a8-12
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:02:50 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a69ddd9-b57f-0a2a45040019-d1558036c927-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:02:50 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so4969985e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 04:02:50 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bfc2ff2sm324038545e9.4.2026.07.29.04.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 04:02:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785322969; x=1785927769; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uajsEsoYWRFTcIEyjtIIuRS9ga12P9m/czWmEvckPdo=;
        b=lN6EgLOhbqvFcIysWLyni65cVeg/llHmVolbshts/FrbmTdzUIm6Z3xHyOZARphmEe
         9DmUT8ktSZooJBFpVjy6IwfJpC3g10G/eB2Ps98D18UbsHnxqOvl6yy9AYYDrtl7S90b
         85cbFUVL7vyB2JeBc9rjpIbm84VtflrWhB2ncekK/Vx3prySqJeuJYP4SDo2+AUTZhba
         NJebdNhFyoShDIGuGC8zKGPLNal3NOxVCbikTTYLUNWfXhn6KLsCG8bVUz7uA8MtH02B
         /CLicidu0onnoB0+4JY5VHBcgVKLTYAiN9CVjpLGlgby5r3uEOcwr4EA/wm+4tp0QbU1
         ugQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322969; x=1785927769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uajsEsoYWRFTcIEyjtIIuRS9ga12P9m/czWmEvckPdo=;
        b=Ktf7PlHdUNvUW6ZeyADSMk4SJ5J9hd0Y1ftO5Rp+IrR429eepHwnaZEQqI5kdun8xs
         oLPpvt/FFEG0fmdF7dDdHQ7n7uCwtPruyAKpn6OQDDrreDKBwY9MU2R51h2yHOvLqECX
         uw9eiP9ElPq3GUXzNd67bdBC+DmXiKcXkLXhwB7eEPV28R/GOg31C+NRdnoHyFYOQiy8
         YAUsTO4I/xaJVkqGDm2cMv1xSTwkB3Avd59pVCqyIk7OzMmFMBPf98TTj+hWOxAHwmZm
         Umzt077RRRlUE8x1j5j8QhbJvMRIYSJ6xdHQZc/FzSPn3XMiI+OEw+Vloahe1Ocec8Zs
         0Gpw==
X-Forwarded-Encrypted: i=1; AHgh+Ro67hdt8OfcGEhxhpnYMVp3rdcYsydF5jn6HskiXRz2+Rm3ZpyjC/Yqo3jGBsxJWaGCbEJFcQd3xHQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzewHPx8EMQBkp4F7GvDaTVaQDD3MvBplLIkq7s6Lx9qzp5vvaI
	Bsv6pafKOstV/k4miP1LoytBUqqKzhILgJfMKqW6h8cSUCt4UWsn5AZB
X-Gm-Gg: AR+sD10BA8AO+tsBlSvGCtw3AePEqbM3g+500SarzOU8H1g+yg3hwgUSGemGnUmBv4S
	b2150QpKyRnAnibGAv6e6GfJxBxVirHRxOBXPoMMS6lSWRZtZGPINu9rbvQ7xVcxSrqH/9Bv5/s
	tsJ85+inaAwA9s60JFqj4cTscliIEM2aMnk7/yyAGKgRkX0Jv20oyCGyLdWvBHT/yS9htPNloeN
	bU0+57HyYXng4cOUOaa0tvNwXmtheudDeziUaj2ZbvVevEfo4YKH6jdb7ML76QTu97cAl300qgK
	0YUY/cBhkIMVTcMc2hHk3lSF3WG+y5+QXgFLDwrCKCad01a6Lja6+JbJkUwSlxaXoly68+2LrBw
	Z8CHMv325Dlhz7QGkOzpFHRR7AyNV5tKeqXPfGYZ7t5Ukyxcd69j3PXqmTsAnLaDHb6+kUjJQmN
	cpp1dawe1Z98Z1mOrgxw9FQP5nI4w79VeOV8WMScnBm/oxD6Gw/qGTRIOALHUOjTjSktE6D6KyM
	GP7o7jD1kRT0iTATBZlhA4E7lLGTXyZ/VU1zrkeJB2rWgNrNVK91A==
X-Received: by 2002:a05:600c:4744:b0:493:f6f0:d66b with SMTP id 5b1f17b1804b1-496c6414fd8mr65819045e9.1.1785322969393;
        Wed, 29 Jul 2026 04:02:49 -0700 (PDT)
Message-ID: <247a16f6-bf53-4447-a17a-c7593c02950f@gmail.com>
Date: Wed, 29 Jul 2026 13:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/23] xen/riscv: create APLIC DT node for guest
 domains
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
 <06c022159e9cf70bacd0c061b7460b99a3dc88ea.1784559209.git.oleksii.kurochko@gmail.com>
 <c37949ce-5858-4b62-b6c8-5cc17d40c9b4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c37949ce-5858-4b62-b6c8-5cc17d40c9b4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1785322970-524CBB50-09AC73B1/10/73395122804
X-purgate-type: spam
X-purgate-size: 2669



On 7/23/26 3:08 PM, Jan Beulich wrote:
> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/aplic-priv.h
>> +++ b/xen/arch/riscv/aplic-priv.h
>> @@ -34,4 +34,18 @@ struct aplic_priv {
>>       const struct imsic_config *imsic_cfg;
>>   };
>>   
>> +/*
>> + * Value is inspired by what QEMU is using for riscv,num-sources property for
>> + * APLIC node.
>> + */
>> +#define GUEST_APLIC_MAX_SOURCES 96U
>> +
>> +/*
>> + * Specifies the number of wired interrupt sources supported by guest APLIC
>> + * domain.
>> + * Could be limited by host interrupt controller and is identical for every
>> + * domain.
>> + */
>> +extern unsigned int guest_aplic_num_sources;
> 
> It being only IMSIC which is supported right now together with APLIC, what
> exactly does the word "wired" mean to express in the comment? MSI, as their
> name says, aren't "wired interrupts" but messages on the system bus.

Technically, APLIC always works with interrupts delivered via dedicated 
physical connections (wired interrupts). The difference is that the 
APLIC can operate in two modes: direct mode and MSI mode. In our case, 
all interrupts are converted into MSIs, which are then sent over the 
system bus to a hart's IMSIC.

To avoid confusion, I think the term "wired" can simply be omitted. So 
I'll remove it.


> 
> You may also want to add "for now" to the latter sentence.

Agree I will add this.

> 
>> @@ -29,6 +37,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
>>       return vcpu_imsic_deinit(v);
>>   }
>>   
>> +static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
>> +{
>> +    struct domain *d = kinfo->bd.d;
>> +    int res;
>> +    void *fdt = kinfo->fdt;
>> +    unsigned int msi_parent_phandle;
>> +    char vaplic_name[32];
>> +    unsigned int aplic_size = APLIC_SIZE(d->max_vcpus);
>> +    const __be32 reg[] = {
>> +        cpu_to_be32(GUEST_APLIC_S_BASE >> 32),
>> +        cpu_to_be32(GUEST_APLIC_S_BASE),
>> +        cpu_to_be32(0),
>> +        cpu_to_be32(aplic_size),
>> +    };
>> +
>> +    BUILD_BUG_ON(APLIC_SIZE(MAX_VIRT_CPUS) > UINT_MAX);
>> +
>> +    res = snprintf(vaplic_name, sizeof(vaplic_name), "/soc/aplic@%lx",
> 
> Well, what should I say? I really expected you to have gone through all of your
> pending patches. replacing sizeof() by ARRAY_SIZE() in cases like this one.

No, you shouldn't but thanks for reminding me. I will replace sizeof() 
with ARRAY_SIZE().

> 
> With this adjusted and with the question above sorted one way or the other:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii

