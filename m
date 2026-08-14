Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1ABC5CFCF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 07:38:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390876.1630995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumUE-0007NM-RF; Fri, 14 Aug 2026 07:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390876.1630995; Fri, 14 Aug 2026 07:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumUE-0007NF-OL; Fri, 14 Aug 2026 07:37:54 +0000
Received: by outflank-mailman (input) for mailman id 1390876;
 Fri, 14 Aug 2026 07:37:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wumUD-0007N9-MK
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 07:37:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wumUC-001upz-LB
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 09:37:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ec5c2-8faa-0a2a0a5109dd-0a2a4502dbe2-36
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:37:49 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ec5cd-6ca4-0a2a45020019-d155dd35c539-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:37:49 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so422451f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 00:37:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f200752sm6220606f8f.1.2026.08.14.00.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 00:37:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1786693068; x=1787297868; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5ywdEJtyMtVKN+jZ3Sl6j/K2PxgNHzvC0RucKg8v/4=;
        b=IZnIZSqSMoy6s/9jc1DwpiMUbXP6ZrXvS7DGtX7VhClW+ICT+wppgYq6s19P2mpsMW
         7V+OlXcNovDqnQupry+fFVe4ixS57PfSeK0kC+o5SAL/aOBLQTC8jZLFPbzQS6VQT5F6
         iYo4Rjgy+Z4vsVs6hWrvQ4d19ZOzVPHZZP0X9exVS2lQisLb8bTPFhPgXfWgX68rcMDE
         31Q5z8THS+3u60R0ZKRd+k1mGnut8YiqgBP85+YOmVewr1DTu2KK3+0OgYFmsUn9osCk
         InMeV6qOZ2snyLTqm0YiyxEpWgBdC9gq8imLu8fF0/6f7hj5xyeJNPgRessPY8ws9Vo+
         zapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693068; x=1787297868;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5ywdEJtyMtVKN+jZ3Sl6j/K2PxgNHzvC0RucKg8v/4=;
        b=EsapNLRgsoq7zL8qez/OXii/noThzSQjh8o5pxMHden5MJaojC/y0g11iEq09IbRFr
         xYMk7dDsx33lu4x6PxoxuOuz6/6R2so7izb9JiQlLDv72GD6otwwMxYSoWdCoaJ3rk4L
         jTA2uHx2adlJAPosVALe0vMvm8qABnxKotIE5bucgE+eGWREy96xOFxvquYV+blN/gBK
         ySc2puFxQxuQ1eDJ+V3WbaGnAcrzRb49wGDFSpGyQCYgFkzZ20XqGDBjQ9utwRE8EuPi
         3EsmTu4IcnpKWqr4VX+3Enh6MqzVQPtALVNplY0LBCtW5ayh1+3GE5SLh/in2h+XyWpM
         IZKw==
X-Forwarded-Encrypted: i=1; AHgh+RqBISP12bHA50WsZlbVfcxMtDOJlGghakee+Lynn4geo9EPcUjVipktawXSpjLOxXbM6NwrAbIs6mo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLiXke/oYVE2d4w1vXI9ezmM83LRswCw6dYA3i96HeepI1sBJu
	jLNA5BFoVL0PRxH0vr+6AnLXV9+DMDzVj2lvDiuJlWvf9ORV/mat55NJ6YJ8Y41ycA==
X-Gm-Gg: AR+sD11d2fZOktHm795+GGIVo/I8+ySUs5kNYo8/O5bQ/adurncxoM9nuQ4Ko3Yii8R
	thE5JlIdIpenjMbd61d5Drgx7Iy4D3j5SEr9Z2rTWutTcD9oNV5+G3CJ6WqsjnJF7AP3eDss2kS
	nSfxDVWZQpT2FTD+8FNpLtoPy2LGTTWOaM4HmtH+8B0jIjG5M7zFXYKMrx1Y7pEe6Vqt0iW8DOU
	LY8hvJc8T5xyLGc2kWaefqqpoA7mHd94thLqjPUGuH3Gk/JnJc4gYEBjDlm6HbobRCWfCLUsC/D
	tllfLoeD/78qWJy5hXE2KVdELPech+mBpS67Qnue65aa+dfEXyWJzQN6FRv7werY2ZsM14p4uVZ
	VPlSx1cFiAqSjJ8BggKiG7IlT7e/NzQBv112cId8WQFkn4HzIUA3+254XoxDE5MWDDL9c+IJu8z
	G1+bmR8rA9cLIpE9wmwv7jKxUshXlkiuxTeGvYSCS7e7NQO2PJ77waPZRO3730OKzjy3tt2ahA8
	YwI1xHD1lfm3VDbhAe4qKbTZ9qVthijD7VOEx64Ul3DVnnYTgMVn9VpPGy7I14=
X-Received: by 2002:a05:6000:41ee:b0:481:51ce:542f with SMTP id ffacd0b85a97d-4816076f7a6mr5190548f8f.21.1786693068585;
        Fri, 14 Aug 2026 00:37:48 -0700 (PDT)
Message-ID: <8cecaca1-f717-423d-a852-8378599a478d@suse.com>
Date: Fri, 14 Aug 2026 09:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/20] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <ed247fcc594346ad20a3d12e5d49c8f48ba6792a.1785836421.git.oleksii.kurochko@gmail.com>
 <3bd3a9d5-444b-4bb5-9a4c-8353f98802a9@suse.com>
 <31674604-d595-4706-b5b6-cb3e9ed4d148@gmail.com>
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
In-Reply-To: <31674604-d595-4706-b5b6-cb3e9ed4d148@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1786693069-F2EB32AC-C348E66F/0/0
X-purgate-type: clean
X-purgate-size: 5650

