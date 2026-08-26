Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930EEC5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 06:15:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399633.1635619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz6uG-0002Dx-Cd; Wed, 26 Aug 2026 06:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399633.1635619; Wed, 26 Aug 2026 06:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz6uG-0002Dq-9r; Wed, 26 Aug 2026 06:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1399633;
 Wed, 26 Aug 2026 06:14:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wz6uF-0002Di-5H
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 06:14:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz6uB-00Bxk9-Lc
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 08:14:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8e843b-bab6-0a2a0a5309dd-0a2a4507b616-48
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 08:14:35 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8e844b-b4ea-0a2a45070019-d155d02ac0da-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 08:14:35 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6a17211b9ecso1238691a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 23:14:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5deae9a75sm2448693a12.28.2026.08.25.23.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 23:14:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787724875; x=1788329675; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tiSCojhdiH2JeEvty2kEuMzpDUHyn8pRiRkSiqHcmFg=;
        b=EYVqTbS7OkQBHT4B1no5eJbjUzGQyy6auRroHybF/OmEL7c2rErJJlluX2wTiTYfEI
         SKSbWCilnZDcClyq8+i/aRUdFBbe0It4tZ3XrEhvgFd3tScW/1YBCiwFWS5DQKzJWddF
         1lyKg9dLQyysEINrDOFbRSK0QUNO9FPSDJlWTNsRb1gMO8IvyPMVkWzhlhDmL5jqQHiu
         0lC/q+Ncz6enS9vyhmH4X4rnC18aGdY6XNDYJz1pmXQSLeRSAPStu/5WrE58LDoMfQ47
         aSo4vmrH3nUwg0kqTgvLcgspUroTD2WAV5r+WOX11D8iIawHT0fBfYjwLxKa6WYflwqq
         a9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787724875; x=1788329675;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tiSCojhdiH2JeEvty2kEuMzpDUHyn8pRiRkSiqHcmFg=;
        b=K7LDgNIsEeKAZhLArls/ocxqvy1PSalj3EjjU0utJLi0gMQtJ496N3bO6h5sOX891o
         fGKm4e7XAmZRaL1rEq5YyFnO6Utu3eKNvSRdEPE+UXYvtP2gIR/vLAoUYXGT1zp+GlTu
         8PQNIHymJ7fEuNl2JMaXIVOS7OsZAKqP1qoeGKxeyK0lTryOMK8NIvnYflqXtJai3fSw
         LkrryZPbwU6Qb0vfDyzT50mO+XzO8Eg7tw6WrLUgnArDnOWjSQIJj2koL4mRbx11myyJ
         SOy9pc+cB7+d5QsVciu3x228B5dq/bEUtRTwA+Sqzn/a3ieLcnH/10y2m+mr1vDw0Ai0
         pitw==
X-Forwarded-Encrypted: i=1; AHgh+RrP59oHLcEa5DttT2NJzv8p4QY383NTezijXP9/IX4pC3MBhWSg/zkJ5Yt1lE1o74IlWWontKKjJK0=@lists.xenproject.org
X-Gm-Message-State: AFuF++neuzC3J87llZ1AUs9/eu5sUmL95TMDyWWxvMCADz9RVqJFaQxU
	X7k62esiom2BP4AKu+KknQ9skMvpD2kqrjwrUEqpRjXIWHQwNAAuzp8E9wEakXNbtg==
X-Gm-Gg: AR+sD11zLaMUDdSsP54m+4hF0wizleomkRGqzNoJ2aDje4eo8UMSrV4xnI8h+NZvBEQ
	jtwWxdg9XTYdqbWbY18/ZlbNV7OjeMp38NdwgnPR0VXeq7qh1mdR+hRqYNMMXeAMq3cLRiX0fW1
	sZGq5KdjBeEKOR/9MLO/xsDzHoRjxvlzawI950b4wDxkFTU2/ei/CkKECNRfLpIPkLycW9XcLvC
	FCtVVH8qAMPjvSXXaf/OupgJibYpDZJXqjK1vA1uhPp+qsq9A6AX8V7LTQRjpzEkLK1Ss6Z+Qf6
	El7ccF7N06Dne79l2hjLGEM18Bz+EfwR88wVs+3J5IX2MjWi8HQbBQuA/q2CJjaxS7GkwdySJFF
	O2EqeyMs7f+YdlwpzGNp7TCNbvcX/zW15UgkH7ZnWRCZMXFefPjb3CYo8IptZVxg0cNWact1uNI
	biH4EgYOOu5E3ojPBraNr0MNmJW54L3YXASiXrW7L+74v7ZgBM20CyscUmy73tfxAR+JgnDyxcU
	lelTokrbc47VUGJJ9kVTAiHwt2YKJqrxbg0XM1HbfR5buv7Jdfi
X-Received: by 2002:a05:6402:1586:b0:6a5:d8f0:dc12 with SMTP id 4fb4d7f45d1cf-6a5df64dd40mr5539605a12.14.1787724874966;
        Tue, 25 Aug 2026 23:14:34 -0700 (PDT)
Message-ID: <deeae7d9-b37e-4d60-95fe-a87b7ef59859@suse.com>
Date: Wed, 26 Aug 2026 08:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] xen/sched: rtds: make admission control cpupool-wide
 toggleable
To: Furkan Caliskan <frn1furkan10@gmail.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com, xen-devel@lists.xenproject.org
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-5-frn1furkan10@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260826045720.5779-5-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787724875-A5EC6AE4-BD7CA39D/0/0
X-purgate-type: clean
X-purgate-size: 1471

On 26.08.2026 06:57, Furkan Caliskan wrote:
> @@ -1691,6 +1709,33 @@ rt_dom_cntl(
>      return rc;
>  }
>  
> +#ifdef CONFIG_SYSCTL
> +static int cf_check
> +rt_sys_cntl(const struct scheduler *ops,
> +             struct xen_sysctl_scheduler_op *sc)
> +{
> +    struct xen_sysctl_rtds_schedule *params = &sc->u.sched_rtds;
> +    struct rt_private *prv = rt_priv(ops);
> +    unsigned long flags;
> +
> +    switch ( sc->cmd )
> +    {
> +    case XEN_SYSCTL_SCHEDOP_putinfo:
> +        spin_lock_irqsave(&prv->lock, flags);
> +        prv->admission_control_enabled = params->admission_control_enabled;
> +        spin_unlock_irqrestore(&prv->lock, flags);
> +        break;
> +    case XEN_SYSCTL_SCHEDOP_getinfo:
> +        spin_lock_irqsave(&prv->lock, flags);
> +        params->admission_control_enabled = prv->admission_control_enabled;
> +        spin_unlock_irqrestore(&prv->lock, flags);
> +        break;
> +    }

Blank line please between non-fall-through case blocks.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -814,6 +814,10 @@ struct xen_sysctl_credit2_schedule {
>      uint32_t ratelimit_us;
>  };
>  
> +struct xen_sysctl_rtds_schedule {
> +    bool admission_control_enabled;
> +};

In the public headers only fixed-width types may be used. The width of
bool is ABI-dependent (no matter that it's exceedingly unlikely to ever
be other than the same size as char).

Jan

