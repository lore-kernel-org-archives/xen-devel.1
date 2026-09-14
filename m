Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428FCC88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 10:31:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420707.1646949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63xq-00028m-3y; Mon, 14 Sep 2026 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420707.1646949; Mon, 14 Sep 2026 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63xq-00028f-0j; Mon, 14 Sep 2026 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 1420707;
 Mon, 14 Sep 2026 10:31:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x63xo-00028Z-8j
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 10:31:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x63xn-003Gyw-Hg
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:31:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7ccdf-8faa-0a2a0a5109dd-0a2a450492cc-6
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:30:58 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7cce2-b57f-0a2a45040019-4a7de18d9be2-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:30:58 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7355e411so12077895e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 03:30:58 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.101.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c2a419sm433217575e9.7.2026.09.14.03.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 03:30:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789381858; x=1789986658; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ulI5AdkQmmvQ3Lyda75s2UBWI7+cwgUaCuMfCOhhjTk=;
        b=EWNrkJugIfoGbLlhtll95yA+EWr2vorlmil8TItS/nb6bvczpSUfDx4GKmoyFofwG9
         5mX2IwNLMEs0vwnbPiDE69/dM34m2ipvxiflcckbLy5Noz5D4/9IiGgvwwycP68XiXHm
         UdJx0MwCuGejvMbGoqlLX1BYPvuUURh3v1pTPXGDkU+RRudRSvXPYgZWXgxwMKYzuQp5
         4J3zVTuuK53UjrFo9hNc1Uca1QMuKbT2MzDga7G0RD6gaFlpI0CWB01B1cT59YD2sIHP
         hj2KXdB0FF2Eqan38SiN8j3T39nNPRnTZGSFgXD2l5Fz0lyHcu1mij+/Nefaz93XEiaC
         VCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381858; x=1789986658;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulI5AdkQmmvQ3Lyda75s2UBWI7+cwgUaCuMfCOhhjTk=;
        b=muTwiUMIs6yT5PbC6B/d5AAfEaTx25p8n813EGvl3ArXSCJrt4eHsBRh7LGZ5eeTNW
         Vpq5VJmp52ezP8qxd0Ljbaf5fIDodENwZEd80mfJFucDe1wY1PdVQ0zIz3geUPbchOZB
         bylUopLfyYojYqbkQFtRLrs+8Jq8b3g/9DhS93E3Zd6UxUZLslTt0IOT+XK6BXf4yk0N
         bKwZ2uu50PE3xxtROFipamj+21+9ndTEZ7lo+fgMrotZUF13LAyg5sopZGUwNtUquPmE
         GM1yUErQ8JhCLpeg1MwkRxJxRQAFFpyND0Ee6Co4YWPH/OkVd69BCBUmlZB7GNLxOBRP
         Ue2g==
X-Forwarded-Encrypted: i=1; AKwUvBxtgGTXqY16xoZXtxPbMBaPZ1wlVEOQsP71zz3sxIhrFma0O/MqYopXbq8BoC2oed8wh7GxwcOlHEo=@lists.xenproject.org
X-Gm-Message-State: AFuF++n8JNkLjfaezbSkhKIYL9WdCg/GoSfh06bjI1K5FWBgYDULi6vD
	NPZDinfmWwRdTyJx0cI12owHNibuFAvmh9smsdkA8nPrjNThTqtSKpDm
X-Gm-Gg: AYBFou1zG83urNW+noq2AkkmotRQgX88H4J6HAw9NTuoZixyUR3g+9lmFcpKscIVtd5
	TQzftH6IXoZlon0GePhsy4feTbwU4DJFp9SoHGDCaL153kx7308zRP9otdp5SHq72taWXXW+YGk
	LvQInNvj26e5ANGcRn7YrZLcsoGwiIA3kY5jL4uhq0qarAvbiHb+WNosByVK1b6HWK4wL4hCimj
	aintHrX36XUKQG5NNVHC26okIxocEMU1oVPuhUWhqWZ5oI9Bvm5l+88B6XnPawIuDcpDUEk8OIU
	6opo58AF/zOUfPdO10CYq2e0NrqH1Rah3eF0KaCaR8Dcd7kOQ2MBDehfmi4DpqbY7efuIkVNwnj
	s57JDrPBG+4bKFO17TUycFbjA2y0007EH5Tt6U7VpTRyg/8wzzQGoHZz64MnPemBu13ynX+dgET
	zH140rW/nC1rzj0IEy93rpKvVeZYMMqhOgBEhK71ZrDd74jC4XnKb1DoDss4cPxOtdbY/Y2hS1V
	7j3XGE=
X-Received: by 2002:a05:600c:8b6b:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49e7a64acc2mr50291725e9.4.1789381857547;
        Mon, 14 Sep 2026 03:30:57 -0700 (PDT)
Message-ID: <384de41c-213b-4aed-af97-e0f4596b3f39@gmail.com>
Date: Mon, 14 Sep 2026 13:30:51 +0300
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
X-purgate-ID: tlsNG-ebf023/1789381858-C1AD0B50-4387E8A2/0/0
X-purgate-type: clean
X-purgate-size: 8613


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

Okay, I'll change the name in v2. And the return type too.

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

Thanks,

Furkan

