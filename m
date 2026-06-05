Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB794CD6E74
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 09:26:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1329274.1593488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQo6-0001kE-Tl; Fri, 05 Jun 2026 09:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329274.1593488; Fri, 05 Jun 2026 09:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQo6-0001k7-QD; Fri, 05 Jun 2026 09:25:38 +0000
Received: by outflank-mailman (input) for mailman id 1329274;
 Fri, 05 Jun 2026 09:25:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVQo5-0001k1-Oe
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:25:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVQo4-00DQY4-Qk
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 11:25:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a229605-5cb7-0a2a0a5109dd-0a2a4509b266-30
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 11:25:36 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a229610-2497-0a2a45090019-d155dd35a50a-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 11:25:36 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4600cbb06deso919282f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 02:25:36 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda363bsm10864856f8f.31.2026.06.05.02.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 02:25:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780651536; x=1781256336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6jSEezpTfw4Nd/UPjuW83pGs9vMCI9cQiKOJdCdNOo=;
        b=qGL1M5ILQuEDsgw0Vvr+hExbakUeJSbtC0y3KAYvHk6CFARlVQxJJKYtTVs0bR/+Cx
         xe6FbJLNxGk29iR7niUG3bKQbVZUhaVWBncY0MS2GD5zLFetuVQWnA/4u1UpkE+yZxwC
         nZ1Y6QjtnwipP6FAtTIAESr6zFy9A8yS+r7ALdsSW/0SXKmcXSkgenqdyx/ZDrO5Cg7p
         saB9Mcf3Uuk+BUgDyz3Y+6wNjrmrOkN6d2e4eD8YxOpOMtgRZQOjgPymLAmJTEWtz3vi
         Gtovt49815yAmUB8Pc4+6lHpMh7nr6Ss8johSYk/NDId7kaFNIigH/7AP2uyYssCcXVk
         dfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780651536; x=1781256336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6jSEezpTfw4Nd/UPjuW83pGs9vMCI9cQiKOJdCdNOo=;
        b=TIFi5uvM7+Av2OrZXop5xabgiODhaanDH2rZO8ohj2XTunuk9D5Bl2KkJ7Z0j/IAzK
         /7n/O4BUJRzmunz+lqqKv9MzgRNRMcxh6CJbZwJu2l7STpFQaoXY0tT3ATkotJnogPTP
         bCbZxra0eTUa09srRM5YW6Zng7rIFYvDZ/hXYwMW4TLZwf/7yxl0CnqB4T9iDywyGJyb
         fooaYAubBZeEdzwKY1DLDIxb7SgYe1maIB/4awLSRrX8r7GquRvLHejXm05Wyq5zf3M9
         Bt7v4qEricTvXS4XHPCSTaPz+9CjvuGIfG4cYOyVe7CRI3WEq/aPIwNKBvYZvMcWJILF
         jeBg==
X-Forwarded-Encrypted: i=1; AFNElJ+wLE6KlfiKmyMbCYbJ62ndplYU/45eU7MyIhu5xM1EsGhicckap5hPOtGzv2kslbHP3Qdf6E9Thjo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKvvNHUw7JD7WtuXx4Cnmug18d/z3zTNPrjw2DYKypQF4MLLgG
	QnEbz9m9zaPswYGTyDHiD1gr56MeUyWLzp6MDBSjFRkB9wB44eu2NxqPuUhSeQ==
X-Gm-Gg: Acq92OERmpVICVFRXz48ZI9bZKC6hYHOxfniMoVksjcnubz+7upYCAkPGVYoPKiMtN8
	LHDZO0JhM5E1uDcxOj7lUyp9ruYS71++WfEfLdWePBtRl4YodiwXJZUoZOmNQI/tL/A9EKBWTOs
	K3U9JUk0Ydyp1ew7Kdriz6F0zgkj0bWDzM59uDgy8UMJl5QyCYHLlnLYsGmiHeGLc3xG71M6VfM
	FJXYwlMKkmBHRzvhXxsI4FoPpBWh7hlbJ8W44xivmHem2AvRLDCouuRPxDEasYy58mE8Ird4RlU
	bn90r7qmcspz7lCXF6fMuXGol33sQ8YVaGXByI9Q62wlK2WbYMzkWavS/V6PWQhk64cYPt9Mnej
	qMl0dy0zSgtQLf+2gYVxLgkOStaRFPNpcink+onAPYWbr6zU3CtMltqlC0kNKHs7B7pVc3p2alN
	4wlIXGDXv55U4bjBrYquEZEpus/n5zHLidDKiDxhzvfT+SMp2rFt4SobbLmjZPAKF3P5I8rqMeU
	cXKM092Q90Od/bf
X-Received: by 2002:a05:6000:4b01:b0:45e:739b:2750 with SMTP id ffacd0b85a97d-46032b82296mr2959164f8f.9.1780651536043;
        Fri, 05 Jun 2026 02:25:36 -0700 (PDT)
Message-ID: <1593d9df-5835-44dc-a33f-0dcd3348075c@gmail.com>
Date: Fri, 5 Jun 2026 11:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/26] xen/riscv: introduce (de)initialization helpers
 for vINTC
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <fc5560cd49a2b952ce7724c23e41da3368833d9f.1778250616.git.oleksii.kurochko@gmail.com>
 <b95f7093-9ae8-4461-95d5-3c4b8a69c62d@suse.com>
 <003f5317-7669-484f-8095-4e48eedc102d@gmail.com>
 <9236d2d8-a553-4d2e-a924-42a454346620@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9236d2d8-a553-4d2e-a924-42a454346620@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1780651536-89775A53-F485C9F6/10/73395122804
X-purgate-type: spam
X-purgate-size: 1499



On 6/5/26 9:26 AM, Jan Beulich wrote:
>>>> +    switch ( ver )
>>>> +    {
>>>> +    case INTC_APLIC:
>>>> +        ret = domain_vaplic_init(d);
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        printk("vintc (ver:%d) isn't implemented\n", ver);
>>> If we take this path for whatever reason, ...
>>>
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +void domain_vintc_deinit(struct domain *d)
>>>> +{
>>>> +    const enum intc_version ver = intc_hw_ops->info->hw_version;
>>>> +
>>>> +    switch ( ver )
>>>> +    {
>>>> +    case INTC_APLIC:
>>>> +        domain_vaplic_deinit(d);
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        printk("vintc (ver:%d) isn't implemented\n", ver);
>>> ... we're also going to take this path (very quickly afterwards), just to
>>> get the same message twice without it being clear why it appears twice.
>> I missed to add printk("%s: ...", __func__, ...). I will update
>> correspondingly if we will follow this way.
> That's not quite what I was after, though. I question the need for this latter
> message.

I think I got you, and I agree that when someone decides to add support 
for a new IC to domain_vintc_init(), it is expected that 
domain_vintc_deinit() will be updated as well. So there is no real need 
to have the same or a very similar message in domain_vintc_deinit().

I will remove the message from domain_vintc_deinit().

Thanks.

~ Oleksii


