Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091DCCDB479
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 11:36:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344839.1603865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLuD-0005Ju-8S; Wed, 24 Jun 2026 11:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344839.1603865; Wed, 24 Jun 2026 11:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLuD-0005Jn-4q; Wed, 24 Jun 2026 11:36:33 +0000
Received: by outflank-mailman (input) for mailman id 1344839;
 Wed, 24 Jun 2026 11:36:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcLuB-0005Jh-3d
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:36:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcLuA-0027xt-GR
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:36:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bc130-e002-0a2a0a5209dd-0a2a450ab512-42
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:36:30 +0200
Received: from [209.85.208.170] (helo=mail-lj1-f170.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bc13e-e40e-0a2a450a0019-d155d0aaecf8-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:36:30 +0200
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-39669bcaadfso7881081fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 04:36:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3999b182bb4sm34423541fa.34.2026.06.24.04.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 04:36:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782300990; x=1782905790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MzG+8HKfV4uLO40eP8RGOWtuXM4TAPEWaVM9IFRjjo=;
        b=A/ISGBiyzSC0WEHFiSTzO/UCBShAx9vRCAFyX1zX56DBS1bVxgHDL50DLb4yb1vM8G
         5FeAX83oeVwWMNeKnItrks+qIgI51I7eRPP08Hsww7pZNPMlo74Q6x3OtFgCdb6WYXPd
         u7+4fPRXsVVOZMPatxnMQhJZU94Vz20raagsGXwxQj5RZ8wRSpNXFSZvxOtD0ERFcXzf
         jfTo2DKWLxSFXEf89gaeAwv6LkIFRmj4mjma/SNXRGj1eA5iqQYx3kXVD2kDKv9reFdi
         ZcuKbK7dl/qPIixgZSdWg65Sy7TZoWTQpYYERSsqCrNi3yo2kruff2ZEb7EC1UhAYeXd
         nx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782300990; x=1782905790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MzG+8HKfV4uLO40eP8RGOWtuXM4TAPEWaVM9IFRjjo=;
        b=rE/Str98l+DCfZ2ibh5ujL8ekipGLYNLLKxHgMuWWCLsH6BzPcJS0pNS8mYrmGvB9a
         70Ov04sBBKzbiEzIkPVLSnvIxmUiu1dWr0RYVqXJrBPtrcTWRo8HS+5ywYln/fCMYfsh
         zww9Fe0MbE9aRvDopH4IfcWSYwBS4YQsyfNxpSQrvCbgrqxjnAKSUqHeY8d5ec0xBMoz
         TK5E7U4h7NeUYY+b7Ywc/DOasF7t6Uxsu9MvhKoT5IVUjANxstdK/6EZaT4sORkSb0qN
         dqZXNs5tosCvzBnx3lTJERYr8NZwXke4gHTH1w9LTU0w0WlBIjKbBaNCPwfgDIPsqoaM
         RhQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrviSyZbgUQcCKkzD3/MEPiVd7UdZ14ER7zWZZlrxDCC/LUaMNX7BqS+ZpNpta1VjoqCz40/566P54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuSGiDoI3919ie0Znt85qwVm2FVqupfSG8QQHsAbtDyfqEhqj8
	6k5zUaQ5HhAKh5E3XKH3U1cDCKtrsQzI4qjeHxUI6LDJ6iwZfYkYqMgv
X-Gm-Gg: AfdE7cml3j3zphNRKLXhHal8jav3YR8sIfKyUpJ5l9kQz7dk5Ts8zdhPE9CZ9ENkYRv
	m598HKP/7HHiHkBO2VY8dOSm4IJ/7oYnIZ/4O8Ey+F8gJcFu6VPGDxwUmmywrhUTdbYkPmpkTiA
	dXCXynemNGLRJrmTwxVhPOamxvSHvqadnzlJv+zY0wthuvpdqm9Pihxip0RmngGRGAb+CiP0zHd
	lWgFYlyWOAAsaS/F8PejzkGKFpIcQRN/QWsIr6m5QZMBmJdwWAbyMhuJeX0//9jlCvM/cR3qFB8
	zbOde1Uwa0bfmkHxoskgIkHefAfQs24MnZGGHMs7lMXuVJbsGwjQO308m7Yw3JyDh0eGvWnbjLx
	CkF/sFYWiXfd/zuasSrJJcnjGlLqNiydzKK6VhFmxf0nmMJyl0VpJJlYHX+GcI00mSvxbUXkhsq
	l8bn2BFZnUQ6yagpm027ypdCepoDsXjrH8JQVriMXOIZtVWr2B3iAgz8dqcC90S5TKo8k=
X-Received: by 2002:a2e:be22:0:b0:396:9967:cd69 with SMTP id 38308e7fff4ca-39aba1822b8mr7799321fa.13.1782300989575;
        Wed, 24 Jun 2026 04:36:29 -0700 (PDT)
Message-ID: <67d9ecf0-27d2-49ac-9186-6c7469921cf9@gmail.com>
Date: Wed, 24 Jun 2026 13:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/23] xen/riscv: implement make_intc_domU_node()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <7b40037c2d0cce84f9e65d7c4a58ec773f7e49d0.1781693963.git.oleksii.kurochko@gmail.com>
 <fe4e5c8b-eceb-460d-8727-790d7750e170@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fe4e5c8b-eceb-460d-8727-790d7750e170@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782300990-CFD33DDE-2927552A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1326



On 6/22/26 4:34 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> Introduce a RISC-V specific function to create an interrupt controller
>> Device Tree node for DomU domains during dom0less build.
>>
>> Add make_intc_domU_node() to the dom0less build path and wire it to
>> a new generic helper, intc_make_domu_dt_node(), which delegates DT
>> node creation to the active interrupt controller implementation via
>> vintc_init_ops.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with ...
> 
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -3,6 +3,7 @@
>>   #include <xen/acpi.h>
>>   #include <xen/bug.h>
>>   #include <xen/device_tree.h>
>> +#include <xen/fdt-kernel.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>>   #include <xen/lib.h>
>> @@ -72,3 +73,10 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>>       intc_set_irq_type(desc, desc->arch.type);
>>       intc_set_irq_priority(desc, priority);
>>   }
>> +
>> +int __init make_intc_domU_node(struct kernel_info *kinfo)
>> +{
>> +    struct vintc *vintc = kinfo->bd.d->arch.vintc;
> 
> ... this also becoming pointer-to-const.
> 

I will add const.

~ Oleksii

