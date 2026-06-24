Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DC4CDB479
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 13:20:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344945.1603955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNWH-0005gS-1t; Wed, 24 Jun 2026 13:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344945.1603955; Wed, 24 Jun 2026 13:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNWG-0005gL-VC; Wed, 24 Jun 2026 13:19:56 +0000
Received: by outflank-mailman (input) for mailman id 1344945;
 Wed, 24 Jun 2026 13:19:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcNWF-0005gF-BW
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:19:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcNWE-002SG7-No
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:19:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bd972-bab6-0a2a0a5309dd-0a2a4509a664-28
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:19:54 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bd97a-97e6-0a2a45090019-d155dd30ddf1-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:19:54 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-46cbf263113so424380f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 06:19:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46caa798f43sm3156378f8f.8.2026.06.24.06.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 06:19:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782307194; x=1782911994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gf7pr69+crsSxqZxbLpEQPkUUTuH3erQaXZ7r2QHMl0=;
        b=DkkGjm5x0GPt9Q0Ej0WyCQfHlIoU4uf3DfIZYKHMnh/zHOqxxvMo1dPbi2rtFPLDNL
         9DoHYln6Ehbhc1KN5MWedEq4xeAHx423D9e6WVAKCk3rcSjIZdoKlLJwsXeC7OXOiIfN
         LsCEDSce4+MEHodHaqGS3WoLaQBH1oRZwebw7crHZTfkbo4Z2f1UgWWgKAy5UcUAuQ/f
         VX7pm1y+CMIWyX0NM+JrJSBuw80cFmvZv+cS4AtBpj2JkTlePAphYm4RdN1ZWOy+OdKS
         +zUJ+SyKfjywhM2d057teZ5LM+P2Zvu6Ssu84friGUocAp5Xg0tutoLGyCSt5hsTf1Ml
         qpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307194; x=1782911994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf7pr69+crsSxqZxbLpEQPkUUTuH3erQaXZ7r2QHMl0=;
        b=tKKPLPnPSSyoANcPKDTuRqrqYjxp0vqPqEsoouwBiTGWlN1dVVODy8u7LbVYAtHGRj
         ixmNP3WcxV6VJQP2aP7YunOXnOMWFLe8RyUKGxfNPg6xSTmuhgadBIr4ChT1KkcA4K6S
         8GNZZo0p1KhTaciAunGOujbNtS+w2Inx3FGNoPztarBVUbl4K5m2SyHt9yndJw1c37bJ
         WpwETc/xTduvUIp/g/eznyqI+2QzK0j6dQm/fbBfk1sNUBvlmrrkUMR5kf0rcVKI8wu5
         BDEDv8LF9S/lE0cDHqL6vA687wuKLtI2HUXTKD0xc/XqHlSyr7n7xVivDoUXU9VgR00s
         z6Qg==
X-Forwarded-Encrypted: i=1; AFNElJ8PfNhOojsZN6Laa4khMx4BlvscPWUw4USTldprm4YT6X3RskBblBTyFOOIOgZvPElaJ/R4uE1boT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywp/B3YMdTIy52o13lOmcycRvJKebXEsLCrT8e2PGx/RoESm24h
	PQkgDba2IttDMOPUlxTILNHBS59XjCUf78c8IXB24/mPGBmwjWWoLPQm
X-Gm-Gg: AfdE7clB18t+qBH39/yMtLYJSyB2ckjhc/Wsu98F+amXVRTf3Kmrhv/EIHCzIc1V0Aw
	i8sKGBz1tDHxEuKVaX/Up9WrQiS8MAE7QjF8vI4uvFgUSrZ7LK+VRkkkbiQf07uA04/kzSVaIHd
	MOjXXpC8veDBsvZ/ymmZsdScQFZAu6FftGd5ZXgzBd74gQ1fxbOrLmfbC/qVQS6I54MDNZ2UxcJ
	5w/AoqnFRkNGrgkdkrPApf12ahQ2nWGFyx7x46hPopdOK1/aHUD3DJ+N0PeZjXbIcjvhfb+q5zZ
	afPoX1Ava3EYWSvJx15ywMUb12Obn+/bW2xmerk0GVtQIDH5sJmLurvBuj2CBIsWGpmgQgAwYey
	iOGbiqQiIgi4jFgFhZJn+rgRPbubVXDoPvZ1d7AYvNxrIaAt85lbAFnZv10rDabgx28OALvoQlR
	rpUCb65tBFGK7SiCwom85Y6nqMXcQx3N+UEE1wx8zALY7NbMZ53LvmOZyiB9djg3AEQug=
X-Received: by 2002:a05:600c:8b2f:b0:490:b65f:8b1 with SMTP id 5b1f17b1804b1-4926084a274mr46366245e9.5.1782307193892;
        Wed, 24 Jun 2026 06:19:53 -0700 (PDT)
Message-ID: <92a45378-133e-4b12-ae14-3e5f31fb2d8c@gmail.com>
Date: Wed, 24 Jun 2026 15:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/23] xen/riscv: introduce (de)initialization helpers
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
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <8bb11b0d9c905dd3dd9f922a3f1d2e7f2b75c978.1781693963.git.oleksii.kurochko@gmail.com>
 <063d38ba-8ead-4f69-bb28-752fd56f0b12@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <063d38ba-8ead-4f69-bb28-752fd56f0b12@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782307194-5539B986-7B618C8D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1373



On 6/22/26 5:01 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> @@ -83,3 +84,42 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
>>   
>>       return vintc->init_ops->make_domu_dt_node(kinfo);
>>   }
>> +
>> +/*
>> + * Guests are given a virtual interrupt controller that mirrors the host
>> + * hardware: an AIA-capable host yields a virtual AIA for the guest, and
>> + * so on for any future controller types.
>> + */
> 
> This comment is worded as if it should be like this, when (as indicated before
> at the very least for migration) there can (and eventually should) be
> alternatives.

Agreed. I think we can simply drop the comment. The function name is 
descriptive enough on its own.

> 
>> +int domain_vintc_init(struct domain *d)
>> +{
>> +    int ret = -EOPNOTSUPP;
>> +    const enum intc_version ver = intc_hw_ops->info->hw_version;
>> +
>> +    switch ( ver )
>> +    {
>> +    case INTC_APLIC:
> 
> "version" to me means something different. Do you perhaps mean "variant" or
> "flavor" or some such? (I realize this also affects pre-existing code.)

It is more about a variant than a version.

Would you be okay with me renaming intc_version and ->hw_version in this 
patch, or would you prefer that I do the renaming in a separate 
preparatory patch?

Thanks.

~ Oleksii

