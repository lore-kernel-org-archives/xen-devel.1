Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418BBC55164
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 16:04:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378109.1623715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTEZ-0004Fq-Qc; Thu, 30 Jul 2026 16:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378109.1623715; Thu, 30 Jul 2026 16:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTEZ-0004Fj-Ns; Thu, 30 Jul 2026 16:03:47 +0000
Received: by outflank-mailman (input) for mailman id 1378109;
 Thu, 30 Jul 2026 16:03:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wpTEY-0004Fd-GZ
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 16:03:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpTEX-00EBhg-Pq
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:03:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6b75d8-bab6-0a2a0a5309dd-0a2a450a9c66-22
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:03:45 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6b75e1-f2d2-0a2a450a0019-d155dd2fb4c0-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:03:45 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47f81a3ccf9so1853497f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:03:45 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc892cc54sm7310048f8f.21.2026.07.30.09.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 09:03:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427425; x=1786032225; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZxbyIvXCIMVtZZC6eH1IiOEAXn+2m11rf7QCUSnBRLs=;
        b=f/DGY58A2s0OLVqq3vVJJVjxBJORumi5iY/8jyEzXJAuUFNhp5QyodabA+/bcnJwHx
         cp5YJZgpyqw0KUZYQ62o6/lrX9wJkfrbfVdYqMSBiC0Y8zyZzqYsBgD0x1/CgtbPEyG7
         fMZ/USxqWodbTN75bopLNKtwChwVuhEjPyMajdYwbkQkcPa2uVKlTdx82lzDm5D5pDic
         6zzdPcXBQOFdQ9w7QtgyW79WhgrJVjXn0GKMFTqifXo91cvRicEBtxxu7wlPj+D+DcYG
         OrHOQeFiT3jSHjW6hCH4OPa3WGug191ck1//JsfI4w2/sVJGSwcEPQMGztgj0Bhtg8yb
         0XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427425; x=1786032225;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxbyIvXCIMVtZZC6eH1IiOEAXn+2m11rf7QCUSnBRLs=;
        b=d1WnKwhEymqbDlLCt+CJNxaGOq2axSVrghmbtjmyeO4oMEpEbqEds4aVCxEzN+uWJ0
         lx0SnRa1auWtx3phGRummdTXIwmRjaQwP8xlJ0qJkNk4BCcB8PNuytuCL8hFYWNwD2SO
         uY+BJpeYAFZ7dh7GgeGrwXzRW1YmMu/L/fZSafWowVu72rT+8H1DhdOAi37oeU9YDpDo
         ZrtInacU5IWMx5ZS+rgRi8WNcLqNx8nJjH41SrjYFEmK+k6DSndTCCRIzmExixQNucYz
         Qfn2lNCnPQ0D8Yw9aFJbQSfYRQkVdA4Lcfz6oJN09dFwlBIITxLV2gnAkz21DFRY3OAA
         63AA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6NvVg/cmucbdHAOZuHfmRIbZKFGbuFX56QAgm1NvaN93mX7MP/p3iMkhwJnxMmtnf3FbLqwC6DW4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHy87UJiIVsvsBNnpapLwz75n5UfRZD6G5LvUrhd9R0nUeY1J2
	8VdqPxUnfXacEu6nO8tnqz0N2+zkInRTkRTFHJ1GDqC7XHKFDxAqXNmC
X-Gm-Gg: AR+sD11nnRpAvTZdezYyCeWl//Hn7t05ThGFEuIZC1SqhaR3Qi6LBbYdHmQ1sxEq2bV
	PUs+BwpR9khzYRCGOt3uOxBxN4YRkyTSOkL4fkJz+WNUvUz1XurMDh7Dco7Trir1sT/xEZFN/Lv
	qYZWHX6vq8hvtYvsTFKPYsEHHUuqhq3tNYkD/4UiK1cblKoogGWaKCX/ONpvE3YZxeRKKIv+9gO
	Cfw9qtl9J789OTX808Pz6Xm/65i1nD50U5v6SOgjzZhUAhRD/49tNIxHjjhSRAqeGzz+XhjRXTN
	omz9JtDOpvFxa31Vc5fQ70ekJW02/xiVQiFxgo8ibHXwwws31qLcujdU7KZTmL0tabC0kkv2nxr
	z3ww23LgJx9MSrht7PXWs9V/kbUE+VLbwUTEFl6+AZIotUkvx6+L8QJQdVLHZ77oYNnU/OSZaaE
	YvhHudVBZh3yKaWqE+8LPUxmbLw5W06NugtukrUV9vd56+kpqg1Wgk/YmZl6HP8PUskeSpNlvba
	uvDken5gYBZepB1zdhxKPq9GGIQct2e/ifJTlBfVSs=
