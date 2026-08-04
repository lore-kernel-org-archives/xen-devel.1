Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4041C55172
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 10:27:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382082.1625481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrCMD-0001iy-Fn; Tue, 04 Aug 2026 10:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382082.1625481; Tue, 04 Aug 2026 10:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrCMD-0001iq-CE; Tue, 04 Aug 2026 10:26:49 +0000
Received: by outflank-mailman (input) for mailman id 1382082;
 Tue, 04 Aug 2026 10:26:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrCMB-0001ik-Qt
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 10:26:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrCM8-000Epx-OT
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 12:26:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a71be44-5cb7-0a2a0a5109dd-0a2a450693e8-42
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 12:26:44 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a71be64-195a-0a2a45060019-d1558029dd44-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 12:26:44 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so25572265e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 03:26:44 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b85be7sm395082985e9.2.2026.08.04.03.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 03:26:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785839204; x=1786444004; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6sw/ezMudW4mMwFYZn+KvA6eMQevSBKyPZciC7qYM4=;
        b=X0S2to+ZltJ/iKhreWlAIWe663vrfpc6Z5nrqQSXFX/Og6t0wGARC4sOAbATzhY8r2
         IBYlUzHCB4do/w+5Q3eISCzOCxr8Xyts1wQONNeUz/lQ+BsfaHjksZKcIhDFYSanoSer
         GCXyxap4DtkL5ODH+kTmzPDS0pqBjhha7y5mK6enPqAkN15CJsIzSqzNYKErIRxq/1mn
         fe/Xidia8IRtGNmuCZK3k6Baj+nY3rwy/IZs+FsW0lLXOi8yGde6KcQTSPL8Z1upwUXs
         E71jkss631U8Kt4v8Tma0fRbfqUqt2rmVLNaPBkIfm6cM66L59Bg1rlIguuUBPS45Pee
         2uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785839204; x=1786444004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6sw/ezMudW4mMwFYZn+KvA6eMQevSBKyPZciC7qYM4=;
        b=oabTn5iDoLI8961hLtjznoSwv23YPO3q/Of65aCBMyJyiOEFmehlexKINUtvBj0GuN
         loKoOQLtHTMEkNxTrDjdlAk+O3emDYRMbIjpMf8P4D2RvBNIkicJbsxnEae8TjAwFrlo
         v9EQE9EG2E5LjUmWcTggvXTHvhxPCRooezLiShbR3x/A0wionYzeoJUSKVAyjOsCjSnL
         DoekLkXJl1MM7hGfXKtwrtPd5V74c1k0tzjRwuoyxBQdEuWnUnfLKbij+IWU0r8RFwcY
         USDKM/wpXUeogcAIyGXSrdyLzyrZW/763h1rOzpsVzF5GedktNlSRrXFBjKzPitDxo+/
         OSsA==
X-Forwarded-Encrypted: i=1; AHgh+RqXWkih57W8G5Mx/Ytb1x2qhK5TxTEVe0m2VLI0mT+EmDcVWcakXi9MiyTwXj29VDtAxoktq1gb8Cs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK0rCuPH0YJ3VbKeDeF8MD8nndxIbfodi0HotPKNbIXso/t/YW
	/QZT0U9xKda8xuTS67V6oDZcz+6J81c4znqgT+XbBnJI5DCwiHHqu0iA
X-Gm-Gg: AR+sD10pjhikCG0Q0JGECgRY6vnrunwnKOYyGmuHDGqalgKPLnmID0zz/9771iveQYs
	GMi4HeBdYk8MRUN9GcSMdrKFKOco81GqHI4L95xiss637+76ZsDAAzQN3OY8LDBwHFi13xxZPsK
	VfOXswl2kiixvTSgS2A6qmZ1907qAjPpoG2K8iOVxxqJzcnPG+36Eg20w90xG8HBe6m794npLPe
	j9TMu3vKWPOhunqcmCms7oTn0bjCbSj1zR7MmYif0w+ibdYm24xG3WpFPaOh5umH2DFLKW5rqmH
	I63QoxiOCtCSIoKeQsYmLEaGxNGaWvY47BB1xmqz2+kJ5exZj1kR7jTJ66HHOMLeVbkI/+lsdOX
	Ar0T7bL8yCnde0MpPyagaa+l0BlLNagMNy0FFzPiagZ7NJinyQpS32zFxWSclYb+DJfRmA0+cRu
	FfTgM+W4mxr8M5QwdpZLpchrbL/Lr2V8GWQXBx9NuIHpj+Jkxx+cEG/u785bc3ikFvltwIkEcVC
	5ow9rHW0W0T1jortO3SiK0bFVH6yDDw+HvlUvWr+XQ=
