Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4411CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 10:36:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437029.1655720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrfc-0007Pe-Nm; Wed, 30 Sep 2026 10:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437029.1655720; Wed, 30 Sep 2026 10:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrfc-0007PX-Kf; Wed, 30 Sep 2026 10:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1437029;
 Wed, 30 Sep 2026 10:36:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ruslichenko.r@gmail.com>) id 1xBrfb-0007PR-5L
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 10:36:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBrfa-009Hxl-E4
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:36:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 6abce61c-8faa-0a2a0a5109dd-0a2a45018f5e-10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:36:14 +0200
Received: from [74.125.228.96] (helo=mail-ed2-f32.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 6abce61e-5984-0a2a45010019-4a7de4608a8a-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:36:14 +0200
Received: by mail-ed2-f32.google.com with SMTP id
 4fb4d7f45d1cf-6acaec6a74aso2511332a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 03:36:14 -0700 (PDT)
Received: from [192.168.1.130] (93-143-224-14.adsl.net.t-com.hr.
 [93.143.224.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2e22fcf619sm44968666b.72.2026.09.30.03.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 03:36:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790764574; x=1791369374; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbE8BEXbouhRlk/5qYg94VFwkAWpYydzypFzbapZsT8=;
        b=BLrSY8SYK5vfTesfc84tHqcVABnrIA/4VOjdtvIcw9g4jow+pT0PkmierJGr4I8csj
         XPJToVTPtiw9fy2dV6nKAZf4lNjXgbTVyBMq73SoaqRVAGB7sKAe0K7ukFNXGz+A0JF1
         AFwTjvfnpRUix2ix9Lc4ZCa95LI8ky0amqsN24VQfCGv+0Rf0EcEA3HiBymL/xFdzepC
         bWOl6F5NYOUjmPSbBXZ88nsHmqON/MllNjturPQdbOymyqz4QT1qp5P49dhyrmGdpgXo
         PlRB7wTeE+GYkFidEXGPyKn4G/8LpPr0hFlvwyW3tT4HIN2rqaH2ZFnFNV3dz0QEG/5d
         b2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764574; x=1791369374;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HbE8BEXbouhRlk/5qYg94VFwkAWpYydzypFzbapZsT8=;
        b=iOUT25ZMFQgk2YOWjQNMS1+qECTedlCUspb/pOO6VjTIjgwREIpcqxoX+q8HwS4hAC
         taEcdQXSp72h8sr0aomcJlcVA4pEIrde2FH7RkKDlXM49SZzrzaJxFfVKG7gGkdyCIHu
         oq5eJmqcTbLaA+NgxxygUhKMKS3iy9FWxA8YxlLweHyOHbWjRPLGqNIYAPSZKIMLVoYa
         ACMG+ou7TtROcEpPBqZbIcPCQffEHxta/fUtyjHqaMRVmpfQ+2X+E5dpp6KREq1iev04
         zV8Q1UkP9QIhRoN9YorF/MFy/KQNKq4CV5mq1E7w9xCD5IZ0oguFpzbshP6ae4olKBu4
         Eg1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzhDYx/ugFSwaw1vE007y0tiI2FvtWSXBvCqH4fHidIyLFqTQY3/ex0eXKl2lDsLonPjhVgA2uZjqI=@lists.xenproject.org
X-Gm-Message-State: AFuF++kH1vC+jDn88RJjNu5pd6MoNYxgO65s3mVGb2dpUu7DNtr2LKU5
	BuI6jcjwC7TT7/K4Hvs8fLFqTslImE1YK8p0R5ALt3Ad1U5du/y2Fz8P
X-Gm-Gg: AYBFou1Kie1Dut72Dwt1l6xGw53IhL7DsUbGxvu25QVKQ8ftFeB4RWjsti1S7JAegh3
	Upc46/56AhPQSwBo2VFwxbMGkQ6hgJPTqQwBUdH3L2q0+8Omqk4E6r0Ej5BTot8evcK3KMg3cNT
	KoebWCyYqhkA8wlyYes2ZMB6r6rq4iAjNApCxZYHU1t6dsjXE+bjQc9UhhQAT8pm2KP09ssespZ
	7dyJbUvXe0CEIfsT8kNE0m5YVTvsm7isDWpP8vuEq3HCdvW5FONwkgV3HB7HoHMKSg5o0GbXzVf
	Z3nx1NDIlir0ax7m968XQNCnpXDd38/hY7fvYHRWn8FYWvgU8fskSgKmzFOxJovxUNSs3gCVSWH
	vWySkaKQIOvU9svHjkVueE0gBT2LWpRINmaAqpJGeXEmPEP6O6bJa2tnFe9vVmPyk9peKfAXutm
	1QFZtwYm8C5dqcPeLH2bwiw6T0Zmo8BU8Fvn1Np5JNxlb5ap/k7qHo4tO8TnHip4neI+SRr5IBr
	M9eY0yzXiNf3nDa2r/uZLJkYcyXcXXBUQhIOac=
X-Received: by 2002:a17:907:720f:b0:c2b:898e:24fd with SMTP id a640c23a62f3a-c2e23dda162mr88728866b.33.1790764573485;
        Wed, 30 Sep 2026 03:36:13 -0700 (PDT)
From: Ruslan <ruslichenko.r@gmail.com>
X-Google-Original-From: Ruslan <ruslichenkor@gmail.com>
Message-ID: <7bfea588-da85-4edc-a8e9-5f2379c65d0f@gmail.com>
Date: Wed, 30 Sep 2026 12:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RESEND] Re: [PATCH] xen/sched: refactor urgent count update
To: Jan Beulich <jbeulich@suse.com>
Cc: dfaggioli@suse.com, jgross@suse.com, gwd@xenproject.org,
 artem_mygaiev@epam.com, Ruslan_Ruslichenko@epam.com,
 xen-devel@lists.xenproject.org
References: <20260925212803.799550-1-ruslichenko.r@gmail.com>
 <1753bd8f-effd-40c4-a3b0-1e61ec8f7474@suse.com>
Content-Language: en-US
In-Reply-To: <1753bd8f-effd-40c4-a3b0-1e61ec8f7474@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1790764574-1F86F757-4072883A/0/0
X-purgate-type: clean
X-purgate-size: 3478


Resending since Google web client mangled the formatting of previous mail.


On 9/29/26 17:35, Jan Beulich wrote:
> On 25.09.2026 23:28, Ruslan Ruslichenko wrote:
>> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
>>
>> With current implementation whenever vCPU blocks on
>> waiting for event channel via SCHEDOP_poll hypercall,
>> scheduler sets 'is_urgent' flag. The flag is cleared
>> on vCPU runstate change, if it is no longer in
>> 'VPF_blocked' state or its vcpu_id is not in poll_mask.
>>
>> However, the only way for vCPU runstate to change in
>> polled state is when it's going to wakeup.
>>
>> Thus when 'is_urgent' is set, inner condition will always be:
>>
>> if ( unlikely(v->is_urgent) )
>> {
>>     if ( !(v->pause_flags & VPF_blocked) ||            // Always True
>>          !test_bit(v->vcpu_id, v->domain->poll_mask) ) // Never evaluated
> 
> Maybe this invariant indeed applies, but then there must be more to it.
> Simply from taking the "else" branch here
> 
>         if ( unlikely(v->pause_flags & VPF_blocked) &&
>              unlikely(test_bit(v->vcpu_id, v->domain->poll_mask)) )
>         {
>             v->is_urgent = 1;
>             atomic_inc(&per_cpu(sched_urgent_count, v->processor));
>         }
> 
> clearly immediately afterwards the invariant you name does not hold.
> 

I should have described the preconditions for this. vcpu_urgent_count_update()
only called by vcpu_runstate_change(), which returns early if
'v->runstate.state == new_state'.
v->is_urgent set means vCPU is in RUNSTATE_blocked, so the only change
from RUNSTATE_blocked
is to RUNSTATE_runnable or RUNSTATE_offline, and both require
_VPF_blocked clear.
Also vcpu_unblock() clears _VPF_blocked first and it is used by wakeup
sources: event_channel, irqs and poll_timer itself.

I will refine this in the commit message.

>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -241,26 +241,22 @@ static inline void trace_continue_running(const struct vcpu *v)
>>  
>>  static inline void vcpu_urgent_count_update(struct vcpu *v)
>>  {
>> +    bool cur_urgent;
>> +
>>      if ( is_idle_vcpu(v) )
>>          return;
>>  
>> -    if ( unlikely(v->is_urgent) )
>> -    {
>> -        if ( !(v->pause_flags & VPF_blocked) ||
>> -             !test_bit(v->vcpu_id, v->domain->poll_mask) )
>> -        {
>> -            v->is_urgent = 0;
>> -            atomic_dec(&per_cpu(sched_urgent_count, v->processor));
>> -        }
>> -    }
>> -    else
>> +    cur_urgent = (v->pause_flags & VPF_blocked) &&
>> +                 test_bit(v->vcpu_id, v->domain->poll_mask);
>> +
>> +    if ( unlikely(v->is_urgent != cur_urgent) )
>>      {
>> -        if ( unlikely(v->pause_flags & VPF_blocked) &&
>> -             unlikely(test_bit(v->vcpu_id, v->domain->poll_mask)) )
>> -        {
>> -            v->is_urgent = 1;
>> +        v->is_urgent = cur_urgent;
>> +
>> +        if ( cur_urgent )
>>              atomic_inc(&per_cpu(sched_urgent_count, v->processor));
>> -        }
>> +        else
>> +            atomic_dec(&per_cpu(sched_urgent_count, v->processor));
> 
> Assuming the transformation is valid to make (scheduler maintainers will
> need to judge), may I suggest to fold these two into a single atomic_add(),
> passing in either +1 or -1?
> 

This looks like a good improvement, thanks. I will update for v2.

--
Best Regards,
Ruslan

> Jan


