Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6ECCA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 15:28:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446435.1662553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGHwq-0004GX-5O; Mon, 12 Oct 2026 15:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446435.1662553; Mon, 12 Oct 2026 15:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGHwq-0004GQ-2P; Mon, 12 Oct 2026 15:28:20 +0000
Received: by outflank-mailman (input) for mailman id 1446435;
 Mon, 12 Oct 2026 15:28:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGHwp-0004GH-Ii
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:28:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGHwo-005zik-Vj
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 17:28:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accfc91-8faa-0a2a0a5109dd-0a2a450b9646-6
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 17:28:18 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accfc92-b7e8-0a2a450b0019-d1558034b02c-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 17:28:18 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so12581655e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 08:28:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea0f1csm426231665e9.9.2026.10.12.08.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 08:28:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1791818898; x=1792423698; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9CZ+QPoXRZjlLdO5+Gb+JA+BVEBctyw3tli7YGGjms=;
        b=ea6jpWOrMan5btjb07+6Bpoha361TT6kKx/3zzK8EWjzskHqxZlZij6ZBjPfFtOw2y
         YwvErRBAFlWmAXQf5o1+9qEV/txSP3gN1ewaGKBV3lT4PcaHxiLIeVaPUYliAm+qje28
         V+1KWipuPfj3VefFW8eu2Icsn6vv23z8KMpAD3enSDOPV4li/XBw3LZ9NZDm+aozX2rH
         ERxfaifKuxCXbPz5XZ4XSiJbKsU3tu1oIhCnAA2KyDOctdVghjoIX3cP/VT3C6ApvmLX
         v0mAyEMshnPgPGRYNh5dH4sTlEnJ0Eo+MtbTIRRRGJrAr6Gc1mf4bg7CI28EUtbYuabf
         l2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818898; x=1792423698;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9CZ+QPoXRZjlLdO5+Gb+JA+BVEBctyw3tli7YGGjms=;
        b=rdvNj9u+zVYfdF9qITTrl+m3gounNWvEdjbxEhqKJWp57J+JQaenZKopyxz+c5G8eJ
         8gTkr42usafXf0icTVqozBezSR8rHv3hNzVDaRgT+uAhsrqo7LgZCJnMgqoOQ4dR8fjO
         dtMdc6z4zJ1iitE3TkFrQPO62J2mvHL/PN5idOw8I3P6qWUnq+PedNDFLxA1Jx5NhxQ7
         rFY45vhViJKKWirolJ/jtCHNqD7oCV0W8+IzEX5DuqtYHGAjEojssIdXkIZ+cTU+nLIf
         /FR0NLRm9kFvgP8N8zuE35hcgt4zsxUOpU+gd++/KjtBGC8UbdCwTXpG8TEJbXQDgma3
         uf0A==
X-Forwarded-Encrypted: i=1; AKwUvBwyDb+SSfbZe9eDHEDRvHsFXPMf4b8WZd3diZE/PR+3xdfHee/bJrwphzONO87E7+2x9vooGA1tocg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLrnLA2kYTSfiufrYtaNXmDP2N1CmvmCtg0mN2LOiLQnM5HXN1F
	cMoaDnTtdRdHaAHk/tGWLRkvpAjVbIL6W0mYIfjQGYo/lwPQ9s+aSsRgxuEQL1pfow==
X-Gm-Gg: AYBFou1AodopNNzG7l3ciItLSnXtoEEovozREPegU8gkkawKLc13DhBKo2My0T1GjAS
	H8gVXB/tmZ0Kq47i+y9Mhv0agQw9YiP9dBbE5sRgLLb8lphzapW/qSo2Dq5tMagVyXUY+jtf0dl
	DQkENRfSCZPBh8V1AXCJrW65zDEQ7HsB+8iaT73+EMwdKdMfasW4mfOJpz/Py1u1oTwJiXc62nv
	po7zzQpNieAW+PUcHOeCeKpxBghW6MpfCcSTYFF2jyTM2KhG2Fx55huWAGLl0AutOwzRQDGV9yG
	DFIX3TIvei1CX1R6tIfAO31XPnj/g3aTX/J32/QSSSb64qMCE7jrBzL3nhAO7rTkoMgBOoNMvb2
	ef0ocE+LdBkBkOXwEIQJe2uPjncqPXLZvjAqBJgtrscMatnRUeTcL6ETg0PZu+Iz+bkZidD1JYT
	rL/+00YU/KaPdt4Fo5ZWy1jouHgBQmVoaMywhyTjgWVajAb6xoOwbembMEjflPUDmxP3FmxM+32
	dlLUdKrBJEY4BCYhLbr/JshXB9vv+Y94C4+mtdhBMn6iJ9WdGK7xxmYqNF7C6A=
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a1985b87f5mr78682915e9.4.1791818897919;
        Mon, 12 Oct 2026 08:28:17 -0700 (PDT)
Message-ID: <aa82fc34-0074-422a-87da-0cab24bb43c8@suse.com>
Date: Mon, 12 Oct 2026 17:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/39] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <cafb356d9cc3148d74df846e08c4961da72bea0e.1790779209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cafb356d9cc3148d74df846e08c4961da72bea0e.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791818898-A98C19EA-759207F6/10/78276251493
X-purgate-type: spam
X-purgate-size: 3595

On 30.09.2026 18:18, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -9,6 +9,7 @@
>  
>  #include <asm/cpufeature.h>
>  #include <asm/guest-layout.h>
> +#include <asm/mmio.h>
>  #include <asm/p2m.h>
>  #include <asm/vtimer.h>
>  
> @@ -101,6 +102,8 @@ struct arch_domain {
>      const unsigned long *isa;
>  
>      struct vintc *vintc;
> +
> +    struct vmmio vmmio;

This is a decent size structure, so I wonder whether this really wants
embedding in struct domain. If it was a pointer here (with the struct
dynamically allocated), the struct definition itself may not even need
exposing in a header.

> --- /dev/null
> +++ b/xen/arch/riscv/mmio.c
> @@ -0,0 +1,175 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/bsearch.h>
> +#include <xen/lib.h>
> +#include <xen/rwlock.h>
> +#include <xen/sched.h>
> +#include <xen/string.h>
> +
> +#include <asm/current.h>
> +#include <asm/mmio.h>
> +
> +/*
> + * bsearch() comparator: @key holds the address to look up in its addr field,
> + * @elem is an entry of vmmio->handlers. Relies on the regions not
> + * overlapping, which register_mmio_handler() enforces.
> + */
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
> +/*
> + * Return a copy of the matching handler rather than a pointer into
> + * vmmio->handlers: a concurrent register_mmio_handler() shifts entries
> + * up to keep the array sorted, so an escaped pointer could refer to a
> + * different (or torn) entry once the lock is dropped. The copy stays
> + * valid as the ops structures are never freed.
> + */
> +static bool find_mmio_handler(struct domain *d, paddr_t gpa,

The first parameter here apparently wants to be named currd, much like ...

> +                              struct mmio_handler *out)
> +{
> +    struct vmmio *vmmio = &d->arch.vmmio;
> +    struct mmio_handler key = { .addr = gpa };
> +    const struct mmio_handler *handler;
> +
> +    read_lock(&vmmio->lock);
> +    handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
> +                      sizeof(*handler), cmp_mmio_handler);
> +    if ( handler )
> +        *out = *handler;
> +    read_unlock(&vmmio->lock);
> +
> +    return handler != NULL;
> +}
> +
> +static enum io_state try_handle_mmio(mmio_info_t *info)
> +{
> +    struct vcpu *v = current;

... this variable wants to be named curr. Unless of course there are
plans to not unconditionally use current here.

> +int register_mmio_handler(struct domain *d,
> +                          const struct mmio_handler_ops *ops,
> +                          paddr_t addr, paddr_t size)
> +{
> +    struct vmmio *vmmio = &d->arch.vmmio;
> +    struct mmio_handler *handlers = vmmio->handlers;
> +    paddr_t end = addr + size;
> +    unsigned int i;
> +    int rc = 0;
> +    bool overlap;
> +
> +    if ( !ops || !ops->read || !ops->write || end <= addr )
> +        return -EINVAL;

I think this checking goes a little too far: It's absurd for some call site
to pass NULL into this function. The other three checks are sufficiently
plausible, albeit I wonder whether this wouldn't want to be an assertion
then.

Jan

