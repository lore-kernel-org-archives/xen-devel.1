Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77DAC79FBE
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:24:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413086.1643338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4IHn-00052y-Fi; Wed, 09 Sep 2026 13:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413086.1643338; Wed, 09 Sep 2026 13:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4IHn-00052r-Cj; Wed, 09 Sep 2026 13:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1413086;
 Wed, 09 Sep 2026 13:24:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4IHl-00052i-VS
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:24:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4IHl-005GBf-CI
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:24:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15e00-8faa-0a2a0a5109dd-0a2a450ae004-20
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:24:21 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15e05-f2d2-0a2a450a0019-d155802fe833-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:24:21 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so35353515e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 06:24:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf755c22esm477753945e9.0.2026.09.09.06.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 06:24:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1788960261; x=1789565061; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdXMlpi2UJ1gQjCY2civr/JHz6NVV18sHsTq8zd6vtU=;
        b=UfQbze8JDTpFPxfeU8C4OsLx/NStV91d2hWkyifiQdLk/vv39ZOTVM4QCRpc34pHjV
         H6itgwM7f2Bnq8dX12xlofngx1PtBfwUMdjEotXm4SIiOs7HBUyAVxydlHLUnQ1ObZdN
         CwK9oOwpOb+EizB2V2JmzV8Ozc079i7Dfc+ZwxgakIliCcAkqBARaU2snR2s0FbqA3GL
         TXkoo7NXrJEY/dBDSwLh6SDaQd0R3Sf5nOFpbLQZOfXKWQS1GUh7+GyUDHUDQppjlAOH
         75BKYUdk9J9LQKwCKijnLr4RhpVEwP2c8zl4LjMNyctttPI3E7K2Fwinn2u7YO3uQh2R
         qAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960261; x=1789565061;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdXMlpi2UJ1gQjCY2civr/JHz6NVV18sHsTq8zd6vtU=;
        b=O1Oj5B0BHVB0aHYvCoybsyG1KImOag59wL6OgL3z+GDWQkr61EdWinmoNPxkY4WXKW
         9VUDD5VYFXa7rFt3JFODw2RUu1eW5oEaodH0aG9jJvOJCO6aaFBQcWoNpUHTHniy/eyj
         gYZS1aFzgPTNtvVvNuktU4UYHPmvwgp8jyNLYWbl9PIy9skHWN0b4wMO6D1HBcLhcPVR
         ser49ai2K/ORxhCyAGm1n7LztsOg91xxbfhgyU4UthDtyEvhgaWOmMaJwDfpvGB8ny0s
         yZyZowo88NyRRJCnd9/3M7o85QEZU+LZFGdFSdy26AVGoMINaCWU09ckuZNkmVJCyrvB
         4LFg==
X-Forwarded-Encrypted: i=1; AKwUvBzLgwE34HK7CaQG4MQqPBrM/vxpzihK/RjGczN3nchbkBj51k4/hnH+uP30CMDK5ql+gq5H7zcn9t8=@lists.xenproject.org
X-Gm-Message-State: AFuF++maKR6u08dKTX9R1c+ftp28brJcdyMdthZroyYnOKxJ5LbAW1Qo
	LmQd+p8k5eu9MYEO5ih+WNntAUpvLcje2x0c8R3ivTbuecreEeBjKThwsfFvB12qWw==
X-Gm-Gg: AYBFou3cO2bKrKjd7+sZq1exIGtWuh0wXrQ7qYGyoNRT67vJDl0U3LxDZwOwukyrMa+
	2e+jhmykIlat0tfPO6uInSPUwUv0KhaPCl+iTpdJ9lopAvcJ7R6gfTQU/sA7SaEghWFnAc1d90a
	JmZaxjhCNhRDYbT4vWXZULihQcIXSpgZdKsdEtwiVPGF+4bx6iuLTKZJO0n8hMHcsETbOBJODja
	E0w/aI7kSj6HprH71MG4Jq8zNFGWZkFUgAy7eXf3hT3uHz4JXUJdwNptAlr2N0zmlcuItngeqDm
	A0hPQyzuSfV9JKp2OlLJ3Hn5HmEv6kpBCKYQmCdPkJui3vnYazUhDXMd3M9UiVUrr1RjJaYbvIM
	5jmE6yIewvM/XLGhW5fvNkEmdEj9JrvCnxQIAef/M8KRAlcq1IsMDdDwsBQf+sUdn9RSb38QOM6
	kchf7pey/7VCktzq56i/wjTScr8HFhB56OAfhsq5Bh+vMtVNyeNWB48LuqpMJf+rco/ptKg4wt0
	XO7boRwO73DqC6r0wBuvbTMR4fsBK3y1pMnMuL79c9jl68MNYcePlW95TTKO1o=
