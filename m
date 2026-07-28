Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6392C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:23:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1373779.1620593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogq2-00048E-UG; Tue, 28 Jul 2026 12:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1373779.1620593; Tue, 28 Jul 2026 12:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogq2-000487-R4; Tue, 28 Jul 2026 12:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1373779;
 Tue, 28 Jul 2026 12:23:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wogq2-00047p-Ax
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:23:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogq1-00Efa3-O6
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:23:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a689f2b-e002-0a2a0a5209dd-0a2a4507dee8-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:23:13 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a689f31-b4ea-0a2a45070019-d155802adc96-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:23:13 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4954afac04bso43512245e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 05:23:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45b1c76sm73221075e9.6.2026.07.28.05.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 05:23:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785241393; x=1785846193; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ1kRkojcYljX8eJWUBLhf43j8Cm0m2iGn5Luzxu95Y=;
        b=A/ixlPKLG/hTTfMKfCWKGk4EElgr+7ej2hAFDB+T3QrEUb9jd7kTgLDtqVa346KS8I
         he1rHqMGKfo+T93PO/mhWVrAV5CJjb2kKQ9chK/Y6Z3WetEWtpUuxOhWa55VxwRYrmz5
         pH/XIzIiorsxe9wxCIKLm2eeG6x804jTn+TnwHhOgjbCLVlmTOVnGvHcu/XCkP7x1d7+
         ePfHXoJDkV60VhVTbKtkpWr4fw7EqhZfhRLIYRCwpmSgBIsFxqXP+ENf3/mrCm6daRtw
         HSO7Y1VKUb0gG99uXbg4D3RC1spbQWHFUmsJR4D+7DHkOYUA2IQK1fGuwCtdPEnjw4DS
         wtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241393; x=1785846193;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJ1kRkojcYljX8eJWUBLhf43j8Cm0m2iGn5Luzxu95Y=;
        b=XohQBVvYLsiqXj8N354q83jP0j/Wptm+qaidL1GRLT0d4qQXGcnBJz8+Lh0sBdB+jv
         GEQuki6C7NG4WGv5pcClNp9Pjz9ZAwFzfu1+b5Fk1ueZpuaY8j0bO1Flzzk/SMuCEXgC
         3oTwmpJWQ6OmJjErMLXX0SYEN8kVELoMe727myj1EKer221SwV9nvFS0N0rpeWh/DJHI
         wXKAMWt6xaUKckRDHuwuhAUm+dcM1Ki1Jl0/UWSDlkeqpUyLQhjT/DGHIHqyfcj8q3zO
         nfZjdrReSZXWkivUyqoz68ff1y2WnnDeKcCZQgmB0J35fuguWT4lfFzZ55j2p+NBjWpb
         VuIg==
X-Forwarded-Encrypted: i=1; AHgh+RoEav6Hu4h1qlGNxUZW+xM4h6aLjM/JOgDxhBGgFTVoT65ih0dXQz0Be1YlVimSjnqH2HZQMUyxouE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLRj+i7a7mdOAKnAIwQO8I3uzKa9Q58rQtz10HubKXaD5ZCduu
	aRWfEnqr7aFNw1R5dIaaqVVxzS24D0HO9k7pdNpvp2r1CAqFeo1Rq/jSzj2v1TJMEQ==
X-Gm-Gg: AR+sD11BkE1IQd/wkLOdU7sdrl2qfJW4m8BqiMuo/5Juv2Eq1jxcsoUHL9hs5dKWxtO
	pNsVHqFk5ooNL+4+IoLI7I/G/kkeLQBhGY5SCK2wy8jnA0wb/f9lXY/qOJ2YR6TI97KzeVOwIcP
	+oRPrL5IP3ZkzSKQW87hnBJXFHQNWtRJLwvflRaLRAfMamsi1Dzqt829gfLgvsvSDMVXCeoNv2X
	DkhyGBsLI7C7V34RgRNsETwSjDpS+JD5uMCk/j0A410w3qu8witYObwkilPX8DgCKrl3dV44rWz
	zGVML0gsoKyDHMiO3GgcZrPbDXW82PED/l8lfaXFK/Q99dlXkp4uoGxJez17dNESeRJyYfnLtT2
	RLYZ9fR64ROepsFAPowaRdmvo04r5o97LzXbFguR3xjaJ/9qsVp+rIRtt5rQzMU4Bf3oGqj96lc
	oxvOXstfBMYh9AujA8g3eR+f3I/KAsypf9Oh58oI194/GTJOIzHWf6QTqsi2pjrd4Dm+vg7KKv6
	4sq
X-Received: by 2002:a05:600c:630d:b0:495:4572:21af with SMTP id 5b1f17b1804b1-496c65458e1mr27721695e9.9.1785241392782;
        Tue, 28 Jul 2026 05:23:12 -0700 (PDT)
