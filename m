Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA217C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 10:54:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393964.1632766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHS9-0007sA-S8; Tue, 18 Aug 2026 10:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393964.1632766; Tue, 18 Aug 2026 10:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHS9-0007s3-OD; Tue, 18 Aug 2026 10:53:57 +0000
Received: by outflank-mailman (input) for mailman id 1393964;
 Tue, 18 Aug 2026 10:53:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwHS9-0007rx-8I
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:53:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwHS8-00BNXs-Gi
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:53:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8439c2-e002-0a2a0a5209dd-0a2a4508c304-4
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:53:56 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8439c4-f659-0a2a45080019-d155802fb89b-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:53:56 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so55488425e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 03:53:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499877d5548sm271817045e9.1.2026.08.18.03.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 03:53:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1787050436; x=1787655236; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0dZ8OLjSVhKzdaD3CgraNN7o0yOzCiOTjMA4RIB0yk=;
        b=Czkavsu4WsYxQP3GrZMmg53rVVUsE0sPAIZbdd1/8XeJl2xmHNurl2ReeGhnPZUK9p
         lGMggzWdn6tMc9xdzG/UFXGmIIlHCKmLw1aB1OqbcIimiPW4pdIaZVlxfrPFUHU/YnIm
         +evJWQsYb1cmL2ueytBN8N9KVZh8Ww1wU1dlvfkvGKqXQB5eokqcvLpUGIspCJ4tluev
         cdPoFJC4+77jtewiX0ADyN5ujzkoQPFE3jYMRU5QP1iNC/jD0Y0yxFL99ZA/F3zM/Ygn
         FwgsG21JJLVcvVPSCoryvR81LOwS7F2RPJzLwkjjD4eZMg/qQ0dpU204HsMIdkmzxtvc
         7hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050436; x=1787655236;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0dZ8OLjSVhKzdaD3CgraNN7o0yOzCiOTjMA4RIB0yk=;
        b=d4rMWfBVyJ5m5Fri6jX1uaDqIAGwgqUsYQrcgDkQCMG35gVGOq633e1E+QWHk1RLXd
         y0PdpCgwT4g40+hz7ZMmQ0EQRxvOU24Yc29HJ61r0g6sW0R8ckaXceiWXJF8CofyFWYg
         QQTS41c34iX4jcDJR0DPF4+D5XPYmFqWL9MJ5ECu+YjcagUCWbOHQDvuL2fDtTkVE58m
         CDdoSbxPX0rX4Aw0p2f8V9vC8uHqbmL9YfmhRHvVFH/HcKBke8hmOCVWgWdK0pPj9rX9
         ye1uk0ITxSqJgKg3kmZOS6heZTvWEr+PsEaFGO3iWMr2DkgCtkNiU112WEgbtSUoebro
         iNaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7v+XBzshr8tz1wj9sU1geJoFI2kuEkzx6zINcPdDr/0GXTFf8JcNlBhEZdwuv+bNffhGvpGQIoVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfdX/Q6stFFlqrP/Wz42cKXbDkiDwbVV1IB8TV0x0ixJ0yzdD2
	lpCgBFOfMuSJWsueoQgP8Dkw+KUm2HTmg3Z3Vuf5UQNzqtlh5tC/Hq77h0159UzW+g==
X-Gm-Gg: AR+sD11ZcX2+kCJEqlP6KjOr4xLf5ieMIeu6haHVanItCjO0dbWidy5rZYKHbNkT+4K
	1ztCd7xa4/YNHNDHyIHNHyhOmOVhK9Z/Di1nkK3JftcAiabshiIQL+GXiHHBbGUjyMjI7SBdXwK
	4/Dr2rVk75tzk2mbKHvi1agL5pDnvBOJPUWcoNEQ3/zlacwpDf21F1Qrdi+LgUiewqTOE+lVnVc
	fKRiiLE5oVpzx6Qs24RQquNRop8W1u7/B7xkqi++k5I+hFVZRKEUdOoLGBdWY/vz7N2opUl5n0C
	z97vIsgr6NAet3WYldbhbyYaHcD78GMPLIlzfRVQd6MJkSRA+YD0YHg9gebXBVfmg6qjsYXKPfi
	D1m/K0GBzmOukeF9xQHNZc3L1zQUSPRzadU0FEp+BEcF4cxynDLC7sV3IhoNqfdNVOKBX1frmny
	ClI2pjEyeRgaidIGwcq5mqn4BiybaWcLxb/Hzy4YUjM0fuUF1nVk8DRxZSGl72eLcwaBYK9E0pU
	i3KEtaoYZWuaVPW735k4cxFAyyAudTpUQhXeou13p9kMW+gdqP8
X-Received: by 2002:a05:600c:528d:b0:499:48be:3189 with SMTP id 5b1f17b1804b1-4999fa84b7dmr141772645e9.0.1787050435812;
        Tue, 18 Aug 2026 03:53:55 -0700 (PDT)
Message-ID: <48825846-fd82-423c-9133-9221a629aa10@suse.com>
Date: Tue, 18 Aug 2026 12:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?=
 <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
 <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
 <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
 <1b281dff-d43c-4ab6-9429-e30765a93be3@suse.com>
 <cf0fe335-a45b-4721-b5cd-ac1fd293553a@citrix.com>
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
In-Reply-To: <cf0fe335-a45b-4721-b5cd-ac1fd293553a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787050436-D5B4987B-499EA0F6/0/0
X-purgate-type: clean
X-purgate-size: 4658

