Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A8EC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 10:49:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406805.1639986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x250S-0004GK-IJ; Thu, 03 Sep 2026 10:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406805.1639986; Thu, 03 Sep 2026 10:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x250S-0004GD-Ew; Thu, 03 Sep 2026 10:49:20 +0000
Received: by outflank-mailman (input) for mailman id 1406805;
 Thu, 03 Sep 2026 10:49:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x250R-0004Et-5K
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:49:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x250Q-003LH4-IP
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:49:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9950a4-bab6-0a2a0a5309dd-0a2a4504bf34-38
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:49:18 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9950ae-b57f-0a2a45040019-d155dd29d904-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:49:18 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-485850cf499so91938f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 03:49:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed37c4sm11241379f8f.21.2026.09.03.03.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 03:49:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788432558; x=1789037358; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMtNZcdWrUtlpyEBaadTCPw6C9NxehkQhCnEcPOOYOM=;
        b=ooXKSAFFQ9IcLmxJur+zGEGiH/YZm9dC6CK9uF35OiKQUvAZ3t1b1tRD8cbZA2O1ZI
         JCRHkW/c5OsDkPoO8rEGod4WMhcDLztkB+WgITsU8xgyWUs/PK4ce3n08VO1FlDWFPoK
         tAQxvUgu5qcZNWObvnX4zkSdp4ewj35YbxM9tbXEeIiELuokWDRH7YSRl2mVZImsVhjD
         K0rU5PLLZCfuv3x6Itmwk1jEKgiHKcrTp/NI/VJGWacgSbaKAzwqKJV1pBgWQKgiEvKV
         wudcGWr1RrTkYOibUzX5DSCiC8DHg5ef2PafHxiOcaR8skkrRiM/ohwKyIwy09R71bsS
         uCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432558; x=1789037358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMtNZcdWrUtlpyEBaadTCPw6C9NxehkQhCnEcPOOYOM=;
        b=ZZwzICZkwzqOkFLygbi01pjVyq5imZ+ZlPiS1MddREq26PuWXaJeLTsJsKbnD19DbA
         T4sI2b646GnaKZ1ohbIb68Sr4bV+ryK/WL6PkIhErTtOXVAppddJV5DdKqcDq2jZJ3SA
         QcfTohhalyZuEt7i/pmCJUeqFsf90JzDw1UJtsCVOnIeVoCSJ6BzdgVwwRMHMYWeAo98
         zSoomyADu2z97oDsSqWMINClOAnjLloc4ZtCCKA7Xjh/q4ih0+EN81jXrJJdmHNX7QHM
         P7GS1O3IuCCrA8wqEuibw6EypU1gCEEp3Awsccu57N0b+2iuXicmnzD02Ey17FZ6+kPk
         754A==
X-Forwarded-Encrypted: i=1; AKwUvBzvnF/mfUqqc2grJIRHBsYE0Wwa9x+qlAPCkZscbaOi5Wys69l4GZ/G+LI6RVinnS4w/yO5tf1ovM0=@lists.xenproject.org
X-Gm-Message-State: AFuF++mTuDyfI5k5+Vyv/+rBtZvxy4Zj6+kbj33sey5NFpDP/txX2Nyo
	ouQX/NEmUp3pLH5VFyqDu/xOmup+HasfDorITJT7VXcosVMt0bLgsbtN
X-Gm-Gg: AYBFou1F0UPDvnEc9aluC30/74Zx7RulCWNSb8jt4WkJuzdGLkD7hZWjS5eD2B2BtIF
	jbZW7/Zc1VqGJOU2DtkureM8fK9GaBrLDHftIR8678sgWA0/GQDG4JOKF3iG/DQojRj2NiGPEjP
	r4P4Fpq8QW5j5oyqCDeyQSDocgEP0hrYV96lxTxo9FIMCR9s2ZYhh/NHCkIxy+O7LHlLyiML+xH
	aeSrew9Hed4AoEuy7T8jOP8qwesyqG24O15UA/RsRZH4Znfn5QErNaOj47IbjJQk8NyLeJalNHX
	kYan8Kypq57WtXkjcaUdZDzbqKHJ/ImvytZX4PNEOQLQCm3qGueW5gTzFUrgIx6V+V7sfvqVNhu
	kVoKSoJvvNbvpumu6YyEmOHKXKEdnLFSt0MDwpauwUcrm1lUFTzStiOvppiMH8TdltFgKpfBBFP
	rAtSpoo5W/DHaNqPpHjFRsHsolZcRShnTQYxtoFQVBoAvgHb8KNXWEJOXihvGUIVL/XS6PLvq0h
	g00yIicJ4BfhG8nCV44ToqErIZyz/dsGB4Yfj/BHQ==
X-Received: by 2002:a05:6000:491d:b0:47f:80d1:be0a with SMTP id ffacd0b85a97d-484913b985fmr21602074f8f.14.1788432557828;
        Thu, 03 Sep 2026 03:49:17 -0700 (PDT)
Message-ID: <ca6d67f2-a3cf-4303-95e4-aedec031aea9@gmail.com>
Date: Thu, 3 Sep 2026 12:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/20] xen/riscv: introduce (de)initialization helpers
 for vINTC
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <688352e340872a50af99a51082966669787b1f72.1787836900.git.oleksii.kurochko@gmail.com>
 <be618606-3b3a-41e7-ad99-bf427f1e723e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <be618606-3b3a-41e7-ad99-bf427f1e723e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788432558-C20D5B50-49C6BB7F/10/73395122804
X-purgate-type: spam
X-purgate-size: 1493



On 9/3/26 11:20 AM, Jan Beulich wrote:
> On 27.08.2026 17:19, Oleksii Kurochko wrote:
>> Add common helpers domain_vintc_init() and domain_vintc_deinit() to
>> allocate and deallocate a virtual interrupt controller (vINTC)
>> structure and initialize basic virtual interrupt controller registers.
>>
>> domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
>> is implemented as stub at the moment.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v8:
>>   - Add call of domain_vintc_deinit() to arch_domain_destroy().
> 
> Why only there? With ...
> 
>> @@ -308,6 +310,9 @@ int arch_domain_create(struct domain *d,
>>       if ( (rc = p2m_init(d, config)) != 0)
>>           goto fail;
>>   
>> +    if ( (rc = domain_vintc_init(d)) )
>> +        goto fail;
>> +
>>       return rc;
> 
> ... anything added between the newly added code and the return, ...
> 
>>    fail:
> 
> ... you will also need to call it here. Since it is (supposed to remain)
> idempotent, I think you'd better add that call right away (as long as
> domain_create() calls arch_domain_destroy() only when
> arch_domain_create() succeeded).

arch_domain_destroy() (where domain_vintc_deinit() is called) is invoked 
from arch_domain_create() if arch_domain_create() fails.

So, the mentioned case is already covered. Am I missing something?

> Then:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii

