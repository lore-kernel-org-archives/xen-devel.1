Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A2FC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:53:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393587.1632405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEdF-0002Yv-Jl; Tue, 18 Aug 2026 07:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393587.1632405; Tue, 18 Aug 2026 07:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEdF-0002Yo-G0; Tue, 18 Aug 2026 07:53:13 +0000
Received: by outflank-mailman (input) for mailman id 1393587;
 Tue, 18 Aug 2026 07:53:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwEdE-0002Yi-2a
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:53:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwEdD-001YPy-Ba
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:53:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a840f61-e002-0a2a0a5209dd-0a2a450b9e8e-18
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:53:11 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a840f66-b7e8-0a2a450b0019-d155dd31bd50-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:53:11 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so2750211f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:53:11 -0700 (PDT)
Received: from [192.168.1.109] ([88.230.46.229])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b783d1sm10117598f8f.25.2026.08.18.00.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 00:53:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787039590; x=1787644390; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xr4ZfnWKD0xKIkpYtFflfHg4lC9aGjmdM+QlqFxml/c=;
        b=Jsd+3OithwuQMTCdZyrwFsphm0O3o2JU38M3oNF5d1gjj/TawbwGuW3EzUhTw2oY/x
         VcAWC5OxIBgr1SSqH9oeoDk6Y81TvKyPw1bkiv4ogTJMZaUMj3tnfaZooXGdhdRKWoik
         WCoYGB+z6pXSn4sinypXMrhrC/5+Jlgsi7LVqxDDo5T/Gwj+XtZ6a33SPqyjuXnBSTPb
         Os0IWhZpL817X9J0d0pF/nyeK9xYSH0Rsr28Z7+anwYeNbkxJtQPKvBLGtLlvxuBRnof
         wf91kBJp8vb6ssvDnY4/U2GEYl0zELQ/uoKKwkv7RX0R7MfdYjA1LiF6RwUwPWy31bW6
         sixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039590; x=1787644390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xr4ZfnWKD0xKIkpYtFflfHg4lC9aGjmdM+QlqFxml/c=;
        b=Qikn02Q81ctk/iNZBruMFotmpFdQTFx6KRv/EmgN0BRpq9Lt81oaxleq7T8jzf6L2u
         pao8ZaaZGplQrdYQcoDPiXSxvR99dMzUCk19TPxZLZOGk2X+zKr6LinRJh/Tk59C24Zn
         4P7p7aFva8dS0p7xN5gZZXltHkmLc/EDLa8/F312tD9+ixZWNHnBI7xGJo3UYu///B1l
         SPx+TEJln/97p7wmY1jK7OgGQf7QisrKuUZ9kYiiUldkT5wgi6pssa4SaXZcu4ZXSHkc
         T1FLi/Wl8cjrWZZbMOcBPpsKJJFHOKKMOCUFPv2rF4zayVo/C0mQm8xLhzNHzKcCkU6L
         uo0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrMrSO5EcTb55+L3kLLxMa5kzyKq+CLGE8n8uSziHLRHIxdx8WzPcKvAhe943cO8lR+aZbRRwPRAcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO6PFLaq78YHbuA91VPx+Y2EmI14IMToZMmkH/c0h8h8KS37uT
	6Qz08kZcLQ0tkyc4MddEHhuh1bcmFTeaKTToJeZTk6PiJt7RsEqDaP24
X-Gm-Gg: AR+sD10whmOAkcy+0hlGxDfuXzyJVJigvbei+X64iwUr+/3gOfy4cN3uAKyNshIQX69
	PAEL9hcpLrUN+B9mPOhAN5TX4aHbjRybr9pFmVpXIAgnaCRjJlsvOU1nSQNGgAau6BXM3kDXuVq
	2/08NhBQT/hrRMyaTlPH/4YVb4O2WFKwGAdW57yu+WtE/FzUEsii3JHoUKZQ31FuPUd8e4wdcQS
	1CJzNRFEcKBitPsvXu5b6+MiPMnRwz1JToZZLSjPsxfyV5ZM0o/FkmFI0LZycsh9gugQbrB0qrK
	kUWGB9T8knMGBmxlBIF7500CtwxcICU/69KaMZU2bP8JSE6u0sExj7gemm8AYCnmY0hbQXJd7fn
	koluGLqxHR2q3VvROm0M37vliInCBLYwWs2Yq260bncF4Z2YcNysJcBPe3wN1jUPw27+cHtLps5
	ESxw/JK3rMfC3YueIQjJVe+He0si5czYbdk6BEwnb0/85Mh+EmGZHtikbcl0Cam8zO/Rs=
