Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5A8C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 12:12:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394077.1632887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwIgL-00083N-9q; Tue, 18 Aug 2026 12:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394077.1632887; Tue, 18 Aug 2026 12:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwIgL-00083G-6n; Tue, 18 Aug 2026 12:12:41 +0000
Received: by outflank-mailman (input) for mailman id 1394077;
 Tue, 18 Aug 2026 12:12:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwIgJ-00083A-7l
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:12:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwIgI-00Bbi0-DU
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:12:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a844c36-2eae-0a2a0a5409dd-0a2a450a84e2-0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:12:38 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a844c36-f2d2-0a2a450a0019-d155dd34bcf2-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:12:38 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so2843963f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 05:12:38 -0700 (PDT)
Received: from [192.168.1.109] ([88.230.46.229])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3b51asm11719333f8f.11.2026.08.18.05.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 05:12:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787055158; x=1787659958; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kw25hz9HWZA9hmiGJ4QWM8eskztAy8yjaPcWrKaRRhY=;
        b=Tt/W2l7Mjlazb35Vyxl2yMRzb/HY8YnsDADUbZuitRr11oPHG8o48LvZEfk/ycTBen
         v3+PD4M7N8YqjuapVV3n008eK7U83EtFbvqshdDhV/YSD1N4UosIGgUmNh8jG2kOBDNA
         3RLIBV5CAmQd06JKlDirymNabPFOvdxjjiUvwcL+qwaaXQqo0q0IR6Q7Jhmy0K5lU5ZX
         6xU2YDIbbNHyKr7eHYJkVf05AfLbHzyk/DTY1FhVbmsnoaVnCibS8/pMbWXk2yNRUP65
         2Flsi3nLW5IkWwJLaD6NzdOsEu9/sz1FlqAVHk5I7dWSPoiZOCdXH6haLcA/KK4ZXYHJ
         Tf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787055158; x=1787659958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kw25hz9HWZA9hmiGJ4QWM8eskztAy8yjaPcWrKaRRhY=;
        b=NiRiY3ECKtqvu/PE0let+RJ7S4kIC4f1BxipmdhJGIFtbyrF+GMILVAHzwwpKDvatY
         QJoV6J2XOhAMDhfa3kCsGsfAF2FrC9DN0vOu8CXTYJ3K5PLPjbzUO5hS6PRvlO5Gy4K6
         9YFUS6lKQBoog+pGFERB17qFqDwR4F+C+d8IfnKgnMP9zRitJY7sYXeMaTc9E/w2lVZS
         CWnvtBqT0AhoHzfQ2ABytbnSMMdTCYu/bx/tpXRlD5bX7t6biSq2qgkwjZ5KWXsC2Rz2
         B+IV28nJypy/A/rf6a6coxLr3gX79X5iIYpQK8iiaQ/t3YycrhRaLVuMdvgEn4YR8rbI
         kt6Q==
X-Forwarded-Encrypted: i=1; AHgh+RranJClCQKvz4ZSkrOdjflkFGdBuAmfaLfmiLEwOnVhHL8m9NNWaFCmYle0J3xWKACu83/dV49zdBI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+X1WXGI9uUfJWuVz1Mx5sjNNVbQ/zeCXXqwV5MaQS7WxeZDE+
	fkHJyvRFyGb5RQZcYq5kP74sMtDmdU4AdzINHwX+p8ReoHhHqDi4n4MI
X-Gm-Gg: AR+sD12UBCft2HZm8dJBgdedN2Ie7uxk4wlNccf5DwlbzWE4N/j+o14WO+Ln77sLDhp
	VL9iY079cY7dzu19Ey6NgSI6kcxuLxy5Ydws6qdVPIaFyAyPfkClv45ucbqRpUJxmJWrS+DsREX
	PgzMNPV/tD7LqbhALDu11KP6k3Gt5ql+3UhPLFw3SoRCVPpNpAdvkdSyyZBM73WnobGL+Dr6+yn
	L+3qRH24ii/BzFVQOxkksf1uxJIkUhFttM+awsoyrjMfdkAR3/6cf7LOuaYC0vq5X+9ItI3w5f/
	ojGDOv6VcBGruhCk2eVPbA6UWPjJLlKSpGHC++zz5yXLTjfjD5a8pa+XBXGYQJkjVgUvN6rnX/Q
	J2CQFOSmxbq1JNfi1WKe/fFZQGra0KzsqEaKG951F2DEVHexUM2pkhgy/GOc7XSjCci32Ic2SE3
	7IOMo+B8ll4knGuHffJ0dnJzSe9Glpf/mDGOZW9qGUxDCg/a7aS+Qd9hWBiGqtY4MUbVOt
X-Received: by 2002:a5d:500b:0:b0:47f:e797:41c8 with SMTP id ffacd0b85a97d-482a905d127mr10618151f8f.4.1787055157666;
        Tue, 18 Aug 2026 05:12:37 -0700 (PDT)
Message-ID: <9cf716f2-cde6-484f-b371-1d4cc95e9479@gmail.com>
Date: Tue, 18 Aug 2026 15:12:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
 <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
 <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
 <1b281dff-d43c-4ab6-9429-e30765a93be3@suse.com>
 <cf0fe335-a45b-4721-b5cd-ac1fd293553a@citrix.com>
 <48825846-fd82-423c-9133-9221a629aa10@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <48825846-fd82-423c-9133-9221a629aa10@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787055158-52CDBCFC-8D7E12C6/0/0
X-purgate-type: clean
X-purgate-size: 5057



