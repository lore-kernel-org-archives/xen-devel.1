Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB9BC4452A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:29:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366663.1616621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlozO-0001Z9-Fy; Mon, 20 Jul 2026 14:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366663.1616621; Mon, 20 Jul 2026 14:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlozO-0001Yx-Bs; Mon, 20 Jul 2026 14:29:02 +0000
Received: by outflank-mailman (input) for mailman id 1366663;
 Mon, 20 Jul 2026 14:29:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wlozM-0001Lw-Sv
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:29:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlozM-00C389-9r
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:29:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5e308d-2eae-0a2a0a5409dd-0a2a450cc7c8-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:29:00 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5e30ac-f479-0a2a450c0019-d1558036d9ba-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:29:00 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso12712325e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 07:29:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ec7c69sm32497340f8f.17.2026.07.20.07.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 07:28:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1784557739; x=1785162539; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApaNs6wln6tfa72PpnMR7oiI/TOUp0tOXzX+pBwMZbQ=;
        b=eswilXa/Qs/2p70QtKwZ8vfhV+EyMyUPW2EHFHHoquE/RK3Ct7uBeZbXhKuAyvZzm2
         Dcq98JK6mIQGMkosCLhykkwYo5nbbwRYUqQP7kUVWH17TdOxZ6syYYmk/UESmD/H3uJG
         arf87uKufWW/Kro+mYyjP4bY7Wv0Xfi8J6DcbXMjfg6pN9vzt5Dbmjt0cyXKE4rgL9sI
         5qJ4NGpx8hST8IhiPjbUm94mOnBUEUObY+h1XhcYyj6pGjLcdA/90x3KBsNSJeEee0w3
         37UM2ih+jHh72CCZrqsy+awbtMgUdQvAl5S7QnoWHZMK3TQh/eu8JkcP/9XZaGKiLy1T
         KOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557739; x=1785162539;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApaNs6wln6tfa72PpnMR7oiI/TOUp0tOXzX+pBwMZbQ=;
        b=HLvJZmqcpNdgrjA+uviKWS9g4y/9qmaxQTRTamixlpBeYTACl0a/9H7TthLECFyWcD
         C5uA+9guBlhF4KbAvzR3E69GIrRlJQyVpRI3SU9BreRoc0X5O0dYSlz0Eo49hbxZ6UBY
         g5caluJoNKjxLWNnigwZmLk06iO97ccvIQWkPz7C2aa9TCUwqrUzgKpozb/TFKjmJtBi
         l3NS8aMLf1E+YmTI1LJ1/j7jLY08Q78jOSsm2/2o7AQoFf5VEWQwNkCgfKn1fBdDxxje
         41kpWDc7eojxVzk/pcsvZkVrvqWCTq5lQS5hCf0w8wttrimZJGlallRf4rqj5R5J71Bd
         tMrg==
X-Forwarded-Encrypted: i=1; AHgh+RqZHCxsOfEpLUH0UlC0QCcU59E44M2tTTIt+7snHMEWi7AgnS1dFPd3ay682sDeIENYSp6v9s+Jks4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlHuHpKWD2BF4v/enASJ9nlHxBq5KFDB8jdObL8gPe+zlPsp48
	ShcXY1d25jd5IM/PU1AOImbh42vH6POJciQuG3YnZ3tZPP/elsrIPuwCN0VT6D1p1g==
X-Gm-Gg: AfdE7cngIeit9RbXTc8/iEsvef5Vp1DZlHGA4slqxAfX4vOb/VTmLaqelQqdQt2dILz
	+8WEZ6puqkq4RYjBnH5UWXI4ft+sZKAXncLabHBwN6Uo9avgdu2XFmGwssoiLU4BY5I6sCDBCPY
	iYHOqVOitx3N+b1MQXWggZ2uAtyxbvSlXF9vFKEvLvXiA+LjiMKH5kQCIJBTIbdTIhZ7wDaaFe9
	txajFlxKIgA03oPRry25q1qGl0qtm8OEwwhK5te9sqAspZo3hWFVXa5UQP4ZxWUJ0QpNWephfpE
	c3lGtKWZaKlBa0BcWJCm2BvHBjFcn/LeVaTj1+z7C1FDnXsryE4T7tGBXfAECYLbCdyK5vMSepK
	1hbkdMV9aR9e69JyNCj0o6AYv4/9bAC4pERrfAehmGVQYGd3qdeyrugDrDjySH92G22GmMsemrU
	/1mxLdaNIOaD3CnzA2LT65JF9v9DZpAf350HYE6+zoZSiUiYgz+fchAYiqGtUHTL5kKw==
X-Received: by 2002:a05:600c:46c7:b0:495:5205:86c with SMTP id 5b1f17b1804b1-495520509cemr102272015e9.22.1784557739653;
        Mon, 20 Jul 2026 07:28:59 -0700 (PDT)
Message-ID: <a2b6a2a6-41d5-400e-906a-25e5f15e7be6@suse.com>
Date: Mon, 20 Jul 2026 16:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-2-taka@valinux.co.jp>
 <f2f3572c-6a77-4f65-bf8e-82298d145a6e@suse.com>
 <OS9P286MB722280A3A0E6E36B8194501B82C42@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <OS9P286MB7222F9243B20CFE5FE145A9182C32@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB7222F9243B20CFE5FE145A9182C32@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1784557740-012C8A5B-0D2DFB61/0/0
X-purgate-type: clean
X-purgate-size: 1733

On 20.07.2026 15:58, Hirokazu Takahashi wrote:
> I suspect that when CPU hotplug is implemented, cpu_topology[cpu].core_sibling
> And per_cpu(cpu_core_mask, cpu) will actually diverge.
> cpu_topology[cpu].core_sibling will include reserved CPUs that may be hotplugged
> in the future, whereas per_cpu(cpu_sibling_mask, cpu) will only track currently
> active CPUs.

I see. This then wants calling out, perhaps not only in descriptions but also
in code comments.

Jan

>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#ifndef XEN_CPU_TOPOLOGY_H
>>>> +#define XEN_CPU_TOPOLOGY_H
>>>> +
>>>> +#include <xen/cpumask.h>
>>>> +
>>>> +#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
>>>> +
>>>> +struct cpu_topology {
>>>> +    cpumask_var_t thread_sibling;
>>>
>>> Btw, as this aspect becomes more apparent when looking at patch 2: What is
>> the
>>> relationship of this (i.e. cpu_topology[cpu].thread_sibling) to
>>> per_cpu(cpu_sibling_mask, cpu)? The two ought to be identical, but I can't
>> see
>>> this being guaranteed. And if they were identical, why would both be needed?
>>>
>>>> +    cpumask_var_t core_sibling;
>>>
>>> Same for this vs the per-CPU cpu_core_mask.
>>
>> I have considered the same thing before. However, considering the CPU hotplug
>> support that Mykyta Poturai is currently implementing, it is difficult to remove
>> thread_sibling and core_sibling from struct cpu_topology. We intend to use
>> cpu_topology to hold information for CPUs that haven't been hotplugged yet.
>>
>> While it might make more sense to remove the per-CPU masks instead,
>> I hesitated to do so because the impact on x86 Xen would be quite large.
>>
>> Thank you,
>> Hirokazu Takahashi.


