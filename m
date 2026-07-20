Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFC8C4451B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 08:49:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366295.1616176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljg6-0005ld-Iq; Mon, 20 Jul 2026 08:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366295.1616176; Mon, 20 Jul 2026 08:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljg6-0005lW-Fe; Mon, 20 Jul 2026 08:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1366295;
 Mon, 20 Jul 2026 08:48:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wljg4-0005lQ-Bg
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 08:48:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wljg3-000Vxk-9I
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:48:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5de0db-2eae-0a2a0a5409dd-0a2a450b8316-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:48:43 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5de0eb-b7e8-0a2a450b0019-d155802cace9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:48:43 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-495590dde14so11612255e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 01:48:43 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2a2504sm288937475e9.2.2026.07.20.01.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:48:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784537323; x=1785142123; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DNZW2UKa26dlEBq25iew1lv7KSPvVj5flXMVm9wGXQ=;
        b=r5zr8xTTzQBzHVdqjbmfeoqqmLL9010v50aiEs+0kcecyKDqTu50XijibZWT1qmMAF
         hZRJONuexzIkvvav7eUjcqxngQCa+yvv7NvH3/NFdwvvye8ZRg8Z8KNp99QXnZqOmyMj
         ieCCIX5nFTe4RwcydK0QClKOkzjea+BQffzVmJqWraA18hSmXho6PiWQ+du+OJ1FY6gZ
         eMzgkRMbqSmOAOJbcgOSeFQXbRIsgSh/z5tGhPG6A6and9BZn4ZUY13eOiZA6dHQiykJ
         Ya78fmDMc8fE5r9Gh8gTpCRQZLp1nS2OZMYhS5e6AUuy+UJqf6Qb6HUw06yrwoQvT/fP
         0jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537323; x=1785142123;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DNZW2UKa26dlEBq25iew1lv7KSPvVj5flXMVm9wGXQ=;
        b=apXkO/8/eGEyUTPgfG58bZ4rnZmqrUzjz8vL/VodnvsR00JRdp4S0/aNRcuYxk/gCS
         NdkhHGGb5bfQzd4bO85XFi6by+kl50Z8o7CLbrfa+yv45hEeNWv6fo9owydjPzMR1hyc
         bl4UnOeiNOBLmb3PrKYvZxfvPUCr+Ez38HfNQwwmzmrHdp872Gpv9sYHs1Q5LRva6yb6
         PyMkyvNzXW3b2p7fzC9rYDUAp9mdizXV8BPlDmLtr4WanzU0Dy8zVKmYWTHH67K9ZDYH
         OdXXpqnFCieJAPa61kHoqK9mhT2zOmuLiW/YpimPHL1sXKln/3a0p7gf3haFjo5ess7r
         OAtw==
X-Forwarded-Encrypted: i=1; AHgh+RoT8zLG7IcfaSm4boqTGAC67Tr0F0HjWZZCuvF+YwDMPUp+kl5SKj8j328yk7S/CI1sQuhIzw/KgjI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoY2t3SEgy3iKXdmOM6AT1Hl6oj5z65xF3V00isq/dpbHDB45L
	bBU7tR4b1vKIlr+8Ng3hAgWOF6cLXMExTEBxCnD+sSINn+fbBX1TJCkf
X-Gm-Gg: AfdE7ck1YqUmN2l4/4eeeM88FZGpg6Q/SQPlJ0G/jDWb0A3ffumHEY//D2Vjubdkz7U
	/05+1jjr/BX/WOhnfIFrtKk072y4i6VEuKUhT6U2NmGTlqMxMKDuWnp/L2b0uZnKRW9mVfbbgV0
	ZXJecVWr8UFhdqOUEgw5qKqmG2Hlm0WiYn83LFPmS5zvHvEA3DFC9bw5b72skSE25Q7kMU4wh9o
	Z9TpNhoio2YoB7q5ipBW+DsEnepr8SceIWJxvMt3hcQV8y1NQuB1FqJEYxNjP4d8uXMDqF6OAPX
	i9QRXX3F7nYJGT9lyHPdEgLt+nvbUzBCiFmTKO2fLthoMy3KZtLS0diob40JjHT6SiQWY18oImE
	a6ZUNz3+UtpW6ZDmp4YMpv/pHmxILfAjUMELy5Tf7XUh0LcsmUEzbHWKeL7HJXJZ54yu/Hb0JYc
	FxaC6g76NslaRBlyxCT1LhsG3XsmTRirrrfAYR6YOkqA4OHLgA7XPtWvhy
