Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B87C55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 10:41:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381373.1624960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqq6c-0004f4-CZ; Mon, 03 Aug 2026 10:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381373.1624960; Mon, 03 Aug 2026 10:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqq6c-0004ex-9Y; Mon, 03 Aug 2026 10:41:14 +0000
Received: by outflank-mailman (input) for mailman id 1381373;
 Mon, 03 Aug 2026 10:41:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqq6b-0004er-6Z
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 10:41:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqq6a-004uuD-JD
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 12:41:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a70703b-5cb7-0a2a0a5109dd-0a2a450885bc-28
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 12:41:08 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a707044-f659-0a2a45080019-d155dd33a93f-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 12:41:08 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4720f3bf164so2502575f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 03:41:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2cf1sm31636029f8f.10.2026.08.03.03.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 03:41:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1785753668; x=1786358468; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IawgCP+jZFb3uk7JaxA8OP7ijbXNyIydlK45oaJI28w=;
        b=STED+EnLx9pXeJULZgrne/eA/TX8R8pIn5YHWvk9navYUEXXSaNKjlpEd+77MeXKZV
         ZFjfKhxpiyCO5wwMPkMZO7M8vElV9o0uXE6IHEIuUpkwPPJ0+4mDftcUD9pKqech4NNp
         TTfV1/xEL3hMSF8f0ncKZq1bxq50zRhjmv2cWNaNK0D5aRcFPDpnoLBbYvVPy68DRks3
         /jKJOyt1MpGSee22NY0dnb/6dwG7R/mu6C1xicaBHzNFni6gbaykiWvEX/qLw4DGEBcO
         4Kpmmwn8qvo1cF1zlbChWBqi14VPivgNeXe0IcQ1tlEBNMKYAE8hQCtlOnlJmoC8G77C
         Cc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753668; x=1786358468;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IawgCP+jZFb3uk7JaxA8OP7ijbXNyIydlK45oaJI28w=;
        b=DsnKHt0/fRC5P+gpTIyAceYkxwv4XeHwP99aceA/Ix6+yYmCc6t26mZHEYLR9tWmzH
         1MYVFR7x7LAdLkNbYFQLYeK1qSoaPQDSHpZFwRvYtSN3UKvmO4ZxVXBNX+JIdGfQxEb6
         b/PmlGoRCwl8nMx/KzAdv2Bn/Ixr4f6d71OpciHpDejYiwD7UM6uAZkvquB5xaXt3R6U
         LHhFfleyPRAb1nGkjbn4s8h3RbJr2L3LToguhTKC4aCCtdOFp8eFDpNjJINvKSFhhOAM
         HcZE3M3Qpb314M0BZnQYuTEUncpjWA75qjfk+CdWpSSDmH4wU5ba9Bej4vLwgsT3QbmV
         nhMw==
X-Forwarded-Encrypted: i=1; AHgh+RqEB+Ykttz3QTAhFRcVEGJQBu454CeNlE+ls1Huhv/XOwrc8/2UEd30LxuHW0T/ZxuRCGp99EEH3Og=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzfw1u38NhetE1znUqNwgG9ONhKlG8R057YnVPmh4Qm3DLZLQEk
	LahmILfzWDVQDqrLaCWzTI7PD3u4RpE8YRak0dasB+aCdhnIZ9nfQv0/7sJb18OpnA==
X-Gm-Gg: AR+sD12oJYUH2A7sgtvG8lfSuTh1i7JYgbgD/OLGGiPGu1pwRqiytlouu8ikWTwVPP3
	yY0uamUvy/4I9NYXXE141iOXgJxPzyQ85ObFOP+E49xqFcuRqxJqUC1T3MoKdmQ9xjpwzWSbh8Z
	mkGPlap9Ku/nHk6kr+NEHJAXfek9od/zJDvuD8AiY/WmIrsVBCriHlyTKaUcMy7Ts37HkSVY+xA
	ziow4IBDYztJB78lnJdhhrvwmvMCCghM1hpupm9r2s0Ntj9gASvC25F+RFF4AsNiFopXT9ZlgtV
	67JUtNsQLB8KvhTAHVkkrMWDZFtwTrFuigYpVi2llCXaN5Jw57cqObVD+Pwyc+OFIWjuxe9PVxk
	6msopjkE+oXOzDTlxOPDfJxfeBchyskaXTCUgBm1DMCb/xMTInPJvRjzWePzI2RcnRU7WjSiy0A
	GQkQBE1LWOKz3lJ7gXyziuxDsXpJwhMZ6h2xP96+qGzezOA4IH2ZslXLDpjj16bg/p0Sbo7YAgU
	FvnB8VClRH+73aa0wVhAPxxyflNQO1xRdAtrADlpx5AZbHvOqoP
