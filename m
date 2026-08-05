Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EC0C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:11:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383107.1626360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXeW-0002Ul-TG; Wed, 05 Aug 2026 09:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383107.1626360; Wed, 05 Aug 2026 09:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXeW-0002Ue-Qb; Wed, 05 Aug 2026 09:11:08 +0000
Received: by outflank-mailman (input) for mailman id 1383107;
 Wed, 05 Aug 2026 09:11:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXeV-0002UY-Lp
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:11:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXeV-0095Bc-2j
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:11:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72fe1b-2eae-0a2a0a5409dd-0a2a450ca3c4-46
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:11:07 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72fe2a-f479-0a2a450c0019-d155dd2bf1a6-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:11:06 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47f7872abb6so353885f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:11:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec231f5csm7197501f8f.23.2026.08.05.02.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:11:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1785921066; x=1786525866; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGV25APuoOGYWcIc/TeUgn93qgV5jI1K78UHmfRhA/k=;
        b=TYSsoK44bQmVSZ/0zdgRnzZCZhGwyJxLd1J8tcozyCdobYwJal/t9+kC811PYOn+fN
         IqNlwvtiXhadQF4witff2IwCZ9U/O8yjIeXxrQp9wgRfpfarOeeekIePUIrq3jcmRibS
         JBzGTnmtMG+rJ76Pe9xv4YAOGHM6zRA/q8lprV1tbcPUU8cRZBUIYmTg8W1ytCVkACxM
         0Sd/J/62lTV5LPJtCf/abIniVKz4rG5AwiX3KnOICgY7L9JTH91SWWheEk265u3e97Zh
         hiLhlAgFNAPqj4gxfst2pPh8RwPLOrpOQMHkLNVsMwL027hCfIXpGp8c/wgg2GySfWYB
         WsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921066; x=1786525866;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGV25APuoOGYWcIc/TeUgn93qgV5jI1K78UHmfRhA/k=;
        b=SCiGtYgtBxlCLg9es0OD3hQ7JbB3GVQnRFp0NzqN+iHoSNdwZupJNfLihDyQHMYEwB
         jjlScQWhNMg0oqryk1Gbsp+XbVSWqlqpSkEHMCQuzqzet/S0jo2t2jGXUDCZnbpCHxAI
         NL7rDnSvv7+FKN5Ki4qpgZD7HR+9N5bn20WgQsYZEBObZkqoH2K/oivklLuty0fJd2ZP
         TzDoKxfTPPqUcsuLi2RFCl0FE7qVLPBQdQlhUTvTGENZqInpu/PdUiuB+CW8TKZuSFEa
         r0brTpBXgd+kaPiNA+Nhu49+EVPHN1z+BMKBRgejfrx9ImaDiA8/E7MwekuLuRU8DBDA
         szFQ==
X-Gm-Message-State: AOJu0YweteyBDw5aG6wQuqYlPXQ1V7YmLVLtvThh0+1zDfrxNOKy7HBQ
	lHJvoZ5LI4J72nI3MACeo+YFro3M8Ra9uJLqa15PphNlFwTbU26KNlfF76VRMn6L8A==
X-Gm-Gg: AR+sD10noqeDvxrbRSTFPOwUxk94gkBbAvM8rah+Z6PW38ZykO9nvSEO5fYchWCVL/H
	zqCMdOlKw+7CEBWVU1Y0B/9wxbNO9/2dCMy8cUflpH7GciDjBJqAXw56U3O4JeKtr50pxJNaKgI
	H6cKY0vUHKQWV8LiS1vt4onlDusQG0Z9jF9rrKZKq5izzi5JyT8jvKpmZe3HwhIi2aLTqbp+ebK
	XLUE6K/xFwgyoaTXTDoeadwUJJeXer4UKVq+Q/skS6uGOw9iHJQN9rGnJ/rBEQEsXhh+BdNuw18
	tZCmZYgkhxU9ZwAsTyOcuUhLKTGsJCZh8t5RoxniOiekTEPUsJWnf4f5Plag7ITIPqBsDQ/skl8
	hgkL5XJtOGsT9ZlpnBF7eQgP8Wtd7NWI4VLfADMbLJEw7gUNUSr+kRDGW+VCg7zE1esZxAxQsLk
	TJ3RWTj33976LjBhgYnGPc2KPsrnrbsMMo7kbhN2E2GLYqPrOY22zbhqcxdWYWS76I+fiX+wnug
	+8Cyz78Rbk6zyHrVezoE+dP8subgdxvGs33sti95qDwQnGNM6BdVUkv3C6DWbk=
X-Received: by 2002:a05:6000:4718:b0:47f:93fc:2d27 with SMTP id ffacd0b85a97d-47fec62c7e1mr8485530f8f.30.1785921066305;
        Wed, 05 Aug 2026 02:11:06 -0700 (PDT)
