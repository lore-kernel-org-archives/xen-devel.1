Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C7AC88E65
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 10:40:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420731.1646967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x646u-0004y1-7D; Mon, 14 Sep 2026 10:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420731.1646967; Mon, 14 Sep 2026 10:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x646u-0004xu-4L; Mon, 14 Sep 2026 10:40:28 +0000
Received: by outflank-mailman (input) for mailman id 1420731;
 Mon, 14 Sep 2026 10:40:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x646t-0004xi-7d
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 10:40:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x646s-009Utk-9V
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:40:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7cf06-e002-0a2a0a5209dd-0a2a4503e2e6-42
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:40:26 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7cf1a-fae8-0a2a45030019-4a7de18c9bb0-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:40:26 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso17671515e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 03:40:26 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.101.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e61a81943sm205742235e9.1.2026.09.14.03.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 03:40:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789382426; x=1789987226; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJAN9MPqRgVCZMSQ0QN1A1qp2/5TH4w9uZdSRau0bvM=;
        b=YWfhZEJZnPoVkM8iRMMuBYYAtb/ZBGiQIP0t9NU4q7URI2+SFheom33mLARlfuqhxO
         otL3MJwZHVhiRj8aET8Ydf3GvQahmSC3yTK1CyN6d1vjtEL/gp/DG4MBSP5IaBs71/1A
         m/3RD0+PiZc66VgrXG7FoeyTvK4cr2Saj3eYSUkged+f6LFnXS9yzJ9JLKfjg52BL/Gv
         Gxajsl6HLp1z9yx7cyM4G2+yy0zxVxzcLPkjwdAp08frK//ZQ9Ls+AifTlPHgdE5p7tO
         Q6zQmjGbySIjOBW5qxkNDhEn949Q8Ve8hSRgj8zd6haSGOuVmZ6H0zhwxK43tQX/ernM
         96Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382426; x=1789987226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJAN9MPqRgVCZMSQ0QN1A1qp2/5TH4w9uZdSRau0bvM=;
        b=Y44gnYZ10a2loigYEyePue0jUuyORwSD+06DfUyylPyvdRneN0IsKwpJxHor9CNRD5
         WzxBpT0aG3sgUx0+QiPKTTBypYOL8+BOuklra3T25EI/AHhXZBJwAdYr+eAd0aYfNJBS
         n5iNri8fMAo8jX0/WmAjdATNUozA8dIlJtsmVNiRYhVQpGW5TZeI2cAwb84R0c5TQF8v
         44tBfUBt7g3N4AO/a9AX3j/HQeWsms3bxoxc9l1WvCARWJ0MDx9VevhQL28KjRpaahwv
         DxOlEI/ALBaEn1Zq8SljXP178pF8tgQWapRrM+cX1N1tR8SciTqb6YvM9BqGOqtRzjJr
         mF5A==
X-Forwarded-Encrypted: i=1; AKwUvBy3AV3IAaQ5hfwDs8G5ofKHkqWIrpwd2Jc3UDTpF2Xb1jH9ia8hyehXhW4ZHe1VWOgd1SWS5+XoP4o=@lists.xenproject.org
X-Gm-Message-State: AFuF++k568H0lGeZFuGwmPj/pVg42WOU53SPRGNBnsh7E1hyV5932DZM
	0u3QEc1JWTazyCOzkkblDzW3GEUJzOsomsV5WlP9GnEGTvS7w6x/mqWF
X-Gm-Gg: AYBFou2KhFGTisYdJdxAnsxJpvRKzPjwaImL5VNEjdrLRgXRjBZ9SNyZrTxHjjWVnlg
	h3PBkqc3MmETZcFf9OjdpS6G3owfdWLAEfbOXAE+CCaxArWd4RuMsGkFuDlO69urfZ0cydwYHs7
	D26NAGZm49ndzGOzF6xj8aTtlERAyLR6BqJLHhFfAmzs/kVc4h9aPqXDA05JB3ZpYcpOeZOuGyj
	CLwDgRpZwi6vhM/neDx5Xb7NagplHsTdeyPNp8mqL/FV6JqDJ4LUYLwxWRV9rCyGVea5Dbujaka
	i2d46ICw4ysJICz5tVMAUfY2LIb8ZUjTKEuom146jZ+PIdohrqg82iZEs7YGwQpWCDYiGT9Bi5i
	K82O35EUkjDgCByWvRED5zd0LvzxpKecqbq/o0ovCtLmPbyfIVbhwRFCMlroGci9HUvdnxmIzo2
	cIEbbBvfU6InN1eG8lZ+T2KwOSezg6qADuvNhTJRatdpBlOvYu37NDV55w5wClhSX4+N3w1XaH+
	IqmviQMAhVRqThSrGw=
