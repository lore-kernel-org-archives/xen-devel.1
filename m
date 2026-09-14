Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD3AC88E6A
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 09:14:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420577.1646832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62lG-0001Xo-3y; Mon, 14 Sep 2026 09:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420577.1646832; Mon, 14 Sep 2026 09:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62lG-0001Xh-1J; Mon, 14 Sep 2026 09:14:02 +0000
Received: by outflank-mailman (input) for mailman id 1420577;
 Mon, 14 Sep 2026 09:14:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x62lE-0001XZ-Li
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:14:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x62lD-009BaP-JK
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:13:59 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7bad2-e002-0a2a0a5209dd-0a2a4501d2ca-28
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:13:59 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7bad7-5984-0a2a45010019-d155802be4b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:13:59 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49e717c9841so9810825e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 02:13:59 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60ad0614sm324326405e9.10.2026.09.14.02.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:13:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789377239; x=1789982039; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pX6ehIPkirYx2cXTlEJLZmpcOcMBvg1KKWQ3Tskgno=;
        b=BQcJSl35M47D7iZR4pVN4ImSV2Pt0JoMiFTgi9m2+7BWCvFy3Mt41uctrLV7PJ6uGQ
         0zMT1bbUvlFZnkyYWoIdMOiYDDaVTL0lC1JxoFp+HfF6tjOEqir9BCWvqoxnEN8SN/EX
         rLo6hWa1CdiSdiyvAjkRN20Fc7kQg/wOArKOsqn8ydUKlpJz1pIWb9m2/KkmDViVMqKM
         CnCLo9ETYbZPMcEaFdMMP3m8Gw0JC/xFlR3jKmg3MxVss1g+7XbVa4n1HKNiHMtx8aAx
         4voly+TvvdMm8MlEfWaQ6dpfMaho3RzuICX2QF+8QKPynhUScWRRFUtFSzUdczntwlxr
         I1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377239; x=1789982039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pX6ehIPkirYx2cXTlEJLZmpcOcMBvg1KKWQ3Tskgno=;
        b=Wl01UIr4ed7lnixzaQsCeFUNmEYwoROvhOHLLUpB2RVDFzgpoBeRX+FY4pQFjuPXEi
         X1HUICgZTSq+k5aOio3kduCZ99ieLA6VMR2Mouuk3+5XXAQJNpCPcgth7IWDTtyZlZEr
         fA/8RxzgFRjY2NmfzJllpXXxlAT89reAABV31yiN9g1PdiZtz4rAX61DQRS/92gZ6mU7
         +DQFvaGqXehUrjzML2dqs/Ra0UDXmgCxXYukt4nrrSLbJFX8JmuvxvmfSVPSdL48kBXg
         q8pvTfl9W8R1VPTHgZOwTxUKbhXmI0R3dmZhEaPCoACbtfSjrCsjkf5u+a+boJ5+LSy6
         h03A==
X-Forwarded-Encrypted: i=1; AKwUvBxFN2ckSm0sXVIxirU2eXjemPOhFhZ3sdF/YUk2Jbz5My1/LbeC1BkT1ijR+NZQ9eB7nbDKVvzOqz0=@lists.xenproject.org
X-Gm-Message-State: AFuF++lFcgpRRKh9YEeki8cE4ibwnAEaLVLWDE/LDvwZHMS7CrQsbROl
	n6+DN4dUSGDYuwUYOCNCpgyFUlH3LkSzdjn8IJ1VjZkaqHU64Iffe+xL3LRNyULgOw==
X-Gm-Gg: AYBFou2Ngls99foak8bSV0BkG/ToFlSqqU6NAzN4rVOEzN0j8Pa24H1qreFC0D+ZXx1
	JMpbdqZDQ5CWnIk3huwgKxm3gQaUlU8/iy7j+rpHtVKlxSrOD5RGpDnr4OEj4bWs6ouWP1eDLNi
	DZa2DuLfnGw/98ZUxY/ZcOvIH5xUkxJAgTdg92T7gwucMx42TSK78K4YupIkAGbUrDhy1E1eXY+
	EZNFuAaPool3psdGOrjgIUqiP7I2+H2Lkpb4okO8bjEfX+0EzZ8WMJg6A+BE5WrO7L3x10/wVqu
	Xp0GSQG4pLDO3vF1klM+Od38tA5MNH1+34sCsztnGtLR/Itt4z8KtAPi5ERJtDib0D9nCDelzGU
	Q/GvU8ltMGJctta8jz8AOfIkak1Fq/F97pN9DeStLJ4TFPA4AQiS9oazelmdRfA5du2Y6oRDJC4
	Au3ou3uKocAqEGLxFAA4XGja8alMvF9jE4eJcXzILYPAWzQ1wCs4LZM0MaPHEU6KnPRYUSLoIZh
	GsgKLRBsOW0