X-Received: by 2002:a05:600c:8b17:b0:495:4491:b8c2 with SMTP id 5b1f17b1804b1-4980c66c926mr305125115e9.3.1785839202753;
        Tue, 04 Aug 2026 03:26:42 -0700 (PDT)
Message-ID: <24351c43-0b41-45f9-8d57-e88308edd5db@gmail.com>
Date: Tue, 4 Aug 2026 12:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/17] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <c12b69710d7b79bfc0c110f3fa043d871d8b8394.1784560663.git.oleksii.kurochko@gmail.com>
 <704870c1-18ec-4c7b-873c-e07e77ae0d39@suse.com>
 <d5867843-802d-493f-a535-1f40d9337b63@gmail.com>
 <2ef6b295-862b-40be-a7d2-c94a6378126b@suse.com>
 <636a6183-8c66-41b2-b820-6a02098fd33d@gmail.com>
 <51e537a4-f568-458d-9625-ada7fbebd842@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <51e537a4-f568-458d-9625-ada7fbebd842@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785839204-FC20077B-8F76657E/10/73395122804
X-purgate-type: spam
X-purgate-size: 3203



On 8/3/26 12:41 PM, Jan Beulich wrote:
> On 31.07.2026 17:24, Oleksii Kurochko wrote:
>> On 7/30/26 6:09 PM, Jan Beulich wrote:
>>> On 30.07.2026 18:03, Oleksii Kurochko wrote:
>>>> On 7/28/26 2:23 PM, Jan Beulich wrote:
>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/xen/arch/riscv/mmio.c
>>>>>> @@ -0,0 +1,145 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>>> +/*
>>>>>> + * Copyright (C) Vates
>>>>>> + */
>>>>>> +
>>>>>> +#include <xen/bsearch.h>
>>>>>> +#include <xen/lib.h>
>>>>>> +#include <xen/rwlock.h>
>>>>>> +#include <xen/sched.h>
>>>>>> +#include <xen/sort.h>
>>>>>> +#include <xen/xvmalloc.h>
>>>>>> +
>>>>>> +#include <asm/current.h>
>>>>>> +#include <asm/mmio.h>
>>>>>> +
>>>>>> +static enum io_state handle_read(const struct mmio_handler *handler,
>>>>>> +                                 struct vcpu *v,
>>>>>> +                                 mmio_info_t *info)
>>>>>> +{
>>>>>> +    register_t r = 0;
>>>>>> +    enum io_state rc;
>>>>>> +
>>>>>> +    rc = handler->ops->read(v, info, &r);
>>>>>> +    if ( rc == IO_HANDLED )
>>>>>> +        info->data = r;
>>>>>
>>>>> Extending my earlier comment: Why could ->read() not put the value directly
>>>>> into info->data? And why ...
>>>>>
>>>>>> +static enum io_state handle_write(const struct mmio_handler *handler,
>>>>>> +                                  struct vcpu *v,
>>>>>> +                                  mmio_info_t *info)
>>>>>> +{
>>>>>> +    return handler->ops->write(v, info, info->data);
>>>>>
>>>>> ... can't write take the value directly from info->data?
>>>>
>>>> I totally agree, it can. Do you think it is better to keep ->data and
>>>> drop an argument 'r' or vice versa?
>>>
>>> How can I know? You know future plans you have.
>>>
>>>>>> +}
>>>>>> +
>>>>>> +/* Assumes mmio regions are not overlapping. */
>>>>>
>>>>> Are you guaranteeing this anywhere?
>>>>
>>>> There is no such guarantee. register_mmio_handler() simply adds the
>>>> handler to the handlers array without performing any checks. I can add
>>>> such a check. The only question is whether it should be enabled only in
>>>> debug builds or in all builds.
>>>
>>> Depends on what other badness can happen when this is violated. My gut
>>> feeling is that checking in debug builds may be enough.
>>
>> Overlapping regions would be a Xen bug rather than something a guest can
>> trigger — register_mmio_handler() is only called from Xen's own emulated
>> device code, so the layout isn't under guest control.
>>
>> The badness is worse than just mis-emulating one device though:
>> cmp_mmio_handler() is used both by bsearch() and by sort(). With
>> overlapping regions it's no longer a consistent ordering, so sort() may
>> produce an arbitrary order and lookups can then fail (or match the wrong
>> handler) even for regions which don't overlap themselves. That would
>> show up as a spurious fault injected into the guest, which is quite hard
>> to debug.
> 
> Didn't you say you'd get rid of the use of sort()?
> 
Yes, I will. I just wrote that for the case if sort() will still present.

~ Oleksii