Message-ID: <704870c1-18ec-4c7b-873c-e07e77ae0d39@suse.com>
Date: Tue, 28 Jul 2026 14:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/17] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <c12b69710d7b79bfc0c110f3fa043d871d8b8394.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785241393-A4CCFAE4-C200936B/10/73395122804
X-purgate-type: spam
X-purgate-size: 9545

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> RISC-V guests can expose several virtual interrupt controllers at
> distinct GPA ranges: vPLIC (hasn't been introduced yet) for legacy machines,
> vAPLIC and vIMSIC for AIA-compliant ones (is being introduced in the follow
> up patches). Routing MMIO faults via a per-device is_access() check in the
> trap handler would couple it to every device it must serve, requiring a
> new conditional branch in the fault path each time a new emulated device is
> added.
> 
> Introduce a per-domain MMIO handler registration table, modeled
> after the equivalent ARM framework, so that virtual devices
> self-register their GPA ranges and read/write callbacks at domain
> creation time. The MMIO fault path delegates to a single
> try_handle_mmio() entry point and remains agnostic of which device
> owns a particular address.
> 
> Subsequent patches wire this into arch_domain_create() and the MMIO fault
> path in traps.c.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Note that find_mmio_handler() and try_handle_mmio() is handling found
> handler differently for now in comparison to Arm. But this behaviour will
> be aligned at the end. Look at discussion:
>   https://lore.kernel.org/xen-devel/cd78972e-88d5-471d-a201-5f9cd1392c73@gmail.com/T/#t
> ---
> ---
>  xen/arch/riscv/Makefile             |   1 +
>  xen/arch/riscv/domain.c             |   4 +
>  xen/arch/riscv/include/asm/domain.h |   3 +
>  xen/arch/riscv/include/asm/mmio.h   |  63 ++++++++++++
>  xen/arch/riscv/mmio.c               | 145 ++++++++++++++++++++++++++++
>  5 files changed, 216 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/mmio.h
>  create mode 100644 xen/arch/riscv/mmio.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 046f73f4d87c..c452ebc3cf61 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -14,6 +14,7 @@ obj-y += intc.o
>  obj-y += irq.o
>  obj-y += kernel.init.o
>  obj-y += mm.o
> +obj-y += mmio.o
>  obj-y += p2m.o
>  obj-y += paging.o
>  obj-y += pt.o
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index 4db9c28662c7..1e6f0ef66c2f 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -12,6 +12,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/intc.h>
> +#include <asm/mmio.h>
>  #include <asm/riscv_encoding.h>
>  #include <asm/vtimer.h>
>  
> @@ -308,6 +309,9 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = p2m_init(d, config)) != 0)
>          goto fail;
>  
> +    if ( (rc = domain_io_init(d, MAX_IO_HANDLER)) != 0 )
> +        goto fail;

Why does MAX_IO_HANDLER need passing into the function? Isn't that a global
boundary?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/mmio.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef RISCV_MMIO_H
> +#define RISCV_MMIO_H
> +
> +#include <xen/lib.h>
> +#include <xen/rwlock.h>
> +
> +#define MAX_IO_HANDLER  16
> +
> +typedef struct {
> +    paddr_t gpa;
> +    unsigned int len;  /* access width in bytes (1, 2, 4, 8) */
> +    bool is_write;
> +    register_t data;   /* store: value to write; load: value read (set by handler) */
> +} mmio_info_t;
> +
> +enum io_state
> +{
> +    IO_ABORT,       /* The IO was handled and led to an abort. */
> +    IO_HANDLED,     /* The IO was successfully handled. */
> +    IO_UNHANDLED,   /* No handler found for the IO. */
> +};
> +
> +typedef enum io_state (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
> +                                     register_t *r);
> +typedef enum io_state (*mmio_write_t)(struct vcpu *v, mmio_info_t *info,
> +                                      register_t r);

Can't info be pointer-to-const in the write case? In both cases, why is there
both "r" passed into the function as well as the info->data field, supposedly
(as per the comment) serving the same purpose?

Furthermore I think it helps if ...