X-Received: by 2002:a05:600c:3b24:b0:495:5d6d:9cb3 with SMTP id 5b1f17b1804b1-4955d6d9dcamr46374725e9.37.1784537322331;
        Mon, 20 Jul 2026 01:48:42 -0700 (PDT)
Message-ID: <9d04dfe8-97ae-4153-aa54-1bdbd31a7637@gmail.com>
Date: Mon, 20 Jul 2026 10:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [4.22] Re: [PATCH] x86/domctl: restore all registers in
 arch_{get,set}_info_guest()
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
 <83ac6e9b-3aaf-402d-9877-2ed63d365367@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <83ac6e9b-3aaf-402d-9877-2ed63d365367@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1784537323-198C19EA-7C09B43D/10/73395122804
X-purgate-type: spam
X-purgate-size: 3650



On 7/20/26 9:19 AM, Jan Beulich wrote:
> On 20.07.2026 02:12, Marek Marczykowski-Górecki wrote:
>> Commit 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
>> converted memcpy() of the cpu_user_regs structure to explicit copy of
>> its fields. In the compat case, it intentionally missed few of them,
>> named in the commit message. But the 64bit case missed also r8-r15
>> registers, which was not intentional. This, at least, caused Linux
>> 6.18.x crash when resuming PVH domU.
> 
> Oh, wow, what a bad mistake (including by me as the reviewer).
> 
>> Fix it by adding missing assignments.
>>
>> Fixes: 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> One remark though (equally applying to the original change):
> 
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1255,6 +1255,14 @@ int arch_set_info_guest(
>>   
>>       if ( !compat )
>>       {
>> +        v->arch.user_regs.r15               = c.nat->user_regs.r15;
>> +        v->arch.user_regs.r14               = c.nat->user_regs.r14;
>> +        v->arch.user_regs.r13               = c.nat->user_regs.r13;
>> +        v->arch.user_regs.r12               = c.nat->user_regs.r12;
>> +        v->arch.user_regs.r11               = c.nat->user_regs.r11;
>> +        v->arch.user_regs.r10               = c.nat->user_regs.r10;
>> +        v->arch.user_regs.r9                = c.nat->user_regs.r9;
>> +        v->arch.user_regs.r8                = c.nat->user_regs.r8;
>>           v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
>>           v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
>>           v->arch.user_regs.rdx               = c.nat->user_regs.rdx;
> 
> Neither here nor ...
> 
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -1481,6 +1481,14 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>>       if ( !compat )
>>       {
>>           /* Backing memory is pre-zeroed. */
>> +        c.nat->user_regs.r15               = v->arch.user_regs.r15;
>> +        c.nat->user_regs.r14               = v->arch.user_regs.r14;
>> +        c.nat->user_regs.r13               = v->arch.user_regs.r13;
>> +        c.nat->user_regs.r12               = v->arch.user_regs.r12;
>> +        c.nat->user_regs.r11               = v->arch.user_regs.r11;
>> +        c.nat->user_regs.r10               = v->arch.user_regs.r10;
>> +        c.nat->user_regs.r9                = v->arch.user_regs.r9;
>> +        c.nat->user_regs.r8                = v->arch.user_regs.r8;
>>           c.nat->user_regs.rbx               = v->arch.user_regs.rbx;
>>           c.nat->user_regs.rcx               = v->arch.user_regs.rcx;
>>           c.nat->user_regs.rdx               = v->arch.user_regs.rdx;
> 
> ... here it becomes clear what has determined the order in which fields
> are copied. It's neither by register number nor by field order nor
> alphabetically. We might do ourselves a (however minor) favor if we used
> a clear criteria; likely field order would be best. The more that the
> new internal struct cpu_user_regs mirrors field order from the original
> external one. Andrew (in particular)?
> 
> Also, despite this being an issue in 4.21 already, I think this definitely
> wants considering for 4.22.

Considering that it leads to crash of Linux I agree that we want to have 
this in 4.22:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

