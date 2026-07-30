Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBA0C55164
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 16:09:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378127.1623741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTJi-0006MO-W6; Thu, 30 Jul 2026 16:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378127.1623741; Thu, 30 Jul 2026 16:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTJi-0006MH-T3; Thu, 30 Jul 2026 16:09:06 +0000
Received: by outflank-mailman (input) for mailman id 1378127;
 Thu, 30 Jul 2026 16:09:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpTJh-0006Lw-BD
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 16:09:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpTJg-003lYY-OM
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:09:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b7720-5cb7-0a2a0a5109dd-0a2a4502ac54-0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:09:04 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b7720-6ca4-0a2a45020019-d155dd35c990-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:09:04 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47f7854678bso1265290f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:09:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-498010bb0e7sm67328605e9.15.2026.07.30.09.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 09:09:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1785427744; x=1786032544; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWBREpjFVk4IdNkIwzlOFP7bMUSzA1Sx2XbrpIt0xgA=;
        b=ELJVsvF8WuYaIWCp+MaG2YUksz/CXv/04HaRsmqsU9WriIVhpa3byoVYxtauwsmiiw
         0h7kDL1h6Ll6e1ma4JfBzfEPdxXHYIMzYbYtPXHM4LjKo5HKqJIdBcJ1tzwkybYEuMBD
         eyv8fZixPLu5rArsFUXyoqn4KJnKR70GazFxxspnvGYl5MtV+5q8xuZXbphk6qhabFSk
         MsKHfCRLo/N3HdRwjja655jkx9TtmWGruC0s63xuk/Cxr8LmL0RRB9v20XwWfgocWxnr
         9Fhv/ZwwQgMYSZzVn2WseB6qG1Idw1ed53wVBAbngKoCMowjr/rbpdVSlZBE16JwuLBg
         f6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427744; x=1786032544;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWBREpjFVk4IdNkIwzlOFP7bMUSzA1Sx2XbrpIt0xgA=;
        b=sdenNBrKlPDM8n7EQod3g1XIYQ0QadLgaqbQDWxA0VLXxNiWgJaefa1GEK3JEDcyny
         Utow0+Wy3WpPm/BHadg6riaHBVOucQutjIWhFEY8HsLmma8Ut9hXL4axxSCQiITyk0IS
         8RUqbrJFEgFuXXGqq4chOYh+2IHS6UqbCtgHtdUJaROGUH+LtPPjb9NeAu225h75hdjO
         8I2FL95DphznTy8NpLNcyF6ifCKOeptD5vsx865WFInRDTDrJXWma7XeqjsaiQfraxO8
         E7xyGYGUPSzEhiwqac093UjERn8igS4vdbTDS6jtFmqZmR3IYIrq+BitHi9vkay91H9O
         SklA==
X-Forwarded-Encrypted: i=1; AHgh+Ro63n0jx4lap9qDyEbvXzBUpTi2fiiyo+UN7f0USuooaTs9+7RQOCNPsdqfLasbD0UqIxUiRR2pT/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVoK2qIdfANj03kaWNrkprkKgkRWzR9doGgapSX7W3FsBMvNie
	lfHF4D9WF6awiyXjcAPLOYyfe0WwEOX/RqZR/zVNYkZMeIpXbt/i54EVJyslkCs42Q==
X-Gm-Gg: AR+sD10WhfCadkPIhaIktUGW2nzq/Soo9YQLEeRFIDyrFobUOoC825o4ZVlV/5hSKrD
	8MybSz+omz25Q0DPPTSUv9kbXTB4cWXNQ/LuhlUWATwqk2z2n8bqYH1Ko8pRUuucqfvOEIPdm9b
	9eyfQYX+PyhbUqA+dBvq4XWQcvOJMbM5lqhtnv1zybN7k3Xhx9bIgVV7dPiOdE54v9ghFeSxBJV
	F0oG6pUFlhgrlkr7WqDnDi8/HQnLHtd+TUu1CX4EuYYSgXNZjIiH9ZvfSacvmlQqq5YWDCX1CAo
	ie2kzFOHL+r8N4nWtyh8TL443eCiNiAbIKzOsuyPO5Qhw7fNmo/jbZbcUi7nBFTWUrg2NCuMf6u
	Iz7MSiFZs1GnplykDz79c+ZfpsTxj6HH2//WBMBKnPlG1i7qfgovp5ENEn4kBEBe5Aa2iCdJVd2
	vqOB3sXJ0TKZyArihyaSjxFKq7vxv3BQqMTcTsF1Bm+wbKLLCSaG1YFRCDiG8ZlKY++yL/VTsNC
	E/4pglQcyXokgmTZJDw9WxRds2NY30XEtOxZu9sMHTdF+swyqej
