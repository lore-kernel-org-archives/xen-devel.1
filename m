Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610B2C982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 13:24:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427524.1650286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8e0b-0003pZ-NH; Mon, 21 Sep 2026 13:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427524.1650286; Mon, 21 Sep 2026 13:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8e0b-0003pS-Jg; Mon, 21 Sep 2026 13:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1427524;
 Mon, 21 Sep 2026 13:24:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8e0a-0003p4-JR
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:24:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8e0Z-00HIAx-S3
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:24:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab1300d-8faa-0a2a0a5109dd-0a2a4509ddbc-12
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:24:35 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab13013-be1a-0a2a45090019-4a7de14ced68-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:24:35 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f633ece3so2289002f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 06:24:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-487244229d5sm23866013f8f.2.2026.09.21.06.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 06:24:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1789997075; x=1790601875; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN3f4g6EEth6PzAQzBFAZRMSXOjaInLqdUI9Im+f83s=;
        b=R/bDHD45SGi1z08PxEJlLWZ5Z8cua5L7Ub3fQ38KJZ+0Rn2uCdq1cAswehl78+AlXq
         KM4a42lPtK/I3uARMruNFsl9a4UZIb1lv9cLhVzBXAPqgQiuyjSXV/g0rYbooVBN80jF
         CVU4LnjNCZ4dBwF0E8ovP8rQ1vcFh6lErBG2BrrQgSx7NYNX3P+/Hd+Zg4k4ozzCrwFJ
         0DdSu2PvLC4tbChXh8a6KeVRbClRMsYXKF72TzRJ1XWzi1ftsxOG0zaNS2uqnJV174T4
         iub9DIJGOuzh8CkpL+7PNByGbJRH6cOPBbDj8nUzfmdQJjtmHa1n+f9Dm91Uqf9yY+oC
         Ok4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997075; x=1790601875;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lN3f4g6EEth6PzAQzBFAZRMSXOjaInLqdUI9Im+f83s=;
        b=QpsN2SADO6MN4gFYeLjc+jlzWrxXPISy2FQxMaOF+o5Eoa2YterhDxsCZaMRlpnexg
         l2iweKkJXQOxWEhRbuHZYGXezPyAtHxuZFHcJ158hvZDzckGArOhaShBwr/xFjWgHsKw
         VLngkRWV/yejAOU7djIl96ADXvb9mVJq6UQbgTIEVqT1UZ7xtA+PqTAqMEK9zsQgn2uX
         WIPvTO2iNtuU9IcrB56meHv4VCH+Q0c6oY6hTPTcgO3QAMD98l/5/hcJaQSWfxDdvFgT
         pnHqLeNnmxWb1S6vacElPFrjBZ7wnWTD+kI7guzlLuog/0DV6umzQvVlR/GGiueGIGmf
         5XGw==
X-Forwarded-Encrypted: i=1; AKwUvBwgLSPKkv8qOzF3cW2Fm+73OBGCRyt9oXNfQkJ24yk9G6nhfLo1VATaQPlPH3av3IeLvUEJ5rkE+dQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++k70vLz9aOZJokireF23FLTP/aXxPEj49eSlq3r5aK6GwBoq472
	mdIb8dCjE5gjJC0fhVpg3n4W51Ca5VHB5uH2D8lwy8+LszvMc8YTQFjIV3bYYLvOog==
X-Gm-Gg: AYBFou3K+pgZEthKgKKn5GDEAwRlyrFW80jHSpLBQ8PnBjKOWa54nlxWTX6GkL6SZhw
	53jyIbjZHi8tUFqo2WJyeo77xWYsEvLmlngjBfwze2gh3dqSy8kKYw3GMdq2auQCtb51evCFQhP
	Br/Eufnz/KNsRro92HMI3QsI7UX0vyGfCwhOLDyzOnS9wFi7LGct4E98z0QHTdlTVbQiJDg3zy8
	HPmbDX2bGCj2lQyhKJuCEN+L2aTV7iAGn2RNRbQ9Q6qt0bni64umZ6Vp6tSqexZKyC2PbYuJp89
	EK8GVBkUvMYwzQuPJhbrJBMz3wVLaBXyVQZGWp1AT9UT69H1fmAGG/GguW4m4kBi5mpaYqdJvA4
	ec5AQNovCRvNMvto7lZE9LuuZueT2A3DtKIb623rUP/nfzBxavnLM0EdOOGjr99JwTGsU/Q0i7c
	J3aBT7Hg89YyKbe+1HR5rqZPkIQW6knARWVRbiBPqn1I+LkwGmp48V95HwVlmgV+dcUSPDRq6Sv
	F5ZJoC8KK/JyoSoHhB0oRbV3VEmd9cmex1ak5HSZgkCfJ5HkLyVF+fLv74S9n8=
X-Received: by 2002:a05:6000:220e:b0:487:9a8:9f31 with SMTP id ffacd0b85a97d-4871e368258mr16252151f8f.41.1789997075058;
        Mon, 21 Sep 2026 06:24:35 -0700 (PDT)
Message-ID: <a60345de-907b-472f-94cd-faa623ec0be5@suse.com>
Date: Mon, 21 Sep 2026 15:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/5] x86/hvm: Transition to needs_tlb_flush logic,
 use per-domain ASID
To: Teddy Astie <teddy.astie@vates.tech>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
 <1785509309.8631fc262581453bbf619ec5b2062170.19fb8a5ecef000e099@vates.tech>
 <0b4a8cb9-e398-43a5-8f68-2c36d245c88d@citrix.com>
 <1789995064.8631fc262581453bbf619ec5b2062170.1a0c4051b5b00072c4@vates.tech>
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
In-Reply-To: <1789995064.8631fc262581453bbf619ec5b2062170.1a0c4051b5b00072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1789997075-FDC6D034-F6934EA9/0/0
X-purgate-type: clean
X-purgate-size: 4906

