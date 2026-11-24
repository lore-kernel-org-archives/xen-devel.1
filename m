Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE8606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZFYCM0Ym
Received: from list by lists.xenproject.org with outflank-mailman.1501131.1697172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVreA-0005W2-SK; Tue, 24 Nov 2026 14:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501131.1697172; Tue, 24 Nov 2026 14:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVreA-0005Vv-PN; Tue, 24 Nov 2026 14:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1501131;
 Tue, 24 Nov 2026 14:37:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVre9-0005Vp-Oj
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:37:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVre9-005hco-3T
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:37:25 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b05a119-bab6-0a2a0a5309dd-0a2a4503afca-24
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:37:24 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b05a124-fae8-0a2a45030019-d1558034c456-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:37:24 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so40445565e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 06:37:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853ca452sm430567475e9.15.2026.11.24.06.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 06:37:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795531044; x=1796135844; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySWrV4PJ1u06jC12dZLSaYpHRuZEDtJsinMGAg68/64=;
        b=ZFYCM0Ym90twDYVe58Xhf8zeRbuoGYQwoBusKUSd3TzatyyFDR8s/tjEhAmDr7+vFJ
         2GC4pbnuzfWNaeNVNGDPqT+zBbyiIfwpv1NkJl4bZJhIPiBXZ8pFiEuxeghYGjPjhvq7
         4RC8XXz7TavwvdmHJ1eX41NNn4DnKEvWAz5ggxr1zR/LzvEWYVmtvV60kUes11HXOX7t
         OFo+9AZsu0ojbnU+Zr7m8/q3xnxn7tBUg0AA+hLJ2sJBu9Rs1p3jv9xwsuYIO1Q+yM1F
         /hjFasjcR6tA75gEhyb7JPvvPR2b/6Rda5D9veYYAQBKXeAM3I7pDCar+HBJ4kxZbm7J
         MqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531044; x=1796135844;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySWrV4PJ1u06jC12dZLSaYpHRuZEDtJsinMGAg68/64=;
        b=nnMxh+3dDICSBs80fL1xZl0yt0KdTTtPMKCGWHX19tufDHsbD2pSpqKl1QhJsNXmgY
         A5SbQrVKWKxHph9xXIJvCvxL0jYk/Qps4IzQlR40wcn24+vcueiGwAb1oAHwyyUPItoS
         pwukfX6tmdbgr5Oa9RRHjZEuGL9dJeNraLFRmG4P5LCNNlzdlgcu6hIjv1Qz8NVvJPS8
         ukKCtMzhAp+VGUoN7S6+SGKzPonvCdJ3jDePnPDSdwiInl6BD5LPelHhxrqajz0f1yNG
         d49Zhy7wWs6kIrH1vmhCnyzfV1x36mQ1BwWgEdJzocCnDYp81vcoNCukBOoMUjeQ9i9s
         BAeg==
X-Forwarded-Encrypted: i=1; AL+hErFW7g49tNB7apoezcxA2WBfFSOgGaD+CRCNJ8im9CaJrYPx2tm1zz5BvBZLqfw1p4utDugRlsqLrGk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/YxPqv/PswlhkwOPYPMeA7KwC3UVs6gvkLuQElAG1dFypux7tv
	Wdumznz2CnR94OfodsZ2+12nKey0h2vZs6H2zvWAX/KD2z7TmCpn21FQsa0PuWThcw==
X-Gm-Gg: AZFdTZe6wvwJFyRnsSl4DzErknFTRQ9+UosaSMfjhPo/EiFcG/oSqLm3JJfCrLwTr2w
	o81as7AwY5Hc6elLOKUJFqma+WOuTZ/cvsxuaBSjGV5dUGXjADPrGl/35Lxc+RWXgdQFqRCYHxB
	f8NtrU7IpW7zhEzsRREVKtY7foKp2ox80oVzbvF1QkU3cn2QB+E1u2h0gtrauCfp0hzrEfbsaYD
	HuAys0y+tGnW5H4QAeKjYHq9tXnjDK45JkoVFgmnNIMc8a1iHw4rWv604S5IKSuIQcTqUlwRSe7
	lLOYNK0Z1vGokm1CWgnXTzjSAqODqCs6UnkTv29L4uHjYhB5CYct2Q/7ZIojyCUah4FPMNA8G8U
	EmL5z6Xk9xnGn318arQvtOGUj/vRNc8NBVxpJ9FUeNmw8uPWfIeK9hb29JGfxpajvVIZBcNYvK4
	5up0q9qqViqufNeUvj0VGH5/m4XT8SpXyYAC3tFrGTzF2XQX86qTZy1waW2xtRqWwKmTMFt2Y/v
	1vfeRkbON5Vkf3XdjkuwNV+vAhLtJmvK8vOxntMAO20K+8tWt12zBgtem9UZJyIDFD4QaV578sD
	ZXEClp+SuPo61C6VVa04aIzj3JYWoij6cWqGg4m3NB9X7lyci2Jrp43aJSMGrsMigt4gVrdq8bu
	9GuiaDYEQOLYglCl5DQ==