X-Received: by 2002:a05:600c:4ec9:b0:49c:fc6e:a3d2 with SMTP id 5b1f17b1804b1-49cfff39708mr304249235e9.17.1788960260646;
        Wed, 09 Sep 2026 06:24:20 -0700 (PDT)
Message-ID: <d8086443-2076-4dbf-b756-217f83234d33@suse.com>
Date: Wed, 9 Sep 2026 15:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/39] xen/riscv: introduce device-agnostic MMIO
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a74ff916f76fb95e1e44bfadd45fbc477df00c51.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a74ff916f76fb95e1e44bfadd45fbc477df00c51.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1788960261-593C4CFC-5AB7B9D5/0/0
X-purgate-type: clean
X-purgate-size: 4020

On 27.08.2026 17:20, Oleksii Kurochko wrote:
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
> +struct domain;
> +struct vcpu;
> +
> +#define MAX_IO_HANDLER  16
> +
> +typedef struct {
> +    paddr_t gpa;
> +    unsigned int len;  /* access width in bytes (1, 2, 4, 8) */
> +    bool is_write;
> +    /* store: value to write; load: value read (set by handler) */

Nit: Comment style (twice). I'd also like to mention that enumerating
access widths is prone to go stale once the V or Q extensions are
supported.

> +    register_t data;
> +} mmio_info_t;
> +
> +enum io_state
> +{
> +    IO_ABORT,       /* The IO was handled and led to an abort. */
> +    IO_HANDLED,     /* The IO was successfully handled. */
> +    IO_UNHANDLED,   /* No handler found for the IO. */
> +};
> +
> +typedef enum io_state (mmio_read_t)(struct vcpu *v, mmio_info_t *info);
> +typedef enum io_state (mmio_write_t)(struct vcpu *v, const mmio_info_t *info);

I don't quite understand the (need for) parentheses around the typedef
names.

> +/*
> + * Check alignment and dispatch a decoded MMIO access to a registered
> + * handler. On success (0), info->data holds the read value for loads.
> + *
> + * There is no "retry" outcome to handle: find_mmio_handler() returns a
> + * copy of the matching handler taken under vmmio->lock and the ops
> + * structures are never freed, so the lookup result cannot go stale
> + * between finding the handler and invoking it.
> + */
> +int do_mmio(mmio_info_t *info, paddr_t fault_addr, unsigned int len)
> +{
> +    /* Fault address should be aligned to length of MMIO */
> +    if ( fault_addr & (len - 1) )
> +        return -EIO;

Better first check (or at least assert) that len is a power of 2?

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
> +    if ( !ops || !ops->read || !ops->write || !size || end < addr )
> +        return -EINVAL;

"!size || end < addr" can be had shorter as "end <= addr".

Whether it's worth checking ops to be non-NULL I question, bit I wouldn't
insist on dropping the check.

> +    write_lock(&vmmio->lock);
> +
> +    if ( vmmio->num_entries >= ARRAY_SIZE(vmmio->handlers) )
> +    {
> +        rc = -ENOSPC;
> +        goto out;
> +    }
> +
> +    /*
> +     * The array is kept sorted by base address, so rather than appending and
> +     * re-sorting, find the slot the new region belongs to and shift the tail
> +     * up by one.
> +     */
> +    for ( i = vmmio->num_entries;
> +          i > 0 && handlers[i - 1].addr > addr;
> +          i-- )
> +        /* Nothing */;

    for ( i = vmmio->num_entries; i-- > 0 && handlers[i].addr > addr; )
        /* Nothing */;

?

> +    /*
> +     * Regions are required not to overlap; check both neighbours. Their
> +     * addr + size cannot overflow, as such regions are rejected above when
> +     * they get registered.
> +     */
> +    overlap = (i > 0 && handlers[i - 1].addr + handlers[i - 1].size > addr) ||
> +              (i < vmmio->num_entries && end > handlers[i].addr);
> +
> +    if ( overlap )
> +    {
> +        rc = -EEXIST;

I fear -EEXIST can be misleading; it generally means _this_ range is
already covered, not some sub-range thereof.

> +void domain_io_init(struct domain *d)
> +{
> +    rwlock_init(&d->arch.vmmio.lock);
> +    d->arch.vmmio.num_entries = 0;

The latter shouldn't be necessary, as struct domain-s start out zero
filled.

Jan

