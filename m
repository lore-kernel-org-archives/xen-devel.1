Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFE1C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 15:21:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406121.1639551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mm2-00069b-Pj; Wed, 02 Sep 2026 15:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406121.1639551; Wed, 02 Sep 2026 15:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mm2-00069U-MQ; Wed, 02 Sep 2026 15:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1406121;
 Wed, 02 Sep 2026 15:21:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1mm2-00069O-6e
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 15:21:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1mm1-004bkQ-JG
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 17:21:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a983ee4-bab6-0a2a0a5309dd-0a2a4502b23e-22
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 17:21:13 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a983ee9-6ca4-0a2a45020019-d1558032b467-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 17:21:13 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49b9320423cso11925445e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:21:13 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce10153sm168831755e9.4.2026.09.02.08.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 08:21:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788362473; x=1788967273; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b99N2OUAp1o6mzY52ctUJa0+3WZ2qFKCyn/I4aeoC4=;
        b=X0Gj3nOq/N2ZpTxT9qYtCIm0nWNBfTitPQe8qFZk4gvGtR1PM/i8DudT4+/ezOdZm0
         jjQwOV/pLGk0/2wSNKUyTS7KOK2Y2wf8cFffsZoNVbJagYJPpjaMA4AIBQyn6TUXrw6k
         dw2pk83XiI6Wq3Yyvl1ac1MyKdZEg9fU8HTMfA3KNaPgSxcI1va0URF2jefRFq61t3wX
         j2BDNXVnXPQI+qt6vNtsHhSC33TsgcNeWBJU1ZJDzX+vkGHNmNr/vBT7DgoVnUBCQP1b
         /a6YlAzAzmuVi3wsDM9pOmAYTwM0cM10kc3gWNfzJx90P1TzJuS5lRWzGYKpgdgfoRLT
         sTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362473; x=1788967273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b99N2OUAp1o6mzY52ctUJa0+3WZ2qFKCyn/I4aeoC4=;
        b=qazIqWBhSdBt8C+Qp3TNtDvJJSJTJ8C63llEDLQ2tcqFa1j04V1m3YE7VMVB1pdhUj
         Pkzao6qPr/K//O4EoNpIHqyiCr3p1Q3aADK54hx4Wp17/OrJFu9uZgFwTqKL5oXylSqB
         oWxWMH4s6TpMEUFH5mM8eiU7K++eLKHjCKEWet8QQlWT3tLMPzQ8/UAW3FD7sZhSCJaJ
         3S6saffOQu54OIr48IXwta8E3C4h0nHVMzwT0txf8ArCLmmgzA8glOyDySKc2Lmn8gH1
         aaB/DGkq31VKvbppXVqHvCZyfZkQybkNwBndLW9zHsaA9Dv7Zr497sJT00jfydiGgJqS
         j4Hg==
X-Forwarded-Encrypted: i=1; AHgh+RpjJtpkVq4IuwX67AV1wqc9Q8aaEjvlLIYfgH83Nwz5XKWg0cXWFTR7MMlQvbjKFE5lMj5wy4NVP9E=@lists.xenproject.org
X-Gm-Message-State: AFuF++kvqAnCMalZ9lSkJC2V5rxpq8Zd2HYG10arKj7Ml1HI1SwPCzXo
	ZkT7RzVofBeJazbX3HQQ87vj/DF9cbq0YQdqdvM6IreaLOu//BlaVKVG
X-Gm-Gg: AR+sD10ceqHil+B68wvI/FmZX4VmKesEFOaUhSxzVSxl7kvQAWft3fuY5532uadVjEX
	KmrPFtbEJ9Ul52EPE8L6djHs9KP3RSnpGf4Pxs6UYnsYiX5fx1oCj/RL5hGIv115rcavMYMZfjY
	W2GKS2/sFhl98AONWiaqBH1RxXpw16uuG2endzdyeYLG0zuZ6dMgwRkfb/CKIHke4KIscd5Xccy
	FLTroNE9Alx1GjfAwdpKeyIIC6VLWjWprbdH8c+tp70N3HosNCHAMqBySUblwKEVUD5X4C08Wd2
	trljlKRsMghFQjYHWh1m9JHObkiGkvJbKKCjr+HV3muZInS+O5qocJNHPyumYXxl0Fd7n5RJWqJ
	y4c1RZspZf3dhAPZLuvQaRLUF2CVMPqIMJ87drXW6Yh453Pf3M1itbl8QDyk+OksHGO3/tluKdq
	GJc7VifnbVqbie1NOOT+vO/1xtxHlMUz1N4RhopbSqxmjkM1znZGL2xWFGq2u8ZkNN2DfQkyFEG
	e+dme4MPL5FoJ75liU6qSsu+NBAH4iNkUhPNB+xcw==
X-Received: by 2002:a05:600c:1c29:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49ce584c93amr99614505e9.16.1788362472727;
        Wed, 02 Sep 2026 08:21:12 -0700 (PDT)
Message-ID: <12197240-1e1c-4d97-8321-1b4208141582@gmail.com>
Date: Wed, 2 Sep 2026 17:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: fix out-of-range indexing of the IMSIC
 per-CPU MSI array
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
References: <20260902141607.24390-1-oleksii.kurochko@gmail.com>
 <833452db-58bb-4619-bff8-d78deacff7b3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <833452db-58bb-4619-bff8-d78deacff7b3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788362473-F12A12AC-6D05823E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1230



On 9/2/26 4:49 PM, Jan Beulich wrote:
> On 02.09.2026 16:16, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -326,6 +326,8 @@ int __init imsic_init(const struct dt_device_node *node)
>>       unsigned int nr_parent_irqs, index, nr_handlers = 0;
>>       paddr_t base_addr;
>>       unsigned int nr_mmios;
>> +    /* imsic_cfg.msi[] is indexed by Xen CPU id, so size it accordingly. */
>> +    unsigned int nr_msi = nr_cpu_ids;
> 
> Since there's no calculation involved anymore, is there a reason this
> new variable is still needed? With it dropped, ...

I just thought that nr_msi will be more clear nr_cpu_ids but ...

> 
>> @@ -405,7 +407,18 @@ int __init imsic_init(const struct dt_device_node *node)
>>               continue;
>>           }
>>   
>> +        /*
>> +         * hartid_to_cpuid() returns NR_CPUS for a hart Xen doesn't know, so
>> +         * the range has to be checked before msi[] is indexed at all.
>> +         */
>>           cpu = hartid_to_cpuid(hartid);
>> +        if ( cpu >= nr_msi )
> 
> ... this comparison also will end up looking less odd.

... I was wrong. Will use nr_cpu_ids instead.

Thanks.

~ Oleksii