X-Received: by 2002:a05:600c:5303:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb8880767amr271239625e9.9.1795531044353;
        Tue, 24 Nov 2026 06:37:24 -0800 (PST)
Message-ID: <baddd6ac-5aa7-468f-947a-65dcc24963e0@suse.com>
Date: Tue, 24 Nov 2026 15:37:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix potential NULL dereference in
 sched_move_domain()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261124122004.2487366-1-jgross@suse.com>
 <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>
 <01f14efb-5c70-40a3-b362-66c99d2c699d@suse.com>
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
In-Reply-To: <01f14efb-5c70-40a3-b362-66c99d2c699d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795531044-75C804E9-CA51632D/10/78276251493
X-purgate-type: spam
X-purgate-size: 2996
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24.11.2026 15:07, Jürgen Groß wrote:
> On 24.11.26 14:57, Jan Beulich wrote:
>> On 24.11.2026 13:20, Juergen Gross wrote:
>>> If a dying domain has not all of its vcpus filled and it is moved from
>>> a cpupool with gran=socket to one with gran=core,
>>
>> Why would a dying domain need moving in this way in the first place?
> 
> This is for avoiding a zombie domain blocking removal of a cpupool.

Ah, I see. Maybe say "zombie" then in place of just "dying"?

>> Possibly connected to this, ...
>>
>>> it might happen that
>>> during assignment of the new units to the vcpus a NULL pointer is
>>> being dereferenced:
>>>
>>> - system has 2 sockets with 2 cores each, each core has 2 threads
>>> - Pool-0 has gran=core, other cpupool has gran=socket
>>> - domain with max_vcpus=4 has only 3 vcpus and is in cpupool with
>>>    gran=socket
>>> - domain is dying and is moved to Pool-0
>>> - in sched_move_domain() this results in vcpu_failed being set to
>>>    true for the last unit of the domain, resulting in the unit not
>>>    being allocated ("continue" statement is being hit)
>>> - in the for_each_vcpu() loop of sched_move_domain() for vcpu 2
>>>    the unit pointer will be set to NULL, as unit->next_in_list is not
>>>    populated due to above "continue"
>>>
>>> Fixes: 4835c078e5cf ("xen/sched: core: skip missing vcpu slots in sched_move_domain()")
>>> Reported-by: Roger Pau Monné <roger.pau@amd.com>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   xen/common/sched/core.c | 11 +++++++----
>>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>> index 10b6eecccd..ee7077b870 100644
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -830,10 +830,13 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>>>           if ( unit->unit_id + gran == v->vcpu_id )
>>>               unit = unit->next_in_list;
>>>   
>>> -        unit->state_entry_time = old_unit->state_entry_time;
>>> -        unit->runstate_cnt[v->runstate.state]++;
>>> -        /* Temporarily use old resource assignment */
>>> -        unit->res = get_sched_res(new_cpu);
>>> +        if ( unit )
>>> +        {
>>> +            unit->state_entry_time = old_unit->state_entry_time;
>>> +            unit->runstate_cnt[v->runstate.state]++;
>>> +            /* Temporarily use old resource assignment */
>>> +            unit->res = get_sched_res(new_cpu);
>>> +        }
>>>   
>>>           v->sched_unit = unit;
>>
>> ... is this field becoming NULL really okay? Perhaps just for dying domains
>> it is, but then the original question remains why they would need moving in
>> the first place.
> 
> Not setting it would leave a potential UAF, as the old unit will be freed.

Sure, it needs setting, but setting to NULL when NULL may not work everywhere
wouldn't be much better than leaving a dangling pointer.

Jan

