Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464BEC88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 09:22:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420588.1646842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62sk-0003IM-Qw; Mon, 14 Sep 2026 09:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420588.1646842; Mon, 14 Sep 2026 09:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62sk-0003IF-O6; Mon, 14 Sep 2026 09:21:46 +0000
Received: by outflank-mailman (input) for mailman id 1420588;
 Mon, 14 Sep 2026 09:21:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x62si-0003Ht-V9
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:21:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x62sh-0033K2-Uk
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:21:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7bca1-8faa-0a2a0a5109dd-0a2a450ad80e-20
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:21:43 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7bca7-f2d2-0a2a450a0019-d155802fe8de-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:21:43 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so25470155e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 02:21:43 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60ac411asm289006315e9.8.2026.09.14.02.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:21:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1789377703; x=1789982503; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdN9NrxN8B2lkyt5tUSGZLrhPJA9n6yB+2SAPCu++cA=;
        b=Efmh6lsNL7m/bUclu0WRYgryPOYLENfQ4jV6BqkGzzVuxyITvuqxOEVlzgL75si+np
         7HeSd6+U/XZgSXRIKhTu/gDH9WO1QNhcmLw93XeJS/ymrqJE5wrPhCTbJbMAZKrWZumQ
         NXvUROLOvDJHBVT1SvGEOF8re6HoykdZE5rCLL23fVkxrRDPWQstdjoVzhDMd9vfZkGu
         UMkaWgKqr1rTs2WMpcgthOytcRQR+DRvXPJbAMAbyT45nclFyUOkyw4CLQnTxRuJeoTn
         Jf3GJTBvBGcVmCEh1xm1pLMgInKSzXg4/Kbx1oMMbSWRVRqy5l9xubI2AcFXGqgSJFtM
         3unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377703; x=1789982503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdN9NrxN8B2lkyt5tUSGZLrhPJA9n6yB+2SAPCu++cA=;
        b=GsY5fZGT9x4Lzya7BjKx/MWjwIRs5TpPwlWt/MyO9fHVsH+CmBs7xkUt9daUQQgr+g
         4WIazJ+IGhZ7Uv+TTPxFHRDifU3AV/rnCHb9NRCV7A/iG+3zXvKzHsACeUb8zrb5XPVf
         evvS3xDngds0mxcgumI+LKfGkwQKsAtc7cK2HOFbGfaDERp3PdJJvD+ElSf0UAfQMoN8
         aGgOqjWdIOBu5hm4jM5vWcYLEvYmhQF8OsoEo4+m2Heq4WQsfewi2Kp2guuQw5HOToRX
         4pYNIkT0v5/NywGXlfXtZ2auLDJCmj+AGBz+EuXwWwdtA3ZNJu2XfY2rg+dSUabiF2lh
         Ty/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwtofChboxr/aakdN+6S87GEiKdQrb+ujVlM/1ztMx2c66/9zMDjq0fI1N9cK+pdH5nsULrubzYe1Q=@lists.xenproject.org
X-Gm-Message-State: AFuF++mP6fkzLMWxyuimUmr1mUadgoaLAjKfaOifrlS5CivOEgZAa9/B
	C89U2PXBVi4TM6KxljDE5LfaHAUKXlFtonNITE+setpYU8ooQFEThTiRmZTxXjWYZg==
X-Gm-Gg: AYBFou3uMFJgad7toUuSHlZGI6BjadJq0dsqj4DIm0wFTmXxkyY0ltkG3vOp7g8Kq1X
	8Nc6TEvamtVubEtQ31Gm7C4IrjYu9GvWMlQ3+DTvn/tqE/RYtOa6sBRZk4xInKAWRcmfF3PFCq0
	U3Q16CaY58pUSje6xShHTD/cf07Y377iFINKbKcm5uj0ggYBzYDG9ecP0YSQaEK284w2dkf9LHm
	Zym7edW18rG1+prqK8LbiTVQPNvL6OCDEQEvZudGQ4TR/p0HizEAYEv9Uyd5A/vTCh0I9TBvKUN
	rgkA9oyqJUugijGGpYxIO/mIO2fWJiYElG+HIPhhQcDs4ZldqiO+s7yQpaq4d6w3srHlxZx06rJ
	Mwt+2ElQRiAm16VOSNeQcXqb6wOtKXMrVLJ3btWtBWzAzpT1hx6+07+UKC4XFdtSqY/uQRgkxtZ
	R8cKGZkGGcQ0A7H30wjG+scdkIcd2DR0wyGWaqdG3A2YdnmZtiXjZZb3o5fi1a6oeGEidGapmEP
	TpATc8/qiaVYw==
X-Received: by 2002:a05:600c:4746:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49e7a63a654mr18694485e9.2.1789377703290;
        Mon, 14 Sep 2026 02:21:43 -0700 (PDT)
Message-ID: <ee7a2c47-d9ce-41ee-87fa-b76d71a81292@suse.com>
Date: Mon, 14 Sep 2026 11:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/sched: rtds: enforce admission control in xl
 sched-rtds
To: Furkan Caliskan <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, dfaggioli@suse.com,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 gwd@xenproject.org, enr0n@ubuntu.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-3-frn1furkan10@gmail.com>
 <e64415b8-f117-43d8-a977-8994650050c2@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e64415b8-f117-43d8-a977-8994650050c2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789377703-5A9D9CFC-FD7579D1/0/0
X-purgate-type: clean
X-purgate-size: 1806

On 14.09.2026 11:16, Juergen Gross wrote:
> On 26.08.26 06:57, Furkan Caliskan wrote:
>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -1527,11 +1527,43 @@ rt_dom_cntl(
>>           op->u.rtds.budget = RTDS_DEFAULT_BUDGET / MICROSECS(1);
>>           break;
>>       case XEN_DOMCTL_SCHEDOP_putinfo:
>> +    {
>> +        uint64_t dom_old_util = 0, new_util, new_total;
>> +        unsigned int nr_units = 0;
>> +
>>           rc = rt_validate_params(&op->u.rtds, &period, &budget);
>>           if ( rc )
>>               break;
>>   
>> +        new_util = rt_unit_utilization(period, budget);
>> +
>>           spin_lock_irqsave(&prv->lock, flags);
>> +
>> +        /*
>> +         * Same (period, budget) for every unit of d: test and commit
>> +         * the domain's whole utilization delta atomically, rather
>> +         * than unit-by-unit, which could spuriously reject an
>> +         * overall-acceptable change depending on iteration order.
>> +         */
>> +        for_each_sched_unit ( d, unit )
>> +        {
>> +            svc = rt_unit(unit);
>> +            dom_old_util += rt_unit_utilization(svc->period, svc->budget);
>> +            nr_units++;
>> +        }
>> +
>> +        new_total = prv->utilization - dom_old_util +
>> +                    (uint64_t)nr_units * new_util;
>> +
>> +        if ( new_total > prv->utilization && new_total > rt_utilization_cap(d) )
>> +        {
>> +            rc = -EINVAL;
> 
> Is EINVAL a good choice here? I think a different error code might be wanted.
> 
>> +            spin_unlock_irqrestore(&prv->lock, flags);
>> +            break;
>> +        }

Additionally please unlock first, then set rc. The compiler may do such a
rearrangement, but it also may not.

Jan

