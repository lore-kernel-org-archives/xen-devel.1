Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00973C5CFCF
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 12:10:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389918.1630506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUFx-0001qr-S7; Thu, 13 Aug 2026 12:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389918.1630506; Thu, 13 Aug 2026 12:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUFx-0001qk-OZ; Thu, 13 Aug 2026 12:09:57 +0000
Received: by outflank-mailman (input) for mailman id 1389918;
 Thu, 13 Aug 2026 12:09:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wuUFw-0001qe-BC
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:09:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuUFv-0034bu-O9
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:09:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7db400-2eae-0a2a0a5409dd-0a2a45079526-38
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:09:55 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7db411-b4ea-0a2a45070019-888fbc3352cb-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:09:55 +0200
Received: by mx.zohomail.com with SMTPS id 1786622985898102.77676751425997;
 Thu, 13 Aug 2026 05:09:45 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1786622989; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NDzEYYXGJr+SH3bZ+rJdIu+rU1G3M5dY9cCNIgYib/zV3diHUpb6XhostGRMM++Rq/pLA0Yoy1WPP8WCF7N2RolsgxP5p5HBQR8VSRtji0YztG3wPtUSMurC68OV2H3PZDvjjCm0oRcSTsH1RycMC39duccW+V/cLZrAQi+mBCs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786622989; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YG/t+HcpcQUGet+1b50CemxLkna65I9PHKw42uyrhHc=; 
	b=krJzygKomXeCOsduImVgQilha6gxoKgUgnx2b1EqUqB7caICh7PhcTBoLEyXUMDx823z70RXWxzI+BTn9oB6R4hEBMcjKxFVmLxRSBILp21YYj8TqRTmxO7XhQPVgeHWoNea68T5SmYcs13cHz5ggIJiviEttB5uzbRdeINKEsw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786622989;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YG/t+HcpcQUGet+1b50CemxLkna65I9PHKw42uyrhHc=;
	b=UV2qW899BJxJM2CuI5lUZDoNuYN+Naqj2O53IC5BCKfYPRloIiS01Sn9PUoOl0TQ
	/Yh+GKNMKRotw2osI8oSQCSv6KzgD3oJJP8SInVK/SLZ1eZW78aJH6tigY0JFhkdBDK
	MQm+erpGNc5YyqFNibM6EgL80a36QD9f1sfowIHg=
Message-ID: <684d46e1-4f10-4034-93c1-d0bbb495e5ab@apertussolutions.com>
Date: Thu, 13 Aug 2026 08:09:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
 <6991badc-dcc4-44b9-a048-29eb67c46d2e@apertussolutions.com>
 <7762513c-0d3a-465a-abd9-73e3ba586556@suse.com>
 <29546ca9-1875-4c20-b42b-39c886f3d41c@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <29546ca9-1875-4c20-b42b-39c886f3d41c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ef75cf/1786622995-A6CDFAE4-C5D0CF00/0/0
X-purgate-type: clean
X-purgate-size: 2890

On 8/6/26 10:09 AM, Jason Andryuk wrote:
> On 2026-08-06 03:16, Jan Beulich wrote:
>> On 06.08.2026 01:02, Daniel P. Smith wrote:
>>> On 7/28/26 9:22 AM, Jan Beulich wrote:
>>>> @@ -2307,7 +2308,7 @@ argo_init(struct domain *d)
>>>>    {
>>>>        struct argo_domain *argo;
>>>> -    if ( !opt_argo || xsm_argo_enable(d) )
>>>> +    if ( !opt_argo || xsm_argo_enable(XSM_HOOK, d) )
>>>
>>> This question came up on another thread, so thought I might point it out
>>> that when FLASK is in use this can return a nubmer of error codes beyond
>>> an access deny. While I know it's the existing behavior, but if the
>>> error code is anything other than -EPERM, then it's not that the policy
>>> denied the access but something cause a fault in the security server. In
>>> that case the domain is still being allowed to construct with the
>>> assumption that it was a policy deny. At a minimum should the error code
>>> at least get reported, and perhaps it should be passed up to domain
>>> construction to allowing it to make an informed decision on 
>>> construction?
>>
>> Sounds plausible, but definitely wants doing in a separate patch.
> 
> I think this is a mis-use of xsm_argo_enable().  As I wrote in [1], this 
> isn't an access decision, but an ~optimization to skip initializing argo 
> data structures when a domain is not allowed to use argo.
> 

I would have to respectfully disagree. The operation is to initialize 
the domain for argo usage and the access check says do not allow 
initialization if the domain does not have the privilege. This basic 
defense in depth, do not initialize for some thing you should not have 
access to, and thus not just relying on the later checks.

> With Flask, this prints an AVC denial during domain construction when 
> the domain doesn't have argo enabled.  That is misleading as it isn't 
> the domain's action causing the access.  In OpenXT, I wrote a patch to 
> add a noaudit variant to hide the denial.  I didn't upstream it because 
> I didn't really like it.
> 

The customer has ran OpenXT through the code evaluation models that they 
have access to and your patch was flagged. Not for being technically 
incorrect, but raised policy questions on whether is was desirable to 
silence the event.

> The issue is really the conditional initialization of d->argo.  It seems 
> like it would be simpler to always initialized argo for all domains. 
> xsm_argo_enable() would still prevent using it, but internal checking of 
> d->argo could be removed.
> 

Defense in depth is about minimizing risk at cost of a degree of 
overhead. The dance will always be about how to balance the two.

> Regards,
> Jason
> 
> [1] https://lore.kernel.org/xen-devel/758c8410- 
> a18e-45dc-8944-5913e5832397@suse.com/T/ 
> #m149e1571b819a0cf481eea558c6220a5a24d5285