X-Received: by 2002:a05:600c:4f16:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49e7a65cd80mr27746375e9.1.1789382425387;
        Mon, 14 Sep 2026 03:40:25 -0700 (PDT)
Message-ID: <0899d0b5-431a-450d-9aec-796f73f92a83@gmail.com>
Date: Mon, 14 Sep 2026 13:40:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/sched: rtds: enforce admission control in xl
 sched-rtds
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-3-frn1furkan10@gmail.com>
 <e64415b8-f117-43d8-a977-8994650050c2@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <e64415b8-f117-43d8-a977-8994650050c2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1789382426-776F34E9-F0D33F0A/0/0
X-purgate-type: clean
X-purgate-size: 4356


On 9/14/26 12:16, Juergen Gross wrote:
> On 26.08.26 06:57, Furkan Caliskan wrote:
>> Now that we have introduced admission control for new and
>> removed units. Extend it to XEN_DOMCTL_SCHEDOP_putinfo and
>> putvcpuinfo, so growing an existing reservation via
>> xl sched-rtds is checked too.
>>
>> putinfo sets the same (period, budget) for every unit of a
>> domain at once, so it tests the whole domain's utilization
>> delta atomically, rather than unit-by-unit, which could
>> spuriously reject an overall-acceptable change depending on
>> iteration order.
>>
>> putvcpuinfo changes one unit at a time, so it just calls
>> rt_admission_test() directly.
>>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>> ---
>>   xen/common/sched/rt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
>> index 9126320801..9643a277fe 100644
>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -1527,11 +1527,43 @@ rt_dom_cntl(
>>           op->u.rtds.budget = RTDS_DEFAULT_BUDGET / MICROSECS(1);
>>           break;
>>       case XEN_DOMCTL_SCHEDOP_putinfo:
>> +    {
>> +        uint64_t dom_old_util = 0, new_util, new_total;
>> +        unsigned int nr_units = 0;
>> +
>>           rc = rt_validate_params(&op->u.rtds, &period, &budget);
>>           if ( rc )
>>               break;
>>   +        new_util = rt_unit_utilization(period, budget);
>> +
>>           spin_lock_irqsave(&prv->lock, flags);
>> +
>> +        /*
>> +         * Same (period, budget) for every unit of d: test and commit
>> +         * the domain's whole utilization delta atomically, rather
>> +         * than unit-by-unit, which could spuriously reject an
>> +         * overall-acceptable change depending on iteration order.
>> +         */
>> +        for_each_sched_unit ( d, unit )
>> +        {
>> +            svc = rt_unit(unit);
>> +            dom_old_util += rt_unit_utilization(svc->period, svc->budget);
>> +            nr_units++;
>> +        }
>> +
>> +        new_total = prv->utilization - dom_old_util +
>> +                    (uint64_t)nr_units * new_util;
>> +
>> +        if ( new_total > prv->utilization && new_total > rt_utilization_cap(d) )
>> +        {
>> +            rc = -EINVAL;
> 
> Is EINVAL a good choice here? I think a different error code might be wanted.

Would EBUSY be okay here? Or what else would you suggest?

> 
>> +            spin_unlock_irqrestore(&prv->lock, flags);
>> +            break;
>> +        }
>> +
>> +        prv->utilization = new_total;
>> +
>>           for_each_sched_unit ( d, unit )
>>           {
>>               svc = rt_unit(unit);
>> @@ -1540,6 +1572,7 @@ rt_dom_cntl(
>>           }
>>           spin_unlock_irqrestore(&prv->lock, flags);
>>           break;
>> +    }
>>       case XEN_DOMCTL_SCHEDOP_getvcpuinfo:
>>       case XEN_DOMCTL_SCHEDOP_putvcpuinfo:
>>           while ( index < op->u.v.nr_vcpus )
>> @@ -1584,6 +1617,15 @@ rt_dom_cntl(
>>                     spin_lock_irqsave(&prv->lock, flags);
>>                   svc = rt_unit(d->vcpu[local_sched.vcpuid]->sched_unit);
>> +
>> +                rc = rt_admission_test(prv, d, svc->period, svc->budget,
>> +                                        period, budget);
>> +                if ( rc )
>> +                {
>> +                    spin_unlock_irqrestore(&prv->lock, flags);
>> +                    break;
>> +                }
>> +
>>                   svc->period = period;
>>                   svc->budget = budget;
>>                   if ( local_sched.u.rtds.flags & XEN_DOMCTL_SCHEDRT_extra )
> 
> 
> Juergen

Furkan

