Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE08C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 12:20:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394101.1632915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwInP-0001PC-Et; Tue, 18 Aug 2026 12:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394101.1632915; Tue, 18 Aug 2026 12:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwInP-0001P5-BI; Tue, 18 Aug 2026 12:19:59 +0000
Received: by outflank-mailman (input) for mailman id 1394101;
 Tue, 18 Aug 2026 12:19:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwInN-0001Ox-Ul
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:19:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwInM-006As8-N3
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:19:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a844dea-2eae-0a2a0a5409dd-0a2a4509e932-14
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:19:56 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a844dec-be1a-0a2a45090019-d155dd2cf0df-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:19:56 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f59f25ec4so1947135f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 05:19:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a6c449dbsm11037872f8f.8.2026.08.18.05.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 05:19:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1787055596; x=1787660396; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=647W8yleiNXsvO+eqQLwTgxj/0ySZYHUKiwnSDmJC74=;
        b=ZHM09KS+VzEcHaizkgxlsb4MuqEZiuhrptewxrpi7zA3v5nzYPbvzhPMhV+eF0l3sI
         OwWuTZGtNRJ3dXgZXePPPqisbHNscQouBLPyBX17/InRBR5VLJoPN+O/WjTDATaPzv6m
         MDjc7gox/ZOFBpLrJXF+1H+H/o6hMUjXUsWk2/bJ8XtZh5yxZhI3lYv6F9ufN4KAtrQA
         qIUw11obg8IHOmzdLjz4PTjT6W9RHV5VwpShV9HgDD1cSL6u09uvgWOsoDLvsje3hIvv
         rQI+xBOaB9EN+rEV4VcqQ2n4ueAkFE02y1CJuHwHp3Cysoh8ZIE7gfDnj2eKFJj0rmhf
         HqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787055596; x=1787660396;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=647W8yleiNXsvO+eqQLwTgxj/0ySZYHUKiwnSDmJC74=;
        b=PPrcg+pvDlML53MKto2LqSjaOqRupgiEiEzksLDDJUmfhEwAL1b0zo7pjn+qS7EJ2s
         yUb1DPvLsZtijRfHPFCOf5niM4u6j8WIpc42DGTcYhBVvIAQJRnyNbF2LL+JC7mTN+id
         /K7NjN/kgVW3WrANfr+HYFHTFjMxZEbF/Yli6eHHTdxcrEIflhZJ57NctJ3/OHeFaUk1
         oSbHQ9huQh/0tdkUJAhTVTpZb0m62/cRQFw/uqUPdMRW2FFUVxfgkp2nLLjzPB4t30VQ
         ne08Q9mW6aOKm+2CLCSgRg+zF8n782tN5dNEqc2WwZmLZ5K4MSdCK7SkexMDExVSo7Gp
         p4UA==
X-Forwarded-Encrypted: i=1; AHgh+RrF9/8d94RctHMDnAe0RLz9xtlEmd4WwYcVLrMJ6PqDjHiRw3UcTmtkmqkvlfpq/OlQ6vsFv7eHqFk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6kWsUb8QUwMDcfFv1M4Q214xgZA+SQSAGqbdv3ZKc6xQLIkLS
	OxhgoebTtT3DAhuQlg9lqtUcsU+CNV5jBZAs8SDayzgyJ66hWXhi5UmS+wh5u390QTYNV7UYWZL
	ARDbNhA==
