Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76A0CD6E55
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 13:02:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326205.1591633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlER-0003tR-9D; Wed, 03 Jun 2026 13:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326205.1591633; Wed, 03 Jun 2026 13:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlER-0003tK-6Y; Wed, 03 Jun 2026 13:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1326205;
 Wed, 03 Jun 2026 13:02:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUlEQ-0003tC-Ip
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:02:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlEP-00FxqR-Vh
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:02:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2025c4-5cb7-0a2a0a5109dd-0a2a4505e4a2-22
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:02:01 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2025c9-aaa8-0a2a45050019-d155da2ca8c7-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:02:01 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-bef8b97655eso114690366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:02:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf051d82a31sm157345066b.19.2026.06.03.06.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 06:01:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780491721; x=1781096521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4od1HOoTgeM9Rp+6xcIjRMrkU/PU5hUqSDqyqvlukdw=;
        b=kPQYccB36ziw5SoR75jlaeL4e9etchaFB/4qGtzBJXED2ggGqhHrxACVCsJS2kKGlz
         M8CxRl4FJcNwjz3yn95Mla0FuPoBNdF5IHPNWeLQl4sEMzN1W+DsqUAMSq2aNssjTm3W
         9qRdf8tvqcvY5zUN2uwrNY/5Cv3BBi2HL4w7xsoW/hsiXt0HBKgLyCHqRj8753idzCap
         OIXpVdldq6ouH3Ikb3KRcO0TkO3vX8L/OVkRVlTwB72bU6PPgmXkpyzAjaeAQdhMp8+g
         Ap+Ak+yq4XFJ0F8s8M0aSU55j0r0QliWjpHqntIq7ClvIi/QqhG7uKZC0eSBlfLCIpf0
         X7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491721; x=1781096521;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4od1HOoTgeM9Rp+6xcIjRMrkU/PU5hUqSDqyqvlukdw=;
        b=Bd8hWr0aKIZ9O6/u3CSJ7bB6/pYK5ynYQn0+btYLT56QNqYcFpk9BUYUdKyOStis6j
         3uZZzpe0nHdqCIPSExfRTPZkU0JfTS7eGxhNWmzszRMi23CzgREj2h6COmLPbubvl9+o
         +iIG6PA8SYHTNOi1ZuEXf16hBTrb5B9GU43QbADFYCook9WErYAsICcgdzJNDKfJOJrw
         eKtqoqndTIKX6bRQt+SL7mBE/BLiSGPSuy8pQGMSgrmdHha0VFl8owLIJXPwnL+lkuQl
         /7mS3FzWWfLizqz4wgJloD4OApEEl9OMSOZnPG1VzUpNf0IQ7ELZZeYkMGBMrptMmSPq
         HHjw==
X-Forwarded-Encrypted: i=1; AFNElJ+DmUIqpHWFhsVWEEcHvcd6maPMFMLzttST9RtnKRRlIG6otsScRdY/ftGOauaaGmgIIZ54onzEkIw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvOCkVwOKrlNagJE/kybakz8jbBcOUvlh3cOpaa8/yCBQ7/oX/
	LWIdUuHLAlGgHYFclNcUDGUFGb5SrhhLRIaGN8JXxk5W4r93OUOadoehNGq6HA==
X-Gm-Gg: Acq92OEqGrY492VMPGPrfY3Jat2anprIkyZpwdycSGDbS0lgj/UwpA7mkqNZZbdhSXl
	Z4Z6INFFGb2EGuvX4PxXLp/bMvoHvaRg3A0e/gmBuvMH9H2sB0C0HPxkercJ9oW4OWbsez0WWi2
	vc0BAk/np4VcGuNMyiVcAvgFo1Tw5D2N2tAsRUwJyDYN8SDUmBsDyyk8OYBsCdPTLPIxm3xrjHY
	Vb+UuCY75porvw+KwfPTsFPk/2gTgttnuevIfq421uQTI0tdwsZrsSdcZ9EtHFBoMk2no6f/M52
	urqwJDzvatXmaGGkhIxALfMCvt9opZlL6R7a6j4ZRfqV1cMJFgfanh9M+X0wxiXaN2BZCPnRi2K
	iJn8xhS8X0ExadgcEnTFKIh7rwQHbtpWY6e1puoRgja7zwjOuiDgtD0h02fvePqz7elilyYoKcM
	9QV58EbMj4BePa4DfZH+AJ2ifFOsOiNJTANezh3sQXYogHGMdOAwNECqzhIUPqGG42UvqvhK8FI
	+ON9d2So+pDxbD+
X-Received: by 2002:a17:906:a354:10b0:bf1:cc:3d55 with SMTP id a640c23a62f3a-bf100cc455bmr87945066b.3.1780491720831;
        Wed, 03 Jun 2026 06:02:00 -0700 (PDT)
Message-ID: <23167e00-685b-4033-aa8c-6c44c705448c@gmail.com>
Date: Wed, 3 Jun 2026 15:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22(?) 0/2] tools: Use the system liblz4 package
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
 <4818e5b8-21e9-4f2b-9977-8fc4c9a4889b@suse.com>
Content-Language: en-US
In-Reply-To: <4818e5b8-21e9-4f2b-9977-8fc4c9a4889b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780491721-DA175443-014521FA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1286



On 6/3/26 11:16 AM, Jan Beulich wrote:
> On 03.06.2026 10:53, Andrew Cooper wrote:
>> Switch to using the system liblz4.
>>
>> This brings libxenguest's lz4 decompression in line all the others, rather
>> than using the unsafe decompressor from Xen (itself a port of Linux's unsafe
>> decompressor).

Generally, the patch series looks straightforward and low risk, so I am 
comfortable taking it for this release. Considering that...

> 
> As stated in 84f04d8f0dbf ("libxc: add LZ4 decompression support"), there was
> no shared library available at the time (and on the SLES versions I worked
> with). Later a shared library appeared, but the -devel package still wasn't
> there. On my main dev system (intentionally a relatively old SLES version) I
> therefore wouldn't be able to build/test LZ4 anymore if we went this route.
> (FTAOD this isn't an outright objection, as the goal of the series is
> certainly good. It is mainly a data point to consider.)

...does not consider this an outright objection. While this may become 
an issue sooner or later on older dev systems, if the change is accepted 
into staging, we could switch to the shared library approach in 4.22.

We should also consider adding a note to CHANGELOG.md.

Thanks.

~ Oleksii

