Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90345C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 10:24:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349714.1607373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wes7A-00007J-4T; Wed, 01 Jul 2026 10:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349714.1607373; Wed, 01 Jul 2026 10:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wes7A-00007B-1u; Wed, 01 Jul 2026 10:24:20 +0000
Received: by outflank-mailman (input) for mailman id 1349714;
 Wed, 01 Jul 2026 10:24:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wes78-000075-9t
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 10:24:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wes77-009LD7-5V
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 12:24:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44eac0-2eae-0a2a0a5409dd-0a2a45048c86-34
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:24:17 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44ead0-a01d-0a2a45040019-d1558035e4d3-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:24:17 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so4110065e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 03:24:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4fc1ddsm71386625e9.14.2026.07.01.03.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 03:24:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782901456; x=1783506256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qm/QOIEGH/EybngvDt4pUFu9qHLWWoz/mlh4VsVX9Mg=;
        b=JCl077maBKOP5XsWK7mk73OIZ0JWKCgahd/dEH9eqOi9F2tPn9wEHxd5Wxrph8LJkJ
         aHEB16cVRHOBcTNE/ZyZQLp8hEWMSAzrp+kcA6TiFcAVDz9Np64XoGmGGvHZHPIezcN0
         bG6gkOSCmui2wC3H6uigdzRLJV/+VgFH7gN2BMw7pOwazezRfvveMC6KArjgexK6qvyf
         rqqmDSuNGvMnXUkBaJiCREbqFjpO4F2ZXTAEebJmEMwc6jMIY53g0HYvuEI3t+w2eUpM
         8BYjQpDBBfeG85NRQVNObAcHKk1j8Q68O1wLij+8KSuFjjrsVnQaH5A8bYOYALr9/fkQ
         ZIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901456; x=1783506256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qm/QOIEGH/EybngvDt4pUFu9qHLWWoz/mlh4VsVX9Mg=;
        b=jAn16HvdkKy4zW4zQcb+ch3o6Vzzt75JIzfBSLbFAJMNasw9PB9gJWosBxa2y2KYnX
         t16SV6XbQKU4kA00aSHlEAcTBCcj+7CsmteDnJlEtAM+hfrRcW0CTSv4Ll/1kmKUwsCS
         qvatwBFs5YBvXdMXGpZ5DTv0Ksg0w+OAE2SQ39CdQLi910Ll7S/vuWnxZ6TW1pK97Q7W
         GdktkmLs/lXuLl7v1xHMAouKzldfH4Uji6ZWlIZLw1cBq+m4A7ZPyw5chVHbtFE32uUr
         kPU+G4x+kKsaZJyls2au0sBMQGAQlM1aGif+VKgqwPPB772XEeB47IyFDYHQtWXmfD9E
         nsUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xUmG5Earn69QbkvJp4TTJ6DBn+G1b9QlQd9QWG0cJ4BRNUCWgEb8RCNFAM4ABsvj33pwatFns2bc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2BjM0aNRc/Fm+2NkBNlMaCO3fWvv7tTNpPR/KIkCr3qjo+xZn
	ntLBoSOfi5sbNnu4j34N0Mi+ObqvNn+ybWDI6kmRJFcgO2rGAzDWyxj7
X-Gm-Gg: AfdE7cnGtnwM4lpx7eQoHY5SaWIHAaE/tR16hglkTsg6AbpOWAwA3SZbhG4rQpqJ6TA
	uh4PxpN/cIb4kS2G6otAV6UqiMDCb1ZPkwlBXIlJr4su4/zJv7xYSoM8RX1x2UJYt/Pxl1Js0eT
	Hh4CdouPXpUmNtuMaeDU23+na4YacQ/LDPpNteyr0a6z6lyu+i3U6giaYyY/FgjFhlK9rBS+QJS
	YV3G4GGR+6HkXlMox1p3c5LCd0UjsETdKFDn21usjUSw0WJ6wfqd2SQ1yQ/4rldCoW41vQZ6RVL
	OrbzbuKxA7XQww+HgbENeQZNLbhOhzFvGG4giriMjZ/TI+rcMDSY8bnsuBUfOrxZz6yZ3LF9dWH
	dPWI8kGKIsGos6sjST9/VULtvgLRhzI4QWFQGXU2x5zj4ia2gYpx3c156M51fL6ofJdmfjT+oOW
	cWdYqcEYskSGqydjR2slBmCAaQhC7/jnyIT4z+6BHJpoCNDa+dT+vqURB/hGb715/Z54I=
X-Received: by 2002:a05:600c:8117:b0:493:b9cd:1272 with SMTP id 5b1f17b1804b1-493c2b96e36mr14998635e9.23.1782901456304;
        Wed, 01 Jul 2026 03:24:16 -0700 (PDT)