On 21.09.2026 14:51, Teddy Astie wrote:
> Le 18/09/2026 à 18:30, Ross Lagerwall a écrit :
>> On 7/31/26 3:46 PM, Teddy Astie wrote:
>>> --- a/xen/arch/x86/hvm/asid.c
>>> +++ b/xen/arch/x86/hvm/asid.c
>>> @@ -5,138 +5,115 @@
>>>    * Copyright (c) 2009, Citrix Systems, Inc.
>>>    */
>>> +#include <xen/errno.h>
>>>   #include <xen/init.h>
>>>   #include <xen/lib.h>
>>>   #include <xen/param.h>
>>> -#include <xen/sched.h>
>>> -#include <xen/smp.h>
>>> -#include <xen/percpu.h>
>>> +#include <xen/spinlock.h>
>>> +#include <xen/xvmalloc.h>
>>> +
>>> +#include <asm/bitops.h>
>>>   #include <asm/hvm/asid.h>
>>>   /* Xen command-line option to enable ASIDs */
>>>   static bool __read_mostly opt_asid_enabled = true;
>>>   boolean_param("asid", opt_asid_enabled);
>>> +bool __read_mostly asid_enabled = false;
>>> +static unsigned long __ro_after_init *asid_bitmap;
>>> +static unsigned long __ro_after_init asid_count;
>>> +static DEFINE_SPINLOCK(asid_lock);
>>> +
>>>   /*
>>> - * ASIDs partition the physical TLB.  In the current implementation 
>>> ASIDs are
>>> - * introduced to reduce the number of TLB flushes.  Each time the 
>>> guest's
>>> - * virtual address space changes (e.g. due to an INVLPG, MOV-TO-{CR3, 
>>> CR4}
>>> - * operation), instead of flushing the TLB, a new ASID is assigned.  
>>> This
>>> - * reduces the number of TLB flushes to at most 1/#ASIDs.  The biggest
>>> - * advantage is that hot parts of the hypervisor's code and data 
>>> retain in
>>> - * the TLB.
>>> - *
>>>    * Sketch of the Implementation:
>>> + * ASIDs are assigned uniquely per domain and doesn't change during 
>>> the lifecycle of the
>>> + * domain. Once vcpus are initialized and are up, we assign the same 
>>> ASID to all vcpus
>>> + * of that domain at the first VMRUN. In order to process a TLB flush 
>>> on a vcpu, we set
>>> + * needs_tlb_flush to schedule a TLB flush for the next VMRUN (e.g 
>>> using tlb control
>>> + * field of VMCB).
>>>    *
>>> - * ASIDs are a CPU-local resource.  As preemption of ASIDs is not 
>>> possible,
>>> - * ASIDs are assigned in a round-robin scheme.  To minimize the 
>>> overhead of
>>> - * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged 
>>> with a
>>> - * 64-bit generation.  Only on a generation overflow the code needs to
>>> - * invalidate all ASID information stored at the VCPUs with are run 
>>> on the
>>> - * specific physical processor.  This overflow appears after about 2^80
>>> - * host processor cycles, so we do not optimize this case, but simply 
>>> disable
>>> - * ASID useage to retain correctness.
>>> + * We reserve ASID=1 as being the ASID used when none other is 
>>> available (or with asid
>>> + * use disabled). Multiples domains may use this ASID, thus we need 
>>> to systematically
>>> + * flush the TLB for this one when switching between vCPUs with ASID=1.
>>>    */
>>> -/* Per-CPU ASID management. */
>>> -struct hvm_asid_data {
>>> -   uint64_t core_asid_generation;
>>> -   uint32_t next_asid;
>>> -   uint32_t max_asid;
>>> -   bool disabled;
>>> -};
>>> -
>>> -static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
>>> -
>>> -void hvm_asid_init(unsigned int nasids)
>>> +int __init hvm_asid_init(unsigned long nasids)
>>>   {
>>> -    static int8_t __ro_after_init g_disabled = -1;
>>> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>>> +    ASSERT(nasids);
>>> -    data->max_asid = nasids - 1;
>>> -    data->disabled = !opt_asid_enabled || (nasids <= 1);
>>> +    asid_count = nasids;
>>> +    asid_enabled = opt_asid_enabled && (nasids > 1);
>>> -    if ( g_disabled < 0 )
>>> -    {
>>> -        g_disabled = data->disabled;
>>> -        printk("HVM: ASIDs %sabled\n", data->disabled ? "dis" : "en");
>>> -    }
>>> -    else if ( g_disabled != data->disabled )
>>> -        printk("HVM: CPU%u: ASIDs %sabled\n", smp_processor_id(),
>>> -               data->disabled ? "dis" : "en");
>>> +    asid_bitmap = xvzalloc_array(unsigned long, 
>>> BITS_TO_LONGS(asid_count + 1));
>>> +    if ( !asid_bitmap )
>>> +        return -ENOMEM;
>>
>> Should there be a sanity check to avoid an excessive allocation? E.g. If
>> running under another hypervisor, it might set nasids to ~0 while with 
>> one per
>> domain we need no more than ~64k.
> 
> Indeed, I didn't consider that AMD had (and enumerates) 32-bits ASIDs. 
> Only Intel uses 16-bits VPIDs.
> 
> Limiting to 64k seems wise,

Why 64k, when there can be at most 32k domains?

> the remaining question is that I'm not sure 
> if we want to make that configurable.

Unless there are significant savings to be had, I'd say stick to the smaller
of what hardware offers and 32k.

Jan