X-Received: by 2002:a05:600c:1911:b0:495:443b:1bbb with SMTP id 5b1f17b1804b1-49800ea0a90mr42802015e9.25.1785427744020;
        Thu, 30 Jul 2026 09:09:04 -0700 (PDT)
Message-ID: <2ef6b295-862b-40be-a7d2-c94a6378126b@suse.com>
Date: Thu, 30 Jul 2026 18:09:01 +0200
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
 <704870c1-18ec-4c7b-873c-e07e77ae0d39@suse.com>
 <d5867843-802d-493f-a535-1f40d9337b63@gmail.com>
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
In-Reply-To: <d5867843-802d-493f-a535-1f40d9337b63@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785427744-F0CA22AC-C4428332/0/0
X-purgate-type: clean
X-purgate-size: 3890

On 30.07.2026 18:03, Oleksii Kurochko wrote:
> On 7/28/26 2:23 PM, Jan Beulich wrote:
>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/mmio.c
>>> @@ -0,0 +1,145 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Copyright (C) Vates
>>> + */
>>> +
>>> +#include <xen/bsearch.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/rwlock.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/sort.h>
>>> +#include <xen/xvmalloc.h>
>>> +
>>> +#include <asm/current.h>
>>> +#include <asm/mmio.h>
>>> +
>>> +static enum io_state handle_read(const struct mmio_handler *handler,
>>> +                                 struct vcpu *v,
>>> +                                 mmio_info_t *info)
>>> +{
>>> +    register_t r = 0;
>>> +    enum io_state rc;
>>> +
>>> +    rc = handler->ops->read(v, info, &r);
>>> +    if ( rc == IO_HANDLED )
>>> +        info->data = r;
>>
>> Extending my earlier comment: Why could ->read() not put the value directly
>> into info->data? And why ...
>>
>>> +static enum io_state handle_write(const struct mmio_handler *handler,
>>> +                                  struct vcpu *v,
>>> +                                  mmio_info_t *info)
>>> +{
>>> +    return handler->ops->write(v, info, info->data);
>>
>> ... can't write take the value directly from info->data?
> 
> I totally agree, it can. Do you think it is better to keep ->data and 
> drop an argument 'r' or vice versa?

How can I know? You know future plans you have.

>>> +}
>>> +
>>> +/* Assumes mmio regions are not overlapping. */
>>
>> Are you guaranteeing this anywhere?
> 
> There is no such guarantee. register_mmio_handler() simply adds the 
> handler to the handlers array without performing any checks. I can add 
> such a check. The only question is whether it should be enabled only in 
> debug builds or in all builds.

Depends on what other badness can happen when this is violated. My gut
feeling is that checking in debug builds may be enough.

>>> +/*
>>> + * Return a copy of the matching handler rather than a pointer into
>>> + * vmmio->handlers: a concurrent register_mmio_handler() re-sorts the
>>> + * array, so an escaped pointer could refer to a different (or torn)
>>> + * entry once the lock is dropped.  The copy stays valid as the ops
>>> + * structures are never freed.
>>> + */
>>> +static bool find_mmio_handler(struct domain *d, paddr_t gpa,
>>> +                              struct mmio_handler *out)
>>> +{
>>> +    struct vmmio *vmmio = &d->arch.vmmio;
>>> +    struct mmio_handler key = { .addr = gpa };
>>> +    const struct mmio_handler *handler;
>>> +
>>> +    read_lock(&vmmio->lock);
>>> +    handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
>>> +                      sizeof(*handler), cmp_mmio_handler);
>>
>> So beyond the assumption stated further up you also assume the array to
>> be sorted. Which you ...
>>
>>> +void register_mmio_handler(struct domain *d,
>>> +                           const struct mmio_handler_ops *ops,
>>> +                           paddr_t addr, paddr_t size)
>>> +{
>>> +    struct vmmio *vmmio = &d->arch.vmmio;
>>> +    struct mmio_handler *handler;
>>> +
>>> +    write_lock(&vmmio->lock);
>>> +
>>> +    BUG_ON(vmmio->num_entries >= vmmio->max_num_entries);
>>
>> (Do we really need to crash in such a case? Can't we just fail domain
>> creation?)
> 
> Generally, no. However, the approach used by Arm's dom0less solution is 
> to crash as soon as any issue occurs instead of trying to continue 
> running other domains, so I follow the same approach for RISC-V.
> 
> Even if I return an error here, the common dom0less code will panic anyway.

That's the policy there, but you're writing code here also for the case where
Dom0 creates domains.

Jan

