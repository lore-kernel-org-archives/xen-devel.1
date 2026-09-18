Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCFFC88E75
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 07:56:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424833.1649052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TS2-00075S-Ag; Fri, 18 Sep 2026 07:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424833.1649052; Fri, 18 Sep 2026 07:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TS2-00075J-5Q; Fri, 18 Sep 2026 07:56:06 +0000
Received: by outflank-mailman (input) for mailman id 1424833;
 Fri, 18 Sep 2026 07:56:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x7TS1-00075D-2S
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 07:56:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7TS0-00G1oD-BX
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:56:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacee92-8faa-0a2a0a5109dd-0a2a450590fc-4
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:56:04 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aaceda3-4cb1-0a2a45050019-4a7de18dd80b-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:52:04 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d822dso3006625e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 00:52:03 -0700 (PDT)
Received: from [192.168.1.109] ([88.230.43.170])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7d1cca3sm29583815e9.11.2026.09.18.00.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 00:52:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789717923; x=1790322723; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4rlEcaV00AvkcPBwnwJy+XQ/erHrlEYt1ZIbqoN5K0=;
        b=d1eHCxHGwezoITZuZwC0E79gikFUn56osg+Zm6f/v95qlzdUgEntT4vFA/ByjOKIq5
         Z3e4XAF1lAdxE5u4X4SExmhR/iTJxSvPXIqNNP7CrlEnp2l00p9TWRDS1K5ol/WxwPys
         O8xO2C36MTTvhDBydOPrVBijLejzePvGvc8Nq0eL15L/VT+lyzRhfrvsykKT6dN9AJ8D
         0KmudXn7HYb7FsB3XNyZFtOnul65DJNy/Hhi3fmBDsyER3MgF38xqz0cP0IEt2mzo3Aw
         czRQj7bEiM8HoVerIx7HEcLHfEDhLnL1+h+2usJTx8mVg71VnhhW0EreGqy2pQXOhzp5
         JN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717923; x=1790322723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4rlEcaV00AvkcPBwnwJy+XQ/erHrlEYt1ZIbqoN5K0=;
        b=vtL8JaOmXmQPZmnqDIfyomOycq1srcTqr7reLGtkprG4JUJsANvqjpid7YJQ4rA5+1
         FlbafoAggX5DRI45L7VB01a/MpN3kb4DoLogykOtgwtXb8mOLO722nSqImLc2fPKibl4
         XS657YjstxRSg6+yRjS2iwcUcvDMGirBfeKTcUpJLVYDL3+R12aWY539B+4ZumTk61NA
         azlIH2wKoNynTizgYRWpupvz01wNi9dYIbaMccl6aAC0+LmNl9ElWd4SnZvly8mRZqso
         RGU24B86RnvltUJ+xfQsPiKzhIbkBx+nrEIJYDacDF6vZ0onZThcmEGTgYSidhVoGkFj
         GwQA==
X-Forwarded-Encrypted: i=1; AKwUvBygnZqTT5K2qcDGwFeihpZsSYTaH6COa9IxH93I3BHASacZTIgS0h5kmrH4bix9z6wJCEBG6oj6NU8=@lists.xenproject.org
X-Gm-Message-State: AFuF++ncC87dDJs5C4vYrvIDEY9j035reNR5UgjfNhVpZgQzM44pWHeH
	Gkvi2RgEy1aPupAbKsfFJes6AzSileC7AQGUcXnwxM7Z3aQtaC1DaEBq
X-Gm-Gg: AYBFou2I1jzuWGlMQA9WFrY81qZwSPc8e8ZAv+bEtFMCHacUaey2q1dE7vRCxF5CrxK
	DKasLHeRZ1iy9P5Iq37oTnEnRWZE1tWAvfohsh8TWVh+bqjTIF8CKLInKy5uWhr9iVR6F+rzbtQ
	OYWFt6Tf5KURMS5Ae4TFM58NVqpV4IU/n1npEPo8Iz9WoYapqKzqE7ENt7b8HyFvfH4espjzzxE
	eQVK6dzQcTVixcCtRjWtCG8mJmw5sdLDoXNRsXRTTP8ncT1a2rm1Gcw6h8S1h5Uy8D4xw1VulH+
	8FqPhS8l9SCpDkBjNCm/uFpPF024vZ8wDI/L744yJOrYFDgwyjJekx4JppIxJ2Y+9Xyk1nHLrea
	73EM/JWjOdmxNUYD01bZ3yGfLKoJrVdbs+XQomBlyCC+oDEyOVDePHL1EWbo8uiuse4cUHGFi9i
	IzuMoV/2uczjv2O6YvTW4y1KmXJ2gXlZPn4UwXFwZbXo97u0tNtOi4PAEl7gsHQPd2sMu9Xropj
	WGLWVqyJ4j8WlW5