X-Received: by 2002:a05:6000:290a:b0:47f:9283:1fbe with SMTP id ffacd0b85a97d-47fc806c7bfmr5135000f8f.0.1785427424747;
        Thu, 30 Jul 2026 09:03:44 -0700 (PDT)
Message-ID: <d5867843-802d-493f-a535-1f40d9337b63@gmail.com>
Date: Thu, 30 Jul 2026 18:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
In-Reply-To: <704870c1-18ec-4c7b-873c-e07e77ae0d39@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1785427425-4B4D7CFC-D1B76AB4/10/73395122804
X-purgate-type: spam
X-purgate-size: 11643



On 7/28/26 2:23 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> RISC-V guests can expose several virtual interrupt controllers at
>> distinct GPA ranges: vPLIC (hasn't been introduced yet) for legacy machines,
>> vAPLIC and vIMSIC for AIA-compliant ones (is being introduced in the follow
>> up patches). Routing MMIO faults via a per-device is_access() check in the
>> trap handler would couple it to every device it must serve, requiring a
>> new conditional branch in the fault path each time a new emulated device is
>> added.
>>
>> Introduce a per-domain MMIO handler registration table, modeled
>> after the equivalent ARM framework, so that virtual devices
>> self-register their GPA ranges and read/write callbacks at domain
>> creation time. The MMIO fault path delegates to a single
>> try_handle_mmio() entry point and remains agnostic of which device
>> owns a particular address.
>>
>> Subsequent patches wire this into arch_domain_create() and the MMIO fault
>> path in traps.c.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>> Note that find_mmio_handler() and try_handle_mmio() is handling found
>> handler differently for now in comparison to Arm. But this behaviour will
>> be aligned at the end. Look at discussion:
>>    https://lore.kernel.org/xen-devel/cd78972e-88d5-471d-a201-5f9cd1392c73@gmail.com/T/#t
>> ---
>> ---
>>   xen/arch/riscv/Makefile             |   1 +
>>   xen/arch/riscv/domain.c             |   4 +
>>   xen/arch/riscv/include/asm/domain.h |   3 +
>>   xen/arch/riscv/include/asm/mmio.h   |  63 ++++++++++++
>>   xen/arch/riscv/mmio.c               | 145 ++++++++++++++++++++++++++++
>>   5 files changed, 216 insertions(+)
>>   create mode 100644 xen/arch/riscv/include/asm/mmio.h
>>   create mode 100644 xen/arch/riscv/mmio.c
>>
>> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
>> index 046f73f4d87c..c452ebc3cf61 100644
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -14,6 +14,7 @@ obj-y += intc.o
>>   obj-y += irq.o
>>   obj-y += kernel.init.o
>>   obj-y += mm.o
>> +obj-y += mmio.o
>>   obj-y += p2m.o
>>   obj-y += paging.o
>>   obj-y += pt.o
>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>> index 4db9c28662c7..1e6f0ef66c2f 100644
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -12,6 +12,7 @@
>>   #include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>>   #include <asm/intc.h>
>> +#include <asm/mmio.h>
>>   #include <asm/riscv_encoding.h>
>>   #include <asm/vtimer.h>
>>   
>> @@ -308,6 +309,9 @@ int arch_domain_create(struct domain *d,
>>       if ( (rc = p2m_init(d, config)) != 0)
>>           goto fail;
>>   
>> +    if ( (rc = domain_io_init(d, MAX_IO_HANDLER)) != 0 )
>> +        goto fail;
> 
> Why does MAX_IO_HANDLER need passing into the function? Isn't that a global
> boundary?

Good question. Considering that all domains are initialized with 
MAX_IO_HANDLER I think we could drop an argument for domain_io_init() 
and just use MAX_IO_HANDLER inside it for init. of handlers array.

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/mmio.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef RISCV_MMIO_H
>> +#define RISCV_MMIO_H
>> +
>> +#include <xen/lib.h>
>> +#include <xen/rwlock.h>
>> +
>> +#define MAX_IO_HANDLER  16
>> +
>> +typedef struct {
>> +    paddr_t gpa;
>> +    unsigned int len;  /* access width in bytes (1, 2, 4, 8) */
>> +    bool is_write;
>> +    register_t data;   /* store: value to write; load: value read (set by handler) */
>> +} mmio_info_t;
>> +
>> +enum io_state
>> +{
>> +    IO_ABORT,       /* The IO was handled and led to an abort. */
>> +    IO_HANDLED,     /* The IO was successfully handled. */
>> +    IO_UNHANDLED,   /* No handler found for the IO. */
>> +};
>> +
>> +typedef enum io_state (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
>> +                                     register_t *r);
>> +typedef enum io_state (*mmio_write_t)(struct vcpu *v, mmio_info_t *info,
>> +                                      register_t r);
> 
> Can't info be pointer-to-const in the write case?

With the current implementaion it could be done for both mmio_read_t and 
mmio_write_t as value is return through r argument.

In both cases, why is there
> both "r" passed into the function as well as the info->data field, supposedly
> (as per the comment) serving the same purpose?

Agree, we don't need both "r" and info->data as they are serving the 
same purpose.

But I don't know which one option is actually better to drop "r" 
argument or drop ->data member in mmio_info_t.


> 
> Furthermore I think it helps if ...
> 
>> +struct mmio_handler_ops {
>> +    mmio_read_t read;
>> +    mmio_write_t write;
> 
> ... pointer-ness is easily seen at use sites. I.e.
> 
> typedef enum io_state mmio_read_t(struct vcpu *v, mmio_info_t *info,
>                                    register_t *r);
> typedef enum io_state mmio_write_t(struct vcpu *v, const mmio_info_t *info,
>                                     register_t r);
> 
> struct mmio_handler_ops {
>      mmio_read_t *read;
>      mmio_write_t *write;
> };
> 

I will apply that.

>> +};
>> +
>> +struct mmio_handler {
>> +    paddr_t addr;
>> +    paddr_t size;
>> +    const struct mmio_handler_ops *ops;
>> +};
>> +
>> +struct vmmio {
>> +    unsigned int num_entries;
>> +    unsigned int max_num_entries;
>> +    rwlock_t lock;
>> +    struct mmio_handler *handlers;
> 
> There shouldn't be any writes through this pointer, should there? In which
> case it (once again) wants to be pointer-to-const.

Agree, it should be const.

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/mmio.c
>> @@ -0,0 +1,145 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) Vates
>> + */
>> +
>> +#include <xen/bsearch.h>
>> +#include <xen/lib.h>
>> +#include <xen/rwlock.h>
>> +#include <xen/sched.h>
>> +#include <xen/sort.h>
>> +#include <xen/xvmalloc.h>
>> +
>> +#include <asm/current.h>
>> +#include <asm/mmio.h>
>> +
>> +static enum io_state handle_read(const struct mmio_handler *handler,
>> +                                 struct vcpu *v,
>> +                                 mmio_info_t *info)
>> +{
>> +    register_t r = 0;
>> +    enum io_state rc;
>> +
>> +    rc = handler->ops->read(v, info, &r);
>> +    if ( rc == IO_HANDLED )
>> +        info->data = r;
> 
> Extending my earlier comment: Why could ->read() not put the value directly
> into info->data? And why ...
> 
>> +static enum io_state handle_write(const struct mmio_handler *handler,
>> +                                  struct vcpu *v,
>> +                                  mmio_info_t *info)
>> +{
>> +    return handler->ops->write(v, info, info->data);
> 
> ... can't write take the value directly from info->data?

I totally agree, it can. Do you think it is better to keep ->data and 
drop an argument 'r' or vice versa?

> 
>> +}
>> +
>> +/* Assumes mmio regions are not overlapping. */
> 
> Are you guaranteeing this anywhere?

There is no such guarantee. register_mmio_handler() simply adds the 
handler to the handlers array without performing any checks. I can add 
such a check. The only question is whether it should be enabled only in 
debug builds or in all builds.

I assume this is a rare case, and overlapping regions would indicate 
that something is wrong with the guest's memory layout configuration so 
it seems like it would be enough to add only for debug builds.

> 
>> +static int cmp_mmio_handler(const void *key, const void *elem)
>> +{
>> +    const struct mmio_handler *handler0 = key;
>> +    const struct mmio_handler *handler1 = elem;
>> +
>> +    if ( handler0->addr < handler1->addr )
>> +        return -1;
>> +
>> +    if ( handler0->addr >= (handler1->addr + handler1->size) )
>> +        return 1;
>> +
>> +    return 0;
>> +}
>> +
>> +static void swap_mmio_handler(void *a, void *b)
>> +{
>> +    struct mmio_handler *t1 = a, *t2 = b;
>> +
>> +    SWAP(*t1, *t2);
>> +}
>> +
>> +/*
>> + * Return a copy of the matching handler rather than a pointer into
>> + * vmmio->handlers: a concurrent register_mmio_handler() re-sorts the
>> + * array, so an escaped pointer could refer to a different (or torn)
>> + * entry once the lock is dropped.  The copy stays valid as the ops
>> + * structures are never freed.
>> + */
>> +static bool find_mmio_handler(struct domain *d, paddr_t gpa,
>> +                              struct mmio_handler *out)
>> +{
>> +    struct vmmio *vmmio = &d->arch.vmmio;
>> +    struct mmio_handler key = { .addr = gpa };
>> +    const struct mmio_handler *handler;
>> +
>> +    read_lock(&vmmio->lock);
>> +    handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
>> +                      sizeof(*handler), cmp_mmio_handler);
> 
> So beyond the assumption stated further up you also assume the array to
> be sorted. Which you ...
> 
>> +void register_mmio_handler(struct domain *d,
>> +                           const struct mmio_handler_ops *ops,
>> +                           paddr_t addr, paddr_t size)
>> +{
>> +    struct vmmio *vmmio = &d->arch.vmmio;
>> +    struct mmio_handler *handler;
>> +
>> +    write_lock(&vmmio->lock);
>> +
>> +    BUG_ON(vmmio->num_entries >= vmmio->max_num_entries);
> 
> (Do we really need to crash in such a case? Can't we just fail domain
> creation?)

Generally, no. However, the approach used by Arm's dom0less solution is 
to crash as soon as any issue occurs instead of trying to continue 
running other domains, so I follow the same approach for RISC-V.

Even if I return an error here, the common dom0less code will panic anyway.

> 
>> +    handler = &vmmio->handlers[vmmio->num_entries];
>> +    handler->ops = ops;
>> +    handler->addr = addr;
>> +    handler->size = size;
>> +    vmmio->num_entries++;
>> +
>> +    /* Sort mmio handlers in ascending order based on base address */
>> +    sort(vmmio->handlers, vmmio->num_entries, sizeof(struct mmio_handler),
>> +         cmp_mmio_handler, swap_mmio_handler);
> 
> ... arrange for here, yet in a pretty inefficient way: Inserting in an
> already sorted list can be had without recurring calls to sort().

Good point. I will rework that.
> 
>> +int domain_io_init(struct domain *d, unsigned int max_count)
>> +{
>> +    rwlock_init(&d->arch.vmmio.lock);
>> +    d->arch.vmmio.num_entries = 0;
>> +    d->arch.vmmio.max_num_entries = max_count;
>> +    d->arch.vmmio.handlers = xvzalloc_array(struct mmio_handler, max_count);
> 
> If already an allocation is needed in all cases, why not allocate struct
> vmmio, defined like this:
> 
> struct vmmio {
>      unsigned int num_entries;
>      unsigned int max_num_entries;
>      rwlock_t lock;
>      struct mmio_handler handlers[];
> };
> 
> and then using xvzalloc_flex_struct(). Or yet simpler if (as mentioned
> elsewhere) max_count doesn't need passing into here:
> 
> struct vmmio {
>      unsigned int num_entries;
>      unsigned int max_num_entries;
>      rwlock_t lock;
>      struct mmio_handler handlers[MAX_IO_HANDLER];
> };
> 
Agree, both option are good to me. Considering that we are going to use 
MAX_IO_HANDLER then second option is really better for now.

Thanks!

~ Oleksii