Message-ID: <b34dff82-8ead-467d-93b6-4dd655234400@suse.com>
Date: Wed, 5 Aug 2026 11:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: Jason Andryuk <jason.andryuk@amd.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
 <bbc2fb48-d79e-4f00-81b4-0170dd910aaa@amd.com>
 <8097d8e8-42ec-463a-8247-56c9e4d834cd@suse.com>
 <57bb7281-5898-4243-837a-1236b25e761e@amd.com>
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
In-Reply-To: <57bb7281-5898-4243-837a-1236b25e761e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785921067-016C6A5B-CD5B4504/0/0
X-purgate-type: clean
X-purgate-size: 4124

On 04.08.2026 16:27, Jason Andryuk wrote:
> On 2026-08-04 03:53, Jan Beulich wrote:
>> On 03.08.2026 23:01, Jason Andryuk wrote:
>>> On 2026-07-28 09:22, Jan Beulich wrote:
>>>> --- a/xen/include/xsm/dummy.h
>>>> +++ b/xen/include/xsm/dummy.h
>>>
>>>> @@ -751,27 +751,32 @@ static XSM_INLINE int xsm_dm_op(XSM_DEFA
>>>>    #endif
>>>>    
>>>>    #ifdef CONFIG_ARGO
>>>> -static XSM_INLINE int xsm_argo_enable(const struct domain *d)
>>>> +
>>>> +static XSM_INLINE int xsm_argo_enable(XSM_DEFAULT_ARG const struct domain *d)
>>>>    {
>>>> -    return 0;
>>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>>> +    return xsm_default_action(action, current->domain, d);
>>>
>>> This one I think should be
>>>       return xsm_default_action(action, d, NULL);
>>>
>>> Usually current is passed in for the check, but for domain_create() ->
>>> argo_init() it is the under-construction domain.
>>
>> And in that case we want to make sure that current->domain may enable Argo
>> for d.
> 
> It's not a hook for current to enable for d, but more of a hook "is d 
> allowed to use argo."
> 
> In the hypercall entry path, it use is clear - "is this domain allowed 
> to make argo hypercalls."
> 
> In argo_init(), it is more of an optimization.  Only initialize if d is 
> allowed to use argo.  I think this use is questionable, but it is the 
> current code.
> 
> In flask, the source is d, the target is xen_t:
>      allow domain_type xen_t:argo enable
> 
> So it is not an operation between domains.
> 
>>>>    }
>>>>    
>>>>    static XSM_INLINE int xsm_argo_register_single_source(
>>>> -    const struct domain *d, const struct domain *t)
>>>> +    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
>>>>    {
>>>> -    return 0;
>>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>>> +    return xsm_default_action(action, d, t);
>>>>    }
>>>>    
>>>>    static XSM_INLINE int xsm_argo_register_any_source(
>>>> -    const struct domain *d)
>>>> +    XSM_DEFAULT_ARG const struct domain *d)
>>>>    {
>>>> -    return 0;
>>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>>> +    return xsm_default_action(action, current->domain, d);
>>>
>>> Similarly:
>>>       return xsm_default_action(action, d, NULL);
>>>
>>> The single call is:
>>> xsm_argo_register_any_source(currd);
>>
>> There being just a single call puts this on the edge. If there was another
>> one not passing current->domain, I think the same argument as above would
>> hold here. And the general concept is what I think should matter when
>> writing the dummy implementations.
> 
> For flask, we have xen as the target again:
>      allow domain_type xen_t:argo register_any_source;
> 
> ... since a wildcard ring doesn't have a known target domain.
> 
>>> These argo hooks all pass in their arguments explicitly, so I think we
>>> should do that and not use current.  (The send and register hooks could
>>> use current, and that could make sense as those map to hypercalls.  But
>>> it is correct today with the explicit arguments.)
>>>
>>> With the changes:
>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Thanks, but no - unless I misunderstand how permissions are intended to
>> work here, I don't think I can make the changes requested, and hence I
>> can't apply the R-b.
> Understandable.
> 
> It seems to me that the XSM hooks have two styles.  Either implicit args 
> (using current) or explicit args.  Today, the argo hooks take explicit 
> like the grant hooks for instance.

Yes, which doesn't make things any easier. I follow your argumentation as
one of the possible interpretations, but I think I really need Daniel's
verdict (as XSM maintainer) here in order to know whether to adjust the
proposed code. (It is true that what you suggest comes closer to the
blanket "return 0" that were previously there in all the Argo hooks,
leaving aside that due to it being XSM_HOOK all of this is cosmetic / doc
only anyway. There is certainly also the option to retain those, but it
feels that doing it like this was wrong from the start.)

Jan

