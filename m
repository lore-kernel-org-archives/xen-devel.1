Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1472BCDE004
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 13:44:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344982.1603992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNtv-0002t9-J9; Wed, 24 Jun 2026 13:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344982.1603992; Wed, 24 Jun 2026 13:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNtv-0002t0-FN; Wed, 24 Jun 2026 13:44:23 +0000
Received: by outflank-mailman (input) for mailman id 1344982;
 Wed, 24 Jun 2026 13:44:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcNtu-0002sr-9s
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:44:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcNts-00EADw-L0
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:44:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bdf2a-e002-0a2a0a5209dd-0a2a45048660-38
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:44:20 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bdf34-a01d-0a2a45040019-d1558031d830-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:44:20 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b9318997so5623555e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 06:44:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240084928sm474779835e9.15.2026.06.24.06.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 06:44:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782308660; x=1782913460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKF0HzAj+WZkdnzLGJPHlFrDF97nFQcpX90DJ50iMgs=;
        b=jkoKTQmoBkd/lN+DLV2JrgFFF5AnuJlvaLIiBkY/0IjEsUbgIDm3ehIPOM1Xd+uZJm
         uiWryL0eXawTxUViqPraObBE18hcbmGBO+rk7je6Z4lHj8XHU1HxtzypPWTFu3GSq4LS
         Ht7QdjJfkxJyVN41F3SSEk+kQUFQuBHbSfy+QckisZ48tfaqEZ3yHVplUlsQNzbqFhDQ
         P41FZcQCEuQMsmHpZRi3XuTSNwBbUeG8ifJMcMk1cuvxd+JfPKzcNjHAoHwbRs0NoguR
         w8Xws/OL34xt5OrrgCzWxff8LR0f7a0nJLvax0dhc/1PQgUi9u1jBX4bRMwRRFjIGuSL
         nJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308660; x=1782913460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKF0HzAj+WZkdnzLGJPHlFrDF97nFQcpX90DJ50iMgs=;
        b=lgX3FF7vb8+LE2wyv7NF6qEvgTI6S1YWEQN89uTUVU5j/q/IiKWWRuuCyxHM4D7/ga
         NP08bQlnWhCEg9ljpBZpcALrZ6k9B4duNdz45YghEfi8GPAMDCe6isI+uLFI5QggG2bp
         vPNX5TXnoyPmDqLPvTrnLgCEaQ6yT07/ZJkMxcMjC96RbdM9c20Yr5L05f5ekUtQtd94
         5ChjhF8pJurTJ4IelU1o1RViuFGtJEL/eW7pbwey7SSCOBdCDzjKyUZgkngIOcfc7bf0
         m3aLHvkapBh0ADg5527vwHEOKn5l7EeydgE0UU2FIvixL65OD8JGnjEJ5UE33tW8DGBR
         yDCg==
X-Forwarded-Encrypted: i=1; AFNElJ9okB9FcI0eET64m7EGxwd2tNkdg2GfGJGxE2If+g3q04EAWyHM1RszsS0a31UR+vTyuInGSfA9Mtc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd8ts/4ifm+3Uv7qCtoTX8QvqvUEWIB/3D0vchsPovZ2hZ0OtO
	Bkt6E+VIs/dkFjSyGd6tp5WzhSmOcw3Y3LW//Cnn3Gn6us8hw878KDso
X-Gm-Gg: AfdE7ckcoETqG6PXtNGwauJ5RsJWyDo1mDJ4n7pyGz8z9E0VS5a72jIUJyuGVN6lwa+
	UuWzXIyxNKQDTSMfieBosS+a1FO8Ck28nOREBbKsl8qYg5Kxt6UqV96kFxEwMj6D11oh3Q/I/NX
	0D+7dUjPDotuIJwVBrK6z1COigAlbU14q0I91q/GpXaIay6tPJqOGECifeFChn0fLzzhdGSkf10
	+sn6iYe3cbFuXwODSketXARM0K2zWeawr98QX5K6tkul+LRopyPk4IbzxpMKtHk6WyLRj6ANvcv
	FLE19g/msW1SxNGU4bOXOdLLgZ5DVD0QfWYDKzgIwHKcEHZ4s/9e64j0IH7n2sHrWl7skBw0Clc
	u7kWZMmtxhDRXWrCoPo3SQT6iA8mo/rDEAqQgsp36aem/PFlf1Tpw6MDbUauL5XGnK4l6+6PM/F
	pjLHFg9G9ZZlHpfjU7Pg97bX0rICaUBHWlB7kCnri4ODEcUJWC2Ijx/kNgnKmRGFfy/bA=
X-Received: by 2002:a05:600c:5494:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-492608784abmr47410935e9.25.1782308660049;
        Wed, 24 Jun 2026 06:44:20 -0700 (PDT)
Message-ID: <67a9f971-7221-44b1-8b56-19fdf2d76018@gmail.com>
Date: Wed, 24 Jun 2026 15:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/23] xen/riscv: create APLIC DT node for guest
 domains
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
 <0b034d584b7aaec54b70e9e575c727b07930d2ed.1781693963.git.oleksii.kurochko@gmail.com>
 <74f4b96e-1084-4880-addf-8ce57a0dab5f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <74f4b96e-1084-4880-addf-8ce57a0dab5f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782308660-AF7211CC-4B5303DA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1992



On 6/22/26 5:23 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -12,8 +12,10 @@
>>   #include <xen/const.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/errno.h>
>> +#include <xen/fdt-kernel.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>> +#include <xen/libfdt/libfdt.h>
>>   #include <xen/mm.h>
>>   #include <xen/sections.h>
>>   #include <xen/spinlock.h>
> 
> Why's this needed all of the sudden?

It isn't, just missed with vaplic.c, the similar name... I will drop 
these changes from aplic.c.

> 
>> @@ -29,6 +36,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
>>       return vcpu_imsic_deinit(v);
>>   }
>>   
>> +static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
>> +{
>> +    struct domain *d = kinfo->bd.d;
>> +    int res = 0;
>> +    void *fdt = kinfo->fdt;
>> +    unsigned int msi_parent_phandle;
>> +    char vaplic_name[128];
> 
> Again an excessively large array?

Yes, i will change to 32. It will be enough.

> 
>> +static const struct vintc_init_ops __initdata init_ops = {
> 
> Like elsewhere, __initconst{,rel} with const.
> 
>> +    .make_domu_dt_node = vaplic_make_domu_dt_node,
>> +};
>> +
>>   static const struct vintc_ops vintc_ops = {
>>       .vcpu_init = vaplic_init,
>>       .vcpu_deinit = vaplic_deinit,
>> @@ -43,6 +118,7 @@ int domain_vaplic_init(struct domain *d)
>>   
>>       d->arch.vintc = &vaplic->vintc;
>>       d->arch.vintc->ops = &vintc_ops;
>> +    d->arch.vintc->init_ops = &init_ops;
> 
> The caller of ->init_ops->make_domu_dt_node() appeared in patch 11 already,
> if I'm getting things right. That is, up here there's a NULL deref there.

Yes, but make_intc_domU_node() (and therefore 
->init_ops->make_domu_dt_node()) is only called from create_domUs(), 
which is not invoked in this patch series.

Thanks.

~ Oleksii

