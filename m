Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7472C5DF85
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 08:51:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394917.1633532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwc0p-00012u-2u; Wed, 19 Aug 2026 08:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394917.1633532; Wed, 19 Aug 2026 08:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwc0o-00012l-Vu; Wed, 19 Aug 2026 08:51:06 +0000
Received: by outflank-mailman (input) for mailman id 1394917;
 Wed, 19 Aug 2026 08:51:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwc0n-00012f-34
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:51:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwc0m-005FeO-Bu
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:51:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a856e77-8faa-0a2a0a5109dd-0a2a450cda14-2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:51:04 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a856e78-f479-0a2a450c0019-d155dd2fd402-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:51:04 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso414486f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 01:51:04 -0700 (PDT)
Received: from [192.168.1.109] ([78.173.117.23])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1755b2sm44905995e9.11.2026.08.19.01.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 01:51:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787129464; x=1787734264; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46WDO2bhjbLW3XWaFiT9A3+j0YLlfUJtI+oF/pbYPyw=;
        b=CoT3jLpv+jcPGG6mGS+SWOgh0ugDKjMITTTBirw5jL8vS6No/S/xLeFL8Ji2VgfCHu
         BEimNec45omz6OU1oqDVbtUtFH7hO9OwOVLbvKqGRYoJf0ztY7JH7DiKA9JM1TcNHsv7
         lso/QkZVHe7Q0b906ivR5CnKC/wsF6avwpukreZ2QBZZXTHzIfXXjc0GHmsqr4/wwcFJ
         RC5UL16zW9ieNU0gcB+pEXafYkgahKB0eOLFFYqvwPy7Or/pSEWPXPoGEZ+0wo4I05vL
         xDF/kivoJ7Le0Vm36YAfavf3889RFwqiOMLT0jFC2Y3oUKkHzRxaQHpTYDeQ4ZkJe/xT
         d7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787129464; x=1787734264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46WDO2bhjbLW3XWaFiT9A3+j0YLlfUJtI+oF/pbYPyw=;
        b=ddQlWxu3shzjLr+bLmKPt9G0jkNknCrR2ZLE0spYzqFh6G9mQ9nAVILZeOPJC4E1sd
         k/RR+FrElis1GoTJmr1Pmyq6yGh0r5jIczx3bF8oZNG7aRkQMOBha1c56Bi3QM/RcODo
         7Fxtb5/+xdTDFCgjoP6gkOOqOOxInOnmdGvms1Y65kbhXSc09bjEEIX6fitBaaf3szjb
         fP40umd1NDVw2UMFrfSRqp1lkTYQC9eXHTR1be4nqCyLYzKgDj91Nr1Z56jPEhl//zjb
         T/48ff6p4YZK9zjFTTQnPVTXEjSYzGPaWEYRCC7M84KLebmpPTZbh45NZQJpmP6xRQqw
         obNw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8urqpTyxzrU7vUwXoPsOzr6e65bKUv7Mw7LYFBlZ0DWT9evoGSN2XOnN28Gx7T4dmkD8H9dEFDro=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHkNZdSfDMl43TPd3ABnPP4tU1kskillAaUu19Ig5nnKQucGBs
	rIEeZYUIG9jepw+/nyj67IU00Cu0155JXhLZD4qoP09xKZNJYfenxtdx
X-Gm-Gg: AR+sD13Uw0YAp3xDzDJRAgPSHHAW55jlq5jJ2zN3aPKhbgIOWRmpcJzkk2yfSZbms2W
	TJqabccHk/AykPnBsmp089gezxoPeFJtRRTQLzWqCRFCNiG+7Bufn9WtWouX/SelDe19bbR0zP6
	Ahvy9uTCn3Wahxc51yLE/Frj8zQc9/dE4V8ehM0h1hfym+lHont80AL77MJBKpgFasCnfXZUNGC
	cEbO1HdCs7Tu9+h+JQh8XRD4BDzK6iSrBqzvqbVPSaAOBbCO0Rwf4DRbnv463grI5VPd1Yu6/yw
	tIZGCYf7lxnMyw2C1+c0Vng/EVA6R6Xs+eVOHt6UoPs80etFUAulDpU8PMCcyCscm3FdLulec7o
	OyL9Goydd+7OsO25fPTyDKrc4HK4T+Ae01ihbi7oJ7uwto025aOGHgE0xwJ1tBGtlaItn6rW7t+
	7wtalYWfIYEhEYXJ9rGKsVSfp3V/3cnLfOY06px9a3RiJiQ0VvI/dSxt9Q9i7XWt3zXovM8/sG
