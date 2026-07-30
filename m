Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C28C5516D
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 18:22:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378397.1623798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpVO6-0006Ta-3d; Thu, 30 Jul 2026 18:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378397.1623798; Thu, 30 Jul 2026 18:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpVO6-0006TT-0t; Thu, 30 Jul 2026 18:21:46 +0000
Received: by outflank-mailman (input) for mailman id 1378397;
 Thu, 30 Jul 2026 18:21:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wpVO4-0006TN-P9
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:21:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpVO3-006sTG-I6
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 20:21:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6b9609-e002-0a2a0a5209dd-0a2a4504ac42-28
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 20:21:43 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6b9635-b57f-0a2a45040019-888fbc335289-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 20:21:43 +0200
Received: by mx.zohomail.com with SMTPS id 1785435694733529.3708079301904;
 Thu, 30 Jul 2026 11:21:34 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785435698; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M5tKSQN/eK4XndmQFppvlfCZcmIAuZCT3WvnwwwfKSV2pd3H1Nar8ESNvQn2oIqIf8u+/47lR6sz22wYEeEJVcJ/cenzRDULP++oBllF/YUNXdUF4DU7sfNOvzuZ0HnOWkrm0lj8+oJxvEscJbSy8lcyDjjnRa49oEVlFsCd4EY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785435698; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S/fKYTlv9/TcdEm0siUUGC93Ab8FECfqzFTwZC5yJF4=; 
	b=EiX2H5jdfoTVXw3W3HAhT73oB01KUbps7x5LJuZqjhVc7VEGmSoCmewYDIM0Xeo/VrGF6Gkig7kfz/S5EdPfyQGCHdhId2FWYds2PqGtov+H+H2UDkMMJbYMufGprzqKw+Y8Ao4nmfcIqULq0llCW6Tw/JbyMoAYI3DymKh4GOM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785435698;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=S/fKYTlv9/TcdEm0siUUGC93Ab8FECfqzFTwZC5yJF4=;
	b=YbDNW9VvDKxa/Kj9QUtvrac16SvZNWjC8R0wHHVZd6TIO1lbuZFAu4jCVTpqptqR
	4jSU+wl6MKbBBOxNM9ifRmwwPvg+kwmce3Jk5LwsZ2WAI2fmb13qxUCAbDjYIppk2Re
	ip1D6KWluCtmxIl3T7WTbm992cJu/4OWYN+TArXs=
Message-ID: <19775f5b-e458-4336-92a3-8f8103708564@apertussolutions.com>
Date: Thu, 30 Jul 2026 14:21:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] XSM: reduce redundancy in hook machinery
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <7487f138-e5e9-41d6-9291-f5eef42d09a1@suse.com>
 <62738b20-ef4b-47ac-832c-5c5fe353e56f@apertussolutions.com>
 <8030ff8e-ed83-46c4-ba69-4954ee645c38@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <8030ff8e-ed83-46c4-ba69-4954ee645c38@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ebf023/1785435703-C10DDB50-9531B11B/0/0
X-purgate-type: clean
X-purgate-size: 5816

On 7/30/26 11:18 AM, Jan Beulich wrote:
> On 30.07.2026 17:05, Daniel P. Smith wrote:
>> On 7/28/26 9:13 AM, Jan Beulich wrote:
>>> Hooks not taking xsm_default_t as first argument could of course be
>>> adjusted to take one, at which point they could be covered here as well.
>>> Question is why there is this difference in the first place.
>>
>> I have a theory but I am not confident to write it down. I can see if I
>> can confirm with DDG if you really care that much to know the why.
>> Personally having a consistent hook interface convention would provide a
>> simpler pattern for people to follow if they are having to introdcue a
>> new hook.
> 
> Well, I don't really need to know the reason. If you agree that making
> things uniform is a good move, I can simply stick a few more patches at
> the end of this series.
> 

Correct me if I am wrong, but we would be introducing an unused 
parameter in exchange for uniform interfaces that can be generated with 
machinery reducing hook maintenance overhead. IMHO I feel from a 
security standpoint this would be a win. Would you disagree?