X-Gm-Gg: AR+sD12KlhwzDueQ5+r6H2DHc65N91kyManvD7VaafdIiC+A7pnUEp4mKt1l0T7Hp3O
	lMcIjFvPYyqHvNsqkXHnjbZV+D0GEirAlKWSImYi/0xfHOT8DEL7qHVfK+yabAkyak4z2F/57nX
	EXITNi+h85T/kNUpyhG0AS8kLYp9k7HmOczrnz63xYJ8w8wTox+YNg5Bt2OP8VzyOTM3iAksy73
	1beZCrirFQ3KO7O2e4XBCH+upL+s38HqA7Fj6d9dutYfBEF56oDIhpjjCpoi8Ls3A+KlKTdC2KX
	7Vg9Wz5Bq01NpMqZ2lX45/vuvYKFsjJilxb02PtYmsvz0VV9VhnkEf5N64Zf+k6y/qYKF18unmo
	mSWpx/XxP7NASbmvUZyz/ah67SDFKpN6IX0t1+zfLeaKazdVG2uqd4HYLD/TtITYFSLwVo+3c00
	UYDwWn/YCdXnl6vooRv1pSEcGzuWpDHpDiAJn2P17dsdnZtepZbfQteAvsAoYPuvW+Nfv05mTC4
	hqTiOByeJvVfm0T/obyeVdsQ2d+nA7K2SFoPM5AOjJDQdtLitff
X-Received: by 2002:a5d:5e90:0:b0:47f:8183:e9b8 with SMTP id ffacd0b85a97d-481607656b7mr52199325f8f.22.1787055596032;
        Tue, 18 Aug 2026 05:19:56 -0700 (PDT)
Message-ID: <7faa6208-1b72-49bf-b4b0-c509a6572ceb@suse.com>
Date: Tue, 18 Aug 2026 14:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
 <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
 <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
 <1b281dff-d43c-4ab6-9429-e30765a93be3@suse.com>
 <cf0fe335-a45b-4721-b5cd-ac1fd293553a@citrix.com>
 <48825846-fd82-423c-9133-9221a629aa10@suse.com>
 <9cf716f2-cde6-484f-b371-1d4cc95e9479@gmail.com>
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
In-Reply-To: <9cf716f2-cde6-484f-b371-1d4cc95e9479@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787055596-BCCCF034-6A834623/0/0
X-purgate-type: clean
X-purgate-size: 5262