X-Received: by 2002:a5d:500b:0:b0:47f:e797:41c8 with SMTP id ffacd0b85a97d-482a905d127mr7938655f8f.4.1787039590321;
        Tue, 18 Aug 2026 00:53:10 -0700 (PDT)
Message-ID: <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
Date: Tue, 18 Aug 2026 10:53:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787039591-A84CB9EA-21286693/0/0
X-purgate-type: clean
X-purgate-size: 3710


On 8/18/26 10:11, Jürgen Groß wrote:
> On 18.08.26 08:32, Furkan Caliskan wrote:
>> sched_move_domain() derives the number of units to rebuild from
>> d->max_vcpus, which is fixed at domain creation and never rolled
>> back if vcpu_create() fails partway through building a domain. So
>> d->vcpu[i] can be NULL for some i even though max_vcpus still
>> counts it - this happens if sched_alloc_udata() returns NULL.
>>
>> The per-unit loop doesn't check for this: it sets
>> unit->vcpu_list = d->vcpu[unit_id] (NULL) and hands that broken
>> unit straight to the destination scheduler's alloc_udata(),
>> which assumes vcpu_list is always valid and crashes Xen when
>> it is not.
>>
>> Reproduced by building a domain in a non-default cpupool where
>> vcpu creation fails partway through, then destroying it.
>> domain_kill() moves the domain back to the default cpupool via
>> sched_move_domain() before actually destroying it, crashing
>> inside the destination scheduler's alloc_udata() (seen in
>> Credit2's csched2_alloc_udata() -> is_idle_unit() -> NULL deref).
>>
>> Before building a unit in sched_move_domain(), check that all of
>> its vcpu slots are populated, and skip it if any are missing. The
>> rest of the function walks the vcpus that actually exist, via
>> for_each_vcpu() rather than n_units, so skipping a unit here
>> does not leave anything else out of sync.
>>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>> ---
>>   xen/common/sched/core.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index d3a0a97e1d..d542c76543 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -745,6 +745,25 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>>         for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>>       {
>> +        /*
>> +         * Skip this unit if any of its vcpus is missing. Bounded by
>> +         * max_vcpus.
>> +         */
>> +        bool vcpu_failed = false;
>> +
>> +        for ( unsigned int i = 0;
>> +              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
>> +        {
>> +            if ( !d->vcpu[unit_idx * gran + i] )
>> +            {
>> +                vcpu_failed = true;
>> +                break;
>> +            }
>> +        }
>> +
>> +        if ( vcpu_failed )
>> +            continue;
> 
> I don't think this is correct.
> 
> If there are some vcpus in the unit you will loose them (i.e. make them no
> longer be able to be scheduled), right?
> 
> For a dying domain this might be okay, but not for one still active. So I think
> you should at least verify the domain is dying, otherwise sched_move_domain()
> should just fail.
> 
> An alternative might be to fix the NULL dereferencing where needed, but this
> could become tedious.
> 
> 
> Juergen

Right. My initial attempt only checked 'd->vcpu[unit_idx*gran]'
for the head vCPU. The crash happens when unit->vcpu_list is set
to d->vcpu[unit_idx*gran] (which is NULL) and passed to 'alloc_udata()',
causing a NULL dereference. 

I expanded the loop over 'gran' to handle core-scheduling cases where a 
subsequent vCPU fails mid-unit, but as you pointed out, that drops the 
whole unit for active domain.

I'll update the patch to check d->is_dying to skip incomplete units 
only for dying domains, and have sched_move_domain() fail if an active 
domain has missing vCPUs

Furkan