On 18.08.2026 12:35, Andrew Cooper wrote:
> On 18/08/2026 11:13 am, Jürgen Groß wrote:
>> On 18.08.26 12:04, Andrew Cooper wrote:
>>> On 18/08/2026 8:53 am, Furkan Çalışkan wrote:
>>>> On 8/18/26 10:11, Jürgen Groß wrote:
>>>>> On 18.08.26 08:32, Furkan Caliskan wrote:
>>>>>> sched_move_domain() derives the number of units to rebuild from
>>>>>> d->max_vcpus, which is fixed at domain creation and never rolled
>>>>>> back if vcpu_create() fails partway through building a domain. So
>>>>>> d->vcpu[i] can be NULL for some i even though max_vcpus still
>>>>>> counts it - this happens if sched_alloc_udata() returns NULL.
>>>>>>
>>>>>> The per-unit loop doesn't check for this: it sets
>>>>>> unit->vcpu_list = d->vcpu[unit_id] (NULL) and hands that broken
>>>>>> unit straight to the destination scheduler's alloc_udata(),
>>>>>> which assumes vcpu_list is always valid and crashes Xen when
>>>>>> it is not.
>>>>>>
>>>>>> Reproduced by building a domain in a non-default cpupool where
>>>>>> vcpu creation fails partway through, then destroying it.
>>>>>> domain_kill() moves the domain back to the default cpupool via
>>>>>> sched_move_domain() before actually destroying it, crashing
>>>>>> inside the destination scheduler's alloc_udata() (seen in
>>>>>> Credit2's csched2_alloc_udata() -> is_idle_unit() -> NULL deref).
>>>>>>
>>>>>> Before building a unit in sched_move_domain(), check that all of
>>>>>> its vcpu slots are populated, and skip it if any are missing. The
>>>>>> rest of the function walks the vcpus that actually exist, via
>>>>>> for_each_vcpu() rather than n_units, so skipping a unit here
>>>>>> does not leave anything else out of sync.
>>>>>>
>>>>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>>>>>> ---
>>>>>>    xen/common/sched/core.c | 19 +++++++++++++++++++
>>>>>>    1 file changed, 19 insertions(+)
>>>>>>
>>>>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>>>>> index d3a0a97e1d..d542c76543 100644
>>>>>> --- a/xen/common/sched/core.c
>>>>>> +++ b/xen/common/sched/core.c
>>>>>> @@ -745,6 +745,25 @@ int sched_move_domain(struct domain *d,
>>>>>> struct cpupool *c)
>>>>>>          for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>>>>>>        {
>>>>>> +        /*
>>>>>> +         * Skip this unit if any of its vcpus is missing. Bounded by
>>>>>> +         * max_vcpus.
>>>>>> +         */
>>>>>> +        bool vcpu_failed = false;
>>>>>> +
>>>>>> +        for ( unsigned int i = 0;
>>>>>> +              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
>>>>>> +        {
>>>>>> +            if ( !d->vcpu[unit_idx * gran + i] )
>>>>>> +            {
>>>>>> +                vcpu_failed = true;
>>>>>> +                break;
>>>>>> +            }
>>>>>> +        }
>>>>>> +
>>>>>> +        if ( vcpu_failed )
>>>>>> +            continue;
>>>>> I don't think this is correct.
>>>>>
>>>>> If there are some vcpus in the unit you will loose them (i.e. make
>>>>> them no
>>>>> longer be able to be scheduled), right?
>>>>>
>>>>> For a dying domain this might be okay, but not for one still
>>>>> active. So I think
>>>>> you should at least verify the domain is dying, otherwise
>>>>> sched_move_domain()
>>>>> should just fail.
>>>>>
>>>>> An alternative might be to fix the NULL dereferencing where needed,
>>>>> but this
>>>>> could become tedious.
>>>>>
>>>>>
>>>>> Juergen
>>>> Right. My initial attempt only checked 'd->vcpu[unit_idx*gran]'
>>>> for the head vCPU. The crash happens when unit->vcpu_list is set
>>>> to d->vcpu[unit_idx*gran] (which is NULL) and passed to
>>>> 'alloc_udata()',
>>>> causing a NULL dereference.
>>>>
>>>> I expanded the loop over 'gran' to handle core-scheduling cases where a
>>>> subsequent vCPU fails mid-unit, but as you pointed out, that drops the
>>>> whole unit for active domain.
>>>>
>>>> I'll update the patch to check d->is_dying to skip incomplete units
>>>> only for dying domains, and have sched_move_domain() fail if an active
>>>> domain has missing vCPUs
>>>
>>> I'm afraid that wont fix everything.
>>
>> Why not?
> 
> domU's in this situation do not have is_dying set.

Yet isn't the (separate) bug then that we allow a DomU to be launched when
XEN_DOMCTL_max_vcpus didn't finish setting up all vCPU-s? Or is that what
you were alluding to? Since you did say "..., and we may even want to
schedule in this scenario" - perhaps not.

Jan