X-Received: by 2002:a05:600c:6211:b0:499:a760:722f with SMTP id 5b1f17b1804b1-499aa1ba0b7mr53472815e9.13.1787129463726;
        Wed, 19 Aug 2026 01:51:03 -0700 (PDT)
Message-ID: <c221f28d-2710-4fe5-9261-081678d973c0@gmail.com>
Date: Wed, 19 Aug 2026 11:50:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
To: Jan Beulich <jbeulich@suse.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-3-frn1furkan10@gmail.com>
 <f9471a2b-6306-41fb-af52-2336af77dfc9@suse.com>
 <50005702-c719-4ba9-92f7-4d5a0dc3e0b8@gmail.com>
 <8de158e4-c9d6-47cf-887a-de8c061c5bcf@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <8de158e4-c9d6-47cf-887a-de8c061c5bcf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1787129464-03CD3A5B-F8B348C0/0/0
X-purgate-type: clean
X-purgate-size: 3525



On 8/19/26 11:32, Jan Beulich wrote:
> On 19.08.2026 09:53, Furkan Çalışkan wrote:
>>
>>
>> On 8/19/26 10:22, Jan Beulich wrote:
>>> On 19.08.2026 07:15, Furkan Caliskan wrote:
>>>> sched_init_vcpu() calls init_timer() for a vcpu's periodic_timer,
>>>> singleshot_timer and poll_timer before it can fail -- these
>>>> become live, linked into their target pCPU's per-cpu timer list
>>>> regardless of what happens next. If the sched_alloc_udata() call
>>>> further down then fails, the function frees the sched_unit via
>>>> sched_free_unit() and returns 1, but never unlinks these three
>>>> timers.
>>>>
>>>> The caller, vcpu_create(), makes this worse: on sched_init_vcpu()
>>>> returning nonzero it jumps to fail_wq, skipping fail_sched and
>>>> thus sched_destroy_vcpu() -- the only function on this path that
>>>> calls kill_timer() on them. vcpu_destroy() then frees the vcpu,
>>>> and the three timers embedded in it, while they are still linked
>>>> into that shared list.
>>>>
>>>> This silently corrupts that list. It only shows up later, when
>>>> something else touches a neighboring timer: sched_move_domain()
>>>> crashed with "Assertion 'entry->prev->next == entry' failed" on a
>>>> completely unrelated, valid vcpu's timer.
>>>>
>>>> Kill all three timers in sched_init_vcpu()'s own failure branch,
>>>> so it doesn't depend on the caller reaching sched_destroy_vcpu()
>>>> to undo what it set up itself.
>>>>
>>>> Fixes: 1ad5dad74cde ("[XEN] Re-jig VCPU initialisation -- VMX init requires generic VCPU")
>>>
>>> How did you arrive at this commit? It doesn't even touch sched_init_vcpu().
>>> All it does is move kill_timer() invocations around. I think it's
>>> d884b1077817, as that's where the "return SCHED_OP(init_vcpu, v)" was
>>> introduced (i.e. where kill_timer() would have been necessary to call in
>>> the error case). (I can't exclude the issue was pre-existing already at
>>> that time, but that would require more analysis than I think is worth to
>>> invest.)
>>
>> Commit 1ad5dad74cde moved kill_timer() calls into sched_destroy_vcpu() 
>> function, which is not called if sched_init_vcpu() fails. 
>> Before that commit, kill_timer() calls were in sched_destroy_domain(), 
>> which is called if sched_init_vcpu() returns non-zero to its caller, 
>> alloc_vcpu(). 
>>
>>         for ( i = 0; i < max; i++ )
>>         {
>>             if ( d->vcpu[i] != NULL )
>>                 continue;
>>
>>             cpu = (i == 0) ?
>>                 default_vcpu0_location() :
>>                 (d->vcpu[i-1]->processor + 1) % num_online_cpus();
>>
>>             if ( alloc_vcpu(d, i, cpu) == NULL )
>>                 goto maxvcpu_out;
>>         }
>>
>>         ret = 0;
>>
>>     maxvcpu_out:
>>         domain_unpause(d);
>>         put_domain(d);
>>     }
>>     break;
>>
>> put_domain() calls domain_destroy(), which then calls free_domain(), 
>> which ultimately calls sched_destroy_domain().
> 
> Well, yes, except that - how would that have helped for a vCPU which
> failed to be properly constructed? The function loops over all vCPU-s
> in the domain, but that wouldn't include the vCPU in question.
> alloc_vcpu() would (of course) insert the vCPU into the list only when
> sched_init_vcpu() succeeds.
> 
> Jan

Ah, I missed that compeletely - you're right.
sched_destroy_domain() wouldn't have reached the failed vCPU anyway.

In that case, d884b1077817 makes total sense here.

Furkan


