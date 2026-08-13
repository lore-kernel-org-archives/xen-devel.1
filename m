Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3D1C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 13:03:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390025.1630596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuV5C-0007bO-KR; Thu, 13 Aug 2026 13:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390025.1630596; Thu, 13 Aug 2026 13:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuV5C-0007bG-HQ; Thu, 13 Aug 2026 13:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1390025;
 Thu, 13 Aug 2026 13:02:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wuV5B-0007b5-Uo
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:02:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuV5B-00HOxz-BY
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:02:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7dc072-e002-0a2a0a5209dd-0a2a450899ee-40
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 15:02:53 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7dc078-f659-0a2a45080019-888fbc3352b8-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 15:02:50 +0200
Received: by mx.zohomail.com with SMTPS id 1786626154505860.584720482219;
 Thu, 13 Aug 2026 06:02:34 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1786626157; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LO7naBJAVJPHMMZ+jEBMpA11LsMd5Zn4ZHhMxVSvaKfCPH7zeUFwy56eAsrxkq6tGbAU1K84mm30DrJSD3IiNSJtDb0w3Khil9+7ZotTWyASeMz1i49oz2B8JgEUZ0uj4L1Z7687incXCQ8fJHXf/TOb7iYx9wk+kS4ThH6YUsU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786626157; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jaBbrgXVN92ZqCMwNK561lgwvvP8N+6PwEbaM1sPxAk=; 
	b=fpTkP1W0GYeySeJ9NvvN/D/H24x5tGn0Eq4FQikFraO5iwy7sRsXdyUcZXop+JxiTEgyvgSG0DGGcAXEjdcFWy46mn2mrqqzqOwNL8KvaJvLMkpnZasgV3M5HJrYqe2v8E6950b1KslU9GuhNG1/lSWU9uIYn8DvM5fLSeh62f8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786626157;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jaBbrgXVN92ZqCMwNK561lgwvvP8N+6PwEbaM1sPxAk=;
	b=U+ZJq57lSVSTtOLBiiSxdP5H3RDAZg0ge9TFwaGIe1qvnuCFf/0K6/IoFbk6kC6G
	gcpuMTf7dv7UlVm/E92go77x/MbsB44kqA9BHODIAnAKI8NSCvCfpN9FxJSbDJk6usI
	1UDSJMnFRDvVZkOXYuyoSXxm39iD3duicaZWuezg=
Message-ID: <f7ff827b-fb15-432c-8a5b-d5e73531a526@apertussolutions.com>
Date: Thu, 13 Aug 2026 09:02:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] x86/mm: get_page_from_l1e() is PV-or-shadow-only
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <07e90200-95b5-413f-9259-7f0481d36521@suse.com>
 <4531d02a-3a37-4c57-ba17-32034ba08cf9@apertussolutions.com>
 <b742fec6-730a-4138-b5f5-7197f24df247@suse.com>
 <e5799ee9-6a97-4ad8-b1c4-6b54e43b7a4d@apertussolutions.com>
 <a83cf90c-142a-41ee-a80b-4e849cc804f3@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a83cf90c-142a-41ee-a80b-4e849cc804f3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-c1860d/1786626170-CED4087B-732F5D25/0/0
X-purgate-type: clean
X-purgate-size: 3852



On 8/13/26 8:14 AM, Jan Beulich wrote:
> On 13.08.2026 13:51, Daniel P. Smith wrote:
>> On 8/3/26 6:11 AM, Jan Beulich wrote:
>>> On 02.08.2026 17:55, Daniel P. Smith wrote:
>>>> On 7/28/26 9:18 AM, Jan Beulich wrote:
>>>>> Otherwise the function is unreachable, violating MISRA C:2012 rule 2.1.
>>>>> With the function compiled out, its dedicated XSM hook also becomes
>>>>> unreachable, so it is similarly guarded.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> It feels suspicious that the .priv_mapping() check is used for HVM guests
>>>>> in shadow mode, but not for ones in HAP mode.
>>>>
>>>> I believe a hint to it is laying in the comment,
>>>>
>>>>     /*
>>>>      * Let privileged domains transfer the right to map their target
>>>>      * domain's pages. This is used to allow stub-domain pvfb export to
>>>>      * dom0, until pvfb supports granted mappings. At that time this
>>>>      * minor hack can go away.
>>>>      */
>>>>
>>>> Correct me if I am wrong, but get_page_from_l1e() is only used by PV and
>>>> HVM + Shadow. When in HVM + HAP is mapping a guest page, it is done
>>>> through p2m_get_foreign() which will then be covered by
>>>> xsm_map_gmfn_foreign(). So only HVM + Shadow can hit TARGET_HACK check.
>>>
>>> Yes, sure; that wasn't the point of my comment. The point was that I'd
>>> expect _the same_ hook to be used by the other path. Aiui if you make a
>>> policy, you want same situations dealt with the same. Hence there shouldn't
>>> be a need to express the same thing two ways.
>>
>> But it's not the same, the enforcement mechanism is different. FLASK is
>> an evaluation of Subject/Object/Predicate. In this case the mechanism
>> (software enforced access) that provides the Predicate has enough risk
>> that it warranted itself a separate check to allow fine grained
>> assignment of the operation to a specific domain which was driven by a
>> specific use case.
> 
> I don't understand this. What mode a guest is run in (HAP vs shadow)
> shouldn't affect what permissions it has. Two distinct hooks means the
> guest might change behavior when flipped between hap=0 and hap=1. Which
> absolutely shouldn't happen, imo.
> 

Oh, it most certainly does affect how a security policy wants to be 
written. Certain mechanisms have properties that provide certain 
assurances and the security architect/policy writer may not want to 
allow the access via mechanisms deemed to have an unacceptable risk.

>>>> I think the question is how to address the TARGET_HACK situation.
>>>
>>> I fear I don't really know what exactly you mean here.
>>
>> Is this path still needed for the pvfb or is it now in use by other use
>> cases. If the former, then close the ability otherwise TARGET_HACK
>> should be renamed to something sensible for general case. Some code
>> documentation might be necessary to help understand why/
> 
> Only after grep-ing it has become apparent that TARGET_HACK is something
> in Flask. It's entirely invisible outside of Flask, e.g. at the call site
> of the hook.
> 

Correct.

> I think the comment is stale in referencing only pvfb, but I'm not really
> sure. It is too long ago that I last saw the log message issued there,
> and hence I don't recall under what (buggy guest?) conditions it could
> surface.
> 

Agreed, that's why I was trying to say that it appears to have been 
created based on that specific situation. My question is, did this 
situation evolve to no longer be a one-off or can we close the ability 
to map memory this way. The comment alludes that it was a temporary 
method of access, but I haven't studied the path to this check or what 
situations could follow that path today. I have a suspicion that it's no 
longer a one-off situation.

v/r,
dps