Message-ID: <015bb3d7-ef55-401b-902b-ddcd14a1c7ab@gmail.com>
Date: Wed, 1 Jul 2026 12:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/25] xen/riscv: introduce minimal virtual APLIC
 (vAPLIC) infrastructure
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <61603c1548b7c685fb92e1b687445fc1b6a95c35.1782487661.git.oleksii.kurochko@gmail.com>
 <c6f63b4b-1237-4992-bf83-07569d2e6339@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c6f63b4b-1237-4992-bf83-07569d2e6339@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782901457-ACB3B1CC-BB5D87BB/10/73395122804
X-purgate-type: spam
X-purgate-size: 3637



On 6/29/26 5:02 PM, Jan Beulich wrote:
> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>> Changes in v4:
>>   - Change subject of the commit.
>>   - s/APLIC_DOMAINCFG_RO80/APLIC_DOMAINCFG_RO + added a comment above definition.
>>   - Drop unnessary blank lines.
> 
> Did you? What about ...
> 
>> --- a/xen/arch/riscv/include/asm/aplic.h
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -15,6 +15,9 @@
>>   
>>   #include <asm/imsic.h>
>>   
>> +
>> +/* domaincfg bits 31:24 are read-only 0x80 */
>> +#define APLIC_DOMAINCFG_RO      (0x80U << 24)
>>   #define APLIC_DOMAINCFG_IE      BIT(8, U)
>>   #define APLIC_DOMAINCFG_DM      BIT(2, U)
> 
> ... the one you pointlessly add here?
> 

I think it is newly introduced... Anyway, I will drop it.

>> --- a/xen/arch/riscv/include/asm/intc.h
>> +++ b/xen/arch/riscv/include/asm/intc.h
>> @@ -15,6 +15,7 @@ enum intc_version {
>>   struct cpu_user_regs;
>>   struct irq_desc;
>>   struct kernel_info;
>> +struct vcpu;
>>   
>>   struct intc_info {
>>       enum intc_version hw_version;
>> @@ -51,8 +52,17 @@ struct vintc_init_ops {
>>       int (*make_domu_dt_node)(struct kernel_info *kinfo);
>>   };
>>   
>> +struct vintc_ops {
>> +    /* Initialize some vINTC-related stuff for a vCPU */
>> +    int (*vcpu_init)(struct vcpu *v);
>> +
>> +    /* Deinitialize some vINTC-related stuff for a vCPU */
>> +    void (*vcpu_deinit)(struct vcpu *v);
>> +};
>> +
>>   struct vintc {
>>       const struct vintc_init_ops *init_ops;
>> +    const struct vintc_ops *ops;
>>   };
> 
> I may have asked before: Why two distinct structures, next to each other
> (and without any comment guiding what is to go where)? 

I will add the comments:

     /* Used during domain build only; dropped afterwards. */
     const struct vintc_init_ops *init_ops;
     /* Runtime callbacks used for the lifetime of the guest. */
     const struct vintc_ops *ops;

> Plus you only set
> ...
> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * xen/arch/riscv/vaplic.c
>> + *
>> + * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
>> + *
>> + * Copyright (c) Microchip.
>> + * Copyright (c) Vates
>> + */
>> +
>> +#include <xen/errno.h>
>> +#include <xen/sched.h>
>> +#include <xen/xvmalloc.h>
>> +
>> +#include <asm/aia.h>
>> +#include <asm/imsic.h>
>> +#include <asm/intc.h>
>> +#include <asm/vaplic.h>
>> +
>> +#include "aplic-priv.h"
>> +
>> +static int cf_check vaplic_init(struct vcpu *v)
>> +{
>> +    return vcpu_imsic_init(v);
>> +}
>> +
>> +static void cf_check vaplic_deinit(struct vcpu *v)
>> +{
>> +    return vcpu_imsic_deinit(v);
>> +}
>> +
>> +static const struct vintc_ops vintc_ops = {
>> +    .vcpu_init = vaplic_init,
>> +    .vcpu_deinit = vaplic_deinit,
>> +};
>> +
>> +int domain_vaplic_init(struct domain *d)
>> +{
>> +    struct vaplic *vaplic = xvzalloc(struct vaplic);
>> +
>> +    if ( !vaplic )
>> +        return -ENOMEM;
>> +
>> +    d->arch.vintc = &vaplic->vintc;
>> +    d->arch.vintc->ops = &vintc_ops;
>> +
>> +    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
>> +                             APLIC_DOMAINCFG_RO;
>> +
>> +    return 0;
>> +}
> 
> ... ->ops here, leaving ->init_ops at NULL (prone to a deref that'll crash).

It is init-ed in [PATCH v4 20/25] xen/riscv: create APLIC DT node for 
guest domains and nothing between this patches could use ->ops. I will 
update the commit message to point that.

Thanks.

~ Oleksii

