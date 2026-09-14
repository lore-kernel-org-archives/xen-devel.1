Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C24C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 11:15:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420789.1647013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64ek-0003jC-Pg; Mon, 14 Sep 2026 11:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420789.1647013; Mon, 14 Sep 2026 11:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64ek-0003j5-MF; Mon, 14 Sep 2026 11:15:26 +0000
Received: by outflank-mailman (input) for mailman id 1420789;
 Mon, 14 Sep 2026 11:15:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x64ej-0003iz-TL
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:15:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x64ej-008Xww-9j
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 13:15:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7d746-8faa-0a2a0a5109dd-0a2a450bc820-34
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:15:25 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7d74c-b7e8-0a2a450b0019-4a7de18cf653-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:15:25 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccff31419so15569625e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 04:15:25 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.101.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e6fe9d3e3sm127666515e9.0.2026.09.14.04.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 04:15:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789384524; x=1789989324; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbuipxVR0TzPXP53d+scSiLX1pqUdF3Ft9Tt//zTHeM=;
        b=HK69w/MwOrFhPYIuUClS+s/SZ8SVHG7ZOjrNYFnH1kcTSN9B4K/TuDr9woVOXB/QrP
         MFMTRDjsVlVV1qw5rM8aFTSZFzPouLgTEABh2zzw5YLEeUm3tUhy5wKj+fnt5u6ekfMR
         dQtiRSbBil0+WVjiJF3AajWwUPhPXV1vdTh7/0Q7Lsm9pGS5B4vtCZwsWouzCB4nM1mZ
         Ie9URnw8eAkpjxxiauFNO+8A7JNueRLPvhPmStl08nxnABwirp+K/2jNva74enaSbPMo
         unfsoGSOsb+uE0L3NBkUXsY/DbW+QikBgegDaKT1TBoiqj9nROZu6LLQoAD/lH/sS0UA
         HZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384524; x=1789989324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbuipxVR0TzPXP53d+scSiLX1pqUdF3Ft9Tt//zTHeM=;
        b=A6Njxahobo9pQoCQPyeLUyEfbG8gIx7qH1ZZs1nmMO3olckGnLnR4m/5Ypwc04WKsa
         eMK9wSLFb1TPyiTGRY8/6wjmzPdcFr3jd48sFaRhefd0/6WMH01VDJkxuI1V4l5kVEDY
         46AO8eLdx664oSz7m3XqfrvpkdcJ7w+5oatH+js1wR1T/zyZANSgu4+kjOspZCNannH0
         tF2At1iPwZtLDGf3A9S3mnaCOl+eISwZLN8ztFWTyFVSCmPKTCHruBaasZ+ef3sfMLaD
         B3Gq3iLxxYj7QHmTKAOt6nhQGYG638CZXQ3M7UnsJrKhksID2Wf617B+/1e1N5pHmmsh
         DGEg==
X-Forwarded-Encrypted: i=1; AKwUvBx+cSup3FYCsBDqMKbiIdY9cMVEAnQQAxVuPNYqDw4BEde7Ivk3RkkUlNHWRPHZPIrmucDvt/GMgng=@lists.xenproject.org
X-Gm-Message-State: AFuF++nv5NS0Wivv5o6fP411PVOGKZoB9ikMwAQp83jOUTa2GOgkAvpL
	5VWBr/vFW91w/JmiIxsdE569id6dSFUwPsbh7m6Wn6SQ0U5Iua39iowx
X-Gm-Gg: AYBFou3lnnkCxv99CoKAV3pi3zx0TUUfSSmAhe75GGhWaMdO6mG/BjnylBT7vGDUvUh
	8i/zEwqZbjDmQQPvwohKMTFxh+ixfJWBCKkss6nxNksHmsNQuTWbkdtGXbwt3SgyzPE8rWnu05O
	8r2Ta28Xmjh5lEPYPZJuWy1I+FtdAyPWlfWIknIuloE0Ce3jlM9MAo01s1p5hLx/XAnYsuuvcgz
	hBwwU0jrsaJFBAIxE3y1gJcVNIZ3rL5IBFpU+iBl64wUsDk9EsmwIAvYeKs8fZPlDvGPGEPWaSn
	mR3JeoNJJTyxURP/F/K+PFfeohYhICVLygg9xUsexvm61rnVJ7X3YGjWOvtofk4NYhzMhUlGhMg
	g2+Ce/DQjeMQBn+MhXowDfVRreHVamHpZ0i9NPyVUxmm4jwWdi1gcF6YZpXWEFIfhlNvJcIqj+Q
	JIqlcOmAbnVfaWbCXbmzNZiO2xLcuC8t/camNWH1x86FgWBj2l10uuw4O2zwsLe5x89RUr+by1m
	ivm9Q/3