On 13.08.2026 19:03, Oleksii Kurochko wrote:
> On 8/13/26 4:54 PM, Jan Beulich wrote:
>> On 04.08.2026 17:47, Oleksii Kurochko wrote:
>>> @@ -1324,9 +1359,15 @@ int evtchn_reset(struct domain *d, bool resuming)
>>>           rc = -EAGAIN;
>>>       else if ( d->evtchn_fifo )
>>>       {
>>> -        /* Switching back to 2-level ABI. */
>>>           evtchn_fifo_destroy(d);
>>> -        evtchn_2l_init(d);
>>> +
>>> +        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>>> +            /* Switching back to 2-level ABI. */
>>> +            evtchn_2l_init(d);
>>> +        else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
>>> +            evtchn_fifo_init_ops(d);
>>> +        else
>>> +            evtchn_none_init(d);
>>
>> This being the same as ...
>>
>>> @@ -1625,7 +1666,13 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
>>>   
>>>   int evtchn_init(struct domain *d, unsigned int max_port)
>>>   {
>>> -    evtchn_2l_init(d);
>>> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>>> +        evtchn_2l_init(d);
>>> +    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
>>> +        evtchn_fifo_init_ops(d);
>>> +    else
>>> +        evtchn_none_init(d);
>>
>> ... this: Maybe have a small helper (evtchn_preinit()?), to reduce the
>> duplication? Would require comment updates then as well.
> 
> I think then it will be needed to fix a lot of comments. My suggestion 
> is the following:
> 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index 0911808fe861..809638ce4bfd 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -71,10 +71,23 @@ static void evtchn_none_init(struct domain *d)
>       d->evtchn_port_ops = &evtchn_port_ops_none;
>   }
>   #else
> -/* Declaration only; the calls below are DCE'd unless both configs are 
> off. */
> +/*
> + * Declaration only; the call in evtchn_preinit() is DCE'd unless both
> + * configs are off.
> + */
>   void evtchn_none_init(struct domain *d);
>   #endif /* !CONFIG_HAS_SHARED_INFO && !CONFIG_EVTCHN_FIFO */
> 
> +static void evtchn_preinit(struct domain *d)
> +{
> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> +        evtchn_2l_init(d);
> +    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
> +        evtchn_fifo_init_ops(d);
> +    else
> +        evtchn_none_init(d);
> +}
> +
>   /*
>    * Lock an event channel exclusively. This is allowed only when the 
> channel is
>    * free or unbound either when taking or when releasing the lock, as any
> @@ -1359,15 +1372,9 @@ int evtchn_reset(struct domain *d, bool resuming)
>           rc = -EAGAIN;
>       else if ( d->evtchn_fifo )
>       {
> +        /* Switching back to the default ABI. */
>           evtchn_fifo_destroy(d);
> -
> -        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> -            /* Switching back to 2-level ABI. */
> -            evtchn_2l_init(d);
> -        else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
> -            evtchn_fifo_init_ops(d);
> -        else
> -            evtchn_none_init(d);
> +        evtchn_preinit(d);
>       }
> 
>       write_unlock(&d->event_lock);
> @@ -1666,12 +1673,7 @@ void evtchn_check_pollers(struct domain *d, 
> unsigned int port)
> 
>   int evtchn_init(struct domain *d, unsigned int max_port)
>   {
> -    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> -        evtchn_2l_init(d);
> -    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
> -        evtchn_fifo_init_ops(d);
> -    else
> -        evtchn_none_init(d);
> +    evtchn_preinit(d);
> 
>       d->max_evtchn_port = min_t(unsigned int, max_port, INT_MAX);
> 
> diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
> index c8ee09807008..156514fefff6 100644
> --- a/xen/common/event_channel.h
> +++ b/xen/common/event_channel.h
> @@ -71,8 +71,8 @@ static inline void evtchn_fifo_destroy(struct domain *d)
>   #endif /* CONFIG_EVTCHN_FIFO */
> 
>   /*
> - * Declaration only when !CONFIG_EVTCHN_FIFO; the (dead) calls in
> - * evtchn_init() and evtchn_reset() are DCE'd in that case.
> + * Declaration only when !CONFIG_EVTCHN_FIFO; the (dead) call in
> + * evtchn_preinit() is DCE'd in that case.
>    */
>   void evtchn_fifo_init_ops(struct domain *d);
> 
> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
> index 3b6e619c5278..f11c4c16efa3 100644
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -423,10 +423,9 @@ static const struct evtchn_port_ops 
> evtchn_port_ops_fifo =
>   };
> 
>   /*
> - * evtchn_fifo_init_ops()'s only call sites are in the
> - * IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branches of evtchn_init() and
> - * evtchn_reset(), which are never reached on HAS_SHARED_INFO=y builds
> - * because of DCE.
> + * evtchn_fifo_init_ops()'s only call site is the
> + * IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branch of evtchn_preinit(), which is
> + * never reached on HAS_SHARED_INFO=y builds because of DCE.
>    */
>   #ifndef CONFIG_HAS_SHARED_INFO
>   void evtchn_fifo_init_ops(struct domain *d)
> diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
> index 930190054cf0..595dedf0792c 100644
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -211,7 +211,7 @@ static bool evtchn_usable(const struct evtchn *evtchn)
> 
>   void evtchn_check_pollers(struct domain *d, unsigned int port);
> 
> -/* Close all event channels and reset to 2-level ABI. */
> +/* Close all event channels and reset to the default ABI. */
>   int evtchn_reset(struct domain *d, bool resuming);
> 
> Does it look good for you?

Yes, thanks.

Jan