X-Received: by 2002:a05:6000:18a6:b0:47f:7fe0:a287 with SMTP id ffacd0b85a97d-47fd725b307mr23032494f8f.2.1785753667898;
        Mon, 03 Aug 2026 03:41:07 -0700 (PDT)
Message-ID: <51e537a4-f568-458d-9625-ada7fbebd842@suse.com>
Date: Mon, 3 Aug 2026 12:41:04 +0200
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
 <2ef6b295-862b-40be-a7d2-c94a6378126b@suse.com>
 <636a6183-8c66-41b2-b820-6a02098fd33d@gmail.com>
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
In-Reply-To: <636a6183-8c66-41b2-b820-6a02098fd33d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785753668-D6D4087B-0EB09F8A/0/0
X-purgate-type: clean
X-purgate-size: 3188

On 31.07.2026 17:24, Oleksii Kurochko wrote:
> On 7/30/26 6:09 PM, Jan Beulich wrote:
>> On 30.07.2026 18:03, Oleksii Kurochko wrote:
>>> On 7/28/26 2:23 PM, Jan Beulich wrote:
>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/mmio.c
>>>>> @@ -0,0 +1,145 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>> +/*
>>>>> + * Copyright (C) Vates
>>>>> + */
>>>>> +
>>>>> +#include <xen/bsearch.h>
>>>>> +#include <xen/lib.h>
>>>>> +#include <xen/rwlock.h>
>>>>> +#include <xen/sched.h>
>>>>> +#include <xen/sort.h>
>>>>> +#include <xen/xvmalloc.h>
>>>>> +
>>>>> +#include <asm/current.h>
>>>>> +#include <asm/mmio.h>
>>>>> +
>>>>> +static enum io_state handle_read(const struct mmio_handler *handler,
>>>>> +                                 struct vcpu *v,
>>>>> +                                 mmio_info_t *info)
>>>>> +{
>>>>> +    register_t r = 0;
>>>>> +    enum io_state rc;
>>>>> +
>>>>> +    rc = handler->ops->read(v, info, &r);
>>>>> +    if ( rc == IO_HANDLED )
>>>>> +        info->data = r;
>>>>
>>>> Extending my earlier comment: Why could ->read() not put the value directly
>>>> into info->data? And why ...
>>>>
>>>>> +static enum io_state handle_write(const struct mmio_handler *handler,
>>>>> +                                  struct vcpu *v,
>>>>> +                                  mmio_info_t *info)
>>>>> +{
>>>>> +    return handler->ops->write(v, info, info->data);
>>>>
>>>> ... can't write take the value directly from info->data?
>>>
>>> I totally agree, it can. Do you think it is better to keep ->data and
>>> drop an argument 'r' or vice versa?
>>
>> How can I know? You know future plans you have.
>>
>>>>> +}
>>>>> +
>>>>> +/* Assumes mmio regions are not overlapping. */
>>>>
>>>> Are you guaranteeing this anywhere?
>>>
>>> There is no such guarantee. register_mmio_handler() simply adds the
>>> handler to the handlers array without performing any checks. I can add
>>> such a check. The only question is whether it should be enabled only in
>>> debug builds or in all builds.
>>
>> Depends on what other badness can happen when this is violated. My gut
>> feeling is that checking in debug builds may be enough.
> 
> Overlapping regions would be a Xen bug rather than something a guest can 
> trigger — register_mmio_handler() is only called from Xen's own emulated 
> device code, so the layout isn't under guest control.
> 
> The badness is worse than just mis-emulating one device though: 
> cmp_mmio_handler() is used both by bsearch() and by sort(). With 
> overlapping regions it's no longer a consistent ordering, so sort() may 
> produce an arbitrary order and lookups can then fail (or match the wrong 
> handler) even for regions which don't overlap themselves. That would 
> show up as a spurious fault injected into the guest, which is quite hard 
> to debug.

Didn't you say you'd get rid of the use of sort()?

> So I agree a check is worthwhile; I'll add one under CONFIG_DEBUG in 
> register_mmio_handler().

Some assertion then hopefully, rather than an open-coded use of CONFIG_DEBUG.

Jan

