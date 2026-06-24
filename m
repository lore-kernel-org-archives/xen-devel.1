Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE92CDE001
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 15:27:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1345117.1604105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPV5-0004R2-TH; Wed, 24 Jun 2026 15:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345117.1604105; Wed, 24 Jun 2026 15:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPV5-0004Qv-Pu; Wed, 24 Jun 2026 15:26:51 +0000
Received: by outflank-mailman (input) for mailman id 1345117;
 Wed, 24 Jun 2026 15:26:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcPV4-0004Qp-FI
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:26:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcPV3-00GKBN-NM
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 17:26:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bf716-2eae-0a2a0a5409dd-0a2a45039e6a-30
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:26:49 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bf739-ec1a-0a2a45030019-d155a732dc64-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:26:49 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5aa68cf9123so1283028e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 08:26:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad69555077sm1871132e87.32.2026.06.24.08.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:26:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782314809; x=1782919609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAjkuXKyz//WRRnZpv6mU16KCTCdTRm15p6oAYYQ0hM=;
        b=cBirY08LuUiWvYUQHUQ4Tmbl4PIY4CRiLLxSKMQR17PG/1JLFAr+FiLNiuCDhoY+Gf
         vqiKjEqXde2ZAd7UopG+5MD6uTxGoY4gJrEsAYVqS8An1cWOhkmxd0ZgLA5jFy4ZdRMS
         yHIKufVFEPEEEk8qkSZVcidpX1E68iqAOimJkL4gT+WWWy3UAyjn/UJ+1eyYs215udS7
         XBS9AkgYB6772/kP8vyGOYZU0yOupbmTyQv61hSBqaLfTr+J9VWXYjGjr+HoN+uyl4T+
         ytT1dKYcA91fiiFNOGdxDZ90EabhWI35jlgG68V8w1jem41/INi4NG+gw52cmrEtw26N
         awbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782314809; x=1782919609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAjkuXKyz//WRRnZpv6mU16KCTCdTRm15p6oAYYQ0hM=;
        b=prCDkp7yxYkEeUcKr2S9xDqZ5eBsSHAHEyDyMePnYgW3zYWADmhPbbIcwOZZqlND9m
         EjzYvV9GzfIc9XwdATY85BLKEuBJrMLg3CbJW3rBWBiDyfr83GuukKRJzRpwjl01uKPZ
         w4RV+I22xHQ10l7A/OGcHvZZ9loiMyw0ZBHdXlXQdnkSBs90UJ424j9vWBksaZvwhu4e
         hc9kw0Txf+InGIDe53ErX4kmGc7uwYHgN+D7nNapaoLau5LVMFEG9ptbU+/8s51GMbTE
         Lqw7UfjTPx2ZRb6y1d3otCvKpwo80woplkW5H/vYo839yCBWRXVBjHubSXK3UnqkDfPW
         oiBA==
X-Forwarded-Encrypted: i=1; AHgh+RrqQOGGF4F/tyKhDJ1dfTRhoHjozi0kZ/x0xRD2dDzFOx3krZHc7dQDWLCwVqhNstLcvQhdCJOLaF0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwilfYGkDI8d3WGuelQ6g0995ZP8v8ErYNi/66vBiWvZVUUxGNd
	fQSSsKdCTwYmXNylWmgm6mh4DBNpK3EU/2qs5MpDHaQhSjeRbawUEjY1
X-Gm-Gg: AfdE7cnWrkKO//E+1LwRuoNVpuA0RUZRfn9LOUGQIpm2/w1Uzd6JQk6YkNatBHr1c4K
	li6r4OgAtWV6VtlxU60WFtMZTAS5kFHByS0rHV6BkTcO2ywLfdNERe2hVT2H0m7cS7/NL83s2Tq
	5MAHqmKdb/50ygrmQ44IMTlqwE4/foEdLpPRlbo8YjemaiWtc3dIJFJv69Wy819FWg8qwiqUJOc
	SBIudx7dqoV3QWEu57uWuZTzYpgdaCb7YCkIq+d3OrUYwQExnfzGWfLE7AkmZ9etat5DNVxAsER
	KfD5b1tcyRJ1U1RFC/a98RiLStwZerGvt229O1eO8gYwmToN7ycsqDOerJQ7jn9f/LdPBvukbYD
	PoL8tap21kN8p23ZLzIJmkvh9mim8Z1nl4tLlcVE//9RuuJnTR1bIlAvqlakb8NX81I6QJ/mBWX
	OkQ1+fdqLadWZUxaQOLo84tbfYbS9vvuvkOMsR1RoVGz9F5KCD9ki+61EWkkYtPz2V7/s=
X-Received: by 2002:a05:6512:618e:b0:5aa:77e2:51b0 with SMTP id 2adb3069b0e04-5ae9d5aeb26mr915813e87.45.1782314808683;
        Wed, 24 Jun 2026 08:26:48 -0700 (PDT)
Message-ID: <08a7ba82-dac1-499d-ad7b-0dc0de82ab16@gmail.com>
Date: Wed, 24 Jun 2026 17:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/23] xen/Kconfig: introduce HAS_STATIC_MEMORY
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <22c02e188a0b38806f08b7a87f00f03c14aad742.1781693963.git.oleksii.kurochko@gmail.com>
 <2e9683f6-25d3-442b-9661-d32f979ca43b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2e9683f6-25d3-442b-9661-d32f979ca43b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782314809-0692D5D1-F41A1F5F/10/73395122804
X-purgate-type: spam
X-purgate-size: 2266



On 6/23/26 10:26 AM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> Architectures that implement guest_physmap_add_pages() select
>> HAS_STATIC_MEMORY; STATIC_MEMORY then depends on it.  ARM selects the
>> new flag; RISC-V does not, so CONFIG_STATIC_MEMORY is unavailable there
>> and randconfig builds no longer require an explicit STATIC_MEMORY=n
>> override to avoid a compilation error.
> 
> How did you come up with the connection to guest_physmap_add_pages()?

It is because of you mentioned in this sentense ...

> That's a close sibling of guest_physmap_add_page(), and they all should
> fall in the same group. The fact that right now static-mem is the only
> caller of guest_physmap_add_pages() is secondary.
... (the last sentence)

> New callers could
> appear. guest_physmap_add_page() could likely (in principle) be
> implemented in terms of guest_physmap_add_pages().
> 
> What you're after is a way to {en,dis}able STATIC_MEMORY on a per-arch
> basis. That's all what matters here.

I will reword that part in the following way:

Introduce HAS_STATIC_MEMORY so that STATIC_MEMORY can be enabled or
disabled on a per-architecture basis. An architecture that supports
static memory selects HAS_STATIC_MEMORY, and STATIC_MEMORY depends on
it. ARM selects the new flag; RISC-V does not, so CONFIG_STATIC_MEMORY
is unavailable on RISC-V and randconfig builds no longer require an
explicit STATIC_MEMORY=n override to avoid a compilation error.

> 
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -161,6 +161,9 @@ config HAS_SCHED_GRANULARITY
>>   config HAS_SHARED_INFO
>>   	bool
>>   
>> +config HAS_STATIC_MEMORY
>> +	bool
>> +
>>   config HAS_SOFT_RESET
>>   	bool
>>   
>> @@ -196,7 +199,7 @@ config NUMA
>>   
>>   config STATIC_MEMORY
>>   	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
>> -	depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
>> +	depends on HAS_STATIC_MEMORY && DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
> 
> This may end up slightly neater as
> 
> 	depends on HAS_STATIC_MEMORY
> 	depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY

I am okay with your suggestion and will apply it.

Thanks.

~ Oleksii

