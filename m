Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BB4CD6E4A
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 12:56:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326186.1591615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUl8d-0001bl-DD; Wed, 03 Jun 2026 12:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326186.1591615; Wed, 03 Jun 2026 12:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUl8d-0001be-AX; Wed, 03 Jun 2026 12:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1326186;
 Wed, 03 Jun 2026 12:56:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUl8b-0001bW-6N
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 12:56:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUl8a-00BzfO-IP
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:56:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a202453-bab6-0a2a0a5309dd-0a2a45029414-34
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:56:00 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a202460-af86-0a2a45020019-d155da2eed3a-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:56:00 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-bebc80100efso448792466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 05:56:00 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf05176fd14sm152509766b.11.2026.06.03.05.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 05:55:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491360; x=1781096160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eNVw/KiM6h+NH5CVUKMczzCXqF7am+stunxK+uGnnSo=;
        b=OcuOA+QSvLj/jODPIiUNKILLKCvhn2w5bXj+3dvfmbr4O8lCmwyVM9sPOsZONOA/cN
         UkX5F+lIFLHffR1BMnMZ7GqrfRvgPjCzlTgVmAW+1ThFFR95L0NYsbP6QeIjcDJIRyWR
         5RrpZcJ7mY1MyDlVUmYm9zH6zUE0M1CtQgC75O+MO1uaqoI0jVw3nIYAhkT/hOhIkyg8
         9wQqxbrChiGmfQFvkIV5BUka/j0tW3lcYpZoSKLm7ypleRd4oGt/ZUC6wY3/k6/stgM/
         2PwYJaiiug2as4bzXhX0er9AaOyoHFHpcLmopkoWkiikFxPyniKeZhqje9e5Bd39uaIz
         DoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491360; x=1781096160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNVw/KiM6h+NH5CVUKMczzCXqF7am+stunxK+uGnnSo=;
        b=Hzsp/W2p8s3smVTpg0URSBktIo83ZGd/6hyU0Cd9uScyucJkwpRCx/BcwQb0tG+Kxl
         /yTvORUawSDjZP56YCk1UtPVZ8k8WVBb9wvd+aAi8Wotc62PSjpbLi6mualYwkdyC2+u
         Nh2IwjSD4lxKT4pilAVZSOM4ex3gpLCUkcajFRV0rquZzc/1P4Yi/C+PdtF133BAjXNL
         PMRLNcOV6m637SlNgZlkCTV7Z3FOr+aHApETCeeI1WSI/EHXude8pbrJPmj1bvgXD3KI
         gl4XrGBKi2gT3Uq5UEcRfpJS2gQpg67pN1Kp8AuFZeUU4JagBkrAJoZgYVp6PKFkN9Y2
         +kMw==
X-Forwarded-Encrypted: i=1; AFNElJ95MvioZc1+a4GTieNI8Ew65bwnQDNseLHz6QYS9qMCOF4rZibK09YKjCi6ancOT+DKXbn1/NrVjSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydruBJPZ9VjImpWoaueUwBf3UjM2bpMAhNN+7KlnumaTfxvx7X
	KHHZ/QdT5AbuvgTu4h67IsbrnMRdTU2xBOOFknApUlz/4yOAGAjZNdleJThVsQ==
X-Gm-Gg: Acq92OHL/eXNPwdwrK4fcGOyn1JhTdshzFbVnkHbYMkEpazIHitSh+JHakvljX9qybq
	rOtPRV1VugfFnNZoBlcL8kgbsWfFlJIv917A72vrFpWN0uvts+ETw0Uyf2L2H0Ep/ZKKBCOVNKA
	BC/1TGZPWrH8U+iAzv1Wixn5EsxiWISs9imLwXM8npyWhknDdH1eE5QQjeYDcnYfdMOiTic9Uoe
	nhHu2GGDRG20Mkf0Hdcq2loFurMHwXc7NCzDwbnkT7JljLJjbp/AktYKHDsy4j8dR/I1tx51CuR
	Jc0YBkaQKVcqKXFrFJRuHXfdiPGnHXwzUl1QWonUQssHdQBKLpmO63b9G+7D4hZz0HqRHyoyPvU
	Q35HlPcPRD2tgdikm7hkFEWjEdoRXRsbNdu3GBsdvXTcnMk1ADo5ZO5WtuWmc3mQF/HoSbgNgHf
	RkBgzYlHCUKM9aTC9S2Rdift8+MkKPBPZErIr0/nfEYkaS7uzmnEz2rkrrVLwWH3assuW6kcNI3
	VI0FiCTfmk+nwym
X-Received: by 2002:a17:906:c14f:b0:bee:e2a2:bdbf with SMTP id a640c23a62f3a-bf0ae70abe6mr167141566b.29.1780491359759;
        Wed, 03 Jun 2026 05:55:59 -0700 (PDT)
Message-ID: <dcf84d32-3657-4905-b396-57d3a3e1f1db@gmail.com>
Date: Wed, 3 Jun 2026 14:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
 <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
 <9ae22210-6dd5-43e3-918e-f68b1294448d@gmail.com>
 <dc622455-c20f-4b8a-8c80-1e4c0143e8e0@suse.com>
 <ab414833-4a3c-485b-91ce-7a0a91f25182@gmail.com>
 <803b9674-d0a4-41eb-898f-4cb8df83c975@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <803b9674-d0a4-41eb-898f-4cb8df83c975@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1780491360-A8979161-9CF76A2C/10/73395122804
X-purgate-type: spam
X-purgate-size: 2251



On 6/3/26 2:33 PM, Jan Beulich wrote:
> On 03.06.2026 13:57, Oleksii Kurochko wrote:
>>
>>
>> On 6/3/26 1:23 PM, Jan Beulich wrote:
>>> On 03.06.2026 13:05, Oleksii Kurochko wrote:
>>>>
>>>>
>>>> On 6/3/26 7:54 AM, Jan Beulich wrote:
>>>>>> --- a/xen/common/event_fifo.c
>>>>>> +++ b/xen/common/event_fifo.c
>>>>>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>>>>>> int prev_evtchns)
>>>>>>
>>>>>>              evtchn = evtchn_from_port(d, port);
>>>>>>
>>>>>> -        if ( d->shared_info &&
>>>>>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>>>>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>>>                  evtchn->pending = true;
>>>>>> +#endif
>>>>> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
>>>>> (in which case #ifdef may be unavoidable here), an alternative where
>>>>> IS_ENABLED() could be used here may want at least considering. E.g.
>>>>> causing a link-time failure when shared_info() is used (and not compiled
>>>>> out).
>>>>
>>>> We still want here to have #ifdef instead of IS_ENABLED() as
>>>> shared_info() shouldn't exist for arch without 2L support so it will end
>>>> with linkage error.
>>>
>>> I don't understand this part.
>>
>> If the change will look like:
>>
>>     if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) && guest_test_bit(d, port,
>> &shared_info(d, evtchn_pending)) )
>>         evtchn->pending = true;
>>
>> It will help to avoid NULL pointer dereference of shared info page in
>> case of 2L isn't supported. But considering that shared_info() macros
>> will be reworked in the way which will lead to linkage error in the case
>> when it is used and arch doesn't have shared info page support usage of
>> shared_info() in setup_ports() will lead to linkage error what is wanted
>> to be avoid for arch without 2L support.
> 
> What linking error are you talking of? When !HAS_SHARED_INFO, the compiler
> will DCE the entire guest_test_bit(), including the shared_info() use. IOW
> I still don't understand what you're talking of.

Oh, you are right. Sorry for the noise.

Thanks.

~ Oleksii