On 8/18/26 13:53, Jan Beulich wrote:
> On 18.08.2026 12:35, Andrew Cooper wrote:
>> On 18/08/2026 11:13 am, Jürgen Groß wrote:
>>> On 18.08.26 12:04, Andrew Cooper wrote:
>>>> On 18/08/2026 8:53 am, Furkan Çalışkan wrote:
>>>>> On 8/18/26 10:11, Jürgen Groß wrote:
>>>>>> On 18.08.26 08:32, Furkan Caliskan wrote:
>>>>>>> sched_move_domain() derives the number of units to rebuild from
>>>>>>> d->max_vcpus, which is fixed at domain creation and never rolled
>>>>>>> back if vcpu_create() fails partway through building a domain. So
>>>>>>> d->vcpu[i] can be NULL for some i even though max_vcpus still
>>>>>>> counts it - this happens if sched_alloc_udata() returns NULL.
>>>>>>>
>>>>>>> The per-unit loop doesn't check for this: it sets
>>>>>>> unit->vcpu_list = d->vcpu[unit_id] (NULL) and hands that broken
>>>>>>> unit straight to the destination scheduler's alloc_udata(),
>>>>>>> which assumes vcpu_list is always valid and crashes Xen when
>>>>>>> it is not.
>>>>>>>
>>>>>>> Reproduced by building a domain in a non-default cpupool where
>>>>>>> vcpu creation fails partway through, then destroying it.
>>>>>>> domain_kill() moves the domain back to the default cpupool via
>>>>>>> sched_move_domain() before actually destroying it, crashing
>>>>>>> inside the destination scheduler's alloc_udata() (seen in
>>>>>>> Credit2's csched2_alloc_udata() -> is_idle_unit() -> NULL deref).
>>>>>>>
>>>>>>> Before building a unit in sched_move_domain(), check that all of
>>>>>>> its vcpu slots are populated, and skip it if any are missing. The
>>>>>>> rest of the function walks the vcpus that actually exist, via
>>>>>>> for_each_vcpu() rather than n_units, so skipping a unit here
>>>>>>> does not leave anything else out of sync.
>>>>>>>
>>>>>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>>>>>>> ---
>>>>>>>    xen/common/sched/core.c | 19 +++++++++++++++++++
>>>>>>>    1 file changed, 19 insertions(+)
>>>>>>>
>>>>>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>>>>>> index d3a0a97e1d..d542c76543 100644
>>>>>>> --- a/xen/common/sched/core.c
>>>>>>> +++ b/xen/common/sched/core.c
>>>>>>> @@ -745,6 +745,25 @@ int sched_move_domain(struct domain *d,
>>>>>>> struct cpupool *c)
>>>>>>>          for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>>>>>>>        {
>>>>>>> +        /*
>>>>>>> +         * Skip this unit if any of its vcpus is missing. Bounded by
>>>>>>> +         * max_vcpus.
>>>>>>> +         */
>>>>>>> +        bool vcpu_failed = false;
>>>>>>> +
>>>>>>> +        for ( unsigned int i = 0;
>>>>>>> +              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
>>>>>>> +        {
>>>>>>> +            if ( !d->vcpu[unit_idx * gran + i] )
>>>>>>> +            {
>>>>>>> +                vcpu_failed = true;
>>>>>>> +                break;
>>>>>>> +            }
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        if ( vcpu_failed )
>>>>>>> +            continue;
>>>>>> I don't think this is correct.
>>>>>>
>>>>>> If there are some vcpus in the unit you will loose them (i.e. make
>>>>>> them no
>>>>>> longer be able to be scheduled), right?
>>>>>>
>>>>>> For a dying domain this might be okay, but not for one still
>>>>>> active. So I think
>>>>>> you should at least verify the domain is dying, otherwise
>>>>>> sched_move_domain()
>>>>>> should just fail.
>>>>>>
>>>>>> An alternative might be to fix the NULL dereferencing where needed,
>>>>>> but this
>>>>>> could become tedious.
>>>>>>
>>>>>>
>>>>>> Juergen
>>>>> Right. My initial attempt only checked 'd->vcpu[unit_idx*gran]'
>>>>> for the head vCPU. The crash happens when unit->vcpu_list is set
>>>>> to d->vcpu[unit_idx*gran] (which is NULL) and passed to
>>>>> 'alloc_udata()',
>>>>> causing a NULL dereference.
>>>>>
>>>>> I expanded the loop over 'gran' to handle core-scheduling cases where a
>>>>> subsequent vCPU fails mid-unit, but as you pointed out, that drops the
>>>>> whole unit for active domain.
>>>>>
>>>>> I'll update the patch to check d->is_dying to skip incomplete units
>>>>> only for dying domains, and have sched_move_domain() fail if an active
>>>>> domain has missing vCPUs
>>>>
>>>> I'm afraid that wont fix everything.
>>>
>>> Why not?
>>
>> domU's in this situation do not have is_dying set.
> 
> Yet isn't the (separate) bug then that we allow a DomU to be launched when
> XEN_DOMCTL_max_vcpus didn't finish setting up all vCPU-s? Or is that what
> you were alluding to? Since you did say "..., and we may even want to
> schedule in this scenario" - perhaps not.
> 
> Jan

When vcpu_create() returns NULL, XEN_DOMCTL_max_vcpus returns an
error. Once the toolstack sees that, it immediately issues the 
kill hypercall. AFAIK, a domain in that state will simply be killed
and never actually launched.

Furkan