X-Received: by 2002:a05:600c:6085:b0:49d:797:8488 with SMTP id 5b1f17b1804b1-49fc567338bmr17631565e9.1.1789717923045;
        Fri, 18 Sep 2026 00:52:03 -0700 (PDT)
Message-ID: <a146fd88-6eac-4756-8eae-ac34cc847eea@gmail.com>
Date: Fri, 18 Sep 2026 10:51:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/sched: rtds: enforce admission control in xl
 sched-rtds
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-3-frn1furkan10@gmail.com>
 <e64415b8-f117-43d8-a977-8994650050c2@suse.com>
 <0899d0b5-431a-450d-9aec-796f73f92a83@gmail.com>
 <502268de-9e38-425b-bbc5-6202ed981398@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <502268de-9e38-425b-bbc5-6202ed981398@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1789717924-F48A62A1-78BC8FAE/3/8867283744
X-purgate-type: clean.bounce
X-purgate-size: 3162



On 9/18/26 10:46, Jürgen Groß wrote:
> On 14.09.26 12:40, Furkan Çalışkan wrote:
>>
>> On 9/14/26 12:16, Juergen Gross wrote:
>>> On 26.08.26 06:57, Furkan Caliskan wrote:
>>>> Now that we have introduced admission control for new and
>>>> removed units. Extend it to XEN_DOMCTL_SCHEDOP_putinfo and
>>>> putvcpuinfo, so growing an existing reservation via
>>>> xl sched-rtds is checked too.
>>>>
>>>> putinfo sets the same (period, budget) for every unit of a
>>>> domain at once, so it tests the whole domain's utilization
>>>> delta atomically, rather than unit-by-unit, which could
>>>> spuriously reject an overall-acceptable change depending on
>>>> iteration order.
>>>>
>>>> putvcpuinfo changes one unit at a time, so it just calls
>>>> rt_admission_test() directly.
>>>>
>>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>>>> ---
>>>>    xen/common/sched/rt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 42 insertions(+)
>>>>
>>>> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
>>>> index 9126320801..9643a277fe 100644
>>>> --- a/xen/common/sched/rt.c
>>>> +++ b/xen/common/sched/rt.c
>>>> @@ -1527,11 +1527,43 @@ rt_dom_cntl(
>>>>            op->u.rtds.budget = RTDS_DEFAULT_BUDGET / MICROSECS(1);
>>>>            break;
>>>>        case XEN_DOMCTL_SCHEDOP_putinfo:
>>>> +    {
>>>> +        uint64_t dom_old_util = 0, new_util, new_total;
>>>> +        unsigned int nr_units = 0;
>>>> +
>>>>            rc = rt_validate_params(&op->u.rtds, &period, &budget);
>>>>            if ( rc )
>>>>                break;
>>>>    +        new_util = rt_unit_utilization(period, budget);
>>>> +
>>>>            spin_lock_irqsave(&prv->lock, flags);
>>>> +
>>>> +        /*
>>>> +         * Same (period, budget) for every unit of d: test and commit
>>>> +         * the domain's whole utilization delta atomically, rather
>>>> +         * than unit-by-unit, which could spuriously reject an
>>>> +         * overall-acceptable change depending on iteration order.
>>>> +         */
>>>> +        for_each_sched_unit ( d, unit )
>>>> +        {
>>>> +            svc = rt_unit(unit);
>>>> +            dom_old_util += rt_unit_utilization(svc->period, svc->budget);
>>>> +            nr_units++;
>>>> +        }
>>>> +
>>>> +        new_total = prv->utilization - dom_old_util +
>>>> +                    (uint64_t)nr_units * new_util;
>>>> +
>>>> +        if ( new_total > prv->utilization && new_total > rt_utilization_cap(d) )
>>>> +        {
>>>> +            rc = -EINVAL;
>>>
>>> Is EINVAL a good choice here? I think a different error code might be wanted.
>>
>> Would EBUSY be okay here? Or what else would you suggest?
> 
> EBUSY is a liitle bit better. What do you think about ENOSPC?
> 
> 
> Juergen

ENOSPC sounds good to me, I'll go with that.

Thanks,

Furkan