On 18.08.2026 14:12, Furkan Çalışkan wrote:
> 
> 
> On 8/18/26 13:53, Jan Beulich wrote:
>> On 18.08.2026 12:35, Andrew Cooper wrote:
>>> On 18/08/2026 11:13 am, Jürgen Groß wrote:
>>>> On 18.08.26 12:04, Andrew Cooper wrote:
>>>>> On 18/08/2026 8:53 am, Furkan Çalışkan wrote:
>>>>>> On 8/18/26 10:11, Jürgen Groß wrote:
>>>>>>> On 18.08.26 08:32, Furkan Caliskan wrote:
>>>>>>>> sched_move_domain() derives the number of units to rebuild from
>>>>>>>> d->max_vcpus, which is fixed at domain creation and never rolled
>>>>>>>> back if vcpu_create() fails partway through building a domain. So
>>>>>>>> d->vcpu[i] can be NULL for some i even though max_vcpus still
>>>>>>>> counts it - this happens if sched_alloc_udata() returns NULL.
>>>>>>>>
>>>>>>>> The per-unit loop doesn't check for this: it sets
>>>>>>>> unit->vcpu_list = d->vcpu[unit_id] (NULL) and hands that broken
>>>>>>>> unit straight to the destination scheduler's alloc_udata(),
>>>>>>>> which assumes vcpu_list is always valid and crashes Xen when
>>>>>>>> it is not.
>>>>>>>>
>>>>>>>> Reproduced by building a domain in a non-default cpupool where
>>>>>>>> vcpu creation fails partway through, then destroying it.
>>>>>>>> domain_kill() moves the domain back to the default cpupool via
>>>>>>>> sched_move_domain() before actually destroying it, crashing
>>>>>>>> inside the destination scheduler's alloc_udata() (seen in
>>>>>>>> Credit2's csched2_alloc_udata() -> is_idle_unit() -> NULL deref).
>>>>>>>>
>>>>>>>> Before building a unit in sched_move_domain(), check that all of
>>>>>>>> its vcpu slots are populated, and skip it if any are missing. The
>>>>>>>> rest of the function walks the vcpus that actually exist, via
>>>>>>>> for_each_vcpu() rather than n_units, so skipping a unit here
>>>>>>>> does not leave anything else out of sync.
>>>>>>>>
>>>>>>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>>>>>>>> ---
>>>>>>>>    xen/common/sched/core.c | 19 +++++++++++++++++++
>>>>>>>>    1 file changed, 19 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>>>>>>> index d3a0a97e1d..d542c76543 100644
>>>>>>>> --- a/xen/common/sched/core.c
>>>>>>>> +++ b/xen/common/sched/core.c
>>>>>>>> @@ -745,6 +745,25 @@ int sched_move_domain(struct domain *d,
>>>>>>>> struct cpupool *c)
>>>>>>>>          for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>>>>>>>>        {
>>>>>>>> +        /*
>>>>>>>> +         * Skip this unit if any of its vcpus is missing. Bounded by
>>>>>>>> +         * max_vcpus.
>>>>>>>> +         */
>>>>>>>> +        bool vcpu_failed = false;
>>>>>>>> +
>>>>>>>> +        for ( unsigned int i = 0;
>>>>>>>> +              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
>>>>>>>> +        {
>>>>>>>> +            if ( !d->vcpu[unit_idx * gran + i] )
>>>>>>>> +            {
>>>>>>>> +                vcpu_failed = true;
>>>>>>>> +                break;
>>>>>>>> +            }
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        if ( vcpu_failed )
>>>>>>>> +            continue;
>>>>>>> I don't think this is correct.
>>>>>>>
>>>>>>> If there are some vcpus in the unit you will loose them (i.e. make
>>>>>>> them no
>>>>>>> longer be able to be scheduled), right?
>>>>>>>
>>>>>>> For a dying domain this might be okay, but not for one still
>>>>>>> active. So I think
>>>>>>> you should at least verify the domain is dying, otherwise
>>>>>>> sched_move_domain()
>>>>>>> should just fail.
>>>>>>>
>>>>>>> An alternative might be to fix the NULL dereferencing where needed,
>>>>>>> but this
>>>>>>> could become tedious.
>>>>>>>
>>>>>>>
>>>>>>> Juergen
>>>>>> Right. My initial attempt only checked 'd->vcpu[unit_idx*gran]'
>>>>>> for the head vCPU. The crash happens when unit->vcpu_list is set
>>>>>> to d->vcpu[unit_idx*gran] (which is NULL) and passed to
>>>>>> 'alloc_udata()',
>>>>>> causing a NULL dereference.
>>>>>>
>>>>>> I expanded the loop over 'gran' to handle core-scheduling cases where a
>>>>>> subsequent vCPU fails mid-unit, but as you pointed out, that drops the
>>>>>> whole unit for active domain.
>>>>>>
>>>>>> I'll update the patch to check d->is_dying to skip incomplete units
>>>>>> only for dying domains, and have sched_move_domain() fail if an active
>>>>>> domain has missing vCPUs
>>>>>
>>>>> I'm afraid that wont fix everything.
>>>>
>>>> Why not?
>>>
>>> domU's in this situation do not have is_dying set.
>>
>> Yet isn't the (separate) bug then that we allow a DomU to be launched when
>> XEN_DOMCTL_max_vcpus didn't finish setting up all vCPU-s? Or is that what
>> you were alluding to? Since you did say "..., and we may even want to
>> schedule in this scenario" - perhaps not.
> 
> When vcpu_create() returns NULL, XEN_DOMCTL_max_vcpus returns an
> error. Once the toolstack sees that, it immediately issues the 
> kill hypercall.

That's what the one toolstack you look at does. At the hypervisor level, what
a toolstack may do after a failure is entirely unknown.

Jan

