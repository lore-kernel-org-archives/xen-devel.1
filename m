Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAC0C43458
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2026 07:39:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1361479.1613698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjBG2-0003a9-SP; Mon, 13 Jul 2026 07:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361479.1613698; Mon, 13 Jul 2026 07:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjBG2-0003a2-Pu; Mon, 13 Jul 2026 07:39:18 +0000
Received: by outflank-mailman (input) for mailman id 1361479;
 Mon, 13 Jul 2026 07:39:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjBG0-0003Zw-W9
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 07:39:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjBG0-007FcL-9H
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:39:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a549611-bab6-0a2a0a5309dd-0a2a450aad12-26
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:39:16 +0200
Received: from [209.85.208.176] (helo=mail-lj1-f176.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a549623-ec7d-0a2a450a0019-d155d0b0e9ed-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:39:16 +0200
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-39c8dbf4f38so23068051fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 00:39:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b01cab0ed9sm2692278e87.77.2026.07.13.00.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 00:39:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928355; x=1784533155; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJiypZI3rX+NVBUzkeCadq5AbbT0xqBP9tuasjp3kI0=;
        b=kHNA3tgWJm8GMQaWzGhMprqqUwl6q8U58y30r8ZAZsyunaphQLteSVCbOg5+6St6QB
         074N8iYDJbfhI+909dLT18cf3H5kOgg/MSQBgCVkvDvnvM1Pfk5qqUk4hBZ1UCcwIwOL
         R/9hK/3D/6ozh9sBdYplkpzuBpBY399HkpS2h+wq2pXzIsv0egDL0grSf8Pn2G6czTnu
         hndzllV377yO6NRXcFGfLI7ssu3Q2nfNRin8pf5PlOiZdQZ69iG+ENS3yPx4B0IrZPZU
         C3aUoFWd8KLxu0X2CpoHiTjxCm2baq0vWrEV22yZ64I0MigHoWVfr8Zf4d1H2yMaRU4K
         hiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928355; x=1784533155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJiypZI3rX+NVBUzkeCadq5AbbT0xqBP9tuasjp3kI0=;
        b=oUmxefxE5TO6WTpysFyICfaIyFyGYkRvdn5qaK/FlZpzK/Jy44BReuMV8CvzWiz/kT
         ZSLSanA/uodKV8YZdw0kztUF0a7sSedVqXQMeaAfctYuF4aO7ryoYqwLi4UPs34zEadN
         daKG8wagNolXQ9kujno2kCGT3dp2yZ15n1ckkou2uxWJSNjH9WqtTWAcrzX36epVsJRU
         a+rbCVz5GScbt2ln4iKshSJ0RRL9BrcRGY/yCsc1+GytaPUKrN9UnY8v2aB6E6Ij0RxC
         gnxMI6GIPvOpadjhPBmiSw9eZTRafvebcdl8c8W2nKeIHEwRKOB/sy5zuul4VRJDDu2p
         OeqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq51tlB3Vc4nKgjuk6eoTFqBaX0OR1Z2q4YxuA4LrRrulafgYPXYiAui5fE0KnLULQcIUhC2qCjkFM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywky5zj1dEqfVhVlDoeNJTiF8+kw9vLeltjc9SlJlISiph3Qzor
	TQgTrkalsobJyAOkxRJT/pewF5FqV9+Je3OYtL+2zp3kPzzdR4fn5LZh
X-Gm-Gg: AfdE7cnf6z9Fwd4BnbGy//FgsC08SBAMXvyPWH2PH9PLELDwk//ncGhVyitABxsfW52
	rPvoDTlPqcIY2YpaSgYk5G1jyg6vJdnR70ToKIww2Z0P945bCcUQ0nMAhaJKwmx3xK2wox6bZlF
	pi4opSgtbCFW44I762Fln06VeQe6olX5oF/mqPbpYG8dq/TZsTtzOR9qvmKjrBskQIBgkEbuHyh
	HQNKCMuenttH7XYGBZ6/bXZzxmLO/EfOXWDEiX7mnTjDqoZbf2qugsbPwUojQswyeExtHJNQUgG
	i/hwLGhqg5kPi/kod6itM/2QbhOin7EmRZBz8KkXS1zYb6Y2dYrIf3h5XAINfD4z+ZMKC+Nwp+1
	zt6QmhYwwyNGTXCLn/cCzPICsE4r0yA4f8v9aRXPuBT0Or4yogWaZwh5X9Yn7n5NIawdE53oZTV
	dlKi2K999g9m9Bub2b+l7yqUXzbdFpuk9BZ1j8uHeLuCZbbsPuFM5Y+RckK65LpQJwI3g=
X-Received: by 2002:a05:6512:400a:b0:5ae:b91d:b2ec with SMTP id 2adb3069b0e04-5b0235612f8mr1980315e87.3.1783928355244;
        Mon, 13 Jul 2026 00:39:15 -0700 (PDT)
Message-ID: <9a75baf4-b889-4f2d-8cfa-d8a229411b68@gmail.com>
Date: Mon, 13 Jul 2026 09:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor
 lookup
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1783671887.git.mykola_kvach@epam.com>
 <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
 <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com>
 <2ba97094-c9c8-461b-adc4-64cca978dd6a@amd.com>
 <u46k277cxsw53rb2d4pnxksbbwr35rjp54vwxqm2phbrp2ywll@etlvezzojxvi>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <u46k277cxsw53rb2d4pnxksbbwr35rjp54vwxqm2phbrp2ywll@etlvezzojxvi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1783928356-3ED6A248-6B3AF550/10/73395122804
X-purgate-type: spam
X-purgate-size: 2006



On 7/10/26 1:48 PM, Mykola Kvach wrote:
> On Fri, Jul 10, 2026 at 12:44:44PM +0200, Orzel, Michal wrote:
>> On a tangent note:
>> I can see that you pushed quite a few "for-4.22" patches. We are approaching the
>> release, so afaict at this point we should only be taking crucial bug fixes.
>> Moreover, when sending "for-X" patches, please include a description with your
>> analyzed pros/cons of taking a patch in.
> 
> Ack. I understand. For this patch specifically, I consider it a crucial
> fix for 4.22 for the following reasons:
> 
> Pros:
> - It prevents an out-of-bounds irq_desc[] access which may corrupt Xen
>    memory or crash the hypervisor.
> - The issue was introduced by eSPI support already present in 4.22.
> - The change is small, and valid IRQ handling remains unchanged.
> - I tested CONFIG_GICV3_ESPI=y and CONFIG_GICV3_ESPI=n builds and
>    reproduced the issue on FVP using a fake DT interrupt with reserved
>    INTID 3000.
> 
> Cons:
> - The trigger requires either a malformed DT interrupt specifier, such
>    as reserved INTID 3000, or an eSPI unsupported by the Xen build.
> - The demonstrated failure used deliberate fault injection rather than
>    a reported production failure.
> - The patch adds validation to common Arm IRQ setup paths, although
>    valid IRQs continue through the same path as before.
> 
> Assessment:
> The hypervisor memory-safety impact and the presence of the affected
> eSPI code in 4.22 outweigh the limited regression risk.
> 
> I will include this kind of pros/cons analysis with future for-X
> submissions.

It doesn't seem as critical. IIUC, exploiting this issue requires 
providing a malformed DT interrupt specifier. If the DT interrupt 
specifier is valid, the system should behave correctly.

Given that we are very close to the release, I think it would be better 
to proceed without these changes. If the issue proves to be critical, we 
can backport the fixes afterward.

~ Oleksii

