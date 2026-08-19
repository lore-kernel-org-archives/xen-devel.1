Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC427C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 10:44:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395150.1633648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdm6-00051w-I3; Wed, 19 Aug 2026 10:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395150.1633648; Wed, 19 Aug 2026 10:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdm6-00051p-F7; Wed, 19 Aug 2026 10:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1395150;
 Wed, 19 Aug 2026 10:44:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwdm5-00051j-1w
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:44:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwdm4-009n3j-EC
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 12:44:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8588d8-8faa-0a2a0a5109dd-0a2a450be52c-30
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:44:00 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8588f0-b7e8-0a2a450b0019-d155dd2bb84d-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:44:00 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47362928f65so781991f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 03:44:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14d059bsm4462722f8f.36.2026.08.19.03.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 03:43:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1787136240; x=1787741040; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfpqXzda9pGcVGMV68pff/PmOJj4RBlw1c2TOpv5JoE=;
        b=LlKQjQWObQyqBSxz0gZg/PbRxjO8BdXfOBc/D7yOm/foGaHF2tkdyVoJsdbwwo95Fm
         265CLRTKaY2Qvv6RMcZlLjfzvZt7E65sEiOKKBjeNEwrB8b2vl5+DZuIwzRA/2otX/a8
         lPedJTgF2iewJpYQw8Yr+EQyBZoTvoNNIcp48joUeJFm21b1KYt0DHUoMhBxQWW6jmQS
         JLo9UxlMqIufsL9KNfOXH22F2ktPF9F6+wCmb2ra/cXsxa2TcIv5lmmVNkQaI89hkANu
         ohC9Yn21+BYYdE89uNRF+UBlJfBgj/dQMZgq1w7oHkL5hOW1CIU2ofTDyynZqWQBlFiL
         tzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136240; x=1787741040;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfpqXzda9pGcVGMV68pff/PmOJj4RBlw1c2TOpv5JoE=;
        b=rlIKFqa6gCFa907flm7cRKmxYfZMKjMoG0y/EYWNXpN4Qo1HeeMsheWRlPm6YH2gnC
         zTxxrVe734C/vhrtAhYJVQOL/SmJvSVauiMYcSQGHpiJfc8R8k0oMQ+Hh+k1pQdRPy9T
         U9+9NtSBQiRWxTHLH3a8ShPX7GHoUv80edqU/CSgaDgjOfCqXrG9pUFXf0C14wKvdtxC
         xCoah3Dojw5CTE28tLf53HSDSHXGJ+IrO/gwoVcFdcywnmp7hoEF+34CYDxjKLT6gHh7
         MVf8Q9ewu4nh5Xoqt9kmncTUGYKsKRdO8gWo3F09iT/b2nGaUmFrEEwlX1Fu168an3Tb
         kRnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4a5I7Jaz9H1QiU71x3S91xrgjGQmBZlMCWcmVQEUEzBTdCWb/SIir2QroumZUN83Y/g80aZi8rPI=@lists.xenproject.org
X-Gm-Message-State: AFuF++lGbzmObnwFuXCNh1rxW/Qa2O9+wBNee8cy0/V3oc2ZACkqHZVI
	/gc+uTPFp81XJTtVKBfd4ARVTETqmBUws8oKKsGstz0bvVNFCWYu4XprI+iQmYK+Xg==
