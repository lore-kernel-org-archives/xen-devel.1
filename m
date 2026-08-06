Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2BBC55174
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 00:37:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384007.1627084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrm6f-00075b-DI; Thu, 06 Aug 2026 00:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384007.1627084; Thu, 06 Aug 2026 00:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrm6f-00075T-9F; Thu, 06 Aug 2026 00:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1384007;
 Thu, 06 Aug 2026 00:37:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wrm6d-00075M-Bc
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:37:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrm6c-00B99s-LJ
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 02:37:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73d725-bab6-0a2a0a5309dd-0a2a4501bc9c-12
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 02:37:06 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a73d730-5984-0a2a45010019-888fbc335282-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 02:37:06 +0200
Received: by mx.zohomail.com with SMTPS id 1785976617233237.7105325983797;
 Wed, 5 Aug 2026 17:36:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1785976619; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xk/U3OB0byKOg1m3hHzUVjM25Zod62w5PRAOq84C6xyAovu9W3YMWQxnWrh+PXrxui3G4B/EfdnjLtJeQ5W+4o9SWjgRWFhIsBkX/6nWMM9CUsOjylQYZJy67Vw9GRbW4sXoIuWpkgzbh+x/cvBkAZURNp/thcVgxGXuBSRMPOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785976619; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oqa2ViCllzgOCvQN5qwRSj/4I/e66JiUdGJ48N8Wzro=; 
	b=OJV84ze+RSTzOYS0NXhPv8NqpQTTY+Wj3iqTBssxfam87gT0cgq5q8f1oZqPKkagHiCYcWq5aKeGGJ0XmLLSHvfgSLYHdOe/4TdlQZZF5EvdRqMEdbwGgQcOCQ+NZM42oFzCklv5TlOYqsH0kw580DQAMIioEqxcvnia8HeZR8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785976619;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oqa2ViCllzgOCvQN5qwRSj/4I/e66JiUdGJ48N8Wzro=;
	b=OgRgsRBfljTgR7lOswZ9etHDS0I4SG6iYHfBVUHWFQR1/wjcZYfF8WjMz0IXmqeg
	MdJ9NjTuNQFkmBip4mn7uxyyck6NwOHbrQX6ToB5YVmjgwq3qdF1VpAnNckxwhzNVSz
	TWH2Cr+Hk6hbND5VoQNDBwob4TXkVrQfKKERJW88=
Message-ID: <185b9a3a-2a54-4f45-8c22-5792666b2aa3@apertussolutions.com>
Date: Wed, 5 Aug 2026 20:37:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
 <bbc2fb48-d79e-4f00-81b4-0170dd910aaa@amd.com>
 <8097d8e8-42ec-463a-8247-56c9e4d834cd@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <8097d8e8-42ec-463a-8247-56c9e4d834cd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-d62444/1785976626-1E867757-A83E8F75/0/0
X-purgate-type: clean
X-purgate-size: 3026



On 8/4/26 3:53 AM, Jan Beulich wrote:
> On 03.08.2026 23:01, Jason Andryuk wrote:
>> On 2026-07-28 09:22, Jan Beulich wrote:
>>> --- a/xen/include/xsm/dummy.h
>>> +++ b/xen/include/xsm/dummy.h
>>
>>> @@ -751,27 +751,32 @@ static XSM_INLINE int xsm_dm_op(XSM_DEFA
>>>    #endif
>>>    
>>>    #ifdef CONFIG_ARGO
>>> -static XSM_INLINE int xsm_argo_enable(const struct domain *d)
>>> +
>>> +static XSM_INLINE int xsm_argo_enable(XSM_DEFAULT_ARG const struct domain *d)
>>>    {
>>> -    return 0;
>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>> +    return xsm_default_action(action, current->domain, d);
>>
>> This one I think should be
>>       return xsm_default_action(action, d, NULL);
>>
>> Usually current is passed in for the check, but for domain_create() ->
>> argo_init() it is the under-construction domain.
> 
> And in that case we want to make sure that current->domain may enable Argo
> for d.
> 

Jason is correct here, the design of Argo is that authorization is 
granted by the hypervisor and not by any domains. It's why we coined the 
term Hypervisor Mediated eXchange (HMX). The source of that 
authorization was designed to be XSM. As such the intent of this check 
is, "is d allowed to register rings".

>>>    }
>>>    
>>>    static XSM_INLINE int xsm_argo_register_single_source(
>>> -    const struct domain *d, const struct domain *t)
>>> +    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
>>>    {
>>> -    return 0;
>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>> +    return xsm_default_action(action, d, t);
>>>    }
>>>    
>>>    static XSM_INLINE int xsm_argo_register_any_source(
>>> -    const struct domain *d)
>>> +    XSM_DEFAULT_ARG const struct domain *d)
>>>    {
>>> -    return 0;
>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>> +    return xsm_default_action(action, current->domain, d);
>>
>> Similarly:
>>       return xsm_default_action(action, d, NULL);
>>
>> The single call is:
>> xsm_argo_register_any_source(currd);
> 
> There being just a single call puts this on the edge. If there was another
> one not passing current->domain, I think the same argument as above would
> hold here. And the general concept is what I think should matter when
> writing the dummy implementations.
> 

As explained above, the check is asking the hypervisor if the domain 
currd is allowed to register wildcard rings.


>> These argo hooks all pass in their arguments explicitly, so I think we
>> should do that and not use current.  (The send and register hooks could
>> use current, and that could make sense as those map to hypercalls.  But
>> it is correct today with the explicit arguments.)
>>
>> With the changes:
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Thanks, but no - unless I misunderstand how permissions are intended to
> work here, I don't think I can make the changes requested, and hence I
> can't apply the R-b.
> 

Please apply the changes requested.

v/r,
dps