X-Received: by 2002:a05:600c:698d:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49e7a68cc4cmr25373795e9.20.1789384524460;
        Mon, 14 Sep 2026 04:15:24 -0700 (PDT)
Message-ID: <f1841dcc-0a17-43c4-9759-db2c11d75ec4@gmail.com>
Date: Mon, 14 Sep 2026 14:15:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission
 control
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-2-frn1furkan10@gmail.com>
 <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789384525-188C99EA-8840692F/0/0
X-purgate-type: clean
X-purgate-size: 8932


On 9/14/26 12:10, Juergen Gross wrote:
> On 26.08.26 06:57, Furkan Caliskan wrote:
>> RTDS has no admission control: nothing stops the sum of all admitted
>> units' (budget/period) reservations in a cpupool from exceeding
>> what its pCPUs can actually provide. Once that happens, none of the
>> EDF deadline guarantees this scheduler is built around still hold
>> for the units sharing that pool.
>>
>> Introduce admission control to prevent this: reject a reservation
>> whenever admitting it would push a cpupool's units over its capacity.
>> Track a running utilization total per cpupool, and enforce it in
>> rt_alloc_udata()/rt_free_udata(), the paired lifecycle hooks for a
>> unit's creation and destruction. This catches the default
>> period/budget every new unit gets.
>>
>> Utilization is represented as a fixed-point value: budget is
>> left shifted by RTDS_UTIL_SHIFT (20 bits) and divided by period.
>> A plain "(budget << RTDS_UTIL_SHIFT) / period" risks overflowing
>> the multiply for large enough budgets. Rather than widen the
>> arithmetic to tolerate any input, the input itself is bounded:
>> rt_validate_params() rejects any budget above RTDS_MAX_BUDGET,
>> chosen as the largest value that can be left-shifted by
>> RTDS_UTIL_SHIFT without overflowing 64 bits, so the shift in
>> rt_unit_utilization() can never overflow.
>>
>> A cpupool's capacity rt_utilization_cap() scales with the number of
>> scheduling resources in it. It is calculated as:
>> (number of sched_resources * RTDS_UTIL_SCALE * RTDS_UTIL_CAP_PCT / 100),
>> where RTDS_UTIL_CAP_PCT controls how much of that capacity can
>> actually be reserved; at 100% (its current value), all of it can be.
>>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>> ---
>>   xen/common/sched/rt.c | 105 +++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 104 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
>> index 0e9f04ea72..9126320801 100644
>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -114,6 +114,24 @@
>>    */
>>   #define RTDS_MAX_PRIORITY_LEVEL (~0U)
>>   +/*
>> + * Fixed-point scale for utilization (budget/period)
>> + */
>> +#define RTDS_UTIL_SHIFT     20
>> +#define RTDS_UTIL_SCALE     (1ULL << RTDS_UTIL_SHIFT)
>> +
>> +/*
>> + * Largest budget safe to left-shift by RTDS_UTIL_SHIFT without
>> + * overflowing 64 bits. Enforced in rt_validate_params().
>> + */
>> +#define RTDS_MAX_BUDGET_BITS  (64 - RTDS_UTIL_SHIFT)
>> +#define RTDS_MAX_BUDGET       ((1ULL << RTDS_MAX_BUDGET_BITS) - 1)
>> +
>> +/*
>> + * % of a cpupool's sched_resource capacity admitted units may sum up to.
>> + */
>> +#define RTDS_UTIL_CAP_PCT   100
>> +
>>   /*
>>    * UPDATE_LIMIT_SHIFT: a constant used in rt_update_deadline(). When finding
>>    * the next deadline, performing addition could be faster if the difference
>> @@ -195,6 +213,9 @@ struct rt_private {
>>       struct list_head replq;     /* ordered list of units that need replenishment */
>>         cpumask_t tickled;          /* cpus been tickled */
>> +
>> +    /* Sum of admitted units' (budget/period), scaled by RTDS_UTIL_SCALE */
>> +    uint64_t utilization;
>>   };
>>     /*
>> @@ -635,6 +656,54 @@ replq_reinsert(const struct scheduler *ops, struct rt_unit *svc)
>>           set_timer(&rt_priv(ops)->repl_timer, rearm_svc->cur_deadline);
>>   }
>>   +/*
>> + * budget << RTDS_UTIL_SHIFT can't overflow: rt_validate_params()
>> + * caps budget at RTDS_MAX_BUDGET. period == 0 means "no
>> + * reservation" (a unit being removed), not an error.
>> + */
>> +static uint64_t
>> +rt_unit_utilization(s_time_t period, s_time_t budget)
>> +{
>> +    if ( period <= 0 )
>> +        return 0;
>> +
>> +    return ((uint64_t)budget << RTDS_UTIL_SHIFT) / (uint64_t)period;
>> +}
>> +
>> +/*
>> + * Utilization capacity of the cpupool domain d resides in.
>> + */
>> +static uint64_t
>> +rt_utilization_cap(const struct domain *d)
>> +{
>> +    unsigned int cpus = cpumask_weight(cpupool_domain_master_cpumask(d));
>> +
>> +    return (uint64_t)cpus * RTDS_UTIL_SCALE * RTDS_UTIL_CAP_PCT / 100;
>> +}
>> +
>> +/*
>> + * Replaces a unit's reservation and updates prv->utilization
>> + * to match. Growth that would push utilization over the
>> + * cpupool's cap is refused. Removing a unit or shrinking
>> + * a unit's reservation always succeed.
>> + */
>> +static int
>> +rt_admission_test(struct rt_private *prv, const struct domain *d,
>> +           s_time_t old_period, s_time_t old_budget,
>> +           s_time_t new_period, s_time_t new_budget)
> 
> I think the function name isn't appropriate. The function doesn't test only, it
> is setting the utilization, too.
> 
> What about rt_try_set_utilization() instead? And make the return type bool
> (true on success).
> 
>> +{
>> +    uint64_t old_util = rt_unit_utilization(old_period, old_budget);
>> +    uint64_t new_util = rt_unit_utilization(new_period, new_budget);
>> +    uint64_t total    = prv->utilization - old_util + new_util;
>> +
>> +    if ( new_util > old_util && total > rt_utilization_cap(d) )
>> +        return -EINVAL;
>> +
>> +    prv->utilization = total;
>> +
>> +    return 0;
>> +}
>> +
>>   /*
>>    * Pick a valid resource for the unit vc
>>    * Valid resource of an unit is intesection of unit's affinity
>> @@ -864,6 +933,7 @@ rt_free_domdata(const struct scheduler *ops, void *data)
>>   static void * cf_check
>>   rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
>>   {
>> +    struct rt_private *prv = rt_priv(ops);
>>       struct rt_unit *svc;
>>         /* Allocate per-UNIT info */
>> @@ -881,9 +951,30 @@ rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
>>       __set_bit(__RTDS_extratime, &svc->flags);
>>       svc->priority_level = 0;
>>       svc->period = RTDS_DEFAULT_PERIOD;
>> +
>>       if ( !is_idle_unit(unit) )
>> +    {
>> +        unsigned long flags;
>> +        int rc;
>> +
>>           svc->budget = RTDS_DEFAULT_BUDGET;
>>   +        spin_lock_irqsave(&prv->lock, flags);
>> +        rc = rt_admission_test(prv, unit->domain, 0, 0,
>> +                                svc->period, svc->budget);
>> +        spin_unlock_irqrestore(&prv->lock, flags);
>> +
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_WARNING
>> +                   "RTDS: ADMISSION CONTROL: refusing unit %u of d%d,"
>> +                   " would exceed utilization capacity of the cpupool\n",
>> +                   unit->unit_id, unit->domain->domain_id);
>> +            xfree(svc);
>> +            return NULL;
>> +        }
>> +    }
>> +
>>       SCHED_STAT_CRANK(unit_alloc);
>>         return svc;
>> @@ -892,8 +983,19 @@ rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
>>   static void cf_check
>>   rt_free_udata(const struct scheduler *ops, void *priv)
>>   {
>> +    struct rt_private *prv = rt_priv(ops);
>>       struct rt_unit *svc = priv;
>>   +    if ( svc && !is_idle_unit(svc->unit) )
>> +    {
>> +        unsigned long flags;
>> +
>> +        spin_lock_irqsave(&prv->lock, flags);
>> +        rt_admission_test(prv, svc->unit->domain,
>> +                           svc->period, svc->budget, 0, 0);
> 
> This use case clearly shows you are not only testing. :-)
> 
>> +        spin_unlock_irqrestore(&prv->lock, flags);
>> +    }
>> +
>>       xfree(svc);
>>   }
>>   @@ -1389,7 +1491,8 @@ rt_validate_params(const struct xen_domctl_sched_rtds *rtds,
>>       s_time_t b = MICROSECS(rtds->budget);
>>         if ( p < RTDS_MIN_PERIOD || p > RTDS_MAX_PERIOD ||
>> -         b < RTDS_MIN_BUDGET || b > p )
>> +         b < RTDS_MIN_BUDGET || b > p ||
>> +         b > (s_time_t)RTDS_MAX_BUDGET )
>>           return -EINVAL;
>>         *period = p;
> 
> 
> Juergen
> 

BTW, if the rt_admission_test() returns false in rt_alloc_udata(), 
vcpu_create() will fail too. This will cause the d->vcpu[i] to become null, 
and it will crash in sched_move_domain().

So to avoid the crash, this patch needs the v2 of my fix for that.
https://lore.kernel.org/xen-devel/20260819051532.9197-2-frn1furkan10@gmail.com/

Juergen, what do you say to acking that v2 fix?

Furkan

