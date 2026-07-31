Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1F4C54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 15:24:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379310.1624020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpp5m-0007IM-NP; Fri, 31 Jul 2026 15:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379310.1624020; Fri, 31 Jul 2026 15:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpp5m-0007IF-Kc; Fri, 31 Jul 2026 15:24:10 +0000
Received: by outflank-mailman (input) for mailman id 1379310;
 Fri, 31 Jul 2026 15:24:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wpp5l-0007I6-Fe
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 15:24:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpp5k-006tYX-So
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 17:24:08 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6cbe0d-e002-0a2a0a5209dd-0a2a4505baa0-20
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 17:24:08 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6cbe18-4cb1-0a2a45050019-d155d02ac9d4-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 17:24:08 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-69fec980a30so1480153a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 08:24:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a09c63dca6sm2095354a12.16.2026.07.31.08.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 08:24:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785511448; x=1786116248; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoE74sso1nYI6/YVc3EE73b9CwxkGWOzTucsFbElNEc=;
        b=s5HMibd41P8EDbcbcTOwm2EfLKU+K2/HIR/qOtObd6VsC7xxmHBmr54GccmXK+jQlF
         YFMgavXfm0A6Ub3elbPkHMTqn4pGreAI+v4Buf3yklnOrjf+nX7SBNaQe3o6p0UW/7e2
         vOJF783kFb7s0LZCzdT5ewnzG69pHcNIvD+X/9N/v6FzfN9h0Zj93vn6hPv81oE8QEYh
         HL/IvZahh1fk8Atw414cUtfRN7E7D0O2L0DMopL61LYtPZ/vSu0Tm78KsWaVzDpsZqzk
         SeJwk9jOTStfVO+CeGuEfOBGnBqHOb0mYW/r9zdX5YReI3gOfMTHDR+F1gziW/Fe/ek+
         7wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511448; x=1786116248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoE74sso1nYI6/YVc3EE73b9CwxkGWOzTucsFbElNEc=;
        b=b4P/FFXCNDD+6FGIjvD+Rckm4iKKywlZWlmM60Ad8QpeyUa8A1EFSWf8qEuHp6MK3o
         1/QSBr9Ukvr6DY457kJL1TiO4o7fIdXxRfLjiIyI5o7+u+KX11AoU290zQWiQfVEdJj5
         NuYaSb5P7BhnoOgHbJP9md+FPxZX2Pe6/quNOukpyIhB7Xq6ZghGWzI+KNZvRfN2Pjcj
         47xuPqvQ7ZenhxZ7KJlq20kODKvhoZIJOwXC0I2rMAS8MBdQ8kEfQH5ySBbA4ERv3od2
         7ioTcSiJxA4yK+pcPKEPqUBOZX9axHYibuupQJ7ZGdv93o0Spej+RFa5ktvIKHmfjyaQ
         O5CQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2OKFh8Q3n3w7MWdyGRRDr1nI3DW77E46awjhB28hJjp2u/qLyIai5+MlbrYmPyYTY2BFIdzyTraM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOADXbPVRZrPSetSP8lG3MN5RsgtxkHcxsO/BTdKATsSFLYVHJ
	7FYv4wuWnYYx+mIKguaXePav5JJRLKDgwhdvw1+geEFUe3G/M3lTnPS7
X-Gm-Gg: AR+sD11SfQiVQqPMkaeLl6nulyVoGS5UN3idGHVRFMNEHZC6jEA53uxwkaaAux20LVp
	tDQMdzwgkfyYqFAWl72584NLhQFgxzjoFR1OJsX4fTK0gRLbVNFY2Z7+Abgjdy8JW3hV0Z6/w7n
	UQ/7v5Z7ceSyLnBzKWISzY2tVEtvpEsG2d7WR95Fxq8gksU2EkF9b+BONU2HTiVFiCfb4sEI7NJ
	01+uxrqNhYuD1tCP2W41OFSXSEBfcpFW8eqpWsRLExQVd5U55dMkyOitJqSov8iFwvsIp8g0pKa
	CIMh9T0/ln2YMKKJ4llxw5Ufg/W9e8oko25HObskSqR+duMgCUu1XwQOpAUqGS+M+EPDK7vLDC+
	mxk7CLtvdiCpRLv9bZTuNJeGuoPKDL5a+uKCCyh2kmNNuKnr7tDz3qohWRXzIciiOc5TBEpdRVf
	SaIXiX2J/BccUPlMGrJGTOvOI7f/hrp2jlbSTPR5FdIGMeWOGno96RakpavN8DgWn1JlrJ/Y1Qf
	O4aaAjZ7Gusx5UV9vWO88c3FHsxVENALSrV2PPPXxU=
X-Received: by 2002:a05:6402:1f4a:b0:697:ee9b:e9bc with SMTP id 4fb4d7f45d1cf-6a0a7cde2e4mr1232a12.26.1785511448201;
        Fri, 31 Jul 2026 08:24:08 -0700 (PDT)