X-Gm-Gg: AR+sD12SVCyBBvaMofMTKgNu4mG1Ys2yCrf5hIphN5EeztxszrPGFtxz1/Girq47KuR
	ngEUx1KZXh/YJ7m0JiOKR2bWgqK3Vgyu2TTZmRZrPTPUQdKeh+TA2EmvYHAX30PG4N+Nq/J0YQT
	OKlLZ4feKBdVIc83Vobs8HTKqj2s2jfeY8biqFHpZ9HCXJTE1upy3P8iSu25U7dMHR9/IGglgz9
	qI/ROZkDNAw2i6cGs28x2AKfoLCB/Wg/7p4W3h4qGV9pdfMJqjgAQ1yIda8I2aYIf7V9S/0Ftuv
	JTPSMHUkNz3mQFwRL3Z+2OBAsvIN8lk3zmDA6RE8ti84dLqWw8Ky6fAes5gdZf+iZiPOLwuAu4Y
	xQzoQuE9Xivwye7hrxrrfJWpO29d1zJMi36v/r9mwITj6N5tIdPijarTals68UWs9QI5AGLt8rI
	AodVH6W2OW7RoFL7FzeAUSTIZCpFB2n3xoWn+tkS/3iGPMdBL11g/UPHSTUmPWhCFs0A+OND5i+
	6Fq5XMQuayI0WIlbe9c7Om33NCI82n1FaItV1CLXtQS74W8stnC
X-Received: by 2002:a05:6000:41de:b0:482:a36c:a5e1 with SMTP id ffacd0b85a97d-482b1e875b8mr6574255f8f.1.1787136239836;
        Wed, 19 Aug 2026 03:43:59 -0700 (PDT)
Message-ID: <f687da3b-a9f7-4df3-a113-3cdd0b817e3d@suse.com>
Date: Wed, 19 Aug 2026 12:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-3-frn1furkan10@gmail.com>
 <f9471a2b-6306-41fb-af52-2336af77dfc9@suse.com>
 <e0f91d0e-0b08-4d69-bf94-243bd26f67df@gmail.com>
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
In-Reply-To: <e0f91d0e-0b08-4d69-bf94-243bd26f67df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787136240-ABAD09EA-6F06C7CF/0/0
X-purgate-type: clean
X-purgate-size: 2204

On 19.08.2026 12:39, Furkan Çalışkan wrote:
> On 8/19/26 10:22, Jan Beulich wrote:
>> On 19.08.2026 07:15, Furkan Caliskan wrote:
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -589,6 +589,9 @@ int sched_init_vcpu(struct vcpu *v)
>>>      unit->priv = sched_alloc_udata(dom_scheduler(d), unit, d->sched_priv);
>>>      if ( unit->priv == NULL )
>>>      {
>>> +        kill_timer(&v->periodic_timer);
>>> +        kill_timer(&v->singleshot_timer);
>>> +        kill_timer(&v->poll_timer);
>>>          sched_free_unit(unit, v);
>>>          rcu_read_unlock(&sched_res_rculock);
>>>          return 1;
>>
>> This almost, but not quite open-codes sched_destroy_vcpu(). Would be nice
>> if the cleanup logic was shared. The sched_free_unit() call there could be
>> leveraged here as well; what would need skipping are the sched_free_udata()
>> and sched_remove_unit(). And of course the RCU-locking would need sorting.
> 
> Would something like below be okay?

Maybe, but you need to ask the maintainers of this code, which I'm not a part
of. What I in particular can't easily judge is whether ...

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -589,8 +589,8 @@ int sched_init_vcpu(struct vcpu *v)
>      unit->priv = sched_alloc_udata(dom_scheduler(d), unit, d->sched_priv);
>      if ( unit->priv == NULL )
>      {
> -        sched_free_unit(unit, v);
>          rcu_read_unlock(&sched_res_rculock);
> +        sched_destroy_vcpu(v);
>          return 1;
>      }

... this intermediate dropping of the lock is entirely okay (it looks to be
at the first glance).

Jan

> @@ -869,8 +869,11 @@ void sched_destroy_vcpu(struct vcpu *v)
>      {
>          rcu_read_lock(&sched_res_rculock);
>  
> -        sched_remove_unit(vcpu_scheduler(v), unit);
> -        sched_free_udata(vcpu_scheduler(v), unit->priv);
> +        if ( unit->priv )
> +        {
> +            sched_remove_unit(vcpu_scheduler(v), unit);
> +            sched_free_udata(vcpu_scheduler(v), unit->priv);
> +        }
>          sched_free_unit(unit, v);
>  
>          rcu_read_unlock(&sched_res_rculock);
> 
> 
> Furkan