X-Received: by 2002:a05:600c:190d:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-49e7a63a894mr19963905e9.4.1789377238763;
        Mon, 14 Sep 2026 02:13:58 -0700 (PDT)
Message-ID: <325f2b44-ea61-45e8-a681-c0bb08d5766a@suse.com>
Date: Mon, 14 Sep 2026 11:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission
 control
To: Juergen Gross <jgross@suse.com>, Furkan Caliskan <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, dfaggioli@suse.com,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 gwd@xenproject.org, enr0n@ubuntu.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-2-frn1furkan10@gmail.com>
 <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1789377239-C495A757-07026B2E/0/0
X-purgate-type: clean
X-purgate-size: 2935

On 14.09.2026 11:10, Juergen Gross wrote:
> On 26.08.26 06:57, Furkan Caliskan wrote:
>> @@ -635,6 +656,54 @@ replq_reinsert(const struct scheduler *ops, struct rt_unit *svc)
>>           set_timer(&rt_priv(ops)->repl_timer, rearm_svc->cur_deadline);
>>   }
>>   
>> +/*
>> + * budget << RTDS_UTIL_SHIFT can't overflow: rt_validate_params()
>> + * caps budget at RTDS_MAX_BUDGET. period == 0 means "no
>> + * reservation" (a unit being removed), not an error.
>> + */
>> +static uint64_t
>> +rt_unit_utilization(s_time_t period, s_time_t budget)
>> +{
>> +    if ( period <= 0 )
>> +        return 0;
>> +
>> +    return ((uint64_t)budget << RTDS_UTIL_SHIFT) / (uint64_t)period;
>> +}
>> +
>> +/*
>> + * Utilization capacity of the cpupool domain d resides in.
>> + */
>> +static uint64_t
>> +rt_utilization_cap(const struct domain *d)
>> +{
>> +    unsigned int cpus = cpumask_weight(cpupool_domain_master_cpumask(d));
>> +
>> +    return (uint64_t)cpus * RTDS_UTIL_SCALE * RTDS_UTIL_CAP_PCT / 100;
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
>> +		   s_time_t old_period, s_time_t old_budget,
>> +		   s_time_t new_period, s_time_t new_budget)
> 
> I think the function name isn't appropriate. The function doesn't test only, it
> is setting the utilization, too.
> 
> What about rt_try_set_utilization() instead? And make the return type bool
> (true on success).
> 
>> +{
>> +    uint64_t old_util = rt_unit_utilization(old_period, old_budget);
>> +    uint64_t new_util = rt_unit_utilization(new_period, new_budget);
>> +    uint64_t total    = prv->utilization - old_util + new_util;
>> +
>> +    if ( new_util > old_util && total > rt_utilization_cap(d) )
>> +        return -EINVAL;
>> +
>> +    prv->utilization = total;
>> +
>> +    return 0;
>> +}
>> +
>>   /*
>>    * Pick a valid resource for the unit vc
>>    * Valid resource of an unit is intesection of unit's affinity
>> @@ -892,8 +983,19 @@ rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
>>   static void cf_check
>>   rt_free_udata(const struct scheduler *ops, void *priv)
>>   {
>> +    struct rt_private *prv = rt_priv(ops);
>>       struct rt_unit *svc = priv;
>>   
>> +    if ( svc && !is_idle_unit(svc->unit) )
>> +    {
>> +        unsigned long flags;
>> +
>> +        spin_lock_irqsave(&prv->lock, flags);
>> +        rt_admission_test(prv, svc->unit->domain,
>> +                           svc->period, svc->budget, 0, 0);
> 
> This use case clearly shows you are not only testing. :-)

Yet at the same time ignoring possible errors.

Jan