> +struct mmio_handler_ops {
> +    mmio_read_t read;
> +    mmio_write_t write;

... pointer-ness is easily seen at use sites. I.e.

typedef enum io_state mmio_read_t(struct vcpu *v, mmio_info_t *info,
                                  register_t *r);
typedef enum io_state mmio_write_t(struct vcpu *v, const mmio_info_t *info,
                                   register_t r);

struct mmio_handler_ops {
    mmio_read_t *read;
    mmio_write_t *write;
};

> +};
> +
> +struct mmio_handler {
> +    paddr_t addr;
> +    paddr_t size;
> +    const struct mmio_handler_ops *ops;
> +};
> +
> +struct vmmio {
> +    unsigned int num_entries;
> +    unsigned int max_num_entries;
> +    rwlock_t lock;
> +    struct mmio_handler *handlers;

There shouldn't be any writes through this pointer, should there? In which
case it (once again) wants to be pointer-to-const.

> --- /dev/null
> +++ b/xen/arch/riscv/mmio.c
> @@ -0,0 +1,145 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) Vates
> + */
> +
> +#include <xen/bsearch.h>
> +#include <xen/lib.h>
> +#include <xen/rwlock.h>
> +#include <xen/sched.h>
> +#include <xen/sort.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <asm/current.h>
> +#include <asm/mmio.h>
> +
> +static enum io_state handle_read(const struct mmio_handler *handler,
> +                                 struct vcpu *v,
> +                                 mmio_info_t *info)
> +{
> +    register_t r = 0;
> +    enum io_state rc;
> +
> +    rc = handler->ops->read(v, info, &r);
> +    if ( rc == IO_HANDLED )
> +        info->data = r;

Extending my earlier comment: Why could ->read() not put the value directly
into info->data? And why ...

> +static enum io_state handle_write(const struct mmio_handler *handler,
> +                                  struct vcpu *v,
> +                                  mmio_info_t *info)
> +{
> +    return handler->ops->write(v, info, info->data);

... can't write take the value directly from info->data?

> +}
> +
> +/* Assumes mmio regions are not overlapping. */

Are you guaranteeing this anywhere?

> +static int cmp_mmio_handler(const void *key, const void *elem)
> +{
> +    const struct mmio_handler *handler0 = key;
> +    const struct mmio_handler *handler1 = elem;
> +
> +    if ( handler0->addr < handler1->addr )
> +        return -1;
> +
> +    if ( handler0->addr >= (handler1->addr + handler1->size) )
> +        return 1;
> +
> +    return 0;
> +}
> +
> +static void swap_mmio_handler(void *a, void *b)
> +{
> +    struct mmio_handler *t1 = a, *t2 = b;
> +
> +    SWAP(*t1, *t2);
> +}
> +
> +/*
> + * Return a copy of the matching handler rather than a pointer into
> + * vmmio->handlers: a concurrent register_mmio_handler() re-sorts the
> + * array, so an escaped pointer could refer to a different (or torn)
> + * entry once the lock is dropped.  The copy stays valid as the ops
> + * structures are never freed.
> + */
> +static bool find_mmio_handler(struct domain *d, paddr_t gpa,
> +                              struct mmio_handler *out)
> +{
> +    struct vmmio *vmmio = &d->arch.vmmio;
> +    struct mmio_handler key = { .addr = gpa };
> +    const struct mmio_handler *handler;
> +
> +    read_lock(&vmmio->lock);
> +    handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
> +                      sizeof(*handler), cmp_mmio_handler);

So beyond the assumption stated further up you also assume the array to
be sorted. Which you ...

> +void register_mmio_handler(struct domain *d,
> +                           const struct mmio_handler_ops *ops,
> +                           paddr_t addr, paddr_t size)
> +{
> +    struct vmmio *vmmio = &d->arch.vmmio;
> +    struct mmio_handler *handler;
> +
> +    write_lock(&vmmio->lock);
> +
> +    BUG_ON(vmmio->num_entries >= vmmio->max_num_entries);

(Do we really need to crash in such a case? Can't we just fail domain
creation?)

> +    handler = &vmmio->handlers[vmmio->num_entries];
> +    handler->ops = ops;
> +    handler->addr = addr;
> +    handler->size = size;
> +    vmmio->num_entries++;
> +
> +    /* Sort mmio handlers in ascending order based on base address */
> +    sort(vmmio->handlers, vmmio->num_entries, sizeof(struct mmio_handler),
> +         cmp_mmio_handler, swap_mmio_handler);

... arrange for here, yet in a pretty inefficient way: Inserting in an
already sorted list can be had without recurring calls to sort().

> +int domain_io_init(struct domain *d, unsigned int max_count)
> +{
> +    rwlock_init(&d->arch.vmmio.lock);
> +    d->arch.vmmio.num_entries = 0;
> +    d->arch.vmmio.max_num_entries = max_count;
> +    d->arch.vmmio.handlers = xvzalloc_array(struct mmio_handler, max_count);

If already an allocation is needed in all cases, why not allocate struct
vmmio, defined like this:

struct vmmio {
    unsigned int num_entries;
    unsigned int max_num_entries;
    rwlock_t lock;
    struct mmio_handler handlers[];
};

and then using xvzalloc_flex_struct(). Or yet simpler if (as mentioned
elsewhere) max_count doesn't need passing into here:

struct vmmio {
    unsigned int num_entries;
    unsigned int max_num_entries;
    rwlock_t lock;
    struct mmio_handler handlers[MAX_IO_HANDLER];
};

Jan