Message-ID: <636a6183-8c66-41b2-b820-6a02098fd33d@gmail.com>
Date: Fri, 31 Jul 2026 17:24:06 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2ef6b295-862b-40be-a7d2-c94a6378126b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785511448-F44A42A1-9C8B55C1/10/73395122804
X-purgate-type: spam
X-purgate-size: 4888



On 7/30/26 6:09 PM, Jan Beulich wrote:
> On 30.07.2026 18:03, Oleksii Kurochko wrote:
>> On 7/28/26 2:23 PM, Jan Beulich wrote:
>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/mmio.c
>>>> @@ -0,0 +1,145 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +/*
>>>> + * Copyright (C) Vates
>>>> + */
>>>> +
>>>> +#include <xen/bsearch.h>
>>>> +#include <xen/lib.h>
>>>> +#include <xen/rwlock.h>
>>>> +#include <xen/sched.h>
>>>> +#include <xen/sort.h>
>>>> +#include <xen/xvmalloc.h>
>>>> +
>>>> +#include <asm/current.h>
>>>> +#include <asm/mmio.h>
>>>> +
>>>> +static enum io_state handle_read(const struct mmio_handler *handler,
>>>> +                                 struct vcpu *v,
>>>> +                                 mmio_info_t *info)
>>>> +{
>>>> +    register_t r = 0;
>>>> +    enum io_state rc;
>>>> +
>>>> +    rc = handler->ops->read(v, info, &r);
>>>> +    if ( rc == IO_HANDLED )
>>>> +        info->data = r;
>>>
>>> Extending my earlier comment: Why could ->read() not put the value directly
>>> into info->data? And why ...
>>>
>>>> +static enum io_state handle_write(const struct mmio_handler *handler,
>>>> +                                  struct vcpu *v,
>>>> +                                  mmio_info_t *info)
>>>> +{
>>>> +    return handler->ops->write(v, info, info->data);
>>>
>>> ... can't write take the value directly from info->data?
>>
>> I totally agree, it can. Do you think it is better to keep ->data and
>> drop an argument 'r' or vice versa?
> 
> How can I know? You know future plans you have.
> 
>>>> +}
>>>> +
>>>> +/* Assumes mmio regions are not overlapping. */
>>>
>>> Are you guaranteeing this anywhere?
>>
>> There is no such guarantee. register_mmio_handler() simply adds the
>> handler to the handlers array without performing any checks. I can add
>> such a check. The only question is whether it should be enabled only in
>> debug builds or in all builds.
> 
> Depends on what other badness can happen when this is violated. My gut
> feeling is that checking in debug builds may be enough.

Overlapping regions would be a Xen bug rather than something a guest can 
trigger — register_mmio_handler() is only called from Xen's own emulated 
device code, so the layout isn't under guest control.

The badness is worse than just mis-emulating one device though: 
cmp_mmio_handler() is used both by bsearch() and by sort(). With 
overlapping regions it's no longer a consistent ordering, so sort() may 
produce an arbitrary order and lookups can then fail (or match the wrong 
handler) even for regions which don't overlap themselves. That would 
show up as a spurious fault injected into the guest, which is quite hard 
to debug.

So I agree a check is worthwhile; I'll add one under CONFIG_DEBUG in 
register_mmio_handler().

> 
>>>> +/*
>>>> + * Return a copy of the matching handler rather than a pointer into
>>>> + * vmmio->handlers: a concurrent register_mmio_handler() re-sorts the
>>>> + * array, so an escaped pointer could refer to a different (or torn)
>>>> + * entry once the lock is dropped.  The copy stays valid as the ops
>>>> + * structures are never freed.
>>>> + */
>>>> +static bool find_mmio_handler(struct domain *d, paddr_t gpa,
>>>> +                              struct mmio_handler *out)
>>>> +{
>>>> +    struct vmmio *vmmio = &d->arch.vmmio;
>>>> +    struct mmio_handler key = { .addr = gpa };
>>>> +    const struct mmio_handler *handler;
>>>> +
>>>> +    read_lock(&vmmio->lock);
>>>> +    handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
>>>> +                      sizeof(*handler), cmp_mmio_handler);
>>>
>>> So beyond the assumption stated further up you also assume the array to
>>> be sorted. Which you ...
>>>
>>>> +void register_mmio_handler(struct domain *d,
>>>> +                           const struct mmio_handler_ops *ops,
>>>> +                           paddr_t addr, paddr_t size)
>>>> +{
>>>> +    struct vmmio *vmmio = &d->arch.vmmio;
>>>> +    struct mmio_handler *handler;
>>>> +
>>>> +    write_lock(&vmmio->lock);
>>>> +
>>>> +    BUG_ON(vmmio->num_entries >= vmmio->max_num_entries);
>>>
>>> (Do we really need to crash in such a case? Can't we just fail domain
>>> creation?)
>>
>> Generally, no. However, the approach used by Arm's dom0less solution is
>> to crash as soon as any issue occurs instead of trying to continue
>> running other domains, so I follow the same approach for RISC-V.
>>
>> Even if I return an error here, the common dom0less code will panic anyway.
> 
> That's the policy there, but you're writing code here also for the case where
> Dom0 creates domains.

Missed that. In this case I agree that it would be nice to return something.

Thanks.

~ Oleksii

