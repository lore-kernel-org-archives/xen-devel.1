Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9B1C44521
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 07:00:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366124.1616020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlhz2-00068N-Lq; Mon, 20 Jul 2026 07:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366124.1616020; Mon, 20 Jul 2026 07:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlhz2-00068F-Gk; Mon, 20 Jul 2026 07:00:12 +0000
Received: by outflank-mailman (input) for mailman id 1366124;
 Mon, 20 Jul 2026 07:00:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wlhz1-000689-1G
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 07:00:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlhyz-005gkV-Bi
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:00:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5dc772-2eae-0a2a0a5409dd-0a2a450ba4b2-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:09 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5dc778-b7e8-0a2a450b0019-d155802ce02a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:08 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4956242332dso1565935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 00:00:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4955fee64dasm38632805e9.10.2026.07.20.00.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 00:00:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1784530808; x=1785135608; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfAGzmmbM30stEk1fHIw9A+/NFSI9D65VLhLXj5CZo0=;
        b=L/vIeEZ9PRVBeSpC03v7K3IvQQflKVh40kiB3KLiIFY0GkNv1UMijzUIdWuqxa8UsB
         xnDb9GbDIS/fOog61xFR8BHXjtRH5I3+bCUuF6S0VSzD2d6/E6kBdwPzpd/gRwU1NGxO
         +x7kCc7F1IjXPNF9/2pPktFTJ5qEupL5R5HPEUtNpDv635e5hOPOu9qu0pYmCIm5pMgo
         6KyMKxEnUG3j7gdIaTP2HmVMWWgqA5DOrziQ1iTNMghqxlpi5E8AfykvVbcM6fMDNOw/
         sggYzkVHFxQPY3qL05AuFWqfAW88NDVzHgRnrmJx6euS1Ga173Puj+WFYAzGliilL43i
         69xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784530808; x=1785135608;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfAGzmmbM30stEk1fHIw9A+/NFSI9D65VLhLXj5CZo0=;
        b=UtFrZO5dlRHMCnBgACkB9206RLBAO3Pee30NvtO4RbPEf5yGtfNiw7QjCXuFw2KtTd
         NwfDe4DsJti/0QpAoeVAlOBmilJVNGvws35H25BO+6JQcKI1omdpDuN6ETQMuFhAoziJ
         FGtRVK6ZF23j4IUl94C7ohzzseOr4tp53qwX+ew67jZKOtvPPr3+yLyopERaMYFoHIx1
         OHdcFiCwidnMgAj2hKMZ9fBTDAJT6/4o6Q8E4AwsGITcP1dvPwQutbjcRnIhEx9xBBTA
         KRk5bw6K5yc7AUCwmOQxh5kSYY37ggCiaOr1Xl4berNHnBpjMrUYHFd136O+1dAxzwB9
         3kAQ==
X-Forwarded-Encrypted: i=1; AHgh+RryPyGKOQWLM8apWjzi4yhn6Hi+/LF+O7mXgUHltiKn6c/V1P+BHKfbRQOi6yTgezsGDKyLJjk2d/I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwBuI75w57o9Cdi27zRmeKb4xzjdPXxNtygdpur78QbcDPEoBJ
	8edQhnfNfC2mkdKQH/t/LYCex4nPCgIDStNd3aj4x5rP0XQ9STtVq2C49UBq9hnesA==
X-Gm-Gg: AfdE7clEQcuxH2SQJ+Cfo4U9842Pqttmvb5OR40sf2wC25oVVoXwpoUNvi8E52CMEKz
	yRfof7+okUDfZys0lR+pLTHiYPNZPqhS6hnbcID87e0RsZ7mdmXA/ZbqpOUMPsKtKUafEPgi/vi
	JHOYyZvA9Ywyioj/BE8P6I+I/r3N2iAOUzo9dYHevTZp+8Hp0rsUrT+WTIsaVqJ/xagHcUqdClo
	/ezOJ5qx7iQyiDsHD74FtoA4qloXi3tGDrZabXa5nzsn/NItJwPm7eeRQg3KqNiOI3h8NJLPCoR
	lc5epyKfNDDp1mazEIuLaaPg16qDNSRPDkH53+63wCfgiXYzqwRpq1YSVQ9Qevh37/MOrrKJS3A
	wTU6IULdDendQsyN/y2eSVmZpE5VG8V/2cNK3sryfvIWFjW/rK4+6c1YPlvNIS7bT1+95o0/3s5
	T/bFD4xesAhMYLZeKl7q/d3PysIOrdY2KBOMPsrj9NH1jwn5pXVFi2H83euQbQH+GjZA==
X-Received: by 2002:a05:600c:3512:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4954a3ef7dbmr132736855e9.9.1784530807574;
        Mon, 20 Jul 2026 00:00:07 -0700 (PDT)
Message-ID: <572ff8b3-99dd-489e-b01f-76d7dee07a14@suse.com>
Date: Mon, 20 Jul 2026 09:00:07 +0200
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
In-Reply-To: <OS9P286MB722280A3A0E6E36B8194501B82C42@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1784530808-A8AC89EA-E6B2B860/0/0
X-purgate-type: clean
X-purgate-size: 1469

On 19.07.2026 03:17, Hirokazu Takahashi wrote:
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef XEN_CPU_TOPOLOGY_H
>>> +#define XEN_CPU_TOPOLOGY_H
>>> +
>>> +#include <xen/cpumask.h>
>>> +
>>> +#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
>>> +
>>> +struct cpu_topology {
>>> +    cpumask_var_t thread_sibling;
>>
>> Btw, as this aspect becomes more apparent when looking at patch 2: What is the
>> relationship of this (i.e. cpu_topology[cpu].thread_sibling) to
>> per_cpu(cpu_sibling_mask, cpu)? The two ought to be identical, but I can't see
>> this being guaranteed. And if they were identical, why would both be needed?
>>
>>> +    cpumask_var_t core_sibling;
>>
>> Same for this vs the per-CPU cpu_core_mask.
> 
> I have considered the same thing before. However, considering the CPU hotplug
> support that Mykyta Poturai is currently implementing, it is difficult to remove
> thread_sibling and core_sibling from struct cpu_topology. We intend to use 
> cpu_topology to hold information for CPUs that haven't been hotplugged yet.
> 
> While it might make more sense to remove the per-CPU masks instead, 
> I hesitated to do so because the impact on x86 Xen would be quite large.

That's understood, but imo removing the duplication should still be a follow-on
work item, if it can't reasonably be done right here. And the duplication then
imo wants an extra word of justification in the patch(es) introducing it.

Jan