>>> .{alloc,free}_security_evtchns() and their dummy wrappers use struct
>>> evtchn[] notation, while xsm_{alloc,free}_security_evtchns() use struct
>>> evtchn *. Is there a reason for this inconsistency?
>>
>> Person had one habit that was counter to Xen preference and missed one?
>> I have no justification for it. IMHO the interfaces should be kept
>> consistent to enable better grep-ability.
> 
> Which direction would you want it changed? Personally I like the []
> notation better when arrays are meant, but the pointer notation will be
> quite a bit easier with the new hooks.h machinery.
> 

I agree, my preference is [] for array parameters. But this is a 
readability vs less fragile machinery. As much as I like to know that 
the parameter is meant to be an array vs a instance reference, I would 
prefer more reliability in the machinery. Since you are doing the work, 
I leave to you to decide level of effort vs the most resilient 
implementation of the machinery.

>>> @@ -206,113 +117,57 @@ static inline void xsm_security_domainin
>>>        alternative_vcall(xsm_ops.security_domaininfo, d, info);
>>>    }
>>>    
>>> -static inline int xsm_domain_create(
>>> -    xsm_default_t def, struct domain *d, uint32_t ssidref)
>>> -{
>>> -    return alternative_call(xsm_ops.domain_create, d, ssidref);
>>> -}
>>> +#define XSM_ALT_void alternative_vcall
>>> +#define XSM_ALT_int  return alternative_call
>>>    
>>> -static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
>>> -{
>>> -    return alternative_call(xsm_ops.getdomaininfo, d);
>>> +#define XSM_HOOK0(rtype, name) \
>>> +static inline rtype xsm_ ## name(xsm_default_t def) \
>>> +{ \
>>> +    XSM_ALT_ ## rtype(xsm_ops.name); \
>>>    }
>>>    
>>> -static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
>>> -{
>>> -    return alternative_call(xsm_ops.get_domain_state, d);
>>> +#define XSM_HOOK1(rtype, name, type1) \
>>> +static inline rtype xsm_ ## name(xsm_default_t def, type1 arg1) \
>>> +{ \
>>> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1); \
>>>    }
>>>    
>>> -static inline int xsm_set_target(
>>> -    xsm_default_t def, struct domain *d, struct domain *e)
>>> -{
>>> -    return alternative_call(xsm_ops.set_target, d, e);
>>> +#define XSM_HOOK2(rtype, name, type1, type2) \
>>> +static inline rtype xsm_ ## name( \
>>> +    xsm_default_t def, type1 arg1, type2 arg2) \
>>> +{ \
>>> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2); \
>>>    }
>>>    
>>> -static inline int xsm_domctl(xsm_default_t def, struct domain *d,
>>> -                             struct xen_domctl *op)
>>> -{
>>> -    return alternative_call(xsm_ops.domctl, d, op);
>>> +#define XSM_HOOK3(rtype, name, type1, type2, type3) \
>>> +static inline rtype xsm_ ## name( \
>>> +    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3) \
>>> +{ \
>>> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2, arg3); \
>>>    }
>>>    
>>> -#ifdef CONFIG_SYSCTL
>>> -static inline int xsm_sysctl(xsm_default_t def, const struct xen_sysctl *op)
>>> -{
>>> -    return alternative_call(xsm_ops.sysctl, op);
>>> +#define XSM_HOOK4(rtype, name, type1, type2, type3, type4) \
>>> +static inline rtype xsm_ ## name( \
>>> +    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
>>> +{ \
>>> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2, arg3, arg4); \
>>>    }
>>> -#endif
>>>    
>>> -static inline int xsm_evtchn_unbound(
>>> -    xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
>>> -{
>>> -    return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
>>> +#define XSM_HOOK5(rtype, name, type1, type2, type3, type4, type5) \
>>> +static inline rtype xsm_ ## name( \
>>> +    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
>>> +    type4 arg5) \
>>
>> Looks like you have copy/paste typo?
> 
> Indeed. And the last two parameters of .pci_config_permission() sadly aren't
> distinct enough to make the flaw apparent at build time. (That looks to be
> the only hook with 5 parameters.)
> 

I believe in 19 pci_config_permission() 5th parameter gets changed from 
1(uint8_t) to true (bool), while type4 is uint16_t.

> Thanks much for spotting.
> 

Your welcome.

>> I would just note there is quite a bit of churn in this patch, most of
>> it is mechanical, but makes it easy for these to slip through.
> 
> Right. Fortunately this needs doing only once.
> 

Yep, just makes review a little more fun.

>> After fixing this typo,
>>
>> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Thanks.
> 
> Jan


